#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require File.dirname(__FILE__) + '/lib/application.rb'
raise Search::CommandError if ARGV.size < 2
puts Search.accept(ARGV[0], ARGV[1..-1])