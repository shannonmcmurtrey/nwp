# README

This project is intended to help The Northwest Project manage their data in a HIPPA compliant manner. To faciliate group development on the application it uses Docker to ensure a smooth, reliable, and consistent development environment.  

1) Clone this repo (or download if using Windows, YMMV*).   
2) Open the nwp folder in your terminal and type `docker-compose up --build`   
3) Open a second terminal window in the same folder and type `docker-compose exec website rake db:setup`  
4) Open a web browswer to http://localhost:3000 and log in with the username and e-mail added in db/seeds.rb  


\* If you download the zip file you may have trouble extracting on Windows, you should be able to 'skip' without creating any problems.  
\* In Windows you will also need to setup sharing before you go to step 2.  
###### H6 command to import .dump file into docker pg container
###### H6 docker exec -i <<container name>> pg_restore -h localhost --clean --no-acl --no-owner -U postgres -d nwp_development < /Users/shannonmcmurtrey/Dropbox/Development/rails_projects/nwp/prod.dump


###### H6  To backup DB from AWS:  
###### H6   first log into AWS and make the instance public and update the host URL below.  
###### H6   pg_dump -h nwp-db.cdf0xthgtafx.us-west-2.rds.amazonaws.com -U nwp -d ebdb -F c -b -v -f prod.dump  
###### H6   pg_dump -h nwp-db.cdf0xthgtafx.us-west-2.rds.amazonaws.com -U nwp -d ebdb -F c -b -v -f prod.dump  

###### H6   To restore DB into local:
###### H6   pg_restore -h localhost --clean --no-acl --no-owner -d nwp_development -v prod.dump#  To backup DB from AWS:
###### H6   first log into AWS and make the instance public and update the host URL below.
###### H6   pg_dump -h nwp-db.cdf0xthgtafx.us-west-2.rds.amazonaws.com -U nwp -d ebdb -F c -b -v -f prod.dump
###### H6 pg_dump -h nwp-db.cdf0xthgtafx.us-west-2.rds.amazonaws.com -U nwp -d ebdb -F c -b -v -f prod.dump

###### H6   To restore DB into local:
###### H6   pg_restore -h localhost --clean --no-acl --no-owner -d nwp_development -v prod.dump


###### H6   \# Assumes the database container is named 'db'  

###### H6   DOCKER_DB_NAME="$(docker-compose ps -q db)"  
###### H6   DB_HOSTNAME=db  
###### H6   DB_USER=postgres  
###### H6   LOCAL_DUMP_PATH="path/to/local.dump"  

###### H6   docker-compose up -d db  
###### H6   docker exec -i "${DOCKER_DB_NAME}" pg_restore -C --clean --no-acl --no-owner -U "${DB_USER}" -d "${DB_HOSTNAME}" < "${LOCAL_DUMP_PATH}"  
###### H6   docker-compose stop db  