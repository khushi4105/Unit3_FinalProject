class Sand
{
  //Member data
  float _x;
  float _y;
  float _velocityY;  
  boolean _dead = false;

  //Default Constructors
  Sand()
  {
    _x = random(0, 700);
    _y = random(-2200, -15);
    _velocityY = random(4, 5);
  }

  //Member Functions
  void Fall()
  {
    _y = _y + _velocityY;
  }

  //Make's the particle
  void Make()
  {
    fill(216, 169, 66);
    ellipse( _x, _y, 10, 10);
  }

  void Update()
  {
    Fall();
    Make();
  }
}
