<?php
    /*
    * Autore: Ignazio Leonardo Calogero Sperandeo
    * Classe: 5C INF
    * Data: 28/11/2024
    * by jim_bug // :)
    */ 

    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    function get_name_file($form_type){
        // Funzione che ritorna il nome del file (corrispondente all'entità) e l'elenco ordinato dei campi (secondo il tracciato record).
        if($form_type == "studente"){
            $name = "./files/studente.txt";
            $fields = [
                "matricola",
                "nome",
                "cognome",
                "data",
                "citta",
                "telefono"
            ];
            $template_display_text = ['matricola', 'nome', 'cognome'];
        } 
        elseif($form_type == "libro"){
            $name = "./files/libro.txt";
            $fields = [
                "codice",
                "titolo",
                "autore",
                "prezzo",
                "fk_editrice"
            ];
            $template_display_text = ['codice', 'titolo'];
        }
        elseif($form_type == "prestito"){
            $name = "./files/prestito.txt";
            $fields = [
                "data_richiesta",
                "data_restituzione",
                "consegna",
                "riconsegna",
                "fk_studente",
                "fk_libro"
            ];
            $template_display_text = ['matricola', 'nome', 'cognome'];
        }
        elseif($form_type == "editrice"){
            $name = "./files/editrice.txt";
            $fields = [
                "id",
                "nome",
                "indirizzo",
                "provincia",
                "comune",
                "telefono",
                "email"
            ];
            $template_display_text = ['nome', 'email'];
        }
        elseif($form_type == "corso"){
            $name = "./files/corso.txt";
            $fields = [
                "codice",
                "anno",
                "nome",
                "fk_facolta"
            ];
            $template_display_text = ['codice', 'nome', 'fk_facolta'];
        }
        elseif($form_type == "facolta"){
            $name = "./files/facolta.txt";
            $fields = [
                "abbreviazione",
                "denominazione",
                "fk_universita",
                "nome_preside",
                "cognome_preside"
            ];
            $template_display_text = ['abbreviazione', 'fk_universita'];
        }
        elseif($form_type == "universita"){
            $name = "./files/universita.txt";
            $fields = [
                "codice",
                "citta",
                "nome_rettore",
                "cognome_rettore",
                "denominazione"
            ];
            $template_display_text = ['codice', 'denominazione'];
        }
        elseif($form_type == "frequenza"){
            $name = "./files/frequenza.txt";
            $fields = [
                "anno",
                "fk_studente",
                "fk_corso"
            ];
        }
        return [$name, $fields, $template_display_text];
    }

    function show_field_label($field){
        // Funzione che rende presentabile il nome di un campo.
        if(substr($field, 0, 3) == "fk_"){
            $field = substr($field, 3);
        }
        $field = str_replace('_', ' ', $field);

        return ucwords($field);

    }

    function get_record($method_arr, $field){
        // Funzione che costruisce un record.

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

        return $record;
    }

    function add_record($method_arr){
        // Funzione che aggiunge un record
        list($name, $field) = get_name_file($method_arr["type"]);
        $file = fopen($name, "a");
        fwrite($file, get_record($method_arr, $field));
        fclose($file);
    }

    function search_record_by_id($file, $id) {
        foreach($file as $line){
            $fields = explode("=", $line);
            if (trim($fields[0]) == trim($id)) {    // Assumendo che ogni entità abbia come PK il primo attributo
                // fclose($file);
                return $line;
            }
        }
    
        // fclose($file);
        return false; // Restituisce false se l'ID non viene trovato
    }


    function print_record($line, $fields){
        /*
        Funzione che stampa su una riga un record con in aggiunta due form per l'eliminazione e modifica di tale
        */
        echo "<tr>";
        if($line == ""){
            return;
        }
        $values = explode("=", $line);
        foreach($values as $value){
            echo "<td> $value </td>";
        }
        
    }

    function search_by_field($file, $field, $method_arr){
        $counter = 0;
        while(!feof($file)){
                $line = fgets($file);
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
                    print_record($line, $field);
                }
                $counter = 0;
        }
    }

    function get_fk_text($fk_name, $id_fk=-1){
        list($name_fk, $field_fk, $fk_display_fields) = get_name_file($fk_name);
        
        $content_file_fk = file($name_fk);
        $records = [];
    
        if ($id_fk != -1) {
            // Cerca il record per ID
            $fk_record = explode('=', search_record_by_id($content_file_fk, $id_fk));
            $fk_array = array_combine($field_fk, $fk_record);
            $fk_display_text = "";
            foreach($fk_display_fields as $display_field){
                $fk_display_text .= $fk_array[$display_field] . ' ';
            }
            $records[] = ['text' => $fk_display_text];
        } else {
            // Stampa tutti i record
            foreach($content_file_fk as $line){
                $fk_record = explode('=', $line);
                $fk_array = array_combine($field_fk, $fk_record);
                $fk_display_text = "";
                foreach($fk_display_fields as $display_field){
                    $fk_display_text .= $fk_array[$display_field] . ' ';
                }
                $records[] = ['text' => $fk_display_text, 'pk' => $fk_record[0]];
            }
        }
        return $records;
    }
?>
<!-- // :) -->
