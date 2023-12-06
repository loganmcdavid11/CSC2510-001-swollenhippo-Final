# Documentation for SwollenHippo Enterprise: Ansible Management Server

<h3>Configurating Servers</h3>
To run your ansible management server, you will need:
- Minimum 3 Servers<br />
  - 1 Ansible Management Server<br />
  - 1 Web Server<br />
  - 1 Hybrid Server<br />
    - Acts as a Web Server & Database Server<br />
- Maximun 7 Servers<br />
  - 1 Ansible Management Server<br />
  - 3 Web Servers<br />
    - 1 for each environment<br />
  - 3 Hybrid Servers<br />
    - Acts as a Web Server & Database Server<br />
    - 1 for each environment<br />
There are three environments available to use when running your management server<br />
- Dev<br />
- Test<br />
- Prod<br />
When booting the ansible management server, run this command
<pre>sudo nano /etc/ansible/hosts</pre>
This will take you to your ansible host file, where you can change the ip addresses as necessary to match the different environments
- If you are using only 3 servers, then type the same ip addresses for each environment corresponding to the correct VM
- If you are using the maximum 7 servers, then type each ip address for each environment as you choose as long as they are the correct VM
Since one of the web servers for each environment is hybrid, that ip address will be listed in web servers and database server

<h3>Download Packages and Configure Individual Servers</h3>
You will want to open the terminal for each server (except the ansible management server) and perform the following
1) Set your password
To change your password for each server run:
<pre>sudo passwd</pre>
Then type a secure password that you will remember
2) Install Packages
NOTE: apt and yum are interchangable for whichever image you use
Run these commands:
<pre>sudo apt update</pre>
<pre>sudo apt install ansible</pre>
<pre>sudo apt install nano</pre>
3) Go to your ansible configuration file to change permissions:
<pre>sudo nano /etc/ssh/sshd_config</pre>
Here, you will change "<b>PermitRootLogin</b>" to <b>yes</b>
Next change "<b>PasswordAuthentication</b>" to <b>yes</b>
Do this on every server
- If you would like to save some time, read ahead to the next header before doing this for every server

<h3>Configure SSH Keys with GitHub</h3>
In order to clone a repository on a webserver from github, we need to configurate our ssh keys
We must do this in each server (except the ansible management server)
1) Generate an ssh key
Inside the <u>shellscript_files</u> directory, there is a file called <b>generate_ssh_key.txt</b>. Change your email address to the one linked up with your github account and copy that line
Go into each server, paste the command, and run it. Copy the line at the bottom that starts with "<b>ssh-ed25519</b> "
2) Add your ssh key to github
Log in to your github account and navigate to settings
Under the "Access" dropbox, look for "<b>SSH and GPG Keys</b>. Click that
Look for the green box that says "<b>New SSH key</b>". Click that
Title your ssh key something reasonable in association to what server the key was generated on and paste that line into the key box
Click "<b>Add SSH Key</b>" and you are all set up

<h3>Running the playbook</h3>
It is finally time to run the playbooks. 
But before we do that, there is one last thing that must change before we execute the playbook
Inside of playbook files and shell scripting files, there will be lines that access files by climbing through the directory.
For every time you see <b>jlmcdavid42</b>, change that to your username. 
You can find your username by typing into the terminal <b>whoami</b>
You will need to do this in:
- cron_file.sh
- env_script.sh
- run_playbook.sh
- dev_playbook.yml
- test_playbook.yml
- prod_playbook.yml
There is a playbook for whichever environment you would like to run it on
To run your playbook, navigate to the <u>shellscript_files</u> directory and run this command: 
<pre>./run_playbook.sh</pre>
If there are permission issues, use <b>chmod</b> to match executable permissions
It will then ask you which environment you would like to run a playbook for, where you will then enter either:
- dev
- test
- prod
Your playbook should then execute and perform tasks as needed.
If you have a play that you wouldn't like to execute, navigate to the <u>ansible-playbooks</u> directory and comment out whatever you need.

<h3>Running a Cron Job</h3>
If you would like an ansible playbook to execute every minute, then you are in luck!
To run a cron job for a playbook, navigate to the <u>shellscript_files</u> directory and run this command:
<pre>./cron_file.sh</pre>
If there are permission issues, use <b>chmod</b> to match executable permissions
It will then ask you which environment you would like to run a playbook for, where you will then enter either:
- dev
- test
- prod
Your cron job should then execute for that specific environment every minute

Enjoy :)
