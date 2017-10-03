/**
 * General purpose class for handling data content
 */ 
 
 
 class JSONContent {
   
   String title;
   String type;
   int lends;
   int rank;
   
   
   JSONContent(String _title, String _type, int _lends, int _rank){
    this.title = _title;
    this.type = _type;
    this.lends = _lends;
    this.rank = _rank;
   }
 }