/*
 * URL_03
 * Connects to a URL : Uniform Resource Locator
 * Grabs content and stores it in a String variable
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
PrintWriter output; // Creates an output object
boolean saveText = false; // change to true to save web page content
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 400);
  background(0, 0, 33);
  smooth();
  noStroke();

    if(saveText) {
  //We will output to a text file.
  output = createWriter("Webcontent" + day() + month() + hour() + minute() +".txt"); 
  }
  
  scrapeWebAddress();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

}

/////////////////////////// FUNCTIONS ////////////////////////////

// Custom function for making a connection and reading content
void scrapeWebAddress() {
  String pageContents;
  String currentTokens;
  String savedContent= " ";

  //Attempt a connection to URL
  try {
    URL url = new URL(urlAddress);
    URLConnection conn = url.openConnection(); // prepare connection
    conn.connect(); // Connect to website

    // This class creates a character input stream using a default sized input buffer
    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    // loop through content line by line
    while ( (pageContents = in.readLine ()) !=null) {
      // break down string content into tokens (tokens=words?)
      StringTokenizer st  = new StringTokenizer(pageContents, "\"<>,.()[] ");
      while (st.hasMoreTokens ()) {
        
        currentTokens = st.nextToken().toLowerCase();   
        savedContent+=currentTokens;
      }
    } 

      if(saveText){
      //output content to txt file
      output.println(savedContent);
    }
  }

  catch (Exception ex) { // Any errors ?
    ex.printStackTrace();
    System.out.println("Error : " + ex.getMessage());
  }
}

void keyPressed() {
  output.flush(); // Write any remaining data to the file
  output.close(); // Close file
  exit(); //Finish writing the file
}