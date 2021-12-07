
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.14"

  
on_macos do
  
  if Hardware::CPU.arm?
    url "https://github.com/egoist/dum/releases/download/v0.1.14/dum-aarch64-apple-darwin.zip"
    sha256 "a1dfe2567fdc723827b9004edf0aa4b18add488035ce23df707d39692ab6b0ad"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel?
    url "https://github.com/egoist/dum/releases/download/v0.1.14/dum-x86_64-apple-darwin.zip"
    sha256 "591564821b1ce6f8f60274505057582498ffe9f0ab5f4d957e00931ce9092803"

    def install
      bin.install "dum"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.14/dum-arm-unknown-linux-musleabihf.tar.gz"
    sha256 "2b8f8624ebea9d59804c469fabe17f538681b8448b1fe7728619de0c3bd6ff9d"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.14/dum-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2ae19dfe36d3b3fe359790f1e8d90ce309a3a055be6d87c49f973fb140451e1d"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

