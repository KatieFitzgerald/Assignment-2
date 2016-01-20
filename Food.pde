class Food extends GameObject
{
  float randomX;
  float randomY;
  
  
  Food()
  {
    randomX = random(0, 500);
    randomY = random(0, 500);
    
  }
  
  //objects that extend GameObject must use all the methods in it
  void render()
  {
    fill(0);
    ellipse(randomX, randomY, 10, 10);
  }
  void update()
  {
    
    
  }
  
  void keyPressed()
  {
    
  }
  
  
}