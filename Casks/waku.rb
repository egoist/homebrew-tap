cask "waku" do
  version "0.1.1"
  sha256 "120a04548071e77eb550357a157043e3079219fc23dc4d14830ebed3931ceac9"

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
