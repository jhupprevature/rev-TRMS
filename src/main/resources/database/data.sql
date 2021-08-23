alter table if exists departments drop constraint if exists FK_DEPT_EMP;

insert into departments (id, dept_name, dept_head, description) values 
(default, 'Human Resources', 1, 'Human Resources description'),
(default, 'Legal', 2, 'Legal description'),
(default, 'Marketing', 3, 'Marketing description'),
(default, 'Accounting', 4, 'Accounting description'),
(default, 'Engineering', 5, 'Engineering description');
 	
insert into employees (id, first_name, last_name, username, password, dob, hire_date, department, supervisor, ben_co) values 
(default, 'Dunstan', 'Fielders', 'dfielders', '5VpNsenb', '1971-12-27', '2019-03-25', 1, 1, 1),
(default, 'Ulrika', 'Melsom', 'umelsom', 'CGWTdDcEfkz', '2000-09-12', '2019-03-26', 2, 2, 1),
(default, 'Linc', 'Tregunna', 'ltregunna', 'tsMBTR', '1977-03-03', '2019-04-06', 3, 3, 1),
(default, 'Bernadene', 'Gianuzzi', 'bgianuzzi', 'XYhiz4d', '1989-05-04', '2019-04-11', 4, 4, 1),
(default, 'Jay', 'Dighton', 'jdighton', 'NmJggfgeJoHi', '1983-05-08', '2019-04-12', 5, 5, 1),
(default, 'Jemimah', 'Stobart', 'jstobart', 'qUJPrhr', '1986-07-19', '2019-05-27', 3, 3, 14),
(default, 'Abdul', 'Poznan', 'apoznan', 'fzW6NkO5oLlo', '1988-01-01', '2019-06-06', 4, 4, 20),
(default, 'Carin', 'Grieves', 'cgrieves', 'ioCPEnVRH', '1983-08-03', '2019-07-25', 5, 5, 22),
(default, 'Wenona', 'Colquete', 'wcolquete', '1v4ooFiA', '1973-07-03', '2019-12-14', 3, 3, 14),
(default, 'Ferris', 'Wyllie', 'fwyllie', 'fAiE7tnRbry0', '1986-10-19', '2019-12-15', 3, 3, 14),
(default, 'Mitchael', 'Bilham', 'mbilham', 'WcmqDv34W', '1994-08-01', '2019-12-30', 2, 2, 20),
(default, 'Robby', 'Seint', 'rseint', 't1RHYTjlu', '1980-01-16', '2020-01-05', 5, 5, 22),
(default, 'Cullin', 'Ormston', 'cormston', 'eZtmqE', '1971-06-21', '2020-04-08', 4, 7, 20),
(default, 'Wyllie', 'Roakes', 'wroakes', 'awjYJr', '1977-12-08', '2020-04-25', 1, 1, 1),
(default, 'Alanson', 'Woloschin', 'awoloschin', 'tBOLq2c9', '1990-08-27', '2020-05-01', 4, 7, 20),
(default, 'Felipe', 'McGahy', 'fmcgahy', 'qIlz7ZHQTg', '1984-02-05', '2020-06-23', 3, 6, 14),
(default, 'Raeann', 'Swidenbank', 'rswidenbank', 'NkBONquRizKf', '1985-11-23', '2020-08-01', 3, 6, 14),
(default, 'Nana', 'Dyerson', 'ndyerson', 'nTeBBmJ328X', '1990-07-02', '2020-10-30', 2, 2, 20),
(default, 'Ferris', 'Yurasov', 'fyurasov', '90h7bU', '1985-04-13', '2020-12-29', 5, 8, 22),
(default, 'Kelci', 'Flexman', 'kflexman', 'V4fhrZDn', '1976-12-24', '2021-03-23', 1, 14, 1),
(default, 'Frances', 'Shackelton', 'fshackelton', 'wKcxmAN', '1998-11-21', '2021-04-09', 5, 8, 22),
(default, 'Astra', 'Ormston', 'aormston', 'OvaGLwQHeNQs', '1990-12-06', '2021-04-15', 1, 14, 1),
(default, 'Abrahan', 'Middas', 'amiddas', 'nM8pUn7fev', '1970-10-29', '2021-05-24', 3, 9, 14),
(default, 'Delly', 'Iannetti', 'diannetti', 'kuedD6', '1993-10-15', '2021-06-28', 3, 10, 14);
-- TO Add test
--(default, 'Jillayne', 'Stanworth', 'jstanworth', 'dy4OOjKaq', '1974-09-30', '2021-06-30', 5, 12, 22);

insert into event_types (id, type_name, coverage_percent) values 
(default, 'University Course', 0.80), 
(default, 'Seminar', 0.60),
(default, 'Certification Prep Class', 0.75),
(default, 'Certification', 1.00),
(default, 'Technical Training', 0.90),
(default, 'Other', 0.30);

insert into grading_formats (id, format_name, default_grade, description) values 
(default, 'Letter', 'C', 'Letter Format Desc'),
(default, 'Pass Fail', 'P', 'Pass/Fail Format Desc'),
(default, 'Percentage', '75%', 'Percentage Format Desc');

insert into events (id, event_date, event_time, event_location, description, cost, event_type, grading_format, passing_grade) values 
(default, '8/6/2020', '3:43 PM', 'Charlotte', null, 445.36, 4, 2, null),
(default, '11/7/2020', '7:30 PM', 'Wilmington', null, 173.18, 6, 1, 'A'),
(default, '7/24/2020', '5:30 PM', 'Charlotte', null, 35.71, 2, 1, null),
(default, '8/3/2020', '1:27 PM', 'Raleigh', null, 488.26, 2, 3, '85%'),
(default, '5/16/2021', '11:20 AM', 'Atlanta', null, 229.73, 2, 1, 'B'),
(default, '7/4/2020', '7:39 PM', 'Charlotte', null, 167.66, 6, 2, null),
(default, '8/20/2021', '9:20 AM', 'Raleigh', null, 204.68, 4, 1, 'A'),
(default, '1/19/2021', '10:24 AM', 'Durham', null, 305.31, 6, 3, '90%'),
(default, '7/15/2021', '10:16 AM', 'Raleigh', null, 449.84, 2, 2, null);
--to add test
--(default, '6/8/2021', '5:50 PM', 'Charlotte', null, 392.18, 5, 3, null);

insert into reimbursement_requests (id, requestor, event, justification, time_requirement, last_updated, pending_response_from, proposed_amount, decision, decision_comments, decider, disbursed) values 
(default, 1, 6, 'Justification desc', 19.49, '2021-02-19', 'final', null, 'approved', 'decision comments', 1, true), 
(default, 22, 5, 'Justification desc', 49.53, '2021-07-10', 'sup', null, 'denied', 'decision comments', 14, false), 
(default, 6, 5, 'Justification desc', 20.23, '2021-06-28', 'benco', null, 'pending', 'decision comments', null, false), 
(default, 16, 9, 'Justification desc', 23.22, '2020-08-02', 'head', null, 'pending', 'decision comments', null, false), 
(default, 4, 9, 'Justification desc', 48.28, '2020-07-23', 'emp', null, 'denied', 'decision comments', 4, false), 
(default, 22, 5, 'Justification desc', 16.8, '2020-11-30', 'head', null, 'approved', 'decision comments', 1, true), 
(default, 15, 4, 'Justification desc', 5.77, '2021-01-21', 'benco', null, 'denied', 'decision comments', 20, false), 
(default, 10, 7, 'Justification desc', 13.72, '2020-12-20', 'head', null, 'approved', 'decision comments', 3, true), 
(default, 23, 9, 'Justification desc', 3.92, '2020-07-21', 'head', null, 'pending', 'decision comments', null, false), 
(default, 2, 6, 'Justification desc', 47.81, '2020-10-05', 'benco', null, 'denied', 'decision comments', 20, false), 
(default, 10, 5, 'Justification desc', 21.1, '2020-08-28', 'emp', null, 'approved', 'decision comments', 14, true), 
(default, 19, 9, 'Justification desc', 48.06, '2021-01-22', 'final', null, 'pending', 'decision comments', null, false), 
(default, 21, 7, 'Justification desc', 15.26, '2021-01-30', 'benco', null, 'pending', 'decision comments', null, false), 
(default, 3, 8, 'Justification desc', 39.74, '2020-10-15', 'head', null, 'denied', 'decision comments', 1, false), 
(default, 10, 7, 'Justification desc', 41.86, '2020-12-20', 'head', null, 'approved', 'decision comments', 14, true), 
(default, 20, 4, 'Justification desc', 37.92, '2020-12-06', 'final', null, 'approved', 'decision comments', 1, true), 
(default, 23, 9, 'Justification desc', 2.5, '2021-03-19', 'sup', null, 'pending', 'decision comments', null, false), 
(default, 6, 6, 'Justification desc', 48.48, '2021-06-05', 'benco', null, 'denied', 'decision comments', 14, false), 
(default, 2, 6, 'Justification desc', 37.23, '2020-11-11', 'emp', null, 'approved', 'decision comments', 2, true), 
(default, 16, 5, 'Justification desc', 26.74, '2021-03-11', 'final', null, 'pending', 'decision comments', null, false), 
(default, 11, 4, 'Justification desc', 19.18, '2021-03-09', 'benco', null, 'pending', 'decision comments', null, false), 
(default, 24, 1, 'Justification desc', 39.12, '2020-10-15', 'emp', null, 'approved', 'decision comments', 14, true), 
(default, 24, 8, 'Justification desc', 49.85, '2021-07-12', 'emp', null, 'pending', 'decision comments', null, false), 
(default, 11, 1, 'Justification desc', 29.08, '2020-11-10', 'sup', null, 'approved', 'decision comments', 20, true);
--to add test
--(default, 24, 2, 'Justification desc', 13.79, '2021-03-29', 'head', null, 'denied', 'decision comments', 3, false);

insert into request_attachments (id, doc_url, request, type) values
(default, 'http://dummyimage.com/180x100.png/dddddd/000000', 8, 'approval'), 
(default, 'http://dummyimage.com/192x100.png/cc0000/ffffff', 18, 'other'), 
(default, 'http://dummyimage.com/209x100.png/ff4444/ffffff', 22, 'approval'), 
(default, 'http://dummyimage.com/154x100.png/ff4444/ffffff', 13, 'approval'), 
(default, 'http://dummyimage.com/212x100.png/cc0000/ffffff', 8, 'grade'), 
(default, 'http://dummyimage.com/125x100.png/dddddd/000000', 22, 'approval'), 
(default, 'http://dummyimage.com/249x100.png/cc0000/ffffff', 13, 'grade'), 
(default, 'http://dummyimage.com/220x100.png/5fa2dd/ffffff', 12, 'approval'), 
(default, 'http://dummyimage.com/176x100.png/cc0000/ffffff', 3, 'grade'), 
(default, 'http://dummyimage.com/135x100.png/ff4444/ffffff', 9, 'approval'), 
(default, 'http://dummyimage.com/212x100.png/dddddd/000000', 5, 'other'), 
(default, 'http://dummyimage.com/153x100.png/cc0000/ffffff', 20, 'approval'), 
(default, 'http://dummyimage.com/246x100.png/cc0000/ffffff', 23, 'grade'), 
(default, 'http://dummyimage.com/133x100.png/ff4444/ffffff', 14, 'approval'), 
(default, 'http://dummyimage.com/193x100.png/cc0000/ffffff', 6, 'approval'), 
(default, 'http://dummyimage.com/163x100.png/ff4444/ffffff', 18, 'grade'), 
(default, 'http://dummyimage.com/120x100.png/5fa2dd/ffffff', 21, 'other'), 
(default, 'http://dummyimage.com/184x100.png/dddddd/000000', 14, 'grade'), 
(default, 'http://dummyimage.com/240x100.png/5fa2dd/ffffff', 1, 'other'), 
(default, 'http://dummyimage.com/160x100.png/ff4444/ffffff', 24, 'grade'), 
(default, 'http://dummyimage.com/120x100.png/5fa2dd/ffffff', 9, 'grade'), 
(default, 'http://dummyimage.com/162x100.png/ff4444/ffffff', 3, 'other'), 
(default, 'http://dummyimage.com/186x100.png/ff4444/ffffff', 20, 'approval'), 
(default, 'http://dummyimage.com/210x100.png/dddddd/000000', 6, 'other'), 
(default, 'http://dummyimage.com/114x100.png/ff4444/ffffff', 4, 'grade'), 
(default, 'http://dummyimage.com/240x100.png/5fa2dd/ffffff', 19, 'other'), 
(default, 'http://dummyimage.com/133x100.png/dddddd/000000', 13, 'other'), 
(default, 'http://dummyimage.com/117x100.png/5fa2dd/ffffff', 19, 'other'), 
(default, 'http://dummyimage.com/116x100.png/cc0000/ffffff', 15, 'approval');
--to add test
--(default, 'http://dummyimage.com/146x100.png/5fa2dd/ffffff', 23, 'approval');

insert into communications (id, sender, recipient, message_date, message, request) values 
(default, 23, 14, '2021-02-15', 'message content', 9),
(default, 22, 12, '2021-06-17', 'message content', 16),
(default, 02, 01, '2021-04-29', 'message content', 10),
(default, 03, 14, '2020-12-04', 'message content', 4),
(default, 19, 08, '2021-05-30', 'message content', 12),
(default, 14, 02, '2021-05-18', 'message content', 21),
(default, 03, 14, '2021-03-23', 'message content', 11),
(default, 02, 11, '2020-09-28', 'message content', 21),
(default, 04, 01, '2021-02-24', 'message content', 5),
(default, 24, 14, '2020-09-25', 'message content', 22),
(default, 10, 03, '2021-06-11', 'message content', 15),
(default, 20, 07, '2020-07-20', 'message content', 7),
(default, 01, 01, '2020-11-04', 'message content', 1),
(default, 03, 14, '2020-09-29', 'message content', 22),
(default, 06, 03, '2021-05-23', 'message content', 20),
(default, 05, 20, '2020-10-26', 'message content', 13),
(default, 02, 20, '2021-06-16', 'message content', 24),
(default, 07, 04, '2021-06-01', 'message content', 7),
(default, 01, 02, '2020-07-25', 'message content', 19),
(default, 03, 09, '2021-04-16', 'message content', 17),
(default, 12, 22, '2021-01-25', 'message content', 16),
(default, 03, 14, '2020-06-12', 'message content', 8),
(default, 10, 03, '2021-01-26', 'message content', 15),
(default, 16, 06, '2021-06-15', 'message content', 20),
(default, 03, 10, '2021-01-04', 'message content', 8),
(default, 03, 06, '2021-05-08', 'message content', 18),
(default, 03, 14, '2020-12-11', 'message content', 8),
(default, 03, 23, '2020-12-02', 'message content', 17),
(default, 03, 16, '2021-06-13', 'message content', 5);
--to add test
--(default, 08, 05, '2020-12-29', 'message content', 12);

alter table departments add constraint FK_DEPT_EMP
	foreign key(dept_head) references employees(id) on delete set null;


