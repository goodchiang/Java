class Ball {
  float x, y;
  float dx, dy;
  final int radius = 8;
  color ballcolor = color(300, 100, 00);

  Ball() {
    /* Initialise the variables for the ball */
    x = random(SCREENX/2 + SCREENX/4);
    y = random(SCREENY/2 + SCREENY/4);
    dx = random(1, 2);
    dy = random(1, 2);
  }
  void move() {
    x = x + dx;
    y = y + dy;
  }
  void draw() {
    fill(ballcolor);
    ellipse(int(x), int(y), radius, radius);
  }

  void collide(Player other) {

    if (x + radius >= SCREENX || x - radius <= SCREENX - SCREENX) {
      dx = -dx;
    }

    if (( x<0) || (x > 320)) {
      dx = dx*(-1);
    }
    /* check the ball has collided with the player - 
     the bottom of the ball is below the top of the bat AND
     the top of the ball is not past the bottom of the bat AND
     the ball is past the left hand side of the bat AND
     the ball is not past the right hand side of the bat
     - if it has collided, reverse the y direction
     */
    if ((y + radius >= other.ypos) &&
      y - radius < other.ypos + PADDLEHEIGHT &&
      x >= other.xpos &&
      x <= other.xpos + PADDLEWIDTH) {
      dy= dy*(-1);
    }
  }
  // If the ball is touching top or bottom edge, reverse direction
  void collide2 (Player2 other) {
    if ((y-5) <= (other.ypos2 + PADDLEHEIGHT) && ( x > other.xpos2) && (x < (other.xpos2 + PADDLEWIDTH))) {
      dy = dy *(-1);
    }
  }

  /*reset method*/
  void reset() {
    if (mousePressed == true) {
      x = random(SCREENX/2, SCREENX/4);
      y = random(SCREENY/2, SCREENY/4);
      dx = random(1, 2);
      dy = random(1, 2);
    }
  }
}

