/*
 * URL_01
 * Connects to a URL : Uniform Resource Locator
 *
 * MW_18.12.2015
 * links / refs ...
 * Learn more : http://www.tutorialspoint.com/java/java_url_processing.htm
 *
 * end

*/

/////////////////////////// GLOBALS ////////////////////////////
import java.io.*;
import java.net.*;

URL url;
String urlAddress = "http://www.theguardian.com/news/2015/dec/03/should-kids-learn-code";

/////////////////////////// SETUP ////////////////////////////

void setup() {
  //size(400, 400);
  background(0, 0, 33);

  
  //Attempt a connection to URL
  try { 
  url = new URL(urlAddress);
  URLConnection conn = url.openConnection();
  conn.connect();
  println("We are connected Obi-Wan.");
  }

  // Check for errors
  catch (Exception ex) { 
    ex.printStackTrace();
    System.out.println("Error : " + ex.getMessage());
  }


}

/////////////////////////// DRAW ////////////////////////////
void draw() {

}

/////////////////////////// FUNCTIONS ////////////////////////////
