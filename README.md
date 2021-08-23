# TRMS
Project 1 for 210607 Reston

## Project Description

TRMS, or Tuition Reimbursement Management System is a full-stack web application that allows employees to submit requests for reimbursements for courses, events, and certifications. These requests can then be approved or rejected by the employee's direct supervisor, department head, and a benefits coordinator while the employee is able to track the status of their requests.

## Technologies Used

Development technologies:
* Java - version 8
* Maven - version 4.0.0
* Javalin - version 3.13.6
* Gson - version 2.8.6
* PostgreSQL - version 42.2.20
* Hibernate - version 5.5.3
* HTML/CSS
* Javascript
* AJAX

Testing technologies:
* SLF4J - version 1.7.30
* Log4J -  version 1.2.17
* JUnit - version 4.13.2
* Postman
* Selenium - version 3.8.1
* Cucumber - version 1.2.4


## Features

List of features ready and TODOs for future development
* Login functionality
* Employees can view and edit their data
* Employees can view existing reimbursement requests
* Supervisors, Department Heads, and Benefit Coordinators can view subordinate requests.

To-do list:
* Employees can submit new reimbursement requests
* Approval parties can review/approve subordiante requests.
* Participating parties can view and attach documents/links to existing requests.
* Participating parties can view and add comments to existing requests.
* Establish the Selenium driver to open the index.html file on app start.
* Implement front-end testing.
* Tidy up code.

## Getting Started

> This project was developed in Spring Tool Suite 4 and Visual Studio Code.
> This project was tested with Google Chrome version 92.
> No other environments have been tested or confirmed.

- Clone this repository: `git clone https://github.com/jhupprevature/rev-TRMS.git`.
- Open the Maven project in your IDE.
- Open the Hibernate configuration located at `rev-TRMS/src/main/resources/hibernate.cfg.xml`.
- Edt the Hibernate connection *url*, *username*, and *password* to match the information for your RDS.
- In your database tool, run `schema.sql` and `data.sql` files located in `rev-TRMS/src/main/resources/database/`
- Compile and run the project to establish Javalin server.
- Open `./rev-TRMS/src/main/webapp/pages/index.html` in your browser.

## Usage

To demo this applicaiton, you can use the following login information:
| Role  | Username  | Password  |
| :---   | :---:   | :---:   |
| Employee  | diannetti | diannetti |
| Supervisor | fwylie   | fwylie |
| Department Head | ltregunna | ltregunna |
| Benefit Coordinator | wroakes | wroakes |

## Contributors
This is a solo project.