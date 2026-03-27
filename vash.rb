class Vash < Formula
  desc "CLI for managing vas-hosting.cz hosting accounts"
  homepage "https://github.com/CreevekCZ/vas-hosting-cli"
  url "https://github.com/CreevekCZ/vas-hosting-cli/releases/download/v__VERSION__/vash-v__VERSION__-darwin-arm64.tar.gz"
  sha256 "__SHA256__"
  license "MIT"
  version "__VERSION__"

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
