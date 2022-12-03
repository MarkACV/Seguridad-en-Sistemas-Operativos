#! /bin/bash




if cat /etc/centos-release > /dev/null 2>&1; then
	echo '[+] OS is CentOS'
	x=1
 
	elif lsb_release -a > /dev/null 2>&1; then
	echo '[+] OS is Ubuntu'
	x=0

	else echo '[+] OS unkown'
	x=99
fi


#Chek if clamav exists and installation  YUM ONLY CENTOS, ///APT MISSING///

if [ $x -eq 1 ]; then

	if clamscan --version > /dev/null 2>&1; then
		echo '[+] clamav already exists'
		echo '	Uninstalling...'
		sleep 2s
		yum remove -y clamav
	
	echo '[+] Installing clamav...'
	yum install -y clamav

	else	
	
	echo '[+] Installing clamav...'
	sleep 2s
	yum install -y clamav

	fi

elif [ $x -eq 0 ]; then


        if clamscan --version > /dev/null 2>&1; then
                echo '[+] clamav already exists'
                echo '  Uninstalling...'
                sleep 2s
                apt remove -y clamav

        echo '[+] Installing clamav...'
        apt install -y clamav

        else

        echo '[+] Installing clamav...'
        sleep 2s
        apt install -y clamav

        fi

fi

#EPEL installation only if OS is CentOS (x = 1)


if [ $x -eq 1 ]; then
echo '[+] Installing EPEL repositories'
echo ' User will later have to enable those that are needed :)'
sleep 4s


yum install -y epel-release
yum repolist



# Updating packages

echo '[+] Updating packages with available updates'
sleep 2s


yum update -y
yum upgrade -y

elif [ $x -eq 1 ]; then

apt update -y
apt upgrade -y

fi










