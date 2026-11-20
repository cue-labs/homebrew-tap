cask "cue" do
  arch arm: "arm64", intel: "amd64"

  version "0.18.0"
  sha256 arm:   "ca98a77d1a98869078e2213d621ec70c6a84df4ef50f68fbc1a557e3219491fd",
         intel: "1505834055850e645535267066e8383bb95d94c90dbc3d7973490f2506427b6b"

  url "https://dl.cue.dev/v#{version}/cue_v#{version}_darwin_#{arch}.tar.gz"
  name "CUE Labs distribution of CUE"
  desc "Configuration language and tooling, as built and signed by CUE Labs"
  homepage "https://cue.dev/docs/installing-cue/"

  livecheck do
    url "https://dl.cue.dev/latest.txt"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: :ventura

  binary "cue"

  zap trash: [
    "~/Library/Application Support/cue",
    "~/Library/Caches/cue",
  ]

  caveats <<~EOS
    If cue from Homebrew's formula is installed, this cask does not link
    its cue over it. To switch to the CUE Labs distribution:
      brew uninstall --formula cue && brew reinstall cue-labs/tap/cue
  EOS
end
