#!/usr/bin/env ruby

require 'pty'
require 'expect'

PTY.spawn("./openvpn_1.sh") do |reader, writer, pid|

  result = reader.expect("Country Name")
  writer.puts "DE"

  result = reader.expect "State or Province Name"
  writer.puts "Berlin"

  result = reader.expect "Locality Name"
  writer.puts "Berlin"

  result = reader.expect "Organization Name"
  writer.puts "SuitePad"

  result = reader.expect "Organizational Unit Name"
  writer.puts "IT"

  result = reader.expect "Common Name"
  writer.puts ""

  result = reader.expect "Name []"
  writer.puts "IT"

  result = reader.expect "Email Address"
  writer.puts ""

  result = reader.expect "A challenge password"
  writer.puts "."

  result = reader.expect "An optional company name"
  writer.puts "."

  result = reader.expect "Sign the certificate"
  writer.puts "y"

  result = reader.expect "1 out of 1 certificate requests certified, commit"
  writer.puts "y"

end