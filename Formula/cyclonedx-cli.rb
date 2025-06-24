class CyclonedxCli < Formula
  desc "CLI tool for CycloneDX analysis, merging, diffs and format conversions"
  homepage "https://cyclonedx.org"
  version "0.27.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.0/cyclonedx-osx-x64", using: :nounzip
      sha256 "9ec5fd98f1ac4af8b50b90d977c013582d0d361668a9f5873d3e414b3d271dcb"

      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.0/cyclonedx-osx-arm64"
      sha256 "f16067e5fab43c066d0f7126891d73ee27546c7a61aa346ba0a2b3948b99be3d"

      def install
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.0/cyclonedx-linux-arm64", using: :nounzip
      sha256 "0799a0939cce1b694619c032a3aeddc72e621c5f80617727f57ec84d82a0459c"

      def install
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.0/cyclonedx-linux-arm", using: :nounzip
      sha256 "71fe1fd5548986f4917f7b1d2bfeecc6a3cf88f6882f5033df58b5a94df8b473"

      def install
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.27.0/cyclonedx-linux-x64", using: :nounzip
      sha256 "d6780e7dc53aba2ff5c194b68eabc7ba9e034cee6b39eff7e7c1a30bfcb1da9f"

      def install
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system bin/"cyclonedx", "--version"
  end
end
