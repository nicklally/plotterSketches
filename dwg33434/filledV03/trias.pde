class Tria{
  float ax,ay,bx,by,cx,cy,dx,dy,strk;
  int type;
  //type 1 = horizontal type 2 = vertical
  Tria(float _x, float _y, int _pos, int _type, float _strk) { //1 = top, 2 = right, 3 = bottom, 4 = left
    type = _type;
    strk = _strk; //stroke color
    if(_type == 1){
      if(_pos == 1){
        ax = _x + noise(nax)*noiseScale - noiseScale/2;
        ay = _y + -(1*triaScale + noise(nay)*noiseScale - noiseScale/2);
        bx = _x + sqrt(.75)*triaScale + noise(nbx)*noiseScale - noiseScale/2;
        by = _y + -(.5*triaScale + noise(nby)*noiseScale - noiseScale/2); 
        cx = _x;
        cy = _y;
        dx = _x + -(sqrt(.75)*triaScale + noise(ndx)*noiseScale - noiseScale/2);
        dy = _y + -(.5*triaScale + noise(ndy)*noiseScale - noiseScale/2); 
      }
      if(_pos == 2){
        ax = _x + sqrt(.75)*triaScale + noise(nax)*noiseScale - noiseScale/2;
        ay = _y -(.5*triaScale + noise(nay)*noiseScale - noiseScale/2);
        bx = _x + 2*sqrt(.75)*triaScale + noise(nbx)*noiseScale - noiseScale/2;
        by = _y + noise(nby)*noiseScale - noiseScale/2;
        cx = _x + sqrt(.75)*triaScale + noise(ncx)*noiseScale - noiseScale/2;
        cy = _y + .5*triaScale + noise(ncy)*noiseScale - noiseScale/2;
        dx = _x;
        dy = _y;
      }
      if(_pos == 3){
        ax = _x;
        ay = _y;
        bx = _x + sqrt(.75)*triaScale + noise(nbx)*noiseScale - noiseScale/2;
        by = _y + .5*triaScale + noise(nby)*noiseScale - noiseScale/2;  
        cx = _x + noise(ncx)*noiseScale - noiseScale/2;
        cy = _y + 1*triaScale + noise(ncy)*noiseScale - noiseScale/2;
        dx = _x + -(sqrt(.75)*triaScale + noise(ndx)*noiseScale - noiseScale/2);
        dy = _y + .5*triaScale + noise(ndy)*noiseScale - noiseScale/2; 
      }
      if(_pos == 4){
        ax = _x + -(sqrt(.75)*triaScale + noise(nax)*noiseScale - noiseScale/2);
        ay = _y -(.5*triaScale + noise(nay)*noiseScale - noiseScale/2);
        bx = _x;
        by = _y;
        cx = _x + -(sqrt(.75)*triaScale + noise(ncx)*noiseScale - noiseScale/2);
        cy = _y + .5*triaScale + noise(ncy)*noiseScale - noiseScale/2;
        dx = _x + -(2*sqrt(.75)*triaScale + noise(ndx)*noiseScale - noiseScale/2);
        dy = _y + noise(ndy)*noiseScale - noiseScale/2;
      }  
    }
    if(_type == 2){
        if(_pos == 1){
        ax = _x + noise(nax)*noiseScale - noiseScale/2;
        ay = _y + -(2*sqrt(.75)*triaScale + noise(nay)*noiseScale - noiseScale/2);
        bx = _x + .5*triaScale + noise(nby)*noiseScale - noiseScale/2;
        by = _y + -(sqrt(.75)*triaScale + noise(nby)*noiseScale - noiseScale/2); 
        cx = _x;
        cy = _y;
        dx = _x + -(.5*triaScale + noise(ndy)*noiseScale - noiseScale/2);
        dy = _y + -(sqrt(.75)*triaScale + noise(ndy)*noiseScale - noiseScale/2); 
      }
      if(_pos == 2){
        ax = _x + .5*triaScale + noise(nax)*noiseScale - noiseScale/2;
        ay = _y -(sqrt(.75)*triaScale + noise(nay)*noiseScale - noiseScale/2);
        bx = _x + 1*triaScale + noise(nbx)*noiseScale - noiseScale/2;
        by = _y + noise(nby)*noiseScale - noiseScale/2;
        cx = _x + .5*triaScale + noise(ncx)*noiseScale - noiseScale/2;
        cy = _y + sqrt(.75)*triaScale + noise(ncy)*noiseScale - noiseScale/2;
        dx = _x;
        dy = _y;
      }
      if(_pos == 3){
        ax = _x;
        ay = _y;
        bx = _x + .5*triaScale + noise(nbx)*noiseScale - noiseScale/2;
        by = _y + sqrt(.75)*triaScale + noise(nby)*noiseScale - noiseScale/2; 
        cx = _x + noise(ncx)*noiseScale - noiseScale/2;
        cy = _y + sqrt(.75)*2*triaScale + noise(ncy)*noiseScale - noiseScale/2;
        dx = _x + -(.5*triaScale + noise(ndx)*noiseScale - noiseScale/2);
        dy = _y + sqrt(.75)*triaScale + noise(ndy)*noiseScale - noiseScale/2; 
      }
      if(_pos == 4){
        ax = _x + -(.5*triaScale + noise(nax)*noiseScale - noiseScale/2);
        ay = _y -(sqrt(.75)*triaScale + noise(nay)*noiseScale - noiseScale/2);
        bx = _x;
        by = _y;
        cx = _x + -(.5*triaScale + noise(ncx)*noiseScale - noiseScale/2);
        cy = _y + sqrt(.75)*triaScale + noise(ncy)*noiseScale - noiseScale/2;
        dx = _x + -(1*triaScale + noise(ndx)*noiseScale - noiseScale/2);
        dy = _y + noise(ndy)*noiseScale - noiseScale/2;
      } 
   }
  }
  
  Tria(float _x, float _y, float _x2, float _y2, int _pos, int _type, float _strk) { //1 = top, 2 = right, 3 = bottom, 4 = left
   type = _type; 
   strk = _strk; 
   if(_type == 1){
      if(_pos == 1){ // _x,_y = left, _x2,_y2 = bottom
        ax = _x + sqrt(.75)*triaScale + noise(nax)*noiseScale - noiseScale/2;
        ay = _y + -(.5*triaScale + noise(nay)*noiseScale - noiseScale/2);
        bx = _x2 + sqrt(.75)*triaScale + noise(nbx)*noiseScale - noiseScale/2;
        by = _y + noise(nby)*noiseScale - noiseScale/2; 
        cx = _x2;
        cy = _y2;
        dx = _x;
        dy = _y; 
      }
      if(_pos == 2){// _x,_y = top, _x2,_y2 = left
        ax = _x;
        ay = _y;
        bx = _x + sqrt(.75)*triaScale + noise(nbx)*noiseScale - noiseScale/2;
        by = _y + .5*triaScale + noise(nby)*noiseScale - noiseScale/2;
        cx = _x2 + sqrt(.75)*triaScale + noise(ncx)*noiseScale - noiseScale/2;
        cy = _y + 1*triaScale + noise(ncy)*noiseScale - noiseScale/2;
        dx = _x2;
        dy = _y2;
      }
      if(_pos == 3){// _x,_y = right, _x2,_y2 = top
        ax = _x2;
        ay = _y2;
        bx = _x;
        by = _y; 
        cx = _x + -(sqrt(.75)*triaScale + noise(ncx)*noiseScale - noiseScale/2);
        cy = _y + .5*triaScale + noise(ncy)*noiseScale - noiseScale/2;
        dx = _x2 + -(sqrt(.75)*triaScale + noise(ndx)*noiseScale - noiseScale/2);
        dy = _y2 + .5*triaScale + noise(ndy)*noiseScale - noiseScale/2; 
      }
      if(_pos == 4){// _x,_y = bottom, _x2,_y2 = right
        ax = _x2 + -(sqrt(.75)*triaScale + noise(nax)*noiseScale - noiseScale/2);
        ay = _y2 -(.5*triaScale + noise(nay)*noiseScale - noiseScale/2);
        bx = _x2;
        by = _y2;
        cx = _x;
        cy = _y;
        dx = _x + -(sqrt(.75)*triaScale + noise(ndx)*noiseScale - noiseScale/2);
        dy = _y + -(.5*triaScale + noise(ndy)*noiseScale - noiseScale/2);
       }  
     }
     if(_type == 2){
       if(_pos == 1){ // _x,_y = left, _x2,_y2 = bottom
        ax = _x + .5*triaScale + noise(nax)*noiseScale - noiseScale/2;
        ay = _y + -(sqrt(.75)*triaScale + noise(nay)*noiseScale - noiseScale/2);
        bx = _x2 + .5*triaScale + noise(nbx)*noiseScale - noiseScale/2;
        by = _y2 + -(sqrt(.75)*triaScale+noise(nby)*noiseScale - noiseScale/2); 
        cx = _x2;
        cy = _y2;
        dx = _x;
        dy = _y; 
      }
      if(_pos == 2){// _x,_y = top, _x2,_y2 = left
        ax = _x;
        ay = _y;
        bx = _x + .5*triaScale + noise(nbx)*noiseScale - noiseScale/2;
        by = _y + sqrt(.75)*triaScale + noise(nby)*noiseScale - noiseScale/2;
        cx = _x2 + .5*triaScale + noise(ncx)*noiseScale - noiseScale/2;
        cy = _y2 + sqrt(.75)*triaScale + noise(ncy)*noiseScale - noiseScale/2;
        dx = _x2;
        dy = _y2;
      }
      if(_pos == 3){// _x,_y = right, _x2,_y2 = top
        ax = _x2;
        ay = _y2;
        bx = _x;
        by = _y; 
        cx = _x + -(.5*triaScale + noise(ncx)*noiseScale - noiseScale/2);
        cy = _y + sqrt(.75)*triaScale + noise(ncy)*noiseScale - noiseScale/2;
        dx = _x2 + -(.5*triaScale + noise(ndx)*noiseScale - noiseScale/2);
        dy = _y2 + sqrt(.75)*triaScale + noise(ndy)*noiseScale - noiseScale/2; 
      }
      if(_pos == 4){// _x,_y = bottom, _x2,_y2 = right
        ax = _x2 + -(.5*triaScale + noise(nax)*noiseScale - noiseScale/2);
        ay = _y2 -(sqrt(.75)*triaScale + noise(nay)*noiseScale - noiseScale/2);
        bx = _x2;
        by = _y2;
        cx = _x;
        cy = _y;
        dx = _x + -(.5*triaScale + noise(ndx)*noiseScale - noiseScale/2);
        dy = _y + -(sqrt(.75)*triaScale + noise(ndy)*noiseScale - noiseScale/2);
    }  
   }
  }
  void display(){
   //buffer.stroke(strk); 
   //buffer.noStroke();
   buffer.strokeWeight(5);
   if(type == 1){
     //buffer.fill(255,130,0);
      buffer.fill(0);
      buffer.beginShape();
        buffer.vertex(ax,ay);
        buffer.vertex(bx,by);
        buffer.vertex(cx,cy);
        buffer.vertex(dx,dy);
        buffer.vertex(ax,ay);
      buffer.endShape();  
    } else if(type == 2){
      buffer.fill(0);
      buffer.beginShape();
        buffer.vertex(ax,ay);
        buffer.vertex(bx,by);
        buffer.vertex(cx,cy);
        buffer.vertex(dx,dy);
        buffer.vertex(ax,ay);
      buffer.endShape();  
    }
  }
  void PDFDisplay(){
   //buffer.stroke(strk); 
   //pdf.noStroke();
   pdf.strokeWeight(5);
   if(type == 1){
     //buffer.fill(255,130,0);
      pdf.fill(0);
      pdf.beginShape();
        pdf.vertex(ax,ay);
        pdf.vertex(bx,by);
        pdf.vertex(cx,cy);
        pdf.vertex(dx,dy);
        pdf.vertex(ax,ay);
      pdf.endShape();  
    } else if(type == 2){
      pdf.fill(0);
      pdf.beginShape();
        pdf.vertex(ax,ay);
        pdf.vertex(bx,by);
        pdf.vertex(cx,cy);
        pdf.vertex(dx,dy);
        pdf.vertex(ax,ay);
      pdf.endShape();  
    }
  }
}
