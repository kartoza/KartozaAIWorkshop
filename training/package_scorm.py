import os
import shutil
import zipfile
from lxml import etree

# Define paths
content_dir = 'site'
output_zip = 'scorm_package.zip'
scorm_temp_dir = 'scorm_temp'

# SCORM configuration
course_title = "App Training"
organization_name = "MyOrg"

# Ensure content directory exists
if not os.path.isdir(content_dir):
    raise FileNotFoundError(f"Content directory '{content_dir}' does not exist. Run 'mkdocs build' first.")

# Prepare SCORM temporary directory
if os.path.exists(scorm_temp_dir):
    shutil.rmtree(scorm_temp_dir)
os.makedirs(scorm_temp_dir)

# Copy content to SCORM directory
shutil.copytree(content_dir, os.path.join(scorm_temp_dir, 'content'))

# Create imsmanifest.xml
manifest = etree.Element("manifest", identifier="com.scorm.example", version="1.2")
metadata = etree.SubElement(manifest, "metadata")
schema = etree.SubElement(metadata, "schema")
schema.text = "ADL SCORM"
schemaversion = etree.SubElement(metadata, "schemaversion")
schemaversion.text = "1.2"
organizations = etree.SubElement(manifest, "organizations", default="org")
organization = etree.SubElement(organizations, "organization", identifier="org")
title = etree.SubElement(organization, "title")
title.text = course_title
item = etree.SubElement(organization, "item", identifier="item_1", identifierref="res_index")
item_title = etree.SubElement(item, "title")
item_title.text = course_title
resources = etree.SubElement(manifest, "resources")
resource = etree.SubElement(resources, "resource", identifier="res_index", type="webcontent", href="content/index.html")
file = etree.SubElement(resource, "file", href="content/index.html")

# Save imsmanifest.xml
manifest_tree = etree.ElementTree(manifest)
manifest_tree.write(os.path.join(scorm_temp_dir, "imsmanifest.xml"), pretty_print=True, xml_declaration=True, encoding="utf-8")

# Create SCORM zip file
with zipfile.ZipFile(output_zip, 'w', zipfile.ZIP_DEFLATED) as zipf:
    for root, dirs, files in os.walk(scorm_temp_dir):
        for file in files:
            file_path = os.path.join(root, file)
            zipf.write(file_path, os.path.relpath(file_path, scorm_temp_dir))

print(f"SCORM package created: {output_zip}")

# Clean up
shutil.rmtree(scorm_temp_dir)

