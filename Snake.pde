// The class name starts with uppercase
class Snake extends GameObject
{
  int move;
  int turnL;
  int turnR;
  int[] headX = new int[2500];
  int[] headY = new int[2500];
  int snakesize = 5;

  Snake()
  {
    // Constructor chaining. Call a constructor in the super class
    super(width * 0.5f, height  * 0.5f, 50);
  }

  Snake(int move, int turnL, int turnR, float startX, float startY)
  {
    super(startX, startY, 50);
    this.move = move;
    this.turnL = turnL;
    this.turnR = turnR;
  }
  
void keyPressed()
{
    if (keyCode == move && angle!=270 && (headY[1]-8)!=headY[2])
    {
      angle=90;
    }
    if (keyCode == turnL && angle!=0 && (headX[1]-8)!=headX[2])
    {
      angle=180;
    }
    if (keyCode == turnR && angle!=180 && (headX[1]+8)!=headX[2])
    {
      angle=0;
    }
}

void travel()
{
  for(int i=snakesize;i>0;i--)
  {
    if (i!=1)
    {
      //shift all the coordinates back one array
      headX[i]=headX[i-1];
      headY[i]=headY[i-1];
    }
    else
    {
      //move the new spot for the head of the snake, which is
      //always at headX[1] and headY[1].
      switch(angle)
      {
        case 0:
        headX[1]+=8;
        break;
        case 90:
        headY[1]-=8;
        break;
        case 180:
        headX[1]-=8;
        break;
        case 270:
        headY[1]+=8;
        break;
      }
    }
  }
}
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    stroke(0);
    rotate(angle); // We want rotate to happen first, so you make the call AFTER translate
    fill(255, 0, 0);
    rect(headX[2] * 1.0f, (headY[2]-10) * 1.0f, 10, 10);
    fill(90, 50, 220);
    rect(headX[3] * 1.0f, (headY[3]-20) * 1.0f , 10, 10);
    fill(100);
    rect(headX[4] * 1.0f, (headY[4]-30) * 1.0f, 10, 10);
    popMatrix();
  
  }
}