/*
 * URL_01b
 * Connects to a URL : Uniform Resource Locator
 * This sketch demonstrates various URL methods
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

  connect();
  getDetails();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {


}

/////////////////////////// FUNCTIONS ////////////////////////////

void connect() {
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


void getDetails() {
  println(" ");
  println("/////////////////////////////////// ");

//Various methods URL class
  
  String q = url.getProtocol();
  println("Protocol : "+q);


  String h = url.getHost();
  println("Host : "+h);

  String p = url.getPath();
  println("Path address : "+p);

  // Put it all together to make a nice web address
  println("Full URL : "+q+"://"+h+p);

}
