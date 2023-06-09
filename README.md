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
