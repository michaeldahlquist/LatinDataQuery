--[[
Name: Michael Dahlquist
File: QueryFunctions.lua
Started: Tuesday, March 31st, 2020
Latest: Tuesday, March 31st, 2020

Some of these functions were originally from a partner 
project I worked on spring of my sophomore year, 
here is the link to the repository: 
https://github.com/michaeldahlquist/hangman

Includes:
get_site_data(word)
table_to_file(file_name, my_table)
get_lines(file_name)

]]

--https://stackoverflow.com/questions/9676113/lua-os-execute-return-value
function get_site_data(word)
    --This is from hangman.
    --Input: Latin word you would like to get WhitakersWords data from
    --Output: A string that contains the html block from 
    command = "javac WhitakersWords.java\njava WhitakersWords "..word
    print("Executing "..command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    --print("This is the result of the command ")
    --print(result)
    return result
end

function table_to_file(file_name, my_table)
--modified  add_words_to_file(file_name) from hangman into this function 
--this function takes in two parameters, a string that is the file_name of 
--the destination file., and my_table that is a table of lines [1,n]
--of lines to printed to the text file
    file_table = get_lines(file_name)
    local file = io.open(file_name, "w+") --open file
    io.output(file) --set output to file
    for i = 1, #my_table do --writes lines from table
        io.write(my_table[i]..'\n')
    end
    file:close()
end

function get_lines(file_name)
--get_lines(file_name) returns a table and count of all the lines in file_name
--does not include return characters
    new_table = {}
    count = 0
    local file = io.open(file_name, "a+")
    for line in io.lines(file_name) do
        count = count + 1
        --fixes formatting issues
        line1 = line
        line1 = string.gsub(line1, "%A", "*")
        if string.sub(line1,string.len(line1),string.len(line1)) == "*" then
            line = string.sub(line,1,string.len(line1)-1)
        end
        new_table[count] = line
        --new_table[count] = string.sub(line, 1, string.len(line))
    end
    file:close()
    return new_table
--A portion of this code was inspired by:
--https://stackoverflow.com/questions/11201262/how-to-read-data-from-a-file-in-lua
end

