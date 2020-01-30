class Rubber < Formula
  include Language::Python::Virtualenv

  desc "Automated building of LaTeX documents"
  homepage "https://launchpad.net/rubber/"
  url "https://launchpad.net/rubber/trunk/1.5.1/+download/rubber-1.5.1.tar.gz"
  sha256 "37a843dc36a8aa256f9a66de130a031a0406346e663e1c257e45fd0a6eae0d9d"

  head "lp:rubber", :using => :bzr

  depends_on "python"

  def install

    create_cfg
    version = Language::Python.major_minor_version "python3"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{version}/site-packages"
    system "python3", "setup.py", "build", "install", "--prefix=#{libexec}", "--infodir=#{info}", "--mandir=#{man}"
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])

  end

  private def create_cfg
    cfg_file = '[build]
                man = 1
                html = 0
                pdf = 0
                info = 0
                txt = 0'
    File.write('setup.cfg', cfg_file)
  end

  test do
   assert_match version.to_s, shell_output("#{bin}/rubber --version")
  end
end