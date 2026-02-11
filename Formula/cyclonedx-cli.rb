class CyclonedxCli < Formula
  desc "CLI tool for CycloneDX analysis, merging, diffs and format conversions"
  homepage "https://cyclonedx.org"
  version "0.30.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.30.0/cyclonedx-osx-x64", using: :nounzip
      sha256 "1603264fd2968b8d617e48aa7e9cf17bee1d25a8ffe717aec37caf1605a21961"

      define_method(:install) do
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.30.0/cyclonedx-osx-arm64"
      sha256 "dabbaf07e543e7996f708147475e2daa69ddf8a8683c5b06febc7d3f074e5e24"

      define_method(:install) do
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.30.0/cyclonedx-linux-arm64", using: :nounzip
      sha256 "190da406177311aa1081edd0c717df10271eba7e4356a56215494a70e1a4b459"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.30.0/cyclonedx-linux-arm", using: :nounzip
      sha256 "983e2ce2e077417625427670e22170e6f13a90653c3b1d3354bf0448720f5eb0"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.30.0/cyclonedx-linux-x64", using: :nounzip
      sha256 "f89876326620f5fc78a9b27cc1af57d6ed13d019aab87490e1246a44a910babb"

      define_method(:install) do
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system bin/"cyclonedx", "--version"
  end
end
