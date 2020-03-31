//https://docs.oracle.com/javase/tutorial/networking/urls/readingURL.html

import java.net.*;
import java.io.*;

public class WhitakersWords {
    public static void main(String[] args) throws Exception {

        String url = "http://archives.nd.edu/cgi-bin/wordz.pl?keyword=" + args[0];

        URL myURL = new URL(url);
        BufferedReader in = new BufferedReader(
        new InputStreamReader(myURL.openStream()));

        String inputLine;
        int count = 0;
        System.out.println(args[0])
        while ((inputLine = in.readLine()) != null)
            if (count < 3) {
                count++;
            } else {
                System.out.println(inputLine);
                count++;
            }
        in.close();
    }
}