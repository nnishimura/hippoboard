# hippoboard-api

Golang REST API for hippoboard.

## Getting Started

Follow [this guide](https://medium.com/@star_zero/gvm%E3%81%A7-gopath%E7%AE%A1%E7%90%86%E3%83%A1%E3%83%A2-194aafbe1e66) and configure GOPATH/PATH with gvm.

```
gvm pkgset use hippoboard
```

start nginx/postgres container.

```
docker-compose up
```

Install dependencies

```
go get
```

## Build

```
cd app
go build -o ./cmd/hippoboard
```

## Others

Update dependencies

```
go mod vendor
```

## Reference
deploy
* https://gist.github.com/amazingandyyy/60edaede96fef0bc5524c01cb5a7f92b
* https://gist.github.com/riandyrn/d8d624aa59f66ae2d29717fdece1e558

project structure
* https://github.com/golang-standards/project-layout
* https://www.mindinventory.com/blog/golang-project-structure/
* https://qiita.com/shiei_kawa/items/eddf48287455380f618f
* https://qiita.com/unokun/items/dcf3ed4fbc4f532f664a

tooling
* https://blog.logrocket.com/how-to-build-a-rest-api-with-golang-using-gin-and-gorm/
* https://github.com/moovweb/gvm

docker
* https://www.saltycrane.com/blog/2019/01/how-run-postgresql-docker-mac-local-development/
