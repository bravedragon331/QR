var bcrypt = require('bcrypt-nodejs');
var uuidV4 = require('uuid/v4');

var db     = require('./db');
// Set up User class
var User = function(user) {
  var that = Object.create(User.prototype);

  that.id       = user.id;
  that.email    = user.email;
  that.password = user.password;

  return that;
};

// Gets a random id for this user
var generateUserId = function() {
  return uuidV4();
};

// Hash and salt the password with bcrypt
var hashPassword = function(password) {
  return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
};

// Check if password is correct
var validPassword = function(password, savedPassword) {
  return bcrypt.compareSync(password, savedPassword);
};

// Create a new user
// callback(err, newUser)
var createUser = function(email, password, callback) {
  var newUser = {
    id: generateUserId(),
    email: email,
    password: hashPassword(password)
  };
  
  db.query('INSERT INTO users ( id, email, password, status ) values (?,?,?,?)',
    [newUser.id, email, newUser.password, 0],
    function(err) {
      if (err) {
        if (err.code === 'ER_DUP_ENTRY') {
          // If we somehow generated a duplicate user id, try again
          return createUser(email, password, status, callback);
        }
        return callback(err);
      }

      // Successfully created user
      return callback(null, new User(newUser));
    }
  );
};

// Check if a user exists and create them if they do not
// callback(err, newUser)
var signup = function(req, email, password, callback) {
  // Check if there's already a user with that email
  db.query('SELECT * FROM users WHERE email = ?', [email], function(err, rows) {
    if (err)
      return callback(err);

    if (rows.length) {
      return callback(null, false, req.flash('signupMessage', 'An account with that email address already exists.'));
    } else {
      // No user exists, create the user
      //[newUser.id, newUser.email, newUser.password, req.body.FirstName, req.body.LastName, req.body.Department, req.body.PhoneNumber, false],
      //factory, department, line, name, position, email, password, phone, type, status
      return createUser(email, password, callback);
    }
  });
};

// Log in a user
// callback(err, user)
var login = function(req, email, password, callback) {  
  // Check that the user logging in exists
  db.query('SELECT * FROM users WHERE email = ?', [email], function(err, rows) {
    if (err)
      return callback(err);

    if (!rows.length)
      return callback(null, false, req.flash('loginMessage', 'No user found.'));

    if (!validPassword(password, rows[0].password))
      return callback(null, false, req.flash('loginMessage', 'Wrong password.'));

    if (rows[0].status == 0){
      return callback(null, false, req.flash('loginMessage', 'Waiting permission allow.'));
    }
    // User successfully logged in, return user
    return callback(null, new User(rows[0]));
  });
};

var verify = function(id, callback){
  db.query('UPDATE users SET active = 1 WHERE id = ?', [id], function(err, result){
    if(err)
      return callback(err);
    return callback(null);
  })
}

exports.signup = signup;
exports.login = login;
exports.verify = verify;
