import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class C_DataFileClass_Parse_CSV_02 extends PApplet {

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
 ce skektch est quasiment le m\u00eame que le premier, sauf qu'on r\u00e9cup\u00e8re
 maintenant toutes les donn\u00e9es de notre fichier et on les affiche dans
 la console en bas

 */
/////////////////////////// GLOBALS ////////////////////////////
// Voici un objet qui va g\u00e9rer nos donn\u00e9es
FloatTable data;

/////////////////////////// SETUP ////////////////////////////

public void setup() {
  
  background(0);
  
  noStroke();
  // J'ai cr\u00e9e cette fonction en bas
  initData(); // data initialisation function
}

/////////////////////////// DRAW ////////////////////////////
public void draw() {
  //background(0);
}
/////////////////////////////////////////////////////////////////////////////////
public void initData() {
  // Charger le fichier csv qui se trouve dans le dossier data
  data = new FloatTable("openpaths_01.csv");

  // ensuite on va dans un premier temps juste afficher les donn\u00e9es
  // qui nous int\u00e9ressent dans la console en bas en utilsant les m\u00e9thodes
  // propres \u00e0 la classe FloatTable

    int rowCount = data.getRowCount(); // r\u00e9cup\u00e9rer le nombre de rang\u00e9s
  int colCount = data.getColumnCount(); // r\u00e9cup\u00e9rer le nombre de colonnes

  // Afficher ces infos en bas dans la console
  println("Nombre de rang\u00e9s = "+rowCount);
  println("Nombre de colonnes = "+colCount);


  // Parcourir les rang\u00e9es pour r\u00e9cup\u00e9rer toutes les donn\u00e9es de la premi\u00e8re
  // et la deuxi\u00e8me colonne
  for (int row = 0; row<rowCount; row++) {
    //  r\u00e9cup\u00e9rer la donn\u00e9e latitude
    float latitude = data.getFloat(row, 0);
    println("Lat : "+latitude);

    // r\u00e9cup\u00e9rer la donn\u00e9e longitude
    float longitude = data.getFloat(row, 1);
    println("Long : "+longitude);
  }
}

/////////////////////////////////// RIEN \u00c0 FAIRE ICI

/* 
Data sorting class :

//first line of the file should be the column headers
// first column should be the row titles
// all other values are expected to be floats
// getFloat(0, 0) returns the first data value in the upper lefthand corner
// files should be saved as "text, tab-delimited"
// empty rows are ignored
 extra whitespace is ignored
*/

class FloatTable {
  int rowCount;
  int columnCount;
  float[][] data;
  String[] rowNames;
  String[] columnNames;


  FloatTable(String filename) {
    String[] rows = loadStrings(filename);

    String[] columns = split(rows[0], ',');
    columnNames = subset(columns, 1); // upper-left corner ignored
    scrubQuotes(columnNames);
    columnCount = columnNames.length;

    rowNames = new String[rows.length-1];
    data = new float[rows.length-1][];

    // start reading at row 1, because the first row was only the column headers
    for (int i = 1; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
      }
      /*
      if (rows[i].startsWith("#")) {
        continue;  // skip comment lines
      }
      */

      // split the row on the tabs
      String[] pieces = split(rows[i], ',');
      scrubQuotes(pieces);

      // copy row title
      rowNames[rowCount] = pieces[0];
      // copy data into the table starting at pieces[1]
      data[rowCount] = parseFloat(subset(pieces, 0));

      // increment the number of valid rows found so far
      rowCount++;
    }
    // resize the 'data' array as necessary
    data = (float[][]) subset(data, 0, rowCount);
  }

  //////////////////////////////////////// METHODS 
  public void scrubQuotes(String[] array) {
    for (int i = 0; i < array.length; i++) {
      if (array[i].length() > 2) {
        // remove quotes at start and end, if present
        if (array[i].startsWith("\"") && array[i].endsWith("\"")) {
          array[i] = array[i].substring(1, array[i].length() - 1);
        }
      }
      // make double quotes into single quotes
      array[i] = array[i].replaceAll("\"\"", "\"");
    }
  }


  public int getRowCount() {
    return rowCount;
  }


  public String getRowName(int rowIndex) {
    return rowNames[rowIndex];
  }


  public String[] getRowNames() {
    return rowNames;
  }


  // Find a row by its name, returns -1 if no row found. 
  // This will return the index of the first row with this name.
  // A more efficient version of this function would put row names
  // into a Hashtable (or HashMap) that would map to an integer for the row.
  public int getRowIndex(String name) {
    for (int i = 0; i < rowCount; i++) {
      if (rowNames[i].equals(name)) {
        return i;
      }
    }
    //println("No row named '" + name + "' was found");
    return -1;
  }


  // technically, this only returns the number of columns 
  // in the very first row (which will be most accurate)
  public int getColumnCount() {
    return columnCount;
  }


  public String getColumnName(int colIndex) {
    return columnNames[colIndex];
  }


  public String[] getColumnNames() {
    return columnNames;
  }


  public float getFloat(int rowIndex, int col) {
    // Remove the 'training wheels' section for greater efficiency
    // It's included here to provide more useful error messages

    // begin training wheels
    if ((rowIndex < 0) || (rowIndex >= data.length)) {
      throw new RuntimeException("There is no row " + rowIndex);
    }
    if ((col < 0) || (col >= data[rowIndex].length)) {
      throw new RuntimeException("Row " + rowIndex + " does not have a column " + col);
    }
    // end training wheels

    return data[rowIndex][col];
  }


  public boolean isValid(int row, int col) {
    if (row < 0) return false;
    if (row >= rowCount) return false;
    //if (col >= columnCount) return false;
    if (col >= data[row].length) return false;
    if (col < 0) return false;
    return !Float.isNaN(data[row][col]);
  }


  public float getColumnMin(int col) {
    float m = Float.MAX_VALUE;
    for (int row = 0; row < rowCount; row++) {
      if (isValid(row, col)) {
        if (data[row][col] < m) {
          m = data[row][col];
        }
      }
    }
    return m;
  }


  public float getColumnMax(int col) {
    float m = -Float.MAX_VALUE;
    for (int row = 0; row < rowCount; row++) {
      if (isValid(row, col)) {
        if (data[row][col] > m) {
          m = data[row][col];
        }
      }
    }
    return m;
  }


  public float getRowMin(int row) {
    float m = Float.MAX_VALUE;
    for (int col = 0; col < columnCount; col++) {
      if (isValid(row, col)) {
        if (data[row][col] < m) {
          m = data[row][col];
        }
      }
    }
    return m;
  } 


  public float getRowMax(int row) {
    float m = -Float.MAX_VALUE;
    for (int col = 0; col < columnCount; col++) {
      if (isValid(row, col)) {
        if (data[row][col] > m) {
          m = data[row][col];
        }
      }
    }
    return m;
  }


  public float getTableMin() {
    float m = Float.MAX_VALUE;
    for (int row = 0; row < rowCount; row++) {
      for (int col = 0; col < columnCount; col++) {
        if (isValid(row, col)) {
          if (data[row][col] < m) {
            m = data[row][col];
          }
        }
      }
    }
    return m;
  }


  public float getTableMax() {
    float m = -Float.MAX_VALUE;
    for (int row = 0; row < rowCount; row++) {
      for (int col = 0; col < columnCount; col++) {
        if (isValid(row, col)) {
          if (data[row][col] > m) {
            m = data[row][col];
          }
        }
      }
    }
    return m;
  }
}

  public void settings() {  size(300, 300);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "C_DataFileClass_Parse_CSV_02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
