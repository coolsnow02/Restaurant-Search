#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require 'set'
module Search

  class << self

    def accept(csv, searched_items)
      @csv = csv
      @searched_items = searched_items
      validate_file
      restaurants = Restaurant.new(@csv)
      puts restaurants.inspect
      result = restaurants.my_best_deal(@searched_items)
      # result ? "#{result[0]}, #{result[1]}" : nil
    end

    protected

    def validate_file
      raise ReadError unless File.exist? @csv
      raise FileError unless File.extname(@csv) == ".csv"
      raise FileError unless File.size? @csv
    end

  end

end
