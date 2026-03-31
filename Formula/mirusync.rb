# Homebrew formula for mirusync.
# Install from this repo: brew install --build-from-source ./Formula/mirusync.rb
# Or add a tap (see SETUP.md) and: brew install mirusync

class Mirusync < Formula
    desc "Folder sync between two machines over SSH"
    homepage "https://github.com/hanif-adedotun/mirusync"
    url "https://github.com/hanif-adedotun/mirusync/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "888ad634f9b90e68ff3ec6c327ac2584b57ac95ee0d05192d1e49886b236f70b"
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
  