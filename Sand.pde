class Sand
{
  //Member data
  float _x;
  float _y;
  float _velocityY;

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
    if (_y > 699)
    {
      _y = 699; 
    {
      _y = _y + _velocityY;
  }

  //Draw
  void Draw()
  {
    fill(216, 169, 66);
    ellipse( _x, _y, 10, 10);
  }

  void Update()
  {
    Fall();
    Draw();
  }
}
