<?php
require_once('connexion.php');
class fonction extends Connexion 
{
	private $table1 = "categorie";
	public function affichercat(){
		$cat = array();
		$sql="SELECT * FROM categorie";
		$connex=new Connexion();
		$req=$connex->getPDO()->query($sql);
		while($data = $req->fetch()){
				$cat[]=$data;
			}
			return $cat;
	}
	public function affcat($id_cat){
		$cat = array();
		$sql="SELECT * FROM categorie WHERE id_cat = '$id_cat'";
		$connex=new Connexion();
		$req=$connex->getPDO()->query($sql);
		while($data = $req->fetch()){
				$cat[]=$data;
			}
			return $cat;
	}
	private $table2 = "auteur";
	public function afficherauteur(){
		$aut = array();
		$sql="SELECT * FROM auteur";
		$connex=new Connexion();
		$req=$connex->getPDO()->query($sql);
		while($data = $req->fetch()){
				$aut[]=$data;
			}
			return $aut;
	}
	
	private $table3 = "livre";
	public function ajoutlivre($titre_livre, $id_cat, $id_editeur, $img_livre, $description, $id_auteur, $date_parution, $nbr_page, $localisation)
		{
			$sql="INSERT INTO {$this->_table} (titre_livre, id_cat, id_editeur, img_livre, description, id_auteur, date_parution, nbr_page, localisation) VALUES ('$titre_livre', '$id_cat', '$id_editeur', '$img_livre', '$description', '$id_auteur', '$date_parution', '$nbr_page', '$localisation')";
			$req=$this->getPDO()->query($sql);
			
		}
	
	
}


?>