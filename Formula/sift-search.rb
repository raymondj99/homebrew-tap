class SiftSearch < Formula
  version "0.1.6"
  desc "Local semantic search engine — index 30+ formats, hybrid search, AI agent memory"
  homepage "https://github.com/raymondj99/sift"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/raymondj99/sift/releases/download/v#{version}/sift-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "273b845131bfe2a9c4b31cde20e416fb6a8b27e1643a8a6b76e39ba029547147"
    else
      url "https://github.com/raymondj99/sift/releases/download/v#{version}/sift-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "72226227b99fb017f7e3095273626231e87f65acfcbff3e91242161c4a026f73"
    end
  elsif OS.linux?
    url "https://github.com/raymondj99/sift/releases/download/v#{version}/sift-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4559eb86d02d9b927d8ec2354c0b78bed14b3fbcd29b506a9403ec5fbfc2a4db"
  end

  conflicts_with "sift", because: "both install a `sift` binary"

  def install
    bin.install "sift"

    bash_completion.install "complete/sift.bash" if File.exist? "complete/sift.bash"
    zsh_completion.install "complete/_sift" if File.exist? "complete/_sift"
    fish_completion.install "complete/sift.fish" if File.exist? "complete/sift.fish"
  end

  test do
    assert_match "sift #{version}", shell_output("#{bin}/sift --version")
  end
end
