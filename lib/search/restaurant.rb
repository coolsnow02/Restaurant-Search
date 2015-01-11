#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require 'csv'

module Search
  class Restaurant

    def initialize(input)
      @restaurant_menus = input
    end

    def my_best_deal(items)
      if available_menu_item?(items)
        search_items items
      end
    end

    private

    def read_csv
      # IO.foreach doesn't read the entire file into memory at once, which is good since a standard FasterCSV.parse on this file can take an hour or more
      IO.foreach(@restaurant_menus) do |row|
        row = CSV.parse_line(row, Hash.new)
        store row if valid_row(row)
      end
    end

# Validate the data in the row before storing it in our data structure.
    def valid_row(row)
      row[0].to_i > 0 && row[1].to_f.round(2) >= 0.00 && row[2..-1].size > 0
    end

    def	store(row)
      restaurant_id, price, items= row[0].strip!.to_i, row[1].strip!.to_f.round(2), row[2..-1]
      items = items.reject { |item|  item.strip! == "" }
      @restaurant_menus[restaurant_id] = {price => items}
    end

    def available_menu_item?(items)
      available_items = @restaurant_menus.each_with_index do |restaurant_id, menu|
        menu.values.join(', ').uniq!
      end
      (available_items & items).length == items.length
    end
# it returns the item_id of a given item
# if item is new its added to items list and its id is returned
    def item(menu_item)
      if @items.include?(menu_item)
        @items.index(menu_item)
      else
        @items << menu_item
        @items.length - 1
      end
    end
  end
end