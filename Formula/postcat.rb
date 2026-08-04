class Postcat < Formula
  desc "Keyboard-first API client in your terminal"
  homepage "https://github.com/egoist/postcat"
  version "0.1.1"

  # Installed as `pcat` because `postcat` is already the name of a
  # command that ships with Postfix (used to view mail queue files),
  # so this formula must not shadow/conflict with it.

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egoist/postcat/releases/download/v0.1.1/postcat-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "b721a5e595551f50a77fec84b27b81c5ed122a98389278b6354364269ff92b6b"

      define_method(:install) do
        bin.install "postcat" => "pcat"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/egoist/postcat/releases/download/v0.1.1/postcat-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "47f31d8541c7bc71ebb8e5c5f1ef68d0d03835451705025f7bca3461216e5a21"

      define_method(:install) do
        bin.install "postcat" => "pcat"
      end
    end
  end

  test do
    # postcat is a full-screen TUI with no CLI flags/subcommands, so there is
    # nothing sensible to invoke non-interactively; just confirm it installed.
    assert_path_exists bin/"pcat"
    assert_predicate bin/"pcat", :executable?
  end
end
