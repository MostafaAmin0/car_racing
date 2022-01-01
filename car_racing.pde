import processing.sound.*;

SoundFile file;
SoundFile coinSound;
PImage c ;
ArrayList<Coin> coins; 
Coin Coin;
Track track;
Player player1;
Player player2;
HashMap<String,Boolean> keymap = new HashMap<String,Boolean>();

StartScreen screen;
EndScreen endScreen;
int selectedScreen;
String winner = "";


//particles system
ArrayList<Particle> particles;
int particlesTime;

void setup(){
  selectedScreen=0;
  track=new Track();
  c = loadImage("gold1.png");
  keymap.put("w",false);
  keymap.put("s",false);
  keymap.put("a",false);
  keymap.put("d",false);
  keymap.put("up",false);
  keymap.put("left",false);
  keymap.put("right",false);
  keymap.put("down",false);
  screen=new StartScreen();
  endScreen=new EndScreen();
  particles = new ArrayList<Particle>();
  file = new SoundFile(this, "FireWorks.mp3");
  coinSound= new SoundFile(this, "coin.mp3");
}

void settings() {
  size(1200, 600);
}

void gameScreen(){
  
  track.display();
  
  player1.display();
  player2.display();
  
  for(Coin cc: coins){
     cc.display();
     cc.updateAnimation();
  }
  move();
  resolvePlatformCollisions(player1,track.barriers);
  resolvePlatformCollisions(player2,track.barriers);
  resolveCoinCollisions(player1);
  resolveCoinCollisions(player2);
  checkWin();
}

void draw(){  

  if(selectedScreen==0){
    screen.startMenu();
  }
  else if(selectedScreen==1){
    gameScreen();
  }else if (selectedScreen == 2){
    if(particlesTime-->0)
    {
      particles.add(new Particle(new PVector(width/2, height/2)));
      displayParticles();
    }
    else
    {
      endScreen.display(winner);
      file.stop();
    }}
}
  
  
void displayParticles()
{
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }

}
/*------------------------------------------------------------------------------------------*/
//barrier collision

public void resolvePlatformCollisions(Player p, Barrier[] barriers){
  
  //try make change in x axis and check if it would be collision 
  p.center_x =p.center_x + (p.speed * cos(p.direction));
  
  ArrayList<Barrier> col_list = checkCollisionList(p,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(p.getRight() >= bar.getLeft() && p.getLeft()<bar.getLeft()){
      p.setRight(bar.getLeft()-1);
    }
    else if(p.getLeft() <= bar.getRight() && p.getRight()>bar.getRight()){
      p.setLeft(bar.getRight()+1);
    }
    p.speed=0;
  }
  
  //try make change in y axis and check if it would be collision
  p.center_y =p.center_y + (p.speed * sin(p.direction));
  
  col_list = checkCollisionList(p,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(p.getBottom() >= bar.getTop() && p.getTop()<bar.getTop()){
      p.setBottom(bar.getTop()-1);
    }
    else if(p.getTop() <= bar.getBottom() && p.getBottom() > bar.getBottom()){
      p.setTop(bar.getBottom()+1);
    }
    p.speed=0;
  }

  p.update();
}

public ArrayList<Barrier> checkCollisionList(Player p, Barrier[] bars){
  ArrayList<Barrier> collision_list = new ArrayList<Barrier>();
  for(Barrier b: bars){
    if(checkCollision(p, b))
      collision_list.add(b);
  }
  return collision_list;
}

boolean checkCollision(Player p1, Barrier bar){
 
  boolean noXOverlap = p1.getRight() <= bar.getLeft() || p1.getLeft() >= bar.getRight() ;
  
  boolean noYOverlap = p1.getBottom() <= bar.getTop()||p1.getTop() >= bar.getBottom();
  
  if(noXOverlap || noYOverlap ){
    return false;
  }
  else{
    return true;
  }
}

/*--------------------------------------------------------------------------------------------------------*/

//coin collisioin

public void resolveCoinCollisions(Player player){
ArrayList<Coin> collision_list = resolveCollisionsList(player, coins);
  if(collision_list.size() > 0){
    for(Coin coin: collision_list){
       //coinSound.play();
       
       //to make coin disappear
       coins.remove(coin);
       
       //increase speed randomly for each coin collied
       player.speed += random(0,1);
    }
  }
}


public ArrayList<Coin> resolveCollisionsList(Player p, ArrayList<Coin> list){
  ArrayList<Coin> collision_list = new ArrayList<Coin>();
  for(Coin c: list){
    if(resolveCollisions(p, c))
      collision_list.add(c);
  }
  return collision_list;
}

public boolean resolveCollisions(Player p, Coin c){
  boolean noXOverlap = p.getRight() <= c.getLeft() || p.getLeft() >= c.getRight();
  boolean noYOverlap = p.getBottom() <= c.getTop() || p.getTop() >= c.getBottom();
  if(noXOverlap || noYOverlap){
    return false;
  }
  else{
    return true;
  }
}

public void coinPlace(){
  
  coin_constrain(int(random(1,3)),145,520,180,240);
  coin_constrain(int(random(1,3)),145,480,500,560);
  coin_constrain(1,620,845,500,560);
  coin_constrain(1,600,845,30,80);
  coin_constrain(1,950,1100,270,320);

}

public ArrayList<Coin> coin_constrain (int no_coins,int x,int x1,int y,int y1){
  for (int i=0;i<no_coins;i++){
    Coin coi = new Coin(c, 0.3);
    coi.center_x = (float)(random(x,x1));
    coi.center_y = (float)(random(y,y1));
    coins.add(coi);
    
  }
  return coins; 
}

/*---------------------------------------------------------------------------------------------------*/
//keyboard


// called whenever a key is pressed.
void keyPressed(){
  if(keyCode == RIGHT){
    keymap.put("right",true);
  }
   if(keyCode == LEFT){
    keymap.put("left",true);
  }
  if(keyCode == UP ){
    keymap.put("up",true);
  }
   if(keyCode == DOWN ){
    keymap.put("down",true);
  }
  
    //player 2
  if(key == 'w'){
    keymap.put("w",true);
  }
  if(key == 's'){
    keymap.put("s",true);
  }
  if(key == 'd'){
    keymap.put("d",true);
  }
  if(key == 'a'){
    keymap.put("a",true);
  }
}

// called whenever a key is released.
void keyReleased(){
 if(keyCode == RIGHT){
    keymap.put("right",false);
  }
   if(keyCode == LEFT){
    keymap.put("left",false);
  }
  if(keyCode == UP ){
    keymap.put("up",false);
  }
   if(keyCode == DOWN ){
    keymap.put("down",false);
  }
  
    //player 2
  if(key == 'w'){
    keymap.put("w",false);
  }
  if(key == 's'){
    keymap.put("s",false);
  }
  if(key == 'd'){
    keymap.put("d",false);
  }
  if(key == 'a'){
    keymap.put("a",false);
  }
}


void move(){
  if(keymap.get("right")){
    player1.turnRight();
  }
  if(keymap.get("left")){
    player1.turnLeft();
  }
  if(keymap.get("up")){
    player1.up();
  }
  if(keymap.get("down")){
    player1.down();
  }
  //or use xnor
  if (keymap.get("up") == keymap.get("down")){
    player1.speed=0;
  }
  
  //player 2
  if(keymap.get("d")){
    player2.turnRight();
  }
  if(keymap.get("a")){
    player2.turnLeft();
  }
  if(keymap.get("w")){
    player2.up();
  }
  if(keymap.get("s")){
    player2.down();
  }
  // or use xnor
  if(keymap.get("w") == keymap.get("s")){
    player2.speed=0;
  }  

}

int checkFinishLine(){
  if(player1.getLeft() > 1093 && player1.getRight() < 1191 && player1.getBottom() > 580){
    return 1;
  }
  if(player2.getLeft() > 1093 && player2.getRight() < 1191 && player2.getBottom() > 580){
    return 2;
  }
  
  return -1;
}

void checkWin(){
  int w = checkFinishLine();
  if(w != -1){
      file.play();
    if(w == 1){
      winner="Player One";
      selectedScreen=2;     
    }
    else if(w == 2){
      winner="Player Two";
      selectedScreen=2;
    }
  }
}
