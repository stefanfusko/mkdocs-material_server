#!/bin/bash

# Set the base URL for the sitemap
BASE_URL="https://fusko.xyz"

# Set the directory containing the .md files
MD_DIR="/opt/BLOG/mkdocs_DATA/docs"

# Set the output sitemap file
SITEMAP_FILE="/opt/BLOG/mkdocs_DATA/docs/assets/sitemap.xml"

# Start the sitemap XML file
echo '<?xml version="1.0" encoding="UTF-8"?>' > $SITEMAP_FILE
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> $SITEMAP_FILE

# Function to extract date from YAML front matter
extract_date() {
  local file=$1
  local key=$2
  local date=$(grep -A 2 "^date:" "$file" | grep "$key:" | sed "s/.*$key: //")
  echo $date
}

# Find all .md files in the specified content directory
find $MD_DIR -type f -name '*.md' | while read md_file; do
  # Convert the file path to a URL path
  url_path=$(echo $md_file | sed "s|$MD_DIR||" | sed 's|\.md$|.html|')

  # Create the full URL
  url="$BASE_URL$url_path"

  # Extract the created and updated dates
  created_date=$(extract_date "$md_file" "created")
  updated_date=$(extract_date "$md_file" "updated")

  # Add the URL and dates to the sitemap
  echo "  <url>" >> $SITEMAP_FILE
  echo "    <loc>$url</loc>" >> $SITEMAP_FILE
  if [ -n "$created_date" ]; then
    echo "    <lastmod>$created_date</lastmod>" >> $SITEMAP_FILE
  fi
  if [ -n "$updated_date" ]; then
    echo "    <changefreq>monthly</changefreq>" >> $SITEMAP_FILE
    echo "    <priority>0.8</priority>" >> $SITEMAP_FILE
  fi
  echo "  </url>" >> $SITEMAP_FILE
done

# End the sitemap XML file
echo '</urlset>' >> $SITEMAP_FILE

echo "Sitemap has been generated: $SITEMAP_FILE"
