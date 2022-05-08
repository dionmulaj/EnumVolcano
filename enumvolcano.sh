#!/bin/bash

#EnumVolcano has been created by Dion Mulaj

RED='\033[0;31m' #Red
GREEN='\033[0;32m' #Green
BLUE='\033[0;34m' # Blue
CYAN='\033[0;36m' #Cyan - light blue
ORANGE='\033[0;33m' # Orange
PURPLE='\033[0;35m' #Purple
BGREEN='\033[1;32m' #Bold Green
BBLUE='\033[1;34m' #Bold Blue
BPURPLE='\033[1;35m' #Bold Purple
BCYAN='\033[1;36m' #Bold Cyan - light blue
BRED='\033[1;31m' #Bold Red
BORANGE='\033[1;33m' #Bold Orange
NC='\033[0m' # No Color


clear

printf "
${BORANGE}ENUMVOLCANO${NC}
Author: Dion Mulaj
Edits By: github.com/steveirwincyber

Usage: Put this file in the AUTHORIZED target system and run it.
Follow these steps:
-Drop this file inside the server (/tmp directory if available)
-Chmod it (chmod +x enumvolcano.sh)
-Run the script & wait for results"


printf "

OPTIONS:                       

${BGREEN}0) FULL Enumeration${NC}

${BBLUE}|/\/\/\/\/\/\PASSWORD ENUMERATION/\/\/\/\/\/\|${NC}

${BLUE}1) Enumerate In Memory Passwords
2) Find possible old passwords${NC}

${BBLUE}|/\/\/\/\/\/\FILE ENUMERATION/\/\/\/\/\/\|${NC}

${BLUE}3) Find last edited files
4) Find sensitive files (containing 'PASSWORD')
5) Find sensitive files (default paths)${NC}

${BBLUE}|/\/\/\/\/\/\SSH ENUMERATION/\/\/\/\/\/\|${NC}

${BLUE}6) Find sensitive SSH Key files${NC}

${BPURPLE}|/\/\/\/\/\/\CRON JOBS ENUMERATION/\/\/\/\/\/\|${NC}

${PURPLE}7) Cron Jobs - Init.d
7.1) Cron Jobs - Cron*
7.2) Cron Jobs - CronTab
7.3) Cron Jobs - Cron.Allow
7.4) Cron Jobs - Cron.d
7.5) Cron Jobs - Cron.Deny
7.6) Cron Jobs - Spool Cron
7.7) Cron Jobs - Spool Root CronTabs
7.8) ELITE CRON ENUM${NC}

${BPURPLE}|/\/\/\/\/\/\SYSTEMD TIMERS ENUMERATION/\/\/\/\/\/\|${NC}

${PURPLE}8) Enumerate all systemctl timers${NC}

${BORANGE}|/\/\/\/\/\/\SUID ENUMERATION/\/\/\/\/\/\|${NC}

${ORANGE}9) Setuid Enumeration${NC}

${BORANGE}|/\/\/\/\/\/\LIST CAPABILITIES/\/\/\/\/\/\|${NC}

${ORANGE}10) List capabilities${NC}

${BORANGE}|/\/\/\/\/\/\FIND WRITABLE FILES/\/\/\/\/\/\|${NC}

${ORANGE}11) Find files with permission to write (Technique 1)
11.1) Find files with permission to write (Technique 2)${NC}

${BORANGE}|/\/\/\/\/\/\DEFAULT ENUMERATION\/\/\/\/\/\|${NC}

${ORANGE}12) Privilege Escalation Default Enumeration${NC}
"
${BRED}99) EXIT${NC}

echo "

Please choose an option:"

read input


#Enumerate In Memory Passwords
if [ $input = 1 ]
then
	eval strings /dev/mem -n10 | grep -i PASS
	
		printf "
		
		${GREEN}Enumeration has finished!${NC}
		
		"
		
#Find possible old passwords
elif [ $input = 2 ]
then
	cat /etc/security/opasswd
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Find last edited files
elif [ $input = 3 ]
then 
	find / -mmin -10 2>/dev/null | grep -Ev "^/proc|^/sys" | more
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Find sensitive files (Containing 'PASSWORD')
elif [ $input = 4 ]
then 	
	locate password | more
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Find sensitive files (default paths)
elif [ $input = 5 ]
then 	
	cat /boot/grub/i386-pc/password.mod
	cat /etc/pam.d/common-password
	cat /etc/pam.d/gdm-password
	cat /etc/pam.d/gdm-password.original
	cat /lib/live/config/0031-root-password
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"

#Find sensitive SSH Key files
elif [ $input = 6 ]
then 
	find / -name authorized_keys 2> /dev/null
	find / -name id_rsa 2> /dev/null

	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Cron Jobs - Init.d
elif [ $input = 7 ]
then 
	ls -la /etc/init.d
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
#Cron Jobs - Cron*	
elif [ $input = 7.1 ]
then 
	cat /etc/cron*
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Cron Jobs - CronTab	
elif [ $input = 7.2 ]
then 
	ls -la /etc/crontab
	cat /etc/crontab | more
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Cron Jobs - CronAllow	
elif [ $input = 7.3 ]
then 
	ls -la /etc/cron.allow
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Cron Jobs - Cron.d	
elif [ $input = 7.4 ]
then 
	ls -la /etc/cron.d
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Cron Jobs - Cron.Deny	
elif [ $input = 7.5 ]
then 
	ls -la /etc/cron.deny
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Cron Jobs - Spool Cron	
elif [ $input = 7.6 ]
then 
	ls -laR /var/spool/cron
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Cron Jobs - Spool Root Cron	
elif [ $input = 7.7 ]
then 
	ls -la /var/spool/cron/crontabs/root
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#ELITE CRON ENUM
elif [ $input = 7.8 ]
then 
	crontab -l
	ls -alhR /var/spool/cron;
	ls -al /etc/ | grep cron
	ls -al /etc/cron*
	cat /etc/cron*
	cat /etc/at.allow
	cat /etc/at.deny
	cat /etc/cron.allow
	cat /etc/cron.deny*
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Systemctl Enumeration
elif [ $input = 8 ]
then 
	systemctl list-timers --all
	
#SUID/SGID Enumeration
elif [ $input = 9 ]
then 
	ls /usr/bin/sudo -alh
	find / -perm -6000 -type f -exec ls -la {} 2>/dev/null \;
	find / -uid 0 -perm -6000 -type f 2>/dev/null
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#List capabilities
elif [ $input = 10 ]
then 
	getcap -r /usr/bin
	getcap -r /usr/bin/fping
	getcap -r /usr/bin/dumpcap
	getcap -r /usr/bin/gnome-keyring-daemon
	getcap -r /usr/bin/rlogin
	getcap -r /usr/bin/ping
	getcap -r /usr/bin/rsh
	getcap -r /usr/bin/rcp
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Find files with permission to write (Technique 1)
elif [ $input = 11 ]
then 
	find / -perm -2 -type f 2>/dev/null
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Find files with permission to write (Technique 2)
elif [ $input = 11.1 ]
then 
	find / ! -path "*/proc/*" -perm -2 -type f -print 2>/dev/null
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#Default Enum
elif [ $input = 12 ]
then 
	ls -la /etc/passwd
	ls -la /etc/shadow
	ls -la /etc/sudoers
	ls -la /etc/exports
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
#FULL ENUMERATION
elif [ $input = 0 ]
then 
	printf "
	
	${BORANGE}In Memory Passwords: ${NC}
	
	"
	eval strings /dev/mem -n10 | grep -i PASS
	
	printf "
	
	${BORANGE}Old Password/s: ${NC}
	
	"
	cat /etc/security/opasswd
	
	printf "
	
	${BORANGE}Last Edited Files: ${NC}
	
	"
	find / -mmin -10 2>/dev/null | grep -Ev "^/proc"
	
	printf "
	
	${BORANGE}Sensitive files in default paths: ${NC}
	
	"
	cat /boot/grub/i386-pc/password.mod
	cat /etc/pam.d/common-password
	cat /etc/pam.d/gdm-password
	cat /etc/pam.d/gdm-password.original
	cat /lib/live/config/0031-root-password
	
	printf "
	
	${BORANGE}Sensitive SSH Key Files: ${NC}
	
	"
	find / -name authorized_keys 2> /dev/null
	find / -name id_rsa 2> /dev/null
	
	printf "
	
	${BORANGE}Cron Jobs Enum: ${NC}
	
	"
	
	ls -la /etc/init.d
	cat /etc/cron*
	ls -la /etc/crontab
	ls -la /etc/cron.allow
	ls -la /etc/cron.d
	ls -la /etc/cron.deny
	ls -la /var/spool/cron
	ls -la /var/spool/cron/crontabs/root
	crontab -l
	ls -alh /var/spool/cron;
	ls -al /etc/ | grep cron
	ls -al /etc/cron*
	cat /etc/cron*
	cat /etc/at.allow
	cat /etc/at.deny
	cat /etc/cron.allow
	cat /etc/cron.deny*
	
	printf "
	
	${BORANGE}SUID/SGID Enum: ${NC}
	
	"
	
	ls /usr/bin/sudo -alh
	find / -perm -6000 -type f -exec ls -la {} 2>/dev/null \;
	find / -uid 0 -perm -6000 -type f 2>/dev/null
	
	printf "
	
	${BORANGE}Capabilities List: ${NC}
	
	"
	getcap -r /usr/bin
	getcap -r /usr/bin/fping
	getcap -r /usr/bin/dumpcap
	getcap -r /usr/bin/gnome-keyring-daemon
	getcap -r /usr/bin/rlogin
	getcap -r /usr/bin/ping
	getcap -r /usr/bin/rsh
	getcap -r /usr/bin/rcp
	
	printf "
	
	${BORANGE}Writable files: ${NC}
	
	"
	find / -perm -2 -type f 2>/dev/null
	find / ! -path "*/proc/*" -perm -2 -type f -print 2>/dev/null
	
	printf "
	
	${BORANGE}Default Enum: ${NC}
	
	"
	ls -la /etc/passwd
	ls -la /etc/shadow
	ls -la /etc/sudoers
	ls -la /etc/exports
	
	printf "
	
	${GREEN}Enumeration has finished!${NC}
	
	"
	
	
	

fi
