<?php
// controllers/ReservationController.php
class ReservationController {
    public function index() {
        include 'views/reservation/index.php';
    }

    public function reserve($materiel, $nom, $prenom) {
        // Logique pour réserver un matériel
    }

    public function pay($idReservation, $montant) {
        // Logique pour valider le paiement
    }
}
?>