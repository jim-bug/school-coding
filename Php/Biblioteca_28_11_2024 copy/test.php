<?php 
                while(!feof($file)):
                    if(isset($_GET[$field[0]])){        // verifico se è stato richiesto di stampare un solo record
                        $line = search_record_by_id($file, $_GET[$field[0]]);
                    }
                    else{
                        $line = fgets($file);
                    }
                    $values = explode("=", $line);
                    $len = count($values);
                ?>
                    <tr>
                        <?php foreach($values as $key => $value): 
                            if(substr($field[$key], 0, 3) == "fk_"):
                                $fk_name = substr($field[$key], 3);     // ottengo il nome completo della tabella
                                list($name_fk, $field_fk) = get_name_file($fk_name);
                                $f = fopen($name_fk, 'r');
                                $fk_record = explode('=', search_record_by_id($f, $value));

                                // Aggiunta del link per far visualizzare una pagina con il record scelto.
                            ?>
                                <td><a style="color:black" href="show.php?type=<?php echo $fk_name; ?>&<?php echo $field_fk[0]; ?>=<?php echo $value; ?>"><?php echo "$fk_record[0] ($fk_record[1], $fk_record[2])"; ?></a></td>
                            <?php else: ?>
                                <td><?php echo $value; ?></td>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </tr>
                    <?php if(isset($_GET[$field[0]])){
                        break;
                    } ?>
                <?php endwhile;?>