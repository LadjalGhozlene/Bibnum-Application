<?php
include("Connexion.php");
class lecteur extends Connexion {
	private $_table = "livre";

// la fonction de l'inscription //SYSDATE

		public function inscription($nom, $prenom, $user, $email, $date_naissance, $addresse, $psw)
		{
			$sql="INSERT INTO {$this->_table} (nom_lecteur, prenom_lecteur, user, email_lecteur, date_naissance, adresse, psw, nb_emprunt, date_inscription) VALUES ('$nom', '$prenom', '$user', '$email', '$date_naissance', '$addresse', '$psw', 0, NOW())";
			$req=$this->getPDO()->query($sql);
			
		}
    
    
//la fonction de authentification

		public function valide ($user, $psw)
		{

			$client = array();
			$sql="SELECT * FROM {$this->_table} WHERE user='$user' AND psw='$psw'";
			$req=$this->getPDO()->query($sql);
			if($data = $req->fetch()){
				$client[] = $data; 
				return $client;
			}else{

				return false;
			}
		}



//la fontion qui permet d'afficher les livres empruntés maintenant par un client (id client) 

		public function livre_emprunt($id_lecteur)

		{	$emprunt = array();

			$sql="SELECT * FROM emprunter e , livre l WHERE e.isbn=l.isbn AND e.id_lecteur='$id_lecteur' ";
			$connex=new Connexion();
			$req=$connex->getPDO()->query($sql);
			

			while($data = $req->fetch()){
				$emprunt[]=$data;
			}

			return $emprunt;
		}


//la fontion qui permet de modifier les informations d'un client

		public function modification($id_lecteur, $nom_lecteur, $prenom_lecteur, $user, $email_lecteur, $date_naissance, $adresse, $psw)
		{
			$sql="UPDATE {$this->_table} SET nom_lecteur=?, prenom_lecteur=?, user=?, email_lecteur=?, date_naissance=?, adresse=?, psw=?  WHERE id_lecteur='$id_lecteur'";
			$req=$this->getPDO()->prepare($sql);
			$req->execute(array($nom_lecteur, $prenom_lecteur, $user, $email_lecteur, $date_naissance, $adresse, $psw));
		}
//la fontion qui permet d'emprunter et d'incrementer lenombre d'emprunts si 

		public function emprunter_Livre($isbn, $id_lecteur, $nb_emprunt)
		{
			
			$sql1="UPDATE livre SET etat=1  WHERE isbn='$isbn'";
			$req1=$this->getPDO()->query($sql1);
			$sql2="UPDATE lecteur SET nb_emprunt ='$nb_emprunt' WHERE id_lecteur='$id_lecteur' ";
			$req2=$this->getPDO()->query($sql2);
			$sql3="INSERT INTO emprunter (id_lecteur, isbn, date_emprunt) VALUES($id_lecteur, $isbn, NOW())";
			$req3=$this->getPDO()->query($sql3);
		}
}
?>