# Homebrew formula for Mnemo
# Place this in a tap repo: Mnemo-mcp/homebrew-tap/Formula/mnemo.rb
# Users install with: brew tap Mnemo-mcp/tap && brew install mnemo

class Mnemo < Formula
  desc "Persistent memory, knowledge graph, and code intelligence for AI coding assistants"
  homepage "https://github.com/Mnemo-mcp/Mnemo"
  version "0.3.0"

  on_macos do
    url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-arm64"
    sha256 "0ed42d0c2ec0debf49863a0c67d3e767a8fc0bfccc67406364a255690fb1d1e6"
  end

  on_linux do
    url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-linux-x64"
    sha256 "627552be5572eea2f617af95645ae5e234f173ee03487acb09902ded7680d6a7"
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
