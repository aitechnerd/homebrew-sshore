# Reference template — the release workflow generates the actual formula
# pushed to the aitechnerd/homebrew-sshore tap with real SHA256 values.
# See .github/workflows/release.yml (publish-homebrew job).
#
# Placeholder names (replaced by sed in CI):
#   0.2.3                  → e.g. 0.2.0
#   000ddd6474891cafd35e8ee8e077a3dc008925995a79e55309a2c20f4d526622       → sha256 for aarch64-apple-darwin
#   882b3dced226d3d2b75c3127fe06f8fd59d910a075d849e59899c300ca60e22c      → sha256 for x86_64-apple-darwin
#   8fad9ba6f90da98b221daa30e10b32f8db45438809b9b2b6803c5672cc37c431       → sha256 for aarch64-unknown-linux-gnu
#   95d1fe03d4b9bda4a05725b51ecafd88f05ad9c20594aebbf4fb9c3c0424a038      → sha256 for x86_64-unknown-linux-gnu
class Sshore < Formula
  desc "Terminal-native SSH connection manager with environment-aware safety"
  homepage "https://github.com/aitechnerd/sshore"
  license "MIT"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-apple-darwin.tar.gz"
      sha256 "000ddd6474891cafd35e8ee8e077a3dc008925995a79e55309a2c20f4d526622"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-apple-darwin.tar.gz"
      sha256 "882b3dced226d3d2b75c3127fe06f8fd59d910a075d849e59899c300ca60e22c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fad9ba6f90da98b221daa30e10b32f8db45438809b9b2b6803c5672cc37c431"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v#{version}/sshore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95d1fe03d4b9bda4a05725b51ecafd88f05ad9c20594aebbf4fb9c3c0424a038"
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
