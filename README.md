#Homework - 4 Nov
Create an API using Rails for a voting application. You will need the following resources:

## api/v1/candidates
* attributes: name, party, maybe more
* index action
* show action
## api/v1/voters
* attributes: name, party, maybe more
* create action
* show action (with auth to show you are the voter)
* update action (with auth to show you are the voter)
## api/v1/votes
* attributes: voter (unique), candidate
* create (with auth)
* **bonus**: index action that shows candidates and number of votes for each
## Bonus: api/v1/seats
* attributes: name
* has_many candidates
* has_many votes
* votes are now unique for voter and seat

### :metal: Two RailsCasts that will help you: :metal:
http://railscasts.com/episodes/348-the-rails-api-gem
http://railscasts.com/episodes/352-securing-an-api
