## About

Generate job summary for [docker/metadata-action](https://github.com/docker/metadata-action) action.

## Usage

```yaml
# ...

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      # ...

      - name: Docker Metadata
        uses: docker/metadata-action@v4
        with:
          images: |
            name/app
          tags: |
            type=ref,event=branch
            type=ref,event=pr
            type=semver,pattern={{version}}
            type=semver,pattern={{major}}.{{minor}}
            type=sha

      - name: Docker Metadata Summary
        uses: dockerbakery/docker-metadata-summary@v1
      # ...
```

## Example

### Docker Metadata

The summary of [docker/metadata-action](https://github.com/docker/metadata-action) action.

**Tags**:
```json
[
  "hello-world:master",
  "hello-world:sha-a2269bd"
]
```

**Labels**:
```json
{
  "org.opencontainers.image.title": "hello-world",
  "org.opencontainers.image.description": "",
  "org.opencontainers.image.url": "https://github.com/docker-library/hello-world",
  "org.opencontainers.image.source": "https://github.com/docker-library/hello-world",
  "org.opencontainers.image.version": "master",
  "org.opencontainers.image.created": "2023-06-12T05:18:12.949Z",
  "org.opencontainers.image.revision": "a2269bdb107d086851a5e3d448cf47770b50bff7",
  "org.opencontainers.image.licenses": "MIT license"
}
```

> Generated using [dockerbakery/docker-metadata-summary](https://github.com/dockerbakery/docker-metadata-summary) action.
