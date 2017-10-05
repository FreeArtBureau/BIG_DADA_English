/* ----------
 * RSS_Reader
 * ----------
 *
 * Sketch : RSS_Reader_01
 * Grabs an RSS feed
 *
 *
 * MW_2017
 * REF : https://processing.org/reference/XML.html.
 * end
 */

///////////////////////////////// GLOBALS //////////////////////////////


/////////////////////////////////////// SETUP //////////////////////////////
void setup() {
  background(0);
  
  String url = "http://feeds.bbci.co.uk/news/uk/rss.xml";
  XML rss = loadXML( url );
  String s = rss.format(0); // formats XML :–)
  print(s); // Display raw data in the console.
  
  // copy & check xml with https://codebeautify.org/rssviewer

}