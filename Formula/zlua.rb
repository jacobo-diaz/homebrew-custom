class Zlua < Formula
  desc "A new cd command that helps you navigate faster by learning your habits"
  homepage "https://github.com/skywind3000/z.lua"
  version "1.8.7"
  url "https://github.com/skywind3000/z.lua/archive/#{version}.tar.gz"

  def install
    bin.install "z.lua" => "z.lua"
  end

end
