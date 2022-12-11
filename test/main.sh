#!/bin/bash
set -eu

ENDPOINT="http://localhost:5000"

echo "----"
(set -x; curl -X GET "$ENDPOINT/")

echo "----"
(set -x; curl -X GET "$ENDPOINT/healthz")


echo "----"
(set -x; curl -X GET "$ENDPOINT/test/catch-all/foo/bar/baz?greeting=hello&name=world")

echo "----"
(set -x; curl -X GET "$ENDPOINT/test/template/lucky-go-happy")

echo "----"
SAVE_TO="/tmp/example.svg"
(set -x; curl -X GET  -o "$SAVE_TO" -s "$ENDPOINT/test/sendfile")
ls -lh "$SAVE_TO"

echo "----"
(set -x; curl -X GET "$ENDPOINT/test/path/foo/bar/baz")

echo "----"
(set -x; curl -X GET "$ENDPOINT/test/post/1234")

echo "----"
(set -x; curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"key1": "value1", "key2": "value2"}' \
  "$ENDPOINT/test/post/1234")
