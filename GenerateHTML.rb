#!/usr/bin/env ruby

path =  "/home/weewx/public_html/1/" #Dir.getwd #"C:/" 
fileExt = "jpg"
outFile = "/home/weewx/public_html/1/index.html"
columns = 2
width = 192

puts path

files = Dir.entries(path).select { |f| !f[-fileExt.length..-1].nil? && f[-fileExt.length..-1].downcase  == fileExt.downcase  }
puts files
html = "<html><body>"
html += "\n"

currentColumn=0
files.each do |file|
  html += "<a href='#{file}'>"
  html += "<img src='#{file}' width = #{width}  />"
  html += "</a>\n"
  currentColumn += 1
  if currentColumn==columns  
    html += "<br/>"
	currentColumn=0
  end
end
html += "</html></body>"
puts html

File.open(outFile, 'w') { |file| file.write(html)}


#STDOUT.flush  
#gets.chomp 
#puts "\a "
