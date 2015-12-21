/*
::::::::::::::::::::::::::::::
 ------------------------------
 PARSING DATA : CSV FILES
 ------------------------------
 ::::::::::::::::::::::::::::::
 
 DEV 24/03/2015
 Sketch : DataFileClass_Parse_CSV_01
 
 - Reads incoming data from a file
 - Prints it simply in console
 
 ** NOTE 
 ce skektch charge un fichier csv (OpenPaths) qui contient les données
 longitude & latitude.
 Cet exemple démontre juste les étapes pour charger le fichier et ensuite
 afficher quelques informations et les données qui nous intéressent. 
 Le sketch utilise une classe, FloatTable (deuxième onglet) pour récupérer,
 et trier les données. Pas besoin de savoir comment cette classe fonctionne.
 
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
  data = new FloatTable("openpaths_Alice04041212.csv");

  // ensuite on va dans un premier temps juste afficher les données
  // qui nous intéressent dans la console en bas en utilsant les méthodes
  // propres à la classe FloatTable

  int rowCount = data.getRowCount(); // récupérer le nombre de rangés
  int colCount = data.getColumnCount(); // récupérer le nombre de colonnes

  // Afficher ces infos en bas dans la console
  println("Nombre de rangés = "+rowCount);
  println("Nombre de colonnes = "+colCount);


  float latitude = data.getFloat(0, 0); // récupérer la donnée latitude
  float longitude = data.getFloat(0, 1); // récupérer la donnée longitude

  // Afficher ces infos en bas dans la console
  // ici on récupère juste les deux valeurs de la premère rangée
  println("Lat : "+latitude);
  println("Long : "+longitude);
}

