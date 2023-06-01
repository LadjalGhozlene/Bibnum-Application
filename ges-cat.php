<?php
session_start();
$bdd = new PDO('mysql:host=localhost;dbname=library','root','');

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

<div>
<?php
if(isset($_POST['search']))
{
    $valueToSearch = $_POST['valueToSearch'];
//rechercher dans toutes les colonnes
    $q = "SELECT * FROM categorie 
    WHERE id_cat LIKE '%".$valueToSearch."%'";
    $search_result = filtrerTable($q);
}
else
{
    $q="SELECT * 
    FROM categorie 
    ORDER BY id_cat ";
    $search_result= filtrerTable($q);
}


function filtrerTable($q)
{
//fct pour l'execution de la requete
  $bdd = new PDO('mysql:host=localhost;dbname=library','root','');
  $filter_result=$bdd->query($q);
  return $filter_result;
}

?>

    <div>     
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
   <div class="col-lg-6" align="center">
	   <div class="input-group">
       <a href="index.php"><button class="btn btn-warning" type="button">TABLEAU DE BOARD</button></a>
	   <a href="addcat.php"><button class="btn btn-success" type="button">Ajouter une catégorie</button></a>
	   </div>
  </div>
</div><hr>
		<div class="panel alert-info"><h2 align="center">Gestion des Catégories</h2></div>
  <div class="row">
	  <div class="col-lg-3" align="center"></div>
      <div class="col-lg-6" align="center">
      <table class="table" align="center">
        <tr>
          <th> # </th>
          <th> Intitulé </th>
        </tr>
<?php 

while($row = $search_result->fetch()):
?>
<tr>
    <td><?php echo $row['id_cat'];?></td>
    <td><?php echo $row['intitule_cat'];?></td>
</tr>

<?php
    endwhile;
?>

<?php
    if(isset($_GET['supp']))
    {
      //echo $_GET['id_client'];
     $a = $bdd->query('UPDATE client SET nb_emprunt = nb_emprunt -1 WHERE id_lecteur='.$_GET['id_lecteur'].'');
     $data =$a-> fetch();
     //echo $data['Nb_emprunt'];

     $b=$bdd->query('UPDATE LIVRE SET etat=0 WHERE isbn ='.$_GET['isbn'].'');
     $data1=$b->fetch();

     $c=$bdd->query('DELETE FROM emprunter WHERE isbn='.$_GET['isbn'].'');
     $data2=$c->fetch();
      header('Location: index.php'); 

    }
?>
</table>
</div></div>	  
</form>
    </div>
</div>
<?php
include('footer.php');

?>

<script type="text/javascript" src="../CSS/bootstrap/js/bootstrap.min.js">
</script>
</body>
</html>