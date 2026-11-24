cask "cue@rc" do
  arch arm: "arm64", intel: "amd64"

  version "0.18.0-rc.4"
  sha256 arm:   "cb6acf37a0dde0f1cc4333468d3b63c6971cc71e02a7a05dffd8acb6d9384fbb",
         intel: "676346b22cf73b6ce86c4d1a7c3a1b066f36690adc01b2d8b48942e132797368"

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
