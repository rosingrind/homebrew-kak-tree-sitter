class Ktsctl < Formula
  desc "CLI controller for kak-tree-sitter"
  homepage "https://github.com/phaazon/kak-tree-sitter"
  url "https://github.com/phaazon/kak-tree-sitter/archive/refs/tags/ktsctl-v0.3.0.tar.gz"
  sha256 "4d3cc6c2c57f0ae9d7ca6abefa7f174db27751bce7f67c98e6b185500228ac11"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/rosingrind/homebrew-kak-tree-sitter/releases/download/ktsctl-0.3.0"
    sha256 cellar: :any_skip_relocation, ventura:      "4f9bc9dfeb1e39a0ff51eec3ee166fe6a55ef0a8f5ce0b9fbbc9eb5b56f43ead"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "34a16c74346238f1a2417e18433253d11999b10d1ac6694c228c853eb7469f41"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--bin", "ktsctl", *std_cargo_args(path: "./ktsctl")
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ktsctl`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    assert_match "--install", shell_output("#{bin}/ktsctl --help")
  end
end
