cask "waku" do
  version "0.1.2"
  sha256 "2c5bb91b4d5a68bec9a5ad88e04c0bdc33af4f294469dd75c1e63f5fd9442bcf"

  url "https://releases.waku.sh/Waku-#{version}.dmg"
  name "Waku"
  desc "Native app for local coding agents"
  homepage "https://waku.sh/"

  livecheck do
    url "https://releases.waku.sh/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Waku.app"

  zap trash: [
    "~/.waku",
    "~/Library/Application Support/Waku",
    "~/Library/Caches/sh.waku",
    "~/Library/Caches/Waku",
    "~/Library/HTTPStorages/sh.waku",
    "~/Library/HTTPStorages/sh.waku.binarycookies",
    "~/Library/Preferences/sh.waku.plist",
    "~/Library/Saved Application State/sh.waku.savedState",
    "~/Library/WebKit/sh.waku",
  ]
end
