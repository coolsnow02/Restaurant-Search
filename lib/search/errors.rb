#!/usr/bin/env ruby -wKU
# encoding: UTF-8

module Search

  class CommandError < ArgumentError
    def message
      "\nThe correct format for execution is:\n ruby #{File.dirname(__FILE__) + '/run.rb'} <csv file> item_label_1 item_label_2 ..."
    end
  end

  class FileError < TypeError
    def	message
      "\nInput File should be of the csv file format"
    end
  end

  class ReadError < IOError
    def message
      "\nUnable to read file."
    end
  end

end