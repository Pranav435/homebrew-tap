cask "caffeinator" do
  version "1.1.0"
  sha256 "8a853ac20faf4bf442615a1f06d0858ad92c434c0ef15b1f4cbadcdc6b327bc2"

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
