/* ----------
 * RSS_Reader
 * ----------
 *
 * Sketch : RSS_Reader_02
 * Grabs an RSS feed & displays some data
 *
 *
 * MW_2017
 * REF : https://processing.org/reference/XML.html.
 * end
 */

///////////////////////////////// GLOBALS //////////////////////////////
PFont myFont;
int x = 10;
int y = 20;

/////////////////////////////////////// SETUP //////////////////////////////
void setup() {
  size(1100, 720);
  background(0, 0, 33);
  smooth();
  myFont = createFont("helvetica", 14);
  textFont(myFont);
  fill(255);
  
  /*
   You can find lots of RSS feeds. A simple web search...
   http://www.nytimes.com/services/xml/rss/index.html 
   
   A few RSS web addresses. Many more can be found :
   
   http://newsrss.bbc.co.uk/rss/newsonline_world_edition/technology/rss.xml
   http://feeds.bbci.co.uk/news/uk/rss.xml
   http://rss.liberation.fr/rss/9/
   http://www.lemonde.fr/rss/une.xml
   http://news.yahoo.com/rss/topstories
   http://rss.nytimes.com/services/xml/rss/nyt/World.xml
   */

  String url = "http://feeds.bbci.co.uk/news/uk/rss.xml";
  XML rss = loadXML( url );
  
  // All content for this feed will be found between the tag <channel>
  // .getChildren method enables us to access the tag <title>
  // Note that we create a XML array object, in which the data will be stored
  
  XML[] data = rss.getChildren("channel/item/title");
  String s = rss.format(0); // formats XML :–)
  print(s);// Display raw data in the console.

  XML[] description = rss.getChildren("channel/item/description");
  
  for (int i = 0; i < data.length; i++) {
    // .getContent does exactly what it says ;—)
    text(data[i].getContent(), x, y);
    text(description[i].getContent(), x, y+20);
    y+=45;
  }
}