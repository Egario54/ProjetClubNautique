<?php
// models/Personne.php
class Personne {
    public $idPersonne;
    public $nom;
    public $prenom;

    public function __construct($idPersonne, $nom, $prenom) {
        $this->idPersonne = $idPersonne;
        $this->nom = $nom;
        $this->prenom = $prenom;
    }
}
?>