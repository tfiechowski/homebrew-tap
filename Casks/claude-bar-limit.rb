cask "claude-bar-limit" do
  version "1.0.0"
  sha256 "d40e38cb2e4a3ab5376bfb0a965fb9902cc84a650998a0374fdc102686108db4"

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
