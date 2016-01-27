// The class name starts with uppercase
class Snake extends GameObject
{
  Snake()
  {

  }
  
  
void update()
{
  for(i = snakesize; i > 0; i--)
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
        //moving right
        case 0:
        {
          headX[i] += 10;
        }
        break;
        //moving up
        case 90:
        {
          headY[i] -= 10;
        }
        break;
        //moving left
        case 180:
        {
          headX[i] -= 10;
        }
        break;
        //moving down
        case 270:
        {
          headY[i] += 10;
        }
        break;
      }
    }
  }
   
}

 void render()
 {
   
  fill(0);
  rect(headX[1], headY[1], 12, 12);

  //create trail of where the snake has gone (leave in?)
  fill(255);
  stroke(255);
  rect(headX[snakesize], headY[snakesize], 12, 12);
  }


void keyPressed()
{
  //allocating code for the switch statement
  if (key == CODED)
  {
    //checking angle to make sure snake can only go forward
    if (keyCode == UP && angle != 270)
    {
      angle = 90;
    }
    if (keyCode == DOWN && angle != 90)
    {
      angle = 270;
    }if (keyCode == LEFT && angle != 0)
    {
      angle = 180;
    }if (keyCode == RIGHT && angle != 180)
    {
      angle = 0;
    }
   }
 }
 
}