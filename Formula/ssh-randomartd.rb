require "language/go"

class SshRandomartd < Formula
  desc "Serving randomart to OpenSSH"
  homepage "https://git.sr.ht/~ilammy/ssh-randomartd"
  url "https://git.sr.ht/~ilammy/ssh-randomartd/archive/test.tar.gz"
  version "0.1"
  sha256 "00cbb7afe054625f92f6c4efde9a7ab6daeaf296e4a978070855e686014f77bb"
  license "GPL-3.0-or-later"

  depends_on "go" => :build

  go_resource "github.com/mattn/go-sixel" do
    url "https://github.com/mattn/go-sixel.git",
        using:    :git,
        tag:      "v0.0.1",
        revision: "8aa94a3344af2b2fb49ae02a81ceff5b76d1625a"
  end

  go_resource "github.com/soniakeys/quant" do
    url "https://github.com/soniakeys/quant.git",
        using:    :git,
        tag:      "v1.0.0",
        revision: "0a3861b3bd925b434c67c93a15633ced8475092d"
  end

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "off"

    Language::Go.stage_deps resources, buildpath/"src"

    system "go", "build", "-o", bin/"ssh-randomartd"
  end

  plist_options manual: "ssh-randomartd"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <true/>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/ssh-randomartd</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>StandardErrorPath</key>
        <string>#{var}/log/ssh-randomartd.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/ssh-randomartd.log</string>
      </dict>
      </plist>
    EOS
  end

  test do
    fork { exec bin/"ssh-randomartd" }
    sleep 2
    # We've got a long name so ask lsof to print all of it
    assert_match "ssh-randomartd", shell_output("lsof -U +c 0")
  end
end
