
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.19"

  
on_macos do
  
  if Hardware::CPU.arm?
    url "https://github.com/egoist/dum/releases/download/v0.1.19/dum-aarch64-apple-darwin.zip"
    sha256 "59f977d43c8b5c8716f815fc5685ff896dcaa107914d076a331bbe73db017712"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel?
    url "https://github.com/egoist/dum/releases/download/v0.1.19/dum-x86_64-apple-darwin.zip"
    sha256 "ed638d1654ca65028c0e837a0104dae456eceabcd23cd2b878d1541a15d4da70"

    def install
      bin.install "dum"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.19/dum-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a8d537b3408c5b24a8a166898529a0d2e86ecf3893e7a2418cbc1a89d851ebd2"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.19/dum-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2649497df25ba645deb5f79791adbe73f89f81f7cdde95f327e3aee281511ff0"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

