var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var faker = require('faker');
var mysql = require('mysql2');

app.set('view engine', 'ejs');
// Express looks for templates in the 'views' folder by default.
// Since the folder in this project is 'view' (singular), we specify its path explicitly.
app.set('views', __dirname + '/view');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));

var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // Replace with your MySQL password if you have one
});

connection.connect(function(err) {
  if (err) {
    console.error('❌ Connection failed: ' + err.stack);
    console.log('\n💡 Tip: Please check if your MySQL server is running and ensure the credentials in index.js are correct.');
    process.exit(1);
  }
  console.log('✅ Connected to MySQL successfully as id ' + connection.threadId);

  // 1️⃣ Create database if it does not exist
  connection.query('CREATE DATABASE IF NOT EXISTS join_us_app', function(err) {
    if (err) throw err;
    console.log('📦 Database "join_us_app" verified/created.');

    // 2️⃣ Switch to join_us_app database
    connection.query('USE join_us_app', function(err) {
      if (err) throw err;

      // 3️⃣ Create users table if it does not exist
      var createTableQuery = `
        CREATE TABLE IF NOT EXISTS users (
          email VARCHAR(255) PRIMARY KEY,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
      `;
      connection.query(createTableQuery, function(err) {
        if (err) throw err;
        console.log('📋 Table "users" verified/created.');
      });
    });
  });
});

app.get('/', function(req, res) {
  const q = 'SELECT COUNT(*) AS total FROM users';
  connection.query(q, function(err, results) {
    if (err) throw err;
    const total = results[0].total;
    res.render('home', { total });
  });
});

app.post('/register', function(req, res) {
  var person = { email: req.body.email };
  connection.query('INSERT INTO users SET ?', person, function(error, results) {
    if (error) throw error;
    res.redirect('/');
  });
});

// SELECTING DATA ======================================================================

// const q = `
//   SELECT COUNT(*) AS total
//   FROM users
// `;

// connection.query(q, function(error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].total);
// });

// DYNAMICALLY INSERT DATA ==============================================================

// var person = {
//   email: faker.internet.email(),
//   created_at: faker.date.past()
// };

// console.log(person);

// const end_result = connection.query('INSERT INTO users SET ?', person, function(
//   error,
//   results
// ) {
//   if (error) throw error;
//   console.log(results);
// });

// console.log(end_result.sql);

// BULK INSERT DATA ======================================================================

// var data = [];
// for (let i = 0; i < 500; i++) {
//   data.push([faker.internet.email(), faker.date.past()]);
// }

// var q = 'INSERT INTO users (email, created_at) VALUES ?';

// connection.query(q, [data], function(error, results) {
//   if (error) throw err;
//   console.log(results);
// });

// connection.end();

app.listen(8080, function() {
  console.log(`Serving Join Us app on port 8080`);
});
