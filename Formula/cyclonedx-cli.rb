class CyclonedxCli < Formula
  desc "CycloneDX CLI tool for SBOM analysis, merging, diffs and format conversions."
  homepage "https://cyclonedx.org"
  version "0.27.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.1/cyclonedx-osx-x64", :using => :nounzip
      sha256 "004bd50acaf0b49c3a10e803ef4f30d85b326c347ea8bafa40b165359603c09f"

      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.1/cyclonedx-osx-arm64"
      sha256 "c918a19397536a22cb89dd4cfbdb46fbdac49124f5c9df2cbca7973df1371799"

      def install
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.1/cyclonedx-linux-arm64", :using => :nounzip
      sha256 "1d6ee9648b27a18c8536e6d3a3582b3a21400e4db668b7bad63500004364ac3a"

      def install
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.1/cyclonedx-linux-arm", :using => :nounzip
      sha256 "4b02b68d7b70e25cf136410e9c6411a9304d4f45bb3a2ae9caec5b1f52cea6d5"

      def install
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.1/cyclonedx-linux-x64", :using => :nounzip
      sha256 "b36a12d5103c1fd799005e02ee8d5a546c8db5b67f770bb28786f15238ceac16"

      def install
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system "#{bin}/cyclonedx" "--version"
  end
end
