Step 1

Make a directory and go into it.
```
mkdir -p /opt/nagios
cd /opt/nagiosxi
```
Step 2

Download Nagios
```
wget http://assets.nagios.com/downloads/nagiosxi/xi-latest.tar.gz
```

Unpack the archive
```
tar -xvzf xi-latest.tar.gz
```

Step 3

Go to nagiosxi
```
cd nagiosxi
```
Run the install
```
./fullinstall -n 
```

Hit web interface for the url below
http://ip-address/nagiosxi

You might hit an error saying "NSP: Sorry Dave, I can’t let you do that"

CAUSE/FIX

The problem was due to the user's browser caching older versions of the XI javascript code. In order to clear the cache and prevent this from happening, you need to clear your browser's cache. This is typically done (in Firefox) by holding down the shift key and clicking reload.

My Way

I just used Chrome and it opened fine
