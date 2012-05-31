int mineMap[];
PFont courier;
boolean exposed[];

void setup() {
  size(400, 400);
  stroke(0);//Outline black
  fill(100, 200, 50);//Color 
  courier = loadFont("Courier-20.vlw");
  textFont(courier, 20);

  for (int i=0;i<20;i++) {
    for (int j=0;j<20;j++) {
      rect(i*20, j*20, WIDTH, WIDTH);//Creating square grid
    }
  }

  mineMap = new int[MINEFIELD];
  exposed = new boolean[400];

  for (int m=0; m<mineMap.length;m++) {
    int t = int(random(-7, 1));
    if (t==0) {
      mineMap[m]=9;//place mine
    } 
    else {
      mineMap[m]=-1;
    }
  }

  for (int i=0;i<exposed.length;i++) {
    exposed[i]=false;
  }



  for (int s = 0; s < mineMap.length; s++)

  {

    //we want to check to see that the space is a non-mine

    if (mineMap[s] < 0)

    {

      int w = 20;

      int count = 0;

      //N = (s-w)

      if ((s-w >= 0) && (mineMap[s-w]==9))

      {
        count++;
      }

      //NW = ((s-w)-1)

      if (((s-w)-1 >= 0) && ((s%20) != 0) && (mineMap[(s-w)-1]==9))

      {
        count++;
      }

      //NE = (s-w)+1

      if (((s-w)+1 >= 0) && ((s%20) != 19) && (mineMap[(s-w)+1]==9))

      {
        count++;
      }

      //W = (s-1)

      if ((s%20) != 0 && (mineMap[s-1]==9))

      {
        count++;
      }

      //E = (s+1)

      if ((s+1 < mineMap.length) && ((s%20) != 19) && (mineMap[s+1]==9))

      {
        count++;
      }

      //S = (s+w)

      if ((s+w < mineMap.length) && (mineMap[s+w]==9))

      {
        count++;
      }

      //SW = (s+w)-1

      

      //SE = (s+w)+1

      if (((s+w)+1 < mineMap.length) && ((s%20) != 19) && (mineMap[(s+w)+1]==9))

      {
        count++;
      }

      mineMap[s] = count;
    }
  }


  //for(int j=0;j<mineMap.length;j++) {
  //  text(mineMap[j], (j%20)*20, ((j/20)*20)+20);
  //}
}//end setup()



void mouseReleased() {
  //first we check to see which button was clicked
  int spot = (mouseY/20) * 20 + (mouseX/20);

  if (mouseButton == LEFT) {
    //leftclick behavior here
    if (mineMap[spot] == 9) {
      println("You hit a mine!");
    } 
    else if (mineMap[spot] == 0) {
      println("No adjacent mines!");
    } 
    else if (mineMap[spot] > 0 && mineMap[spot] < 9) {
      //display the number!
      fill(255);
      rect((mouseX/20)*20, (mouseY/20)*20, 20, 20);
      fill(0);
      text(mineMap[spot], (spot%20)*20 + 4, ((spot/20)*20+20));
      exposed[spot] = true;
    }
  }

  else if (mouseButton == RIGHT) {
    //rightclick behavior here
    println("You have flagged position " + spot);
  }
}//end mouseReleased()


void draw() {
}//end draw()

