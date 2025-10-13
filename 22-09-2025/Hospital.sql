CREATE TABLE doctors (
    id int PRIMARY KEY AUTO_INCREMENT NOT null,
    name varchar(100),
    Specialization varchar(100),
    phone varchar(15) NOT null,
    department varchar(100)
   );

ALTER TABLE doctors
AUTO_INCREMENT = 001;

INSERT INTO doctors (name, Specialization, phone, department)
VALUES ('Dr. Priya Menon', 'Cardiology', '9895112233', 'Heart Care'),
       ('Dr. Faisal Khan', 'General Surgeon', '9000554433', 'OP'),
       ('Dr. Grace Samuel', 'General Surgeon', '8765432109', 'Emergency'),
       ('Dr. Anil Kumar', 'Neurology', '7012987654', 'Brain & Nerves'),
       ('Dr. Sarah Jacob', 'Dermatology', '9998887776', 'OP');

ALTER TABLE doctors
ADD license_number varchar(100)
AFTER name;

UPDATE doctors
SET license_number =
    CASE
        WHEN id = 1 THEN 'KL/MD/9452/2018' 
        WHEN id = 2 THEN 'KL/MS/1107/2020'
        WHEN id = 3 THEN 'AP/MB/0034/2015'
        WHEN id = 4 THEN 'KA/PD/8876/2019'
        WHEN id = 5 THEN 'MH/GS/5129/2021'
        ELSE license_number
    END;

ALTER TABLE doctors
ADD UNIQUE (license_number);

-- patients table

CREATE TABLE Patients (
    id int AUTO_INCREMENT PRIMARY KEY NOT null,
    name varchar(100) NOT null,
    gender varchar(100) NOT null,
    blood_group varchar(5),
    phone varchar(100),
    UNIQUE (phone)
    );

ALTER TABLE Patients
AUTO_INCREMENT=101;

INSERT INTO Patients (name, gender, blood_group, phone)
VALUES ('Karthik Rajan', 'Male', 'A+', '9447123456'),
       ('Fathima Shaji', 'Female', 'O-', '9895000111'),
       ('Samuel Varghese', 'Male', 'B-', '8086222333'),
       ('Meera Nair', 'Female', 'AB+', '9946876543'),
       ('Alex George', 'Male', 'A-', '7736555444'),
       ('Sunil T', 'Male', 'O+', '8891456789'),
       ('Aiswarya K', 'Female', 'B+', '7559102938'),
       ('Rakesh P', 'Male', 'AB-', '9387654321'),
       ('Deepa L', 'Female', 'A-', '8281135790'),
       ('Irfan Khan', 'Male', 'O-', '9632587410');

ALTER TABLE patients
ADD COLUMN diagnosis varchar(100)
AFTER blood_group;

UPDATE Patients
SET diagnosis =
    CASE
        WHEN id = 101 THEN 'Acute Gastroenteritis'
        WHEN id = 102 THEN 'Type 2 Diabetes Mellitus'
        WHEN id = 103 THEN 'Essential Hypertension'
        WHEN id = 104 THEN 'Allergic Rhinitis'
        WHEN id = 105 THEN 'Migraine Headache'
        WHEN id = 106 THEN 'Fracture of Tibia'
        WHEN id = 107 THEN 'Iron Deficiency Anemia'
        WHEN id = 108 THEN 'Cholecystitis (Gallstones)'
        WHEN id = 109 THEN 'Asthma Exacerbation'
        WHEN id = 110 THEN 'Dermatitis (Eczema)'
        ELSE null
        END;

-- appointment table

CREATE TABLE appointment (
    id int AUTO_INCREMENT PRIMARY KEY NOT null,
    doctor_id int,
    patient_id int,
    `date` varchar(100) NOT null,
    `time` varchar(100) NOT null,
    bed_number int,
    a_status varchar(100),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id),
    FOREIGN KEY (patient_id) REFERENCES patients(id)
    );

INSERT INTO appointment (doctor_id, patient_id, `date`, `time`, bed_number, a_status)
VALUES (1, 101, '12-10-2025', '10:00 AM', 101, 'Completed'),
(5, 101, '12-10-2025', '02:30 PM', 106, 'Cancelled'),
(3, 105, '13-10-2025', '04:00 PM', 055, 'Scheduled'),
(1, 103, '13-10-2025', '09:15 AM', 104, 'Scheduled'),
(2, 107, '13-10-25', '11:00 AM', 012, 'Scheduled');