<?php
// controllers/PlanningController.php
class PlanningController {
    public function index() {
        include 'views/planning/index.php';
    }

    public function view($idCours) {
        // Logique pour afficher les membres d'un cours
    }

    public function addMember($idCours, $idClient) {
        // Logique pour ajouter un membre à un cours
    }

    public function editMember($idCours, $idClient) {
        // Logique pour modifier un membre d'un cours
    }

    public function deleteMember($idCours, $idClient) {
        // Logique pour supprimer un membre d'un cours
    }
}
?>