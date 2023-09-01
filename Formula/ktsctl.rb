class Ktsctl < Formula
  desc "CLI controller for kak-tree-sitter"
  homepage "https://github.com/phaazon/kak-tree-sitter"
  url "https://github.com/phaazon/kak-tree-sitter/archive/refs/tags/ktsctl-v0.3.1.tar.gz"
  sha256 "d21db2fe6fde4e5d7f50adaa90e801e08dedf34898f69f808a3590a1659499fc"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/rosingrind/homebrew-kak-tree-sitter/releases/download/ktsctl-0.3.1"
    sha256 cellar: :any_skip_relocation, ventura:      "a9a8f56643740c740adf5cc72a25a1159cf59ef4d03fb236bee9f712b9628ee9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "246d72f63dfd594c3a79f953448c2bee1e19616059add8a5b10d78027c7c138d"
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
