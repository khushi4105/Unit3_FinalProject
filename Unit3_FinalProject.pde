
Sand[] particles = new Sand[10000];

void setup()
{
  size(700, 700);

  for (int i = 0; i<10000; i++)
  {
    particles[i] = new Sand();
  }
}

void draw()
{
  background(0, 0, 0);

  for (int i = 0; i<10000; i++)
  {
    particles[i].Update();
  }
}
