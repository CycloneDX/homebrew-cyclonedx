class CyclonedxCli < Formula
  desc "CLI tool for CycloneDX analysis, merging, diffs and format conversions"
  homepage "https://cyclonedx.org"
  version "0.29.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.2/cyclonedx-osx-x64", using: :nounzip
      sha256 "06be109330e934c556e8439bbb41ef44aa311f3f83456196f024facfa06f8c91"

      define_method(:install) do
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.2/cyclonedx-osx-arm64"
      sha256 "4fdc937c1bf8b1a3e68e3250c72976258e9b4ff03966516df8184c5a359e2154"

      define_method(:install) do
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.2/cyclonedx-linux-arm64", using: :nounzip
      sha256 "2fe04169f663935ad8510ca3dfbec68f9ab2eb0136918abd00bc454ec20cbeaf"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.2/cyclonedx-linux-arm", using: :nounzip
      sha256 "460442fc73d69b3284ea76b6001741d5e5d68f25c12408b813fc876b75f361e6"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.2/cyclonedx-linux-x64", using: :nounzip
      sha256 "6c5ed6321ee3bb3c268b6d19477dbcd5509a757f118bed4b6508fe9fbbdc2a5b"

      define_method(:install) do
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system bin/"cyclonedx", "--version"
  end
end
