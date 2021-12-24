Track track;
Player player1;
Player player2;

void setup(){
  size(1200,600);
  track=new Track();
  player1=new Player("Car.png",0.15,45,60); 
  player2=new Player("Car 2.png",0.15,110,60);
}

void draw(){
  track.display();
  player1.display();
  player2.display();
  resolvePlatformCollisions(player1,track.barriers);
  resolvePlatformCollisions(player2,track.barriers);
}


public void resolvePlatformCollisions(Player p, Barrier[] barriers){
  
  p.center_x =p.center_x + (p.speed * cos(p.direction));
  
  ArrayList<Barrier> col_list = checkCollisionList(p,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(p.getRight() >= bar.getLeft() && p.getLeft()<bar.getLeft()){
      p.setRight(bar.getLeft());
    }
    else if(p.getLeft() <= bar.getRight() && p.getRight()>bar.getRight()){
      p.setLeft(bar.getRight());
    }
    p.speed=0;
  }
  
  p.center_y =p.center_y + (p.speed * sin(p.direction));
  
  col_list = checkCollisionList(p,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(p.getBottom() >= bar.getTop() && p.getTop()<bar.getTop()){
      p.setBottom(bar.getTop());
    }
    else if(p.getTop() <= bar.getBottom() && p.getBottom() > bar.getBottom()){
      p.setTop(bar.getBottom());
    }
    p.speed=0;
  }

  p.update();
}


boolean checkCollision(Player p1, Barrier bar){
  boolean noXOverlap1 = p1.getRight() <= bar.getLeft() ;
  boolean noXOverlap2 = p1.getLeft() >= bar.getRight() ;
  boolean noXOverlap = noXOverlap1 ||noXOverlap2 ;
  
  boolean noYOverlap1 = p1.getBottom() <= bar.getTop() ;
  boolean noYOverlap2 = p1.getTop() >= bar.getBottom();
  boolean noYOverlap = noYOverlap1||noYOverlap2;
  
  if(noXOverlap || noYOverlap ){
    return false;
  }
  else{
    return true;
  }
}

public ArrayList<Barrier> checkCollisionList(Player p, Barrier[] bars){
  ArrayList<Barrier> collision_list = new ArrayList<Barrier>();
  for(Barrier b: bars){
    if(checkCollision(p, b))
      collision_list.add(b);
  }
  return collision_list;
}


// called whenever a key is pressed.
void keyPressed(){
  if(keyCode == RIGHT){
    player1.turnRight();
  }
   if(keyCode == LEFT){
    player1.turnLeft();
  }
  if(keyCode == UP ){
    player1.up();
  }
   if(keyCode == DOWN ){
    player1.down();
  }
  if(key == 'w'){
    player2.up();
  }
  if(key == 'a'){
    player2.turnLeft();
  }
  if(key == 's'){
    player2.down();
  }
  if(key == 'd'){
    player2.turnRight();
  }
}

// called whenever a key is released.
void keyReleased(){
 if(keyCode == UP ){
    player1.speed=0;
  }
    if(keyCode == DOWN ){
    player1.speed=0;
  }
  if(key == 'w'){
    player2.speed=0;
  }
  if(key == 's'){
    player2.speed=0;
  }
}
