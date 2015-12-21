/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 --------------
 RSS_Image_02
 --------------
 
 */
 
import java.util.regex.*;

PFont myFont;
PImage[] imgs;
PImage img;
int x = 10;
int y = 10;

///////////////////////////////// GLOBALS //////////////////////////////


/////////////////////////////////////// SETUP //////////////////////////////

void setup() {
  size(800, 900);
  background(255);
  myFont = createFont("helvetica", 12);
  textFont(myFont);
  fill(0);
  XML data= loadXML("http://earthquake.usgs.gov/earthquakes/shakemap/rss.xml");
  XML[] post = data.getChildren("channel/item/title");
  XML[] des = data.getChildren("channel/item/description");

  println(data);
  /*
  for (int i = 0; i < post.length; i++) {
   text(post[i].getContent(), x, y);
   y+=15;
   }
   */

  for (int i = 0; i < des.length; i++) { 
    String content = des[i].getContent(); 
    //println(des[i]);
    String imageURL = extractImageSource(content);
   // println(i+" | "+extractImageSource(content));
    
    img = loadImage(imageURL);
    image(img,x,y);
    x+=100;
    if(x>=width-100) {
      x=10;
    y+=100;
    }
  } 
}

/////////////////////////////////////// FUNCTIONS //////////////////////////////
String extractImageSource(String s)
{
  Pattern p = Pattern.compile("(?<=<img src=\")[^\"]*");
  Matcher m = p.matcher(s);
  if (m.find())
    return m.group();
  return "";
}

