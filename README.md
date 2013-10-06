# FreeBSD LAMP


## Why ?

I am using FreeBSD as my LAMP server and every time I needed to create a new instance I had to do it manually 
again and again. This takes time and eventually you get bored of doing this :). Solution: unattended LAMP setup.


## Step-by-step

1. Copy files inside a fresh FreeBSD installation.
2. chmod +x on root sh files (those beginning with 1,2,3)
3. change config.sh to match your setup
4. !IMPORTANT: Run files in order as root!


## Prepare

The `1_prepare.sh` must be ran first. It will get the ports + src and install bash afterwards.

If you don't need the `src` or you already got it comment the lines inside the file.


## Install

Before running the `2_install.sh` you should check the readme files found in each sub-directory.
Comment those ports that you don't need to install.


## Finish

The last script to run is `3_finish.sh`. It runs a script to secure the mysql installation. 
It needs user feedback.


## Logs

In the root directory you have a `install_log` file which records 
the time when a process started like install, skip, finish.


## Time estimations

I have tested the installation on a VirtualBox instance with 2GB RAM and 1 CPU @ 2.2GHz on a SSD.

Results with default installation for ports that took more than 5 minutes:

<table>
    <tr>
        <th>MySQL 5.6</th>
        <td>~1 hour</td>
    </tr>
    <tr>
        <th>nginx</th>
        <td>~5 minutes</td>
    </tr>
    <tr>
        <th>PHP 5.4 + extensions</th>
        <td>~50 minutes</td>
    </tr>
    <tr>
        <th>Git</th>
        <td>~20 minutes</td>
    </tr>
    <tr>
        <th>MC</th>
        <td>~15 minutes</td>
    </tr>
    <tr>
        <th>Zabbix</th>
        <td>~35 minutes</td>
    </tr>
    <tr>
        <th>Samba 3.6</th>
        <td>~25 minutes</td>
    </tr>
</table>
