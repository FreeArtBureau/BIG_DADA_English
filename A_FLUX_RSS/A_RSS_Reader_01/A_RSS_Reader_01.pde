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

  // All content for this feed will be found between the tag <channel>
  // .getChildren method enables us to access the tag <title>
  // Note that we create a XML array object, in which the data will be stored
  
  XML[] data = rss.getChildren("channel/item/title");
  String s = rss.format(0); // formats XML :–)
  print(s); // Display raw data in the console.
  
  // copy & check xml with https://codebeautify.org/rssviewer

}