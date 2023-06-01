<?php
include("modele/fonctionadmin.php");
$err="";$msg="";
$dossier = '../ouvrages/';
if (isset($_POST['titre'])){$titre = addslashes(nl2br(htmlspecialchars($_POST['titre'])));}
if (isset($_POST['cat'])){$cat = $_POST['cat'];}
if (isset($_POST['edit'])){$edit = $_POST['edit'];}
if (isset($_POST['aut'])){$aut = $_POST['aut'];}
if (isset($_POST['isbn'])){$isbn = $_POST['isbn'];}
if (isset($_POST['desc'])){$desc = addslashes(nl2br(htmlspecialchars($_POST['desc'])));}
if (isset($_POST['fichier'])){$fichier = $_POST['fichier'];}

if (!(isset($_FILES['fichier']) AND $_FILES['fichier']['error'] == 0))
{
	$err = "Erreur de transfert de fichier. impossible de déplacer le fichier transféré";
	header("Location: addlivre.php?err=$err&msg=$msg");
	exit();
}
else if ($_FILES['fichier']['size'] >= 10000000)
{
	$err = "Le fichier est trop grand pour le système de fichiers de destination";
	header("Location: addlivre.php?err=$err&msg=$msg");
	exit();
}
$infosfichier = pathinfo($_FILES['fichier']['name']);
$extension = $infosfichier['extension'];
$nom_fichier = $isbn;
$uploadfile = $dossier . $nom_fichier . ".". $extension;
if (move_uploaded_file($_FILES['fichier']['tmp_name'], $uploadfile))
{
	$date_parution=date('jj-mm-YY'); $nbr_page=0; $localisation="";$uploadfile = substr($uploadfile, 3);
    $livre=new fonction();
    try
    {
        if(1)
        {    
            $livre->ajoutlivre($titre, $cat, $edit, $uploadfile, $desc, $aut, $date_parution, $nbr_page, $localisation);
        }
        else
        {
            throw new Exception('Un probleme est produit lors de votre inscription!!! Merci de ressayer plus tard ^_^');
        }
    }
    catch(Exception $e)
    {
        echo $e->getMessage();
    }


} 
else 
{ $err = "Attaque potentielle par téléchargement de fichiers";}
header("Location: addlivre.php?err=$err&msg=$msg");
exit();
?>