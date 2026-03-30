class Vash < Formula
  desc "CLI for managing vas-hosting.cz hosting accounts"
  homepage "https://github.com/CreevekCZ/vas-hosting-cli"
  version "1.2.0"
  license "MIT"

  on_macos do
    url "https://github.com/CreevekCZ/vas-hosting-cli/releases/download/v1.2.0/vash-v1.2.0-darwin-arm64.tar.gz"
    sha256 "00303d68fc64b40a0c9335fb79dea2efa9e69830e61a9531bd37061fd8f57d06"
  end

  on_linux do
    url "https://github.com/CreevekCZ/vas-hosting-cli/releases/download/v1.2.0/vash-v1.2.0-linux-x86_64.tar.gz"
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
