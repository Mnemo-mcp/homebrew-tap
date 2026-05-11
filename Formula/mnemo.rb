# Homebrew formula for Mnemo
# Place this in a tap repo: Mnemo-mcp/homebrew-tap/Formula/mnemo.rb
# Users install with: brew tap Mnemo-mcp/tap && brew install mnemo

class Mnemo < Formula
  desc "Persistent memory and code intelligence for AI coding assistants"
  homepage "https://github.com/Mnemo-mcp/Mnemo"
  version "0.2.0"

  on_macos do
    url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-arm64"
    sha256 "621042b8610a917518ccc1d1f8df04f539ab0143e4bfd9a794b3b6580d9ac037"
  end

  on_linux do
    url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-linux-x64"
    sha256 "16d04ac11f930ce0cff46bf989cbf15765021217f566410ad90fb7838fd212a5"
  end

  def install
    binary = Dir["mnemo-*"].first || "mnemo"
    bin.install binary => "mnemo"
  end

  def post_install
    bin.install_symlink bin/"mnemo" => "mnemo-mcp"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/mnemo --help")
  end
end
