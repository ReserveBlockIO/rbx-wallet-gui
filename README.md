# RBX Wallet GUI

This is the new version of the RBXWallet GUI which supports both mac and windows.

## Installing

### Windows Install

- Download `RBXWallet-win64.zip` from Github
- Extra the zip file and move to a safe place (ie. `C:/Users/YOURNAME/documents/RBX`)
- Run `RBXWallet.exe`

Note: we are working on providing an MSIX file for an even easier install process on win10/11

### Mac Install

- Download `RBX-OSX-Installer.dmg`
- Open the file
- Drag `RBXWallet` to your applications folder (as shown)
- Run `install.command` (this only needs to be run once)
- Note, you may have to right-click and select open rather than double-clicking since this is coming directly from Github
- Moving forward, just open the app in your `/Applications` directory

Note: if the program starts but the loading spinner persists for more than 60s, please try downloading the .NET 6.0 framework
[Intel - x64](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-6.0.201-macos-x64-installer)
[M1 - arm64](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-6.0.201-macos-arm64-installer)

## Running

Launch the app and wait for the wallet to finish syncing. You can safely import/create your existing/new wallet while it is syncing but sending transactions and validating is disabled until you have reached sync. If your wallet block height is matching (or ahead) of the [rbx.network](https://rbx.network) explorer and it still says "syncing" try closing your wallet and opening again.

## Developing

### Windows Desktop

Pre-requisites:

- [Install Visual Studio 2022 (Community Edition is fine)](https://visualstudio.microsoft.com/downloads/)
- [Install Desktop Development with C++ workload](https://docs.microsoft.com/en-us/cpp/build/vscpp-step-0-installation?view=msvc-170)
- [Flutter SDK](https://flutter.dev/docs/get-started/install/windows)

Once you have the pre-requisites installed, navigate to the `RBXWallet` directory and run `flutter pub get` to install the dependencies.

To check that everything is working, run `flutter doctor` and make sure you have no errors.

To run the app, run `flutter run` in the `RBXWallet` directory. Choose the `Windows` option when prompted.
