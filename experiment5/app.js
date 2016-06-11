'use strict';

const sql1 = `SELECT [ ENAME = ’Mary’ & DNAME = ’Research’ ] ( EMPLOYEE JOIN DEPARTMENT )`;
const sql2 = `PROJECTION [ BDATE ] ( SELECT [ ENAME = ’John’ & DNAME = ’Research’ ] ( EMPLOYEE JOIN DEPARTMENT ) )`;
const sql3 = `SELECT [ ESSN = ’01’ ] ( PROJECTION [ ESSN, PNAME ] ( WORKS_ON JOIN PROJECT ) )`;

const anylise = (sql, _case) => {
  const sqlArray = sql.split(" ");
  const keyArrayIndex = [];
  console.log(`sqlArray: ${sqlArray}`);

  if(_case == 1) {

    // get the key index to the keyArrayIndex
    for(var i = 0; i < sqlArray.length; i++) {
      if (sqlArray[i] == '[') {
        keyArrayIndex.push(i);
      } else if(sqlArray[i] == ']') {
        keyArrayIndex.push(i);
      } else if(sqlArray[i] == '(') {
        keyArrayIndex.push(i);
      } else if(sqlArray[i] == ')') {
        keyArrayIndex.push(i);
      }
    }
    console.log(`key Array Index: ${keyArrayIndex}`)
    /**
    * 0 [
    * 1 ]
    * 2 (
    * 3 )
    */
    let count = 0;
    const size = 3;
    console.log('优化前查询树')
    console.log('select')

    let fArray = [];
    let rArray = [];

    while(true) {
      var s1 = sqlArray[keyArrayIndex[0] + 1 + count * (size + 1)];
      var s2 = sqlArray[keyArrayIndex[0] + 2 + count * (size + 1)];
      var s3 = sqlArray[keyArrayIndex[0] + 3 + count * (size + 1)];
      console.log(s1+s2+s3);
      
      fArray.push(s1+s2+s3);

      count++;

      if((keyArrayIndex[0] + count * (size + 1)) < keyArrayIndex[1]) {
        console.log("and");  
      } else {
        break;
      }

    }
    console.log("->")
    count  = 0;
    while(true) {
      console.log(sqlArray[keyArrayIndex[2] + 1 + count * 2]);

      rArray.push(sqlArray[keyArrayIndex[2] + 1 + count * 2]);

      count ++;
      if((keyArrayIndex[2] + 1 + count * 2) < keyArrayIndex[3]) {
        console.log('x');
      } else {
        break;
      }

    }
    console.log('优化后查询树')

    for(let i = 0; i < rArray.length; i++) {
      console.log(`${rArray[i]}(${fArray[i]})`);
      if(i < rArray.length -1) {
        console.log('x'); 
      }

    }
  } else if(_case == 2) {
    // get the key index to the keyArrayIndex
    for(var i = 0; i < sqlArray.length; i++) {
      if (sqlArray[i] == '[') {
        keyArrayIndex.push(i);
      } else if(sqlArray[i] == ']') {
        keyArrayIndex.push(i);
      } else if(sqlArray[i] == '(') {
        keyArrayIndex.push(i);
      } else if(sqlArray[i] == ')') {
        keyArrayIndex.push(i);
      }
    }
    console.log(`key Array Index: ${keyArrayIndex}`)
    let count = 0;
    const size = 3;
    console.log('优化前查询树')
    console.log('projection');
    console.log(sqlArray[2]);
    console.log('->')
    console.log('select')

    let fArray = [];
    let rArray = [];

    while(true) {
      var s1 = sqlArray[keyArrayIndex[3] + 1 + count * (size + 1)];
      var s2 = sqlArray[keyArrayIndex[3] + 2 + count * (size + 1)];
      var s3 = sqlArray[keyArrayIndex[3] + 3 + count * (size + 1)];
      console.log(s1+s2+s3);
      
      fArray.push(s1+s2+s3);

      count++;

      if((keyArrayIndex[3] + count * (size + 1)) < keyArrayIndex[4]) {
        console.log("and");  
      } else {
        break;
      }

    }
    console.log("->")
    count  = 0;
    while(true) {
      console.log(sqlArray[keyArrayIndex[5] + 1 + count * 2]);

      rArray.push(sqlArray[keyArrayIndex[5] + 1 + count * 2]);

      count ++;
      if((keyArrayIndex[5] + 1 + count * 2) < keyArrayIndex[6]) {
        console.log('x');
      } else {
        break;
      }

    }
    console.log('优化后查询树')
    console.log('projection');
    console.log(sqlArray[2]);
    console.log('->')
    for(let i = 0; i < rArray.length; i++) {
      console.log(`${rArray[i]}(${fArray[i]})`);
      if(i < rArray.length -1) {
        console.log('x'); 
      }

    }
  } else if(_case == 3) {
    // get the key index to the keyArrayIndex
    for(var i = 0; i < sqlArray.length; i++) {
      if (sqlArray[i] == '[') {
        keyArrayIndex.push(i);
      } else if(sqlArray[i] == ']') {
        keyArrayIndex.push(i);
      } else if(sqlArray[i] == '(') {
        keyArrayIndex.push(i);
      } else if(sqlArray[i] == ')') {
        keyArrayIndex.push(i);
      }
    }
    console.log(`key Array Index: ${keyArrayIndex}`)
  }

}

const app = () => {
  console.log('first sql');
  anylise(sql1, 1);
  console.log('second sql');
  anylise(sql2, 2);
  console.log('third sql');
  anylise(sql3, 3);
}

app()