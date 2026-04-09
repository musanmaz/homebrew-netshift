cask "netshift" do
  version "1.0.0"
  sha256 "9de02ba937cc136537d6801c290e806e60611afa478a6b49f3f722bd4f6a3370"

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
