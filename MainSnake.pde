ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean gameOver = false;
boolean[] keys = new boolean[512];

int foodEaten = 0;
int increase = 15;

//Control p5 
import controlP5.*;
ControlP5 cp5;


void setup()
{
  size(500, 500);

  background(255);
  
  //game goes too fast otherwise
  frameRate(increase);
  
   //create buttons
  cp5 = new ControlP5(this);
  
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

//check if the buttons are pressed
public void controlEvent(ControlEvent theEvent)
{
     
  if (theEvent.isController())
  {
    if (theEvent.getName() == "Go Again")
    {
      //restart game
    }
  }
}


void draw()
{
  if (gameOver == false)
  {
    for(int i = gameObjects.size() - 1 ; i >= 0   ; i --)
    {
      GameObject go = gameObjects.get(i);
      
      //border
      fill(0);
      stroke(0);
      rect(0, 0, go.pixel, height);
      rect(0, 0, width, go.pixel);
      rect(0, height-go.pixel, width, go.pixel);
      rect(width-go.pixel, 0, width, height);
      
      
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
            
            gameObjects.remove(othergo);
            
            background(255);
            
            //redraw border to make it not appear glitchy
            fill(0);
            stroke(0);
            rect(0, 0, go.pixel, height);
            rect(0, 0, width, go.pixel);
            rect(0, height-go.pixel, width, go.pixel);
            rect(width-go.pixel, 0, width, height);
            
            Food food = new Food();
            gameObjects.add(food);
            
            
            //making snake bigger everytime!
            go.snakelen += 1;
            
            go.render();
            
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
      if (go.headX[1] >=  width- go.pixel || go.headY[1] >= height - go.pixel || go.headX[1] <= 0 || go.headY[1] <= 0)
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
    
     cp5.addButton("Go Again")
     .setValue(1)
     .setPosition(150,200)
     .setSize(200,19);
    
    if (foodEaten != 0)
    {
      text("You ate " + foodEaten + " food", 150, 180);
    }
    else
    {
      text("You ate no food!", 150, 180);
    } 
    
  fill(0, 225, 0);
  stroke(0, 255, 0);
  //body
  rect(0, 250, 250, 70);
  rect(230, 210, 100, 150);
  //eyes
  fill(0);
  stroke(0);
  rect(290, 210, 40, 40);
  rect(290, 320, 40, 40);
  //tongue
  fill(225, 0, 0);
  stroke(255, 0, 0);
  rect(330, 280, 30, 10);
  
  
}