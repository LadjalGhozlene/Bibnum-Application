<?php

require_once('connexion.php');

class Livre extends Connexion {

	private $table = "livre";

	public function afficher($chercher, $id_auteur, $id_cat, $next,$nex){
		$livre = array();
		if (($chercher == "")AND($id_auteur == "")AND($id_cat == ""))
		{
		 $sql1="SELECT DISTINCT * FROM livre GROUP BY isbn ORDER BY isbn
		 LIMIT $next,$nex";
		 $connex=new Connexion();
		 $req=$connex->getPDO()->query($sql1);
		 while($data = $req->fetch()){
				$livre[]=$data;
			}
			return $livre;
		}
		  else if ($chercher == "")
		{
		$sql2="SELECT DISTINCT * FROM 
		livre WHERE 
		id_cat = '$id_cat' OR id_auteur = '$id_auteur'
		GROUP BY isbn ORDER BY isbn
		LIMIT $next,$nex";
		$connex=new Connexion();
		$req=$connex->getPDO()->query($sql2);
		while($data = $req->fetch()){
				$livre[]=$data;
			}
			return $livre;
		}
		  else if ($chercher != "")
		{
		$sql3="SELECT DISTINCT * FROM 
		livre WHERE 
		titre_livre LIKE '%$chercher%' 
		GROUP BY isbn ORDER BY isbn
		LIMIT $next,$nex";
		$connex=new Connexion();
		$req=$connex->getPDO()->query($sql3);
		while($data = $req->fetch()){
				$livre[]=$data;
			}
			return $livre;
		}
	}
	public function afficher_infolivre($isbn){
		$livre =array();
		$sql="SELECT * FROM livre WHERE isbn='$isbn'";
		$connex=new Connexion();
		$req=$connex->getPDO()->query($sql);
		$livre[]=$req->fetch();
		return $livre;

	}
	public function afficher_info_auteur($isbn){
		$auteur=array();
		$sql="SELECT * FROM ecrire e JOIN auteur a
		ON e.id_auteur=a.id_auteur
		WHERE e.isbn='$isbn'";
		$connex=new Connexion();
		$req=$connex->getPDO()->query($sql);
		while($data = $req->fetch()){
				$auteur[]=$data;
			}
			return $auteur;
	}
	public function next($limit1,$limit2){
		$limit1=$limit1+6;
		$limit2=$limit2+6;

	}

	public function previous($limit1,$limit2){
		$limit1=$limit1-6;
		$limit2=$limit2-6;
	}

}	?>