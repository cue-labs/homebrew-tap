cask "cue@rc" do
  arch arm: "arm64", intel: "amd64"

  version "0.18.0-rc.1"
  sha256 arm:   "8e6bbd80b657b87bbdb5a7c171f9c56bc881f44a9637af3dcdc0c2b951380c81",
         intel: "814dd2f7b6b2f1b07716b9f21e6d5b77ec00e5c8c63b9a5f92f20ee62f40e75d"

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
