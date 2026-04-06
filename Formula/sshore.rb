# Reference template — the release workflow generates the actual formula
# pushed to the aitechnerd/homebrew-sshore tap with real SHA256 values.
# See .github/workflows/release.yml (publish-homebrew job).
#
# Placeholder names (replaced by sed in CI):
#   0.2.2                  → e.g. 0.2.0
#   b1fc76e36e1bb7a346c76c98f187a90056aa611690aa26be26ff4e324c2d9c30       → sha256 for aarch64-apple-darwin
#   a3cec7855d60e8a35d65ad0eb31686684e35597253f41322be4caf541242ed19      → sha256 for x86_64-apple-darwin
#   49c9f33430dc7338a1dac1293b70928a32eb8f82751b666ee55c31510ac17d67       → sha256 for aarch64-unknown-linux-gnu
#   a98b42957b5ee5f2c5f357bdac06748af65797d2cbf08b3b8cd9581ea148399e      → sha256 for x86_64-unknown-linux-gnu
class Sshore < Formula
  desc "Terminal-native SSH connection manager with environment-aware safety"
  homepage "https://github.com/aitechnerd/sshore"
  license "MIT"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-apple-darwin.tar.gz"
      sha256 "b1fc76e36e1bb7a346c76c98f187a90056aa611690aa26be26ff4e324c2d9c30"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-apple-darwin.tar.gz"
      sha256 "a3cec7855d60e8a35d65ad0eb31686684e35597253f41322be4caf541242ed19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49c9f33430dc7338a1dac1293b70928a32eb8f82751b666ee55c31510ac17d67"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a98b42957b5ee5f2c5f357bdac06748af65797d2cbf08b3b8cd9581ea148399e"
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
