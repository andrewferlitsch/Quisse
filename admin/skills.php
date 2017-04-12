<?php
session_start();
include_once "../db.php";
include_once "user.php";

define( "TBL_SKILLS", "skills" );
define( "TBL_USERS",  "users"  );

class Skills {
	var $error  = false;
	var $errmsg = "";
	
	// Add a skill for a user
	function AddSkill( $id, $skill, $type ) {
		global $db;
		
		if ( !$this->ValidId( $id ) ) {
			$this->errmsg = "Not a valid ID.";
			return !($this->error = true);
		}
		
		if ( $this->GetSkill( $id, $skill, $type ) ) {
			$this->errmsg = "Skill already added.";
			return !($this->error = true);
		}
		
		$q = "INSERT INTO " . TBL_SKILLS . "(userid,skill,type) VALUES ($id,'$skill','$type')";
		$result = mysqli_query( $db->connection, $q );
		if ( $db->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $db->connection ) . PHP_EOL;
		}
		
		return $result;
	}
	
	// Update a skill for a user
	function UpdateSkill( $id, $skill, $type, $percent, $time ) {
		global $db;
		
		if ( !$this->ValidId( $id ) ) {
			$this->errmsg = "Not a valid ID.";
			return !($this->error = true);
		}
		
		if ( !$this->GetSkill( $id, $skill, $type ) ) {
			$this->AddSkill( $id, $skill, $type );
		}
		
		$q = "UPDATE " . TBL_SKILLS . " SET type='$type',percent='$percent',time='$time',date=SYSDATE() WHERE userid=$id AND type='$type' AND skill='$skill'";
		$result = mysqli_query( $db->connection, $q ); 
		if ( $db->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $db->connection ) . PHP_EOL;
		}
		
		return $result;
	}
	
	// Get skills for a user
	function GetSkills( $id ) {
		global $db;
		
		if ( !$this->ValidId( $id ) ) {
			$this->errmsg = "Not a valid ID.";
			return !($this->error = true);
		}
		
		$q = "SELECT * FROM " . TBL_SKILLS . " WHERE userid=$id";
		$result = mysqli_query( $db->connection, $q );
		if ( $db->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $db->connection ) . PHP_EOL;
		}
		
		$skills = array();
		while ( $data = mysqli_fetch_array( $result ) ) {
			array_push( $skills, $data );
		}
		return $skills;
	}
	
	// Get skill for a user
	function GetSkill( $id, $skill, $type ) {
		global $db;
		
		if ( !$this->ValidId( $id ) ) {
			$this->errmsg = "Not a valid ID.";
			return !($this->error = true);
		}

		$q = "SELECT * FROM " . TBL_SKILLS . " WHERE userid='$id' AND skill='$skill' AND type='$type'";
		$result = mysqli_query( $db->connection, $q );
		if ( $db->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $db->connection ) . PHP_EOL;
		}
		
		$data = mysqli_fetch_array( $result );
		return $data;
	}
	
	// Check if the id is in the users table
	function ValidId( $id ) {
		global $db;
		
		$q = "SELECT username FROM " . TBL_USERS . " WHERE id='$id'";
		$result = mysqli_query( $db->connection, $q );
		if ( $db->debug == true ) {
			echo "Q $q". PHP_EOL;
			echo mysqli_error( $db->connection ) . PHP_EOL;
		}
		
		if ( mysqli_num_rows( $result ) > 0 )
			return true;
		return false;
	}
}

$skills = new Skills();
$_POST = json_decode(file_get_contents('php://input'), true);
if ( isset( $_POST['action'] ) ) { 
	$id       = $_POST['id'];
	$skill    = $_POST['skill'];
	$type     = $_POST['type'];
	$percent  = $_POST['percent'];
	$time     = $_POST['time'];

	if ( $_POST['action'] == "add" )
		$rc = $skills->AddSkill( $id, $skill, $type );
	else if ( $_POST['action'] == "update" )
		$rc = $skills->UpdateSkill( $id, $skill, $type, $percent, $time );
	else if ( $_POST['action'] == "get" ) {
		$rc = $skills->GetSkill( $id, $skill, $type );
		if ( $rc ) {
			$rc = $rc[ 'percent' ] . "," . $rc[ 'time' ];
		}
	}
	else if ( $_POST['action'] == "gets" )
		$rc = $skills->GetSkills( $id );
	
	if ( $skills->error ) {
		echo $skills->errmsg;
		header("HTTP/1.1 501 " . $skills->errmsg );
	}
	else
		echo $rc;
}
?>