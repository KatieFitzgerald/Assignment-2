// The class name starts with uppercase
class Snake extends GameObject
{
  //using array instead of arraylist, easier to visualise 
  int[] headX = new int[500];
  int[] headY = new int[500];

  int snakesize = 2;
  int i;

  Snake()
  {

  }
  
  
void update()
{
  for(i = snakesize; i >= 0; i--)
  {
    if (i!=1)
    {
      //just slime, no snake
      //shift all the coordinates back one array
      headX[i] = headX[i-1];
      headY[i] = headY[i-1];
    }
    else
    {
      
      switch(angle)
      {
        case 0:
        {
          headX[1] += 8;
        }
        break;
        case 90:
        {
          headY[1] -= 8;
        }
        break;
        case 180:
        {
          headX[1] -= 8;
        }
        break;
        case 270:
        {
          headY[1] += 8;
        }
        break;
      }
    }
  }
   
}

 void render()
 {
  fill(0);
  rect(headX[1],headY[1],8,8);
  //create trail of where the snake has gone (leave in?)
  fill(255);
  rect(headX[snakesize],headY[snakesize],8,8);
  }


void keyPressed()
{
  if (key == CODED)
  {
    //checking angle to make sure snake can only go forward
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
 
}