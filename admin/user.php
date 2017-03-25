<?php
include "../db.php";

define("TBL_USERS", "users" );

class Users {
	var $error  = false;
	var $errmsg = "";
	
	// Add (Register) a new user
	function NewUser( $username, $email, $password, $confirm ) {
		global $db;
		
		// Check format of username
		$username = $this->Strip( $username );
		if ( $username != "" && !( $username = $this->ValidName( $username ) ) ) {
			return !( $this->error = true );
		}
		
		// Check format of password
		$password = $this->Strip( $password );
		$confirm  = $this->Strip( $confirm );
		if ( !( $password = $this->ValidPassword( $password, $confirm ) ) ) {
			return !( $this->error = true );
		}
		
		// Check format of email address
		$email = $this->Strip( $email );
		if ( !( $email = $this->ValidEmail( $email ) ) ) {
			return !( $this->error = true );
		}

		$hpassword = md5( $password );
		
		$q = "INSERT INTO " . TBL_USERS . " (username,email,password,created,lastlogin) VALUES " .
			 "('$username','$email','$hpassword',SYSDATE(),SYSDATE() )";
		
		$result = mysqli_query( $db->connection, $q );
		if ( $db->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $db->connection ) . PHP_EOL;
		}
		
		return $hpassword;
	}
	
	// Check if name is valid syntax
	function ValidName( $username ) {
		// Check if name has been registered already
		if ( $username != "" ) {
			if ( $this->IsRegisteredName( $username ) ) {
				$this->errmsg = "Name already registered.";
				return !( $this->error = true );
			}
		}
		
		return $username;
	}
	
	// Check if password is valid syntax
	function ValidPassword( $password, $confirm ) {
		// Password Required
		if ( $password == "" ) {
			$this->errmsg = "No password specified.";
			return false;
		}
		
		// Confirm Password Required
		if ( $confirm == "" ) {
			$this->errmsg = "No confirm password specified.";
			return false;
		}
		
		// Check that passwords match
		if ( $password != $confirm ) {
			$this->errmsg = "Password and confirm password mismatch.";
			return false;
		}
		
		return $password;
	}
	
	// Check if email is valid syntax
	function ValidEmail( $email ) {
		// Email Required
		if ( $email == "" ) {
			$this->errmsg = "No email specified.";
			return false;
		}
		
		// Check if valid format
		if ( !filter_var( $email, FILTER_VALIDATE_EMAIL ) ) {
			$this->errmsg = "Not a valid email address.";
			return false;
		}
		
		// Check if email is already registered
		if ( $this->IsRegisteredEmail( $email ) ) {
			$this->errmsg = "Email already registered.";
			return !( $this->error = true );
		}
		
		return $email;
	}
	
	// Check if name already exists
	function IsRegisteredName( $username ) {
		global $db;
		
		$q = "Select username FROM " . TBL_USERS . " WHERE username='$username'";
		$result = mysqli_query( $db->connection, $q );
		if ( $db->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $db->connection ) . PHP_EOL;
		}
		
		if ( mysqli_num_rows( $result ) > 0 )
			return true;
		return false;
	}
	
	// Check if email already exists
	function IsRegisteredEmail( $email ) {
		global $db;
		
		$q = "Select email FROM " . TBL_USERS . " WHERE email='$email'";
		$result = mysqli_query( $db->connection, $q );
		if ( $db->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $db->connection ) . PHP_EOL;
		}
		
		if ( mysqli_num_rows( $result ) > 0 )
			return true;
		
		return false;
	}
	
	// User Login
	function Login( $username, $email, $password ) {
		global $db;
		
		$username = $this->Strip( $username );
		$email    = $this->Strip( $email );
		$password = $this->Strip( $password );
		
		// login by username
		if ( $username != "" ) {
			if ( !$this->IsRegisteredName( $username ) ) {
				$this->errmsg = "Username not valid.";
				return !( $this->error = true );
			}
			$where = "username='$username'";
		}
		// login by email
		else {
			if ( !$this->IsRegisteredEmail( $email ) ) {
				$this->errmsg = "Email not valid.";
				return !( $this->error = true );
			}
			$where = "email='$email'";
		}
		
		$hpassword = md5( $password );
		
		$q = "SELECT password FROM " . TBL_USERS . " WHERE " . $where;
		$result = mysqli_query( $db->connection, $q );
		if ( $db->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $db->connection ) . PHP_EOL;
		}
		
		$data = mysqli_fetch_array( $result );
		$storedpassword = $data[ 'password' ];
		
		if ( $storedpassword != $hpassword ) {
			$this->errmsg = "Password not valid.";
			return !( $this->error = true );
		}
		
		return $hpassword;
	}
	
	function ResetPassword() {
		
	}
	
	// Strip input of whitespace, tags and special characters
	function Strip( $name ) {
		$name = trim( $name );
		$name = strip_tags( $name );
		$name = htmlspecialchars( $name );
		return $name;
	}
}

$users = new Users();
if ( isset( $_POST['new'] ) ) {
	$username = $_POST['username'];
	$email    = $_POST['email'];
    $password = $_POST[ 'password' ];
    $confirm  = $_POST[ 'confirm' ];

	$rc = $users->NewUser( $username, $email, $password, $confirm );
	echo $rc . $users->errmsg;
}
else if ( isset( $_GET['login']) ) {
	$username = $_GET['username'];
	$email    = $_GET['email'];
    $password = $_GET[ 'password' ];
	
	$rc = $users->Login( $username, $email, $password );
	echo $rc . $users->errmsg;
}
?>