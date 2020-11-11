const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'abuesoft'
});

mysqlConnection.connect(function (err) {
    if(err){
        console.log(err);
        return;
    } else {
        console.log('Successfuly MySQL connection');
    }
});

module.exports = mysqlConnection;