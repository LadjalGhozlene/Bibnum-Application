<?php
session_start();
if (isset($_POST['user'])and(isset($_POST['psw'])))
{
	$_SESSION['admin'] = true;
	header('Location: index.php');
}
?>