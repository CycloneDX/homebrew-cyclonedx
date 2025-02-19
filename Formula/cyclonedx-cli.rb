class CyclonedxCli < Formula
  desc "CLI tool for CycloneDX analysis, merging, diffs and format conversions"
  homepage "https://cyclonedx.org"
  version "0.27.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.2/cyclonedx-osx-x64", using: :nounzip
      sha256 "331c2245ef7dadf09fa3d2710a2aaab071ff6bea2ba3e5df8f95a4f3f6e825e9"

      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.2/cyclonedx-osx-arm64"
      sha256 "2d24c331c2ccc5e4061722bd4780c8b295041b2569d130bbe80cf7da95b97171"

      def install
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.2/cyclonedx-linux-arm64", using: :nounzip
      sha256 "5b4181f6fd4d8fbe54e55c1b3983d9af66ce2910a263814b290cbd5e351e68a4"

      def install
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.2/cyclonedx-linux-arm", using: :nounzip
      sha256 "46347273361b30c240c5ef14ba0963bbf4591cfbb030ea60da8488bc9a0d362e"

      def install
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.2/cyclonedx-linux-x64", using: :nounzip
      sha256 "5e1595542a6367378a3944bbd3008caab3de65d572345361d3b9597b1dbbaaa0"

      def install
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system bin/"cyclonedx", "--version"
  end
end
