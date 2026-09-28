class Gwt < Formula
  desc "Manage Git worktrees across sibling repositories"
  homepage "https://github.com/douglasgomes98/gwt"
  url "https://github.com/douglasgomes98/gwt/archive/refs/tags/v1.11.1.tar.gz"
  sha256 "a745ec5e727e19ffd633303a49d75828c9b3a44f7b3ddb0616e8229a2eac8cca"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/gwt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gwt version")
  end
end
