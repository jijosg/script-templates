## Building the image

We build two images to compare the ubuntu and the alpine images.

```bash
DOCKER_BUILDKIT=1 docker build -t my-image:1.0-ubuntu -f create-custom-user-ubuntu .
DOCKER_BUILDKIT=1 docker build -t my-image:1.0-alpine -f create-custom-user-alpine .
```

## Checking the image size

We should also make sure our images are as small as possible so as to minimize the data transfer and keep the target surface of attacks as small as possible.

```bash
docker images               
REPOSITORY  TAG           IMAGE ID       CREATED              SIZE
my-image    1.0-ubuntu    cb59b96c48c7   About a minute ago   144MB
my-image    1.0-alpine    60a47605c7ce   3 minutes ago        18.4MB
```

## Ensuring image is secure

As can be seen from the result below, a smaller footprint also leads to a secure image.

```bash
> trivy image my-image:1.0-ubuntu
2024-03-01T13:29:55.522+0100    INFO    Need to update DB
2024-03-01T13:29:55.523+0100    INFO    DB Repository: ghcr.io/aquasecurity/trivy-db
2024-03-01T13:29:55.523+0100    INFO    Downloading DB...
43.55 MiB / 43.55 MiB [------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------] 100.00% 6.29 MiB p/s 7.1s
2024-03-01T13:30:03.559+0100    INFO    Vulnerability scanning is enabled
2024-03-01T13:30:03.559+0100    INFO    Secret scanning is enabled
2024-03-01T13:30:03.559+0100    INFO    If your scanning is slow, please try '--scanners vuln' to disable secret scanning
2024-03-01T13:30:03.559+0100    INFO    Please see also https://aquasecurity.github.io/trivy/v0.49/docs/scanner/secret/#recommendation for faster secret detection
2024-03-01T13:30:04.324+0100    INFO    Detected OS: ubuntu
2024-03-01T13:30:04.324+0100    INFO    Detecting Ubuntu vulnerabilities...
2024-03-01T13:30:04.325+0100    INFO    Number of language-specific files: 0

my-image:1.0 (ubuntu 22.04)

Total: 39 (UNKNOWN: 0, LOW: 26, MEDIUM: 13, HIGH: 0, CRITICAL: 0)




> trivy image my-image:1.0-alpine
2024-03-01T13:49:44.720+0100    INFO    Vulnerability scanning is enabled
2024-03-01T13:49:44.720+0100    INFO    Secret scanning is enabled
2024-03-01T13:49:44.720+0100    INFO    If your scanning is slow, please try '--scanners vuln' to disable secret scanning
2024-03-01T13:49:44.720+0100    INFO    Please see also https://aquasecurity.github.io/trivy/v0.49/docs/scanner/secret/#recommendation for faster secret detection
2024-03-01T13:49:45.154+0100    INFO    Detected OS: alpine
2024-03-01T13:49:45.154+0100    INFO    Detecting Alpine vulnerabilities...
2024-03-01T13:49:45.157+0100    INFO    Number of language-specific files: 0

my-image:1.0-alpine (alpine 3.19.1)

Total: 0 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 0, CRITICAL: 0)
```

## Cli helper commands

```bash
# Remove all dangling volumes
docker volume rm $(docker volume ls -q -f "dangling=true")

# Remove all images
docker images -aq | xargs docker rmi

# Automatic cleanup of the system
docker system prune
```
