require 'pry'
require 'csv'

class CsvFinder

    def initialize(folder:)

    @folder = folder

    end

    def perform
        folder_content #array
        choose_file
        #show_column_names
        read_file
        
    end
    
    private

    def folder_content
        index = 0
        @folder.each do |files|
        files = files.gsub("db/"," ").gsub(".csv"," ")     
        puts "#{index} #{files}" 
        index +=1  
        end   
    end

    def choose_file
        
        puts "Quel fichier ?"
        chosen_file = gets.chomp.to_i
        @folder[chosen_file]
        
    end
=begin
    def show_column_names
        column_names = []
        column_csv = CSV.parse(File.read(choose_file), headers: true)
        column_csv.by_row.first
        column_names << column_csv
    end
=end

    def column_choice
        
        puts "Quel colonne désirez-vous ?"
        chosen_column = gets.chomp.to_i
    end

    def read_file
        chosen_csv = []
        parsed_csv = CSV.parse(File.read("#{choose_file}"), headers: true)
        parsed_csv.by_col[column_choice].each do |col| 
        chosen_csv << col
        puts chosen_csv
        end
    end

end

