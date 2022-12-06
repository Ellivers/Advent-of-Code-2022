<?php

$file = fopen("input.txt","r");
$line = fgets($file);

$arr = array();

for ($i=0; $i < strlen($line); $i++) {
    while (in_array($line[$i], $arr)) {
        array_splice($arr, 0, 1);
    }

    array_push($arr, $line[$i]);
    
    if (count($arr) >= 14) {
        echo $i+1;
        break;
    }
}

echo "\n";
foreach ($arr as $char) {
    echo $char;
}

fclose($file);

?>