Track track;
Player player;
startScreen screen;
int selectedScreen=0;

void setup(){
  track=new Track();
  player=new Player("Car.png",0.15,45,60); 
  screen=new startScreen();
  
}
void settings() {
  size(1200, 600);
}
void gameScreen(){
  selectedScreen=1;
  track.display();
  player.display();
  resolvePlatformCollisions(player,track.barriers);

}
void draw(){
  if(selectedScreen==0){
    screen.startMenu();
  }
  else if(selectedScreen==1){
    screen.selectStart();
  }

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
