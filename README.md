
# Usage

## FIRST USE
The DB is blank, you need to uncomment the volume on line `194` of the `docker-compose.yml` file.  This will create a new DB and schema within the MySQL database, IF YOU DO NOT COMMENT OUT THE VOLUME THE DB WILL WIPE UPON NEXT START UP.

## Running

docker compose -f docker-compose.yml up -d

docker compose -f docker-compose.yml down


# Environment Variables
Please see the `.env` file for what can be configured/changed.  please note changing 
the mindmap db settings, you will also need to change `config/wisemapping/app.properties` 
file.  Some additional guidance is provided within the `.env` file.

# DNS
Plase the following in your hosts file or DNS server and update the IP and desired domain:

127.0.0.1 admin.noodle.local logs.noodle.local kanban.noodle.local mindmap.noodle.local draw.noodle.local

* admin - Traefik (http://admin.noodle.local:8080/)  [Currently Secured, look at `command` compose settings]
* logs  - Dozzle Container Log Viewer (http://logs.noodle.local/)
* kanban - Planka KanBan (http://kanban.noodle.local/)
* mindmap - Wisemapping Mindmap (http://mindmap.noodle.local/)
* draw - Draw.io Tool (http://draw.noodle.local/)



#####################################################################################
        ROUGH NOTES ON HOW TO GET WISEMAPPING WORKING MANUALLY
#####################################################################################






https://www.wisemapping.com/




You need to create the database before wisemapping will work

this can be done by putting the "build_db.sql" SQL script in /docker-entrypoint-initdb.d/  folder within the postgesss db
https://gist.github.com/onjin/2dd3cc52ef79069de1faa2dfd456c945
https://cadu.dev/creating-a-docker-image-with-database-preloaded/


Run postgress to build the DB and then nuke the running image (backup the clean DB)






create folder "config" within the same dir as the docker-compose
copy "app.properties" to the config folder




Im running in a VM, add this to your hosts file or update your DNS acordingly..

192.168.8.240 traefik.noodle.local logs.noodle.local kanban.noodle.local mindmap.noodle.local  draw.noodle.local paperless.noodle.local




docker compose -f docker-compose up -d


(wait a couple of mins)

logs will give you container logs