class MemoryCli < Formula
  desc "Unified memory management for multiple AI agents"
  homepage "https://github.com/cybernagle/memory-cli"
  url "https://github.com/cybernagle/memory-cli/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "4069db4997ef5a355b0dba02644c4accd2258c98a4dcc757ca0b206c4fb65372"
  version "0.0.1"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/cybernagle/memory-cli/internal/cmd.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/memory --version")
  end
end
