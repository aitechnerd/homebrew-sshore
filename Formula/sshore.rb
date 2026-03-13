# Reference template — the release workflow generates the actual formula
# pushed to the aitechnerd/homebrew-sshore tap with real SHA256 values.
# See .github/workflows/release.yml (publish-homebrew job).
#
# Placeholder names (replaced by sed in CI):
#   0.1.3                  → e.g. 0.2.0
#   3ec02663f71c285895e4e8d85cb03c1489c4d332ae988a9bf2cde5e373b2909e       → sha256 for aarch64-apple-darwin
#   7a62ce676436918e9ac97c0aa9c8dbac582231a66c8e201a6fc85124999a5e68      → sha256 for x86_64-apple-darwin
#   155f4db9639b594a43da2fd951c7135c459ae782cbebdb8c793cb32f98b86945       → sha256 for aarch64-unknown-linux-gnu
#   6f76badf1bad2b0fe1fd87adccae4da16bd118f327ccf071494c03d19b71affb      → sha256 for x86_64-unknown-linux-gnu
class Sshore < Formula
  desc "Terminal-native SSH connection manager with environment-aware safety"
  homepage "https://github.com/aitechnerd/sshore"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-apple-darwin.tar.gz"
      sha256 "3ec02663f71c285895e4e8d85cb03c1489c4d332ae988a9bf2cde5e373b2909e"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-apple-darwin.tar.gz"
      sha256 "7a62ce676436918e9ac97c0aa9c8dbac582231a66c8e201a6fc85124999a5e68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "155f4db9639b594a43da2fd951c7135c459ae782cbebdb8c793cb32f98b86945"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f76badf1bad2b0fe1fd87adccae4da16bd118f327ccf071494c03d19b71affb"
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
