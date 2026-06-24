# Reference template — the release workflow generates the actual formula
# pushed to the aitechnerd/homebrew-sshore tap with real SHA256 values.
# See .github/workflows/release.yml (publish-homebrew job).
#
# Placeholder names (replaced by sed in CI):
#   0.3.0                  → e.g. 0.2.0
#   2f03bf6b075152c4963e613d058df80b99af159b1b3c4c8f10416895e64986a1       → sha256 for aarch64-apple-darwin
#   64e182b516ec4c9d1a54383f6c788e4fefb08628803a09336461420330c2371d      → sha256 for x86_64-apple-darwin
#   9650e60a278b6dd6776d8c35b5f799b791b84eaf88beff1c684e2640faa00db2       → sha256 for aarch64-unknown-linux-gnu
#   4c673468f95b6751bff7180587cf4096dabc2c95e35356bae93ea9eb0e4d844c      → sha256 for x86_64-unknown-linux-gnu
class Sshore < Formula
  desc "Terminal-native SSH connection manager with environment-aware safety"
  homepage "https://github.com/aitechnerd/sshore"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-apple-darwin.tar.gz"
      sha256 "2f03bf6b075152c4963e613d058df80b99af159b1b3c4c8f10416895e64986a1"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-apple-darwin.tar.gz"
      sha256 "64e182b516ec4c9d1a54383f6c788e4fefb08628803a09336461420330c2371d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9650e60a278b6dd6776d8c35b5f799b791b84eaf88beff1c684e2640faa00db2"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c673468f95b6751bff7180587cf4096dabc2c95e35356bae93ea9eb0e4d844c"
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
