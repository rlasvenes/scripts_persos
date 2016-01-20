#! /bin/bash

echo_prg() {
    prg=0
    while [ $prg -ne 100 ]
    do
        size1=$(stat -c "%s" $1)
        size2=$(stat -c "%s" $2)
        prg=$(( $size2 * 100 / $size1 ))
        echo $prg
    done
    echo "EOF"
}

cp "$1" "$2" &

(echo_prg "$1" "$2") | whiptail --gauge "text" 20 20 0

wait
