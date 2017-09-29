/*
 :::::::::::::::
  BIG_DADA 2017
 :::::::::::::::

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
void setup() {
  size(1100, 720);
  background(0);
  smooth();
  myFont = createFont("helvetica", 14);
  textFont(myFont);
  fill(255);
  /*
   http://www.nytimes.com/services/xml/rss/index.html 
  
   A few RSS web addresses. Many more can be found :
   
   http://newsrss.bbc.co.uk/rss/newsonline_world_edition/technology/rss.xml
   http://feeds.bbci.co.uk/news/uk/rss.xml
   http://rss.liberation.fr/rss/9/
   http://www.lemonde.fr/rss/une.xml
   http://news.yahoo.com/rss/topstories
   http://rss.nytimes.com/services/xml/rss/nyt/World.xml
   */

  // Web feed address
  String url = "http://feeds.bbci.co.uk/news/uk/rss.xml";

  // We assign this address to a XML object
  XML rss = loadXML( url );

  // All content for this feed will be found between the tag <channel>
  // .getChildren method enables us to access the tag <title>
  // Note that we create a XML array object, in which the data will be stored
  
  XML[] data = rss.getChildren("channel/item/title");
  String s = rss.format(0); // formats XML :–)
  print(s);// Display raw data in the console.

  // Grabbing summary text for each title too ;–)
  XML[] description = rss.getChildren("channel/item/description");

  // FOR loop to iterate through stored data
  for (int i = 0; i < data.length; i++) {
    // .getContent does exactly what it says ;—)
    text(data[i].getContent(), x, y);

    // Display summaries...
    text(description[i].getContent(), x, y+20);
    y+=45;
  }


}