class Particle {
  //(x,y) for every particle 
  PVector position;
  //how fast change in x and y 
  PVector velocity;
  //rate in which velocity icreased 
  PVector acceleration;
  //timer for particle apperance 
  float lifespan;

  //l is start position of particle  
  Particle(PVector startPosition) {
    //particle position
    position = startPosition.copy();
    //change in velocity 
    acceleration = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    //velocity of particle
    velocity = new PVector(random(-2, 2), random(-2, 0));
    lifespan = 200.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    //color of ellipse perimeter and alpha 
    stroke(100, lifespan);
    strokeWeight(1);
    //choose random RGB channels numbers
    int red =(int)random(0,256);
    int green =(int)random(0,256);
    int blue =(int)random(0,256);
    fill(red,green,blue, (float)lifespan);
    ellipse(position.x, position.y, 17, 17);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
