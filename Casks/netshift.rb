cask "netshift" do
  version "1.1.0"
  sha256 "91690a589737ef12c64a9399f2b89f9cb33fe3a72c9cfdef697961139f3c945c"

  url "https://github.com/musanmaz/netshift/releases/download/v#{version}/NetShift-macos.zip"
  name "NetShift"
  desc "DNS and hosts file manager for macOS"
  homepage "https://github.com/musanmaz/netshift"

  depends_on macos: ">= :sonoma"

  app "NetShift.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/NetShift.app"]
  end

  zap trash: [
    "~/Library/NetShift",
    "~/Library/Preferences/com.musanmaz.netshift.plist",
    "~/Library/Logs/DNS Helper.log",
  ]
end
