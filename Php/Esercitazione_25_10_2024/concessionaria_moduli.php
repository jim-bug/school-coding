<?php

function get_name_file($form_type){
    if($form_type == "cliente"){
        $name = "clienti.txt";
        $field = [
            "cod_fisc",
            "nome",
            "cognome",
            "data",
            "sesso",
            "stato",
            "regione",
            "provincia",
            "citta",
            "residenza",
            "num_civ",
            "cap",
            "tel"
        ];
    } 
    elseif($form_type == "auto"){
        $name = "auto.txt";
        $field = [
            "targa",
            "sportelli",
            "posti",
            "marca",
            "modello",
            "telaio",
            "motore",
            "km",
            "velocita",
            "cilindrata",
            "rev",
            "tag",
            "imm"
        ];
    }
    return [$name, $field];
}

function adding_record($method_arr, $field){
    $record = "";
    $len = count($field);
    $i = 0;
    foreach($method_arr as $key => $value){
        if($key != "type"){
            if($i == ($len - 1)){
                $record .= $method_arr[$field[$i]];
            }
            else{
                $record .= $method_arr[$field[$i]]."=";
            }
            $i ++;
        }
    }
    $record .= "\n";
    return $record;

}

function print_record($line){
    echo "<tr>";
    foreach(explode("=", $line) as $field){
        echo "<td> $field </td>";
    }
    echo "</tr>";
}

function search_by_field($file, $field, $method_arr, $page=1){
    /*
    $records_refresh = 10;
    $start_index = ($records_refresh * ($page - 1));
    $end_index = $records_refresh * $page;
    // echo $start_index."<br />".$end_index."<br />";
    $header = true;  
    $i = 0;
    */
    while(!feof($file)){
            $line = fgets($file);
            /*
            if($i < $start_index && $header){
                echo $i;
                $i ++;
            }
            */
            // if($start_index < $end_index){
                // $header = false;
                foreach(explode("=", $line) as $key => $value){
                    if($value == $method_arr[$field[$key]]){    
                        print_record($line);
                        break;
                    }
                }
                // $start_index ++;
            // }
    }
}

function count_records(){
    return count(file("clienti.txt"));
}
?>