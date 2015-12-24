/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ----------------
 D_RSS_Reader_01b
 
 Displays latest tags for a user
 ----------------
 RSS DELICIOUS
 REF : https://delicious.com/rss
 
 */

String user = "motiondesign"; // User name here
String tag = "api";
int numResults = 100; // Maximum number of results
String api  = "http://feeds.delicious.com/v2/rss/";
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

  // Iterate data
  for (int i=0; i < data.length; i++) {
    XML tagElement   = data[i].getChild("title"); 
    String titre  = tagElement.getContent();

    text(titre, x, y); // display results with text() function
    y+=15;
  }
}


////////////////////// Little function
void initRSS() {
  String url = api + user + "?count="+numResults;
  XML rss = loadXML( url );
  String form = rss.format(0);
  //println(form);
  data = rss.getChildren("channel/item");
}

