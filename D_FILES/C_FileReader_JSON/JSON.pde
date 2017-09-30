/**
 * A class for reading data from json files
 */

class JsonData {

  JSONArray theData;
  String fileName;
  int dataSetSize;
  String theKey;
  //int indexID;

  JsonData() {
    theData = new JSONArray();
  }
  
  /**
   * prints out the rank
   * 
   */
  void getRank(){
    for(int i=0; i<theData.size();i++){
      JSONObject elements = theData.getJSONObject(i);
      JSONObject field = elements.getJSONObject("fields");
      int s = field.getInt("rang");
      println("Rank = "+s);
    }  
  }
  
  /**
   * prints out the number of library lends
   * 
   */
  void getNumberOfLends(){
    for(int i=0; i<theData.size();i++){
      JSONObject elements = theData.getJSONObject(i);
      JSONObject field = elements.getJSONObject("fields");
      int s = field.getInt("prets");
      println("Number of lends = "+s);
    }  
  }
  
  
   /**
   * prints out the book titles 
   * 
   */
  void getTitles(){
    for(int i=0; i<theData.size();i++){
      JSONObject elements = theData.getJSONObject(i);
      JSONObject field = elements.getJSONObject("fields");
      String s = field.getString("titre");
      println(s);
    }
    
  }
  
  
  /**
   * reads fields from a given key
   * @param _s is the name of the key
   */

  void readData(String _s){
    this.theKey = _s;
    
    for(int i=0; i<theData.size();i++){
      JSONObject elements = theData.getJSONObject(i);
      JSONObject fields = elements.getJSONObject(theKey);
      println(fields);
    }
    
  }
  /**
   * loads json file
   * @param _fileName : the file to load
   * @param _show : display in console data
   *
   */
  void loadData(String _fileName, boolean _show) {
    this.fileName = _fileName;
    println("File name: "+fileName);
    theData = loadJSONArray(fileName);
    this.dataSetSize = getSize();
    println("DataSet size = "+dataSetSize+ " elements");
    println("///////////////////////////");
    if (_show) {
      println(theData);
    }
  }



  int getSize() { 
    return theData.size();
  }
}