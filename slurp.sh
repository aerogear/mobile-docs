mkdir temp
cd temp
rm -rf *
wget https://github.com/aerogear/aerogear-android-sdk/archive/master.zip


for f in *.zip*
do
  unzip -o $f
done
rm *zip*