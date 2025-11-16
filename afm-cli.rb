class AfmCli < Formula
  desc "A Swift command-line interface tool for interacting with macOS Apple Intelligence foundation models"
  homepage "https://github.com/CreevekCZ/afm-cli"
  url "https://github.com/CreevekCZ/afm-cli/releases/download/v0.1.1/afm-cli-v0.1.1-darwin-arm64.tar.gz"
  sha256 "b7ee47cc0c69c1e6719d360233a1b20c865f73346f703b494f30fd6ca8437d87"
  license "MIT"
  version "0.1.1"

  depends_on :macos => :tahoe

  def install
    bin.install "afm-cli"
  end

  test do
    system "#{bin}/afm-cli", "--version"
  end
end
