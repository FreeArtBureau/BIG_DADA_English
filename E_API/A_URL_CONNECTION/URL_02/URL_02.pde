/*
 * URL_02
 * Connects to a URL : Uniform Resource Locator
 * And searches for certain words.
 * These words can then be counted.
 *
 * MW_18.12.2015
 * links / refs ...
 * Learn more : http://www.tutorialspoint.com/java/java_url_processing.htm
 * BufferedReader : http://www.tutorialspoint.com/java/io/java_io_bufferedreader.htm
 *
 * end

*/

/////////////////////////// GLOBALS ////////////////////////////
import java.util.*;
import java.io.*;
import java.net.*;

URL url;
String urlAddress = "http://www.theguardian.com/news/2015/dec/03/should-kids-learn-code";

// Word count
int code = 0;
int kids = 0;

// countdown
int lastTime;
int interval = 10;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(440, 140);
  background(0, 0, 33);
  smooth();
  noStroke();
 
  scrapeWebAddress();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0, 0, 33);

  // countdown timer in seconds from 10 to 0
  int t = (interval - ((millis()-lastTime)/1000)); 

  if(code>1) {
    fill(100, 230, 255);
    textSize(18);
    text("The word code appears "+code+" times", 40, 40); 
    text("The word kids appears "+kids+" times", 40, 70);

}

// do something once countdown reaches zero
if(t<=0) {
  println("Hello");
  lastTime = millis();
}

}

/////////////////////////// FUNCTIONS ////////////////////////////

// Custom function for making a connection and reading content
void scrapeWebAddress() {
  String pageContents;
  String currentTokens;

  code = 0;
  kids = 0;

  //Attempt a connection to URL
  try {
    URL url = new URL(urlAddress);
    URLConnection conn = url.openConnection(); // prepare connection
    conn.connect(); // Connect to website

    // This class creates a character input stream using a default sized input buffer
    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    // loop through content line by line
    while ( (pageContents = in.readLine ()) !=null) {
      // break down string content into tokens ()
      StringTokenizer st  = new StringTokenizer(pageContents, "\"<>,.()[] ");
      while (st.hasMoreTokens ()) {

        currentTokens = st.nextToken().toLowerCase();
        
        // search for certain words & increase count if found
        if (currentTokens.indexOf("code") >=0)
          code++;
        if (currentTokens.indexOf("kids") >=0)
          kids++;
      }
    } 
  }

  catch (Exception ex) { // Any errors ?
    ex.printStackTrace();
    System.out.println("Error : " + ex.getMessage());
  }
}
