import processing.pdf.*;

float noiseScale = 22;
//float noiseScaleBegin = noiseScale;
float triaScale = 50;
int layers = 63;
Tria[] trias;
float nax = 0;
float nay = 100;
float nbx = 400;
float nby = 600;
float ncx = 800;
float ncy = 1000;
float ndx = 1200;
float ndy = 1400;
float inc = .004;
float strokeW = 15;
PGraphics buffer;
PGraphics pdf;
float strkCol = 240; //starting stroke color
float strkDir = -6; //subtract from stroke color

void setup(){
  size(800,800);
  buffer = createGraphics(4000, 4000);
  noLoop();
  //beginRecord(PDF, "dwg.pdf"); 
  smooth();
  noiseDetail(2,1);
  //strokeWeight(15);
  int totalNumTrias = 0;
  for(int i = layers; i > 0; i--){
    totalNumTrias += i*4;
    //println(totalNumTrias);
  }
  totalNumTrias+=1;
  trias = new Tria[totalNumTrias];
  int layerCount = 0;
  int triaNum = 1;
  int pIn = 0;
  int[] firstLPos = {0,1}; //stores the first index position of each layer, the first being 0 and 1
  for(int i = 0; i < trias.length;i++){
    //println("i: " + i + " layerCount: " + layerCount + " triaNum: " + triaNum + " pIn: " + pIn);
    if(layerCount == 0){ //starting trias
      trias[i] = new Tria(buffer.width/2,buffer.height/2,1,2,strkCol); //width,height,position, type (1 = horiz, 2 = vertical)
      layerCount++;
      triaNum = 0;
    } else if(layerCount == 1){
          if(triaNum == 1) {
            trias[i] = new Tria(trias[0].ax,trias[0].ay,1,1,strkCol);
          } else if (triaNum == 2){
            trias[i] = new Tria(trias[0].bx,trias[0].by,2,1,strkCol);
          } else if (triaNum == 3){
            trias[i] = new Tria(trias[0].cx,trias[0].cy,3,1,strkCol);
          } else if (triaNum == 4){
            trias[i] = new Tria(trias[0].dx,trias[0].dy,4,1,strkCol);
          }
          if(triaNum >= layerCount * 4){
              layerCount++;
              triaNum = 0;
              pIn = 4;
           }    
      } else if(layerCount % 2 == 0){
            if(triaNum == 1) {
              firstLPos = append(firstLPos,i);
              trias[i] = new Tria(trias[i-pIn].ax,trias[i-pIn].ay,1,2,strkCol);
            } else if (triaNum > 1 && triaNum < layerCount + 1){
              trias[i] = new Tria(trias[i-pIn-1].bx,trias[i-pIn-1].by,trias[i-pIn].ax,trias[i-pIn].ay,1,2,strkCol);
            } else if (triaNum == layerCount + 1){
              pIn++;
              trias[i] = new Tria(trias[i-pIn].bx,trias[i-pIn].by,2,2,strkCol);
            } else if (triaNum > layerCount + 1 && triaNum < layerCount*2 + 1){
              trias[i] = new Tria(trias[i-pIn-1].cx,trias[i-pIn-1].cy,trias[i-pIn].bx,trias[i-pIn].by,2,2,strkCol);  
            } else if (triaNum == layerCount*2 + 1){
              pIn++;
              trias[i] = new Tria(trias[i-pIn].cx,trias[i-pIn].cy,3,2,strkCol);
            } else if(triaNum > layerCount*2 + 1 && triaNum < layerCount*3 + 1){
              trias[i] = new Tria(trias[i-pIn-1].dx,trias[i-pIn-1].dy,trias[i-pIn].cx,trias[i-pIn].cy,3,2,strkCol);  
            } else if (triaNum == layerCount*3 + 1){
              pIn++;
              trias[i] = new Tria(trias[i-pIn].dx,trias[i-pIn].dy,4,2,strkCol);
            } else if (triaNum > layerCount*3 + 1 && triaNum < layerCount*4){
              trias[i] = new Tria(trias[i-pIn-1].ax,trias[i-pIn-1].ay,trias[i-pIn].dx,trias[i-pIn].dy,4,2,strkCol);
            } else if(triaNum == layerCount*4){
               int indexHelp = 0;
               for(int j = layerCount-2; j >= 0; j--){
                indexHelp += j*4 + 1;
                //println("layer: " + layerCount + " index: " + indexHelp);
                }
              trias[i] = new Tria(trias[i-pIn-1].ax,trias[i-pIn-1].ay,trias[firstLPos[layerCount-1]].dx,trias[firstLPos[layerCount-1]].dy,4,2,strkCol); 
             //println("PIN: " + pIn); 
            }
           
            if(triaNum >= layerCount * 4){
              layerCount++;
              triaNum = 0;
              pIn++;
              strkColor();
            }   
        } else {
            if(triaNum == 1) {
              firstLPos = append(firstLPos,i);
              trias[i] = new Tria(trias[i-pIn].ax,trias[i-pIn].ay,1,1,strkCol);
            } else if (triaNum > 1 && triaNum < layerCount + 1){
              trias[i] = new Tria(trias[i-pIn-1].bx,trias[i-pIn-1].by,trias[i-pIn].ax,trias[i-pIn].ay,1,1,strkCol);
            } else if (triaNum == layerCount + 1){
              pIn++;
              trias[i] = new Tria(trias[i-pIn].bx,trias[i-pIn].by,2,1,strkCol);
            } else if (triaNum > layerCount + 1 && triaNum < layerCount*2 + 1){
              trias[i] = new Tria(trias[i-pIn-1].cx,trias[i-pIn-1].cy,trias[i-pIn].bx,trias[i-pIn].by,2,1,strkCol);  
            } else if (triaNum == layerCount*2 + 1){
              pIn++;
              trias[i] = new Tria(trias[i-pIn].cx,trias[i-pIn].cy,3,1,strkCol);
            } else if(triaNum > layerCount*2 + 1 && triaNum < layerCount*3 + 1){
              trias[i] = new Tria(trias[i-pIn-1].dx,trias[i-pIn-1].dy,trias[i-pIn].cx,trias[i-pIn].cy,3,1,strkCol);  
            } else if (triaNum == layerCount*3 + 1){
              pIn++;
              trias[i] = new Tria(trias[i-pIn].dx,trias[i-pIn].dy,4,1,strkCol);
            } else if (triaNum > layerCount*3 + 1 && triaNum < layerCount*4){
              trias[i] = new Tria(trias[i-pIn-1].ax,trias[i-pIn-1].ay,trias[i-pIn].dx,trias[i-pIn].dy,4,1,strkCol);
            } else if (triaNum == layerCount*4) {
               int indexHelp = 0;
               for(int j = layerCount-2; j > 0; j--){
                indexHelp += j*4 + 1;
                //println("layer: " + layerCount + " index: " + indexHelp);
                }
              trias[i] = new Tria(trias[i-pIn-1].ax,trias[i-pIn-1].ay,trias[firstLPos[layerCount-1]].dx,trias[firstLPos[layerCount-1]].dy,4,1,strkCol); 
             //println("PIN: " + pIn); 
            }
           
            if(triaNum >= layerCount * 4){
              layerCount++;
              triaNum = 0;
              pIn++;
              if(noiseScale > 5){
                noiseScale-=.5;
              }
              strkColor();
             }   
        }
    
    triaNum++;
    nax += random(inc);
    nay += random(inc);
    nbx += random(inc);
    nby += random(inc);
    ncx += random(inc);
    ncy += random(inc);
    ndx += random(inc);
    ndy += random(inc);

    
  }
}
void draw(){
  buffer.beginDraw();
  buffer.background(255);
  buffer.strokeWeight(strokeW);
  buffer.pushMatrix();
  //buffer.translate(buffer.width/2,buffer.height/2);
  //buffer.rotate(radians(0));
  for(int i = 0; i < trias.length;i++){
    /*if(i > trias.length/2){
      buffer.stroke(i/5);
    } else { buffer.stroke(255-i/5);
    }*/
    trias[i].display();
  }
  buffer.popMatrix();
  buffer.endDraw();
  image(buffer,0,0,width,height);
}

void mouseReleased(){
    pdf = createGraphics(4000, 4000, PDF, "output.pdf");
    pdf.beginDraw(); 
    pdf.background(255);
    pdf.strokeWeight(strokeW);
    pdf.pushMatrix();
    for(int i = 0; i < trias.length;i++){
      trias[i].PDFDisplay();
    }
    pdf.popMatrix();
    pdf.dispose();
    pdf.endDraw();   
    println("SAVED!");
}

void strkColor(){
    strkCol += strkDir;
    if(strkCol < 110 ){
      strkDir=10;
    } 
}

