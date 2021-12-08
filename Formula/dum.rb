
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.17"

  
on_macos do
  
  if Hardware::CPU.arm?
    url "https://github.com/egoist/dum/releases/download/v0.1.17/dum-aarch64-apple-darwin.zip"
    sha256 "4fd87caf5ee03b2298ad9b5bc072e019c4973af2ebb02377a5a7a84a22af337f"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel?
    url "https://github.com/egoist/dum/releases/download/v0.1.17/dum-x86_64-apple-darwin.zip"
    sha256 "2311b6881a4e69f446f689888d4c255812429643ebe136f526a2607993f619bb"

    def install
      bin.install "dum"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.17/dum-aarch64-unknown-linux-musl.tar.gz"
    sha256 "c25aab9b259b93305dc992c6d89ee4af3aeedc222ffa5054148e3b4c7bdb37cb"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.17/dum-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3a6836e2241622384d25f4160bc6c619c2eb16bab0641604929372545a8a85fe"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

