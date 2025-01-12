<?php
// routes.php
define('BASE_PATH', __DIR__);
define('BASE_HEADER', BASE_PATH . '/views/header.php');

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

if ($uri === '/') {
    require 'views/index.php';
} elseif ($uri === '/client') {
    require 'controllers/ClientController.php';
    $controller = new ClientController();
    $controller->index();
} elseif ($uri === '/partenaire') {
    require 'controllers/PartenaireController.php';
    $controller = new PartenaireController();
    $controller->index();
} elseif ($uri === '/materiel') {
    require 'controllers/MaterielController.php';
    $controller = new MaterielController();
    $controller->index();
} elseif ($uri === '/planning') {
    require 'controllers/PlanningController.php';
    $controller = new PlanningController();
    $controller->index();
} elseif ($uri === '/reservation') {
    require 'controllers/ReservationController.php';
    $controller = new ReservationController();
    $controller->index();
} else {
    // Gérer les autres routes
    http_response_code(404);
    echo "Page non trouvée";
}
?>