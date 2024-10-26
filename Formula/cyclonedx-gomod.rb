class CyclonedxGomod < Formula
  desc "Creates CycloneDX Software Bill of Materials (SBOM) from Go modules."
  homepage "https://cyclonedx.org"
  version "1.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.8.0/cyclonedx-gomod_1.8.0_darwin_amd64.tar.gz"
      sha256 "80c6b2a1f394019e3a75f643de46bf695805759abf41edf02c00c8d7327031f0"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.8.0/cyclonedx-gomod_1.8.0_darwin_arm64.tar.gz"
      sha256 "86b63df8e9d47be10b4c17e4d8aabf3cf87e99599fcdc6afdedd5af20aab447a"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.8.0/cyclonedx-gomod_1.8.0_linux_arm64.tar.gz"
      sha256 "68b871ea3ae90644824c02bd61f5a1f7919c895d7d5a84cc59847179"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.8.0/cyclonedx-gomod_1.8.0_linux_amd64.tar.gz"
      sha256 "91b0391eb299ef4fce2c787244b12dfd1b0579da5cef6568d2dca40544fefadb"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  depends_on "go" => :optional
  depends_on "git" => :optional

  test do
    system "#{bin}/cyclonedx-gomod" "version"
  end
end
