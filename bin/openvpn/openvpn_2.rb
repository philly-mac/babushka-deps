#!/usr/bin/env ruby

require 'pty'
require 'expect'

PTY.spawn("./openvpn_2.sh") do |reader, writer, pid|

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

  result = reader.expect "A challenge password"
  puts result
  writer.puts "."

  result = reader.expect "An optional company name"
  puts result
  writer.puts "."

  result = reader.expect "Sign the certificate"
  puts result
  writer.puts "y"

  result = reader.expect "1 out of 1 certificate requests certified, commit"
  puts result
  writer.puts "y"

end