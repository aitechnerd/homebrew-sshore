# Reference template — the release workflow generates the actual formula
# pushed to the aitechnerd/homebrew-sshore tap with real SHA256 values.
# See .github/workflows/release.yml (publish-homebrew job).
#
# Placeholder names (replaced by sed in CI):
#   0.2.0                  → e.g. 0.2.0
#   7c1ba7ccd1fcb83b0c471089fb18635bdf3caedfd8d937c34efed97128e09c88       → sha256 for aarch64-apple-darwin
#   6e52553f7bd4e1c129e078c63771dc565892e465e53ba4cee94ccf4310c04d53      → sha256 for x86_64-apple-darwin
#   e86c4bfbea8e973c389ee9e6805e42e05d3a283ebf433adb26bcd92989198b26       → sha256 for aarch64-unknown-linux-gnu
#   be92c60405cf4b7110c9dd451aa96534c537c32195f2c81c01801bbfe3e6759c      → sha256 for x86_64-unknown-linux-gnu
class Sshore < Formula
  desc "Terminal-native SSH connection manager with environment-aware safety"
  homepage "https://github.com/aitechnerd/sshore"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-apple-darwin.tar.gz"
      sha256 "7c1ba7ccd1fcb83b0c471089fb18635bdf3caedfd8d937c34efed97128e09c88"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-apple-darwin.tar.gz"
      sha256 "6e52553f7bd4e1c129e078c63771dc565892e465e53ba4cee94ccf4310c04d53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e86c4bfbea8e973c389ee9e6805e42e05d3a283ebf433adb26bcd92989198b26"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be92c60405cf4b7110c9dd451aa96534c537c32195f2c81c01801bbfe3e6759c"
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
