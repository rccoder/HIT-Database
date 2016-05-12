# 实验二: 使用C(Node)语言操作MySQL数据库

### SQL 语句

``` sql
--- 1. 参加了项目编号为%PNO%的项目的员工号
select distinct ESSN from WORKS_ON where PNO = 'XXX';

--- 2. 参加了项目名为%PNAME%的员工名字
select distinct ENAME from EMPLOYEE where ESSN in (select distinct ESSN from WORKS_ON natural join PROJECT wehere PNAME = 'xxx');

--- 3. 在%DNAME%工作的所有工作人员的名字和地址
select distinct ENAME, ADDRESS from EMPLOYEE natural join DEPARTMENT where DNAME = 'xxxxx';

--- 4. 在%DNAME%工作且工资低于%SALARY%元的员工名字和地址
select distinct ENAME, ADDRESS from EMPLOYEE natural join DEPARTMENT where DNAME = 'xxx' and SALARY < 'xxx';

--- 5. 没有参加项目编号为%PNO%的项目的员工姓名
select distinct ENAME from  EMPLOYEE where ESSN not in (select ESSN from WORKS_ON where PNO = 'xxx');

--- 6. 由%ENAME%领导的工作人员的姓名和所在部门的名字
select distinct ENAME, DNAME from EMPLOYEE natural join DEPARTMENT where SUPERSSN = (select ESSN from EMPLOYEE where ENAME = "xxx");

--- 7. 至少参加了项目编号为%PNO1%和%PNO2%的项目的员工号
select ESSN from WORKS_ON where PNO = "xxx" and ESSN in (select ESSN from WORKS_ON where PNO = "xxx");

--- 8. 员工平均工资低于%SALARY%元的部门名称
select DNAME from DEPARTMENT natural join EMPLOYEE group by DNO having avg(SALARY) < "xxx";

--- 9. 至少参与了%N%个项目且工作总时间不超过%HOURS%小时的员工名字
select distinct ENAME from EMPLOYEE natural join WORKS_ON group by ESSN having count(distinct PNO) >= "xx" and sum(HOURS) <= "xx";

```
