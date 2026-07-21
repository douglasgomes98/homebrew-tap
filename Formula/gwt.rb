class Gwt < Formula
  desc "Manage Git worktrees across sibling repositories"
  homepage "https://github.com/douglasgomes98/gwt"
  url "https://github.com/douglasgomes98/gwt/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "ceeb107ddefee8c6b78aab144aba08b81f6fe5204ebffcd0d087377866b67815"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/gwt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gwt version")
  end
end
