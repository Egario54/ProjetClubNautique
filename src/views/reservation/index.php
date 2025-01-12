<!DOCTYPE html>
<html>
<head>
    <title>Réservation</title>
</head>
<body>
    <?php include BASE_HEADER; ?>
    <h1>Réservation</h1>
    <form method="post" action="reserve">
        <label for="materiel">Matériel:</label>
        <input type="text" name="materiel" id="materiel">
        <label for="nom">Nom:</label>
        <input type="text" name="nom" id="nom">
        <label for="prenom">Prénom:</label>
        <input type="text" name="prenom" id="prenom">
        <input type="submit" value="Réserver">
    </form>
</body>
</html>