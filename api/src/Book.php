<?php

class Book {

    private $id;
    private $name;
    private $author;
    private $description;

    function getName() {
        return $this->name;
    }

    function getAuthor() {
        return $this->author;
    }

    function setName($name) {
        $this->name = $name;
        return $this;
    }

    function setAuthor($author) {
        $this->author = $author;
        return $this;
    }

    function getId() {
        return $this->id;
    }
    function getDescription() {
        return $this->description;
    }

    function setDescription($description) {
        $this->description = $description;
        return $this;
    }

        function __construct() {
        $this->id = -1;
        $this->name = '';
        $this->author = '';
    }

    static public function create(PDO $conn, $name, $author, $description) {
        $stmt = $conn->prepare(
                'INSERT INTO books (name, author, description) VALUES (:name, :author, :description)'
        );
        $stmt->execute([
            'name' => $name,
            'author' => $author,
            'description' => $description,
        ]);
    }
    
    static public function loadFromDB(PDO $conn, $id){
        $stmt = $conn->prepare('SELECT * FROM books WHERE id=:id');
        $result = $stmt->execute(['id' => $id]);
        if ($result === true && $stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $loadedBook = new Book();
            $loadedBook->id = $row['id'];
            $loadedBook->setName($row['name'])->setAuthor($row['author'])->setDescription($row['description']);
            
            return $loadedBook;
        }
    }
    
    static public function loadAllBooks(PDO $conn) {
        $sql = "SELECT * FROM books ORDER BY name ASC";
        $ret = [];
        $result = $conn->query($sql);
        if ($result !== false && $result->rowCount() != 0) {
            foreach ($result as $row) {
                $loadedBook = new Book();
                $loadedBook->id = $row['id'];
                $loadedBook->setName($row['name']);
                $loadedBook->setAuthor($row['author'])->setDescription($row['description']);
                $ret[] = $loadedBook;
            }
        }
        return $ret;
    }
    
    static public function update(PDO $conn, $id, $name, $author, $description) {
        $stmt = $conn->prepare(
                'UPDATE books SET name=:name, author=:author, description=:description WHERE id=:id'
        );
        $stmt->execute([
            'name' => $name,
            'author' => $author,
            'description' => $description,
            'id' => $id
        ]);
    }
    static public function delete(PDO $conn, $id) {
        $stmt = $conn->prepare(
                'DELETE FROM books WHERE id=:id'
        );
        $stmt->execute([
            'id' => $id,
        ]);
    }
}
