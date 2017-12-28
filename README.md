# English

This is the OSM Mapnik style for osm-bzh project (www.openstreetmap.bzh).
It is derived from the Lyrk mapstyle you can found at https://github.com/lyrk/lyrk-mapstyle.

# French

Ceci est le style OSM Mapnik pour le projet osm-bzh (www.openstreetmap.bzh).
Il est dérivé du style Lyrk que vous pouvez trouver ici : https://github.com/lyrk/lyrk-mapstyle.

# Preview

![preview1](/preview1.png "preview1")

![preview2](/preview2.png "preview2")

# Set up

## The database

**We have 2 databases.**

**One is a classic planet_osm database** loaded by the famous osm2pgsql programm. **The second will contain our views for the map style.** This views are using the classic planet_osm tables of the first database. The link is done by using foreign tables.


In your ```/etc/hosts``` file, add an entry for **db.openstreetmap.local**, with the IP of your PostgreSQL database server.


Login as root then postgres :

```bash
sudo -s
su postgres
```

Create the role 'osm' then the database :

```bash
psql -c "CREATE USER osm WITH LOGIN SUPERUSER PASSWORD 'osmbr';"

psql -c "CREATE DATABASE osm WITH OWNER = osm ENCODING = 'UTF8';"
```


Then go back as osm user OR login as 'osm' user in a terminal.

Execute the SQL commands to setup the database :

```
# move to the git clone repository
cd /data/styles/br/

psql -h db.openstreetmap.local -d osm < database/setup_db.sql
```

Now, create the foreign tables corresponding to the 7 basics osm_planet tables.

```
psql -h db.openstreetmap.local -d osm < database/create_foreign_tables.sql 
```

You can try a simple query to test if all is ok :

```sql
select osm_id, name from planet_osm_line limit 5;
```

We now can create the views :

```
psql -h db.openstreetmap.local -d osm < database/create_views.sql
```



