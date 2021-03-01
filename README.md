# Minecraft server in Docker
Always fetches the latest minecraft server to run in a Docker container. Overwrite the first and second arguments for the minimum and maximum of RAM needed.
## Example
```
docker build -t minecraft .
docker run -p 25565:25565 minecraft 1 1
```
The commands above run a Minecraft server with 1GB minimum and 1GB maximum RAM.
