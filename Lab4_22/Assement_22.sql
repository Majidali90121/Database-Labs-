--1nf
CREATE TABLE Hospital_1nf(
    VisitId Varchar(20),
    VisitDate DATE,
    PatientID VARCHAR(20),
    PatientName VARCHAR(100),
    PatientPhone VARCHAR(20),
    DocotorId VARCHAR(20),
    DoctorName VARCHAR(100),
    Specialty VARCHAR(50),
    DeptName VARCHAR(50),
    DeptHead VARCHAR(100),
    Diagnose VARCHAR(20),
    FEE INT,
    PRIMARY KEY (VisitId,PatientID,DocotorId)
    );

--2nf
DROP TABLE hospital_1nf;
CREATE TABLE PATIENT(
    VisitId VARCHAR(20),
    VisitDate Date,
    PatinetId VARCHAR(20),
    PatientName VARCHAR(100),
    PatinetPhone VARCHAR(20),
    PRIMARY KEY (VisitId,PatinetId)
    );
 CREATE TABLE Doctor_2nf(
     DoctorId VARCHAR(20) PRIMARY KEY,
     DocotorName VARCHAR(100),
     Speciatlity VARCHAR(100),
     DeptName VARCHAR(100),
     DeptHead VARCHAR(100),
     VisitId VARCHAR(20),
     FOREIGN KEY (VisitId) REFERENCES PATIENT(VisitId)
     );
     
  CREATE TABLE DIAGNOSE(
      Diagnose VARCHAR(100),
      FEE int,
      VisitId VARCHAR(20),
      PatinetId VARCHAR(20),
      FOREIGN KEY (VisitId)  REFERENCES PATIENT(VisitId)
      FOREIGN KEY (PatientId)  REFERENCES PATIENT(PatirntId)
      );

--3nf
DROP TABLE doctor_2nf;
CREATE TABLE Doctor_3nf(
    DoctorID VARCHAR(20) PRIMARY KEY,
    DoctorName VARCHAR(100),
    Speciality VARCHAR(100),
    VisitId VARCHAR(20),
    FOREIGN KEY (VisitId) REFERENCES patient(VisitId)
    );
    
 CREATE TABLE Department_3nf(
     DeptName VARCHAR(100),
     Depthead VARCHAR(100),
     DoctorID VARCHAR(20),
     FOREIGN KEY (DoctorID) REFERENCES Doctor_3nf(DoctorID)
     
     );

--VERIFICATION
SELECT p.PatientName,d.Diagnose,doc.DoctorName
FROM doctor_3nf doc
JOIN patient p ON doc.VisitId=p.VisitId
JOIN diagnose d ON doc.VisitId=d.VisitId
