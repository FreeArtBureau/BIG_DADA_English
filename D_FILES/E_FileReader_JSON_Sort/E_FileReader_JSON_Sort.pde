/* -----------
 * File_Reader
 * -----------
 *
 * Sketch : D_FileReader_JSON
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
// New data type for storing & retrieving data
JSONContent[] jsonData;

void setup() {
  data = new JsonData(); 
  data.loadData("titres_livres.json", false);
  
  jsonData = data.getData();
  //int[] a = new int[jsonData.length];
  
  // Display data to console 
  for (int i=0; i<jsonData.length; i++) {
    println(jsonData[i].title);
    println(jsonData[i].type);
    println(jsonData[i].lends);
    println(jsonData[i].rank);
    println("////////////////");
  }

}

void draw() {
}


 /**
   * Sorts an array 
   * @param   a     the array to sort
   */
   void sortData(int[] a) {
  
    for (int n = 0; n < a.length-1; n++) {
      int minPos = minimumPosition (a, n);
      if(minPos != n) {
        swap(a, minPos, n);
      }
    }
  }


  /**
   * Searches smallest element in an array
   * @param   a     the array to search
   * @param   from   the posiiton from which we want to search from
   * @return       returns the smallest element in the range a[from]...a[a.length-1]
   */
  public int minimumPosition(int[] a, int from) {
  
    int minPos = from;
    for (int i = from+1; i < a.length; ++i) {

      if(a[i] < a[minPos]) {

        minPos = i;
      }
      
    }
    return minPos;

  }

  /**
   * Swaps two elements in an array
   * @param   a     the array with the two elements to swap
   * @param   i      index of one of the elemnents
   * @param   j      index of the other elemnent
   */
  public void swap(int[] a, int i, int j) {
  
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;

  }

  /**
   * Searches for an element in a collection
   * @param   a     the array to search
   * @param   v      the value to search for
   * @param   from   start index from which to execute search
   * @param   to      end index to which we execute the search
   */
  public int search(int[] a, int v, int from, int to) {
    
    if(from > to) // prevents from index overtaking to index ;—)
      return -1;

    // grabs mid index of the array. 
    // Nifty calculation, taking current from & to values
    int mid = from +(to-from)/2;

    if(v == a[mid]) // if mid is equal to the value, we return the value at mid
      return mid;

    if(v < a[mid]) { // if less than, search again but in the first part of array
      // ** NOTE : We are returning a method ! Recursion !
      return search(a, v, from, mid-1);
    } else {

      return search(a, v, mid+1, to); // otherwise search in second half !
    }

  }