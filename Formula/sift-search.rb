class SiftSearch < Formula
  version "0.1.7"
  desc "Local semantic search engine — index 30+ formats, hybrid search, AI agent memory"
  homepage "https://github.com/raymondj99/sift"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/raymondj99/sift/releases/download/v#{version}/sift-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0591aaac7606bd874871bfa68dc4ca8fae2a4d96075708681e1fa06587d36fc2"
    else
      url "https://github.com/raymondj99/sift/releases/download/v#{version}/sift-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "68ae8f07d31f81543a5173e1048c42371fa1db62c808ecd233df627357939e55"
    end
  elsif OS.linux?
    url "https://github.com/raymondj99/sift/releases/download/v#{version}/sift-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "69cf74c7e37fda9874bdaa1768832190ccb887793b2c6452bb87f896a760810d"
  end

  conflicts_with "sift", because: "both install a  binary"

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
