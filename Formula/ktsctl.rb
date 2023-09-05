class Ktsctl < Formula
  desc "CLI controller for kak-tree-sitter"
  homepage "https://github.com/phaazon/kak-tree-sitter"
  url "https://github.com/phaazon/kak-tree-sitter/archive/refs/tags/ktsctl-v0.3.2.tar.gz"
  sha256 "07748705311a70811215e69c0c016f0e75250fc4764f1d080ab00ef88e2eb69f"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/rosingrind/homebrew-kak-tree-sitter/releases/download/ktsctl-0.3.2"
    sha256 cellar: :any_skip_relocation, ventura:      "1b09ddbe11ef634d601fd6d6d33ccb0f01b315b79b4c0ea381b1b7c6b8f9f173"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "86ba73e3cd1f2db9520aac0f4464f34d0908c6f667f1fbe8396b077f6997b21d"
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
