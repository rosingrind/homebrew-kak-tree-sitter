class KakTreeSitter < Formula
  desc "Tree-sitter server for Kakoune"
  homepage "https://github.com/phaazon/kak-tree-sitter"
  url "https://github.com/phaazon/kak-tree-sitter/archive/refs/tags/kak-tree-sitter-v0.5.0.tar.gz"
  sha256 "893b780b7b1034d39fb7a44eedfc1d6821a008404ac0e527746afd1e1089b6c2"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/rosingrind/homebrew-kak-tree-sitter/releases/download/kak-tree-sitter-0.5.0"
    sha256 cellar: :any_skip_relocation, ventura:      "bc8cd497657893ae58fa4a38c41f04c8293f7ef82cc79e244219ec55d9ff2877"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ce0fc88ba5f4f9f0b059f8b5f2fc34b71af792beaf83a093c89b81fc11805f89"
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
