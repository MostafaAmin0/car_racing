Track track;
Player player;

void setup(){
  size(1200,600);
  track=new Track();
  player=new Player("Car.png",0.15,45,60); 
  
}

void draw(){
  track.display();
  player.display();
  resolvePlatformCollisions(player,track.barriers);
}


public void resolvePlatformCollisions(Player s, Barrier[] barriers){
  
  s.center_x =s.center_x + (s.speed * cos(s.direction));
  
  ArrayList<Barrier> col_list = checkCollisionList(s,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(s.getRight() >= bar.getLeft() && s.getLeft()<bar.getLeft()){
      s.setRight(bar.getLeft());
    }
    else if(s.getLeft() <= bar.getRight() && s.getRight()>bar.getRight()){
      s.setLeft(bar.getRight());
    }
    s.speed=0;
  }
  
  s.center_y =s.center_y + (s.speed * sin(s.direction));
  
  col_list = checkCollisionList(s,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(s.getBottom() >= bar.getTop() && s.getTop()<bar.getTop()){
      s.setBottom(bar.getTop());
    }
    else if(s.getTop() <= bar.getBottom() && s.getBottom() > bar.getBottom()){
      s.setTop(bar.getBottom());
    }
    s.speed=0;
  }

  s.update();
}


boolean checkCollision(Player s1, Barrier bar){
  boolean noXOverlap1 = s1.getRight() <= bar.getLeft() ;
  boolean noXOverlap2 = s1.getLeft() >= bar.getRight() ;
  boolean noXOverlap = noXOverlap1 ||noXOverlap2 ;
  
  boolean noYOverlap1 = s1.getBottom() <= bar.getTop() ;
  boolean noYOverlap2 = s1.getTop() >= bar.getBottom();
  boolean noYOverlap = noYOverlap1||noYOverlap2;
  
  if(noXOverlap || noYOverlap ){
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
    player.turnRight();
  }
   if(keyCode == LEFT){
    player.turnLeft();
  }
  if(keyCode == UP ){
    player.up();
  }
   if(keyCode == DOWN ){
    player.down();
  }
}

// called whenever a key is released.
void keyReleased(){
  if(keyCode == RIGHT){
  }
  if(keyCode == LEFT){
  } if(keyCode == UP ){
    player.speed=0;
  }
    if(keyCode == DOWN ){
    player.speed=0;
  }
}
