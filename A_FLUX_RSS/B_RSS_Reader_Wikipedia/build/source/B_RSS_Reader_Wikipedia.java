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

public class B_RSS_Reader_Wikipedia extends PApplet {

/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::

 ----------------------
 B_RSS_Reader_Wikipedia
 ----------------------
 WIKIPEDIA RSS
 REF : http://fr.wikipedia.org/wiki/Wikip\u00e9dia:Syndication

 In this example, we access Wikipedias RSS to find out the latest articles to have
 been modified. We can also search a particular article by name and see what has
 changed there specifically.
 */

////////////////////// GLOBALS
PFont myFont;
int x = 10;
int y = 50;
// Article name we want to check
String subject = "England";

/////////////////////////////////////// SETUP
public void setup() {
  
  background(0);
  
  myFont = createFont("helvetica", 18);
  textFont(myFont);
  fill(255);

  // This address accesses a specific article by name
  String url = "https://en.wikipedia.org/w/index.php?title="+subject+"&action=history&feed=rss";

  // This address accesses latest modifications
  //String url = "https://en.wikipedia.org/w/index.php?title=Special:NewPages&feed=rss";

  XML rss = loadXML( url );
  XML[] data = rss.getChildren("channel/item/title");
  String s = rss.format(0); // formats XML :\u2013)
  print(s); //Display raw data in the console.

  // Getting also the last publication date for that change
  XML[] date = rss.getChildren("channel/item/pubDate");

  //Note we are using the same loop to iterate two pieces of data
  for (int i = 0; i < data.length; i++) {
    text(data[i].getContent(), x, y);
    text(date[i].getContent(), x, y+20);
    y+=40;
  }
}
  public void settings() {  size(1100, 460);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "B_RSS_Reader_Wikipedia" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
