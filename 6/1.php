<?php

$file = fopen("input.txt","r");
$line = fgets($file);

$arr = array();

for ($i=0; $i < strlen($line); $i++) {
    if (count($arr) >= 3) {
        if (!in_array($line[$i], $arr)) {
            // echo $i+1;
            // echo $line[1];
            // echo $line[$i];
            break;
        }
    }

    echo array_search($line[$i], $arr);
    echo $line[$i];

    // while (in_array($line[$i], $arr)) {
    //     echo "ay?";
    //     unset($arr[0]);
    // }

    array_push($arr, $line[$i]);
    if (count($arr) > 4) unset($arr[0]);
}

fclose($file);

?>