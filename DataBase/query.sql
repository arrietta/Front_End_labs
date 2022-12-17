1)
create view stud as
select s.First_Name , s.Last_Name , s.age,s.Gender,e.Name,i.Rank  from student as s,instructor as i ,employee as e , advisor_group as a where i.ID =a.instructor_ID and e.id=i.id and  a.ID = s.advisor_group_ID ;
select * from stud;

2)select e.id ,e.name,age,Salary,Emp_Room from instructor as i join employee as e on e.ID = i.ID;

3)update employee as e set salary = salary +20000 where id = (select id from instructor as i where i.rank ='PHD' and e.id = i.id) and e.id !=5;

4)ALTER TABLE student ADD Email varchar(255);

5)ALTER TABLE student RENAME COLUMN student_house_Room to room;

6)start transaction;
update advisor_group set instructor_ID = 61 where instructor_ID = (select e.id from employee as e where age = (select max(age) from employee)limit 1) and id != 5 ;
delete from instructor where id = (select e.id from employee as e where age = (select max(age) from employee) )limit 1;
rollback;

7)select * from student where Admission_Year = 2020 order by gpa desc limit 5 ;

8)select advisor_group_ID,avg(gpa) from student where Admission_Year = 2020 group by advisor_group_ID ;

9)select Department_NAME,count(*) , i.Rank from instructor as i group by  Department_NAME,i.rank ;

10)create or replace view room as
select emp_room ,count(*) as persom_per_room from employee group by emp_room  order by count(*) ;
select count(persom_per_room) , persom_per_room from room group by persom_per_room;

11)start transaction ;
insert into student values(6540,'Nurhat','Gylym','2022',3.5,19,'Male',480000,null,24,null);
insert into payment values(62480,6540,480000,sysdate(),'SDU_account');
update student set balance = balance - 480000 where id = 6540;
select * from student where id = 6540;
commit;

12)CREATE DEFINER=`root`@`localhost` TRIGGER `student_AFTER_INSERT` AFTER INSERT ON `student` FOR EACH ROW BEGIN
update advisor_group set student_count = student_count+1 where id = new.advisor_group_ID;
END

13)CREATE DEFINER=`root`@`localhost` TRIGGER `student_AFTER_UPDATE` AFTER UPDATE ON `student` FOR EACH ROW BEGIN
	if new.student_house_Room != null then update student_house set person_count = person_count +1 where room = new.student_house_Room;
    end if;
END

14)CREATE DEFINER=`root`@`localhost` TRIGGER `instructor_AFTER_UPDATE` AFTER UPDATE ON `instructor` FOR EACH ROW BEGIN
	if new.Rank ='PHD' then update department set phd_num = 1 + phd_num where new.department_name = name;
    end if;
END

15)CREATE DEFINER=`root`@`localhost` TRIGGER `instructor_BEFORE_DELETE` BEFORE DELETE ON `instructor` FOR EACH ROW BEGIN
	if old.Rank ='PHD' then update department set phd_num = phd_num -1 where old.department_name = name;
    end if;
END

16)select Department_NAME,count(*) from enroll , section as s,course as c where s.id = Section_ID and s.Course_ID = c.id and c.Department_NAME ='Education and Humanities'group by Department_NAME
union
select Department_NAME,count(*) from enroll , section as s,course as c where s.id = Section_ID and s.Course_ID = c.id and c.Department_NAME ='Business School'group by Department_NAME;


17)select id,name,type,salary from employee where salary > 180000
except 
select id,name,type,salary from employee where salary > 300000;

18)select advisor_group_id from student where club_name ='Sana IQ'
INTERSECT
select advisor_group_id from student where club_name ='Event'; 

19)select Author_ID,count(*) from book group by Author_ID order by count(*) desc;

20)select sum(Student_count),c.name from section join course as c on c.id =course_id group by Course_ID ;

21)CREATE DEFINER=`root`@`localhost` TRIGGER `student_BEFORE_DELETE` BEFORE DELETE ON `student` FOR EACH ROW BEGIN
update advisor_group set student_count = student_count-1 where id = old.advisor_group_ID;
END
22)CREATE DEFINER=`root`@`localhost` TRIGGER `enroll_AFTER_INSERT` AFTER INSERT ON `enroll` FOR EACH ROW BEGIN
	update section set Student_count = Student_count +1 where new.Section_ID = ID;
END
23)CREATE DEFINER=`root`@`localhost` TRIGGER `employee_BEFORE_DELETE` BEFORE DELETE ON `employee` FOR EACH ROW BEGIN
	delete from instructor where old.id = id;
END
24)CREATE DEFINER=`root`@`localhost` TRIGGER `employee_AFTER_INSERT` AFTER INSERT ON `employee` FOR EACH ROW BEGIN
if new.type = 'Instructor' then insert into Instructor values(new.ID ,new.Special,'Master');
    	ELSEIF new.Type = 'Administration' then insert into Administration values(new.ID ,new.Special);
        end if;
END
