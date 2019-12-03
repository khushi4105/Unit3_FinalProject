import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;


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
}


void draw() 
{
  background(0);

  box2d.step();

  if (random(1) < 0.2) {
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
}
