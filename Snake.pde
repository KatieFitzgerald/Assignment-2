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
      pos.add(forward);
      theta = 90.0f;
    }
    if (keys[right])
    {
      pos.add(forward);
      theta = -90.0f;
    }      
    
   
   /* if (pos.x < 0)
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
    }*/
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    stroke(0);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate
    fill(255, 0, 0);
    rect(headX[2] * 1.0f, (headY[2]-10) * 1.0f, 10, 10);
    fill(90, 50, 220);
    rect(headX[3] * 1.0f, (headY[3]-20) * 1.0f , 10, 10);
    fill(100);
    rect(headX[4] * 1.0f, (headY[4]-30) * 1.0f, 10, 10);
    popMatrix();
  }   
  
  void restart()
  {
    //by pressing shift, all of the main variables reset to their defaults.
    background(255);
    headX[1]=200;
    headY[1]=200;
    for(int i=2;i<1000;i++)
    {
      headX[i]=0;
      headY[i]=0;
    }
  }

}
    
    
    
    
    
    
    
    
    
    
    