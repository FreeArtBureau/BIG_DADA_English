/*
CLASSE POUR COMPTER NOS MOTS
RIEN À FAIRE ICI ;–)
Classe par David Bouchard
http://www.deadpixel.ca
*/

class WordCount {
  
  // LISTE DYNAMIQUE ;–)
  ArrayList words;
  
  //----------------------------------------------------
  WordCount() {
    words = new ArrayList();
  }  

  //----------------------------------------------------
  //add a whole array of words to the count
  void countWords(String[] newWords) {
    for (int i=0; i < newWords.length; i++) {
      countWord(newWords[i]);
    }  
  }

  //----------------------------------------------------
  //add a single word to the count
  void countWord(String word) {
    Word w = findWord(word);
    if (w == null) {
      // we don't have that word yet
      w = new Word(word);
      words.add(w);
      println("New word: " + w.word);
    } 
    else {
      w.count++; // increase the count
      println(w.word + ": " + w.count); // see that it works 
    }   
  }

  //----------------------------------------------------
  Word findWord(String word) {
    for (int i=0; i < words.size(); i++) {
      Word w = (Word)words.get(i);
      // if we find a match, return the Word object 
      if ( w.word.equals(word) ) return w;       
    }    
    // didn't find it
    return null;
  }
  
  //----------------------------------------------------
  // Get the n most common words
  Word[] getCommonWords(int n) {
    
    // first, sort the list so the higher count 
    // words are first
    Collections.sort(words);
    
    // grab the n first words
    Word[] result = new Word[n];
    for (int i=0; i < n; i++) {
      result[i] = (Word)words.get(i);  
    }
    
    return result;
  }
}
