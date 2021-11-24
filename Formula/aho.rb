# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Aho < Formula
  desc ""
  homepage ""
  version "1.2.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/egoist/aho/releases/download/v1.2.6/aho_1.2.6_Darwin_x86_64.tar.gz"
      sha256 "bec19a402742a01553302ece940adcf30eec7a8a3943b581423ae4a2ad18b987"

      def install
        bin.install "aho"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/egoist/aho/releases/download/v1.2.6/aho_1.2.6_Darwin_arm64.tar.gz"
      sha256 "8bbe04439ddcd4e01786552ac17ff99d7babbafeea0c3e3edfe6b763f2412d3d"

      def install
        bin.install "aho"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/egoist/aho/releases/download/v1.2.6/aho_1.2.6_Linux_x86_64.tar.gz"
      sha256 "693772ad47b92ec9130d521767687a913732c67694baadb2982335da4f98cd82"

      def install
        bin.install "aho"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/egoist/aho/releases/download/v1.2.6/aho_1.2.6_Linux_arm64.tar.gz"
      sha256 "bb980bdea69e03d57b0d1b19db120065c75115a26b29c74fcb2be78bf7ab8314"

      def install
        bin.install "aho"
      end
    end
  end
end