import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Sand[] particles = new Sand[1500];
ArrayList<Boundary> boundaries;

void setup()
{ 
  size(700, 700);
  
  boundaries = new ArrayList<Boundary>();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  
  for (int i = 0; i<1500; i++)
  {
    particles[i] = new Sand();
  }

  boundaries.add(new Boundary(0, 0, 2, 700));
  boundaries.add(new Boundary(0, 699, 699, 2));
  boundaries.add(new Boundary(700, 0, 2, 700));
}

void draw()
{
  background(0, 0, 0);

  for (Boundary wall : boundaries) 
  {
    wall.display();
  }

  for (int i = 0; i<1500; i++)
  {
    particles[i].Update();
  }
}
