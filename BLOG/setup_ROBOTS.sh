#!/usr/bin/bash

#cd mkdocs_DATA/docs
curl https://raw.githubusercontent.com/ai-robots-txt/ai.robots.txt/main/robots.txt > ./mkdocs_DATA/docs/robots.txt

echo "# Spawning AI
# Prevent datasets from using the following file types

User-Agent: *
Disallow: /
Disallow: *" > /opt/BLOG/mkdocs_DATA/docs/ai.txt
