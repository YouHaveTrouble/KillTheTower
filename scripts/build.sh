mkdir ./target
rm ./target/*
godotpcktool \
  --pack ./target/KillTheTower.pck \
  --action add --remove-prefix staging \
  --file staging/KillTheTower
cp ./KillTheTower.json ./target/KillTheTower.json

cd target && zip -r KillTheTower.zip .
