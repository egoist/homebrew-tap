
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.16"

  
on_macos do
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.16/dum-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f58234a99f3bdbb777cfff1249bbd410fbee86655355bd2e7afa16d9ced891c5"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.16/dum-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1871bcd2564bda83ddb0c7fbfec1e8b5b03b6626478f34cb8e3fca5a7b398134"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

