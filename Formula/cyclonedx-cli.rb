class CyclonedxCli < Formula
  desc "CLI tool for CycloneDX analysis, merging, diffs and format conversions"
  homepage "https://cyclonedx.org"
  version "0.28.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.28.2/cyclonedx-osx-x64", using: :nounzip
      sha256 "0de1b0c768923d7446d18b71682b0b0a81492f0b894ce2529ed6ad18dd2c4112"

      define_method(:install) do
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.28.2/cyclonedx-osx-arm64"
      sha256 "92cb1bcb348b11570995e2a96c1a3406f37305acfcb131830e8e99ff9adbc591"

      define_method(:install) do
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.28.2/cyclonedx-linux-arm64", using: :nounzip
      sha256 "581663dfa422ac5d73d59cdfb08299eb3429dce921175ccb42b5711509305da1"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.28.2/cyclonedx-linux-arm", using: :nounzip
      sha256 "13b496eb65d26d94b614979c518277be7ab82e0ebbcf2c02f4d8345f84ccac6d"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.28.2/cyclonedx-linux-x64", using: :nounzip
      sha256 "839d11fbfbc903dceacc529be2d24fb2b984fffe95b0a7f36e4457c6cb066e8b"

      define_method(:install) do
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system bin/"cyclonedx", "--version"
  end
end
