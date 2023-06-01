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
	public function afflivre($isbn){
		$livre = array();
		$sql="SELECT * FROM livre WHERE isbn = '$isbn'";
		$connex=new Connexion();
		$req=$connex->getPDO()->query($sql);
		while($data = $req->fetch()){
				$livre[]=$data;
			}
			return $livre;
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
	private $table3 = "editeur";
	public function afficherediteur(){
		$aut = array();
		$sql="SELECT * FROM editeur";
		$connex=new Connexion();
		$req=$connex->getPDO()->query($sql);
		while($data = $req->fetch()){
				$aut[]=$data;
			}
			return $aut;
	}
	
	private $table4 = "livre";
	public function ajoutlivre($titre_livre, $id_cat, $id_editeur, $img_livre, $description, $id_auteur, $date_parution, $nbr_page, $localisation)
		{
			$sql="INSERT INTO livre (titre_livre, id_cat, id_editeur, img_livre, description, id_auteur, date_parution, nbr_page, localisation) VALUES ('$titre_livre', '$id_cat', '$id_editeur', '$img_livre', '$description', '$id_auteur', '$date_parution', '$nbr_page', '$localisation')";
			$req=$this->getPDO()->query($sql);	
		}
	private $table5 = "auteur";
	public function ajoutauteur($nom, $prenom, $biographie, $image)
		{
			$sql="INSERT INTO auteur (nom_auteur, prenom_auteur, biographie, image) VALUES ('$nom', '$prenom', '$biographie', '$image')";
			$req=$this->getPDO()->query($sql);	
		}
	public function ajoutcat($nom)
		{
			$sql="INSERT INTO categorie (intitule_cat) VALUES ('$nom')";
			$req=$this->getPDO()->query($sql);	
		}
	public function supplivre($isbn)
		{
			$sql="DELETE FROM livre where isbn = '$isbn'";
			$req=$this->getPDO()->query($sql);	
		}
	}
?>