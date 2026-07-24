class CyclonedxCli < Formula
  desc "CLI tool for CycloneDX analysis, merging, diffs and format conversions"
  homepage "https://cyclonedx.org"
  version "0.33.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.33.1/cyclonedx-osx-x64", using: :nounzip
      sha256 "0ea92306fc7d7c30ed112a7463781a200585a3bf1cdaf77229181c5aabd1d4b6"

      define_method(:install) do
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.33.1/cyclonedx-osx-arm64"
      sha256 "750c148780154833f6401f9067d08c5a4c31567b6ee3c26c062c3a95c62d741c"

      define_method(:install) do
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.33.1/cyclonedx-linux-arm64", using: :nounzip
      sha256 "b2e9fdf9665ef49868a2ec012171c6e785dcd69745bc5869e53e4f4bfb096a5f"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.33.1/cyclonedx-linux-arm", using: :nounzip
      sha256 "9be17c77aa70c85d82184195b9e06ad621693ebf90c22e0080c35b27629c707a"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.33.1/cyclonedx-linux-x64", using: :nounzip
      sha256 "bfc8b2538da86fe239bc53658bbb63c1c8c510a293c1e6891aa5bea5d3c58746"

      define_method(:install) do
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system bin/"cyclonedx", "--version"
  end
end
