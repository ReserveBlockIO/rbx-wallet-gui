phony: build_mac, package_mac

gen:
	flutter packages pub run build_runner build --delete-conflicting-outputs

gen_watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs


build_mac:
	rm -rf build/macos/Build/Products/Release
	flutter build macos --release

package_mac:
	rm -f ./installers/exports/RBX-OSX-Installer.dmg
	rm -rf ./build/macos/Build/Products/Release/RBXWallet.app/Contents/Resources/RBXCore
	mkdir ./build/macos/Build/Products/Release/RBXWallet.app/Contents/Resources/RBXCore
	cp -r ./installers/resources/macos-intel/RBXCore/ ./build/macos/Build/Products/Release/RBXWallet.app/Contents/Resources/RBXCore
	appdmg ./installers/dmg/config.json ./installers/exports/RBX-OSX-Installer.dmg

deploy_mac:
	make build_mac && make package_mac

build_win:
	rm -rf build/windows/Build/Products/Release
	flutter build windows --release

package_win:

	rm -f .\installers\exports\RBX-WIN-Installer.exe
	# rm -rf .\build\windows\Build\Products\Release\___________
	# mkdir .\build\windows\Build\Products\Release\_____________
	# cp -r .\installers\resources\windows\RBXCore\ .\build\windows\Build\Products\Release\________
	
	flutter pub run msix:create

deploy_win:
	make build_win && make package_win