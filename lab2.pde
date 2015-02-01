// BCB4002 Lab #1
// Zoo Data Parsing
// Tete Zhang

// Array that stores the categories of the data
String[] category = {"animal name",
                     "hair",
                     "feathers",
                     "eggs",
                     "milk",
                     "airborne",
                     "aquatic",
                     "predator",
                     "toothed",
                     "backbone",
                     "breathes",
                     "venomous",
                     "fins",
                     "legs",
                     "tail",
                     "domestic",
                     "catsize",
                     "type"};

// Array that store the data type of each category
String[] dataType = {"String",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Numeric",
                     "Boolean",
                     "Boolean",
                     "Boolean",
                     "Numeric"};

// Set the Table variables used in the function below
Table source;
Table table;
Table data;

// Main function that parses the zoo.data file and 
// create the result file zoo.csv
void setup(){
  //load the source data from the zoo.data file into a table
  source = loadTable("zoo.data", "csv");
  
  //loop through source data to replace 1 with true, 0 with false
  for (int i=0;i<source.getRowCount();i++){
    for (int j=0; j<18; j++) {
      if (dataType[j] == "Boolean" && source.getInt(i,j) == 1){
        source.setString(i,j,"true");
      }
      else if (dataType[j] == "Boolean" && source.getInt(i,j) == 0) {
        source.setString(i,j,"false");
      }
    }
  }
  //save the changes to a table
  saveTable(source, "zoo.csv");   
  
  //create a new table
  table = new Table();
  //write in the headers from the category string array
  for (int i=0; i<18; i++){
    table.addColumn(category[i]);
  }
  //load the modified data into a table
  data = loadTable("zoo.csv");
  //add all modified data to the new table
  for (int i=0;i<data.getRowCount();i++){
    TableRow newRow = data.getRow(i);
    table.addRow(newRow);
  }
  //save the final table
  saveTable(table, "zoo.csv");
}

void draw() {
}
