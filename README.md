# Documentation for SwollenHippo Enterprise: Ansible Management Server

<h3>Configurating Servers</h3>
To run your ansible management server, you will need:
- Minimum 3 Servers
  - 1 Ansible Management Server
  - 1 Web Server
  - 1 Hybrid Server
    - Acts as a Web Server & Database Server
- Maximun 7 Servers
  - 1 Ansible Management Server
  - 3 Web Servers
    - 1 for each environment
  - 3 Hybrid Servers
    - Acts as a Web Server & Database Server
    - 1 for each environment
There are three environments available to use when running your management server
- Dev
- Test
- Prod
