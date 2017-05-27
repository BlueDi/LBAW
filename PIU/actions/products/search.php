include_once('../config/init.php');

function Search($name)
{
    global $conn;
    $stmt = $conn->prepare("SELECT name, ts_rank_cd(textsearch, query) AS rank FROM product, to_tsquery(?) query WHERE query @@ textsearch ORDER BY rank DESC LIMIT 10");

    $stmt->execute(array($name));
    return $stmt->fetchAll();
}

function searchProducts2($query) {
    $s_query = preg_replace('/\s+(?=([^"]*"[^"]*")*[^"]*$)/', '|', $query);
    $s_query = preg_replace('/"(.*?)"/', '($1)', $s_query);
    $s_query = preg_replace('/\s+/', '&', $s_query);
    
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product WHERE to_tsvector(name) @@ to_tsquery(?)");
    $stmt->execute(array($s_query));
    return $stmt->fetchAll();
}
