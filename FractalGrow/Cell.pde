
class Cell {
  
  PVector position;
  PVector center = new PVector(width/2,height/2);
  float radius;
  PVector otraPos;
  
 Cell(float x, float y, float radius, float x2, float y2){
   this.position = new PVector(x, y);
   this.radius = radius;
   this.otraPos = new PVector(x2, y2);
 }
 
 /**
   * Dibuja la celula en la pantalla
   */
 void render(){
   noStroke();
   fill(0,random(100),random(255));
   //rect(this.position.x,this.position.y,this.radius*1.4,this.radius*1.4);
    polygon(this.position.x, this.position.y, radius, 6);

   
 }


 void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
}



  
