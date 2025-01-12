<?php
// models/Materiel.php
class Materiel {
    public $idMateriel;
    public $disponible;

    public function __construct($idMateriel, $disponible) {
        $this->idMateriel = $idMateriel;
        $this->disponible = $disponible;
    }
}
?>