var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', {
        title: 'Express'
    });
});

router.post('/test1', function(req, res) {
    var pno = req.body.pno;
    var sql = "select distinct ESSN from WORKS_ON where PNO = '"
    pno + "';";
    connection.query(sql, function(err, rows, fields){
      console.log(rows);
    });
    console.log(pno);
});
module.exports = router;