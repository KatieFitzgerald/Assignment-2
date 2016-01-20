// The class name starts with uppercase
class Snake extends GameObject
{
  
  int[] headX = new int[500];
  int[] headY = new int[500];

  int snakesize = 2;

  Snake()
  {
    // Constructor chaining. Call a constructor in the super class
    super(width * 0.5f, height  * 0.5f, 50);
  }
  
  
void travel()
{
  for(int i=snakesize; i>0; i--)
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
        {
          headX[1]+=8;
        }
        break;
        case 90:
        {
          headY[1]-=8;
        }
        break;
        case 180:
        {
          headX[1]-=8;
        }
        break;
        case 270:
        {
          headY[1]+=8;
        }
        break;
      }
    }
  }
   
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP && angle!=270)
    {
      angle=90;
    }
    if (keyCode == DOWN && angle!=90)
    {
      angle=270;
    }if (keyCode == LEFT && angle!=0)
    {
      angle=180;
    }if (keyCode == RIGHT && angle!=180)
    {
      angle=0;
    }
   }
 }


 void render()
 {
  fill(0);
  rect(headX[1],headY[1],8,8);
  //...then erase the back end of the snake.
  fill(255);
  rect(headX[snakesize],headY[snakesize],8,8);
  }
}