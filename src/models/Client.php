<?php
// models/Client.php
class Client extends Personne {
    public $adresse;
    public $materielSouhaite;
    public $appreciations;

    public function __construct($idPersonne, $nom, $prenom, $adresse, $materielSouhaite, $appreciations) {
        parent::__construct($idPersonne, $nom, $prenom);
        $this->adresse = $adresse;
        $this->materielSouhaite = $materielSouhaite;
        $this->appreciations = $appreciations;
    }
}
?>