-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-09-09 07:36:35.875

-- tables
-- Table: All_Employees
CREATE TABLE All_Employees (
    Employee_ID varchar(10)  NOT NULL,
    Name Varchar(20)  NOT NULL,
    Gender varchar(6)  NOT NULL,
    Phone int  NOT NULL,
    Email_ID varchar(30)  NOT NULL,
    DOB date  NOT NULL,
    Address varchar(50)  NOT NULL,
    Employee_Type varchar(10)  NOT NULL,
    Blood_Group varchar(3)  NOT NULL,
    CONSTRAINT All_Employees_pk PRIMARY KEY  (Employee_ID)
);

-- Table: Attendance_Tracker
CREATE TABLE Attendance_Tracker (
    Attendance_tracker_Id int  NOT NULL,
    Check_In datetime  NOT NULL,
    Check_Out datetime  NOT NULL,
    All_Employees_Employee_ID varchar(10)  NOT NULL,
    In_Hours time(2)  NULL,
    CONSTRAINT Attendance_Tracker_pk PRIMARY KEY  (Attendance_tracker_Id)
);

-- Table: Bill
CREATE TABLE Bill (
    Bill_ID varchar(10)  NOT NULL,
    Date_And_Time datetime  NOT NULL,
    Visit_Visit_ID Varchar(10)  NOT NULL,
    Consult_Consult_ID varchar(10)  NOT NULL,
    Surgery_Booking_Surgery_Booking_ID varchar(10)  NOT NULL,
    Test_Booking_Test_Booking_ID Varchar(10)  NOT NULL,
    CONSTRAINT Bill_pk PRIMARY KEY  (Bill_ID)
);

-- Table: Consult
CREATE TABLE Consult (
    Consult_ID varchar(10)  NOT NULL,
    Date_And_Time datetime  NOT NULL,
    Cost money  NOT NULL,
    Payment_Status bit  NOT NULL,
    All_Employees_Employee_ID varchar(10)  NOT NULL,
    Visit_Visit_ID Varchar(10)  NOT NULL,
    CONSTRAINT Consult_pk PRIMARY KEY  (Consult_ID)
);

-- Table: Department
CREATE TABLE Department (
    Department_ID Varchar(3)  NOT NULL,
    Department_Name varchar(10)  NOT NULL,
    Wing_Number int  NOT NULL,
    Floor int  NOT NULL,
    CONSTRAINT Department_pk PRIMARY KEY  (Department_ID)
);

-- Table: Department_Surgery
CREATE TABLE Department_Surgery (
    Department_Surgery_ID varchar(3)  NOT NULL,
    Surgery_Surgery_ID varchar(10)  NOT NULL,
    Department_Department_ID Varchar(3)  NOT NULL,
    CONSTRAINT Department_Surgery_pk PRIMARY KEY  (Department_Surgery_ID)
);

-- Table: Designation
CREATE TABLE Designation (
    Designation_ID varchar(3)  NOT NULL,
    Designation_name varchar(10)  NOT NULL,
    CONSTRAINT Designation_pk PRIMARY KEY  (Designation_ID)
);

-- Table: Doctor_Surgery
CREATE TABLE Doctor_Surgery (
    Doctor_Surgery_ID int  NOT NULL,
    All_Employees_Employee_ID varchar(10)  NOT NULL,
    Surgery_Surgery_ID varchar(10)  NOT NULL,
    CONSTRAINT Doctor_Surgery_pk PRIMARY KEY  (Doctor_Surgery_ID)
);

-- Table: Employee_Designation_Department
CREATE TABLE Employee_Designation_Department (
    Employee_Designation_ID varchar(10)  NOT NULL,
    Department_Department_ID Varchar(3)  NOT NULL,
    Designation_Designation_ID varchar(3)  NOT NULL,
    Date_When_Assigned date  NOT NULL,
    All_Employees_Employee_ID varchar(10)  NOT NULL,
    CONSTRAINT Employee_Designation_Department_pk PRIMARY KEY  (Employee_Designation_ID)
);

-- Table: Lab
CREATE TABLE Lab (
    Lab_ID varchar(5)  NOT NULL,
    Wing int  NOT NULL,
    Floor int  NOT NULL,
    Type varchar(10)  NOT NULL,
    CONSTRAINT Lab_pk PRIMARY KEY  (Lab_ID)
);

-- Table: Lab_Department_Test
CREATE TABLE Lab_Department_Test (
    Lab_Department_Test_ID int  NOT NULL,
    Lab_Lab_ID varchar(5)  NOT NULL,
    Tests_Test_ID Varchar(10)  NOT NULL,
    Department_Department_ID Varchar(3)  NOT NULL,
    CONSTRAINT Lab_Department_Test_pk PRIMARY KEY  (Lab_Department_Test_ID)
);

-- Table: Patient
CREATE TABLE Patient (
    Patient_ID Varchar(10)  NOT NULL,
    Name Varchar(20)  NOT NULL,
    Phone int  NOT NULL,
    Email_ID varchar(30)  NULL,
    Blood_group Varchar(3)  NOT NULL,
    Address varchar(30)  NOT NULL,
    CONSTRAINT Patient_pk PRIMARY KEY  (Patient_ID)
);

-- Table: Patient_Visit
CREATE TABLE Patient_Visit (
    Patient_Patient_ID Varchar(10)  NOT NULL,
    Visit_Visit_ID Varchar(10)  NOT NULL,
    CONSTRAINT Patient_Visit_pk PRIMARY KEY  (Patient_Patient_ID,Visit_Visit_ID)
);

-- Table: Room
CREATE TABLE Room (
    Room_ID varchar(5)  NOT NULL,
    Room_Number int  NOT NULL,
    Type Varchar(10)  NOT NULL,
    Wing int  NOT NULL,
    Floor int  NOT NULL,
    Cost_Per_Day money  NOT NULL,
    CONSTRAINT Room_pk PRIMARY KEY  (Room_ID)
);

-- Table: Room_Booking
CREATE TABLE Room_Booking (
    Room_Booking_ID varchar(10)  NOT NULL,
    Date_And_Time datetime  NOT NULL,
    Payment_Status bit  NOT NULL,
    Visit_Visit_ID Varchar(10)  NOT NULL,
    Room_Room_ID varchar(5)  NOT NULL,
    CONSTRAINT Room_Booking_pk PRIMARY KEY  (Room_Booking_ID)
);

-- Table: Surgery
CREATE TABLE Surgery (
    Surgery_ID varchar(10)  NOT NULL,
    Surgery_Name Varchar(10)  NOT NULL,
    Surgery_Cost money  NOT NULL,
    CONSTRAINT Surgery_pk PRIMARY KEY  (Surgery_ID)
);

-- Table: Surgery_Booking
CREATE TABLE Surgery_Booking (
    Surgery_Booking_ID varchar(10)  NOT NULL,
    Date_And_Time datetime  NOT NULL,
    Payment_Status bit  NOT NULL,
    Visit_Visit_ID Varchar(10)  NOT NULL,
    Surgery_Surgery_ID varchar(10)  NOT NULL,
    All_Employees_Employee_ID varchar(10)  NOT NULL,
    Surgery_Theatre_Surgery_ID varchar(10)  NOT NULL,
    CONSTRAINT Surgery_Booking_pk PRIMARY KEY  (Surgery_Booking_ID)
);

-- Table: Surgery_Theatre
CREATE TABLE Surgery_Theatre (
    Surgery_Theatre_ID varchar(10)  NOT NULL,
    Theatre_Number varchar(10)  NOT NULL,
    Wing_Number int  NOT NULL,
    Floor int  NOT NULL,
    CONSTRAINT Surgery_Theatre_pk PRIMARY KEY  (Surgery_Theatre_ID)
);

-- Table: Surgery_Tracker
CREATE TABLE Surgery_Tracker (
    Surgery_Tracker_ID int  NOT NULL,
    Surgery_Booking_Surgery_Booking_ID varchar(10)  NOT NULL,
    Start_Time datetime  NULL,
    End_Time datetime  NOT NULL,
    CONSTRAINT Surgery_Tracker_pk PRIMARY KEY  (Surgery_Tracker_ID)
);

-- Table: Test_Booking
CREATE TABLE Test_Booking (
    Test_Booking_ID Varchar(10)  NOT NULL,
    Date_And_Time datetime  NOT NULL,
    Payment_Status bit  NOT NULL,
    Visit_Visit_ID Varchar(10)  NOT NULL,
    Tests_Test_ID Varchar(10)  NOT NULL,
    Lab_Lab_ID varchar(5)  NOT NULL,
    CONSTRAINT Test_Booking_pk PRIMARY KEY  (Test_Booking_ID)
);

-- Table: Tests
CREATE TABLE Tests (
    Test_ID Varchar(10)  NOT NULL,
    Test_Name varchar(10)  NOT NULL,
    Cost money  NOT NULL,
    CONSTRAINT Tests_pk PRIMARY KEY  (Test_ID)
);

-- Table: Visit
CREATE TABLE Visit (
    Visit_ID Varchar(10)  NOT NULL,
    DOA datetime  NOT NULL,
    DOD datetime  NULL,
    Visit_Type char(2)  NOT NULL,
    Patient_Patient_ID Varchar(10)  NOT NULL,
    CONSTRAINT Visit_pk PRIMARY KEY  (Visit_ID)
);

-- foreign keys
-- Reference: Attendance_Tracker_All_Employees (table: Attendance_Tracker)
ALTER TABLE Attendance_Tracker ADD CONSTRAINT Attendance_Tracker_All_Employees
    FOREIGN KEY (All_Employees_Employee_ID)
    REFERENCES All_Employees (Employee_ID);

-- Reference: Bill_Consult (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Consult
    FOREIGN KEY (Consult_Consult_ID)
    REFERENCES Consult (Consult_ID);

-- Reference: Bill_Surgery_Booking (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Surgery_Booking
    FOREIGN KEY (Surgery_Booking_Surgery_Booking_ID)
    REFERENCES Surgery_Booking (Surgery_Booking_ID);

-- Reference: Bill_Test_Booking (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Test_Booking
    FOREIGN KEY (Test_Booking_Test_Booking_ID)
    REFERENCES Test_Booking (Test_Booking_ID);

-- Reference: Bill_Visit (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Visit
    FOREIGN KEY (Visit_Visit_ID)
    REFERENCES Visit (Visit_ID);

-- Reference: Consult_All_Employees (table: Consult)
ALTER TABLE Consult ADD CONSTRAINT Consult_All_Employees
    FOREIGN KEY (All_Employees_Employee_ID)
    REFERENCES All_Employees (Employee_ID);

-- Reference: Consult_Visit (table: Consult)
ALTER TABLE Consult ADD CONSTRAINT Consult_Visit
    FOREIGN KEY (Visit_Visit_ID)
    REFERENCES Visit (Visit_ID);

-- Reference: Department_Surgery_Department (table: Department_Surgery)
ALTER TABLE Department_Surgery ADD CONSTRAINT Department_Surgery_Department
    FOREIGN KEY (Department_Department_ID)
    REFERENCES Department (Department_ID);

-- Reference: Department_Surgery_Surgery (table: Department_Surgery)
ALTER TABLE Department_Surgery ADD CONSTRAINT Department_Surgery_Surgery
    FOREIGN KEY (Surgery_Surgery_ID)
    REFERENCES Surgery (Surgery_ID);

-- Reference: Doctor_Surgery_All_Employees (table: Doctor_Surgery)
ALTER TABLE Doctor_Surgery ADD CONSTRAINT Doctor_Surgery_All_Employees
    FOREIGN KEY (All_Employees_Employee_ID)
    REFERENCES All_Employees (Employee_ID);

-- Reference: Doctor_Surgery_Surgery (table: Doctor_Surgery)
ALTER TABLE Doctor_Surgery ADD CONSTRAINT Doctor_Surgery_Surgery
    FOREIGN KEY (Surgery_Surgery_ID)
    REFERENCES Surgery (Surgery_ID);

-- Reference: Employee_Designation_Department_All_Employees (table: Employee_Designation_Department)
ALTER TABLE Employee_Designation_Department ADD CONSTRAINT Employee_Designation_Department_All_Employees
    FOREIGN KEY (All_Employees_Employee_ID)
    REFERENCES All_Employees (Employee_ID);

-- Reference: Employee_Designation_Department_Department (table: Employee_Designation_Department)
ALTER TABLE Employee_Designation_Department ADD CONSTRAINT Employee_Designation_Department_Department
    FOREIGN KEY (Department_Department_ID)
    REFERENCES Department (Department_ID);

-- Reference: Employee_Designation_Department_Designation (table: Employee_Designation_Department)
ALTER TABLE Employee_Designation_Department ADD CONSTRAINT Employee_Designation_Department_Designation
    FOREIGN KEY (Designation_Designation_ID)
    REFERENCES Designation (Designation_ID);

-- Reference: Lab_Department_Test_Department (table: Lab_Department_Test)
ALTER TABLE Lab_Department_Test ADD CONSTRAINT Lab_Department_Test_Department
    FOREIGN KEY (Department_Department_ID)
    REFERENCES Department (Department_ID);

-- Reference: Lab_Department_Test_Lab (table: Lab_Department_Test)
ALTER TABLE Lab_Department_Test ADD CONSTRAINT Lab_Department_Test_Lab
    FOREIGN KEY (Lab_Lab_ID)
    REFERENCES Lab (Lab_ID);

-- Reference: Lab_Department_Test_Tests (table: Lab_Department_Test)
ALTER TABLE Lab_Department_Test ADD CONSTRAINT Lab_Department_Test_Tests
    FOREIGN KEY (Tests_Test_ID)
    REFERENCES Tests (Test_ID);

-- Reference: Patient_Visit_Patient (table: Patient_Visit)
ALTER TABLE Patient_Visit ADD CONSTRAINT Patient_Visit_Patient
    FOREIGN KEY (Patient_Patient_ID)
    REFERENCES Patient (Patient_ID);

-- Reference: Patient_Visit_Visit (table: Patient_Visit)
ALTER TABLE Patient_Visit ADD CONSTRAINT Patient_Visit_Visit
    FOREIGN KEY (Visit_Visit_ID)
    REFERENCES Visit (Visit_ID);

-- Reference: Room_Booking_Room (table: Room_Booking)
ALTER TABLE Room_Booking ADD CONSTRAINT Room_Booking_Room
    FOREIGN KEY (Room_Room_ID)
    REFERENCES Room (Room_ID);

-- Reference: Room_Booking_Visit (table: Room_Booking)
ALTER TABLE Room_Booking ADD CONSTRAINT Room_Booking_Visit
    FOREIGN KEY (Visit_Visit_ID)
    REFERENCES Visit (Visit_ID);

-- Reference: Surgery_Booking_All_Employees (table: Surgery_Booking)
ALTER TABLE Surgery_Booking ADD CONSTRAINT Surgery_Booking_All_Employees
    FOREIGN KEY (All_Employees_Employee_ID)
    REFERENCES All_Employees (Employee_ID);

-- Reference: Surgery_Booking_Surgery (table: Surgery_Booking)
ALTER TABLE Surgery_Booking ADD CONSTRAINT Surgery_Booking_Surgery
    FOREIGN KEY (Surgery_Surgery_ID)
    REFERENCES Surgery (Surgery_ID);

-- Reference: Surgery_Booking_Surgery_Theatre (table: Surgery_Booking)
ALTER TABLE Surgery_Booking ADD CONSTRAINT Surgery_Booking_Surgery_Theatre
    FOREIGN KEY (Surgery_Theatre_Surgery_ID)
    REFERENCES Surgery_Theatre (Surgery_Theatre_ID);

-- Reference: Surgery_Booking_Visit (table: Surgery_Booking)
ALTER TABLE Surgery_Booking ADD CONSTRAINT Surgery_Booking_Visit
    FOREIGN KEY (Visit_Visit_ID)
    REFERENCES Visit (Visit_ID);

-- Reference: Surgery_Tracker_Surgery_Booking (table: Surgery_Tracker)
ALTER TABLE Surgery_Tracker ADD CONSTRAINT Surgery_Tracker_Surgery_Booking
    FOREIGN KEY (Surgery_Booking_Surgery_Booking_ID)
    REFERENCES Surgery_Booking (Surgery_Booking_ID);

-- Reference: Test_Booking_Lab (table: Test_Booking)
ALTER TABLE Test_Booking ADD CONSTRAINT Test_Booking_Lab
    FOREIGN KEY (Lab_Lab_ID)
    REFERENCES Lab (Lab_ID);

-- Reference: Test_Booking_Tests (table: Test_Booking)
ALTER TABLE Test_Booking ADD CONSTRAINT Test_Booking_Tests
    FOREIGN KEY (Tests_Test_ID)
    REFERENCES Tests (Test_ID);

-- Reference: Test_Booking_Visit (table: Test_Booking)
ALTER TABLE Test_Booking ADD CONSTRAINT Test_Booking_Visit
    FOREIGN KEY (Visit_Visit_ID)
    REFERENCES Visit (Visit_ID);

-- Reference: Visit_Patient (table: Visit)
ALTER TABLE Visit ADD CONSTRAINT Visit_Patient
    FOREIGN KEY (Patient_Patient_ID)
    REFERENCES Patient (Patient_ID);

-- End of file.

