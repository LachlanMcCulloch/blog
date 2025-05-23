#!/bin/bash

TITLE="$1"
if [ -z "$TITLE" ]; then
  echo "Usage: $0 \"Your Post Title Here\""
  exit 1
fi

SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g')
DATE=$(date +"%Y-%m-%d")
FILENAME="_posts/$DATE-$SLUG.md"

cat <<EOF > $FILENAME
---
layout: post
title: "$TITLE"
date: $DATE
categories: blog
---

EOF

echo "Created $FILENAME"