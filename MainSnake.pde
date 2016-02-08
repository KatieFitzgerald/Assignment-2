ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean gameOver = false;
boolean[] keys = new boolean[512];

int foodEaten = 0;
int increase = 15;


void setup()
{
  size(600, 600);

  background(102, 204, 0);
  
  //game goes too fast otherwise
  frameRate(increase);
  
  Snake snake = new Snake();
  Food food = new Food();
  
  gameObjects.add(snake);
  gameObjects.add(food);
  
}

void keyPressed()
{
  keys[keyCode] = true;
}
void keyReleased()
{
  keys[keyCode] = false;
}


void draw()
{
  if (gameOver == false)
  {
    for(int i = gameObjects.size() - 1 ; i >= 0   ; i --)
    {
      GameObject go = gameObjects.get(i);
      
      phone();

      if(go instanceof Snake)
      {
        ((Snake)go).keyPressed();
      }
      go.render();
      go.update();
      
      foodEaten();
      dead();
      
    }
    
  }
  else
  {
   gameOver();
  }

   
}


void foodEaten()
{
  for(int i = gameObjects.size() - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    if(go instanceof Snake)
    {
      for(int j = gameObjects.size() - 1; j >= 0; j --)
      {
        GameObject othergo = gameObjects.get(j);
        if (othergo instanceof Food)
        {
          
          if (int (dist(othergo.randomX, othergo.randomY, go.headX[1], go.headY[1])) < 8)
          {
           ((Food) othergo).increaseLen((Snake)go);
            gameObjects.remove(othergo);
         
           //create a white "filler" food in place of the old one
            fill(102, 204, 0);
            rect(othergo.randomX, othergo.randomY, othergo.pixel, othergo.pixel);

            Food food = new Food();
            gameObjects.add(food);

            foodEaten++;
            
            increase+=2;
            frameRate(increase);
          }
        }
      }
    }
  }
}

void dead()
{
  for(int i = gameObjects.size() - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    if(go instanceof Snake)
    {
      //counter starts at 2 or it will be counting in the head
      for(int j = 2; j <= go.snakelen; j++)
      {
        if (go.headX[1] == go.headX[j] && go.headY[1] == go.headY[j])
        {
          gameOver = true;
        }
      }
    }
  }
  for(int i = gameObjects.size() - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    
    if(go instanceof Snake)
    {
      if (go.headX[1] >=  width- 40 || go.headY[1] >= height - 80 || go.headX[1] <= 40 || go.headY[1] <= 40)
      {
        gameOver = true;
        println(go.headX[1], go.headY[1]);
      }
    }
  }
  
}

void gameOver()
{
  background(255);
  
   fill(0);
    textSize(30);
    text("Game Over", 150, 150);

    text("Score: " + foodEaten, 160, 180);
    
  fill(0, 225, 0);
  stroke(0, 255, 0);
  //body
  rect(0, 250, 250, 70);
  rect(210, 220, 70, 120);
  //eyes
  fill(0);
  stroke(0);
  rect(260, 230, 20, 20);
  rect(260, 300, 20, 20);
  //tongue
  fill(225, 0, 0);
  stroke(255, 0, 0);
  rect(280, 270, 30, 10);
  
}

void phone()
{
      fill(255);
      stroke(255);
      rect(0, height- 90,width, 90);
      
      fill(0);
      stroke(0);
      rect(40, 0, 10, height);
      rect(40, 40, width, 10);
  
      //border
      fill(0, 0, 51);
      stroke(0, 0, 51);
      rect(0, 0, 40, height); //left
      rect(0, 0, width, 40); //top
      rect(0, height-80, width, 80); //bottom
      rect(width-40, 0, width, height); //right
      
      //buttons
      fill(255);
      stroke(255);
      rect(40, height - 60, 153, 40);//first
      rect(220, height - 60, 153, 40);//second
      rect(400, height - 60, 153, 40);//third
      
      //button details
      //hang up button
      fill(255, 0, 0);
      stroke(255, 0, 0);
      rect(width - 180, height - 45, 30, 20);
      rect(width - 100, height - 45, 30, 20);
      rect(width - 180, height - 50, 110, 10);
      
      //pick up button
      fill(0, 255, 0);
      stroke(0, 255, 0);
      rect(width - 540, height - 45, 30, 20);
      rect(width - 460, height - 45, 30, 20);
      rect(width - 540, height - 50, 110, 10);
  
}