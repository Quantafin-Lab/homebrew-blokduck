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
  version "0.13.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Quantafin-Lab/blokduck/releases/download/v0.13.8/bd_obfuscate-aarch64-apple-darwin-v0.13.8.tar.gz"
      sha256 "89ad83810ca10d4f02c02d96125cc9552efe2d1b5996dc2b04a5841db3c24a4a"
    else
      url "https://github.com/Quantafin-Lab/blokduck/releases/download/v0.13.8/bd_obfuscate-x86_64-apple-darwin-v0.13.8.tar.gz"
      sha256 "593843a5103cd7390f1b72702ede7424593d31202235d78b132f5fc03853ec87"
    end
  end

  def install
    bin.install "bd_obfuscate", "bd_cli", "bd_installer"
  end

  test do
    assert_match "bd_obfuscate #{version}", shell_output("#{bin}/bd_obfuscate --version")
  end
end
