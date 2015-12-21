/*
PETITE MÉTHODE POUR COMPTER UNE CHAÎNE DE CARACTÈRES
 
 */

void countCharacters() {
  
  // On parcourt chaque caractères de notre texte
  // notez bien joinedText.length(); 
  for (int i = 0; i < joinedText.length(); i++) {
    // Cette variable va stocker chaque lettre/caractère
    char c = joinedText.charAt(i);
    String s = str(c);
    s = s.toUpperCase();
    char uppercaseChar = s.charAt(0);

    // Ensuite on récupère l'emplacement du caractère au sein de notre chaîne de caractère (alphabet)
    index = alphabet.indexOf(uppercaseChar);

    //Lorsque ce caractère est détecté  on incrémente notre compteur
    if (index >= 0) counters[index]++;
    String tx = str(uppercaseChar);
    print(tx);
  }
}

