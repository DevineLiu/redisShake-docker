# redisShake-docker

### build for multi platforms
```
docker buildx build --platform linux/arm64,linux/amd64,linux/386,linux/arm/v6,linux/arm/v7 --push -t devineliu/redis-shake:latest .
``` 

### RUN 
```
docker run -it -e TYPE=sync -v $(config_path)/redis-shake.conf:/redis-shake.conf  devineliu/redis-shake:latest 
```


### ENV

`TYPE`: will be mount as arg -type=${TYPE} 


### REF 

https://github.com/alibaba/RedisShake/tree/release-v2.1.2-20220329