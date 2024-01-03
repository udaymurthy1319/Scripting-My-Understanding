import shutil
import os
from datetime import datetime

def backup_files(source_folder, backup_folder):
    Timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    backup_folder = os.path.join(backup_folder, f"backup_{Timestamp}")

    os.makedir(backup_folder)

    for filename in os.listdir(source_folder):
        source_file_path = os.path.join(source_folder, filename)
        backup_file_path = os.path.join(backup_folder, filename)
        shutil.copy2(source_file_path, backup_file_path)

# Example usage
        source_folder = "path/to/folder"
        backup_folder = "path/to/folder"
        backup_files(source_folder, backup_folder)