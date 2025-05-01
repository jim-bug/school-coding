<?php
    /*
    * Autore: Ignazio Leonardo Calogero Sperandeo
    * Classe: 5C INF
    * Data: 25/10/2024
    * by jim_bug // :)
    */ 
    function get_name_file($form_type){
        /*
        Funzione che ritorna il nome del file (corrispondente all'entità) e l'elenco ordinato dei campi (secondo il tracciato record).
        */
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
                "telaio",
                "sportelli",
                "posti",
                "marca",
                "modello",
                "motore",
                "km",
                "velocita",
                "cilindrata",
                "data_rev",
                "data_tag",
                "data_imm"
            ];
        }
        return [$name, $field];
    }

    function get_record($method_arr, $field){
        /*
        Funzione che costruisce un record.
        */
        $record = "";
        $len = count($field);
        $i = 0;
        foreach($field as $key => $i){
            if($key == ($len - 1)){
                $record .= $method_arr[$i]."\n";
            }
            else{
                $record .= $method_arr[$i]."=";
            }
        }
        // $record .= "\n";

        return $record;
    }

    function add_record($method_arr){
        list($name, $field) = get_name_file($method_arr["type"]);
        $file = fopen($name, "a");
        fwrite($file, get_record($method_arr, $field));
        fclose($file);
    }

    function delete_record($method_arr){
        /*
         Funzione che elimina un record in base al suo identificativo. 
        */
        list($name, $field) = get_name_file($method_arr["type"]);
        $file = fopen($name, "r");
        $file_content = array();
        while(!feof($file)){
            $line = fgets($file);
            $fields = explode("=", $line);
            
            if($fields[0] != $method_arr["id"]){        // se il primo attributo (identificativo) non è uguale a quello della richiesta, salvo la riga
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

    function get_filter_content_file($file, $id){
        /*
        Funzione che ritorna un array con tutte le righe di un file ad eccezione della riga che presenta come valore dell'attributo 
        identificativo lo stesso di quello passato come argomento. Infine ritorno anche la riga che ha quell'id.
        */
        $file_content = array();
        $modify_line = "";
        
        while(!feof($file)){
            $line = fgets($file);
            $fields = explode("=", $line);
            
            if($fields[0] != $id){        // se il primo attributo (identificativo) non è uguale a quello della richiesta, salvo la riga 
                array_push($file_content, $line);
            }
            else{
                $modify_line = $line;
            }
        }
        return [$file_content, $modify_line];

    }

    function print_record($line, $type){
        /*
        Funzione che stampa su una riga un record con in aggiunta due form per l'eliminazione e modifica di tale
        */
        echo "<tr>";
        if($line == ""){
            return;
        }
        $fields = explode("=", $line);
        foreach($fields as $key => $field){
            echo "<td> $field </td>";
        }
        
        echo<<<FORM_DELETE
            <td>  
                </form> 
                <form action="./modify.php" method="get"> 
                    <input type="hidden" name="id" value="{$fields[0]}">
                    <input type="hidden" name="type" value="{$type}"> 
                    <input type="submit" name="submit" value="Modifica" class="bottone-link"> 
                </form>
            </td>
            <td>
                <form action="" method="get"> 
                    <input type="hidden" name="id" value="{$fields[0]}"> 
                    <input type="hidden" name="type" value="{$type}"> 
                    <input type="submit" name="submit" value="Elimina" class="bottone-link"> 
                </form> 
            </td>
        FORM_DELETE;
        echo "</tr>";
        
    }

    function search_by_field($file, $field, $method_arr, $all=0){
        $counter = 0;
        while(!feof($file)){
                $line = fgets($file);
                if($all){
                    print_record($line, $method_arr["type"]);
                    continue;
                }
                $count = 0;
                foreach(explode("=", $line) as $key => $value){
                    if($method_arr[$field[$key]] != ""){
                        if($value == $method_arr[$field[$key]]){
                            $count ++;
                        }
                        $counter ++;
                    }
                }
                if(($count == $counter)){
                    print_record($line, $method_arr["type"]);
                }
                $counter = 0;
        }
    }


?>