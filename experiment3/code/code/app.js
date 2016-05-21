var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var mysql = require('mysql');

var routes = require('./routes/index');
var users = require('./routes/users');

var app = express();

var config = {
    host: '127.0.0.1',
    user: 'root',
    password: '',
    port: '3306',
    database: 'COMPANY'
};

var connection = mysql.createConnection(config);

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', function(req, res, next) {
    res.render('index', {
        title: 'Express'
    });
})

app.get('/crud', function(req, res, next) {
    res.render('crud', {});
})
app.post('/test1', function(req, res) {
    var pno = req.body.pno;
    console.log(pno)
    var sql = `select distinct ESSN from WORKS_ON where PNO = "${pno}";`;
    console.log(sql);
    connection.query(sql, function(err, rows, fields) {
        console.log(rows)
        res.json(rows);
    });
});


app.post('/test2', function(req, res) {
    var pname = req.body.pname;
    console.log(pname)
    var sql = `select distinct ENAME from EMPLOYEE where ESSN in (select distinct ESSN from WORKS_ON natural join PROJECT where PNAME = "${pname}");`;
    console.log(sql);
    connection.query(sql, function(err, rows, fields) {
        console.log(rows)
        res.json(rows);
    });
});

app.post('/test3', function(req, res) {
    var dname = req.body.dname;
    console.log(dname)
    var sql = `select distinct ENAME, ADDRESS from EMPLOYEE natural join DEPARTMENT where DNAME = "${dname}";`;
    console.log(sql);
    connection.query(sql, function(err, rows, fields) {
        console.log(rows)
        res.json(rows);
    });
});

app.post('/test4', function(req, res) {
    var n = req.body.n;
    var hours = req.body.hours;
    console.log(n);
    console.log(hours);
    var sql = `select distinct ENAME from EMPLOYEE natural join WORKS_ON group by ESSN having count(distinct PNO) >= ${n} and sum(HOURS) <= ${hours};`;
    console.log(sql);
    connection.query(sql, function(err, rows, fields) {
        console.log(rows)
        res.json(rows);
    });
});

app.get('/test5', function(req, res) {
    
    var sql = `select * from AVERAGE_SALARY;`;
    console.log(sql);
    connection.query(sql, function(err, rows, fields) {
        console.log(rows)
        res.json(rows);
    });
});



app.post('/curd1', function(req, res) {
    var ename = req.body.ename;
    var essn = req.body.essn;
    var address = req.body.address;
    var salary = req.body.salary;
    console.log(ename);
    console.log(essn);
    console.log(address);
    console.log(salary);
    var sql = `insert into EMPLOYEE (ENAME, ESSN, ADDRESS, SALARY) values ('${ename}', '${essn}', '${address}', ${salary});`;
    console.log(sql);
    connection.query(sql, function(err, rows, fields) {
        console.log(rows)
        res.json(rows);
    });
});

app.get('/get', function(req, res) {
    var sql = `select * from EMPLOYEE`;
    connection.query(sql, function(err, rows, fields) {
        console.log(rows)
        res.json(rows);
    });
});


app.post('/curd2', function(req, res) {
    var essn = req.body.essn;
    var salary = req.body.salary
    var sql = `update EMPLOYEE set SALARY=${salary} where ESSN='${essn}';`;
    connection.query(sql, function(err, rows, fields) {
        console.log(rows)
        res.json(rows);
    });
});


app.post('/crud3', function(req, res) {
    var essn = req.body.essn;

    var sql = `delete from EMPLOYEE where ESSN='${essn}';`;
    console.log(sql);
    connection.query(sql, function(err, rows, fields) {
        console.log(rows)
        res.json(rows);
    });
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});


module.exports = app;