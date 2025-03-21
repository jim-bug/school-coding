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
            $name = "./files/studenti.txt";
            $fields = [
                "matricola",
                "nome",
                "cognome",
                "data",
                "citta",
                "telefono"
            ];
        } 
        elseif($form_type == "libro"){
            $name = "./files/libri.txt";
            $fields = [
                "codice",
                "titolo",
                "autore",
                "prezzo",
                "fk_editrice"
            ];
        }
        elseif($form_type == "prestito"){
            $name = "./files/prestiti.txt";
            $fields = [
                "richiesta",
                "restituzione",
                "consegna",
                "riconsegna",
                "fk_studente",
                "fk_libro"
            ];
        }
        elseif($form_type == "editrice"){
            $name = "./files/case_editrici.txt";
            $fields = [
                "id",
                "nome",
                "indirizzo",
                "provincia",
                "comune",
                "telefono",
                "email"
            ];
        }
        return [$name, $fields];
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
        while (!feof($file)) {
            $line = fgets($file);
            $fields = explode("=", $line);
            if (trim($fields[0]) == trim($id)) {    // Assumendo che ogni entità abbia come PK il primo attributo
                fclose($file);
                return $line;
            }
        }
    
        fclose($file);
        return false; // Restituisce false se l'ID non viene trovato
    }
?>
<!-- // :) -->
