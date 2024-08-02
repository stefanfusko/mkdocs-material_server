#!/bin/bash

DATE=$(date +"%Y-%m-%d")

cat <<EOL > /home/stefus/BLOG/mkdocs_DATA/docs/humans.txt
X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*
Please ignore the text above if you're a person :)

/* SITE */
    Author: Štefan Fusko
    Site: https://fusko.xyz
    Language: Markdown, HTML, CSS, JavaScript
    Framework: MkDocs, MkDocs-Material
    CDN: Cloudflare
    Last update: $DATE
EOL
