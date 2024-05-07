
DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID                INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName              NVARCHAR(50) NOT NULL UNIQUE KEY
)

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
  PositionID                    INT PRIMARY KEY AUTO_INCREMENT,
  PositionName                  ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
)

DROP TABLE IF EXISTS Account;
CREATE TABLE Account (
    AccountID                   INT PRIMARY KEY AUTO_INCREMENT,
    Email                       VARCHAR(50) NOT NULL UNIQUE KEY,
    Username                    VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName                    NVARCHAR(50) NOT NULL,
    DepartmentID                INT NOT NULL,
    PositionID                  INT NOT NULL,
    CreateDate                  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (DepartmentID)  REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID)    REFERENCES `Position`(PositionID)
)

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
  GroupID                       INT PRIMARY KEY AUTO_INCREMENT,
  GroupName                     NVARCHAR(50) NOT NULL UNIQUE KEY,
  CreatorID                     INT,
  CreateDate                    DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (CreatorID)       REFERENCES Account(AccountID)
)

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
    GroupID                     INT NOT NULL,
    AccountID                   INT NOT NULL,
    JoinDate                    DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY(GroupID) 		REFERENCES `Group`(GroupID) 
)

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID                      INT PRIMARY KEY AUTO_INCREMENT,
    TypeName                    ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
)

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
    CategoryID                  INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName                NVARCHAR(50) NOT NULL UNIQUE KEY
)

DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
    QuestionID                  INT PRIMARY KEY AUTO_INCREMENT,
    Content                     NVARCHAR(255) NOT NULL,
    CategoryID                  INT NOt NULL,
    TypeID                      INT NOT NULL,
    CreatorID                   INT NOT NULL,
    CreateDate                  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CategoryID)    REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID)        REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CreatorID)     REFERENCES Account(AccountID)
)

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
    AnswerID                    INT PRIMARY KEY AUTO_INCREMENT,
    Content                     NVARCHAR(255) NOT NULL,
    QuestionID                  INT Not NULL,
    IsCorrect                   BIT DEFAULT 1,
    FOREIGN KEY (QuestionID)    REFERENCES Question(QuestionID)
)

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
    ExamID                      INT PRIMARY KEY AUTO_INCREMENT,
    Code                        CHAR(10) NOT NULL,
    Title                       NVARCHAR(50) NOT NULL,
    CategoryID                  INT NOT NULL,
    Duration                    INT NOT NULL,
    CreatorID                   INT NOT NULL,
    CreateDate                  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CategoryID)    REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (CreatorID)     REFERENCES Account(AccountID)
)

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
    ExamID                      INT NOT NULL,
    QuestionID                  INT NOT NULL,
    PRIMARY KEY (ExamID, QuestionID),
    FOREIGN KEY (ExamID)        REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID)    REFERENCES Question(QuestionID)
)

--------------=====================---------------------

-- Hãy thêm 10 dữ liệu vào mỗi bảng cho db trên

INSERT INTO Department (DepartmentName) VALUES ('Development'),
('Testing'), ('Scrum Master'), ('Product Management'), ('Human Resource'),
('Finance'), ('Marketing'), ('Sales'), ('Design'), ('DevOps');

INSERT INTO `Position` (PositionName) VALUES ('Dev'), ('Test'), ('Scrum Master'), ('PM');

INSERT INTO Account (Email, Username, FullName, DepartmentID, PositionID)
VALUES ('dev001@testing.com', 'dev001', 'Dev John', 1, 1),
       ('test001@testing.com', 'test001', 'Test Alice', 2, 2),
       ('sm001@testing.com', 'sm001', 'Scrum Master Bob', 3, 3),
       ('pm001@testing.com', 'pm001', 'Product Manager Charlie', 4, 4),
       ('hr001@testing.com', 'hr001', 'HR Diana', 5, 2),
       ('fn001@testing.com', 'fn001', 'Finance David', 6, 1),
       ('mk001@testing.com', 'mk001', 'Marketing Emily', 7, 3),
       ('sale001@testing.com', 'sale001', 'Sales Frank', 8, 4),
       ('design001@testing.com', 'design001', 'Designer Grace', 9, 2),
       ('devops001@testing.com', 'devops001', 'DevOps Henry', 10, 3);

INSERT INTO `Group` (GroupName, CreatorID)
VALUES ('Dev Team', 11),
       ('Test Team', 12),
       ('Scrum Masters', 13),
       ('Product Managers', 14);


INSERT INTO GroupAccount (GroupID, AccountID)
VALUES (13, 11), (14, 12), (15, 13), (13, 12), (16, 14), (13, 13), (14, 14);

INSERT INTO TypeQuestion (TypeName) VALUES ('Essay'), ('Multiple-Choice');

INSERT INTO CategoryQuestion (CategoryName) VALUES ('Math'), ('Physics'), ('Chemistry'), ('Biology'), ('Literature'),
('History'), ('Geography'), ('English'), ('Computer Science'), ('Economics');

INSERT INTO Question (Content, CategoryID, TypeID, CreatorID)
VALUES ('What is the difference between a class and an object?', 1, 1, 11),
       ('Explain the concept of inheritance in programming.', 1, 1, 11),
       ('What are the benefits of using a database management system?', 3, 1, 11),
       ('Describe the OSI network model.', 4, 1, 11),
       ('What are the different stages of a project life cycle?', 5, 1, 13),
       ('Explain the concept of market segmentation.', 6, 1, 11),
       ('What is the sales funnel?', 7, 1, 11),
       ('Describe the recruitment process.', 8, 1, 11),
       ('What is the difference between debit and credit?', 9, 1, 11),
       ('What is the capital of France?', 10, 2, 11);

INSERT INTO Answer (Content, QuestionID, IsCorrect)
VALUES ('A class is a blueprint, while an object is an instance of that class.', 21, 1),
       ('Inheritance allows you to reuse code from a parent class.', 22, 1),
       ('Databases help organize and manage large amounts of data efficiently.', 23, 1),
       ('The OSI model defines seven layers of communication in a network.', 24, 1),
       ('There are typically five stages in a project life cycle: initiation, planning, execution, monitoring & control, and closure.', 25, 1),
       ('Market segmentation divides a market into smaller groups with similar needs or characteristics.', 26, 1),
       ('The sales funnel represents the journey of a potential customer towards a purchase.', 27, 1),
       ('The recruitment process involves attracting, screening, interviewing, and selecting candidates for a job opening.', 28, 1),
       ('Debit refers to a decrease in an asset account and credit refers to an increase in a liability or equity account.', 29, 1),
       ('Paris', 30, 1);

INSERT INTO Answer (Content, QuestionID, IsCorrect)
VALUES ('A class is a function, while an object is a variable.', 21, 0),
       ('Encapsulation is the concept of hiding data within a class.', 22, 0),
       ('Spreadsheets are a good alternative to databases for small datasets.', 23, 0),
       ('The OSI model has only four layers.', 24, 0),
       ('The five stages are planning, execution, monitoring, controlling, and closing.', 25, 0),
       ('Market research is the same as market segmentation.', 26, 0),
       ('A lead is someone who has shown interest in a product or service.', 27, 0),
       ('Onboarding is the process of integrating a new employee into the company.', 28, 0),
       ('A budget is a financial forecast of income and expenses.', 29, 0),
       ('London', 30, 0);

INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID)
VALUES ('DEV001', 'Introduction to Programming', 1, 60, 11),
       ('TEST001', 'Software Testing Fundamentals', 1, 90, 12),
       ('PM001', 'Project Management Basics', 5, 120, 14),
       ('MKT001', 'Marketing Principles', 6, 90, 17),
       ('HR001', 'Recruitment and Selection', 8, 120, 15);

INSERT INTO ExamQuestion (ExamID, QuestionID)
VALUES (11, 21), (11, 22), (12, 23), (12, 24), (13, 25), (14, 26), (14, 27), (15, 28), (15, 29);