<?php
include("modele/fonctionadmin.php");
$err="";$msg="";
if (isset($_POST['nom'])){$nom = addslashes(nl2br(htmlspecialchars($_POST['nom'])));}
    $auteur=new fonction();
    try
    {
        if(1)
        {    
            $auteur->ajoutcat($nom);
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
header("Location: addcat.php?err=$err&msg=$msg");
exit();
?>