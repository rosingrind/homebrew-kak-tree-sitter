class KakTreeSitter < Formula
  desc "Tree-sitter server for Kakoune"
  homepage "https://github.com/phaazon/kak-tree-sitter"
  url "https://github.com/phaazon/kak-tree-sitter/archive/refs/tags/kak-tree-sitter-v0.4.2.tar.gz"
  sha256 "61714e3a7113715207e148c24f04d47dcbfbe30e20dfef6c6432fe1fc8082733"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/rosingrind/homebrew-kak-tree-sitter/releases/download/kak-tree-sitter-0.4.1"
    sha256 cellar: :any_skip_relocation, ventura:      "0531079b5da4a7c7d15b5069c0f05e327ece34cc391acb56fea061415557ab9d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0c620d594d769a73d23d366b95076e955a9f7d4d4161f1c72675ec76389fa229"
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
