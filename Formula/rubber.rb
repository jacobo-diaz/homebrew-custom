class Rubber < Formula
  desc "Automated building of LaTeX documents"
  homepage "https://launchpad.net/rubber/"
  url "https://launchpad.net/rubber/trunk/1.5.1/+download/rubber-1.5.1.tar.gz"
  sha256 "37a843dc36a8aa256f9a66de130a031a0406346e663e1c257e45fd0a6eae0d9d"

  head "lp:rubber", :using => :bzr

  depends_on "texinfo"

  def install
    # Disable building of PDF docs
    system "python3", "setup.py", "build", "--pdf=False",
                                 "install", "--prefix=#{prefix}",
                                            "--infodir=#{info}",
                                            "--mandir=#{man}"

    bin.env_script_all_files(
      libexec/"bin",
      :PYTHONPATH => lib/"python3.7/site-packages"
    )
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rubber --version")
  end
end
