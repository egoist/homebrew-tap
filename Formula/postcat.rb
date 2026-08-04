class Postcat < Formula
  desc "Keyboard-first API client in your terminal"
  homepage "https://github.com/egoist/postcat"
  version "0.1.4"

  # `postcat` collides with the mail-queue-viewer command that ships with
  # Postfix, so this formula also installs a `pcat` alias (a symlink to
  # the same binary) for anyone who wants an unambiguous name on their PATH.

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egoist/postcat/releases/download/v0.1.4/postcat-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "1ba2390a1045971202f12ae2a4e0925310920271ad10fbe4f3dd29939dcf147a"

      define_method(:install) do
        bin.install "postcat"
        bin.install_symlink bin/"postcat" => "pcat"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/egoist/postcat/releases/download/v0.1.4/postcat-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "7243ad6338f38fee21687cb409c8abe07005d914841054a01a11fa656fa11c3a"

      define_method(:install) do
        bin.install "postcat"
        bin.install_symlink bin/"postcat" => "pcat"
      end
    end
  end

  def post_install
    # The release binary isn't signed/notarized, so macOS quarantines it on
    # download and Gatekeeper blocks it with "Apple could not verify... free
    # of malware". Clear the flag so `postcat`/`pcat` run right after install.
    #
    # Cellar files are installed read-only, and xattr can't touch a
    # read-only file even as its owner, so make it writable first and
    # restore the normal Homebrew executable permissions afterwards. `pcat`
    # is just a symlink to this same file, so clearing it here is enough.
    postcat = bin/"postcat"
    return unless postcat.exist?

    postcat.chmod 0755
    Kernel.system "/usr/bin/xattr", "-d", "com.apple.quarantine", postcat.to_s,
                 out: File::NULL, err: File::NULL
    postcat.chmod 0555
  end

  test do
    # postcat is a full-screen TUI with no CLI flags/subcommands, so there is
    # nothing sensible to invoke non-interactively; just confirm it installed.
    assert_path_exists bin/"postcat"
    assert_predicate bin/"postcat", :executable?
    assert_predicate bin/"pcat", :symlink?
    assert_equal bin/"postcat", (bin/"pcat").realpath
  end
end
