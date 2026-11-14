# CUE Labs Homebrew tap

This tap installs the [CUE Labs distribution](https://cue.dev/docs/cue-labs-distribution/)
of CUE on macOS: the `cue` binary that CUE Labs builds, signs and
notarizes, downloaded from https://dl.cue.dev/ and checked against the
release's published checksum.

```
brew install cue-labs/tap/cue
```

That one command adds the tap, trusts this cask and nothing else
(Homebrew 6.0.0 and later), and installs the latest stable release.
Afterwards `brew upgrade` follows new stable releases, and
`brew uninstall --cask cue` removes it.

## What this tap does not install

Homebrew's own formula, `brew install cue`, builds the open-source build
of CUE from source. It is not affected by this tap, and `brew install
cue` keeps resolving to it. Which build you get from each way of
installing CUE is set out on
[the install page](https://cue.dev/docs/installing-cue/).

If you have `cue` from Homebrew's formula and install this cask, Homebrew
leaves the formula's `cue` linked and tells you so. To switch:

```
brew uninstall --formula cue && brew reinstall cue-labs/tap/cue
```

## Requirements

- Homebrew 6.0.0 or later. On older Homebrew, run `brew tap cue-labs/tap`
  first, then `brew install --cask cue`.
- macOS 13 (Ventura) or later, on Apple silicon or Intel.
- Linux is not served by this tap. Linux archives are on
  [the releases page](https://cue.dev/docs/releases/).

## Pre-releases and older versions

This cask offers stable releases only. Pre-releases, and patches to an
older release line after a newer line exists, are available as archives
from [the releases page](https://cue.dev/docs/releases/).

## How it is updated

`Casks/cue.rb` is written by the CUE Labs release process, once per
stable release, from the release's published checksum file. Nobody edits
its version or checksums by hand. The previous tap, `cue-lang/tap`, is
retired and unrelated to this one.

## Trusting by hand

If you prefer to grant trust explicitly rather than through the
qualified install command: `brew trust --cask cue-labs/tap/cue`, or
`brew trust cue-labs/tap` for the whole tap.
