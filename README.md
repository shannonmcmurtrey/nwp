# README

This project is intended to help The Northwest Project manage their data in a HIPPA compliant manner. To faciliate group development on the application it uses Docker to ensure a smooth, reliable, and consistent development environment.

1) Clone this repo.
2) Open the nwp folder in your terminal and type "docker-compose up --build"
3) Open a second terminal window in the same folder and type "docker-compose exec website rake db:setup"
4) Open a web browswer to http://localhost:3000 and log in with the username and e-mail added in db/seeds.rb


#command to import .dump file into docker pg container
#docker exec -i <<container name>> pg_restore -h localhost --clean --no-acl --no-owner -U postgres -d nwp_development < /Users/shannonmcmurtrey/Dropbox/Development/rails_projects/nwp/prod.dump


#  To backup DB from AWS:
#  first log into AWS and make the instance public and update the host URL below.
#  pg_dump -h nwp-db.cdf0xthgtafx.us-west-2.rds.amazonaws.com -U nwp -d ebdb -F c -b -v -f prod.dump
#pg_dump -h nwp-db.cdf0xthgtafx.us-west-2.rds.amazonaws.com -U nwp -d ebdb -F c -b -v -f prod.dump

#  To restore DB into local:
#  pg_restore -h localhost --clean --no-acl --no-owner -d nwp_development -v prod.dump#  To backup DB from AWS:
#  first log into AWS and make the instance public and update the host URL below.
#  pg_dump -h nwp-db.cdf0xthgtafx.us-west-2.rds.amazonaws.com -U nwp -d ebdb -F c -b -v -f prod.dump
#pg_dump -h nwp-db.cdf0xthgtafx.us-west-2.rds.amazonaws.com -U nwp -d ebdb -F c -b -v -f prod.dump

#  To restore DB into local:
#  pg_restore -h localhost --clean --no-acl --no-owner -d nwp_development -v prod.dump