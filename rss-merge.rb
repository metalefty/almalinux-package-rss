#!/usr/bin/env ruby

require 'rss'
require 'optparse'

options = {}
opt = OptionParser.new
opt.on('-t VAL', '--title') {|v| options[:t] = v }
opt.on('-d VAL', '--description') {|v| options[:d] = v }
opt.on('-l VAL', '--link') {|v| options[:l] = v }
opt.parse!(ARGV)


new_rss = RSS::Maker.make('2.0') do |maker|
  maker.items.do_sort = true
  maker.channel.title = options[:t]
  maker.channel.description = options[:d]
  maker.channel.link = options[:l]
end

ARGV.each do |f|
  rss = RSS::Parser.parse(f)

  rss.items.each do |e|
    new_rss.items << e
  end
end

print new_rss.to_s
