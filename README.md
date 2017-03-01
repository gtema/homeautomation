# README #

## Note: After project split (separating backend and frontend into separate repos) and relocation from bitbucket to github there might be still issues in the descriptions.

My HomeAutomation project [HomeAutomation project](https://github.com/gtema/homeautomation) is an attempt to optimize some of the household activities and their efficiency. One of the most noticable examples for that is to keep track of groceries and household products to avoid their disposal or sudden lack. Sometimes you come from the shop and figure out that you have already few packages of flour. On the other hand you start coocking and figure out, that you have no milk. In order to solve this problem and potentially some others this project was created.

There is no idea to make this project public or to provide/guarantee any support to anybody, who would like to use it. However it is not in any way prohibited for anyone to use it.

# Quick summary #

The project consists currently from two independend modules: API (the backend) and the web UI (the frontend).

* [API](https://github.com/gtema/homeautomation-backend) is a simple set of REST CRUD services to provide access to the database. It is based on the python Flask framework.
* [Web UI](https://github.com/gtema/homeautomation-backend) is based on the Redux + React combination. Development is based on the Node.JS, which is, however, unlikely to be used in "production".
* DB is not considered as a module. Feel free to use any database of your choise with access from Python. Do not forget to update requirements.txt with the DB libs

The basic UML diagrams for the project can be viewed from Model.xmi file (created using Umbrello). They are not 100% identical with the state of the project due to the early development phase.

* The backend comes as a submodule from homeautomtion-backend repo
* The frontend comes from homeautomation-frontend repo


## Version

Heavy development stage, therefore just 0.0.3
Usually I do commits while switching between dev stations, so not every commit is considered as end of work.


### How do I get set up? ###

* Use of docker-compose (preferred)

Issue docker-compose up and you are set to go. Local directories are mounted into the images,
so that local changes affect containers immediately without redeployment.

* Use of local python and npm

Use script setup.sh in order to setup python virtual environment and npm modules.
After that use backend/start_server.sh script to start api and web/npm start to start node.js

* Use Heroku PaaS

Create account on Heroku, create python application for the server, add database. Also create node app with [Buildpack](https://github.com/mars/create-react-app-buildpack.git)
Use git push heroku master to push only server content as your app.
For the setup trigger 'init' target to set up db tables and some test data (taken from categories.csv, products.csv)

In the application config variables set the APP_SETTINGS=config.HerokuConfig. Then the DATABASE_URL variable will be respected and used as a DB


* Configuration

Api configuration is present under the backend/{config.py,instance/config.py}
Node requires REACT_APP_API_HOST environment variable to point to the API (default 127.0.0.1:5000), REACT_APP_API_PATH and REACT_API_AUTH_PATH

* Dependencies

Quite a few, listed per component correspondingly (backend/requirements.txt and frontend/package.json)

* Database configuration

Up to now a local SQLite DB is used (app.SQLite) for development purposes. Surely not a production way. On Heroku PG is used. API contains init.py script, which creates the DB schema according to the configured connection and populates it with my "development" data. Feel free to modify it for your needs.


### Security

Backend REST API access is protected by the Basic auth or API_KEY authorization token. In order to use API authorize yourself first at the
given auth point (by default configured /auth) and add received token (or the API_KEY) to the headers of all further API requests. Alternatively simply provide credentials with each API request (basic auth). User creation is not supported so far (during the db initialization few example users are being created)

### Deployment instructions

I'm planning to run the project on the RaspberryPi V1. So most likely it would be deployed under mod_wsgi@apache application serving also compacted JS due to the performance lack. However there are multiple possibilities for deployment:

- docker containers (standalone containers, mixed container with mod_fsgi + compacted JS, docker-compose, docker cloud)
- Standalone apps: API (Flask server, any other Python web server, mod_fsgi) and Web (node.js, minimized JS on a static web werver)
- PaaS:
  - Heroku: API is deployable to the Heroku with no changes now. Just set the config variable APP_SETTINGS=config.HerokuConfig and configure a PG addon
- [AtomicApp](github.com/projectatomic/atomicapp) is in a concept stage and will be prepared as a separate repo

There is small helper script for deployment in the repo root. It currently supports deployment to my home RaspberryPi and Heroku.

The only rule for deployment: connect API with DB of your choice, configure Frontend to provide correct link to API from browsers.

### UML diagrams

update coming soon...
