<?php
session_start();
$bdd = new PDO('mysql:host=localhost;dbname=library','root','');
include("modele/fonctionadmin.php");
if(!isset($_SESSION['admin']))
{
	include('loginadmin.php');exit();
}
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../CSS/theme.css"/>
  <title>Biblio_Admin_Web</title>
<body>
<div class="jumbotron">
      <div class="col-lg-8">
          <img src="../IMG/logo.svg" height="90" alt=""/>
      </div>
</div>

<form method="POST" action="#">
 <div class="row">
	 <div class="col-lg-1" align="center">
	 </div>
   <div class="col-lg-3" align="center">
    <div class="input-group">
      <input type="text" name="valueToSearch" class="form-control" placeholder="Tapez un id ...">
      <span class="input-group-btn">
        <input class="btn btn-default" type="submit" name="search" value="  Chercher ! "></input>
       <a href="index.php"><button class="btn btn-default" type="button">Reset!</button></a>
      </span>
    </div>
  </div>
   <div class="col-lg-6" align="right">
	   <div class="input-group">
       <a href="index.php"><button class="btn btn-warning" type="button">TABLEAU DE BOARD</button></a>
	   </div>	   
  </div>
 </div>
</form><hr>
	<div class="row">
	<div class="col-lg-2">
	
	</div>
	<div class="col-lg-8">
		<div class="panel panel-info">
			<div class="panel-heading">AJOUTER UN NOUVEAU AUTEUR !</div>
			<div class="panel-body">
			 <fieldset>
			  <form action="ctrladdlauteur.php" method="post" enctype="multipart/form-data">
			   <table class="login_table">
				<tr><td><input type="text" name="nom" id="nom" placeholder="Nom" required></td></tr>
				<tr><td><input type="text" name="prenom" id="prenom" placeholder="Prénom" required></td></tr>
				<tr><td><input type="text" name="biographie" id="user" placeholder="Biographie" required></td></tr>
				<tr><td><input type="file" name="fichier" id="email" placeholder="Photo" required></td></tr>
				<tr><td><input type="submit" value="Ajouter"/></td></tr>
		       </table>
			  </form>
			 </fieldset>
			</div>
		</div>
	</div>

		
	</div>

	
	
<?php
include('footer.php');

?>

<script type="text/javascript" src="../CSS/bootstrap/js/bootstrap.min.js">
</script>
</body>
</html>