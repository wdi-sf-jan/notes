## Redis + Node

### What is redis? How is it different than a relational database?

Redis is an open source, BSD licensed, advanced key-value cache and store. It is often referred to as a data structure server

Redis is what is called a key-value store, often referred to as a NoSQL database. The essence of a key-value store is the ability to store some data, called a value, inside a key. This data can later be retrieved only if we know the exact key used to store it. We can use the command SET to store the value "fido" at key "server:name":


    SET server:name "fido"
    
Redis will store our data permanently, so we can later ask "What is the value stored at key server:name?" and Redis will reply with "fido":


    GET server:name => "fido"

### Redis data structures

### What are some good use cases for Redis?

- Analytics
- Task Queues
- Caching
- Cookie Storage
- Ad Targeting
- Small Data
- Messaging
- Forums
- Search engines 

### When is Redis NOT ideal?

- Relational data (where you need multiple pieces of data that are related, think joins)
- More data that can fit in memory (redis diskstore is not 100% reliable)

### Installing Redis, redis-cli, starting a Redis server 

`brew install redis`

To check if this works run `redis-server`

One you are done with that, run `redis-cli` and see if you are throwin into a redis shell.

### Connecting Redis with Node

[https://github.com/mranney/node_redis](https://github.com/mranney/node_redis)