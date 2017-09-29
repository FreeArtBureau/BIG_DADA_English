import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class C_RSS_Reader_Delicious extends PApplet {

/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::

 ----------------------
 C_RSS_Reader_Delicious
 ----------------------
 RSS DELICIOUS
 REF : http://fr.wikipedia.org/wiki/Delicious

 Delicious is a book mark management service.
 It is not used so much nowadays but is an interesting source of information
 if you have used it in the past or want ot access other users' bookmarks ;\u2013)
 */

////////////////////// GLOBALS
PFont myFont;
int x = 10;
int y = 50;
// We will use this variable to store our search tag
String tag = "code";
// And this variable to store the user name for the account we want to query
String user = "motiondesign";

/////////////////////////////////////// SETUP
public void setup() {
  
  background(0);
  
  myFont = createFont("helvetica", 14);
  textFont(myFont);
  fill(255);
  /*
  // Delicious :
   >> More info on the various Delicious feeds we can access
   https://delicious.com/rss
   http://feeds.delicious.com/v2/rss/recent
   */

  // Web addresses. Each one refers to a different feed and therefore different data
  //String url = " http://feeds.delicious.com/v2/rss/tag/"+ tag + "?count=100"; // tag query
  String url = " http://feeds.delicious.com/v2/rss/tags/"+ user + "?count=100"; // tag query by user
  //String url = " http://feeds.delicious.com/v2/rss/networkmembers/"+ user + "?count=100"; // network query by user

  XML rss = loadXML( url );
  XML[] data = rss.getChildren("channel/item/title");
  String s = rss.format(0); // formats XML :\u2013)
  print(s);// Display raw XML in console

  // Iterate through the XML array to grab the content
  for (int i = 0; i < data.length; i++) {
    text(data[i].getContent(), x, y);
    y+=20;
  }
}
  public void settings() {  size(800, 900);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "C_RSS_Reader_Delicious" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}