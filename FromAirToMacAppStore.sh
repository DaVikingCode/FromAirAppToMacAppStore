#!/bin/sh
#!/usr/bin/env bash
#$ -N $2

DIR="$( cd "$( dirname "$0" )" && pwd )"

cp $DIR/Info.plist $DIR/$1.app/Contents
cp $DIR/Icon.icns $DIR/$1.app/Contents/Resources

rm $DIR/$1.app/Contents/Frameworks/Adobe\ AIR.framework/Versions/Current/Resources/WebKit.dylib
rm -rf $DIR/$1.app/Contents/Frameworks/Adobe\ AIR.framework/Versions/1.0/Resources/AdobeCP15.plugin
rm -rf $DIR/$1.app/Contents/Frameworks/Adobe\ AIR.framework/Versions/1.0/Resources/Flash\ Player.plugin
rm -rf $DIR/$1.app/Contents/Frameworks/Adobe\ AIR.framework/Versions/1.0/Resources/adobecp.plugin

chmod -R 777 $DIR/$1.app/

#codesign -f -v -s "$2" $DIR/$1.app/Contents/Frameworks/Adobe\ AIR.framework/Versions/1.0/Resources/AdobeCP15.plugin
#codesign -f -v -s "$2" $DIR/$1.app/Contents/Frameworks/Adobe\ AIR.framework/Versions/1.0/Resources/Flash\ Player.plugin
#codesign -f -v -s "$2" $DIR/$1.app/Contents/Frameworks/Adobe\ AIR.framework/Versions/1.0/Resources/adobecp.plugin
codesign -f -v -s "$2" $DIR/$1.app/Contents/Frameworks/Adobe\ AIR.framework/Versions/1.0
codesign -f -v -s "$2" $DIR/$1.app/Contents/Frameworks/Adobe\ AIR.framework
codesign -f -v -s "$2" --entitlements $DIR/entitlements.plist $DIR/$1.app

codesign --display --entitlements - $DIR/$1.app

productbuild --component $DIR/$1.app /Applications $DIR/$1.pkg --sign "$3"

codesign -v --verify $DIR/$1.app

exit 0

#sh FromAirToMacAppStore.sh SillyFamilyDesktop "3rd Party Mac Developer Application: DaVikingCode (XXXXXXXXXX)" "3rd Party Mac Developer Installer: DaVikingCode (XXXXXXXXXX)"