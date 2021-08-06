import uuid
import sys

def gen_uid():
    return str(uuid.uuid4())

def main():

    tags_dict = {}

    # parse all of the files provided to the script
    for file_name in sys.argv[1:]:
        with open(file_name) as file:

            body, title = '', ''
            tags_list = []

            for line in file.readlines():
                processed_line = line.rstrip()

                # is the title line
                if processed_line[:2] == '# ':
                    title = processed_line[2:]
                    continue
                # is the tags ine
                if processed_line[:10] == '#### Tags:':
                    raw_tags = processed_line[10:].split(',')
                    for tag in raw_tags:
                        tags_list.append(tag.strip()[1:-1])
                    continue
                # is a body line (i.e. after title)
                if title != '':
                    body += processed_line + '\n'

            # done processing file
            document_id = gen_uid()

            print("INSERT INTO a02_title ( id, title, body ) VALUES ( '{}', '{}', '{}' );".format(
                document_id,
                title.replace("'", "''"),
                body.replace("'", "''")
            ))

            for tag in tags_list:
                if not tag in tags_dict.keys():
                    tags_dict[tag] = [document_id]
                else:
                    tags_dict[tag].append(document_id)

    for tag in tags_dict.keys():

        # print(tags_dict[tag])
        # break

        tag_uid = gen_uid()

        print("INSERT INTO a02_tags ( id, tag ) VALUES ( '{}', '{}' );".format(
            tag_uid,
            tag.replace("'", "''")
        ))

        for doc_id in tags_dict[tag]:
            print("INSERT INTO a02_title_to_tag ( title_id, tag_id ) VALUES ( '{}', '{}' );".format(
                doc_id,
                tag_uid,
            ))

if __name__ == "__main__":
    main()