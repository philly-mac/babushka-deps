#!/usr/bin/env ruby

require 'pty'
require 'expect'

scripts = [
  "./openvpn_1.sh",
  "./openvpn_2.sh",
  "./openvpn_3.sh",
]

expects_data = [
  [
    ["Country Name", "DE"],
    ["State or Province Name", "Berlin"],
    ["Locality Name", "Berlin"],
    ["Organization Name", "SuitePad"],
    ["Organizational Unit Name", "IT"],
    ["Common Name", "."],
    ["Name []", "IT"],
    ["Email Address", "developers@suitepad.de"],
  ],

  [
    ["A challenge password", "."],
    ["An optional company name", "."],
    ["Sign the certificate", "y"],
    ["1 out of 1 certificate requests certified, commit", "y"],
  ]

]

expects = []
expects << expects_data[0]
expects << expects_data[0] + expects_data[1]
expects << expects_data[0] + expects_data[1]

scripts.each_with_index do |script, index|
  puts "Script #{script}"
  PTY.spawn(script) do |reader, writer, pid|

    expects[index].each do |question, answer|
      result = reader.expect question
      puts question
      puts answer
      writer.puts answer
    end

  end
end