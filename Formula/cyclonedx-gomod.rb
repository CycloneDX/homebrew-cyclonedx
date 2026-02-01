class CyclonedxGomod < Formula
  desc "Creates CycloneDX Software Bill of Materials (SBOM) from Go modules"
  homepage "https://cyclonedx.org"
  version "1.10.0"
  license "Apache-2.0"

  depends_on "git" => :optional
  depends_on "go" => :optional

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.10.0/cyclonedx-gomod_1.10.0_darwin_amd64.tar.gz"
      sha256 "f4ec9f8bef518001c6d12b151cb965511d3e67fab22bed3a682f7cf4fd2f1728"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.10.0/cyclonedx-gomod_1.10.0_darwin_arm64.tar.gz"
      sha256 "2a8e887efb07ed4e36d7ead879a15e055b1e50d60e5d45e407f9f2a27db4dc46"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.10.0/cyclonedx-gomod_1.10.0_linux_arm64.tar.gz"
      sha256 "b2bebbe569c39b6bd62b7a142269a8870795020ef608483c942e4b7f51f4de6b"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.10.0/cyclonedx-gomod_1.10.0_linux_amd64.tar.gz"
      sha256 "5cce8ae99a5181be6a610ea5ed9ca9d596937cc04dc1a8f6f6b5e462d8c9900e"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
  end

  test do
    system bin/"cyclonedx-gomod", "version"
  end
end
