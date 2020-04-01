# LatinDataQuery

[![Run on Repl.it](https://repl.it/badge/github/michaeldahlquist/LatinDataQuery)](https://repl.it/github/michaeldahlquist/LatinDataQuery)

I made this project while quarentined during my spring 2020 distance learning. This tool is meant to make it easier to look up dictionary definitions of latin words. At the moment this is a very basic latin to english query. In LatinDictionaryQuery.lua you specify the input file, which should be a `input.txt` containing a latin word per line. You then execute the command `lua LatinDataQuery.lua` and it will create a file `input-RESULT.txt` in the directory.

Wanted features:

    [ ] prompt for input and output file
    [ ] add english to latin
    [ ] add direct paragraph translation
    [ ] add aditional source options
    [ ] smooth out WhitakersWords data
    [ ] output a .txt of unknown words
    [ ] convert to one language

# WhitakersWords.java
Here is the java file that pulls the data from the Whitakers Words site.

    public static void main(String[] args) throws Exception {

        String entry = args[0];
        for (int i = 1; i < args.length; i++) entry = entry + "+" + args[i];

        String url = "http://archives.nd.edu/cgi-bin/wordz.pl?keyword=" + entry;

        URL myURL = new URL(url);
        BufferedReader in = new BufferedReader(
        new InputStreamReader(myURL.openStream()));
        String inputLine;
        
        System.out.println("entry => " + entry);

        String [] lines = new String [20];
        int count = 0;
        while ((inputLine = in.readLine()) != null) {
            if (count < 2) {
                count++;
            } else {
                //System.out.println(inputLine);
                lines[count] = inputLine;
                count++;
            }
        }
        for (int i = 0; i < count - 2; i++) {
            if (lines[i] != null) System.out.println(lines[i]);
        }
        in.close();
    }