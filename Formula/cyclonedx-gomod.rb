class CyclonedxGomod < Formula
  desc "Creates CycloneDX Software Bill of Materials (SBOM) from Go modules"
  homepage "https://cyclonedx.org"
  version "1.11.0"
  license "Apache-2.0"

  depends_on "git" => :optional
  depends_on "go" => :optional

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.11.0/cyclonedx-gomod_1.11.0_darwin_amd64.tar.gz"
      sha256 "d422173170750c843c6f2d5aa1dcc5c3dcdb71f88ddf74e80d433f917149102c"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.11.0/cyclonedx-gomod_1.11.0_darwin_arm64.tar.gz"
      sha256 "6e3b3f79c2b4d3f0ac7dedbffab79f658244afbbd61ef6aafefd0bcff0f03ed2"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.11.0/cyclonedx-gomod_1.11.0_linux_arm64.tar.gz"
      sha256 "2b8d661b2c51b7497fbb5b470f65862af45f98f185e7fde503a2999d40d82247"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.11.0/cyclonedx-gomod_1.11.0_linux_amd64.tar.gz"
      sha256 "94fcf7d3f5f5c07c7c23e414aa645c5ca1d2dc57de38ef28a00bd9b1001dbc93"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
  end

  test do
    system bin/"cyclonedx-gomod", "version"
  end
end
