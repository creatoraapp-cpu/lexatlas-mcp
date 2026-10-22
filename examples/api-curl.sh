#!/bin/sh
# Verify one legal citation through the LexAtlas HTTP API.
# Put your API key into the environment first:  export LEXATLAS_API_KEY="lxa_..."
# Endpoint docs: https://lexatlas.creatora.app/docs/api/get-verify-cite.html
curl -H "X-API-Key: $LEXATLAS_API_KEY" \
  "https://api.lexatlas.creatora.app/v1/verify/ru:gk_rf_1:196"
