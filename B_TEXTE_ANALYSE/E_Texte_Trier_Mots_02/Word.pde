/*
Classe par David Bouchard
http://www.deadpixel.ca
*/

class Word implements Comparable {
  
  String word;
  int count;

  Word(String _word) {
    word = _word;
    count = 1;  
  }  
  
  // the Comparable function
  // compares this Word with another Object. We will assume
  // our program only compares with other Word objects
  int compareTo(Object other) {
    Word wordObj = (Word)other;
    // a negative value means smaller than
    // a positive value means greater than
    // 0 means equal
    return wordObj.count - count; 
  }
  
}
