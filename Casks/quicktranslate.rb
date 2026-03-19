cask "quicktranslate" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/flatto-ai/quicktranslate-releases/releases/download/v#{version}/QuickTranslate.dmg"
  name "QuickTranslate"
  desc "Menu bar translation app with hotkey support"
  homepage "https://github.com/flatto-ai/quicktranslate-releases"

  depends_on macos: ">= :sonoma"

  app "QuickTranslate.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/QuickTranslate.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.flatto.quicktranslate.plist",
  ]

  caveats <<~EOS
    QuickTranslate runs in the menu bar.
    After installation, grant Accessibility permission:
      System Settings > Privacy & Security > Accessibility
  EOS
end
