#------------------------------------------------------------------------------
# ioctl-unstable.rb
#
# Homebrew formula for ioctl.  Homebrew (http://brew.sh/) is
# the de-facto standard package manager for OS X, and this Ruby script
# contains the metadata used to map command-line user settings used
# with the 'brew' command onto build options.
#
# Copyright (c) 2019 IoTeX Foundation
#------------------------------------------------------------------------------
class IoctlUnstable < Formula
  desc "Command-line interface for interacting with the IoTeX blockchain"
  homepage "https://docs.iotex.io/developer/get-started/ioctl-install.html"
  url "https://github.com/iotexproject/iotex-core/archive/master.zip"
  version "unstable"
  sha256 "174801fd5c27c4da45d3865ac93c7c8663d56db4c68bd458857e8c4f432eb0c9"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["GOPROXY"] = "https://goproxy.io"
    system "make", "ioctl"
    bin.install "bin/ioctl" => "ioctl-unstable"
  end

  test do
    assert_match "Endpoint is set to api.iotex.one:443", shell_output("ioctl-unstable config set endpoint api.iotex.one:443")
  end
end
