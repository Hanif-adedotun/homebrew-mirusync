# Homebrew formula for mirusync.
# Install from this repo: brew install --build-from-source ./Formula/mirusync.rb
# Or add a tap (see SETUP.md) and: brew install mirusync

class Mirusync < Formula
    desc "Folder sync between two machines over SSH"
    homepage "https://github.com/hanif-adedotun/mirusync"
    url "https://github.com/hanif-adedotun/mirusync/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "9db8ba81e14944485a7b082053bdc2c511b4b8d73a0d247ca092bb9c38bf68c4"
    version "0.1.2"
    license "MIT"
    head "https://github.com/hanif-adedotun/mirusync.git", branch: "main"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/hanif/mirusync/cmd.version=#{version}"), "."
    end
  
    test do
      assert_match "mirusync", shell_output("#{bin}/mirusync --help", 1)
    end
  end
  