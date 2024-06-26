-- Need to Refer eg_user where ever usermaster is refered.

CREATE TABLE UserMaster(
    Id SERIAL ,
    uuid UUID PRIMARY KEY
);

CREATE TABLE Caste (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(1000),
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE Religion (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(1000),
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE Divyang (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(1000),
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE FileUploaded (
    UUID UUID NOT NULL,
    FILEID VARCHAR(255) NOT NULL,
    URL VARCHAR(255) NOT NULL,
    Type VARCHAR(255) NOT NULL,
    CONSTRAINT fk_fileuploaded_usermaster FOREIGN KEY (UUID) REFERENCES UserMaster(uuid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE WardMaster (
    ID SERIAL PRIMARY KEY,
    CityName VARCHAR(255) NOT NULL,
    WardName VARCHAR(255) NOT NULL,
    Remark VARCHAR(1000),
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE ElectoralWardMaster (
    ID SERIAL PRIMARY KEY,
    CityName VARCHAR(255) NOT NULL,
    WardName VARCHAR(255) NOT NULL,
    ElectoralWardName VARCHAR(255) NOT NULL,
    Remark VARCHAR(1000),
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE BankMaster (
    ID SERIAL PRIMARY KEY,
    BankName VARCHAR(255) NOT NULL,
    BankCode VARCHAR(255) NOT NULL,
    Remark VARCHAR(1000),
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE CourseMaster (
    ID SERIAL PRIMARY KEY,
    Sector VARCHAR(255) NOT NULL,
    CourseCode VARCHAR(255) NOT NULL UNIQUE,
    CourseName VARCHAR(255) NOT NULL,
    Qualification VARCHAR(255) NOT NULL,
    CourseDuration INT NOT NULL,
    TotalCost FLOAT NOT NULL,
    NSQFLevel INT NOT NULL,
    NQRCode VARCHAR(255),
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE QualificationMaster (
    ID SERIAL PRIMARY KEY,
    Qualification VARCHAR(255) NOT NULL,
    Remark VARCHAR(1000),
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE SectorMaster (
    ID SERIAL PRIMARY KEY,
    Sector VARCHAR(255) NOT NULL,
    Remark VARCHAR(1000),
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE Schemes (
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(1000) NOT NULL,
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE Event (
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    StartDt BIGINT NOT NULL,
    EndDt BIGINT,
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255)
);

CREATE TABLE SchemeEvent (
    Id SERIAL PRIMARY KEY,
    SchemeID INT NOT NULL,
    EventID INT NOT NULL,
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255),
    CONSTRAINT fk_schemeevent_scheme FOREIGN KEY (SchemeID) REFERENCES Schemes(Id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_schemeevent_event FOREIGN KEY (EventID) REFERENCES Event(Id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE AadharUser (
    id SERIAL PRIMARY KEY,
    AadharRef VARCHAR(12) NOT NULL,
    uuid UUID NOT NULL,
    AadharFatherName VARCHAR(255) NOT NULL,
    AadharName VARCHAR(255) NOT NULL,
    AadharDOB DATE NOT NULL,
    AAdharMobile VARCHAR(15) NOT NULL,
    Gender VARCHAR(10) NOT NULL, -- Added Gender
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255),
    CONSTRAINT fk_aadharuser_usermaster FOREIGN KEY (uuid) REFERENCES UserMaster(uuid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Address (
    ID SERIAL PRIMARY KEY,
    UUID UUID NOT NULL,
    Address1 VARCHAR(255) NOT NULL,
    Address2 VARCHAR(255),
    Location VARCHAR(255),
    Ward VARCHAR(255),
    City VARCHAR(255) NOT NULL,
    District VARCHAR(255) NOT NULL,
    State VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    Pincode VARCHAR(10) NOT NULL,
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255),
    CONSTRAINT fk_address_usermaster FOREIGN KEY (UUID) REFERENCES UserMaster(uuid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE UserOtherDetails (
    ID SERIAL PRIMARY KEY,
    UUID UUID NOT NULL,
    CasteID INT,
    ReligionID INT,
    DivyangCardID VARCHAR(255),
    DivyangPercent FLOAT,
    TransgenderID VARCHAR(255),
    CreatedOn BIGINT NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255),
    DivyangID INT,
    rationCardCategory VARCHAR(255), -- Added rationCardCategory
    educationLevel VARCHAR(255), -- Added educationLevel
    udid VARCHAR(255), -- Added udid
    CONSTRAINT fk_userotherdetails_usermaster FOREIGN KEY (UUID) REFERENCES UserMaster(uuid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_userotherdetails_cast FOREIGN KEY (CasteID) REFERENCES Caste(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_userotherdetails_religion FOREIGN KEY (ReligionID) REFERENCES Religion(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_userotherdetails_divyang FOREIGN KEY (DivyangID) REFERENCES Divyang(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE UserSchemeApplication (
    id SERIAL PRIMARY KEY,
    uuid UUID NOT NULL,
    optedId INT NOT NULL,
    ApplicationStatus BOOLEAN NOT NULL,
    VerificationStatus BOOLEAN NOT NULL,
    FirstApprovalStatus BOOLEAN NOT NULL,
    RandomSelection BOOLEAN NOT NULL,
    FinalApproval BOOLEAN NOT NULL,
    Submitted BOOLEAN NOT NULL,
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255),
    CONSTRAINT fk_userschemeapplication_usermaster FOREIGN KEY (uuid) REFERENCES UserMaster(uuid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Courses (
    ID SERIAL PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    Description VARCHAR(1000),
    Duration VARCHAR(50),
    StartDt BIGINT NOT NULL,
    EndDt BIGINT,
    TypeID INT NOT NULL,
    URL VARCHAR(255),
    Institute VARCHAR(255) NOT NULL,
    ImgURL VARCHAR(255),
    InstituteAddress VARCHAR(255),
    ModifiedOn BIGINT,
    CreatedBy VARCHAR(255) NOT NULL,
    ModifiedBy VARCHAR(255),
    Amount FLOAT
);

CREATE TABLE SchemeCourse (
    id SERIAL PRIMARY KEY,
    SchemeID INT NOT NULL,
    CourseID INT NOT NULL,
    GrantAmount FLOAT,
    CONSTRAINT fk_schemecourse_scheme FOREIGN KEY (SchemeID) REFERENCES Schemes(Id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_schemecourse_course FOREIGN KEY (CourseID) REFERENCES Courses(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Machines (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(1000),
    Amount FLOAT
);

CREATE TABLE SchemeMachine (
    id SERIAL PRIMARY KEY,
    MachineID INT NOT NULL,
    SchemeID INT NOT NULL,
    GrantAmount FLOAT,
    CONSTRAINT fk_schemachine_machine FOREIGN KEY (MachineID) REFERENCES Machines(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_schemachine_scheme FOREIGN KEY (SchemeID) REFERENCES Schemes(ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);




