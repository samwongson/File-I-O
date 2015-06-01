require 'rubygems'
require 'rest-client'
require 'open-uri'


wiki_url = 

# File.open("wiki-page.html", "w") do |file|
#  file.write RestClient.get("http://en.wikipedia.org/wiki/philosophy")
# end

# puts File.open("wiki-page.html", "r").read

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"

# puts open(url).readline

# File.open("hamlet.txt", "w") do |file|
#   file.write(open(url).read)
# end

# File.open("hamlet.txt", "r") do |file|
#   file.readlines.each_with_index do |line, index|
#     puts line if index % 42 == 0
#   end
# end


dirname = "Samson"

sorted = Dir.glob("../../../**/*").sort_by do |fname| 
    File.size(fname)
  end

top_10 = sorted.reverse[0..9].each do |file|
  puts "#{file} has file size: #{File.size(file)}"

end

puts top_10



hash = Dir.glob("../../../**/*").inject({}) do |hsh, fname|
   ext = File.basename(fname).split('.')[-1].to_s.downcase
   hsh[ext] ||= [0,0]
   hsh[ext][0] += 1
   hsh[ext][1] += File.size(fname)   
   hsh
end               
File.open("file-analysis.txt", "w") do |f|
   hash.each do |arr|
     txt = arr.flatten.join("\t")
      f.puts txt
      puts txt
   end
end