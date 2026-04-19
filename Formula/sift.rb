class Sift < Formula
  version "0.1.5"
  desc "Local semantic search engine — index 30+ formats, hybrid search, AI agent memory"
  homepage "https://github.com/raymondj99/sift"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/raymondj99/sift/releases/download/v#{version}/sift-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c9ecc3c02b79bc68af5541a24cc0a1813f7181a7172b73b5e1825a1335afe7fc"
    else
      url "https://github.com/raymondj99/sift/releases/download/v#{version}/sift-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "aa7e3cc415e0bc004241e13c93e97d58e641dbef9940ac85e912969161bbce2a"
    end
  elsif OS.linux?
    url "https://github.com/raymondj99/sift/releases/download/v#{version}/sift-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4b7208e4e6458b7bbbbfa97a78c5c42bba6501277f68400ed37df3a5e25c881a"
  end

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
