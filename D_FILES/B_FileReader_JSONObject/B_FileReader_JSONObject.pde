/* -----------
 * File_Reader
 * -----------
 *
 * Sketch : B_FileReader_JSON
 * Reads data from a json formated file
 * 
 * DATASET : https://opendata.paris.fr/explore/dataset/les-1000-titres-les-plus-reserves-dans-les-bibliotheques-de-pret/export/?dataChart=eyJxdWVyaWVzIjpbeyJjb25maWciOnsiZGF0YXNldCI6Imxlcy0xMDAwLXRpdHJlcy1sZXMtcGx1cy1yZXNlcnZlcy1kYW5zLWxlcy1iaWJsaW90aGVxdWVzLWRlLXByZXQiLCJvcHRpb25zIjp7fX0sImNoYXJ0cyI6W3sidHlwZSI6ImNvbHVtbiIsImZ1bmMiOiJBVkciLCJ5QXhpcyI6InJhbmciLCJzY2llbnRpZmljRGlzcGxheSI6dHJ1ZSwiY29sb3IiOiIjNjZjMmE1In1dLCJ4QXhpcyI6ImF1dGV1ciIsIm1heHBvaW50cyI6NTAsInNvcnQiOiIifV0sInRpbWVzY2FsZSI6IiJ9
 * https://processing.org/reference/JSONObject.html
 * MW_2017
 * 
 * end
 */

////////////////////////////////////////////////////////////////////

JsonData data;

void setup() {
  data = new JsonData(); 
  data.loadData("ClueDataExport-2017-11-05.json", true);
}

void draw() {
}


/**
 * A class for reading data from json files
 */

class JsonData {

  JSONObject theData;
  String fileName;
  int dataSetSize;

  JsonData() {
    
  }

  /**
   * loads json file
   * @param _fileName : the file to load
   * @param _show : display in console data
   *
   */
  void loadData(String _fileName, boolean _show) {
    this.fileName = _fileName;
    println(fileName);
    theData = loadJSONObject(fileName);
    println( theData );
  
  }

}