class CyclonedxCli < Formula
  desc "CLI tool for CycloneDX analysis, merging, diffs and format conversions"
  homepage "https://cyclonedx.org"
  version "0.29.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.1/cyclonedx-osx-x64", using: :nounzip
      sha256 "d38e495afdcb5b999b4e23dc61be0b06243fb253d8e849ec873ffabdb38d6013"

      define_method(:install) do
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.1/cyclonedx-osx-arm64"
      sha256 "d14e98223a2aff50b416eaebee0577566ff16e8b86a85cbb12c5a43b39f55f40"

      define_method(:install) do
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.1/cyclonedx-linux-arm64", using: :nounzip
      sha256 "f5e06b0ca05895feb39fb0d66443d6c64a50a7ac545e20a01b193b09adb1be9f"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.1/cyclonedx-linux-arm", using: :nounzip
      sha256 "9440534078215ddf853fd9f8b70952be5037ee612575685805c63f6c8c4247dd"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.1/cyclonedx-linux-x64", using: :nounzip
      sha256 "1daceab1a7613603072db34d406659f0865623a4f137637440764cb9aa31236c"

      define_method(:install) do
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system bin/"cyclonedx", "--version"
  end
end
