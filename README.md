# sync
Fast folder sync via ftp

Command line app for synching a local folder with a remote via ftp. Only files with a specified extension get synched. A
good use example would be synching .torrent files from the local ~/Downloads/ folder with a watch folder on a torrent box.

## installation 
App uses Bundler to handle dependancies.

If Bundler is not installed: 
```bash
 gem install bundler
``` 

Run in the app folder
```bash
 bundle install
``` 

## configuration
First time the app is run it will create a config file in the home folder of the user (~/.sync_config). Default values need to be changed in the conf file in order for the app to work. Server name, ftp account name, paths to the local folder and the folder on the server and the extension of the files need to be specified. Values can be passed as command parameters but its convinient to use the conf file for the default setup.

Format for the conf file is JSON. An example configuration:

```json
{
  "global": {
    "options": {
      "server": "andrejkolar.synology.me",
      "account": "admin",
      "local_folder": "/Users/andrejkolar/Downloads/",
      "remote_folder": "/Watch/",
      "extension": ".torrent",
      "config": null,
      "verbosity": "WARN",
      "error_output_format": "basic"
    },
    "commands": {
      "escort": {
        "options": {
          "create_config": null,
          "create_default_config": null,
          "update_config": null,
          "update_default_config": null
        },
        "commands": {
        }
      }
    }
  },
  "user": {
  }
}
```

## gems
[Escort](https://github.com/skorks/escort) gem is used to create the CLI for the app. 

