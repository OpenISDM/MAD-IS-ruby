MAD Interface Server
====================


Ratings API
-----------

Using Post
> curl --data "rating[rate]=5&rating[comment]=HelloWOrld" http://localhost:3000/facilities/7/ratings

Using json
> curl --header "Content-Type:application/json" -d '{"comment":"CurlPost3","rate":3, "apikey":"zzz"}' http://localhost:3000/facilities/7/ratings