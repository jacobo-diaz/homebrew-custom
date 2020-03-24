class PowerlineGo < Formula
  desc "A beautiful and useful low-latency prompt for your shell, written in go"
  homepage "https://github.com/justjanne/powerline-go"
  version "1.17.0"
  url "https://github.com/jacobo-diaz/powerline-go/releases/download/v#{version}/powerline-go"

  def install
    bin.install "powerline-go" => "powerline-go"
  end

end

# Formula to build from source
# =============================================================================
# class PowerlineGo < Formula
#   desc " A beautiful and useful low-latency prompt for your shell, written in go"
#   homepage "https://github.com/justjanne/powerline-go"
#   head "https://github.com/jacobo-diaz/powerline-go.git"

#   depends_on "go" => :build

#   def install
#     system make build
#     bin.install "build/powerline-go" => "powerline-go"
#   end

# end
