class KakTreeSitter < Formula
  desc "Tree-sitter server for Kakoune"
  homepage "https://github.com/phaazon/kak-tree-sitter"
  url "https://github.com/phaazon/kak-tree-sitter/archive/refs/tags/kak-tree-sitter-v0.4.3.tar.gz"
  sha256 "5391e0236dd3429ebc0835733425f85ff2849b567b803bda230aa4e0626bd6a5"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/rosingrind/homebrew-kak-tree-sitter/releases/download/kak-tree-sitter-0.4.3"
    sha256 cellar: :any_skip_relocation, ventura:      "1bc907db151eb6e5c3e90a8978186f3f4f0034d85691733c7739d7939daf2d83"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7354d7b012562be39ade8605994bfe18cf3a1a5437743213a0187ff0f90fe8c5"
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
