# Homebrew formula for Mnemo
# Place this in a tap repo: Mnemo-mcp/homebrew-tap/Formula/mnemo.rb
# Users install with: brew tap Mnemo-mcp/tap && brew install mnemo

class Mnemo < Formula
  desc "Persistent memory and code intelligence for AI coding assistants"
  homepage "https://github.com/Mnemo-mcp/Mnemo"
  version "0.1.0"

  on_macos do
    url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-darwin-arm64"
    sha256 "52d80a080bfec12ac9a22b637c07a32077755835fc86655c9e5d4931e8f69fe9"
  end

  on_linux do
    url "https://github.com/Mnemo-mcp/Mnemo/releases/download/v#{version}/mnemo-linux-x64"
    sha256 "ff8793fdcc86d26c4bd8fb15576ce0dfe3b535bc84aea61a3d763dd5f0ee0395"
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
