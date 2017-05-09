# How To Push Source Code To GitLab

## Configure your current git account information

Please replace your own information with the below command.

* git config --global user.name "zengjianfeng"
* git config --global user.email "zengjianfeng@aplex.com.tw"

## Generat SSH public file. Open it with gedit and copy it to GitLab account SSH configure

Please replace your email string for your accont with the below command..

* ssh-keygen -t rsa -C "zengjianfeng@aplex.com.tw"
* gedit ~/.ssh/id_rsa.pub

## Copy your source code tar package and extrat it

Please replace the relative file name that you want to push to repository with the below command..

* cp /media/gitserver/SZ_Portable/myandroid.l5.tar .
* tar xvf myandroid.l5.tar 

## Go to source code 

* cd myandroid/

## Init the repository

* git init

## Add the source code to repository

Please use other commit message replace it with the below command.

* git add .
* git commit -m "init"

## push the localhost git repository to remote repository with master branch

Please replace the repository with your\'s target.

* git push git@127.0.0.1:zengjianfeng/SBC-7112Android5.1.git master
