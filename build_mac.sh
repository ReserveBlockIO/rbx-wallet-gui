BASE_DIR=/Users/tylersavery/Projects/rbx/rbx_wallet
BUILD_DIR=$BASE_DIR/installers/resources
ARCHIVE=$BUILD_DIR/Runner.xcarchive
APP=$BUILD_DIR/Runner

rm -rf $ARCHIVE $APP
xcodebuild -workspace $BASE_DIR/macos/Runner.xcworkspace -config Release -scheme Runner -archivePath $ARCHIVE archive
xcodebuild -archivePath $ARCHIVE -exportArchive -exportPath $APP -exportOptionsPlist $BASE_DIR/macos/export_options.plist
rm -rf $ARCHIVE