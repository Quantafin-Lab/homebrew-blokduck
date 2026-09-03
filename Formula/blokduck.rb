# Blokduck — Homebrew formula (native macOS binaries).
#
# Installs the optional no-Docker macOS binaries (bd_obfuscate, bd_cli,
# bd_installer) from the GitHub release tarballs published by
# .github/workflows/homebrew.yml (`mac-native` job).
#
# The `version` string and the per-architecture SHA-256 checksums are stamped
# by your release workflow (.github/workflows/homebrew.yml in the
# Quantafin-Lab/blokduck source repo) to match VERSION and the freshly built
# tarballs at release time.
#
# Usage (after the release is published):
#   brew install https://github.com/Quantafin-Lab/blokduck/releases/latest/download/blokduck.rb
# Or via a tap repo (Quantafin-Lab/homebrew-blokduck), with this file copied to
#   Formula/blokduck.rb:
#   brew tap quantafin-lab/homebrew-blokduck && brew install blokduck
class Blokduck < Formula
  desc "On-device redaction of sensitive documents (PII/PHI) with a local web UI"
  homepage "https://github.com/Quantafin-Lab/blokduck"
  version "0.7.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Quantafin-Lab/blokduck/releases/download/v0.7.30/bd_obfuscate-aarch64-apple-darwin-v0.7.30.tar.gz"
      sha256 "__ARM_SHA256__"
    else
      url "https://github.com/Quantafin-Lab/blokduck/releases/download/v0.7.30/bd_obfuscate-x86_64-apple-darwin-v0.7.30.tar.gz"
      sha256 "__X86_SHA256__"
    end
  end

  def install
    bin.install "bd_obfuscate", "bd_cli", "bd_installer"
  end

  test do
    assert_match "bd_obfuscate #{version}", shell_output("#{bin}/bd_obfuscate --version")
  end
end
