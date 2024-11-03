<?php
    /*
    * Autore: Ignazio Leonardo Calogero Sperandeo
    * Classe: 5C INF
    * Data: 25/10/2024
    * by jim_bug // :)
    */ 
    function get_name_file($form_type){
        if($form_type == "cliente"){
            $name = "./files/clienti.txt";
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
            $name = "./files/auto.txt";
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
        if($line == ""){
            return;
        }
        $fields = explode("=", $line);
        foreach($fields as $key => $field){
            echo "<td> $field </td>";
        }
        echo "<td> <form action=\"delete.php\" method=\"post\"> <input type=\"hidden\" name=\"id\" value=$fields[0]> <input type=\"hidden\" name=\"type\" value=$_POST[type]> <input type=\"submit\" value=\"Cancella\"> </form>";
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

?>