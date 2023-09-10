class KakTreeSitter < Formula
  desc "Tree-sitter server for Kakoune"
  homepage "https://github.com/phaazon/kak-tree-sitter"
  url "https://github.com/phaazon/kak-tree-sitter/archive/refs/tags/kak-tree-sitter-v0.4.5.tar.gz"
  sha256 "e8c1ac715baad98f2322459665ea724332a6017f68299fda32dde6338a8901c2"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/rosingrind/homebrew-kak-tree-sitter/releases/download/kak-tree-sitter-0.4.4"
    sha256 cellar: :any_skip_relocation, ventura:      "ffef1db3ae7cd345e04cd3c41c87762940152f3c9c4fda36da7b8c168dc5d93b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aec0c035e7dcddb937ee3746f94a1379b1e20fc71d9a8c99c77bdcb946034ea4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--bin", "kak-tree-sitter", *std_cargo_args(path: "./kak-tree-sitter")
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test kak-tree-sitter`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    assert_match "--session", shell_output("#{bin}/kak-tree-sitter --help")
  end
end
