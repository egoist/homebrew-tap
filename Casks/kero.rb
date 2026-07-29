cask "kero" do
  version "0.1.33"
  sha256 "fa949ddfd1caf0ae1c7611eb5c7a9fb9b258e5d564dea20d7764b97bab128799"

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
