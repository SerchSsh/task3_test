<?php

$dbHost = 'localhost';
$dbPort = 3306;
$dbName = 'fotostrana';
$dbUser = 'fotostrana';
$dbPass = '';

$step = 10000;

try {
    $dbh = new PDO("mysql:host={$dbHost};port={$dbPort};dbname={$dbName}", $dbUser, $dbPass);

    $result = [];
    $start = 0;
    do {
        $limit = $start . ',' . $step;
        $selectEmails = $dbh->query("SELECT email FROM `users` LIMIT {$limit}");

        $emailList = [];
        
        foreach ($selectEmails as $row) {
            $emailList = explode(',',trim($row['email']));
            foreach($emailList as $val){
                
                $tmp = explode('@', $val);
                if (isset($tmp[1]) && $tmp[1] != ''){
                    if(array_key_exists($tmp[1], $result) ){
                        $result[$tmp[1]]++;
                    }else{
                        $result[$tmp[1]] = 1;
                    }
                }
            }
        }

        $start += $step;

    } while (count($emailLis));

    echo 'result: ' . PHP_EOL;
    print_r($result);

    $dbh->query("DROP TABLE {$tmpTableName}");

    $dbh = null;
} catch (PDOException $e) {
    echo 'Error: ' . $e->getMessage();
}