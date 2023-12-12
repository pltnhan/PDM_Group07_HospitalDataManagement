USE HDMS2;

CREATE TABLE Department (
	dep_id INT NOT NULL AUTO_INCREMENT,
	dep_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (dep_id));

CREATE TABLE Account (
	userid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(100) NOT NULL UNIQUE,
	passwo VARCHAR(250) NOT NULL,
	usertype VARCHAR(50));

CREATE TABLE Patient (
	p_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	p_name VARCHAR(100) NOT NULL,
	p_phone VARCHAR(10),
	p_email VARCHAR(100),
	p_province VARCHAR(250),
	p_dob DATE,
	p_biogender VARCHAR(15));

CREATE TABLE PatientAccount (
	p_id INT,
	userid INT,
	FOREIGN KEY (userid) REFERENCES Account(userid),
	FOREIGN KEY (p_id) REFERENCES Patient(p_id));

CREATE TABLE Doctor (
	doc_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	doc_name VARCHAR(50) NOT NULL,
	doc_phone VARCHAR(10),
	doc_email VARCHAR(200) UNIQUE);

CREATE TABLE DoctorInDepartment (
	doc_id INT,
	dep_id INT,
	FOREIGN KEY (dep_id) REFERENCES Department(dep_id),
	FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id));

CREATE TABLE DoctorAccount (
	doc_id INT,
	userid INT,
	FOREIGN KEY (userid) REFERENCES Account(userid),
	FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id));

CREATE TABLE Nurse (
	n_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	n_name VARCHAR(50) NOT NULL,
	n_phone VARCHAR(10),
	n_email VARCHAR(100));

CREATE TABLE NurseInDepartment (
	n_id INT,
	dep_id INT,
	FOREIGN KEY (dep_id) REFERENCES Department(dep_id),
	FOREIGN KEY (n_id) REFERENCES Nurse(n_id));

CREATE TABLE Appointment (
	a_id INT PRIMARY KEY,
	a_date DATE NOT NULL,
	starttime TIME NOT NULL,
	endtime TIME NOT NULL,
	status varchar(15) NOT NULL);

CREATE TABLE PatientBookAppointment (
	p_id INT,
	a_id INT,
	symptoms varchar(40) NOT NULL,
	FOREIGN KEY (p_id) REFERENCES Patient(p_id),
	FOREIGN KEY (a_id) REFERENCES Appointment(a_id));

CREATE TABLE DoctorViewAppointment (
	doc_id INT,
	a_id INT,
	FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id),
	FOREIGN KEY (a_id) REFERENCES Appointment(a_id));

CREATE TABLE MedicalRecord (
	mr_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	mr_date DATE,
	symptom VARCHAR(50),
	disease VARCHAR(50),
	treatment VARCHAR(50));

CREATE TABLE PatientViewMedicalRecord (
	p_id INT,
	mr_id INT,
	FOREIGN KEY (p_id) REFERENCES Patient(p_id),
	FOREIGN KEY (mr_id) REFERENCES MedicalRecord(mr_id));

CREATE TABLE DoctorViewMedicalRecord (
	doc_id INT,
	mr_id INT,
	FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id),
	FOREIGN KEY (mr_id) REFERENCES MedicalRecord(mr_id));

CREATE TABLE PatientRoom (
	room_no VARCHAR(10) NOT NULL PRIMARY KEY,
	r_type VARCHAR(1));

CREATE TABLE NurseAssignToPatientRoom (
	n_id INT,
	room_no VARCHAR(10),
	FOREIGN KEY (n_id) REFERENCES Nurse(n_id),
	FOREIGN KEY (room_no) REFERENCES PatientRoom(room_no));

CREATE TABLE PatientRoomAssignment (
	p_id INT,
	room_no VARCHAR(10),
	FOREIGN KEY (p_id) REFERENCES Patient(p_id),
	FOREIGN KEY (room_no) REFERENCES PatientRoom(room_no));



