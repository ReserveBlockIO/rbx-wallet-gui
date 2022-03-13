# Developer ID Installer cert name
sign_cert="Developer ID Installer: Name (ABCD123456)"
# profile name used with `notarytool --store-credentials`
credential_profile="notary-example.com"

# data from build settings
pkg_name="$PRODUCT_NAME"
identifier="$PRODUCT_BUNDLE_IDENTIFIER"
version="$MARKETING_VERSION"

PKG_PATH="$SRCROOT/$pkg_name-$version.pkg"
NOTARY_LOG="$SRCROOT/notary.log"

echo "Packaging and Notarizing '$pkg_name', version: $version" > "$NOTARY_LOG"
date +"%F %T" >> "$NOTARY_LOG"
echo >> "$NOTARY_LOG"

# usually use `xcodebuild -exportArchive` to get
# the product out of the archive. However, this does not work
# with a command line tool, so we are going direct
PKG_ROOT="$ARCHIVE_PATH/Products/"

# create the pkg
pkgbuild --root "$PKG_ROOT" \
         --identifier "$identifier" \
         --version "$version" \
         --install-location "/" \
         --sign "$sign_cert" \
         "$PKG_PATH" >> "$NOTARY_LOG" 2>&1
echo >> "$NOTARY_LOG"

# notarize
xcrun notarytool submit "$PKG_PATH" \
                 --keychain-profile "$credential_profile" \
                 --wait >> "$NOTARY_LOG" 2>&1
echo >> "$NOTARY_LOG"

# staple
xcrun stapler staple "$PKG_PATH" >> "$NOTARY_LOG" 2>&1

# reveal in Finder
open -R "$PKG_PATH"