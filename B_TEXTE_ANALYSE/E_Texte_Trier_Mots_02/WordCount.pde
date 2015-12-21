/*
WordCount Class taken from David Bouchard.
It contains methods to count / filter / find / find common words.
Classe par David Bouchard
http://www.deadpixel.ca
*/

class WordCount {
  
  // using an Array here would be difficult, since we don't 
  // know how many unique words we'll have ahead of time 
  ArrayList words;
  
  // this list will contain common english words that we can ignore
  ArrayList stopwords;
  
  //----------------------------------------------------
  WordCount() {
    words = new ArrayList();
    
    // load the list of stopwords
    String[] lines = loadStrings("stopwords.txt");
    String allWords = join(lines, " ").toLowerCase(); 
    String[] t = splitTokens(allWords, " ");
    // put all the stopwords in an ArrayList
    // why? because we can search it easily 
    stopwords = new ArrayList();
    for (int i=0; i < t.length; i++) stopwords.add(t[i]);   
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
    if (w == null) { // we don't have that word yet
      if ( checkWord(word) ) {
        w = new Word(word);
        words.add(w);
      //println("New word: " + w.word);
      }
    } 
    else {
      w.count++; // increase the count
      //println(w.word + ": " + w.count); // see that it works 
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
    
    // first, sort the list so the higher count words are
    // first
    Collections.sort(words);
    
    // grab the n first words
    Word[] result = new Word[n];
    for (int i=0; i < n; i++) {
      result[i] = (Word)words.get(i);  
    }
    
    return result;
  }
  
  //----------------------------------------------------
  
  // make sure this word is valid 
  boolean checkWord(String word) {
    if (word.equals(lines)) return false;
    if (stopwords.contains(word)) return false; 
    return true;
  }
 
}
