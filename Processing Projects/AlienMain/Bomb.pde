class Bomb {
  float x2, y2;
  float dy2;
  color bombcolor = color(300, 300, 300);


  Bomb(int x, int y) {
    x2 = x;
    y2 = y;
    dy2 = 3;
  }

  void move() {
    x2 = x2;
    y2 = y2 + dy2;
  }
  void draw() {
    fill (bombcolor);
    ellipse(x2, y2--, 15, 15);
  } 
  public boolean offScreen() {
    if ((y2-15)  >= SCREENY) {
      return true;
    } 
    else {
      return false;
    }
  }

  public boolean collidePlayer(Player thePlayer) {

    if (this.y2 >= thePlayer.ypos && this.y2 <=thePlayer.ypos + 20 &&
          this.x2 >= thePlayer.xpos && this.x2 <= thePlayer.xpos + 70) {
      return true;
    } 
    else {
      return false;
    }
  } 

  void reset() {
    if (mousePressed == true) {
      x2 = SCREENX/2;
      y2 = SCREENY/2;
      dy2 = 2;
    }
  }
}

