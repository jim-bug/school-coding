#!/bin/bash
# Autore: Ignazio Leonardo Calogero Sperandeo
# Data: 10/03/2025
# Script per preparare i .sql per il server della scuola.
# by jim_bug // :)


# da completare
help(){
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -u <user_name>      Name of the user to create databases"
    echo "  -h                  Show this help message"
}

parse_args(){
    while getopts "n:" opt; do
        case $opt in
            n)
                user_name="$OPTARG"
                ;;
            \?)
                help
                ;;
        esac
    done
    shift $((OPTIND -1))
    database_names=("$@")
}

user_name="jim_bug"
database_names=()
parse_args $@

for i in "${database_names[@]}"; do
    echo "Creating database $i, debug of creation of database $i: "
    mysql -S "/opt/lampp/var/mysql/mysql.sock" --verbose -u root -p"bazinga :)" -e "CREATE DATABASE IF NOT EXISTS $i; GRANT ALL PRIVILEGES ON $i.* TO '$user_name'@'localhost';"
    echo "Debug of implementation of database $i: "
    mysql -S "/opt/lampp/var/mysql/mysql.sock" --verbose -u $user_name -p"bazinga :)" < $i.sql
    echo "Database $i created on $user_name@localhost"
done