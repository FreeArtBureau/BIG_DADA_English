/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ----------------------
 A_Data_File_TSV_01
 ----------------------
 
 Ce sketch permet de lire un tableau contenant des données
 */

////////////////////////////////////////////////////////////////////

String[] rows;
int num;
float aire;
float surfaceT;
String gen;
String titre;
float dia;

////////////////////////////////////////////////////////////////////  
void setup() {
  smooth();
  noStroke();
  dia = 20;
  rows = loadStrings("data_01.tsv");

  for (int i=1; i < rows.length; i++) {
    String[] parts = split(rows[i], TAB);

    num = Integer.parseInt(parts[0]);
    aire = Float.parseFloat(parts[1]);
    surfaceT = Float.parseFloat(parts[2]);
    gen = parts[3];
    titre = parts[4];
    //Nous utilisons notre objet dat pour stocker
    //dat[i] = new Data(num, aire, surfaceT, titre, gen);  
    //On vérifie les données en les affichant dans le console de Processing en bas.   
    println(num + " -> " + aire + " -> " + surfaceT + " -> " + titre + " -> " + gen);
  }
}
////////////////////////////////////////////////////////////////////

void draw() {
  background(0);
}

