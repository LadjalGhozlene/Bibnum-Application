<?php
session_start();
include("modele/fonctionadmin.php");
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
    $q = "SELECT * FROM livre 
    WHERE isbn = '.$valueToSearch.' OR titre_livre LIKE '%".$valueToSearch."%'";
    $search_result = filtrerTable($q);
}
else
{
    $q="SELECT * FROM livre
    ORDER BY isbn ";
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
	   <a href="addlivre.php"><button class="btn btn-success" type="button">Ajouter un nouveau livre</button></a>
	   </div>
	   
  </div>
 </div><hr>
		<div class="panel alert-info"><h2 align="center">Gestion des Livre</h2></div>
		<div class="row" align="center">
			<div class="col-lg-3"></div>
			<div class="alert alert-info col-lg-6">
				<table width="100%">
					<tr>
						<td align="center"><i class="glyphicon glyphicon-remove text-danger"></i>&ensp; Supprimer un livre</td>
						<td align="center"><i class="glyphicon glyphicon-edit text-danger"></i>&ensp; Modifier un livre</td>
						<td align="center"><i class="glyphicon glyphicon-lock text-muted"></i>&ensp; Verrouiller un livre</td>
						<td align="center"><i class="glyphicon glyphicon-eye-open text-success"></i>&ensp; Déverrouiller un livre</td>
					</tr>
				</table>
			</div>
        </div>
  <div class="row">
	  <div class="col-lg-1" align="center"></div>
      <div class="col-lg-10" align="center">
      <table class="table">
        <tr>
          <th> # </th>
		  <th> Titre </th>
          <th> Catégorie </th>
          <th> Auteur </th>
          <th> Edition </th>
          <th> ISBN </th>
          <th> Action </th>                      
        </tr>
<?php 

while($row = $search_result->fetch()):
?>
<tr>
    <td><?php echo $row['isbn'];?></td>
    <td><?php echo $row['titre_livre'];?></td>
			  <?php 
			    $categorie1=new fonction();
			    if($cat=$categorie1->affichercat())
				 {foreach ($cat as $menu_cat)
				  {if ($menu_cat['id_cat'] == $row['id_cat']) { $cate = $menu_cat['intitule_cat'];}}
				 }
	           ?>
    <td><?php echo $cate;?></td>
			  <?php 
			    $auteur1=new fonction();
			    if($cat=$auteur1->afficherauteur())
				 {foreach ($cat as $menu_aut)
				  {if ($menu_aut['id_auteur'] == $row['id_auteur']) { $aute = $menu_aut['nom_auteur']." ".$menu_aut['prenom_auteur'];}}
				 }
	           ?>
    <td><?php echo $aute;?></td>
			  <?php 
			    $editeur1=new fonction();
			    if($cat=$editeur1->afficherediteur())
				 {foreach ($cat as $menu_cat)
				  {if ($menu_cat['id_editeur'] == $row['id_editeur']) { $edit = $menu_cat['intitule'];}}
				 }
	           ?>
    <td><?php echo $edit;?></td>
	    <?php 
	       $isbn = substr($row['img_livre'], strlen('ouvrages/'));
	       $isbn = substr($isbn, 0, -4);
	    ?>
    <td><?php echo $isbn;?></td>
    <td>
		<a href="supplivre.php?isbn=<?php echo $row['isbn'];?>"><i class="glyphicon glyphicon-remove text-danger"></i></a>
		<a href="modiflivre.php?isbn=<?php echo $row['isbn'];?>"><i class="glyphicon glyphicon-edit text-info"></i></a>
		<?php if ($row['etat']==0){?>
		<a href="#"><i class="glyphicon glyphicon-lock text-muted"></i></a>
		<?php } else {?>
		<a href="#"><i class="glyphicon glyphicon-eye-open text-success"></i></a>
		<?php }?>
	</td>
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