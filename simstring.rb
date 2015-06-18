class Simstring < Formula
  desc "A fast and simple algorithm for approximate string matching/retrieval"
  homepage "http://www.chokkan.org/software/simstring/index.html"
  url "https://github.com/chokkan/simstring/archive/6209ea86d84f7043f8e19029d83299f458665ec5.tar.gz"
  version "1.1.0"
  sha256 "61d155cf833be73b91efd5273af43e9ff0f5fd13fa34822a490aa1cb39ada24a"

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build

  patch :p1, :DATA

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end

__END__
diff --git a/frontend/main.cpp b/frontend/main.cpp
index d616a8f..e3df2b5 100644
--- a/frontend/main.cpp
+++ b/frontend/main.cpp
@@ -369,12 +369,12 @@ int main(int argc, char *argv[])
     }
 
     // Change the locale of wcin and wcout if necessary.
-    if (opt.code == option::CC_WCHAR) {
-        std::ios_base::sync_with_stdio(false);
-        std::locale::global(std::locale("")); 
-        std::wcout.imbue(std::locale(""));
-        std::wcin.imbue(std::locale(""));
-    }
+    // if (opt.code == option::CC_WCHAR) {
+    //     std::ios_base::sync_with_stdio(false);
+    //     std::locale::global(std::locale("")); 
+    //     std::wcout.imbue(std::locale(""));
+    //     std::wcin.imbue(std::locale(""));
+    // }
 
     // Branches for the processing mode.
     switch (opt.mode) {
