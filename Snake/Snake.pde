void setup()
{
  size(500, 500);
  background(0);
  
}

int foodX = 250;
int foodY = 250;
int headX = 100;
int headY = 300;

void draw()
{
  fill(255,0,0);
  stroke(0);
  rect(foodX, foodY, 10, 10);
  
  fill(100);
  stroke(0);
  rect(headX, headY, 10, 10);
  rect(headX, headY-10, 10, 10);
  rect(headX, headY-20, 10, 10);
  
  

}