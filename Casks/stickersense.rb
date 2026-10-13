cask "stickersense" do
  version "1.0.1"
  sha256 "81930d325a9eef9370727a6c64db67dbc980c19dcbce61ff1ed86b6f2afd2074"

  url "https://github.com/Pranav435/stickersense/releases/download/v#{version}/StickerSense-Mac.zip"
  name "StickerSense"
  desc "Describes chat stickers and GIFs out loud for screen reader users"
  homepage "https://github.com/Pranav435/stickersense"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "StickerSense.app"

  uninstall quit: "com.pranavsavla.StickerSense"

  zap trash: [
    "~/Library/Application Support/StickerSense",
    "~/Library/Logs/StickerSense.log",
    "~/Library/Preferences/com.pranavsavla.StickerSense.plist",
  ]

  caveats <<~EOS
    StickerSense isn't notarized yet, so macOS blocks the first launch.
    Open it once, then go to System Settings > Privacy & Security and choose Open Anyway, or run:
      xattr -dr com.apple.quarantine #{appdir}/StickerSense.app
  EOS
end
