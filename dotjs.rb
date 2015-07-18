class Dotjs < Formula
  desc "a Google Chrome extension that executes JavaScript files"
  homepage "https://github.com/defunkt/dotjs"
  url "https://github.com/defunkt/dotjs/archive/bde001e0105a1fa20049c906cca3a29d6b786fff.tar.gz"
  version "2.0"
  sha256 "ea9f384b54b9512c813cddd2d777c50efc1bc15caaaf91eb50e8d9d907779a60"

  module ::FileUtils
    # Restore original FileUtils.mkdir
    # because FileUtils.mkdir defined in Library/Homebrew/extend/fileutils.rb
    # does not support `options` argument specified in Rake::FileUtilsExt.mkdir
    def with_original_mkdir
      alias_method :_brew_mkdir, :mkdir
      alias_method :mkdir, :old_mkdir
      yield
      alias_method :old_mkdir, :mkdir
      alias_method :mkdir, :_brew_mkdir
    end
    module_function :with_original_mkdir
  end

  def install
    # Invoke rake task directly
    # because `rake "install"` does not display the prompt
    FileUtils.with_original_mkdir do
      require "rake"
      Rake.application.init
      Rake.application.load_rakefile
      Rake.application[:install].invoke
    end
  end
end
