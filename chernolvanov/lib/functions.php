<?php
	$mysqli = false;
	function connectDB() {
		global $mysqli;
		$mysqli = new mysqli ("localhost", "root", "", "firstdb");
		$mysqli->query("SET NAMES 'utf8'");
	}
	
	
	function closeDB() {
		global $mysqli;
		$mysqli->close();
	}
	
	
	function getAll($table) {
		global $mysqli;
		connectDB();
		$result_set = $mysqli->query("SELECT * FROM `$table`");
		closeDB();
		return resultSetToArray($result_set);	
	}
	function getsomeArticles($num, $per_page) {
		global $mysqli;
		connectDB();
		$result_set = $mysqli->query("SELECT * FROM `articles` LIMIT $num,$per_page");
		closeDB();
		return resultSetToArray($result_set);	
	}
		function getAllArticles() {
		global $mysqli;
		connectDB();
		$result_set = $mysqli->query("SELECT * FROM `articles`");
		closeDB();
		return resultSetToArray($result_set);	
	}
	

	function resultSetToArray($result_set) {
		$array = array();
		while  (($row = $result_set->fetch_assoc()) != false)
			$array[] = $row;
		return $array;
	}
	
	
	function getArticle($id) {
		global $mysqli;
		connectDB();
		$result_set = $mysqli->query("SELECT * FROM `articles` WHERE `id`='$id'");
		closeDB();
		return $result_set->fetch_assoc();
	}
	function getSubArticles($subid,$sub) {
		for ($i = 0; $i < count($sub); $i++) {
			if ($sub[$i]["subid"] == $subid) {
			$subitem = $sub[$i]["name"];
			$subitemid = $sub[$i]["id"];
			echo '<li><a class="blue-text" href=articles.php?id='.$subitemid.'>'.$subitem.'</a></li>';
			}
		}		
	}
	function getSubArticlesM($subid, $sub) {
			for ($i = 0; $i < count($sub); $i++) {
			if ($sub[$i]["subid"] == $subid) {
			$subitem = $sub[$i]["name"];
			$subitemid = $sub[$i]["id"];
			echo '<li><a href=articles.php?id='.$subitemid.'>'.$subitem.'</a></li>';
			}
		}		
	}
	
	function editArt($name, $text, $subid, $id) {
		global $mysqli;
		connectDB();
		$success = $mysqli->query("UPDATE `articles` SET `name`='$name', `text`='$text', `subid`='$subid' WHERE `id`='$id'");
		closeDB();
		return $success;
	}
	function addArt($name, $text, $subid) {
		global $mysqli;
		connectDB();
		$success = $mysqli->query("INSERT INTO `articles` (`name`, `text`,`subid`) VALUES ('$name', '$text', '$subid')");
		closeDB();
		return $success;
	}
	function delArt($id) {
		global $mysqli;
		connectDB();
		$success = $mysqli->query("DELETE FROM `articles` WHERE `id`='$id'");
		closeDB();
		return $success;
	}
	
	function getitem($id) {
		global $mysqli;
		connectDB();
		$result_set = $mysqli->query("SELECT * FROM `items` WHERE `id`='$id'");
		closeDB();
		return $result_set->fetch_assoc();
	}
	
	function addUser($email, $password) {
		global $mysqli;
		connectDB();
		$success = $mysqli->query("INSERT INTO `users` (`email`, `password`) VALUES ('$email', '$password')");
		closeDB();
		return $success;
	}
	function CheckUser($email, $password) {
		global $mysqli;
		connectDB();
		$result_set = $mysqli->query("SELECT * FROM `users` WHERE `email` = '$email' AND `password` = '$password'");
		closeDB();
		if ($result_set->fetch_assoc()) return true;
		else return false;
	}
		function getNews($id) {
		global $mysqli;
		connectDB();
		$result_set = $mysqli->query("SELECT * FROM `news` WHERE `id`='$id'");
		closeDB();
		return $result_set->fetch_assoc();
	}
		function getSomeNews($num, $per_page) {
		global $mysqli;
		connectDB();
		$result_set = $mysqli->query("SELECT * FROM `news` LIMIT $num,$per_page");
		closeDB();
		return resultSetToArray($result_set);	
	}
	function editNews($name, $text, $subid, $id) {
		global $mysqli;
		connectDB();
		$success = $mysqli->query("UPDATE `news` SET `title`='$name', `text`='$text', `rang`='$subid' WHERE `id`='$id'");
		closeDB();
		return $success;
	}
	function addNews($name, $text, $subid) {
		global $mysqli;
		connectDB();
		$success = $mysqli->query("INSERT INTO `news` (`name`, `text`,`rang`) VALUES ('$name', '$text', '$subid')");
		closeDB();
		return $success;
	}
	function delNews($id) {
		global $mysqli;
		connectDB();
		$success = $mysqli->query("DELETE FROM `news` WHERE `id`='$id'");
		closeDB();
		return $success;
	}
?>