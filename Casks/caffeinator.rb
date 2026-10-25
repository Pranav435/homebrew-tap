cask "caffeinator" do
  version "1.2.0"
  sha256 "b696268a1a696b9dbff8d9ec4c54935eb44f31b0a0903f9f87da673743aa9fdc"

  url "https://github.com/Pranav435/caffeinator/releases/download/v#{version}/Caffeinator.zip"
  name "Caffeinator"
  desc "Menu bar app that keeps the computer awake"
  homepage "https://github.com/Pranav435/caffeinator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Caffeinator.app"

  uninstall quit: "io.github.pranav435.caffeinator"

  zap trash: "~/Library/Preferences/io.github.pranav435.caffeinator.plist"
end
