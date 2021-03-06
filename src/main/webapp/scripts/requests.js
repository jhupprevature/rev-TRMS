var TRMSStorage = window.localStorage;

function populateRequests(requests) {
    console.log("Populating requests...");
    console.log(requests);

    let table = document.getElementById("request-detail-table");

    while (table.firstChild) {
        table.removeChild(table.firstChild);
    }

    for(let i = 0; i < requests.length; i++) {
        console.log(requests[i]);

        let row = populateReqRow(requests[i]);
        table.appendChild(row);

    }
}

function populateReqRow(request) {
    let reqRow = document.createElement("tr");

    let reqEvntType = populateData(request.event.eventType.typeName);
    reqRow.appendChild(reqEvntType);

    let reqEvntName = populateData(request.event.eventName);
    reqRow.appendChild(reqEvntName);

    let reqEvntDate = populateData(request.event.eventDate);
    reqRow.appendChild(reqEvntDate);

    let reqEvntCost = populateData(request.event.cost);
    reqRow.appendChild(reqEvntCost);

    let reqEvntLocation = populateData(request.event.eventLocation);
    reqRow.appendChild(reqEvntLocation);

    let reqAmount = calcReqAmount(request.proposedAmount, request.event)
    let reqReimbursement = populateData(reqAmount);
    reqRow.appendChild(reqReimbursement);

    let reqStatus = populateData(request.decision);
    reqRow.appendChild(reqStatus);

    let reqResponse = populateData(request.pendingResponseFrom);
    reqRow.appendChild(reqResponse);

    let reqLastUpdate = populateData(request.lastUpdated);
    reqRow.appendChild(reqLastUpdate);

    let reqButtons = populateReqRowButtons();
    reqRow.appendChild(reqButtons);

    return reqRow;
}

function populateData(data) {
    let dataCell = document.createElement("td");
    dataCell.innerHTML = data;
    return dataCell;
}

function calcReqAmount(reqAmount, event) {
    let amount = 0;
    if(!reqAmount) {
        amount = event.eventType.coveragePercent * event.cost;
    } else {
        amount = reqAmount;
    }
    return amount;
}

function populateReqRowButtons() {
    let reqButtons = document.createElement("td");

    let messageBtn = populateButton("Message", 
        console.log('Not yet implemented...')) //`getRequests(${subordinates[sub].id})`);
    reqButtons.appendChild(messageBtn);

    let attachBtn = populateButton("Attach", 
        console.log('Not yet implemented...')); //`getRequests(${subordinates[sub].id})`);
    reqButtons.appendChild(attachBtn);

    //Previous notes mention problems?
    let editReqBtn = populateButton("Edit", 
        function() {
            editRequest(request.requestor);
            TRMSStorage.setItem("req",request);
        });
    reqButtons.appendChild(editReqBtn);

    return reqButtons;
}

function populateButton(btnName, clickAction) {
    let button = document.createElement("button");
    button.classList.add("btn");
    button.classList.add("btn-light");
    button.classList.add("bordered");
    button.setAttribute("onclick", clickAction);
    //button.setAttribute("click", clickAction);
    button.onclick = clickAction;
    button.appendChild(document.createTextNode(btnName));
    return button;
}

function getSubordinateRequests() {
    getSubordinates("supervisor");
    getSubordinates("department");
    getSubordinates("beneficiaries");
}

function getEmpRequests(empID,empName) {
    console.log("Getting emp requests...");

    if (empID == 0) {
        let emp = JSON.parse(TRMSStorage.getItem("user"));
        empID = emp.id;
        empName = emp.firstName + " " + emp.lastName;

        let table = document.getElementById("request-summary-table");
        table.appendChild(populateSummaryRow(emp,"self"));
    }
    
    let xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function() {

        if (this.readyState == 4 & this.status == 200) {
            // console.log("Requests retrieved: "+this.responseText);
            TRMSStorage.setItem("requests", this.responseText);
            
            let header = document.getElementById("empName");
            header.innerText = empName;
            populateRequests(JSON.parse(this.responseText),empName);

        }
    }

    let url = `http://localhost:7000/employees/${empID}/requests`;

    xhttp.open("GET", url, true);
    xhttp.send();
}

function getSubordinates(type) {
    console.log("Getting subordinates of type: " + type);
    let emp = JSON.parse(TRMSStorage.getItem("user"));
    
    let xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function() {

        if (this.readyState == 4 & this.status == 200) {
            //console.log("Subordinates retrieved: "+this.responseText);
            TRMSStorage.setItem(type, this.responseText);
            let subordinates = JSON.parse(this.responseText);
            let table = document.getElementById("request-summary-table");

            TRMSStorage.setItem("subordinates",`${type}: ${this.responseText}`);
            // insertGroupHeader(type);

            for(let sub in subordinates) {
                console.log(subordinates[sub]);
                
                let row = populateSummaryRow(subordinates[sub],type);
                table.appendChild(row);

            } 
        }
    }

    let url = `http://localhost:7000/employees/${emp.id}/${type}`;

    xhttp.open("GET", url, true);
    xhttp.send();

}

function populateSummaryRow(subordinate, type) {
    let subRow = document.createElement("tr");

    let subName = document.createElement("td");
    subName.innerHTML = subordinate.firstName + " " + subordinate.lastName;
    subRow.appendChild(subName);

    let subRelationship = document.createElement("td");
    subRelationship.innerHTML = type.charAt(0).toUpperCase() + type.slice(1);
    subRow.appendChild(subRelationship);

    let subRequests = document.createElement("td");
    let requestBtn = document.createElement("button");
    requestBtn.classList.add("btn"); 
    requestBtn.classList.add("btn-light");
    requestBtn.classList.add("bordered");
    let subordinateName = subordinate.firstName+" "+subordinate.lastName;
    // console.log(`getEmpRequests(${subordinate.id}, '${subordinateName}')`);
    requestBtn.setAttribute("onclick", `getEmpRequests(${subordinate.id}, '${subordinateName}')`);
    requestBtn.appendChild(document.createTextNode("Show"));
    subRequests.appendChild(requestBtn);
    subRow.appendChild(subRequests);

    return subRow;
}

function editRequest(requestor) {
    let user = JSON.parse(TRMSStorage.getItem("user"));
    let editDiv = document.getElementById("edit-request");
    editDiv.style.setProperty("display", "block");
    let roleSpan = document.getElementById("editRole");
    // requestor = JSON.parse(requestor);
    // console.log(requestor);
    // console.log("userID="+user.id);
    if (user.id == requestor.id) {
        console.log("The requestor is editing...");
        roleSpan.innerText = "self";
        document.getElementById("reqStatus").removeAttribute("readonly");
        TRMSStorage.setItem("editRole","self");

    } else if (user.id == requestor.supervisor.id) {
        console.log("The supervisor is editing...");
        roleSpan.innerText = "supervisor";
        document.getElementById("reqStatus").removeAttribute("readonly");
        document.getElementById("reqMessage").removeAttribute("readonly");
        TRMSStorage.setItem("editRole","supervisor");

    } else if (user.id == requestor.benefitCoord.id) {
        console.log("The benCo is editing...");
        roleSpan.innerText = "benefit coordinator";
        document.getElementById("reqStatus").removeAttribute("readonly");
        document.getElementById("reqMessage").removeAttribute("readonly");
        document.getElementById("reqAmount").removeAttribute("readonly");
        TRMSStorage.setItem("editRole","benefitCoord");

    } else if (user.id == requestor.dept.id) {
        console.log("The dept head is editing...");
        roleSpan.innerText = "department head";
        document.getElementById("reqStatus").removeAttribute("readonly");
        document.getElementById("reqStatus").removeAttribute("readonly");
        TRMSStorage.setItem("editRole","deptHead");
    } else {
        console.log("You don't have permission to edit.");
        editDiv.style.setProperty("display","none");
    }
}

function saveEdit() {
    console.log("Saving ...");
    let emp = JSON.parse(TRMSStorage.getItem("user"));
    let req = JSON.parse(TRMSStorage.getItem("req"));
    
    let editDiv = document.getElementById("edit-request");
    let role = TRMSStorage.getItem("editRole");
    let statusMsg = document.getElementById("req-status-msg");
    statusMsg.innerHTML = "Save unsuccessful.";
    
    let xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function() {

        if (this.readyState == 4 & this.status == 200) {
            //console.log("Subordinates retrieved: "+this.responseText);
            editDiv.style.setProperty("display", "none");
            document.getElementById("reqStatus").setAttribute(readonly);
            document.getElementById("reqMessage").setAttribute(readonly);
            document.getElementById("reqAmount").setAttribute(readonly);

            statusMsg.innerText = "Save Successful";
        }

        if (this.status) {
            $("#saveModal").modal();
        }
    }

    let url = `http://localhost:7000/employees/${emp.id}/requests/${req.id}`;

    req.decision = document.getElementById("reqStatus").value;
    req.proposedAmount = document.getElementById("reqAmount").value;
    if (role == "self") {
        req.justification += document.getElementById("reqMsg").value;
    } else {
        req.decisionComments += document.getElementById("reqMsg").value;
    }

    xhttp.open("PUT", url, true);
    xhttp.send(JSON.stringify(req));

}

function newRequest() {
    console.log("Creating new request...");
    let user = JSON.parse(TRMSStorage.getItem("user"));
    let editDiv = document.getElementById("edit-request");
    editDiv.style.setProperty("display", "block");
    let roleSpan = document.getElementById("editRole");
    roleSpan.innerText = "creator";
    TRMSStorage.setItem("editRole","self");

    document.getElementById("reqName").value = user.firstName + " " + user.lastName;
    document.getElementById("reqStatus").value = "pending";
    let reqMsg = document.getElementById("reqMessage");
    reqMsg.removeAttribute("readonly");
    let eventID = document.getElementById("eventID");
    eventID.removeAttribute("readonly");
    eventID.removeAttribute("disabled");
    eventID.oninput = function() {var event = getEvent(eventID.value);};
    let amount = event.eventType.coveragePercent * event.cost;
    document.getElementById("reqAmount").value = defaultAmount;

    let request = {
        "requestor": user,
        "event": event,
        "justification": reqMsg,
        "timeRequirement": 16
    };
    TRMSStorage.setItem("req", request);
}

function getEvent(eventID) {
    console.log("Getting event with ID "+ eventID+"...");
    
    let xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function() {

        if (this.readyState == 4 & this.status == 200) {
            console.log("Event retrieved: "+this.responseText);
            
            var reqEvent = JSON.parse(this.responseText);
            
        }
    }

    let url = `http://localhost:7000/events/${eventID}`;

    xhttp.open("GET", url, true);
    xhttp.send();
    return reqEvent;
}