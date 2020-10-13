/*******************************************************************************
 * Name: Michael Dahlquist
 * File: WhitakersWords.java
 * Start: Friday, March 27th, 2020
 * Latest: Tuesday, March 31st, 2020
 * 
 * Enter a latin word as an arguement. The program will query Whitaker's Words
 * (see: http://archives.nd.edu/words.html) to get the dictionary definition(s)
 * of the word. The result is then printed to the terminal. 
 * 
 * A portion of this code was inspired by: 
 * https://docs.oracle.com/javase/tutorial/networking/urls/readingURL.html
 *****************************************************************************/

import java.net.*;
import java.io.*;

public class WhitakersWords {
    public static void main(String[] args) throws Exception {

        String entry = args[0];
        for (int i = 1; i < args.length; i++) entry = entry + "+" + args[i];

        String url = "http://archives.nd.edu/cgi-bin/wordz.pl?english=" + entry;

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
}
