class Sshore < Formula
  desc "Terminal-native SSH connection manager with environment-aware safety"
  homepage "https://github.com/aitechnerd/sshore"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v0.1.0/sshore-aarch64-apple-darwin.tar.gz"
      sha256 "6d8213ae1518d5af9061f0cd5235c1309d69be037280774dbc368d0d3cb87248"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v0.1.0/sshore-x86_64-apple-darwin.tar.gz"
      sha256 "79f98d6d27f787f166afae3426b7aa820b7d7771f8a8a83ff8a56565a18abaf9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aitechnerd/sshore/releases/download/v0.1.0/sshore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02117ecc59897f03d2bdc39d12059131d52773991f9086b111f7fe83fd269d38"
    end

    on_intel do
      url "https://github.com/aitechnerd/sshore/releases/download/v0.1.0/sshore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2d885bbeabf9bf962cde0e79d96e6a5a8f664f4c21265eb181486d0eaeca180"
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
