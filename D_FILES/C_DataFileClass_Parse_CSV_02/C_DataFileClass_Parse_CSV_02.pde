/*
::::::::::::::::::::::::::::::
 ------------------------------
 PARSING DATA : CSV FILES
 ------------------------------
 ::::::::::::::::::::::::::::::
 
 DEV 24/03/2015
 Sketch : DataFileClass_Parse_CSV_02
 
 - Reads incoming data from a file
 - Prints all data in console
 
 ** NOTE 
 ce skektch est quasiment le même que le premier, sauf qu'on récupère
 maintenant toutes les données de notre fichier et on les affiche dans
 la console en bas
 
 */
/////////////////////////// GLOBALS ////////////////////////////
// Voici un objet qui va gérer nos données 
FloatTable data;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(300, 300);
  background(0);
  smooth();
  noStroke();
  // J'ai crée cette fonction en bas
  initData(); // data initialisation function
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(0);
}
/////////////////////////////////////////////////////////////////////////////////
void initData() {  
  // Charger le fichier csv qui se trouve dans le dossier data
  data = new FloatTable("openpaths_01.csv");

  // ensuite on va dans un premier temps juste afficher les données
  // qui nous intéressent dans la console en bas en utilsant les méthodes
  // propres à la classe FloatTable

    int rowCount = data.getRowCount(); // récupérer le nombre de rangés
  int colCount = data.getColumnCount(); // récupérer le nombre de colonnes

  // Afficher ces infos en bas dans la console
  println("Nombre de rangés = "+rowCount);
  println("Nombre de colonnes = "+colCount);


  // Parcourir les rangées pour récupérer toutes les données de la première 
  // et la deuxième colonne
  for (int row = 0; row<rowCount; row++) {
    //  récupérer la donnée latitude
    float latitude = data.getFloat(row, 0); 
    println("Lat : "+latitude);

    // récupérer la donnée longitude
    float longitude = data.getFloat(row, 1); 
    println("Long : "+longitude);
  }
}

