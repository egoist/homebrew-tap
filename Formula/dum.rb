
class Dum < Formula
  desc "An npm scripts runner written in Rust."
  homepage "https://github.com/egoist/dum"
  version "0.1.13"

  
on_macos do
  
  if Hardware::CPU.arm?
    url "https://github.com/egoist/dum/releases/download/v0.1.13/dum-aarch64-apple-darwin.zip"
    sha256 "f9383da805dde999a50406bc941064171caccfc31d0f46104b833019b1823d9c"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel?
    url "https://github.com/egoist/dum/releases/download/v0.1.13/dum-x86_64-apple-darwin.zip"
    sha256 "b3513db71f335a2b8abaa6257f16250d892b0b21dd6730bbeb306d4f65c3415e"

    def install
      bin.install "dum"
    end
  end
  
end
  

  
on_linux do
  
  if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.13/dum-aarch64-unknown-linux-musl.tar.gz"
    sha256 "42231b000705644d50e1629b7dd4d31f95b7332559719efee0415f137b7e0257"

    def install
      bin.install "dum"
    end
  end
  

  if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/egoist/dum/releases/download/v0.1.13/dum-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ac442447a48bbdf80287aac4a784d3c7a62570347daa642c3d3c2f1b060ecd99"

    def install
      bin.install "dum"
    end
  end
  
end
  

  test do
    system "#{bin}/dum -v"
  end
end

