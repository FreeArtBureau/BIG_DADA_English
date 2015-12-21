/*
CLASSE POUR SE CONNECTER À DELICIOUS
 Merci à David Bouchard
 http://www.deadpixel.ca
*/
 
 class DeliciousAPI {

  PApplet sketch;
  String api = "http://feeds.delicious.com/v2/rss/";

  // Constructor
  DeliciousAPI(PApplet _sketch) { 
    sketch = _sketch;
  } 
  
  // This method will give us an array of DeliciousTag objects
  // for a given user 
  // tag with counts < than cutoff will be ignored
  DeliciousTag[] getUserTags( String user, int cutoff) {

    String query = api + "tags/" + user;  

    // this will be the root of the document, in our case
    // the <rss> tag
    XML xml = loadXML(query);

    // the XMLElement class has methods to search the tag tree
    // and extract only the tags we care about
    XML data[] = xml.getChildren("channel/item");

    // create the list once we know how many tags we are dealing with
    //DeliciousTag[] tags = new DeliciousTag[data.length];
    ArrayList tags = new ArrayList();

    for (int i=0; i < data.length; i++) {
      // this is just to make it clear that each variable we are 
      // look at here is also an XMLElement 
      XML tagElement   = data[i].getChild("title"); 
      XML countElement = data[i].getChild("description");
      XML urlElement   = data[i].getChild("guid");

      String tag  = tagElement.getContent();
      int count   = Integer.parseInt( countElement.getContent() );
      String url  = urlElement.getContent();

      //tags[i] = new DeliciousTag(tag, url, count);
      // only add a new object if the count is high enough
      // we can do that with an ArrayList because it wil just grow as we 
      // add things to it, as opposed to an Array which has a fixed size
      // in the beginning 
      if ( count > cutoff ) {
        tags.add ( new DeliciousTag(tag, url, count) );
      }
    }
    
    
    // sort our list of tags using the Arrays utility class
    //Arrays.sort(tags);
    Collections.sort(tags);
    
    // convert the ArrayList back into a regular array so that 
    // we don't have to change everything else in the program
    DeliciousTag[] tagsArray = new DeliciousTag[ tags.size() ];
    tags.toArray(tagsArray);
    return tagsArray;
  }
} // <-- end of DeliciousAPI class

