# Fuse Shift Tools

This gem is to be installed on a private computer and contains several commandlinetools to deal with the [fuse_shift webapp](https://github.com/magicjascha/fuse_shift).

## Install
```
gem install fuse_shift_tools-0.1.0.gem
```
(or whatever newest version you find in the root-folder)

We suggest to put your private key and your email texts yml-file in  /config/production. (in /config/development/emails_texts_defaults.yml you find a blue print for the emaill texts yml file).

The folders:
/config/production
/folder_not_touched_by_updates

and any folder outside the outside the root-directory of fuse_shift_tools will not be touched by updates.

## Executables:
see for each option --help to get more information, e.g.
```
download --help
```

### download
You can download all registrations, unconfirmed registrations, confirmed registrations and confirmed shifts and decrypt them (see ```download --help``` how to do that). Per default they are printed to the terminal. Probably you want to save them to a csv file:
```
download -k [path to privatekey] -u [root-url of web app] > ./folder_not_touched_by_updates/filename.csv
```
### send_deadline_warning
If you generated a csv from the subset-download of unconfirmed registrations, a few weeks or so before the deadline, you might want to warn those registered people and their contact people, that they didn't confirm. You can send emails to them for that. Before, you will have to set environment variables about which email-server to use in the terminal with 
``` 
export SMTP_ADDRESS=smtp.example.net
```
Same for environment variables PORT,USERNAME,PASSWORD,FROM_EMAIL.

Per default this is only a testrun, to check which emails would be sent:
```
send_deadline_warning -[path to csv-file with unconfirmed registration ]
```
To really send emails you have to set option -r 

### fakedata

You can generate fakedata for test purposes, to get huge datasets. Don't send real emails to them though with
```
send_deadline-warning -f [PATH] -r 
```
The emaill addresses might actually exist.