class CyclonedxGomod < Formula
  desc "Creates CycloneDX Software Bill of Materials (SBOM) from Go modules"
  homepage "https://cyclonedx.org"
  version "1.12.0"
  license "Apache-2.0"

  depends_on "git" => :optional
  depends_on "go" => :optional

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.12.0/cyclonedx-gomod_1.12.0_darwin_amd64.tar.gz"
      sha256 "94ab2d999341e4bc8d26767bffda2823ac4507c2f17c01af6d3738f5341b9e85"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.12.0/cyclonedx-gomod_1.12.0_darwin_arm64.tar.gz"
      sha256 "43dcd58b7a7ef9d84a2d21df9c6eeeb907d5b4ee2b1fe6c1330e5bc9b478281e"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.12.0/cyclonedx-gomod_1.12.0_linux_arm64.tar.gz"
      sha256 "b6dd6424755e61c0f7fcd36074fbb78798a33c52f1bd35dd177ba62eccadf404"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.12.0/cyclonedx-gomod_1.12.0_linux_amd64.tar.gz"
      sha256 "004b9f5cc595b797fb5423e2ae4c97bcf0f18c712ed2faee1640b09e5efd6d15"

      define_method(:install) do
        bin.install "cyclonedx-gomod"
      end
    end
  end

  test do
    system bin/"cyclonedx-gomod", "version"
  end
end
