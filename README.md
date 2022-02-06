# WoW Backup Helper

Batch script and scheduled task to automatically backup important World of Warcraft directories, such as WTF, Interface, Screenshots, etc.

## Installation

1. Download the [latest release](https://github.com/GabeStah/wow-backup-helper/releases/latest) archive.
2. Unzip to the location of your choice.

## Configuration

1. Navigate to the unzipped `wow-backup-helper/src` directory.
2. Right-click the `create-backup.bat` file and open it in the text editor of your choice.
3. Find the following line:

   ```
   SET gameDirectory=D:\Games\World of Warcraft\_retail_
   ```

4. Change `D:\Games\World of Warcraft\_retail_` to your own `<WoW>\_retail_` installation directory.
5. Save the `create-backup.bat` file.
6. Double-click the `create-task.bat` file.

   This creates a Windows scheduled task to perform the backup on a regular basis. It runs every 3 days by default.

## Usage

Once the `WoW Backup Helper` task is created you're all set. Backups will be placed in a `/backups/<timestamp>` directory in zipped format.

### Restore a backup

In the event you need to restore a backup follow these steps:

1. Navigate to the `/backups` directory.
2. Find the an appropriate .zip backup file.
3. Copy the backup .zip file to your World of Warcraft `_retail_` directory.
4. Unzip the contents of the backup inside the `_retail_` directory, opting to overwrite existing files if needed.

   Backups are generated from the root `_retail_` directory, so the zip already contains the appropriate directory tree.

### Change the backup schedule

1. Open the Start menu and launch **Task Scheduler**.
2. Select the `Task Scheduler Library` root directory in the left-side menu.
3. Scroll down the list and right-click the `WoW Backup Helper` task.
4. Select **Properties**.
5. Adjust the **Triggers** as needed.
6. _(Optionally)_ Adjust the **Conditions** as needed.
