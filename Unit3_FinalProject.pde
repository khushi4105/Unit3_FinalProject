/*
 -> Figure out font mishap
 -> Change color of text (every word, different color)
 -> Change size of text (depending on mouse speed)
 -> Add game (text creates boundary & boxes collide & fall accordingly)
 -> Check ReadMe
 */

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;

PFont Georgia;
PFont PaperFont;

ArrayList<PVector> Points = new ArrayList<PVector>();

String story = "Coding is the process of using a programming language to get a computer to behave how you want it to. Coding can also boost problem solving and logic skills. ";
int CurrentLetter = 0;

void setup() 
{
  size(700, 700);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  boxes = new ArrayList<Box>();

  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(0, 0, 2, 1700));
  boundaries.add(new Boundary(0, 699, 1699, 2));
  boundaries.add(new Boundary(698, 0, 2, 1700));

  Georgia = loadFont("123.vlw");
  PaperFont = loadFont("paper.vlw");
}


void draw() 
{
  background(0);

  box2d.step();

  if (random(1) < 0.2) 
  {
    Box p = new Box(width/2, 30);
    boxes.add(p);
  }

  for (Boundary wall : boundaries) 
  {
    wall.display();
  }

  for (Box b : boxes) 
  {
    b.display();
  }

  for (int i = boxes.size()-1; i >= 0; i--) 
  {
    Box b = boxes.get(i);
    if (b.done()) 
    {
      boxes.remove(i);
    }
  }

  if (keyPressed)
  {
    if (key == 'a')
    {
      for (int i = boxes.size()-1; i >= 0; i--) 
      {
        Box b = boxes.get(i);
        b.killBody();
        boxes.remove(i);
      }
    }
  }

  textFont(PaperFont);
  text("Press key - a - to", 10, 20 ); 
  text("restart sand pile", 10, 40);

  textFont(Georgia);

  text(story.charAt(CurrentLetter), mouseX, mouseY);  
  Points.add(new PVector(mouseX, mouseY));

  for (int i = 0; i< Points.size()-1; i++)
  {
    text(story.charAt(i%158), Points.get(i).x, Points.get(i).y);
  }

  if (CurrentLetter < story.length()-1)
  {
    CurrentLetter++;
  } else 
  {
    CurrentLetter = 0;
  }
}
