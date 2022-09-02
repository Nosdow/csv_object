require 'pry'
require 'csv'
require_relative 'lib/communicator.rb'
require_relative 'lib/csv_finder.rb'
require_relative 'lib/csv_chooser.rb'



folder = Dir['**/*.csv']



Communicator.welcome

CsvFinder.new(folder: folder).perform


