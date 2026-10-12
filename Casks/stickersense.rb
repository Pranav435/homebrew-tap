cask "stickersense" do
  version "1.0.0"
  sha256 "ac21fe8f1597b32e9cc17f1cf9ed782c383bdb0dc8745158dddce88b05dc3dea"

  url "https://github.com/Pranav435/stickersense/releases/download/v#{version}/StickerSense.zip"
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
