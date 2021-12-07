
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.15"

  
on_macos do
  
  if Hardware::CPU.arm?
    url "https://github.com/egoist/dum/releases/download/v0.1.15/dum-aarch64-apple-darwin.zip"
    sha256 "b4f21fcbf0995b642a6e021db6c0c3e458e7d19bbbd1b07f82344b9bb3dbf58f"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel?
    url "https://github.com/egoist/dum/releases/download/v0.1.15/dum-x86_64-apple-darwin.zip"
    sha256 "d0d5d27fb558f8de1556cef7a802c01a4a52305ecec4637636bbf30d713b266d"

    def install
      bin.install "dum"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.15/dum-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f4d37996a9e20e67fb70aaa7582d99ce8fa40d7f5842ce988288b89f9191f48e"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.15/dum-x86_64-unknown-linux-musl.tar.gz"
    sha256 "66bce6a5209d4afc0baffa879bbd1d120cc5f2341d0e6bb6d63b24ba0cab59cd"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

