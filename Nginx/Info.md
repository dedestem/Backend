# Setup
> [!WARNING]
> 1. Maak een domein aan > A record naar ip
> 2. Vraag certificaat aan
> 3. Config maken
> - Doe je het anders dan gaat certificaat aanvragen fout

&nbsp;

### Certificaten aanvragen
 - ``` sudo certbot --nginx -d stateapi.davidnet.net ```

&nbsp;
## Beheren
cd ~/Backend/Nginx
- Normaal - Verwijder de oude configs en laad de nieuwe: ``` sudo bash Reload.sh ```

- Wipe - Verwijder alle nginx configs (Alleen lokaal): ``` sudo bash Reload.sh wipe```

- Http - Laad het werken zonder https (Handig voor certificaten): ``` sudo bash Reload.sh http```
&nbsp;

### Toevoegen
 - maak een bestand aan met de naam van de service in sites-enabled doe daar de http en https versie in

 - maak als backup een http only versie die zonder https werkt in sites-http

## Extra information
 - Herstart Nginx:  ``` sudo systemctl restart nginx```
 - Check Config:  ``` sudo nginx -t ```
 - Certificaten hernieuwen:  ```sudo certbot renew  ```


&nbsp;

#### Crontab
Gebruik een cronta bom certs automatisch te hernieuwen

##### Huidig:
Every Sunday 0:00 - ``` sudo cerbot renew ```