# Reference template — the release workflow generates the actual formula
# pushed to the aitechnerd/homebrew-sshore tap with real SHA256 values.
# See .github/workflows/release.yml (publish-homebrew job).
#
# Placeholder names (replaced by sed in CI):
#   0.1.2                  → e.g. 0.2.0
#   9adcc7564d0f594c69717c47a3be504c4535d0debf95ee4a53d2a6638f765798       → sha256 for aarch64-apple-darwin
#   d0cd0deb8711c5a34bb5f0e4b5be41ec00537a9807e902021069758651b98e85      → sha256 for x86_64-apple-darwin
#   c2368e891975e7588465eae23a8390a4eaeaeb050f5f3e658b8677b4d0f8c118       → sha256 for aarch64-unknown-linux-gnu
#   3b643b8c9df1966845c82b443c0e6cad48b6797c1dd76013ba0311d9b1f95403      → sha256 for x86_64-unknown-linux-gnu
class Sshore < Formula
  desc "Terminal-native SSH connection manager with environment-aware safety"
  homepage "https://github.com/aitechnerd/sshore"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-apple-darwin.tar.gz"
      sha256 "9adcc7564d0f594c69717c47a3be504c4535d0debf95ee4a53d2a6638f765798"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-apple-darwin.tar.gz"
      sha256 "d0cd0deb8711c5a34bb5f0e4b5be41ec00537a9807e902021069758651b98e85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2368e891975e7588465eae23a8390a4eaeaeb050f5f3e658b8677b4d0f8c118"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b643b8c9df1966845c82b443c0e6cad48b6797c1dd76013ba0311d9b1f95403"
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
