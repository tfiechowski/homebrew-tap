cask "claude-bar-limit" do
  version "0.1.0"
  sha256 "75aba3a09d90850d14150782920cb8cde999ab964e0cf0d93186cc119c30fcd2"

  url "https://github.com/tfiechowski/claude-bar-limit/releases/download/v#{version}/ClaudeBarLimit-#{version}-macOS.zip"
  name "ClaudeBarLimit"
  desc "Menu-bar display of Claude Code usage limits (unofficial)"
  homepage "https://github.com/tfiechowski/claude-bar-limit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "ClaudeBarLimit.app"

  zap trash: "~/Library/Preferences/dev.tfi.claudebarlimit.plist"

  caveats <<~EOS
    ClaudeBarLimit is not notarized by Apple. On first launch macOS may block it:
    open System Settings > Privacy & Security and choose "Open Anyway".
    It requires Claude Code to be installed and signed in.
  EOS
end
