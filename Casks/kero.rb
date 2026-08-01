cask "kero" do
  version "0.1.37"
  sha256 "924187548ef8194d89016cffd16472340cfa2eb6b17837a3b8b200a6c34cef36"

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
