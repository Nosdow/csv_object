require 'csv'

table = CSV.parse(File.read("/Users/ti80/Desktop/dev/csv_object/db/algeria_cities.csv"), headers: true,  col_sep: ',')

headers = table.headers.flatten

count = 0

puts "Écrivez le nom de la colonne désirez "
headers.each do |index|
  @index = index
  puts "#{count} - #{index}"
  count +=1
end

get_selected_col = gets.chomp.split #array d'integers définissant le nom de headers et aussi la colonne

@selected_headers = [] #nom des headers
@intgr_col = []


get_selected_col.map do |intgr_col|
  @intgr_col << intgr_col
  @selected_headers << headers[intgr_col.to_i]
end

@col = @intgr_col.map {|col| col.to_i} #colonnes en array d'integral


CSV.open("db2/test2.csv", 'a+', headers: true, col_sep: ',') do |csv|

  csv << @selected_headers

    @col.each do |col_num|
  table.by_col[col_num].each do |col| 

    csv << [col]
  end
    end
      end

