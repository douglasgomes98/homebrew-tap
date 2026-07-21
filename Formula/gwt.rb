class Gwt < Formula
  desc "Manage Git worktrees across sibling repositories"
  homepage "https://github.com/douglasgomes98/gwt"
  url "https://github.com/douglasgomes98/gwt/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "3447bca24ac2af1c1eb74ebd4f611193bb6b399fd075d84e7e14c5c04d51eacc"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/gwt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gwt version")
  end
end
