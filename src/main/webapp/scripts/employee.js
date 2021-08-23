var TRMSStorage = window.localStorage;

function populateEmp() {
    console.log("Populating user...")
    // console.log("user: "+TRMSStorage.getItem("user"));
    let emp = JSON.parse(TRMSStorage.getItem("user"));

    document.getElementById("userID").value = emp.id;
    document.getElementById("firstName").value = emp.firstName;
    document.getElementById("lastName").value = emp.lastName;
    document.getElementById("birthDate").value = emp.dob;
    document.getElementById("hireDate").value = emp.hireDate;
    document.getElementById("username").value = emp.username;
    document.getElementById("password").value = emp.password;
    document.getElementById("department").value = emp.department.deptName;
    document.getElementById("supervisor").value = emp.supervisor.firstName + " " + emp.supervisor.lastName;
    document.getElementById("benefitCoord").value = emp.benefitCoord.firstName + " " + emp.benefitCoord.lastName;

}

function editEmp() {
    console.log("Editing enabled.");
    document.getElementById("password").removeAttribute("readonly");
}

function saveEdit() {
    console.log("Save in progress...")
    let xhttp = new XMLHttpRequest();

    let submission = {
        "id": document.getElementById("userID").value,
        "password": document.getElementById("password").value
    }

    xhttp.onreadystatechange = function() {

        if (this.readyState == 4 & this.status == 200) {
            console.log("Save successful!");
            document.getElementById("password").setAttribute("readonly", true);

        }
    }

    let url = `http://localhost:7000/employees/${submission.id}`;

    xhttp.open("PUT", url, true);

    xhttp.send(JSON.stringify(submission));

}

// function getRequests(id) {
//     console.log("Getting requests of emp "+id);
    
//     let xhttp = new XMLHttpRequest();

//     xhttp.onreadystatechange = function() {
//         if (this.readyState == 4 & this.status == 200) {
//             console.log("Requests retrieved: "+this.responseText);
//             TRMSStorage.setItem("requests", this.responseText);

//             setTimeout( function() {
//                     window.location.href = "requests.html";
//             }, 1000);
//         }
//     }

//     let url = `http://localhost:7000/employees/${id}/requests`;

//     xhttp.open("GET", url, true);

//     xhttp.send();
// }