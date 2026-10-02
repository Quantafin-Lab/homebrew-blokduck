# Blokduck — Homebrew formula (native macOS binaries).
#
# Installs the optional no-Docker macOS binaries (bd_obfuscate, bd_cli,
# bd_installer) from the GitHub release tarballs published by
# .github/workflows/homebrew.yml (`mac-native` job).
#
# The `version` string and the per-architecture SHA-256 placeholders (ARM and
# X86) are stamped by CI to match VERSION and the freshly built tarballs at
# release time (`publish` job in .github/workflows/homebrew.yml). Keep the
# checked-in `version` in sync with VERSION — CI asserts this before release.
#
# Usage (after the release is published). Homebrew 4+ will not install a
# formula straight from a release URL, so use the tap (this file copied to
#   Formula/blokduck.rb):
#   brew tap quantafin-lab/homebrew-blokduck && brew install blokduck
# or, equivalently, the fully-qualified name (auto-taps):
#   brew install quantafin-lab/homebrew-blokduck/blokduck
class Blokduck < Formula
  desc "On-device redaction of sensitive documents (PII/PHI) with a local web UI"
  homepage "https://github.com/Quantafin-Lab/blokduck"
  version "0.13.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Quantafin-Lab/blokduck/releases/download/v0.13.9/bd_obfuscate-aarch64-apple-darwin-v0.13.9.tar.gz"
      sha256 "f3a461be5f4d3ac8cb1933780ad4c7c5bf6b45ba64ad013d4dfa6d3f8c32c5e8"
    else
      url "https://github.com/Quantafin-Lab/blokduck/releases/download/v0.13.9/bd_obfuscate-x86_64-apple-darwin-v0.13.9.tar.gz"
      sha256 "6233de70d6e0e0055211a2c868e19b90a1b9ba85493272b6ce0d9fad32e00d01"
    end
  end

  def install
    bin.install "bd_obfuscate", "bd_cli", "bd_installer"
  end

  test do
    assert_match "bd_obfuscate #{version}", shell_output("#{bin}/bd_obfuscate --version")
  end
end
