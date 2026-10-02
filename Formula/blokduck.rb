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
  version "0.13.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Quantafin-Lab/blokduck/releases/download/v0.13.4/bd_obfuscate-aarch64-apple-darwin-v0.13.4.tar.gz"
      sha256 "867fdbf0ceaa27f9d3709090a1b7f3390bbf9233f8f1e45cb27025912a8ac326"
    else
      url "https://github.com/Quantafin-Lab/blokduck/releases/download/v0.13.4/bd_obfuscate-x86_64-apple-darwin-v0.13.4.tar.gz"
      sha256 "6c27fc5a26f1ca68ac28c638ab30e4e614e700ba915a97cbc7f563e6b9db6b68"
    end
  end

  def install
    bin.install "bd_obfuscate", "bd_cli", "bd_installer"
  end

  test do
    assert_match "bd_obfuscate #{version}", shell_output("#{bin}/bd_obfuscate --version")
  end
end
