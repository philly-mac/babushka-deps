#!/usr/bin/env ruby

require 'pty'
require 'expect'

PTY.spawn("./openvpn_1.sh") do |reader, writer, pid|

  result = reader.expect("Country Name")
  puts result
  writer.puts "DE"

  result = reader.expect "State or Province Name"
  puts result
  writer.puts "Berlin"

  result = reader.expect "Locality Name"
  puts result
  writer.puts "Berlin"

  result = reader.expect "Organization Name"
  puts result
  writer.puts "SuitePad"

  result = reader.expect "Organizational Unit Name"
  puts result
  writer.puts "IT"

  result = reader.expect "Common Name"
  puts result
  writer.puts ""

  result = reader.expect "Name []"
  puts result
  writer.puts "IT"

  result = reader.expect "Email Address"
  puts result
  writer.puts "developers@suitepad.de"

end