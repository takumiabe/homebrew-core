class Rename < Formula
  desc "Perl-powered file rename script with many helpful built-ins"
  homepage "http://plasmasturm.org/code/rename"
  url "https://github.com/ap/rename/archive/v1.600.tar.gz"
  sha256 "538fa908c9c2c4e7a08899edb6ddb47f7cbeb9b1a1d04e003d3c19b56fcc7f88"
  revision 1

  head "https://github.com/ap/rename.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "b40d758f416765733e0071705fae180c62c63058b350c379b9f36da9da98fad1" => :high_sierra
    sha256 "b40d758f416765733e0071705fae180c62c63058b350c379b9f36da9da98fad1" => :sierra
    sha256 "b40d758f416765733e0071705fae180c62c63058b350c379b9f36da9da98fad1" => :el_capitan
    sha256 "5e392c9cc9475c9e27239fbbdf4b80fa1cf5038316a7ff3dedcefd58dce91463" => :x86_64_linux
  end

  conflicts_with "util-linux", :because => "both install `rename` binaries"

  def install
    system "pod2man", "rename", "rename.1"
    bin.install "rename"
    man1.install "rename.1"
  end

  test do
    touch "foo.doc"
    system "#{bin}/rename -s .doc .txt *.d*"
    refute_predicate testpath/"foo.doc", :exist?
    assert_predicate testpath/"foo.txt", :exist?
  end
end
