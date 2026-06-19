#!/bin/bash

publish_steam=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --publish-steam-workshop)
            publish_steam=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            shift
            ;;
    esac
done

mkdir ./target
rm target/*
rm -r steam/target/*
godotpcktool \
  --pack target/KillTheTower.pck \
  --action add --remove-prefix staging \
  --file staging/KillTheTower
cp ./KillTheTower.json target/KillTheTower.json

mkdir -p steam/target/
mkdir -p steam/target/content
cp -r steam/meta/* steam/target
cp -r target/KillTheTower.* steam/target/content

if $publish_steam; then
  echo "Publishing the mod to steam workshop"
  ./steam/uploader/ModUploader upload -w steam/target
fi

cd target && zip -r KillTheTower.zip .
