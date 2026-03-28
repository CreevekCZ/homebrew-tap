class Vash < Formula
  desc "CLI for managing vas-hosting.cz hosting accounts"
  homepage "https://github.com/CreevekCZ/vas-hosting-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/CreevekCZ/vas-hosting-cli/releases/download/v1.1.0/vash-v1.1.0-darwin-arm64.tar.gz"
    sha256 "28ca7026e99e8dee3dbfe100c99b7a96e4d9112297d055f3c2888ae2c3ea9a80"
  end

  on_linux do
    url "https://github.com/CreevekCZ/vas-hosting-cli/releases/download/v1.1.0/vash-v1.1.0-linux-x86_64.tar.gz"
    sha256 "PLACEHOLDER_LINUX_SHA256"
  end

  def install
    bin.install "vash"

    (zsh_completion/"_vash").write(Utils.safe_popen_read(bin/"vash", "--generate-completion-script", "zsh"))
    (bash_completion/"vash").write(Utils.safe_popen_read(bin/"vash", "--generate-completion-script", "bash"))
    (fish_completion/"vash.fish").write(Utils.safe_popen_read(bin/"vash", "--generate-completion-script", "fish"))
  end

  test do
    assert_match "vash", shell_output("#{bin}/vash --help")
  end
end
