<!DOCTYPE html>
<html>
<head>
    <title>Liste des Matériels</title>
</head>
<body>
    <?php include BASE_HEADER; ?>
    <h1>Liste des Matériels</h1>
    <form method="post" action="filter">
        <label for="disponible">Disponible:</label>
        <select name="disponible" id="disponible">
            <option value="1">Oui</option>
            <option value="0">Non</option>
        </select>
        <input type="submit" value="Filtrer">
    </form>
    <!-- Logique pour afficher la liste des matériels -->
</body>
</html>