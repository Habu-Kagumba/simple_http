#!/usr/bin/env ruby
# encoding: UTF-8

require 'webrick'

public_dir = File.expand_path('./public')

server = WEBrick::HTTPServer.new(
  Port: 8000,
  DocumentRoot: public_dir
)

# Custom routes
server.mount_proc '/custom' do |req, res|
  res.body = 'This is a custom response'
end

trap 'INT' do
  server.shutdown
end

server.start
