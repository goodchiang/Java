PImage myimage;
PImage myimage2;
Alien aliens[];//Alien array
Player thePlayer;//Player object
Bullet theBullet;//Bullet object
Bomb theBomb;//Bomb object
PFont myFont;
int randomNum = 0;//Random number variable
PImage bg;//Background image

void setup() {
  frameRate(70);
  size(SCREENX, SCREENY);//Setting screen size
  PFont myFont = loadFont("data/Gisha-Bold-50.vlw");
  textFont(myFont);
  bg = loadImage("data/background.png");
  
  myimage= loadImage("invader.gif");
  myimage2= loadImage("exploding.gif");
  theBullet = null;
  thePlayer = new Player(SCREENY - MARGIN - PADDLEHEIGHT);
  aliens = new Alien[numAliens];
  /*make alien objects*/
  for (int i = 0; i<numAliens; i++)
  {
    aliens[i] = new Alien(i*40, 125, myimage, myimage2);
  }
  
  int randomNum = (int) random(numAliens);
  theBomb = new Bomb(aliens[randomNum].xPos-10,aliens[randomNum].yPos+100);
}//End of setup() function

//If the mouse is pressed, a new bullet is made
void mousePressed() {
  theBullet = new Bullet();
}
void keyPressed(){
  draw();
}


void draw() {
  background(0);
 
  for (int i = 0; i <numAliens; i++) {
    aliens[i].move();
    aliens[i].drawme();
  }

  thePlayer.move(mouseX);
  thePlayer.draw();

  if (theBullet != null) {
    theBullet.move();
    theBullet.draw();
    theBullet.collide(aliens);
  }
  theBomb.move();
  theBomb.draw();

  if (theBomb.offScreen() == true) {
    //Generate new random bomb for an alien
    
    if(aliens[randomNum].exploded != true){
      theBomb = new Bomb(aliens[randomNum].xPos+20,aliens[randomNum].yPos+15); 
    } else {
      randomNum = (int) random(numAliens);
    }
  }

  if(aliens[0].allExploded(aliens) == true) {
    text("You\n have\n won!!", SCREENX/4, SCREENY/4);
    
    loop();
  }

  if (theBomb.collidePlayer(thePlayer) == true) {
    text("Game over!\n You lose!", SCREENX/5, SCREENY/2);
    noLoop();
  }
 
}//End of main

