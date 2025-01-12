<?php
// controllers/MaterielController.php
class MaterielController {
    public function index() {
        include 'views/materiel/index.php';
    }

    public function filter($disponible) {
        // Logique pour filtrer les matériels
    }
}
?>