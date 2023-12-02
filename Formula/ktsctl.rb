class Ktsctl < Formula
  desc "CLI controller for kak-tree-sitter"
  homepage "https://github.com/phaazon/kak-tree-sitter"
  url "https://github.com/phaazon/kak-tree-sitter/archive/refs/tags/ktsctl-v0.3.3.tar.gz"
  sha256 "c97c957adf2e93ca7ffe86bbab5b3ddfcee94d8bc693cf53d2fce38513201342"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/rosingrind/homebrew-kak-tree-sitter/releases/download/ktsctl-0.3.3"
    sha256 cellar: :any_skip_relocation, ventura:      "d7634bc78444782294fb0eea40faba19d609f1b37f310cd7cd9cfff86f1f7d30"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a6ec7c84aa62f666f7f3ea9d2163cdb8566140198d27e6fd5560302d8fc9d11f"
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
