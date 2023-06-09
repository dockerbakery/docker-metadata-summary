#!/bin/bash

if [[ -z "${GITHUB_STEP_SUMMARY}" ]]; then
    echo "Failed to find GITHUB_STEP_SUMMARY environment variable."
    exit 1
fi

if [[ -z "${DOCKER_METADATA_OUTPUT_BAKE_FILE}" ]]; then
    echo "Please use docker/metadata-action before using this action."
    exit 1
fi

cat <<EOF >> "$GITHUB_STEP_SUMMARY"
## Docker Metadata

The summary of [docker/metadata-action](https://github.com/docker/metadata-action) action.

**Tags**:
\`\`\`json
$(jq -r '.target."docker-metadata-action".tags' "$DOCKER_METADATA_OUTPUT_BAKE_FILE")
\`\`\`

**Labels**:
\`\`\`json
$(jq -r '.target."docker-metadata-action".labels' "$DOCKER_METADATA_OUTPUT_BAKE_FILE")
\`\`\`

> Generated using [dockerbakery/docker-metadata-summary](https://github.com/dockerbakery/docker-metadata-summary) action.
EOF
