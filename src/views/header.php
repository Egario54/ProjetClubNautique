<!DOCTYPE html>
<html>
<head>
    <title>Gestion de Camping</title>
</head>
<body>
<?php
// Définir le chemin de base dynamique
$baseUrl = dirname($_SERVER['SCRIPT_NAME']);
$baseUrl = rtrim($baseUrl, '/');
?>
<nav>
    <ul>
        <li><a href="<?= $baseUrl ?>/client">Clients</a></li>
        <li><a href="<?= $baseUrl ?>/partenaire">Partenaires</a></li>
        <li><a href="<?= $baseUrl ?>/materiel">Matériel</a></li>
        <li><a href="<?= $baseUrl ?>/planning">Planning</a></li>
        <li><a href="<?= $baseUrl ?>/reservation">Réservation</a></li>
    </ul>
</nav>
