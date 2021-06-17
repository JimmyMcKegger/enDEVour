//looked up how to do this in active mode so that I could add the pixel troubleshooting function to the bottom

void setup() { 
  size(500, 500);
}

void draw() {
//sky
background(110, 210, 210);

//sun
strokeWeight(2);
fill(218, 222, 45);
circle(80, 80, 100);

//grass
noStroke();
fill(0, 250, 0);
rect(0, 325, 510, 200);

//cat body
stroke(0);
strokeWeight(1);
fill(220, 175, 35);
ellipse(250, 400, 150, 120);

//cat head
ellipse(197, 305, 90, 110);

//ears

//eyes

//nose

//feet
//circle();
//circle();
//circle();
//circle();

//tail
//ellipse();
}

void mouseClicked() {
  print("pixel: " + mouseX + ", " + mouseY + "\n");
}
