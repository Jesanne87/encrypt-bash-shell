#!/bin/bash
if [ $(dpkg-query -W -f='${Status}' shc 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo Install file yang diperlukan? Ini akan mengambil sedikit masa, kejap saja ba.
  read -p 'Press enter to continue.'
  sudo apt-get install npm nodejs
  sudo apt-get install shc
  ln -s /usr/bin/nodejs /usr/bin/node
  npm install -g bash-obfuscate
  sudo apt-get install shc
  sudo apt-get update
fi
if [ $(dpkg-query -W -f='${Status}' npm nodejs 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo Install file yang diperlukan? Ini akan mengambil sedikit masa, kejap saja ba.
  read -p 'Press enter to continue.'
  sudo apt-get install npm nodejs
  sudo apt-get install shc
  ln -s /usr/bin/nodejs /usr/bin/node
  npm install -g bash-obfuscate
  sudo apt-get install shc
fi
clear

##Command
echo "Name fail yang mahu di kunci?"
ls
read -p '' -e NAME

fileExtension=${NAME: -3}
while [[ "$fileExtension" = '.sh' ]]; do
clear
echo "Opss ,sila cuba lagi tanpa file extension(buka .sh)"
echo "Name fail yang mahu di kunci?"
ls
read -p '' -e NAME
fileExtension=${NAME: -3}
clear
done
bash-obfuscate "$NAME".sh -o "$NAME"ob1.sh
sed -i '1i #!/bin/bash' "$NAME"ob1.sh
##Add $!/bin/bash to top of file
bash-obfuscate "$NAME"ob1.sh -o "$NAME"ob2.sh
rm "$NAME"ob1.sh
sed -i '1i #!/bin/bash' "$NAME"ob2.sh
sudo shc -v -r -U  -f "$NAME"ob2.sh
rm "$NAME"ob2.sh
sleep 1;
cp "$NAME"ob2.sh.x "$NAME.sh"
rm "$NAME"ob2.sh.x
rm "$NAME"ob2.sh.x.c

