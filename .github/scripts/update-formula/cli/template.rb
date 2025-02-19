class CyclonedxCli < Formula
  desc "CLI tool for CycloneDX analysis, merging, diffs and format conversions"
  homepage "https://cyclonedx.org"
  version "%VERSION%"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v%VERSION%/cyclonedx-osx-x64", using: :nounzip
      sha256 "%SHA256SUM_osx-x64%"

      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v%VERSION%/cyclonedx-osx-arm64"
      sha256 "%SHA256SUM_osx-arm64%"

      def install
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v%VERSION%/cyclonedx-linux-arm64", using: :nounzip
      sha256 "%SHA256SUM_linux-arm64%"

      def install
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v%VERSION%/cyclonedx-linux-arm", using: :nounzip
      sha256 "%SHA256SUM_linux-arm%"

      def install
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v%VERSION%/cyclonedx-linux-x64", using: :nounzip
      sha256 "%SHA256SUM_linux-x64%"

      def install
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system "#{bin}/cyclonedx" + "--version"
  end
end
