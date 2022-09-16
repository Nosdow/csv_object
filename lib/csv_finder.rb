require 'pry'
require 'csv'

class CsvFinder

    def initialize(folder:)

    @folder = folder

    end

    def perform
        folder_content #array
        choose_file
        # get_headers
        show_columns
        choose_headers_and_col
        chosen_headers
        # # column_for_csv
        # write_to_csv
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

    # def get_headers
    #     @headers = CSV.foreach(@file_dir).first
    # end

    def show_columns
        @count_col = 0
        puts "Voici les colonnes saisissez-celle que vous souhaitez extraire"
        for @col_index in @headers
        puts "#{@count_col} #{@col_index}" 
        @count_col+=1
        end
    end
    
    def choose_headers_and_col #colone en intgr à envoyer dans le write, le header doit suivre
        @csv = CSV.parse(File.read(@file_dir), headers: true)
        @choice_col = gets.split #est un array
        @choice_col.each do |col_selection| #devient un string
            @col_selection = col_selection.to_i
            @selected_col = @csv.by_col[col_selection]
            
        end
        #p @choice_col.map{|sr| sr.map(&:to_i)}
    end
    
    def headers
        @headers = []
        @origin_headers = CSV.foreach(@file_dir).first
        @headers << @origin_headers
        puts @headers
      end



#     def column_for_csv
#         @ary_col = []
#         @choice_col.each do |intgr_col|
#             @ary_col << intgr_col
# 
#             @headers = @headers[intgr_col.to_i]
#         end
# 
#     end 
#     
#     def write_to_csv
#         CSV.open("db2/test.csv", 'a+', headers: true) do |csv|
#             
#           
#         end
#           
#              
#         
#         
# 
#     end    
end