# movies_library

a simple app used to parse csv files for movies and their corresponding data

run the following commands to run the app :
    1 - `docker compose up --build`
    2 - `docker compose exec web bundle exec rails db:seed`

endpoint to list all movies order by their average rating : `/movies`

Missing Requirement : add an endpoint to find the actor (due to time limitation)

ares of improvement : 
    1 - add a background processor to process some logic to improve performance
    2 - edit association to get all the needed data instead of just distinct ones

