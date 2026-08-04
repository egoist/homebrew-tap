cask "postcat" do
  version "0.1.0"

  on_arm do
    url "https://github.com/egoist/postcat/releases/download/v#{version}/postcat-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 :no_check
  end

  on_intel do
    url "https://github.com/egoist/postcat/releases/download/v#{version}/postcat-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 :no_check
  end

  name "Postcat"
  desc "Keyboard-first API client in your terminal"
  homepage "https://github.com/egoist/postcat"

  binary "postcat"
end
