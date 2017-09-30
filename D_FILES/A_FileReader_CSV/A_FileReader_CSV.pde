/* -----------
 * File_Reader
 * -----------
 *
 * Sketch : A_FileReader_CSV
 * Reads data from a CSV/TSV formated file
 *
 *
 * MW_2017
 * 
 * end
 */

////////////////////////////////////////////////////////////////////

String[] CSV_File;
int num;
float aire, surfaceT;
String gen, titre;

////////////////////////////////////////////////////////////////////  
void setup() {
  smooth();
  noStroke();
  CSV_File = loadStrings("data_01.tsv");

  for (int i=1; i < CSV_File.length; i++) {
        
    String[] data = split(CSV_File[i], TAB);

    num = Integer.parseInt(data[0]);
    aire = Float.parseFloat(data[1]);
    surfaceT = Float.parseFloat(data[2]);
    gen = data[3];
    titre = data[4]; 
    
    //On vérifie les données en les affichant dans le console de Processing en bas.   
    println(num + " -> " + aire + " -> " + surfaceT + " -> " + titre + " -> " + gen);
  }
}
////////////////////////////////////////////////////////////////////

void draw() {
  background(0);
}