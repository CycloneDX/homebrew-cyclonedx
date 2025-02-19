class CyclonedxGomod < Formula
  desc "Creates CycloneDX Software Bill of Materials (SBOM) from Go modules."
  homepage "https://cyclonedx.org"
  version "1.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.9.0/cyclonedx-gomod_1.9.0_darwin_amd64.tar.gz"
      sha256 "e6ccdf6d10a9a73607a65439ac56c6c5479437d8831d3cca24a86731a1e15bcd"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.9.0/cyclonedx-gomod_1.9.0_darwin_arm64.tar.gz"
      sha256 "feef9e4fdf7e97bcd7fe5312aa13e2ae53a65d52eb48f64ff110f61820e442fb"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.9.0/cyclonedx-gomod_1.9.0_linux_arm64.tar.gz"
      sha256 "288e3ff0474fdb658e71808e788d3683f2ab93d324d53426c53580d49f04403e"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.9.0/cyclonedx-gomod_1.9.0_linux_amd64.tar.gz"
      sha256 "e6d3b3a409b1c84ccef79ad15f9127d80c430a92d5c4f9e621bc2f0f3ee6d423"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  depends_on "go" => :optional
  depends_on "git" => :optional

  test do
    system "#{bin}/cyclonedx-gomod", "--version"
  end
end
