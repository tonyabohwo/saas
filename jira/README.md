##Install JIRA ON CENTOS 6 & 7

#####Step 1.
######yum update -y

#####Step 2.
######Download JIRA
```
wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.4.3-x64.bin
```
#####Step 3

```
mv atlassian-jira-6.4.3-x64.bin /opt/
cd /opt
chmod a+x atlassian-jira-6.4.3-x64.bin 
./atlassian-jira-6.4.3-x64.bin
```
After the last command, you have to respond to 3 questions on commandline depending on the desired config you want.

You hit JIRA on browser via http://localhost:8080, and you procede with GUI configuration to fully setup


