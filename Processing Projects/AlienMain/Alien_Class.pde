class Alien {
  PImage img;//stores invader image
  PImage img2;//stores explosion image
  int xPos;//refers to x-position of alien
  int yPos;//refers to y-position of alien
  boolean dir; //true is right direction and false is left direction
  boolean exploded;// true is exploded, false isn't
  int counter1 = 0;
  int alienCount = 0;
  /* Constructor is passed the x and y position where the alien is to
   be created, plus the image to be used to draw the alien */

  Alien(int xpos, int ypos, PImage alienImage, PImage explodeImage){
    /* set up the new alien object */
    xPos = xpos;
    yPos = ypos;
    img = alienImage; 
    img2 = explodeImage;
    dir = true;
    exploded = false;
  }

   public int alienWidth() {
     return img.width;
   }
   public int  alienHeight() {
     return img.height; 
   }
   
  void move() {
    //when direction is right, and it reaches the edge, shift down a y-position, and reverse direction
    if(dir == true)
    {
      if(xPos >= SCREENX){
        yPos+=50;
        dir=false;
      }
      else{
        xPos++;
      }
    }
    //when direction is left, and it reaches the edge, shift down a y-position, and reverse direction
    if (dir == false)
    {
      if(xPos<=0){
        yPos+=50;
        dir=true;
      }
      else{
        xPos--;
      }
    }
  }
  
  void alienCount(){
     if(exploded == true){
        alienCount++;
     } 
     println("Aliens exploded " + alienCount);
  }
 
  void drawme(){
    //img = invader, img2 = explosion image
    // shows what happens if explosion occurs
    if(exploded == false){
      //show normal image
      image(img, xPos, yPos);
    }else if (counter1 < 10) {
      //display explosion
      image(img2, xPos, yPos);
      counter1++;
    }   
  }
  
  
  public boolean allExploded(Alien aliens[]) {
     for(int i=0;i<numAliens;i++){
        if(aliens[i].exploded == false){
           return false; 
        } 
     } return true;
  }
 
  void explode(){
   exploded = true;
   }
   
  }//End of alien class
