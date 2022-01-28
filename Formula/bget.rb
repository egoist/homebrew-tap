# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Bget < Formula
  desc ""
  homepage ""
  version "1.0.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/egoist/bget/releases/download/v1.0.8/bget_1.0.8_Darwin_x86_64.tar.gz"
      sha256 "720f15cb03644c7e6b1d6bb97517f3d82ded91ce98b82685d31a9d86a54e2dfa"

      def install
        bin.install "bget"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/egoist/bget/releases/download/v1.0.8/bget_1.0.8_Darwin_arm64.tar.gz"
      sha256 "86eba98ea1fa2bb256f4c716b00222f9b32c9a23ed26dd92613f2aea37236931"

      def install
        bin.install "bget"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/egoist/bget/releases/download/v1.0.8/bget_1.0.8_Linux_arm64.tar.gz"
      sha256 "094194a3ca4f83c8c5bb217add8b2f9eb8223e664300feaf581ab8f521a7db7a"

      def install
        bin.install "bget"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/egoist/bget/releases/download/v1.0.8/bget_1.0.8_Linux_x86_64.tar.gz"
      sha256 "437abce1fd8060b292efb2565e69e3c38753d80ffec3bda1ea06fb67db3530f7"

      def install
        bin.install "bget"
      end
    end
  end
end
