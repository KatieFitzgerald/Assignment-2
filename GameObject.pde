abstract class GameObject
{
  int angle = 0;
  float w;
  float halfW;
  float speed = 5.0f;
 
  GameObject()
  {
    // Constructor chaining
    this(width * 0.5f, height  * 0.5f, 50);     
  }
  
  GameObject(float x, float y, float w)
  {
    this.w = w; // Disambiguate w by using this
    this.halfW = w * 0.5f;
    this.angle = 0;
  }
  
  abstract void render();
  abstract void update();
  abstract void keyPressed();

} 