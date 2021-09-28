// bar graph

size(600, 500);
background(255);

final int totalBars = 20;
final int xAxis = 25;
final int yAxis = height - 25;

final int barWidth = 10;
final color barColor = color(245, 10, 10);
int[] barHeight = new int[totalBars];

int barCounter = 0;
while (barCounter < totalBars)
{
  barHeight[barCounter] = (int)random(height - yAxis, yAxis);
  barCounter++;
}

float spacing = (width-2*xAxis)/totalBars;

strokeWeight(3);
line(xAxis, yAxis, xAxis, height - yAxis);
line(xAxis, yAxis, width - xAxis/2, yAxis);

barCounter = 0;
strokeWeight(1);
fill(barColor);
while (barCounter < totalBars)
{
  float barX = xAxis + spacing*(barCounter+1);
  rect(barX, barHeight[barCounter], barWidth, yAxis-barHeight[barCounter]); //<>//
  barCounter++;
}
