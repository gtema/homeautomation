## 0.0.3
* replace authorization to be a more or less usefull (REST login with username and password or api_key returns JWT token and API_KEY, they are then used for further API access) - unfortunately UX has fallen requiring heavy UI restructure
* replace bootstrap with purecss
* moved from bitbucket to github splitting backend and frontend into separate repositories

## 0.0.2 - intermediate commit
* rework sidebar
* rework treeMenu
* repair tests
* normalize ENV (also in docker-compose)
* introduce "invalidated" property to items group and "_invalidated" to the item
* if app starts with the product page - mark productsByCategory as invalid to fetch complete category later

## 0.0.1 - First release
* some initial stuff
