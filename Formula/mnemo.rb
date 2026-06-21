# Homebrew formula for Mnemo
# Users install with: brew tap Mnemo-mcp/tap && brew install mnemo

class Mnemo < Formula
  desc "Persistent memory, knowledge graph, and code intelligence for AI coding assistants"
  homepage "https://mnemo-mcp.github.io/Mnemo/"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-arm64"
      sha256 "ffae9957703738c61e84c096ce6148c31f62c026462a7fac4713d55c6acd4fcd"
    else
      url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-x64"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-linux-x64"
    sha256 "f18c6182768c3bbd8651b992a1a63f158e2188051cc0c4ae00483afb2fda6b4d"
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
