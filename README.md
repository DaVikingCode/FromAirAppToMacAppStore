FromAirAppToMacAppStore
=======================

A quick script for going on the Mac App Store from your Adobe Air Application, used for [Silly Family](https://itunes.apple.com/us/app/silly-family/id882669738?).
Thanks to this wonderful [guide](http://pigsels.com/2012/04/air-app-store-publishing-guide/) & Adobe's [article](http://helpx.adobe.com/flash-player/kb/posting-air-app-mac-app.html).

Before running the script, be sure to add `<key>LSApplicationCategoryType</key>` in your *Info.plist* file, like we did.

You will also have to generate an *icns* file. Replace files inside *myicon.iconset* folder and run `iconutil -c icns -o Icon.icns myicon.iconset` to create your icon.

Now you can run the script:
`sh FromAirToMacAppStore.sh "SillyFamilyDesktop" "3rd Party Mac Developer Application: DaVikingCode (XXXXXXXXXX)" "3rd Party Mac Developer Installer: DaVikingCode (XXXXXXXXXX)"`
