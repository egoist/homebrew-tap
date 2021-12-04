
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.12"

  
on_macos do
  
  if Hardware::CPU.arm?
    url "https://github.com/egoist/dum/releases/download/v0.1.12/dum-aarch64-apple-darwin.zip"
    sha256 "2cc458cb7908c6106ba117796851502993096deb5b63183b83b42115a471c049"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel?
    url "https://github.com/egoist/dum/releases/download/v0.1.12/dum-x86_64-apple-darwin.zip"
    sha256 "57d580434d97be3c23927ce1ed0741ec0727c20496d17961a7537eae5115df51"

    def install
      bin.install "dum"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.12/dum-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f1bbbaf7efd0631d551aa9daec0f05dd351589383cc504d78369339c429ba34d"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.12/dum-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5dde953de5f8e2dda15298c8322b1841428357fd79e00b7e9bfb29197cb79cd3"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

