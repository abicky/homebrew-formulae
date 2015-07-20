class SvmLight < Formula
  desc "An implementation of Support Vector Machines (SVMs) in C"
  homepage "http://svmlight.joachims.org/"
  url "http://osmot.cs.cornell.edu/svm_light/v6.02/svm_light.tar.gz"
  version "6.02"
  sha256 "aa48985a4c77eecd84d293de40d4731da767e49a1d2323c6198180652aa8724e"

  def install
    system "make"
    bindir = File.join(prefix, "bin")
    mkdir bindir
    system "install", "svm_classify", "svm_learn", bindir
  end
end
