Use HDMS2;

INSERT INTO Account (username, passwo, usertype)
VALUES
	('lhanh123@gmail.com', 'lhanh123', 'Doctor'),
	('hqbao123@gmail.com', 'hqbao123', 'Doctor'),
	('tqduc123@gmail.com', 'tqduc123', 'Doctor'),
	('nhgiang123@gmail.com', 'nhgiang123', 'Nurse'),
	('hthuyen123@gmail.com', 'hthuyen123', 'Nurse'),
	('htngan123@gmail.com', 'htngan', 'Nurse'),
	('tmlong123@gmail.com', 'tmlong123', 'Patient'),
	('lnminh123@gmail.com', 'lnminh123', 'Patient'),
	('pbngoc123@gmail.com', 'pbngoc123', 'Patient');

INSERT INTO Patient (p_name, p_phone, p_email, p_province, p_dob, p_biogender)
VALUES
	('Tran Minh Long', '0123456722', 'tmlong123@gmail.com', 'Ho Chi Minh City', '1999-02-03', 'M'),
	('Luong Nhat Minh', '0123456712', 'lnminh123@gmail.com', 'Vinh Long', '2002-03-07', 'M'),
	('Pham Bao Ngoc', '0123456784', 'pbngoc123@gmail.com', 'Ben Tre', '1997-04-08', 'F');

INSERT INTO PatientAccount(p_id, userid)
VALUES
	(1,7),
	(2,8),
	(3,9);

INSERT INTO Doctor (doc_name, doc_phone, doc_email)
VALUES
	('Le Hien Anh', '0123456789', 'lhanh123@gmail.com'),
	('Hoang Quoc Bao', '0123456788', 'hqbao123@gmail.com'),
	('Tran Quoc Duc', '0123456777', 'tqduc123@gmail.com');

INSERT INTO DoctorAccount(doc_id, userid)
VALUES
	(1,1),
	(2,2),
	(3,3);


INSERT INTO Appointment (a_id, a_date, starttime, endtime, status)
VALUES
	(1, '2023-12-01','10:00','11:00', 'Done');

INSERT INTO PatientBookAppointment (p_id, a_id, symptoms)
VALUES (1,1,'fever');

INSERT INTO MedicalRecord (mr_date, symptom, disease, treatment)
VALUES ('2023-11-02','fever','dengue', 'medication'),
		('2023-12-01','caugh','pneumonia', 'medication');

INSERT INTO PatientViewMedicalRecord (p_id, mr_id)
VALUES (1,1),
		(2,2);
        
INSERT INTO DoctorViewMedicalRecord (doc_id, mr_id)
VALUES (1,1),
		(1,2);