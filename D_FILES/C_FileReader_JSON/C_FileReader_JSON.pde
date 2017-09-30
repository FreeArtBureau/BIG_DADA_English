/* -----------
 * File_Reader
 * -----------
 *
 * Sketch : C_FileReader_JSON
 * Reads data from a json formated file
 * 
 * DATASET : https://opendata.paris.fr/explore/dataset/les-1000-titres-les-plus-reserves-dans-les-bibliotheques-de-pret/export/?dataChart=eyJxdWVyaWVzIjpbeyJjb25maWciOnsiZGF0YXNldCI6Imxlcy0xMDAwLXRpdHJlcy1sZXMtcGx1cy1yZXNlcnZlcy1kYW5zLWxlcy1iaWJsaW90aGVxdWVzLWRlLXByZXQiLCJvcHRpb25zIjp7fX0sImNoYXJ0cyI6W3sidHlwZSI6ImNvbHVtbiIsImZ1bmMiOiJBVkciLCJ5QXhpcyI6InJhbmciLCJzY2llbnRpZmljRGlzcGxheSI6dHJ1ZSwiY29sb3IiOiIjNjZjMmE1In1dLCJ4QXhpcyI6ImF1dGV1ciIsIm1heHBvaW50cyI6NTAsInNvcnQiOiIifV0sInRpbWVzY2FsZSI6IiJ9
 *
 * MW_2017
 * 
 * end
 */

////////////////////////////////////////////////////////////////////

JsonData data;

void setup() {
  data = new JsonData(); 
  data.loadData("titres_livres.json", false);
  
  // methods for getting certain data
  
  //data.readData("fields");
  data.getTitles();
  //data.getNumberOfLends();
  //data.getRank();
}

void draw() {
}