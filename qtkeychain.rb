require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook

class Qtkeychain < Formula
  homepage 'https://github.com/frankosterfeld/qtkeychain'
  head 'https://github.com/frankosterfeld/qtkeychain.git', :using => :git
  url 'https://github.com/frankosterfeld/qtkeychain/archive/v0.6.2.tar.gz'
  #sha1 'da39a3ee5e6b4b0d3255bfef95601890afd80709'
  sha256 'ae13459234feeeab3a154457319d9b26ee9600973443517c77e055838ebae63c'

  depends_on 'cmake' => :build
  # depends on Qt, but we want to accept a system Qt as well. How?

  def install

    ENV["HOMEBREW_OPTFLAGS"] = "-march=#{Hardware.oldest_cpu}" unless build.bottle?

    args = []
    system "cmake", ".", "-DCMAKE_PREFIX_PATH=/usr/local/opt/qt5", *(args + std_cmake_args)
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test qtkeychain`.
    system "false"
  end
end
