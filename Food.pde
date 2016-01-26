class Food extends GameObject
{
  int randomX;
  int randomY;
  
  Food()
  {
    randomX = int(random(400));
    randomY = int(random(400));
  }
    
  //objects that extend GameObject must use all the methods in it
  void render()
  {
  
    fill(225, 0, 0);
    rect(randomX, randomY, 10, 10);
  }
  
  void update()
 {
     
 }
  
  void keyPressed()
  {
    
  }
  
  
}