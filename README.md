
# Usage

## FIRST USE
### HTTPS Certs
THIS DOCKER COMPOSE USES TLS CERTS.

For first run, please execute [bootstrap.sh](./scripts/bootstrap.sh). This will generate a new CA and place it in the `config/ca` directory.

Import the public key into your system keystore and enjoy HTTPS connections.


### Wisemapping
The DB is blank, you need to uncomment the volume on line `254` of the `docker-compose.yml` file.  This will create a new DB and schema within the MySQL database, IF YOU DO NOT COMMENT OUT THE VOLUME THE DB WILL WIPE UPON NEXT START UP.

## Running

docker compose -f docker-compose.yml up -d

docker compose -f docker-compose.yml down


# Environment Variables
Please see the `.env` file for what can be configured/changed.  please note changing 
the mindmap db settings, you will also need to change `config/wisemapping/app.properties` 
file.  Some additional guidance is provided within the `.env` file.

# DNS
Plase the following in your hosts file or DNS server and update the IP and desired domain:

`127.0.0.1 admin.eccentic.local logs.eccentic.local task.eccentic.local mindmap.eccentic.local draw.eccentic.local bookstack.eccentic.local backup.eccentic.local ca.eccentic.local smtp.eccentic.local`


| DNS                       | Description                                 | Software |
| ------------------------- | ------------------------- | ------------------------------------------- |
| admin.eccentric.local                              | Reverse Proxy                                      | [Traefik](https://traefik.io/traefik/)                                                 |
| auth.eccentric.local                              | Authentication Server                               | [Authelia](https://www.authelia.com/)                                                 |
| logs.eccentric.local                               | Log Viewer                                         | [Dozzle](https://dozzle.dev/)                                                          |
| smtp.eccentric.local                               | Email Server                                        | [Mailpit](https://github.com/axllent/mailpit)                                                   |
| task.eccentric.local                               | Task Management                                    | [Leantime](https://leantime.io/)                                                       |
| mindmap.eccentric.local                            | Mind Map                                           | [Wisemapping](https://www.wisemapping.com/)                                            |
| bookstack.eccentric.local                          | Info Storage/Organisation                          | [Bookstack](https://www.bookstackapp.com/)                                             |
| draw.eccentric.local                               | Diagramming                                        | [Draw.io](https://app.diagrams.net/)                                                   |
| backup.eccentric.local                               | Backups                                        | [Duplicati](https://www.duplicati.com/)                                                   |




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

192.168.8.240 traefik.eccentic.local logs.eccentic.local kanban.eccentic.local mindmap.eccentic.local  draw.eccentic.local paperless.eccentic.local




docker compose -f docker-compose up -d


(wait a couple of mins)

logs will give you container logs