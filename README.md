# Locate famous artworks in your area

## Local development

### Postgres and Go app
```cd ~/development/go-dev/artfinder```

```docker compose up postgres```

```go run main.go``` 

or to run container: 

```docker compose start go-app```

or to run both: 

```docker compose up```

Access on [Localhost:8080](http://localhost:8080/)

### Front end assets
```cd ~/development/go-dev/artfinder/vite```

```npm run build```

JS and CSS are built and copied to artfinder/static/dist/

