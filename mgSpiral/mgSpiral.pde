import processing.pdf.*;
PGraphics pdf;

float prevX = width/2;
float prevY = height/2;

void setup() {
  size(1200, 1200);
  background(255);
  noFill();
  noLoop();
}

void draw() {
  drawSpiral(20, 2500);
}

void drawSpiral(float spacing, int numDots) {
  float x, y, angle;
  float angleReduce = 0.15;
  angle = 0;
  x = width/2;
  y = height/2;
  int i;

  for (i=1; i<=numDots; i=i+1) {
    //angle = radians(1) * i - angleReduce * i;
    //print(angle + "\n");
    //x = width/2 + (spacing * angle) * cos(angle) / 10;
    //y = height/2 + (spacing * angle) * sin(angle) / 10;
    while(dist(x,y,prevX,prevY) < 12){
      angle += radians(1) + radians(random(0.5));
      x = width/2 + (spacing * angle) * cos(angle) / 10;
      y = height/2 + (spacing * angle) * sin(angle) / 10;
    }
    if(dist(x,y,prevX,prevY) > 12){
      drawCircle(x, y, i%6);
      prevX = x; 
      prevY = y; 
    }
    
  }
}

void drawSpiralPDF(float spacing, int numDots) {
  float x, y, angle;
  float angleReduce = 0.15;
  angle = 0;
  x = width/2;
  y = height/2;
  int i;

  for (i=1; i<=numDots; i=i+1) {
    //angle = radians(1) * i - angleReduce * i;
    //print(angle + "\n");
    //x = width/2 + (spacing * angle) * cos(angle) / 10;
    //y = height/2 + (spacing * angle) * sin(angle) / 10;
    while(dist(x,y,prevX,prevY) < 12){
      angle += radians(1) + radians(random(0.5));
      x = width/2 + (spacing * angle) * cos(angle) / 10;
      y = height/2 + (spacing * angle) * sin(angle) / 10;
    }
    if(dist(x,y,prevX,prevY) > 12){
      drawCirclePDF(x, y, i%6);
      prevX = x; 
      prevY = y; 
    }
    
  }
}

void drawCircle(float x, float y, int noC){
   for(int i=0; i<noC; i++){
     circle(x,y,10-i*2);
   }
}

void drawCirclePDF(float x, float y, int noC){
   for(int i=0; i<noC; i++){
     pdf.circle(x,y,10-i*2);
   }
}

void mouseReleased(){
    pdf = createGraphics(1200, 1200, PDF, "output.pdf");
    pdf.beginDraw();
    pdf.background(255);
    drawSpiralPDF(20,2500); 
    pdf.dispose();
    pdf.endDraw();
    println("SAVED!");
}
