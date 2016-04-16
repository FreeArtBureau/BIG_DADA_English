/*
 * ----------------------------
 * COLLECTING & EXPORTING DATA
 * ----------------------------
 *
 * DATA_COLLECTION_CLASS
 *
 * MW_04.2016

 *
 * end
 */

/////////////////////////// GLOBALS //////////////////////////

import java.util.*;
PrintWriter output; // Creates an output object
Collection FLOAT_VALUES;
Collection INT_VALUES;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(200, 100);
  background(255);
  smooth();
  output = createWriter("Datas" + day() + month() + hour() + minute() +".txt");
  
  FLOAT_VALUES = new Collection();
  INT_VALUES = new Collection();
  
  for (int i=0; i<666; i++) {
    float randNum = random(1000.0);
    FLOAT_VALUES.addFloat(randNum);
  }
  
  for (int i=0; i<666; i++) {
    int randNum = (int)random(1000.0);
    INT_VALUES.addInt(randNum);
  }
  FLOAT_VALUES.printOutFloat();
  INT_VALUES.printOutInt();

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  
  text("Press 'e' to export", 10, height-50);
}

/////////////////////////// FUNCTIONS ///////////////////////
void keyPressed() {
  if (key =='e') {
    FLOAT_VALUES.exportFloatData();
    INT_VALUES.exportIntData();
    output.flush(); // Write any remaining data to the file
    output.close(); // Close file
    exit(); //Finish writing the file
  }
}
