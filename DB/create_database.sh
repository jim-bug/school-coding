#!/bin/bash
# Autore: Ignazio Leonardo Calogero Sperandeo
# Data: 10/03/2025
# Script per preparare i .sql per il server della scuola.
# by jim_bug // :)


# da completare


user_name="sperandeo"
database_names=()

find . -type f -regex '.*/[A-Z][^/]*\.sql' | while read -r i; do
    file_name="$i"                       # file_name mantiene il path completo
    db_name="$(basename "$i" .sql)"
    mysql --verbose -S /opt/lampp/var/mysql/mysql.sock -u root -p"bazinga :)" -e "
        CREATE DATABASE IF NOT EXISTS \`${db_name}\`;
        USE \`${db_name}\`;
        SOURCE ${file_name};
    "
    
    
    # mysql --verbose -u root -p"bazinga :)" -e "CREATE DATABASE IF NOT EXISTS \`$db_name\`; GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$user_name'@'localhost';"
    # echo "Debug of implementation of database $db_name: "
    # mysql --verbose -u "$user_name" -p"bazinga :)" "$db_name" < "$i"
    # echo "Database $db_name created on $user_name@localhost"
done
