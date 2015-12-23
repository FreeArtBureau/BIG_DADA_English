/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ----------------
 D_RSS_Reader_01
 ----------------
 RSS DELICIOUS
 REF: https://delicious.com/rss
 
 */

////////////////////// GLOBALS

String recent = "http://feeds.delicious.com/v2/rss/recent";
// Maximum number of results
int numResults = 50; 
XML data[];
int x = 10;
int y = 20;

/////////////////////////////////////// SETUP

void setup() {
  size(600, 800);
  smooth();
  background(255);
  fill(0);
  // Neat little function for initialising the connection & grabbing data
  initRSS();

  // iterate data
  for (int i=0; i < data.length; i++) {
    XML tagElement   = data[i].getChild("title"); 
    String tag  = tagElement.getContent();
    text(tag, x, y);

    y+=15;
  }
}

////////////////////// Little function
void initRSS() {
  String url = recent + "?count="+numResults;
  XML rss = loadXML (url);
  String form = rss.format(0);
  //println(form);
  data = rss.getChildren("channel/item");
}

