/* ----------
 * RSS_Reader
 * ----------
 *
 * Sketch : RSS_ReaderViz_01
 * Grabs an RSS feed & does a simple data Viz based on text length
 *
 *
 * MW_2017
 * (c) 2008 Till Nagel, btk.tillnagel.com
 * end
 */

////////////////////// GLOBALS

PFont font;
String[] content;
float y = 20;
XML rss;
XML[] data;
/////////////////////////////////////// SETUP

void setup() {
  size(700, 850);
  background(0, 0, 33);
  noStroke();
  font = createFont("helvetica", 12);
  textFont(font);
  fill(255);

  String url = "http://feeds.bbci.co.uk/news/uk/rss.xml";
  rss = loadXML(url);
  data = rss.getChildren("channel/item/title");

  content = new String[data.length];
  for (int i = 0; i < data.length; i++) {
    content[i] = data[i].getContent();
  }
  
  displayTitles();
}


//////////////////////////////////// FUNCTION
void displayTitles() {
  fill(255);
  for (int i = 0; i < content.length; i++) {
    // We use the length of our content data to determine colour
    fill(0 + constrain(content[i].length(), 0, 255));
    rect(8, y - 11, 14, 14);

    // ...as well as the length of our bar graphics
    fill(255, 100);
    rect(23, y - 11, content[i].length() * 2, 14);

    // Display textual data
    fill(255, 220);
    text(content[i], 50, y);
    y+=20;
  }
}