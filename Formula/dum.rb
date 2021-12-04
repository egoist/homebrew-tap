
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.11"

  
on_macos do
  
  if Hardware::CPU.arm?
    url "https://github.com/egoist/dum/releases/download/v0.1.11/dum-aarch64-apple-darwin.zip"
    sha256 "cb885eb0854053db3a6168c857aac88bf9bbe8bef81282881a612d543c7a6d55"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel?
    url "https://github.com/egoist/dum/releases/download/v0.1.11/dum-x86_64-apple-darwin.zip"
    sha256 "85cb25f407f4c93e9fb383aba214a4bf7b2c58a7186e8d6c007bc6a8c7d33221"

    def install
      bin.install "dum"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.11/dum-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a06ca1b51d50aa87df645e0f060c93c5cb9479f7198d5bc87412e7e240a3977a"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.11/dum-x86_64-unknown-linux-musl.tar.gz"
    sha256 "308c1f90ee08dcd85128987ae4da6f23a958d0b375b278f876854a52f3e30d8a"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

