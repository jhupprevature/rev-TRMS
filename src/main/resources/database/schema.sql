--dropping existing tables
alter table if exists departments drop constraint if exists FK_DEPT_EMP;
drop table if exists request_attachments;
drop table if exists communications;
drop table if exists reimbursement_requests;
drop table if exists events;
drop table if exists grading_formats;
drop table if exists event_types;
drop table if exists employees;
drop table if exists departments;

--create all tables
create table departments (
	id serial primary key,
	dept_name varchar(25) not null,
	dept_head integer,
	description varchar(200)
);

create table employees (
-- other fields? is_active/hire_date/termination_date
	id serial primary key,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	username varchar(25) not null,
	password varchar(25) not null,
	dob date not null,
	hire_date date not null,
	department integer references departments(id) on delete set null,
	supervisor integer references employees(id) on delete set null, --figure out how to FK
	ben_co integer references employees(id) on delete set null
);

alter table departments add constraint FK_DEPT_EMP
	foreign key(dept_head) references employees(id) on delete set null;
	
create table event_types (
	id serial primary key,
	type_name varchar(25) not null,
	coverage_percent numeric(3,2) not null
);

create table grading_formats (
	id serial primary key,
	format_name varchar(25) not null,
	default_grade varchar(5) not null,
	description varchar(100)
);

create table events (
	id serial primary key,
	event_date date not null,
	event_time time not null,
	event_location varchar(50) not null,
	description varchar(200),
	cost numeric(12,2) not null,
	event_type integer references event_types(id) on delete set null,
	grading_format integer references grading_formats(id) on delete set null,
	passing_grade varchar(5)
);

create table reimbursement_requests (
	id serial primary key,
	requestor integer references employees(id) on delete set null,
	event integer references events(id) on delete set null,
	justification varchar(50), 
	time_requirement numeric(12,2) not null,
	last_updated date not null,
	pending_response_from varchar(25) default 'sup'
		check (pending_response_from in ('emp', 'sup', 'head', 'benco', 'final')),
	proposed_amount numeric(12,2),
	decision varchar(50) default 'pending'
		check (decision in ('pending', 'approved', 'denied')),
	decider integer references employees(id) on delete set null,
	decision_comments varchar(100),
	disbursed boolean --force notnull if descision == approved
	
);

create table request_attachments (
	id serial primary key,
	request integer references reimbursement_requests(id) on delete set null,
	doc_url varchar(100) not null,
	type varchar(25) default 'other'
		check (type in ('approval', 'grade', 'other'))
);

create table communications (
	id serial primary key,
	sender integer references employees(id) on delete set null,
	recipient integer references employees(id) on delete set null,
	request integer references reimbursement_requests(id) on delete set null,
	message_date date not null,
	message varchar(200) not null
);

