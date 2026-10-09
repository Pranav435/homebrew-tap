cask "caffeinator" do
  version "1.0.0"
  sha256 "b5a65670c3c3dfd14df8d7cb5ba65296a396296edd2b5f3f8e1d7426f727f26f"

  url "https://github.com/Pranav435/caffeinator/releases/download/v#{version}/Caffeinator.zip"
  name "Caffeinator"
  desc "Menu bar app that keeps the Mac awake"
  homepage "https://github.com/Pranav435/caffeinator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Caffeinator.app"

  # The app is ad-hoc signed, not notarized. Clearing quarantine saves the "Open Anyway" trip.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Caffeinator.app"]
  end

  uninstall quit: "io.github.pranav435.caffeinator"

  zap trash: "~/Library/Preferences/io.github.pranav435.caffeinator.plist"
end
