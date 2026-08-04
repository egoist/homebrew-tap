cask "postcat" do
  version "0.1.1"

  on_arm do
    url "https://github.com/egoist/postcat/releases/download/v0.1.1/postcat-0.1.1-aarch64-apple-darwin.tar.gz"
    sha256 "b721a5e595551f50a77fec84b27b81c5ed122a98389278b6354364269ff92b6b"
  end

  on_intel do
    url "https://github.com/egoist/postcat/releases/download/v0.1.1/postcat-0.1.1-x86_64-apple-darwin.tar.gz"
    sha256 "47f31d8541c7bc71ebb8e5c5f1ef68d0d03835451705025f7bca3461216e5a21"
  end

  name "Postcat"
  desc "Keyboard-first API client in your terminal"
  homepage "https://github.com/egoist/postcat"

  # Installed as `pcat` because `postcat` is already the name of a
  # command that ships with Postfix (used to view mail queue files),
  # so installing this cask must not shadow/conflict with it.
  binary "postcat", target: "pcat"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/postcat"]
  end
end
