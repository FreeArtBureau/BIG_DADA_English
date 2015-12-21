/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ----------------------
 B_RSS_Reader_Wikipedia
 ----------------------
 WIKIPEDIA RSS 
 REF : http://fr.wikipedia.org/wiki/Wikipédia:Syndication
 
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
void setup() {
  size(1100, 460);
  background(0);
  smooth();
  myFont = createFont("helvetica", 18);
  textFont(myFont);
  fill(255);

  // This address accesses a specific article by name 
  String url = "https://en.wikipedia.org/w/index.php?title="+subject+"&action=history&feed=rss"; 

  // This address accesses latest modifications
  //String url = "https://en.wikipedia.org/w/index.php?title=Special:NewPages&feed=rss"; 

  XML rss = loadXML( url );
  XML[] title = rss.getChildren("channel/item/title");
  String s = rss.format(0); // formats XML :–)
  print(s); //Display raw data in the console.

  // Getting also the last publication date for that change
  XML[] date = rss.getChildren("channel/item/pubDate");

  //Note we are using the same loop to iterate two pieces of data
  for (int i = 0; i < title.length; i++) {    
    text(title[i].getContent(), x, y);
    text(date[i].getContent(), x, y+20);
    y+=40;
  }
}

