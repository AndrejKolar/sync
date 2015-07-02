# sync
Fast folder sync via ftp

Command line app for synching a local folder with a remote via ftp. Only files with a specified extension get synched. A
good use example would be synching .torrent files from the local ~/Downloads/ folder with a watch folder on a torrent box.

### installation 
App uses Bundler to handle dependancies.

If Bundler is not installed: 
```bash
 gem install bundler
``` 

Run in the app folder
```bash
 bundle install
``` 

### Gems
[Escort](https://github.com/skorks/escort) used to create the CLI for the app. 

