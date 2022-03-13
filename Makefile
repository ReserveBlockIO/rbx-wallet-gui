phony: build_mac, package_mac

gen:
	flutter packages pub run build_runner build --delete-conflicting-outputs

gen_watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs


# build_mac:
# 	rm -rf build/macos/Build/Products/Release
# 	flutter build macos --release

# package_mac:
# 	rm -f ./installers/exports/RBX-OSX-Installer.dmg
# 	rm -rf ./build/macos/Build/Products/Release/RBXWallet.app/Contents/Resources/RBXCore
# 	mkdir ./build/macos/Build/Products/Release/RBXWallet.app/Contents/Resources/RBXCore
# 	cp -r ./installers/resources/macos-intel/RBXCore/ ./build/macos/Build/Products/Release/RBXWallet.app/Contents/Resources/RBXCore
# 	appdmg ./installers/dmg/config.json ./installers/exports/RBX-OSX-Installer.dmg

prep_mac:
	# cd ../Core-Cli && dotnet publish -c Release -r osx-x64 -p:PublishReadyToRun=true --self-contained true
	# cd ../rbx_wallet

	cp -rf installers/resources/macos-intel/RBXCore2/ ./macos/Runner/Resources/RBXCore
	
	# cp -rf ../Core-CLI/ReserveBlockCore/bin/Release/net6.0/osx-x64/publish ./macos/Runner/Resources/RBXCore
	# rm ./macos/Runner/Resources/RBXCore/createdump
	# cp -rf ./installers/resources/macos-intel/RBXCore/ ./macos/Runner/Resources/RBXCore/
	# cp -rf ./installers/resources/macos-intel/RBXCore ./macos/Runner/Resources/RBXCore
	codesign --force --timestamp --options=runtime -s "Developer ID Application: The Young Astronauts Inc. (X3F8QAUJZ3)" ./macos/Runner/Resources/RBXCore/ReserveBlockCore
	# codesign --force --timestamp --options=runtime -s "Developer ID Application: The Young Astronauts Inc. (X3F8QAUJZ3)" ./macos/Runner/Resources/RBXCore/createdump

	# codesign -d --force --options runtime --verbose=4 -s "Developer ID Application: The Young Astronauts Inc. (X3F8QAUJZ3)" --entitlements "./macos/Runner/ReserveBlockCore.entitlements" ./macos/Runner/Resources/RBXCore/ReserveBlockCore
	# codesign -d --force --timestamp --options runtime -s "Developer ID Application: The Young Astronauts Inc. (X3F8QAUJZ3)" --entitlements "./macos/Runner/createdump.entitlements" ./macos/Runner/Resources/RBXCore/createdump
	# codesign --remove-signature ./macos/Runner/Resources/RBXCore/ReserveBlockCore
	# codesign --remove-signature ./macos/Runner/Resources/RBXCore/createdump
	


package_mac:
	rm -f ./installers/exports/RBX-OSX-Installer.dmg
	rm -rf ./installers/resources/Runner/RBXWallet.app/Contents/Resources/RBXCore
	mkdir ./installers/resources/Runner/RBXWallet.app/Contents/Resources/RBXCore
	cp -r ./installers/resources/macos-intel/RBXCore/ ./installers/resources/Runner/RBXWallet.app/Contents/Resources/RBXCore
	appdmg ./installers/dmg/config.json ./installers/exports/RBX-OSX-Installer.dmg


# deploy_mac:
# 	make build_mac && make package_mac

build_win:
	if exist .\build\windows\runner\Release rmdir /s /q ".\build\windows\runner\Release"
	flutter build windows --release
	move ".\build\windows\runner\Release\rbx_wallet_gui.exe" ".\build\windows\runner\Release\RBXWallet.exe"
	Xcopy ".\installers\resources\windows-64\RBXCore" ".\build\windows\runner\Release\RBXCore\" /E /Y /K
	powershell -command Compress-Archive -Force -Path '.\build\windows\runner\Release\' -DestinationPath '.\installers\exports\RBXWallet-win64.zip'
