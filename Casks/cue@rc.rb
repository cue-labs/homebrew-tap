cask "cue@rc" do
  arch arm: "arm64", intel: "amd64"

  version "0.18.0-rc.3"
  sha256 arm:   "2bb8bcb6a8bb86bc9c0f5baae0f2f0ed963118fa90207d33fbe4baa69254eb2a",
         intel: "cf247244f0d47652446a7c5d9b4ac4aae7c2f0f780da9377a3156272d94b7864"

  url "https://dl.cue.dev/v#{version}/cue_v#{version}_darwin_#{arch}.tar.gz"
  name "CUE Labs distribution of CUE, release candidate"
  desc "Release candidate of the configuration language, as built by CUE Labs"
  homepage "https://cue.dev/docs/installing-cue/"

  livecheck do
    url "https://dl.cue.dev/index.json"
    regex(/"version":\s*"v?(\d+(?:\.\d+)+-rc\.\d+)"/i)
  end

  conflicts_with cask: "cue"
  depends_on macos: :ventura

  binary "cue"

  zap trash: [
    "~/Library/Application Support/cue",
    "~/Library/Caches/cue",
  ]

  caveats <<~EOS
    This is a release candidate of the CUE Labs distribution of CUE, for
    trying a release before it is published as stable. To go back to the
    stable release:
      brew uninstall --cask cue@rc && brew install cue-labs/tap/cue
  EOS
end
