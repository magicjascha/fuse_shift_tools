# Fuse Shift Tools

This gem is to be installed on a private computer and contains several commandlinetools to deal with the [fuse_shift webapp](https://github.com/magicjascha/fuse_shift).

People submit registration data for a festival at the web-app FuseShift. As the app follows a high security standard for data, the data is saved on the server only assymmatrically encrypted. In order to assign shifts to the people, the data has to be downloaded to a private computer where the private rsa key resides and decryption can take place. For this purpose you find some commandline tools here.

## Table of Content
* [Install](#install)
* [Executables](#executables)
  * [download](#download)
  * [send_deadline_warning](#send_deadline_warning)
  * [fakedata](#fakedata)  

## Install
```
gem install fuse_shift_tools-1.0.0.gem
```
(or whatever newest version you find in the root-folder)

The folders:
```
/config/production
/folder_not_touched_by_updates
```
and any folder outside the root-directory of fuse_shift_tools will not be touched by updates.

Copy the ./config/development/config.yml into ./config/production/config.yml and adjust it to your needs.

If you choose another path, you have to set the environment variable FS_CONFIG_PATH to that path.

## Executables:

see for each option --help to get more information, e.g.
```
download --help
```

### download

You can download all registrations or use option -s with keywords email_unconfirmed, email_confirmed, shift_confirmed to get the according subset of registrations. 

Download will decrypt them automatically, for which you need the private key. We suggest you put it in  ```/config/production```.

In the config.yml file specify the path to the private rsa key, the URL of your web app and the username of the web apps admin authentication.
The passwords of the admin authentication and the rsa key have to be set as environment variables. If you don't want them in your terminal history you have to put a space infront of export:

```
 export FS_ADMIN_PW =admin_password
 export FS_RSA_PASSWORD=private_key_password
download
```

Per default they are printed to the terminal. Probably you want to save them to a csv file:
```
download -s email_unconfirmed > ./folder_not_touched_by_updates/unconfirmed_registrations.csv
```

### send_deadline_warning

If you generated a csv from the subset-download of unconfirmed registrations, a few weeks or so before the deadline, you might want to warn those registered people and their contact people, that they didn't confirm. You can send emails to them for that. 

In the config.yml file set the SMTP information of the emailaccount you want to use for sending the emails and the path to the csv-file with the unconfirmed registrations.

The password to the emailaccount can be typed into the prompt each time or set via environment variable FS_MAIL_PASSWORD

Per default this is only a testrun, to check which emails would be sent:
```
send_deadline_warning
```

You can customize the emails texts in the config.yml file:

To really send emails you have to add option -r 

### fakedata

You can generate fakedata for test purposes, to get huge datasets. Don't send real emails to them though with option -r of send_deadline_warning . The email-addresses might actually exist.
