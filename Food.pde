class Food extends GameObject
{
  float randomX;
  float randomY;
  
  
  Food()
  {
    randomX = random(height, width);
    randomY = random(height, width);
    
  }
  
  void render()
  {
    fill(0);
    ellipse(250, 250, 10, 10);
  }
  void update(){
  }
  void keyPressed(){
  }
  
}