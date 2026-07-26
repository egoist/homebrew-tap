cask "kero" do
  version "0.1.26"
  sha256 "e56e315169500d41944f7a0cb3efffd1fc17ce4f5911edc25c2822583db82da2"

  url "https://releases.kero.sh/kero-#{version}.dmg"
  name "Kero"
  desc "Keyboard-first terminal workspace with projects, sessions, and git"
  homepage "https://kero.sh/"

  livecheck do
    url "https://releases.kero.sh/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Kero.app"

  zap trash: [
    "~/.config/kero",
    "~/Library/Application Support/kero",
    "~/Library/Caches/sh.kero",
    "~/Library/HTTPStorages/sh.kero",
    "~/Library/Preferences/sh.kero.plist",
    "~/Library/Saved Application State/sh.kero.savedState",
    "~/Library/WebKit/sh.kero",
  ]
end
