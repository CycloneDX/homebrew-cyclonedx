class CyclonedxCli < Formula
  desc "CLI tool for CycloneDX analysis, merging, diffs and format conversions"
  homepage "https://cyclonedx.org"
  version "0.29.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.0/cyclonedx-osx-x64", using: :nounzip
      sha256 "8e1e97cebe20328306ce48d72f3d6deeab4739e6bd07147034b0ae2b35a7c299"

      define_method(:install) do
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.0/cyclonedx-osx-arm64"
      sha256 "24a3885f755544009d93a346bedcb68aa07376e223a8ffa2847e3861ba76b8d0"

      define_method(:install) do
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.0/cyclonedx-linux-arm64", using: :nounzip
      sha256 "8d3d383f46185edc1d8532c86b82b626b95706e75aaf4534496cdaf3621e94a0"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.0/cyclonedx-linux-arm", using: :nounzip
      sha256 "e559986d483c5372e844fe56bd5549e293976f7f14bbe246ef219bfe432f4ce7"

      define_method(:install) do
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.29.0/cyclonedx-linux-x64", using: :nounzip
      sha256 "411bd30d28ca705500f0b5a7f4a896749cad1b082deb5245ece7b386e496c48c"

      define_method(:install) do
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system bin/"cyclonedx", "--version"
  end
end
