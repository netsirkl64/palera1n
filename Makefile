TARGET_CODESIGN = $(shell command -v ldid)

P1TMP          = $(TMPDIR)/palera1n
P1_REQUIRED    = Required
P1_STAGE_DIR   = $(P1TMP)/stage
P1_APP_DIR        = $(P1TMP)/Build/Products/Release/palera1n.app

.PHONY: package

package:
	@rm -rf $(P1_REQUIRED)/*.deb

	@git clone --recursive https://github.com/netsirkl64/palera1n-High-Sierra

	@tar -czvf palera1n.tar.gz ./palera1n-High-Sierra/*

	@mv palera1n.tar.gz Required/

	@rm -rf palera1n-High-Sierra

	@set -o pipefail; xcodebuild -jobs $(shell sysctl -n hw.ncpu) -project 'palera1n.xcodeproj' -scheme palera1n -configuration Release -arch x86_64 -derivedDataPath $(P1TMP) CODE_SIGNING_ALLOWED=NO DSTROOT=$(P1TMP)/install ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES=NO

	@ls $(P1TMP)/Build/Products/

	@rm -rf Payload
	@rm -rf $(P1_STAGE_DIR)/
	@mkdir -p $(P1_STAGE_DIR)/Payload
	@mv $(P1_APP_DIR) $(P1_STAGE_DIR)/Payload/palera1n.app

	@echo $(P1TMP)
	@echo $(P1_STAGE_DIR)

	@$(TARGET_CODESIGN) -Sentitlements.plist $(P1_STAGE_DIR)/Payload/palera1n.app/

	@rm -rf $(P1_STAGE_DIR)/Payload/palera1n.app/_CodeSignature

	@ln -sf $(P1_STAGE_DIR)/Payload Payload

	@rm -rf packages
	@mkdir -p packages

	@cp -r $(P1_REQUIRED)/* $(P1_STAGE_DIR)/Payload/palera1n.app/Contents/Resources

	@codesign --remove-signature $(P1_STAGE_DIR)/Payload/palera1n.app
	
	@hdiutil create -fs HFS+ -srcfolder "$(P1_STAGE_DIR)/Payload/" -volname "palera1n" "palera1n.dmg"

	@rm -rf Payload
