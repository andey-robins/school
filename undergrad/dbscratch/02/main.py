import uuid
import sys

insert = ""

# stores a tag and all of the document_uuids that have that tag
tags_to_title_uuid = {}
tags_to_uuid = {}

# traverse each file
for file_name in sys.argv[1:]:
    with open(file_name) as file:

        body, title = "", ""
        tags = []

        for line in file.readlines():
            # title
            if line[0:2] == '# ':
                title = line
            # tags
            if line[0:10] == '#### Tags:':
                tags = line[10:].split(',')
                # remove quotes
                for i in range(len(tags)):
                    tags[i] = tags[i].strip().lstrip()
                break

            # exclude text above title
            if title != '':
                body += line
        
        document_uuid = uuid.uuid4()

        body = body.replace('\'', '\"')
        insert += "INSERT INTO a02_title (id, title, body) VALUES ('{}', '{}', '{}');\n".format(document_uuid, title, body)

        # save the document_uuid for each tag
        for tag in tags:
            if not tag in tags_to_title_uuid.keys():
                tags_to_title_uuid[tag] = [document_uuid]
            else:
                tags_to_title_uuid[tag].append(document_uuid)

        # convert tags to inserts into a02_tags
        for tag in tags:
            if not tag in tags_to_uuid.keys():
                tag_uuid = uuid.uuid4()
                tags_to_uuid[tag] = tag_uuid
                insert += "INSERT INTO a02_tags (id, tag) VALUES ('{}', '{}');\n".format(tag_uuid, tag)

# fill a02_title_to_tag
for tag, tag_titles in tags_to_title_uuid.items():
    for title in tag_titles:
        insert += "INSERT INTO a02_title_to_tag (title_id, tag_id) VALUES ('{}', '{}');\n".format(title, tags_to_uuid[tag])

print(insert)