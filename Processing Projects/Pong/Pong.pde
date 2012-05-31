/* Declare a player and a ball*/
Player thePlayer;
Ball theBall;
Player2 theBot;
  
void setup(){
  frameRate(65);
  size(SCREENX, SCREENY);
  fill(0);
  /* create a new player object at the appropriate place on the screen */
  thePlayer = new Player(SCREENY - MARGIN - PADDLEHEIGHT);
 
  /* create a new ball object */
  theBall = new Ball();
  /*create a bot player and place him at appropriate position*/
  theBot= new Player2(MARGIN);
  noStroke(); // Don't draw a line around shapes
  ellipseMode(CENTER_RADIUS); // sets the drawing mode for the ellipse method - draw the circle
}

void draw() {
  background(250);
  thePlayer.move(mouseX);
  theBall.move();
  theBot.move2(theBall);
  theBall.collide(thePlayer);
  theBall.collide2(theBot);
  thePlayer.draw();
  theBall.draw();
  theBot.draw();
  theBall.reset();
}
