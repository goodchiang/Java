class Bullet {
  float x,y;
  float dy;
  color bulletcolor = color(300, 0, 0);//red

  Bullet() {
    x = thePlayer.xpos + 32.5;
    y = thePlayer.ypos -15;
    dy = 6;
  }
  
  void move(){
    x = x;
    y = y - dy;
  }
  void draw() {
    fill (bulletcolor);
    rect(x, y--, 5, 20);
  }
  
  void collide(Alien aliens[]) {
    for (int i = 0; i < numAliens; i++) {
    if (this.x >= aliens[i].xPos && this.x < aliens[i].xPos + aliens[i].alienWidth() && this.y < aliens[i].yPos + aliens[i].alienHeight() && this.y >= aliens[i].yPos) {
      aliens[i].explode();
      }
    }
  }
  
}//End of class


