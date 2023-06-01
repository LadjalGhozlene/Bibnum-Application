<?php
include("modele/fonctionadmin.php");
$err="";$msg="";
$dossier = '../auteurs/';
if (isset($_POST['nom'])){$nom = addslashes(nl2br(htmlspecialchars($_POST['nom'])));}
if (isset($_POST['prenom'])){$prenom = addslashes(nl2br(htmlspecialchars($_POST['prenom'])));}
if (isset($_POST['biographie'])){$biographie = addslashes(nl2br(htmlspecialchars($_POST['biographie'])));}
if (isset($_POST['fichier'])){$fichier = $_POST['fichier'];}

if (!(isset($_FILES['fichier']) AND $_FILES['fichier']['error'] == 0))
{
	$err = "Erreur de transfert de fichier. impossible de déplacer le fichier transféré";
	header("Location: addauteur.php?err=$err&msg=$msg");
	exit();
}
else if ($_FILES['fichier']['size'] >= 10000000)
{
	$err = "Le fichier est trop grand pour le système de fichiers de destination";
	header("Location: addauteur.php?err=$err&msg=$msg");
	exit();
}
$infosfichier = pathinfo($_FILES['fichier']['name']);
$extension = $infosfichier['extension'];
$nom_fichier = $nom."-".$prenom;
$uploadfile = $dossier . $nom_fichier . ".". $extension;
if (move_uploaded_file($_FILES['fichier']['tmp_name'], $uploadfile))
{
	$image=$nom_fichier; $nbr_page=0; $localisation="";$uploadfile = substr($uploadfile, 3);
    $auteur=new fonction();
    try
    {
        if(1)
        {    
            $auteur->ajoutauteur($nom, $prenom, $biographie, $image);
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
header("Location: addauteur.php?err=$err&msg=$msg");
exit();
?>