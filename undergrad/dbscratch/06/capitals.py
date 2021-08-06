import redis

r = redis.Redis()

r.mset({
	"Bahamas": "Nasau",
	"Germany": "Berlin",
	"Uruguay": "Montevideo",
	"Finland": "Helsinki",
})

lookup = r.get("Uruguay")
print("Capital of Uruguay: {}".format(str(lookup)))
