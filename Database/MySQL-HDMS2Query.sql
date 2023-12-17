/* List all departments’ names with their doctors’ names, ordering by names of departments.*/
SELECT dep.dep_name as department, d.doc_name as doctor
FROM Department dep
LEFT JOIN DoctorInDepartment did ON dep.dep_id = did.dep_id
LEFT JOIN Doctor d ON did.doc_id = d.doc_id 
ORDER BY dep.dep_name ASC;

/* List all departments’ names with their nurses’ names, ordering by names of departments.*/
SELECT dep.dep_name as department, n.n_name as nurse
FROM Department dep
LEFT JOIN NurseInDepartment nid ON dep.dep_id = nid.dep_id
LEFT JOIN Nurse n ON nid.n_id = n.n_id 
ORDER BY dep.dep_name ASC;

/* List all patient who are between 20 and 30 years old with their name, gender, date of birth and age calculated from date of birth */
SELECT
    p_name AS Patient,
    p_biogender AS Gender,
    p_dob AS 'Date of Birth',
    TIMESTAMPDIFF(YEAR, p_dob, CURDATE()) AS Age
FROM Patient
WHERE p_dob BETWEEN DATE_SUB(CURDATE(), INTERVAL 30 YEAR) AND DATE_SUB(CURDATE(), INTERVAL 20 YEAR);

/* List all rooms that has patient with room_no, patient name and nurse name */
SELECT pr.room_no as Room, p.p_name as Patient, n.n_name as Nurse
FROM PatientRoom pr
RIGHT JOIN PatientRoomAssignment pra ON pr.room_no = pra.room_no
INNER JOIN Patient p ON pra.p_id = p.p_id
LEFT JOIN NurseAssignToPatientRoom npr ON pr.room_no = npr.room_no
INNER JOIN Nurse n ON npr.n_id = n.n_id