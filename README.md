# Fuse Shift Tools

This gem contains several commandlinetools to deal with the FUSEwebapp.

## Install
```
gem install fuse_shift_tools-0.1.0.gem
```
(or whatever newest version you find in the root-folder)

Put all files which should not be touched by updates into /config/production (e.g. your private key and your email texts) or /folder_not_touched_by_updates or a folder outside the root-directory of fuse_shift_tools.

## Executables:
see for each option --help to get more information

### download
You can download all registrations, unconfirmed registrations, confirmed registrations and confirmed shifts
Probably you want to save them to a csv file:
```
download -k [path to privatekey] -u [root-url of web app] > ~/filename.csv
```
### send_deadline_warning
If you generated a csv from the subset-download of unconfirmed registrations, a few weeks before the deadline, you might want to warn those registered people and their contact people, that they didn't confirm. 
Before you will have to set environment variables about which email-server to use in the terminal with 
``` export SMTP_ADDRESS=smtp.example.net```
same for environment variables PORT,USERNAME,PASSWORD,FROM_EMAIL

Per default this is only a testrun, to check which emails would be sent:
```
send_deadline_warning -[path to confirmed registration csv-file]
```
To really send emails you have to set option -r 

### fakedata

You can generate fakedata for test purposes, to get huge datasets. Don't send real emails with to them though with
```
send_deadline-warning -f [PATH] -r 
```
The emaill addresses might actually exist.