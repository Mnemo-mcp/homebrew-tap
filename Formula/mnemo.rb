# Homebrew formula for Mnemo
# Users install with: brew tap Mnemo-mcp/tap && brew install mnemo

class Mnemo < Formula
  desc "Persistent memory, knowledge graph, and code intelligence for AI coding assistants"
  homepage "https://mnemo-mcp.github.io/Mnemo/"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-arm64"
      sha256 "9d4c346ccc566334d343216a4c5e1bd974348f3e6c38680d6e1b14ffacd7420a"
    else
      url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-x64"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-linux-x64"
    sha256 "c4edd50291cf971df98b8f20ecb147c7caf1458423d132f627f4afc77d75f8a9"
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
