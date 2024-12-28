#!/bin/bash

# Controleer of het script als root wordt uitgevoerd
if [ "$(id -u)" -eq 0 ]; then
    # Als het argument 'wipe' is, verwijder de sites-enabled directory en stop
    if [ "$1" == "wipe" ]; then
        rm -rf /etc/nginx/sites-enabled
        echo "Wipe OK!"
        exit 0
    fi

    if [ "$1" == "http" ]; then
        rm -rf /etc/nginx/sites-enabled
            # Stop de nginx service
            sudo systemctl stop nginx
            echo "Nginx stopped."

            # Ga naar de nginx configuratiemap
            cd /etc/nginx/ || { echo "Fout: kan naar /etc/nginx/ navigeren"; exit 1; }

            # Verwijder de bestaande sites-enabled configuraties
            sudo rm -rf sites-enabled
            echo "Oude configuraties verwijderd."

            # Clone de laatste versie van de configuraties van de opgegeven GitHub repository
            sudo git clone https://github.com/dedestem/Backend
            echo "Backend repository gekloond."

            # Kopieer de nieuwe Nx configuraties
            sudo cp Backend/Nginx/sites-http sites-enabled
            echo "Nieuwe configuraties gekopieerd."

            # Verwijder de gekloonde Backend directory
            sudo rm -rf Backend
            echo "Backend repository verwijderd."

            # Start nginx opnieuw op
            sudo systemctl start nginx
            echo "Nginx opnieuw gestart met de nieuwe configuraties."

        exit 0
    fi

    # Stop de nginx service
    sudo systemctl stop nginx
    echo "Nginx stopped."

    # Ga naar de nginx configuratiemap
    cd /etc/nginx/ || { echo "Fout: kan naar /etc/nginx/ navigeren"; exit 1; }

    # Verwijder de bestaande sites-enabled configuraties
    sudo rm -rf sites-enabled
    echo "Oude configuraties verwijderd."

    # Clone de laatste versie van de configuraties van de opgegeven GitHub repository
    sudo git clone https://github.com/dedestem/Backend
    echo "Backend repository gekloond."

    # Kopieer de nieuwe Nginx configuraties
    sudo cp Backend/Nginx/sites-enabled sites-enabled
    echo "Nieuwe configuraties gekopieerd."

    # Verwijder de gekloonde Backend directory
    sudo rm -rf Backend
    echo "Backend repository verwijderd."

    # Start nginx opnieuw op
    sudo systemctl start nginx
    echo "Nginx opnieuw gestart met de nieuwe configuraties."

else
    echo "Voer dit script uit met sudo!"
    exit 1
fi
