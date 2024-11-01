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

?>