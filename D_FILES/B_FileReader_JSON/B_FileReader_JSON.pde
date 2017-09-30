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
  data.loadData("titres_livres.json", true);
}

void draw() {
}


/**
 * A class for reading data from json files
 */

class JsonData {

  JSONArray theData;
  String fileName;
  int dataSetSize;

  JsonData() {
    theData = new JSONArray();
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
    theData = loadJSONArray(fileName);
    this.dataSetSize = getSize();
    println("DataSet size = "+dataSetSize+ " elements");
    if (_show) {
      println(theData);
    }
  }



  int getSize() { 
    return theData.size();
  }
}