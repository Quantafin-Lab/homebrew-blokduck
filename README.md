# Homebrew tap for Blokduck

Homebrew tap for the [Blokduck](https://github.com/Quantafin-Lab/blokduck)
native macOS binaries (`rde_obfuscator`, `rde_cli`, `rde_installer`).

```bash
brew tap quantafin-lab/homebrew-blokduck
brew install blokduck
```

## How it stays current

`Formula/blokduck.rb` is stamped by `.github/workflows/homebrew.yml` in the
`Quantafin-Lab/rde_obfuscator` source repo: on each `v*` tag push it builds the
macOS binaries for both architectures, computes their SHA-256s, and submits the
resulting release-stamped formula back into this tap. The checked-in formula is
just a snapshot of the latest release — run `brew update` to pick up a new one.
