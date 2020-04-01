--[[
Name: Michael Dahlquist
File: LatinDataQuery.lua
Started: Tuesday, March 31st, 2020
Latest: Tuesday, March 31st, 2020

This contains the main program of the LatinDataQuery.
This file uses QueryFunctions.lua and WhitakersWords.java
to parse the WhitakersWords database for dictionary
information about a latin word.
]]

dofile("QueryFunctions.lua")

input_file = "input.txt" --Enter .txt
--input_file should be a txt file that contains a 
--list of latin words, seperated such that there
--is one word per line

output_file = string.sub(input_file,1,-5).."-Result.txt"

os.execute("javac WhitakersWords.java\n") --compile java file used
input = get_lines(input_file)
--input contains a table of words [1,n] that 
--are to be searched in Whitakers Words

output = {}
--output contains everything to be printed

for i = 1, #input do
    output[#output+1] = "The word you searched for was "..input[i].."."
    output[#output+1] = "We searched the following entry and got the result:\n"
    output[#output+1] = get_site_data(input[i]).."\n\n"
end

table_to_file(output_file, output)