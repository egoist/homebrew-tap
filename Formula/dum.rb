
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.17"

  
on_macos do
  
  if Hardware::CPU.intel?
    url "https://github.com/egoist/dum/releases/download/v0.1.17/dum-x86_64-apple-darwin.zip"
    sha256 "d5bfdacc793444a35c3840b23e5716d97502360288ffee7b155a77cec019c740"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.arm?
    url "https://github.com/egoist/dum/releases/download/v0.1.17/dum-aarch64-apple-darwin.zip"
    sha256 "2a64de907ec32db33bc05878f012e1e1cdb2af31fda3e5f0de9e46094016c4dd"

    def install
      bin.install "dum"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.17/dum-aarch64-unknown-linux-musl.tar.gz"
    sha256 "eab499c71909516f16240d847cc07a2f20e452802718b3d524594844f2e9fd99"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

