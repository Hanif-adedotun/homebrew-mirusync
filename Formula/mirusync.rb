# Homebrew formula for mirusync.
# Install from this repo: brew install --build-from-source ./Formula/mirusync.rb
# Or add a tap (see SETUP.md) and: brew install mirusync

class Mirusync < Formula
    desc "Folder sync between two machines over SSH"
    homepage "https://github.com/hanif-adedotun/mirusync"
    url "https://github.com/hanif-adedotun/mirusync/archive/refs/tags/v0.1.3.tar.gz"
    sha256 "e7f6961c6b21c17f406cb61b820bc657415edb9a5e54b42fa548e95b7498ca04"
    version "0.1.3"
    license "MIT"
    head "https://github.com/hanif-adedotun/mirusync.git", branch: "main"
  
    depends_on "go" => :build
  
    def install
      ldflags = "-s -w -X github.com/hanif/mirusync/cmd.version=#{pkg_version}"
      system "go", "build", *std_go_args(ldflags: ldflags), "."
    end
  
    test do
      assert_match "mirusync", shell_output("#{bin}/mirusync --help", 1)
    end
  end
  