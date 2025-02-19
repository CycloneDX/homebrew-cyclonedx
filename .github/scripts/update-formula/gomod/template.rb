class CyclonedxGomod < Formula
  desc "Creates CycloneDX Software Bill of Materials (SBOM) from Go modules"
  homepage "https://cyclonedx.org"
  version "%VERSION%"
  license "Apache-2.0"

  depends_on "git" => :optional
  depends_on "go" => :optional

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v%VERSION%/cyclonedx-gomod_%VERSION%_darwin_amd64.tar.gz"
      sha256 "%SHA256SUM_darwin_amd64%"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v%VERSION%/cyclonedx-gomod_%VERSION%_darwin_arm64.tar.gz"
      sha256 "%SHA256SUM_darwin_arm64%"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v%VERSION%/cyclonedx-gomod_%VERSION%_linux_arm64.tar.gz"
      sha256 "%SHA256SUM_linux_arm64%"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v%VERSION%/cyclonedx-gomod_%VERSION%_linux_amd64.tar.gz"
      sha256 "%SHA256SUM_linux_amd64%"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  test do
    system bin/"cyclonedx-gomod", "version"
  end
end
