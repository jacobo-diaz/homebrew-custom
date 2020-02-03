class PowerlineGo < Formula
  desc " A beautiful and useful low-latency prompt for your shell, written in go"
  homepage "https://github.com/justjanne/powerline-go"
  url "https://github.com/jacobo-diaz/powerline-go.git"

  depends_on "go" => :build

  def install
    system "make", "build"
    bin.install "build/powerline-go" => "powerline-go"
  end

end