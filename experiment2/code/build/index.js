#!/usr/bin/env node

/**
 * Created by rccoder on 2016/5/12.
 */
'use strict';

var mysql = require('mysql');
var argv = require('yargs').argv;

var PNO = undefined,
    PNAME = undefined,
    ENAME = undefined,
    DNAME = undefined,
    SALARY = undefined,
    ESSN = undefined,
    PNO1 = undefined,
    PNO2 = undefined,
    N = undefined,
    HOURS = undefined;

var config = {
    host: '127.0.0.1',
    user: 'root',
    password: '',
    port: '3306',
    database: 'COMPANY'
};

var rebuild_query = function rebuild_query() {
    var query_options = [

    // --- 1. 参加了项目编号为%PNO%的项目的员工号
    'select distinct ESSN from WORKS_ON where PNO = "' + PNO + '";',

    // --- 2. 参加了项目名为%PNAME%的员工名字
    'select distinct ENAME from EMPLOYEE where ESSN in (select distinct ESSN from WORKS_ON natural join PROJECT where PNAME = "' + PNAME + '");',

    // --- 3. 在%DNAME%工作的所有工作人员的名字和地址
    'select distinct ENAME, ADDRESS from EMPLOYEE natural join DEPARTMENT where DNAME = "' + DNAME + '";',

    // --- 4. 在%DNAME%工作且工资低于%SALARY%元的员工名字和地址
    'select distinct ENAME, ADDRESS from EMPLOYEE natural join DEPARTMENT where DNAME = "' + DNAME + '" and SALARY < ' + SALARY + ';',

    // --- 5. 没有参加项目编号为%PNO%的项目的员工姓名
    'select distinct ENAME from  EMPLOYEE where ESSN not in (select ESSN from WORKS_ON where PNO = "' + PNO + '");',

    // --- 6. 由%ENAME%领导的工作人员的姓名和所在部门的名字
    'select distinct ENAME, DNAME from EMPLOYEE natural join DEPARTMENT where SUPERSSN = (select ESSN from EMPLOYEE where ENAME = "' + ENAME + '");',

    // --- 7. 至少参加了项目编号为%PNO1%和%PNO2%的项目的员工号
    'select ESSN from WORKS_ON where PNO = "' + PNO1 + '" and ESSN in (select ESSN from WORKS_ON where PNO = "' + PNO2 + '");',

    // --- 8. 员工平均工资低于%SALARY%元的部门名称
    'select DNAME from DEPARTMENT natural join EMPLOYEE group by DNO having avg(SALARY) < ' + SALARY + ';',

    // --- 9. 至少参与了%N%个项目且工作总时间不超过%HOURS%小时的员工名字
    'select distinct ENAME from EMPLOYEE natural join WORKS_ON group by ESSN having count(distinct PNO) >= ' + N + ' and sum(HOURS) <= ' + HOURS + ';'];
    return query_options;
};

var connection = mysql.createConnection(config);

var handle_query = function handle_query(q, p) {
    PNO = p.PNO;
    PNAME = p.PNAME;
    ENAME = p.ENAME;
    DNAME = p.DNAME;
    SALARY = p.SALARY;
    ESSN = p.ESSN;
    PNO1 = p.PNO1;
    PNO2 = p.PNO2;
    N = p.N;
    HOURS = p.HOURS;

    return rebuild_query()[q];
};

var app = function app(argv) {

    var q = argv.q - 1;

    var p = JSON.parse(argv.p);

    connection.connect(function (err) {
        if (err) {
            console.log('CAN NOT CONNECTION: ' + err);
        } else {
            console.log('Connected the SQL');
        }
    });

    var queryItem = handle_query(q, p);

    console.log('SQL: ' + queryItem);
    connection.query(queryItem, function (err, rows, fields) {
        if (err) {
            console.log('SQL Query Error: ' + err);
            return;
        }
        console.log('The Result is: ');
        console.log(rows);
    });

    connection.end(function (err) {
        if (err) {
            return;
        }
        console.log('Connection End');
    });
};

// node build/index.js -q=1 -p="{\"PNO\": \"1\", \"qq\": \"22\"}"
// node build/index.js -q=1 -p="{\"PNO\": \"P1\"}"
app(argv);