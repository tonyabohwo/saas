

####Step 1 
Install powerline fonts script (Get script from /docker/script/powerline_fonts.sh)

```
./powerline_fonts.sh
```

####Step 2 
######Install git

```
yum install git -y
```

####Step 3 

######Clone repo

```
git clone https://github.com/milkbikis/powerline-shell
```

####Step 4.

```
cd powerline-shell
```

######Copy config.py.dist to config.py 

```
cp config.py.dist config.py
```

#####Tip: config.py is the file you can edit to suit the segment you want, always make sure to run ./install.py after any change

######Run install.py (This will generate powerline-shell.py)

```
./install.py
```

######Create a symlink to this python script in your home:
ln -s /root/powerline-shell/powerline-shell.py ~/powerline-shell.py


 Edit .bashrc
 
```
vi /root/.bashrc
```

 Add the following at the bottom of .bashrc
 
```
function _update_ps1() {
       PS1="$(~/powerline-shell.py $? 2> /dev/null)"
    }

    if [ "$TERM" != "linux" ]; then
        PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    fi
    
``` 
Exit out of the commandline and log back in and powerline should be show up
  
####Help Links
1. https://github.com/milkbikis/powerline-shell

2. https://github.com/powerline/fonts   