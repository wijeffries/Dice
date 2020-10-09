 void setup()
  {
    size(300,320); 
    textAlign(CENTER);
    noLoop();
  }
  void draw()
  {
    background(197);
    int total = 0;
    for (int y = 5; y < 250; y = y + 60) {
      for (int x = 5; x < 250; x = x + 60) {
        Die bruh = new Die(x,y);
        bruh.roll();
        bruh.show();
        total = total + bruh.number;
      }
    }
    text("Total: " + total, 150, 312);
  }
  void mousePressed()
  {
      redraw();
  }
  class Die //models one single dice cube
  {
      int myX, myY, number;
      int [] xPos = {25, 10, 40, 40, 10, 10, 40};
      int [] yPos = {25, 10, 40, 10, 40, 25, 25};
      boolean even;
      int total;
      
      Die(int x, int y) //constructor
      {
          myX = x;
          myY = y;
      }
      void roll()
      {
          number = (int)(Math.random() * 6 + 1);
          if (number == 1 || number == 3 || number == 5) {
            even = false;
          } else {
            even = true;
          }
          total = total + number;
      }
      void show()
      {
        fill(255);
        rect(myX,myY, 50, 50);
        if (even == false) {
          for (int i = 0; i < number; i++) {
            fill(0);
            ellipse(myX + xPos[i], myY + yPos[i], 7, 7);
        }
      } else {
        for (int i = 1; i <= number; i++) {
            fill(0);
            ellipse(myX + xPos[i], myY + yPos[i], 7, 7);
        }
      }
    }
  }
