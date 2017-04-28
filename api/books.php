<?php

include_once 'src/Book.php';
header("Content-Type: application/json");

function fixKeysAndSendJson($book) {

    $val = [];
    $key = ['id', 'name', 'author', 'description'];
    foreach ((array) $book as $value) {
        $val[] = $value;
    }
    $betterBook = array_combine($key, $val);
    echo json_encode($betterBook);
}

function fixKeysAndSendJsonArr($booksArr) {
    $res = [];
    foreach ($booksArr as $book) {
        $val = [];
        $key = ['id', 'name', 'author', 'description'];
        foreach ((array) $book as $value) {
            $val[] = $value;
        }
        $betterBook = array_combine($key, $val);
        $res[] = json_encode($betterBook);
    }
    echo json_encode($res);
}

$host = 'localhost';
$db = 'workshops_3';
$user = 'root';
$pass = 'coderslab';
try {
    $conn = new PDO("mysql:host=$host;dbname=$db;charset=UTF8", $user, $pass);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);


    // albo tu robimy caly kod zadania albo ponizej robimy nowe try-catche
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}


if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (!isset($_GET['id'])) {
        $allBooksFromDB = Book::loadAllBooks($conn);
        fixKeysAndSendJsonArr($allBooksFromDB);
    } else {
        $curBookFromDB = Book::loadFromDB($conn, $_GET['id']);
        fixKeysAndSendJson($curBookFromDB);
    }
}
if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    $putVars = file_get_contents("php://input");
    $updtBook = json_decode($putVars, true);
    Book::update($conn, $updtBook['id'], $updtBook['name'], $updtBook['author'], $updtBook['description']);
    echo json_encode($updtBook);
}
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $delVars = file_get_contents("php://input");
    $delBook = json_decode($delVars, true);
    Book::delete($conn, $delBook['id']);
    echo json_encode($delBook);
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    if (!isset($_POST['name']) || !isset($_POST['author'])) {
        echo json_encode(["kolopot"=>"nie dostaje"]);
    } else {        
        Book::create($conn, $_POST['name'], $_POST['author'], $_POST['description']);
        echo json_encode($_POST);
    }
}