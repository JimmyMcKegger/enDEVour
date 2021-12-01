//Happy Classes

class Face
{
  float x;
  float y;
  float size;
  int happiness;
}

final color smileGreen = color(184, 229, 128);
final color frownRed = color(232, 151, 159);

final int numFaces = 3;
Face[] faces = new Face[numFaces];

void setup()
{
  size(700, 700);
  
  int faceCounter = 0;
  while (faceCounter < numFaces)
  {
    faces[faceCounter] = randomFaces(faceCounter);
    faceCounter++;
  }
}

void draw()
{
  background(255);
  
  for (int i = 0; i < faces.length; i++)
  {
    drawFace(faces[i]);
  }
}

Face randomFaces(int count) //<>//
{ //<>//
  Face newFace = new Face();
  
  newFace.x = random((count+1)*75,600); //<>//
  newFace.y = random((count+1)*75, 600);
  newFace.size = random(50, 200);
  newFace.happiness = int(random(2))-1;
  
  return newFace;
}

void drawFace(Face f)
{
  strokeWeight(1);
  fill(f.happiness >= 0 ? smileGreen : frownRed);
  circle(f.x, f.y, f.size);
  fill(0);
  
  // left eye
  ellipse(f.x - f.size/5, 
          f.y - f.size/5, 
          f.size/10, 
          f.size/8);
          
  // right eye
  ellipse(f.x + f.size/5, 
          f.y - f.size/5, 
          f.size/10, 
          f.size/8);
          
  // mouth
  noFill();
  strokeWeight(3);
  arc(f.x, 
      f.y + f.size/5, 
      f.size/2.5,
      f.size/5,
      f.happiness>=0?0:PI,
      f.happiness>=0?PI:TWO_PI);
}

// click to reset smileys
void mouseClicked()
{
  for (int i = 0; i < 3; i++)
  {
    faces[i] = randomFaces(i);
  }
  
}
