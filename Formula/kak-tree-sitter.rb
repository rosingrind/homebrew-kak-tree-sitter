class KakTreeSitter < Formula
  desc "Tree-sitter server for Kakoune"
  homepage "https://github.com/phaazon/kak-tree-sitter"
  url "https://github.com/phaazon/kak-tree-sitter/archive/refs/tags/kak-tree-sitter-v0.4.6.tar.gz"
  sha256 "7ea80e84aff0c05c21942162f6f396fb824c715efa099e41287a78a3a82dd367"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/rosingrind/homebrew-kak-tree-sitter/releases/download/kak-tree-sitter-0.4.6"
    sha256 cellar: :any_skip_relocation, ventura:      "b355babf9ee18955f035bf42819ba42ff5a42f89e2490eddaa2f779676cc72c7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6492ddabec674a62444aa273e356fa514d560c5bbe3faeabfdecf57a962b20c4"
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
