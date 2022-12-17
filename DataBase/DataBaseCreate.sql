
Table `Emp_room`

CREATE TABLE IF NOT EXISTS `Emp_room` (
  `Room` INT NOT NULL,
  `Block_Name` VARCHAR(2) NOT NULL,
  `Floor` INT NOT NULL,
  PRIMARY KEY (`Room`))




Table `employee`

CREATE TABLE IF NOT EXISTS `employee` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Age` VARCHAR(45) NOT NULL,
  `Salary` VARCHAR(45) NOT NULL,
  `Special` VARCHAR(45) NULL,
  `Emp_Room` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_employee_Emp_room1_idx` (`Emp_Room` ASC) VISIBLE,
  CONSTRAINT `fk_employee_Emp_room1`
    FOREIGN KEY (`Emp_Room`)
    REFERENCES `Emp_room` (`Room`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `administration`

CREATE TABLE IF NOT EXISTS `administration` (
  `Employee_ID` INT NOT NULL,
  `Post` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `fk_administration_employee1`
    FOREIGN KEY (`Employee_ID`)
    REFERENCES `employee` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `activity_admin`

CREATE TABLE IF NOT EXISTS `activity_admin` (
  `administration_Employee_ID` INT NOT NULL,
  PRIMARY KEY (`administration_Employee_ID`),
  CONSTRAINT `fk_activity_admin_administration1`
    FOREIGN KEY (`administration_Employee_ID`)
    REFERENCES `administration` (`Employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `student_house`

CREATE TABLE IF NOT EXISTS `student_house` (
  `Room` INT NOT NULL,
  `Person_count` INT NULL,
  PRIMARY KEY (`Room`),
  UNIQUE INDEX `Room_UNIQUE` (`Room` ASC) VISIBLE)




Table `department`

CREATE TABLE IF NOT EXISTS `department` (
  `NAME` VARCHAR(50) NOT NULL,
  `PHD_NUM` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`NAME`))




Table `instructor`

CREATE TABLE IF NOT EXISTS `instructor` (
  `ID` INT NOT NULL,
  `Department_NAME` VARCHAR(50) NOT NULL,
  `Rank` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Instructor_Department1_idx` (`Department_NAME` ASC) VISIBLE,
  INDEX `fk_Instructor_Employee1_idx` (`ID` ASC) VISIBLE,
  CONSTRAINT `fk_Instructor_Department1`
    FOREIGN KEY (`Department_NAME`)
    REFERENCES `department` (`NAME`),
  CONSTRAINT `fk_instructor_employee1`
    FOREIGN KEY (`ID`)
    REFERENCES `employee` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `advisor_group`

CREATE TABLE IF NOT EXISTS `advisor_group` (
  `ID` INT NOT NULL,
  `instructor_ID` INT NOT NULL,
  `Student_count` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_advisor_group_instructor1_idx` (`instructor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_advisor_group_instructor1`
    FOREIGN KEY (`instructor_ID`)
    REFERENCES `instructor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `Club_Room`

CREATE TABLE IF NOT EXISTS `Club_Room` (
  `Room` INT NOT NULL,
  `Block` VARCHAR(45) NOT NULL,
  `Floor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Room`))




Table `club`

CREATE TABLE IF NOT EXISTS `club` (
  `Club_Name` VARCHAR(50) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `Club_Room` INT NOT NULL,
  PRIMARY KEY (`Club_Name`),
  INDEX `fk_club_Club_Room1_idx` (`Club_Room` ASC) VISIBLE,
  CONSTRAINT `fk_club_Club_Room1`
    FOREIGN KEY (`Club_Room`)
    REFERENCES `Club_Room` (`Room`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `student`

CREATE TABLE IF NOT EXISTS `student` (
  `ID` INT NOT NULL,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Admission_Year` VARCHAR(45) NOT NULL,
  `GPA` INT NOT NULL,
  `Age` INT NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `Balance` INT NOT NULL,
  `student_house_Room` INT NULL,
  `advisor_group_ID` INT NOT NULL,
  `Club_Name` VARCHAR(50) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_student_student_house1_idx` (`student_house_Room` ASC) VISIBLE,
  INDEX `fk_student_advisor_group1_idx` (`advisor_group_ID` ASC) VISIBLE,
  INDEX `fk_student_club1_idx` (`Club_Name` ASC) VISIBLE,
  CONSTRAINT `fk_student_student_house1`
    FOREIGN KEY (`student_house_Room`)
    REFERENCES `student_house` (`Room`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_advisor_group1`
    FOREIGN KEY (`advisor_group_ID`)
    REFERENCES `advisor_group` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_club1`
    FOREIGN KEY (`Club_Name`)
    REFERENCES `club` (`Club_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `activity_helpers`

CREATE TABLE IF NOT EXISTS `activity_helpers` (
  `Club_Name` VARCHAR(50) NOT NULL,
  `Student_ID` INT NOT NULL,
  PRIMARY KEY (`Club_Name`),
  CONSTRAINT `fk_activity_helpers_student1`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `student` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_helpers_club1`
    FOREIGN KEY (`Club_Name`)
    REFERENCES `club` (`Club_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `Activity`

CREATE TABLE IF NOT EXISTS `Activity` (
  `ID` INT NOT NULL,
  `admin__ID` INT NOT NULL,
  `Club_Name` VARCHAR(50) NOT NULL,
  `Budget` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Activity_activity_admin1_idx` (`admin__ID` ASC) VISIBLE,
  INDEX `fk_Activity_activity_helpers1_idx` (`Club_Name` ASC) VISIBLE,
  CONSTRAINT `fk_Activity_activity_admin1`
    FOREIGN KEY (`admin__ID`)
    REFERENCES `activity_admin` (`administration_Employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Activity_activity_helpers1`
    FOREIGN KEY (`Club_Name`)
    REFERENCES `activity_helpers` (`Club_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `Author`

CREATE TABLE IF NOT EXISTS `Author` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))




Table `book`

CREATE TABLE IF NOT EXISTS `book` (
  `ID` INT NOT NULL,
  `Author_ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_book_Author1_idx` (`Author_ID` ASC) VISIBLE,
  CONSTRAINT `fk_book_Author1`
    FOREIGN KEY (`Author_ID`)
    REFERENCES `Author` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `course`

CREATE TABLE IF NOT EXISTS `course` (
  `ID` INT NOT NULL,
  `Department_NAME` VARCHAR(50) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Course_Department1_idx` (`Department_NAME` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Department1`
    FOREIGN KEY (`Department_NAME`)
    REFERENCES `department` (`NAME`))




Table `section`

CREATE TABLE IF NOT EXISTS `section` (
  `ID` INT NOT NULL,
  `Course_ID` INT NOT NULL,
  `Instructor_ID` INT NOT NULL,
  `Student count` INT NOT NULL,
  `Room` INT NOT NULL,
  `Start_time` VARCHAR(45) NOT NULL,
  `End_time` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Section_Instructor1_idx` (`Instructor_ID` ASC) VISIBLE,
  INDEX `fk_Section_Course1_idx` (`Course_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Section_Course1`
    FOREIGN KEY (`Course_ID`)
    REFERENCES `course` (`ID`),
  CONSTRAINT `fk_Section_Instructor1`
    FOREIGN KEY (`Instructor_ID`)
    REFERENCES `instructor` (`ID`))




Table `enroll`

CREATE TABLE IF NOT EXISTS `enroll` (
  `Grade` INT NOT NULL,
  `Section_ID` INT NOT NULL,
  `Student_ID` INT NOT NULL,
  INDEX `fk_Enroll_Section1_idx` (`Section_ID` ASC) INVISIBLE,
  INDEX `fk_Enroll_Student1_idx` (`Student_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Enroll_Section1`
    FOREIGN KEY (`Section_ID`)
    REFERENCES `section` (`ID`),
  CONSTRAINT `fk_Enroll_Student1`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `student` (`ID`))




Table `lib_card`

CREATE TABLE IF NOT EXISTS `lib_card` (
  `ID` INT NOT NULL,
  `Take_Data` DATE NOT NULL,
  `Return_Date` DATE NULL,
  `book_ID` INT NOT NULL,
  `student_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_lib_card_book1_idx` (`book_ID` ASC) VISIBLE,
  INDEX `fk_lib_card_student1_idx` (`student_ID` ASC) VISIBLE,
  CONSTRAINT `fk_lib_card_book1`
    FOREIGN KEY (`book_ID`)
    REFERENCES `book` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lib_card_student1`
    FOREIGN KEY (`student_ID`)
    REFERENCES `student` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




Table `Payment`

CREATE TABLE IF NOT EXISTS `Payment` (
  `ID` INT NOT NULL,
  `student_ID` INT NOT NULL,
  `Sum` INT NOT NULL,
  `Data` DATE NOT NULL,
  `University_account` VARCHAR(45) NOT NULL,
  INDEX `fk_Payment_student1_idx` (`student_ID` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Payment_student1`
    FOREIGN KEY (`student_ID`)
    REFERENCES `student` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

