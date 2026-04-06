# Reference template — the release workflow generates the actual formula
# pushed to the aitechnerd/homebrew-sshore tap with real SHA256 values.
# See .github/workflows/release.yml (publish-homebrew job).
#
# Placeholder names (replaced by sed in CI):
#   0.2.1                  → e.g. 0.2.0
#   60fc1e9f43c870b09f2c6a4663e693bf571d6272ce8c2250216e14ac1683f51a       → sha256 for aarch64-apple-darwin
#   4d241b70822ee887b9fa05886fafe2a4ec6bb45c8be871b12722ba7687234807      → sha256 for x86_64-apple-darwin
#   4412c218d6b9fc340b8e555dd987722f3e75a2296d55d0176e3cb686e821fb47       → sha256 for aarch64-unknown-linux-gnu
#   75d34049cd1207118d533a1fe2de17c07d0f9bd28546527cf2fa1f14b7d20306      → sha256 for x86_64-unknown-linux-gnu
class Sshore < Formula
  desc "Terminal-native SSH connection manager with environment-aware safety"
  homepage "https://github.com/aitechnerd/sshore"
  license "MIT"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-apple-darwin.tar.gz"
      sha256 "60fc1e9f43c870b09f2c6a4663e693bf571d6272ce8c2250216e14ac1683f51a"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-apple-darwin.tar.gz"
      sha256 "4d241b70822ee887b9fa05886fafe2a4ec6bb45c8be871b12722ba7687234807"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4412c218d6b9fc340b8e555dd987722f3e75a2296d55d0176e3cb686e821fb47"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75d34049cd1207118d533a1fe2de17c07d0f9bd28546527cf2fa1f14b7d20306"
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
