cask "netshift" do
  version "1.2.0"
  sha256 "1c65910e8278efc8e12e44f7d4d4d70c1e606722f9021b122e6c2de761464c34"

  url "https://github.com/musanmaz/netshift/releases/download/v#{version}/NetShift-macos.zip"
  name "NetShift"
  desc "DNS and hosts file manager for macOS"
  homepage "https://github.com/musanmaz/netshift"

  depends_on macos: :sonoma

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
