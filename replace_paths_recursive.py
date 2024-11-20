import os
import argparse

def replace_paths_in_sql_files(old_path, new_path):
    current_directory = os.getcwd()

    for root, dirs, files in os.walk(current_directory):
        for file in files:
            if file.endswith(".sql"):
                file_path = os.path.join(root, file)

                # Read the content of the file
                with open(file_path, "r", encoding="utf-8") as sql_file:
                    content = sql_file.read()

                # Replace the old path with the new path
                updated_content = content.replace(old_path, new_path)

                # Write the updated content back to the file
                with open(file_path, "w", encoding="utf-8") as sql_file:
                    sql_file.write(updated_content)

                print(f"Updated file: {file_path}")

    print("Path replacement completed for all .sql files.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Replace paths in .sql files.")
    parser.add_argument(
        "--old-path", 
        required=True, 
        help="The old path to be replaced."
    )
    parser.add_argument(
        "--new-path", 
        required=True, 
        help="The new path to replace the old path."
    )
    args = parser.parse_args()
    
    replace_paths_in_sql_files(args.old_path, args.new_path)
