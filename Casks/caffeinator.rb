cask "caffeinator" do
  version "1.0.1"
  sha256 "6d353bbfb64eef98f753827b4530518e6f8c1183ea958fe665bc0e2886428e6b"

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

  # The app is ad-hoc signed, not notarized. Clearing quarantine saves the "Open Anyway" trip.
  # No declarative step does this, so it stays a postflight block (fine outside official taps).
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Caffeinator.app"]
  end

  uninstall quit: "io.github.pranav435.caffeinator"

  zap trash: "~/Library/Preferences/io.github.pranav435.caffeinator.plist"
end
