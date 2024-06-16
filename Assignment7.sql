--Problem Statement:

--Consider yourself to be Sam and you have been given the below tasks to complete using the Table – STUDIES, SOFTWARE and PROGRAMMER

--Tasks To Be Performed:

--1. Find out the selling cost average for packages developed in Pascal.

select avg(SCost) as Avg_SellingCost 
from Software
where DEVELOPIN = 'Pascal' 

--2. Display the names and ages of all programmers.

Select PNAME, datediff( YY, DOB, getdate()) as Age from Programmer

--3. Display the names of those who have done the DAP Course.

select PNAME, COURSE 
from Studies 
where COURSE = 'DAP' 

--4. Display the names and date of birth of all programmers born in January.

Select DOB, pname
From Programmer
Where  month(dob) = 1
  
--5. What is the highest number of copies sold by a package?

select max(Sold) as Max_No_of_Sale from Software

--6. Display lowest course fee.

select min(COURSE_FEE) as Course_Fee from Studies

--7. How many programmers have done the PGDCA Course?

select count(PNAME) as Count_of_Programmers 
from Studies
where course = 'PGDCA'

--8. How much revenue has been earned through sales of packages developed in C?

select sum(Sold*SCOST) AS Total_Sales 
from Software
where developin = 'C'

--9. Display the details of the software developed by Ramesh.

select * 
from Software
where pname = 'Ramesh'

--10. How many programmers studied at Sabhari?

select count(PName) as No_of_programmers 
from studies
where institute = 'Sabhari'

--11. Display details of packages whose sales crossed the 2000 mark.

select * 
from software
where (scost*sold) > 2000

--12. Display the details of packages for which development costs have been recovered.

select * 
from software
where (scost*sold) >= dcost

--13. What is the cost of the costliest software development in Basic?

select max(Dcost) as costliest from software

--14. How many packages have been developed in dBase?

select count(title) as Packages 
from software
where developin = 'Dbase'

--15. How many programmers studied in Pragathi?

select count(Pname) as No_of_programmers 
from studies
where INSTITUTE = 'Pragathi'

--16. How many programmers paid 5000 to 10000 for their course?

select count(Pname) as No_of_students 
from studies
where COURSE_FEE between 5000 and 10000

--17. What is the average course fee?

select AVG(Course_fee) as Avg_fees from Studies

--18. Display the details of the programmers knowing C.

select * 
from Programmer
where PROF1 = 'C' or PROF2 = 'C'

--19. How many programmers know either COBOL or Pascal?

select count(pname) as No_of_programmers 
from Programmer
where PROF1 = 'COBOL' or PROF1 = 'Pascal' or PROF2 = 'Cobal' or PROF2 = 'Pascal'

--20. How many programmers don’t know Pascal and C?

select count(pname) as No_Of_Programmers
from Programmer
where PROF1 != 'C' and PROF2 != 'Pascal' and PROF1 != 'Pascal' and PROF2 != 'C'

--21. How old is the oldest male programmer?

select max (datediff( YY, DOB, getdate())) as Age 
from Programmer
where gender = 'M'

--22. What is the average age of female programmers?

select avg (datediff( YY, DOB, getdate())) as Age 
from Programmer
where gender = 'F'

--23. Calculate the experience in years for each programmer and display with their names in descending order.

select pname, datediff( YY, DOJ, getdate()) as Experience 
from Programmer
order by pname desc

--24. Who are the programmers who celebrate their birthdays during the current month?

select pname, dob, datediff( YY, DOB, getdate()) as Age 
from Programmer
where month(dob) = 11

--25. How many female programmers are there?

select count(gender) as Female_programmeres 
from Programmer
where gender = 'F'

--26. What are the languages studied by male programmers?

select PROF1, PROF2 from Programmer 
where gender = 'm'

--27. What is the average salary?

select avg(salary) from Programmer

--28. How many people draw a salary between 2000 to 4000?

select count(*) 
from programmer 
where salary between 2000 and 4000

--29. Display the details of those who don’t know Clipper, COBOL or Pascal.

select * 
from Programmer 
where PROF1 != 'Clipper' and PROF1 != 'cobol' and PROF1 != 'pascal' and PROF2 != 'Clipper' and PROF2 != 'Cobol' and PROF2 != 'pascal'

--30. Display the cost of packages developed by each programmer.

select pname, sum(scost) as cost_of_packages
from Software 
group by PNAME 

--31. Display the sales value of the packages developed by each programmer.

select pname, sum(scost) as sales_value_of_packages
from Software
group by PNAME

--32. Display the number of packages sold by each programmer.

select pname, sum(sold) as number_of_packages
from Software
group by PNAME

--33. Display the sales cost of the packages developed by each programmer language wise.

select developin as Language, sum(scost) 
from Software
group by DEVELOPIN

--34. Display each language name with the average development cost, average selling cost and average price per copy.

select developin as language, avg(dcost) as avg_dcost, avg(scost) as avg_scost, avg(scost) as avg_price_per_copy
from Software
group by DEVELOPIN

--35. Display each programmer’s name and the costliest and cheapest packages developed by him or her.

select pname, min(dcost) as cheepest, max(dcost) as costliest
from Software
group by PNAME

--36. Display each institute’s name with the number of courses and the average cost per course.

select institute, count(course) as no_of_courses, avg(COURSE_FEE) as avg_fee
from Studies
group by INSTITUTE

--37. Display each institute’s name with the number of students.

select institute, count(pname) as no_of_students
from Studies
group by INSTITUTE

--38. Display names of male and female programmers along with their gender.

select pname, gender from Programmer

--39. Display the name of programmers and their packages.

select pname, salary from Programmer

--40. Display the number of packages in each language except C and C++.

select developin, count(title) as no_of_packages
from software
group by DEVELOPIN having DEVELOPIN != 'C' and DEVELOPIN != 'C++'

--41. Display the number of packages in each language for which development cost is less than 1000.

select developin, count(title) as no_of_packages
from Software
where DCOST < 1000
group by DEVELOPIN

--42. Display the average difference between SCOST and DCOST for each package.

select title as package, avg(scost - dcost) as avg_difference
from Software
group by TITLE

--43. Display the total SCOST, DCOST and the amount to be recovered for each programmer whose cost has not yet been recovered.

select pname, sum(scost) as selling_cost, sum(dcost) as developin_cost, sum(dcost - (scost * sold)) as amount_to_be_recovered 
from software
group by PNAME having sum(DCOST) > sum(SCOST * SOLD)

--44. Display the highest, lowest and average salaries for those earning more than 2000.

select min(Salary) as lowest, max(salary) as highest, avg(salary) as average
from Programmer
where SALARY > 2000

--45. Who is the highest paid C programmer?

select PNAME, SALARY 
from Programmer 
where SALARY = (select max(SALARY) 
                from Programmer
                where PROF1 = 'C' or PROF2 = 'C')

--46. Who is the highest paid female COBOL programmer?

select PNAME, SALARY 
from Programmer 
where SALARY = (select max(SALARY) 
                from Programmer
                where PROF1 = 'Cobol' or PROF2 = 'Cobol')
and GENDER = 'F'

--47. Display the names of the highest paid programmers for each language.

With CTC as (
             select PNAME, SALARY, PROF1 as PROF from programmer
             union 
             select PNAME, SALARY, PROF2 from programmer
             )
select p1.PNAME, p1.PROF, p1.SALARY
from CTC as p1
LEFT JOIN CTC as 
p2 on p1.PROF = p2.PROF and p1.SALARY < p2.SALARY
where p2.PNAME is null

--48. Who is the least experienced programmer?

select pname from Programmer
where DOJ = (select max(DOJ) from Programmer)

--49. Who is the most experienced male programmer knowing PASCAL?

select PNAME from Programmer
where GENDER = 'M' and DOJ = (
                              select min(DOJ) from Programmer
                              where PROF1 = 'pascal' or PROF2 = 'pascal'
							  )

--50. Which language is known by only one programmer?

select PROF1 from PROGRAMMER
group by PROF1
having PROF1 not in (select PROF2 from PROGRAMMER)
and count(PROF1)=1
union
select PROF2 from PROGRAMMER
group by  PROF2
having PROF2 not in (select PROF1 from PROGRAMMER)
and count(PROF2)=1

--51. Who is the above programmer referred in 50?

create table Name(PROF varchar(20))

Select * from Name

insert into Name
select PROF1 from programmer 
group by PROF1 having
PROF1 not in (select PROF2 from programmer) 
ad count(PROF1)=1
union
select PROF2 from programmer 
group by  PROF2 having
PROF2 not in (select PROF1 from programmer) 
and count (PROF2)=1

select PNAME, PROF from programmer 
inner join name on
PROF=PROF1 or PROF=PROF2

--52. Who is the youngest programmer knowing dBase?

select pname from Programmer 
where DOB = (
             select max(DOB)
			 from Programmer 
			 where PROF1 = 'dbase' or PROF2 = 'dbase')

--53. Which female programmer earning more than 3000 does not know C, C++, Oracle or dBase?

SELECT * FROM PROGRAMMER
WHERE GENDER = 'F' AND SALARY >3000 AND 
prof1 != 'c' and prof1 != 'c++' and prof1 != 'oracle' and prof1 != 'dbase' and prof2 != 'c' and prof2 != 'c++' and prof2 != 'oracle' and prof2 != 'dbase'

--54. Which institute has the most number of students?

select count(pname) as No_of_students, institute from studies
group by institute

--55. What is the costliest course?

SELECT COURSE, COURSE_FEE
FROM STUDIES
WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES)

--56. Which course has been done by the most number of students?

select max(course) as most_opted_course from Studies

--57. Which institute conducts the costliest course?

SELECT institute, COURSE, COURSE_FEE
FROM STUDIES 
WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES)

--58. Display the name of the institute and the course which has below average course fee.

select institute, course, COURSE_FEE
from studies
where COURSE_FEE < (select avg(course_fee) from Studies)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the average fees

select course, course_fee
from Studies
where COURSE_FEE > (select avg(COURSE_FEE) - 1000 from Studies ) 
      and COURSE_FEE < (select avg(COURSE_FEE) + 1000 from Studies)

--60. Which package has the highest development cost?

select title, dcost 
from Software 
where dcost = (select max(dcost) from Software)

--61. Which course has below average number of students?

create table numstu(stream varchar(20), number INT)

insert into numstu
select COURSE, count(PNAME) from studies group by COURSE
select stream ,number from numstu where number <=(select AVG(number) from numstu)

--62. Which package has the lowest selling cost?

select title, scost
from software
where scost = (select min(SCOST) from Software)

--63. Who developed the package that has sold the least number of copies?

select pname, title, sold
from Software
where SOLD = (select min(SOLD) from Software)

--64. Which language has been used to develop the package which has the highest sales amount?

select developin as language, scost 
from Software
where SCOST = (select max(scost) from Software)

--65. How many copies of the package that has the least difference between development and selling cost were sold?

select title, sold
from Software
where TITLE = (select TITLE 
               from Software
               where dcost - scost = (select min (dcost - scost) from Software))

--66. Which is the costliest package developed in Pascal?

select title from Software
where DCOST = (select max(DCOST) from Software
               where DEVELOPIN = 'Pascal')

--67. Which language was used to develop the most number of packages?

select developin as language 
from Software
group by developin 
having DEVELOPIN = (
                    select max(DEVELOPIN) 
                    from Software
					)

--68. Which programmer has developed the highest number of packages?

select pname 
from Software
group by PNAME
having PNAME = (
                select max(PNAME)
				from Software
				)

--69. Who is the author of the costliest package?

select pname, title 
from Software
where DCOST = (
               select max(DCOST)
			   from Software
			   )

--70. Display the names of the packages which have sold less than the average number of copies.

select title, SOLD 
from Software
where SOLD < (
              select avg(SOLD)
			  from Software
			  )

--71. Who are the authors of the packages which have recovered more than double the development cost?

select distinct pname 
from Software
where sold * SCOST > 2 * DCOST

--72. Display the programmer names and the cheapest packages developed by them in each language.

select pname, title
from Software
where DCOST in (
                select min(DCOST) from Software
				group by DEVELOPIN
				)

--73. Display the language used by each programmer to develop the highest selling and lowest selling package.

select pname, developin from Software where sold in (select max(SOLD) from Software group by PNAME)
union
select pname, developin from Software where SOLD in (select min(SOLD) from Software group by PNAME)

--74. Who is the youngest male programmer born in 1965?

select pname, datediff( YY, DOB, getdate()) as Age from Programmer
where DOB = (
             select max(DOB)
			 from Programmer
			 where  YEAR(DOB) = 1965 and GENDER = 'M'
			 )

--75. Who is the oldest female programmer who joined in 1992?

select pname, datediff( YY, DOB, getdate()) as Age from Programmer
where DOB = (
             select min(DOB)
			 from Programmer
			 where  YEAR(DOJ) = 1992 and GENDER = 'F'
			 )

--76. In which year was the most number of programmers born?

create table TEMP (YOB int, CNT int)

insert into TEMP
select YEAR(DOB) as YEAR ,COUNT(pname) from programmer 
group by YEAR(DOB)

select YOB, CNT from TEMP where CNT= (select max(CNT) from TEMP)

--77. In which month did the most number of programmers join?

create table joining (MOJ int, CNT int)

insert into joining
select month(DOJ),count(pname) from programmer group by month(DOJ)

select MOJ, CNT from joining where CNT= (select max(CNT) from joining)

--78. In which language are most of the programmer’s proficient?
create table langp (PR varchar(20), CNT int)
create table langcnt (PRs varchar(20), CNTs int)

insert into  langp
select PROF1, count(pname) from programmer group by PROF1 
union all
select PROF2, count(pname) from programmer group by PROF2

insert into langcnt
select PR, sum(CNT) from lang group by PR

select PRs, CNTs FROM langcnt where CNTs = (select max(CNTs) from langcnt)

--79. Who are the male programmers earning below the average salary of female programmers?

select pname 
From Programmer 
Where GENDER = 'M'and SALARY < (
                                   select (AVG (SALARY)) 
								   from PROGRAMMER 
								   where GENDER = 'F'
								   )

--80. Who are the female programmers earning more than the highest paid?

select pname 
from Programmer
where gender = 'F' and SALARY > (
                                    select max(SALARY)
									from Programmer
									where GENDER = 'M')

--81. Which language has been stated as the proficiency by most of the programmers?

select prof1 
from Programmer 
group by PROF1 having PROF1 = (
                               select max(PROF1) 
							   from Programmer
							   )
union
select prof2 
from Programmer 
group by PROF2 having PROF2 = (
                               select max(PROF2) 
							   from Programmer
							   )

--82. Display the details of those who are drawing the same salary.

select * from Programmer
where SALARY in (
                 select SALARY
				 from Programmer
				 group by SALARY having count(SALARY) > 1
				 )
              
--83. Display the details of the software developed by the male programmers earning more than 3000.

select * from programmer p, Software s
where p.PNAME = s.PNAME and SALARY > 3000 and GENDER = 'M'

--84. Display the details of the packages developed in Pascal by the female programmers.

select * from Programmer p, Software s
where p.PNAME = s.PNAME and GENDER = 'F' and DEVELOPIN = 'Pascal'

--85. Display the details of the programmers who joined before 1990.

select * from Programmer where year (DOJ) < 1990

--86. Display the details of the software developed in C by the female programmers at Pragathi.

select s.* from Software s, Programmer p, Studies su
where s.PNAME = su.PNAME and p.PNAME = s.PNAME and GENDER = 'F' and DEVELOPIN = 'C' and INSTITUTE = 'Pragathi'

--87. Display the number of packages, number of copies sold and sales value of each programmer institute wise.

select su.institute, count (s.developin) as developin, count (s.sold) as Sold, sum(s.sold*s.scost) as sales 
from software s, studies su
where s.pname = su.pname group by su.institute

--88. Display the details of the software developed in dBase by male programmers who belong to the institute in which the most number of programmers studied.

create table INST (INS varchar(20), CNT int)

insert into INST
select INSTITUTE, count(PNAME) from studies group by INSTITUTE

select distinct SW.* from software as SW, programmer as PG, studies as ST, INST
where DEVELOPIN = 'DBASE' and GENDER = 'M' and SW.PNAME = PG.PNAME 
and INSTITUTE = INS and CNT = (select max(CNT) from INST)

--89. Display the details of the software developed by the male programmers born before 1965 and female programmers born after 1975.

SELECT S.*, YEAR(DOB),GENDER FROM Programmer p,Software s 
WHERE s.PNAME=p.PNAME AND 
((GENDER='M' AND YEAR(DOB)<1965) OR (GENDER='F' AND YEAR(DOB)>1975))

--90. Display the details of the software that has been developed in the language which is neither the first nor the second proficiency of the programmers.

select s.* from programmer p,software s
where s.pname = p.pname and (developin != prof1 and developin != prof2)

--91. Display the details of the software developed by the male students at Sabhari.

select s.* from software s,studies su,programmer p 
where s.pname = su.pname and p.pname = s.pname and gender = 'm' and institute = 'Sabhari'

--92. Display the names of the programmers who have not developed any packages.

select pname from programmer
where pname not in(select pname from software)

--93. What is the total cost of the software developed by the programmers of Apple?

select sum(scost) as total_cost from software s,studies su
where s.pname=su.pname and institute = 'apple'

--94. Who are the programmers who joined on the same day?

select a.pname, a.doj from programmer a, programmer b
where a.doj = b.doj and a.pname != b.pname

--95. Who are the programmers who have the same Prof2?

select distinct(a.pname), a.prof2 from programmer a, programmer b
where a.prof2 = b.prof2 and a.pname != b.pname

--96. Display the total sales value of the software institute wise.

select su.institute , sum(s.sold * s.scost) 
from software s, studies su
where su.pname = s.pname 
group by su.institute

--97. In which institute does the person who developed the costliest package study?

select institute from software s,studies su
where s.pname = su.pname 
group by institute, dcost 
having dcost = 
              (select max(dcost) 
			  from software
			  )

--98. Which language listed in Prof1, Prof2 has not been used to develop any package?

select prof1 from programmer where prof1 not in(select developin from software) 
union
select prof2 from programmer where prof2 not in(select developin from software)

--99. How much does the person who developed the highest selling package earn and what course did he/she undergo?

select p.pname, p.salary, su.course 
from programmer p,software s, studies su
where p.pname = s.pname and s.pname = su.pname and scost = (
                                                            select max(scost) 
															from software
															)

--100. What is the average salary for those whose software sales is more than 50,000?

select avg(salary) from programmer p, software s
where p.pname = s.pname and sold * scost > 50000

--101. How many packages were developed by students who studied in institutes that charge the lowest course fee?

select s.pname, count(title) as packages from software s,studies st
where s.pname = st.pname group by s.pname, COURSE_FEE having min(COURSE_FEE) = (select min(COURSE_FEE) from studies) 

--102. How many packages were developed by the person who developed the cheapest package?

select count(developin) from programmer p,software s
where s .pname = p.pname group by developin having min(dcost) = (select min(dcost) from software)

--103. How many packages were developed by female programmers earning more than the highest paid male programmer?

select count(developin) from programmer p,software s
where s.pname = p.pname and gender ='f' and salary > (select max(salary) from programmer p,software s
where s.pname = p.pname and gender ='m')

--104. How many packages are developed by the most experienced programmers from BDPS?

select count(*) from software s,programmer p
where p.pname = s.pname 
group by doj having min(doj) = (select min(doj)
from studies st,programmer p, software s
where p.pname = s.pname and st.pname = p.pname and (institute='bdps'))

--105. List the programmers (from the software table) and the institutes they studied at.

select pname, institute from studies
where pname in (select pname from software)

--106. List each PROF with the number of programmers having that PROF and the number of the packages in that PROF.

--107. List the programmer names (from the programmer table) and the number of packages each has developed.

select s.pname, count(developin) from programmer p1,software s
where p1.pname = s.pname group by s.pname
---------------------------------------------------------------------------------------------------------------------------------------