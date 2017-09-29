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

public class A_RSS_Reader_01 extends PApplet {

/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::

 --------------
 RSS_Reader_01
 --------------

 REF : https://processing.org/reference/XML.html

 */

///////////////////////////////// GLOBALS //////////////////////////////
PFont myFont;
int x = 10;
int y = 50;

/////////////////////////////////////// SETUP //////////////////////////////
public void setup() {
  
  background(0);
  
  myFont = createFont("helvetica", 14);
  textFont(myFont);
  fill(255);
  /*
  // A few RSS web addresses. Many more can be found :
   http://newsrss.bbc.co.uk/rss/newsonline_world_edition/technology/rss.xml
   http://feeds.bbci.co.uk/news/uk/rss.xml
   http://rss.liberation.fr/rss/9/
   http://www.lemonde.fr/rss/une.xml
   http://news.yahoo.com/rss/topstories
   */

  // Web feed address
  String url = "http://feeds.bbci.co.uk/news/uk/rss.xml";

  // We assign this address to a XML object
  XML rss = loadXML( url );


  // All content for this feed will be found between the tag <channel>
  // .getChildren method enables us to access the tag <title>
  // Note that we create a XML array object, in which the data will be stored
  XML[] data = rss.getChildren("channel/item/title");
  String s = rss.format(0); // formats XML :\u2013)
  print(s);// Display raw data in the console.

  // Grabbing summary text for each title too ;\u2013)
  XML[] description = rss.getChildren("channel/item/description");

  // FOR loop to iterate through stored data
  for (int i = 0; i < data.length; i++) {
    // .getContent does exactly what it says ;\u2014)
    text(data[i].getContent(), x, y);

    // Display summaries...
    text(description[i].getContent(), x, y+20);
    y+=40;
  }


}
  public void settings() {  size(1100, 720);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "A_RSS_Reader_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
