# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Spice < Formula
  desc "spice"
  homepage "https://www.spice-space.org/"
  url "https://gitlab.freedesktop.org/spice/spice.git",
    tag: "v0.14.91"
  license "LGPL-2.1-or-later"

  depends_on "autoconf" => :build
  depends_on "autoconf-archive" => :build
  depends_on "autogen" => :build
  depends_on "automake" => :build
  depends_on "gobject-introspection" => :build
  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "vala" => :build

  # mandatory dependencies
  depends_on "spice-protocol"
  depends_on "pixman"
  depends_on "openssl"
  depends_on "jpeg"
  depends_on "zlib"

  # optional dependencies
  # Cyrus-SASL
  # libcacard
  depends_on "opus"
  depends_on "lz4"
  depends_on "gstreamer"

  #depends_on "atk"
  #depends_on "cairo"
  #depends_on "gdk-pixbuf"
  #depends_on "gettext"
  #depends_on "glib"
  #depends_on "gst-libav"
  #depends_on "gst-plugins-base"
  #depends_on "gst-plugins-good"
  #depends_on "gst-plugins-bad"
  #depends_on "gst-plugins-ugly"
  #depends_on "gtk+3"
  #depends_on "json-glib"
  #depends_on "pango"
  depends_on "libusb"
  depends_on "usbredir"

  def install
    system "./autogen.sh"
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install"    
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test spice`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
