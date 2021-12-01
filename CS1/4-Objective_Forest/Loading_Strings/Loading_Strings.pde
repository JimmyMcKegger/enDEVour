String file_data[]; //<>//
int file_size;
String fileName = "example.txt";
boolean warning;

void setup()
{
 size(400, 300);
 background(255);
 textSize(20);
 if (loadStrings(fileName) == null)
 {
   warning = true;
 }
 else 
 {
   file_data = loadStrings("example.txt");
   file_size = file_data.length;
 }
}

void draw()
{
  if (warning)
  {
    fill(255, 0, 0);
    text("Warning: the file does not exist.", 0, 50); 
  }
  else
  {
    fill(0);
    text("File contains " + file_size + " lines.", 0, 50);
  }
}
