# How To Push Source Code To GitLab

### 1. Configure your current git account information

Please replace your own information with the below command.

* git config --global user.name "ZoroZeng"
* git config --global user.email "ZoroZeng@aplex.com.tw"

## 2. Generat SSH public file. Open it with gedit and copy it to GitLab account SSH configure

Please replace your email string for your accont with the below command..

* ssh-keygen -t rsa -C "ZoroZeng@aplex.com.tw"
* gedit ~/.ssh/id_rsa.pub

## 3. Copy your source code tar package and extrat it

Please replace the relative file name that you want to push to repository with the below command..

* cp /media/gitserver/SZ_Portable/myandroid.l5.tar .
* tar xvf myandroid.l5.tar 

## 4. Go to source code 

* cd myandroid/

## 5. Init the repository

* git init

## 6. Add the source code to repository

Please use other commit message replace it with the below command.

* git add .
* git commit -m "init"

## 7. push the localhost git repository to remote repository with master branch

Please replace the repository with your\'s target.

* git push git@127.0.0.1:ZoroZeng/SBC-7112Android5.1.git master
