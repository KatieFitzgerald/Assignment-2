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
    //decides how big the snake is going to be
    if (i != 1)
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
          headX[i] += 12;
        }
        break;
        
        //moving up
        case 90:
        {
          headY[i] -= 12;
        }
        break;
        
        //moving left
        case 180:
        {
          headX[i] -= 12;
        }
        break;
        
        //moving down
        case 270:
        {
          headY[i] += 12;
        }
        break;
      }
    }
  }
   
}

void render()
{
   
  fill(0, 153, 0);
  rect(headX[1], headY[1], 12, 12);
  
  //makes the snake not a continuous line
  
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