# Homebrew formula for Mnemo
# Users install with: brew tap Mnemo-mcp/tap && brew install mnemo

class Mnemo < Formula
  desc "Persistent memory, knowledge graph, and code intelligence for AI coding assistants"
  homepage "https://mnemo-mcp.github.io/Mnemo/"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-arm64"
      sha256 "0b0ee60ed361c802f75bccd2aca0726df3ff7a3f9661016a41496392e0df008e"
    else
      url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-x64"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-linux-x64"
    sha256 "8fabedec7b93aeb534779adaea5b48330b4e11e4623f0456bd89e93416f4446b"
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
