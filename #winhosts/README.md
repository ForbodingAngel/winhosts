# Portableapps.com compatible.
Simply extract the exe when prompted to your portableapps/portableapps folder and restart the portableapps.com launcher.

## Update on windows restart
The best way to do this is to use the windows task scheduler. Configure it to run on logon of any user. It doesn't need elevated privileges as the program asks for elevation if a newer HOSTS version is found.

# #WinHosts

## Here is an easy to understand description of what the HOSTS file does:
The short answer is that the Hosts file is like an address book. When you type an address like www.google.com into your browser, the Hosts file is consulted to see if you have the IP address, or “telephone number,” for that site. If you do, then your computer will “call it” and the site will open. If not, your computer will ask your ISP’s (internet service provider) computer for the phone number before it can “call” that site. Most of the time, you do not have addresses in your “address book,” because you have not put any there. Therefore, most of the time your computer asks for the IP address from your ISP to find sites.

If you put ad server names into your Hosts file with your own computer’s IP address, your computer will never be able to contact the ad server. It will try to, but it will be simply calling itself and get a “busy signal” of sorts. Your computer will then give up calling the ad server and no ads will be loaded, nor will any tracking take place. Your choices for blocking sites are not just limited to blocking ad servers. You may block sites that serve advertisements, sites that serve objectionable content, or any other site that you choose to block.

## What #WinHOSTS actually does:
We want to stress that this program does not remove spyware if you already have it, nor does it continuously run (it is not a scanner!). It is a massive list of ad/virus/spyware/malicious servers that gets put in your hosts file. This way, when you are browsing the internet, you are kept safe! It isn’t rocket science. Most Windows users don't really have an easy way to use the HOSTS file to their advantage. There are awesome browser tools like uBlock Origin, but that only provides protection when browsing. Using the HOSTS file ensures system wide protection.

## TL;DR
#WinHosts is an automaticly updating HOSTS file for windows endevouring to provide simple protection at the system level
