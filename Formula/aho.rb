
class Aho < Formula
  desc "ultra simple project scaffolding"
  homepage "https://github.com/egoist/aho"
  version "1.2.5"

  
on_macos do
  
  if Hardware::CPU.arm?
    url "https://github.com/egoist/aho/releases/download/v1.2.5/aho_1.2.5_Darwin_arm64.tar.gz"
    sha256 "0a5eb38e72f46371133d628d9b499c76b96b72ee799d5b6a2fe5a5b7ebfd9750"

    def install
      bin.install "aho"
    end
  end
  

  if Hardware::CPU.intel?
    url "https://github.com/egoist/aho/releases/download/v1.2.5/aho_1.2.5_Darwin_x86_64.tar.gz"
    sha256 "0a5eb38e72f46371133d628d9b499c76b96b72ee799d5b6a2fe5a5b7ebfd9750"

    def install
      bin.install "aho"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/aho/releases/download/v1.2.5/aho_1.2.5_Linux_arm64.tar.gz"
    sha256 "0a5eb38e72f46371133d628d9b499c76b96b72ee799d5b6a2fe5a5b7ebfd9750"

    def install
      bin.install "aho"
    end
  end
  

  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/aho/releases/download/v1.2.5/aho_1.2.5_Linux_x86_64.tar.gz"
    sha256 "0a5eb38e72f46371133d628d9b499c76b96b72ee799d5b6a2fe5a5b7ebfd9750"

    def install
      bin.install "aho"
    end
  end
  
end
  

  test do
    system "#{bin}/aho -v"
  end
end

