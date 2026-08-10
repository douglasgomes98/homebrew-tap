class Gwt < Formula
  desc "Manage Git worktrees across sibling repositories"
  homepage "https://github.com/douglasgomes98/gwt"
  url "https://github.com/douglasgomes98/gwt/archive/refs/tags/v1.6.2.tar.gz"
  sha256 "14d19036dc44dd8e2f50cf7b70c8d926fcb6baf06bef4e48af54ee44f3e0b6c7"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/gwt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gwt version")
  end
end
