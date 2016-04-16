
/*
 * Class for managing float/int values
 * 
 *
 */

public class Collection {

  ArrayList <Float> COLLECTION_FLOAT;
  ArrayList <Integer> COLLECTION_INT;

  // Constructor
  public Collection() {
    COLLECTION_FLOAT = new ArrayList();
    COLLECTION_INT = new ArrayList();
  }


  // Method for adding values to a float array
  public void addFloat(float num) {
    COLLECTION_FLOAT.add(num);
  }

  // Method for adding values to an integer array
  public void addInt(int num) {
    COLLECTION_INT.add(num);
  }

  // Sum total of float values
  public float sum() {
    float sum = 0;
    for (float n : COLLECTION_FLOAT) {
      sum = sum + n;
    }
    return sum;
  }

  // Calculates an average based on float values
  public float average() {
    float ave = 0;
    float totalSum = sum();
    //println("totalSum = "+totalSum);
    ave = totalSum/COLLECTION_FLOAT.size();
    //println("Ave = "+ave);
    return ave;
  }

  // displays data in console
  public void printOutFloat() {
    for (float n : COLLECTION_FLOAT) {
      println("Floats : " + n);
    }
  }

  // displays data in console
  public void printOutInt() {
    for (float n : COLLECTION_INT) {
      println("Integers : " + n);
    }
  }

  // exports data to a text file
  public void exportFloatData() {
    for (float n : COLLECTION_FLOAT) {
      float d = n;
      output.println("Float = "+ d);
    }
  }
  // exports data to a text file
  public void exportIntData() {
    for (float n : COLLECTION_INT) {
      float d = n;
      output.println("Integers = "+ d);
    }
  }
}

