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
            if($i == ($len - 1)){
                $record .= $method_arr[$field[$i]];
            }
            else{
                $record .= $method_arr[$field[$i]]."=";
            }
            $i ++;
        }
        $record .= "\n";
        return $record;
    }

    function delete_record($name, $method_arr){
        $file = fopen($name, "r");
        $file_content = array();
        while(!feof($file)){
            $line = fgets($file);
            $fields = explode("=", $line);
            
            if($fields[0] != $method_arr["id"]){        // se il primo attributo (identificativo) non è uguale a quello della richiesta, salvo la riga
                echo $method_arr["id"];
                array_push($file_content, $line);
            }
        }
        fclose($file);
        $file = fopen($name, "w");      // cancello tutto il contenuto e riscrivo tale senza la riga che voglio eliminare.
        foreach($file_content as $line){
            // echo $line;
            fwrite($file, $line);
        }
        fclose($file);
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
        echo "<td> <input type=\"hidden\" name=\"id\" value=$fields[0]> <input type=\"hidden\" name=\"type\" value=$_GET[type]> <input type=\"submit\" name=\"submit\" value=\"Cancella\"> </form>";
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