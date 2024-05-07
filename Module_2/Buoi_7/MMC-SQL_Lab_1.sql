
CREATE TABLE Department (
    DepartmentID    INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName  VARCHAR(50) NOT NULL
)

CREATE TABLE `Position` (
  PositionID INT PRIMARY KEY AUTO_INCREMENT,
  PositionName VARCHAR(50) NOT NULL
);

CREATE TABLE Account (
    AccountID       INT PRIMARY KEY AUTO_INCREMENT,
    Email           VARCHAR(50) NOT NULL,
    Username        VARCHAR(50) NOT NULL,
    FullName        VARCHAR(50) NOT NULL,
    DepartmentID    INT,
    PositionID      INT,
    CreateDate      DATETIME
)

CREATE TABLE `Group` (
  GroupID           INT PRIMARY KEY AUTO_INCREMENT,
  GroupName         VARCHAR(50) NOT NULL,
  CreatorID         INT,
  CreateDate        DATETIME
)


CREATE TABLE GroupAccount (
    GroupID         INT,
    AccountID       INT,
    JoinDate        DATETIME
)

CREATE TABLE TypeQuestion (
    TypeID          INT PRIMARY KEY AUTO_INCREMENT,
    TypeName        VARCHAR(50) NOT NULL
)

CREATE TABLE CategoryQuestion (
    CategoryID      INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName    VARCHAR(50) NOT NULL
)

CREATE TABLE Question (
    QuestionID      INT PRIMARY KEY AUTO_INCREMENT,
    Content         VARCHAR(255) NOT NULL,
    CategoryID      INT,
    TypeID          INT,
    CreatorID       INT,
    CreateDate      DATETIME
)

CREATE TABLE Answer (
    AnswerID        INT PRIMARY KEY AUTO_INCREMENT,
    Content         VARCHAR(255) NOT NULL,
    QuestionID      INT,
    IsCorrect       BOOLEAN
)

CREATE TABLE Exam (
    ExamID          INT PRIMARY KEY AUTO_INCREMENT,
    Code            VARCHAR(50) NOT NULL,
    Title           VARCHAR(50) NOT NULL,
    CategoryID      INT,
    Duration        INT,
    CreatorID       INT,
    CreateDate      DATETIME
)

CREATE TABLE ExamQuestion (
    ExamID          INT,
    QuestionID      INT
)
