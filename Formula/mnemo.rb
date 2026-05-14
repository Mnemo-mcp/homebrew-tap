# Homebrew formula for Mnemo
# Place this in a tap repo: Mnemo-mcp/homebrew-tap/Formula/mnemo.rb
# Users install with: brew tap Mnemo-mcp/tap && brew install mnemo

class Mnemo < Formula
  desc "Persistent memory, knowledge graph, and code intelligence for AI coding assistants"
  homepage "https://github.com/Mnemo-mcp/Mnemo"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-arm64"
      sha256 "PLACEHOLDER_MACOS_ARM64_SHA256"
    else
      url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-x64"
      sha256 "PLACEHOLDER_MACOS_X64_SHA256"
    end
  end

  on_linux do
    url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-linux-x64"
    sha256 "PLACEHOLDER_LINUX_X64_SHA256"
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
