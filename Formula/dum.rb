
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.18"

  
on_macos do
  
  if Hardware::CPU.arm?
    url "https://github.com/egoist/dum/releases/download/v0.1.18/dum-aarch64-apple-darwin.zip"
    sha256 "f33647745aef23effba04c9e252b66f31c2c362fd5b4eb8498da636e0abd280a"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel?
    url "https://github.com/egoist/dum/releases/download/v0.1.18/dum-x86_64-apple-darwin.zip"
    sha256 "c758a217d229076a2268e9e4cee89524e817aa3353d86b99df7a1a7aef8d2543"

    def install
      bin.install "dum"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.18/dum-aarch64-unknown-linux-musl.tar.gz"
    sha256 "12a1cf89e579f91dd004f099153f21babaf379b13d1110ac18dc52f8eb3e3cbd"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.18/dum-x86_64-unknown-linux-musl.tar.gz"
    sha256 "58a88cb0e1d3452f1fc3f2e6322a93973f754c9c22c55fa8cef334dfc2d0c1d0"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

