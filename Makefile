phony: build_mac, package_mac, build_core

gen:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

gen_folder:
	fvm flutter packages pub run build_runner build --build-filter "$(path)/*.dart" --delete-conflicting-outputs

gen_watch:
	fvm flutter packages pub run build_runner watch --delete-conflicting-outputs

fix_gen:
	mkdir ./.dart_tool/flutter_gen
	echo "version: 1.0.0" > ./.dart_tool/flutter_gen/pubspec.yaml


wingen:
	flutter packages pub run build_runner build --delete-conflicting-outputs

wingen_watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs


build_core:
	rm -rf ../Core-CLI/bin/Release
	cd ../Core-CLI && git pull && cd /Users/tylersavery/Projects/rbx/rbx_wallet/
	dotnet publish -c Release -r osx-x64 ../Core-Cli/ --self-contained true -f net6.0 -p:PublishSingleFile=true

package_mac:
	rm -rf ../Core-CLI/bin/Release
	cd ../Core-CLI && git pull && cd /Users/tylersavery/Projects/rbx/rbx_wallet/
	dotnet publish -c Release -r osx-x64 ../Core-Cli/ --self-contained true -f net6.0 -p:PublishSingleFile=true
	rm -f ./installers/exports/RBX-OSX-Intel-Installer.dmg
	rm -f ./installers/exports/VFX-OSX-ARM-Installer.dmg
	rm -f ./installers/resources/Runner/VFXWallet.app
	mv "./installers/resources/Runner/VFX Switchblade.app" "./installers/resources/Runner/VFXWallet.app"
	rm -rf ./installers/resources/Runner/RBXWallet.app/Contents/Resources/RBXCore
	mkdir ./installers/resources/Runner/RBXWallet.app/Contents/Resources/RBXCore
	cp -r ../Core-CLI/ReserveBlockCore/bin/Release/net6.0/osx-x64/publish/ ./installers/resources/Runner/RBXWallet.app/Contents/Resources/RBXCore
	cp -r ./installers/resources/BIP39/ ./installers/resources/Runner/RBXWallet.app/Contents/MacOS/BIP39
	appdmg ./installers/dmg/config.json ./installers/exports/RBX-OSX-Intel-Installer.dmg
	rm -f ./installers/exports/rbx-corecli-mac-intel.zip
	cd ./installers/resources/Runner/RBXWallet.app/Contents/Resources/ && zip -r /Users/tylersavery/Projects/rbx/rbx_wallet/installers/exports/rbx-corecli-mac-intel.zip ./RBXCore/
	cd /Users/tylersavery/Projects/rbx/rbx_wallet/
	open ./installers/exports/

build_win_cli:
	dotnet publish -c Release -r win-x64 ../Core-Cli/ --output ../Core-Cli/rbxpublished --self-contained true -p:PublishSingleFile=true

package_m1:
	rm -rf ../Core-CLI/bin/Release
	cd ../Core-CLI && git pull && cd /Users/tyler/prj/rbx/rbx-wallet-gui/
	dotnet publish -c Release -r osx-arm64 ../Core-Cli/ --self-contained true -f net6.0 -p:PublishSingleFile=true
	rm -f ./installers/exports/RBX-OSX-ARM-Installer.dmg
	rm -f ./installers/exports/VFX-OSX-ARM-Installer.dmg
	rm -f ./installers/resources/Runner/VFXWallet.app
	mv "./installers/resources/Runner/VFX Switchblade.app" "./installers/resources/Runner/VFXWallet.app"
	rm -rf ./installers/resources/Runner/VFXWallet.app/Contents/Resources/RBXCore
	mkdir ./installers/resources/Runner/VFXWallet.app/Contents/Resources/RBXCore
	cp -r ../Core-CLI/ReserveBlockCore/bin/Release/net6.0/osx-arm64/publish/ ./installers/resources/Runner/VFXWallet.app/Contents/Resources/RBXCore
	cp -r ./installers/resources/BIP39/ ./installers/resources/Runner/VFXWallet.app/Contents/MacOS/BIP39	
	appdmg ./installers/dmg/config.json ./installers/exports/VFX-OSX-ARM-Installer.dmg
	rm -f ./installers/exports/rbx-corecli-mac-arm.zip
	rm -f ./installers/exports/vfx-corecli-mac-arm.zip
	cd ./installers/resources/Runner/VFXWallet.app/Contents/Resources/ && zip -r /Users/tyler/prj/rbx/rbx-wallet-gui/installers/exports/vfx-corecli-mac-arm.zip ./RBXCore/
	cd /Users/tyler/prj/rbx/rbx-wallet-gui/
	open ./installers/exports/


	

build_win:
	if exist .\build\windows\runner\Release rmdir /s /q ".\build\windows\runner\Release"
	fvm flutter build windows --release
	move ".\build\windows\runner\Release\rbx_wallet_gui.exe" ".\build\windows\runner\Release\VFXWallet.exe"
	dotnet publish -c Release -r win-x64 ..\ReserveBlock-Core\ --output ..\ReserveBlock-Core\rbxpublished --self-contained true -p:PublishSingleFile=true
	Xcopy "..\ReserveBlock-Core\rbxpublished" ".\build\windows\runner\Release\RBXCore\" /E /Y /K
	copy ".\installers\resources\windows-64\RBXLauncher.exe" ".\build\windows\runner\Release\RBXCore\RBXLauncher.exe" 
	copy ".\installers\resources\windows-64\RBXLauncherTestNet.exe" ".\build\windows\runner\Release\RBXCore\RBXLauncherTestNet.exe" 
	copy ".\installers\resources\windows-64\msvcp140.dll" ".\build\windows\runner\Release\msvcp140.dll" 
	copy ".\installers\resources\windows-64\vcruntime140.dll" ".\build\windows\runner\Release\vcruntime140.dll" 
	copy ".\installers\resources\windows-64\vcruntime140_1.dll" ".\build\windows\runner\Release\vcruntime140_1.dll" 
	Xcopy ".\installers\resources\BIP39" ".\build\windows\runner\Release\BIP39\" /E /Y /K
	C:\"Program Files (x86)"\"Inno Setup 6"\ISCC .\installers\resources\WindowsInstallerScript.iss


build_win7:
	if exist .\build\windows\runner\Release rmdir /s /q ".\build\windows\runner\Release"
	fvm flutter build windows --release
	move ".\build\windows\runner\Release\rbx_wallet_gui.exe" ".\build\windows\runner\Release\VFXWallet.exe"
	dotnet publish -c Release -r win7-x64 ..\ReserveBlock-Core\ --output ..\ReserveBlock-Core\rbxpublished --self-contained true -p:PublishSingleFile=true
	Xcopy "..\ReserveBlock-Core\rbxpublished" ".\build\windows\runner\Release\RBXCore\" /E /Y /K
	copy ".\installers\resources\windows-64\RBXLauncher.exe" ".\build\windows\runner\Release\RBXCore\RBXLauncher.exe" 
	copy ".\installers\resources\windows-64\RBXLauncherTestNet.exe" ".\build\windows\runner\Release\RBXCore\RBXLauncherTestNet.exe" 
	copy ".\installers\resources\windows-64\msvcp140.dll" ".\build\windows\runner\Release\msvcp140.dll" 
	copy ".\installers\resources\windows-64\vcruntime140.dll" ".\build\windows\runner\Release\vcruntime140.dll" 
	copy ".\installers\resources\windows-64\vcruntime140_1.dll" ".\build\windows\runner\Release\vcruntime140_1.dll" 
	Xcopy ".\installers\resources\BIP39" ".\build\windows\runner\Release\BIP39\" /E /Y /K
	C:\"Program Files (x86)"\"Inno Setup 6"\ISCC .\installers\resources\WindowsInstallerScript-win7.iss


deploy_proxy:
	git subtree push --prefix proxy heroku main


build_web_debug:
	fvm flutter build web --profile --dart-define=Dart2jsOptimization=O0

build_web:
	fvm flutter build web


# deploy_web_main:
# 	fvm flutter build web --dart-define ENV=web
# 	firebase use rbx-web-wallet && firebase deploy --only hosting


deploy_web_testnet:
	fvm flutter build web --dart-define ENV=web_testnet
	firebase use rbx-web-wallet-testnet && firebase deploy --only hosting


deploy_web_no_build:
	firebase deploy --only hosting

delete_gen:
	find . -maxdepth 20 -type f \( -name "*.freezed.dart" -o  -name "*.g.dart" \) -delete


run_web:
	fvm flutter run -d chrome --web-port 42069


run_web_cors:
	fvm flutter run -d chrome --web-browser-flag "--disable-web-security" --web-port 42069


run_cli_testnet:
	/Applications/VFXWallet.app/Contents/Resources/RBXCore/ReserveBlockCore testnet enableapi gui

run_cli_testnet_win:
	C:\Users\Administrator\prj\ReserveBlock-Core\rbxpublished\ReserveBlockCore.exe testnet enableapi gui



update_js:
	cp ./assets/js/btc.js ./build/flutter_assets/assets/js/btc.js