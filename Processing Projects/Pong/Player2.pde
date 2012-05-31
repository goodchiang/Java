class Player2 {

  int xpos2; int ypos2; 
  color paddlecolor = color(100, 300);
  
  Player2(int screen_y)
  {
    xpos2=SCREENX/2;
    ypos2=screen_y;
  }
  
  void move2(Ball other) { 
    if ((xpos2 + 25) <= (other.x)) {
    xpos2 = xpos2 + 20;
  }
    if ((xpos2 + 25) > (other.x - PADDLEWIDTH)) {
    xpos2 = xpos2 - 20;
  }
 }

void draw()
  {
    fill(paddlecolor);
    rect(xpos2, ypos2, PADDLEWIDTH, PADDLEHEIGHT);
  }
}


