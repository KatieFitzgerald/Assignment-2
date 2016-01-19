// The class name starts with uppercase
class Snake extends GameObject
{
  // Fields!
  int move;
  int left;
  int right;
  int[] headX = new int[2500];
  int[] headY = new int[2500];
  
  Snake()
  {
    // Constructor chaining. Call a constructor in the super class
    super(width * 0.5f, height  * 0.5f, 50);     
    
  }
  
  Snake(int move, int left, int right, float startX, float startY)
  {
    super(startX, startY, 50);
    this.move = move;
    this.left = left;
    this.right = right;
    
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    
    if (keys[move] && theta != 90.0f)
    {
      pos.add(forward);
    }      
    if (keys[left])
    {
      theta = 180.0f;
    }
    if (keys[right])
    {
      theta = 0.0f;
    }      
    
   
    /*if (pos.x < 0)
    {
      pos.x = width;
    }
    
    if (pos.x > width)
    {
      pos.x = 0;
    }
    
    if (pos.y < 0)
    {
      pos.y = height;
    }
    
    if (pos.y > height)
    {
      pos.y = 0;
    } */
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    fill(100);
    stroke(0);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate    
    rect(headX[1] * 1.0f, headY[1] * 1.0f, 10, 10);
    rect(headX[1], headY-10, 10, 10);
    rect(headX, headY-20, 10, 10);
    popMatrix();
  }   
  
  void restart()
  {
    //by pressing shift, all of the main variables reset to their defaults.
    background(255);
    headx[1]=200;
    heady[1]=200;
    for(int i=2;i<1000;i++)
    {
      headx[i]=0;
      heady[i]=0;
    }
    stopgame=false;
  }

}
    
    
    
    
    
    
    
    
    
    
    