/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ------------------
 D_RSS_Delicious_01
 ------------------
 RSS DELICIOUS
 REF: http://fr.wikipedia.org/wiki/Delicious
 
 */

////////////////////// GLOBALS
// Please read INFO tab for further Delicious web feeds 
String api  = "http://feeds.delicious.com/v2/rss/tags/"; 
String user = "motiondesign"; // User name here
int x = 10;
int y = 20;

// Array of tags using custom class
DeliciousTag[] tags; 

/////////////////////////////////////// SETUP

void setup() {
  size(600, 800);
  smooth();
  background(255);
  fill(0);
  // Note that we create a new String variable.
  String url = api + user; 
  XML rss = loadXML( url );

  XML data[] = rss.getChildren("channel/item");
  String s = rss.format(0); // formats XML :–)
  print(s);// Display raw XML in console

  // initialise our tag object with the same length as data
  tags = new DeliciousTag[data.length];

  // FOR loop to iterate through data
  for (int i=0; i < data.length; i++) {
    
    // We are going to store each element in a new XML object
    XML tagElement   = data[i].getChild("title"); 
    XML countElement = data[i].getChild("description");
    XML urlElement   = data[i].getChild("guid");
    
    // Next, we get and store the contents for each of these elements
    // Note the different methods
    String tag  = tagElement.getContent();
    int count   = Integer.parseInt( countElement.getContent() );
    String link  = urlElement.getContent();
    
    // and finally we put all this data into our tag array object
    // We now have a neat little object that has all three elements
    // stored and easily accessible from one object. 
    tags[i] = new DeliciousTag(tag, link, count);
    //print(url);

    // Display tag
    text(tag, x, y);
 
    // Display tag count. ie. number of bookmarks saved with this tag
    text(count, x+200, y);
    y+=15;
  }
}

