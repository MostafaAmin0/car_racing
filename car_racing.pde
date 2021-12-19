
final static float MOVE_SPEED = 4;

Track track;
Player player;

void setup(){
  size(1500,600);
  track=new Track();
  player=new Player("Car.png",0.2,20,180);
  
}

void draw(){
  background(0);
  imageMode(CENTER);
  track.display();
  player.display();
  //player.update();
  resolvePlatformCollisions(player,track.barriers);
}


public void resolvePlatformCollisions(Player s, Barrier[] barriers){
  // add gravity to change_y of sprite
  
  
  // move in y-direction by adding change_y to center_y to update y position.
  s.center_x +=s.change_x;
  ArrayList<Barrier> col_list = checkCollisionList(s,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(s.change_x >0){
      s.setRight(bar.getLeft());
    }
    else if(s.change_x<0){
      s.setLeft(bar.getRight());
    }
    s.change_x=0;
  }
  
  
  s.center_y+=s.change_y;
  
  
  col_list = checkCollisionList(s,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(s.change_y >0){
      s.setBottom(bar.getTop());
    }
    else if(s.change_y<0){
      s.setTop(bar.getBottom());
    }
    s.change_y=0;
  }

  s.update();
}


boolean checkCollision(Player s1, Barrier bar){
  boolean noXOverlap = s1.getRight() <= bar.getLeft() || s1.getLeft() >= bar.getRight();
  boolean noYOverlap = s1.getBottom() <= bar.getTop() || s1.getTop() >= bar.getBottom();
  if(noXOverlap || noYOverlap){
    return false;
  }
  else{
    return true;
  }
}

public ArrayList<Barrier> checkCollisionList(Player s, Barrier[] bars){
  ArrayList<Barrier> collision_list = new ArrayList<Barrier>();
  for(Barrier b: bars){
    if(checkCollision(s, b))
      collision_list.add(b);
  }
  return collision_list;
}


// called whenever a key is pressed.
void keyPressed(){
  if(keyCode == RIGHT){
    player.change_x = MOVE_SPEED;
    player.turnRight();
  }
  else if(keyCode == LEFT){
    player.change_x = -MOVE_SPEED;
    player.turnLeft();
  }
  else if(keyCode == UP ){
    player.change_y= -MOVE_SPEED;
    player.up();
  }
   else if(keyCode == DOWN ){
    player.change_y= MOVE_SPEED;
    player.down();
  }
}

// called whenever a key is released.
void keyReleased(){
  if(keyCode == RIGHT){
    player.change_x = 0;
    
  }
  else if(keyCode == LEFT){
    player.change_x = 0;
  }else if(keyCode == UP ){
    player.change_y=0;
  }
   else if(keyCode == DOWN ){
    player.change_y= 0;
  }
}
