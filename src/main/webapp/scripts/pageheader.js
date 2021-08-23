var TRMSStorage = window.localStorage;

function loadPageHeader() {
    let headDiv = document.getElementById('page-header');

    let navbar = document.createElement('nav');
    navbar.classList.add('navbar');
    navbar.classList.add('navbar-expand-sm');
    navbar.classList.add('navbar-light');
    navbar.classList.add('bg-light');

    let container = document.createElement('div');
    container.classList.add('container-fluid');
    container.classList.add('d-flex');
    container.classList.add('justify-content-start');

    let titleNode = document.createElement('div');
    titleNode.classList.add('navbar-brand');
    titleNode.appendChild(document.createTextNode('TRMS'));
    container.appendChild(titleNode);

    let navList = document.createElement('div');
    navList.classList.add('navbar-nav');

    let empTab = createNavTab("profile.html", "Employee Info");
    navList.appendChild(empTab);

    let requestTab = createNavTab("requests.html", "Requests");
    navList.appendChild(requestTab);

    let commTab = createNavTab("communications.html", "Communication");
    navList.appendChild(commTab);

    let logOutTab = createNavTab("index.html", "Log Out");
    navList.appendChild(logOutTab);

    container.appendChild(navList);
    navbar.appendChild(container);
    headDiv.appendChild(navbar);

    let pageTitle = document.getElementById('page-title');
    let activeTab;

    switch(pageTitle.innerText) {
        case 'Login':
            activeTab = logOutTab;
            break;
        case 'Employee':
            activeTab = empTab;
            break;
        case 'Requests':
            activeTab = requestTab;
            break;
        case 'Communication':
            activeTab = commTab;
            break;
    }
    activeTab.classList.add('active');
}

function createNavTab(href, tabName) {
    let newTab = document.createElement('a');
    newTab.classList.add('nav-link');
    newTab.href = href;
    newTab.appendChild(document.createTextNode(tabName));

    return newTab;
}
