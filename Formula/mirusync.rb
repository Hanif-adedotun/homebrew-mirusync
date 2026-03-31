# Homebrew formula for mirusync.
# Install from this repo: brew install --build-from-source ./Formula/mirusync.rb
# Or add a tap (see SETUP.md) and: brew install mirusync

class Mirusync < Formula
    desc "Folder sync between two machines over SSH"
    homepage "https://github.com/hanif-adedotun/mirusync"
    url "https://github.com/hanif-adedotun/mirusync/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
    version "0.1.1"
    license "MIT"
    head "https://github.com/hanif-adedotun/mirusync.git", branch: "main"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", *std_go_args(ldflags: "-s -w"), "."
    end
  
    test do
      assert_match "mirusync", shell_output("#{bin}/mirusync --help", 1)
    end
  end
  