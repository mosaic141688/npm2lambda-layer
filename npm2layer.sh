#!/bin/bash
#create a nodejs folder
echo "Enter the name of the package you are installing from NPM"
read package
rm -rf nodejs
mkdir nodejs
cd nodejs
npm init
npm install $package
cd ..
rm layer.zip
zip -r layer.zip ./nodejs
aws lambda publish-layer-version --layer-name $package --description "Created from the npm package of the same name" --compatible-runtimes nodejs4.3 nodejs6.10 nodejs8.10 nodejs10.x nodejs12.x nodejs14.x --zip-file fileb://layer.zip
