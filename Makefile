phony: gen, gen_watch

gen:
	flutter packages pub run build_runner build --delete-conflicting-outputs

gen_watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs


# build_mac:
# 	rm -rf build/macos/Build/Products/Release
# 	flutter build macos

package_mac:
	rm -rf build/macos/Build/Products/Release
	flutter build macos --release
	rm -f ./installers/exports/RBX-OSX-Installer.dmg
	mkdir ./build/macos/Build/Products/Release/RBXWallet.app/Contents/Resources/RBXCore
	cp -r ./installers/resources/macos-intel/RBXCore/ ./build/macos/Build/Products/Release/RBXWallet.app/Contents/Resources/RBXCore
	appdmg ./installers/dmg/config.json ./installers/exports/RBX-OSX-Installer.dmg