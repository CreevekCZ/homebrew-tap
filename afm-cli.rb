class AfmCli < Formula
  desc "A Swift command-line interface tool for interacting with macOS Apple Intelligence foundation models"
  homepage "https://github.com/CreevekCZ/afm-cli"
  url "https://github.com/CreevekCZ/afm-cli/releases/download/v0.2.0/afm-cli-v0.2.0-darwin-arm64.tar.gz"
  sha256 "6db53b3bd98d0b575710bb59a68deecce39a8312f9337493cc7b2992824f8ebc"
  license "MIT"
  version "0.2.0"

  depends_on :macos => :tahoe

  def install
    bin.install "afm-cli"
  end

  test do
    system "#{bin}/afm-cli", "--version"
  end
end
