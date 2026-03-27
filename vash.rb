class Vash < Formula
  desc "CLI for managing vas-hosting.cz hosting accounts"
  homepage "https://github.com/CreevekCZ/vas-hosting-cli"
  url "https://github.com/CreevekCZ/vas-hosting-cli/releases/download/v1.0.0/vash-v1.0.0-darwin-arm64.tar.gz"
  sha256 "e935c7641ff1e0c6209d126a8e7fe0c51fb7dddcb34f45cf6fe8920ea593724b"
  license "MIT"
  version "1.0.0"

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
