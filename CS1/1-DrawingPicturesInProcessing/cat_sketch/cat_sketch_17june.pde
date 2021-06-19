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
rect(0, 330, 510, 200);

//cat body
stroke(0);
strokeWeight(1);
fill(220, 175, 35);
ellipse(250, 400, 150, 120);

//cat head
ellipse(197, 305, 90, 110);

//feet
circle(200, 450, 25);
circle(225, 458, 25);
circle(279, 458, 25);
circle(304, 450, 25);

//tail
ellipse(312, 350, 10, 40);

//ears
triangle(177, 242, 173, 256, 185, 256);
triangle(215, 242, 207, 256, 219, 256);

//eyes
fill(0);
ellipse(180, 276, 5, 10);
ellipse(208, 277, 5, 10);

//nose
ellipse(197, 320, 10, 15);


}

void mouseClicked() {
  print("pixel: " + mouseX + ", " + mouseY + "\n");
}
