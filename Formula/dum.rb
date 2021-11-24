
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.10"

  
on_macos do
  
  if Hardware::CPU.arm?
    url "https://github.com/egoist/dum/releases/download/v0.1.10/dum-aarch64-apple-darwin.zip"
    sha256 "63bdae6df7ea8a56cfb3bfcc68f8324a7ccd5a6844659b05278d5ad8a70686cb"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel?
    url "https://github.com/egoist/dum/releases/download/v0.1.10/dum-x86_64-apple-darwin.zip"
    sha256 "aa036059be5095aefd3f956b26fc8dd31fb21da1a749e8dd1e281ea890b204a8"

    def install
      bin.install "dum"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.10/dum-x86_64-unknown-linux-gnu.tgz"
    sha256 "94cfb13feae1209025c89588106a9eed27dfc77c756c7312d9d0e2d97d92d2ed"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

