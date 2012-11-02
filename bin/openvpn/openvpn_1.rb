#!/usr/bin/env ruby

require 'pty'
require 'expect'

PTY.spawn("./openvpn_1.sh") do |reader, writer, pid|

  result = reader.expect("Country Name")
  puts reader
  writer.puts "DE"

  result = reader.expect "State or Province Name"
  puts reader
  writer.puts "Berlin"

  result = reader.expect "Locality Name"
  puts reader
  writer.puts "Berlin"

  result = reader.expect "Organization Name"
  puts reader
  writer.puts "SuitePad"

  result = reader.expect "Organizational Unit Name"
  puts reader
  writer.puts "IT"

  result = reader.expect "Common Name"
  puts reader
  writer.puts ""

  result = reader.expect "Name []"
  puts reader
  writer.puts "IT"

  result = reader.expect "Email Address"
  puts reader
  writer.puts "developers@suitepad.de"

end