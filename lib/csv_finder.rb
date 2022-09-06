require 'pry'
require 'csv'

class CsvFinder

    def initialize(folder:)

    @folder = folder

    end

    def perform
        folder_content #array
        choose_file
        get_column_names
        select_column
        choose_col
        column_for_csv
        write_to_csv
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
        @chosen_file = gets.chomp.to_i
        @folder[@chosen_file] 
        @file_dir = @folder[@chosen_file]
    end

    def get_column_names
        @column_names = []
        @column_csv = CSV.parse(File.read(@file_dir), headers: true)
        @column_names << @column_csv.headers
        @column_names = @column_names.flatten
        
    end

    def select_column
        @count_col = 0
        puts "Voici les colonnes saisissez-celle que vous souhaitez extraire"
        for @col_index in @column_names
        puts "#{@count_col} #{@col_index}" 
        @count_col+=1
        end
    end



    def choose_col
        @choice_col = gets.split(",")
        @choice_col = @choice_col.map{|intgr|intgr.to_i}
        @choice_col.each do |col_selection|
        @selected_col = @column_csv.by_col[col_selection]
        end
    end

    def column_for_csv
        @choice_col.map do |intgr_col|
        @column_names[intgr_col.to_i]
        end
    end 
    def write_to_csv
       
        CSV.open("db2/test.csv", 'a+', headers: true, col_sep: "\n") do |csv|
            csv << column_for_csv
        csv << @selected_col
       
         end
            
    end    
        
        
     

end