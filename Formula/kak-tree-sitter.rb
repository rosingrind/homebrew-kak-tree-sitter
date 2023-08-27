class KakTreeSitter < Formula
  desc "Tree-sitter server for Kakoune"
  homepage "https://github.com/phaazon/kak-tree-sitter"
  url "https://github.com/phaazon/kak-tree-sitter/archive/refs/tags/kak-tree-sitter-v0.4.0.tar.gz"
  sha256 "26a3418935dae0b398ffcb485e37acaa274e744b224611589acfbebf4b46fdde"
  license "BSD-3-Clause"

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
    assert_match "--verbose", shell_output("#{bin}/kak-tree-sitter --help")
  end
end
