#!/usr/bin/env ruby

require 'pty'
require 'expect'

PTY.spawn("./openvpn_1.sh") do |reader, writer, pid|
 result = reader.expect("Country Name")
 writer.puts "DE"
 result = reader.expect("bye")
 p result
end