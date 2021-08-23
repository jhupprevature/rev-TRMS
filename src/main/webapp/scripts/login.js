function logout() {
    //Clear the Storage.
    TRMSStorage.clear()
}

function loggedInUser() {

    let user = TRMSStorage.getItem("user");

    if (user == "{}") {
        let divNode = document.getElementById("result-div");
        divNode.innerText = "Please login to continue..."

        setTimeout( function() {
            window.location.href = "index.html";
        }, 1000);
    }
}

function login() {
    //For testing:
    // TRMSStorage.setItem("user", `{
    //     "id": 1,
    //     "firstName" : "Buggs",
    //     "lastName": "Bunny",
    //     "username": "username",
    //     "password": "password",
    //     "dob": "dob",
    //     "hireDate": "hireDate",
    //     "department": {"deptName": "deptName"},
    //     "supervisor": {
    //         "firstName": "Daffy",
    //         "lastName": "Duck"
    //     },
    //     "benefitCoord": {
    //         "firstName": "Elmer",
    //         "lastName": "Fudd"
    //     }
    // }`);

    // setTimeout(function() {
    //     window.location.href = "profile.html";
    // }, 1000);

    let xhttp = new XMLHttpRequest();

    let username = document.getElementById('usernameInput').value;
    let password = document.getElementById('passwordInput').value;


    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 & this.status == 200) {
            
            console.log("response= "+this.responseText);
            let user = this.responseText;
            TRMSStorage.setItem("user", user);
            if (user != "{}") {
                setTimeout( function() {
                    window.location.href = "employees.html";
                }, 1000);
            }
            
            
        }
    }

    let url = `http://localhost:7000/`;

    xhttp.open("POST", url, true);

    xhttp.setRequestHeader('Content-Type', 'application/json');

    let submission = {
        username: username,
        password: password
    }

    xhttp.send(JSON.stringify(submission));

}