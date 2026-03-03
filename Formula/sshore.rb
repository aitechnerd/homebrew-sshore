# Reference template — the release workflow generates the actual formula
# pushed to the aitechnerd/homebrew-sshore tap with real SHA256 values.
# See .github/workflows/release.yml (publish-homebrew job).
#
# Placeholder names (replaced by sed in CI):
#   0.1.1                  → e.g. 0.2.0
#   551e08b099ac9472fbd853f7cc69f14d88075f44cea7a7978b439a5d33a6c538       → sha256 for aarch64-apple-darwin
#   337b4a75b804d3dfd4d336cab383e4f859db690bedc625979a52f54f0d4fe5cc      → sha256 for x86_64-apple-darwin
#   0f63fbfaef2a23b038424747b8400f6e4337c73d251c7287c9878ce16028f3cd       → sha256 for aarch64-unknown-linux-gnu
#   a499c0d19ecc9354bc463d534d53c7b1b71c2828c25687b27350057f1ff59aed      → sha256 for x86_64-unknown-linux-gnu
class Sshore < Formula
  desc "Terminal-native SSH connection manager with environment-aware safety"
  homepage "https://github.com/aitechnerd/sshore"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-apple-darwin.tar.gz"
      sha256 "551e08b099ac9472fbd853f7cc69f14d88075f44cea7a7978b439a5d33a6c538"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-apple-darwin.tar.gz"
      sha256 "337b4a75b804d3dfd4d336cab383e4f859db690bedc625979a52f54f0d4fe5cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f63fbfaef2a23b038424747b8400f6e4337c73d251c7287c9878ce16028f3cd"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a499c0d19ecc9354bc463d534d53c7b1b71c2828c25687b27350057f1ff59aed"
    end
  end

  def install
    bin.install "sshore"

    generate_completions_from_executable(bin/"sshore", "completions")
  end

  test do
    assert_match "sshore #{version}", shell_output("#{bin}/sshore --version")
  end
end
