cask "cue@rc" do
  arch arm: "arm64", intel: "amd64"

  version "0.18.0-rc.2"
  sha256 arm:   "ba3af8cd79bd0b9ec0890d6914668254939ef117a1a9fbc0fb1749d23455010e",
         intel: "6e908054791da5aeb8e18307d1cf8e67b4fe7489f7eabd2bdc5e5af81dc14836"

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
