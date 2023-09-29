## Cli helper commands
```bash
# Remove all dangling volumes
docker volume rm $(docker volume ls -q -f "dangling=true")

# Remove all images
docker images -aq | xargs docker rmi

# Automatic cleanup of the system
docker system prune
```
