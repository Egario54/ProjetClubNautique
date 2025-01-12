<?php
// models/Cours.php
class Cours {
    public $idCours;
    public $niveau;
    public $date;
    public $heureDebut;
    public $estAnnule;
    public $nbPlace;

    public function __construct($idCours, $niveau, $date, $heureDebut, $estAnnule, $nbPlace) {
        $this->idCours = $idCours;
        $this->niveau = $niveau;
        $this->date = $date;
        $this->heureDebut = $heureDebut;
        $this->estAnnule = $estAnnule;
        $this->nbPlace = $nbPlace;
    }
}
?>