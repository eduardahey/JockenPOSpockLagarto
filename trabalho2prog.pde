  PImage fundo;
  boolean jogarPressionado = false;
  boolean telaInicialVisivel = true;
  boolean telaJogoVisivel = false;
  boolean telaWinVisivel = false;
  boolean jogadaPc = false;
  boolean telaResultado = false;
  boolean botaoPressionado = false;
  boolean escolha = true;
  int escolhaJogador;
  String pc = "";
  String[] escolhas = {"Tesoura","Lagarto","Papel", "Pedra", "Spock"};
  int escolhaComputador;
  String resultado = "";
  int tempoBotaoPressionado;
void setup() {
  size(880, 495); 
  fundo = loadImage("sheldonCooper.jpg");
   escolhaComputador = int(random(escolhas.length));
}
void draw(){    
  image(fundo,0,0);
  textAlign(CENTER, CENTER); 
  fill(255, 255, 0); 
  textSize(32);
  
  if(telaInicialVisivel){
   textSize(32); 
   fill(255);
   text("Pedra, Papel, Tesoura", 200, 120);
   text("Lagarto, Spock", 200, 160);
   quad(150, 350, 250, 350, 250, 380, 150, 380);
   fill(0);
   textSize(15); 
   text("Jogar", 200, 365);
   if((mouseX > 150 && mouseX < 250) && (mouseY > 350 && mouseY < 380)){
        cursor(HAND); 
   }else{
     cursor(ARROW); 
   }
  }
    
    if (jogarPressionado) {
    telaInicialVisivel = false;
    cursor(ARROW); 
    jogarPressionado = false;
    telaJogoVisivel = true;
    
  }

  if(telaJogoVisivel){
    fundo = loadImage("fundoPreto.jpg");
    fundo.resize(880,495);
    fill(255);
    stroke(0);
    rect(300,100,200,50);
    rect(550,100,200,50);
    rect(300,350,200,50);
    rect(550,350,200,50);
    rect(425,225,200,50);
    rect(50,225,200,50);
    fill(0);
    textSize(20); 
    
    text("Pedra", 400, 125);
    text("Papel", 650, 125);
    text("Tesoura", 400, 375);
    text("Lagarto", 650, 375);
    text("Spock", 525, 250);
    if(jogadaPc){
      pc = escolhas[escolhaComputador];
    }else{
      pc = "";
    }
    text(pc, 150,250);  
    fill(255);
    text("Computador:",110,210);  
    if(
    ((mouseX > 300 && mouseX < 500) && (mouseY > 100 && mouseY < 150)) ||
    ((mouseX > 550 && mouseX < 750) && (mouseY > 100 && mouseY < 150)) ||
    ((mouseX > 300 && mouseX < 500) && (mouseY > 350 && mouseY < 400)) ||
    ((mouseX > 550 && mouseX < 750) && (mouseY > 350 && mouseY < 400)) ||
    ((mouseX > 425 && mouseX < 625) && (mouseY > 225 && mouseY < 275))
    ){
       cursor(HAND); 
   }else{
     cursor(ARROW); 
   }
  }
    if(botaoPressionado){
        jogadaPc = true;
        escolha = false;
        if(millis() - tempoBotaoPressionado >= 1000){
          telaResultado = true;
          botaoPressionado = false;
        }
        
  }
  if(telaResultado){
     retornaResultado();
      telaJogoVisivel = false;
      text(resultado, 440, 400);
      fill(255);
      textSize(15);
      rect(380,450,125,25);
      fill(0);
      text("Jogar Novamente",442,462);
      jogadaPc = false;
      if(resultado == "Empate!"){
        fundo = loadImage("empate.jpg");
        fundo.resize(880,495);
  }else if(resultado == "Você Venceu!"){
    fundo = loadImage("venceu.jpg");
    fundo.resize(880,495);
  }else if(resultado == "Você Perdeu!"){
    fundo = loadImage("perdeu.jpg");
     fundo.resize(880,495);
  }
  if((mouseX > 380 && mouseX < 505) && (mouseY > 450 && mouseY < 475)) {
  cursor(HAND); 
   }else{
     cursor(ARROW); 
   }
}
}
void mousePressed() {
   if(telaInicialVisivel){
  if ((mouseX > 150 && mouseX < 250) && (mouseY > 350 && mouseY < 380)) {
    jogarPressionado = true;
    }
  }
  
  if(telaJogoVisivel && escolha){
    if((mouseX > 300 && mouseX < 500) && (mouseY > 100 && mouseY < 150)){
        escolhaJogador = 3;
        
        botaoPressionado = true;
        tempoBotaoPressionado = millis();
  }else if ((mouseX > 550 && mouseX < 750) && (mouseY > 100 && mouseY < 150)){
        escolhaJogador = 2;
         
         botaoPressionado = true;
         tempoBotaoPressionado = millis();
}else if ((mouseX > 300 && mouseX < 500) && (mouseY > 350 && mouseY < 400)){
        escolhaJogador = 0;
        
         botaoPressionado = true;
         tempoBotaoPressionado = millis();
}else if ((mouseX > 550 && mouseX < 750) && (mouseY > 350 && mouseY < 400)){
        escolhaJogador = 1;
         
         botaoPressionado = true;
         tempoBotaoPressionado = millis();
}else if((mouseX > 425 && mouseX < 625) && (mouseY > 225 && mouseY < 275)){
        escolhaJogador = 4;
       
        botaoPressionado = true;
        tempoBotaoPressionado = millis();
}
  }
  if(telaResultado){
     if((mouseX > 380 && mouseX < 505) && (mouseY > 450 && mouseY < 475)) {
       escolha = true;
         telaResultado = false;
         escolhaComputador = int(random(escolhas.length));
         telaJogoVisivel = true;
     }
  }
}

void retornaResultado(){
   
  if(escolhaJogador == escolhaComputador){
    resultado = "Empate!";   
  }
  else if(
     (escolhaJogador == 0 && (escolhaComputador == 1 || escolhaComputador == 2)) ||
     (escolhaJogador == 1 && (escolhaComputador == 2 || escolhaComputador == 4)) ||
     (escolhaJogador == 2 && (escolhaComputador == 3 || escolhaComputador == 4)) ||
     (escolhaJogador == 3 && (escolhaComputador == 1 || escolhaComputador == 0)) ||
     (escolhaJogador == 4 && (escolhaComputador == 0 || escolhaComputador == 3))
   ){
    resultado = "Você Venceu!";
    
}
else{
     resultado = "Você Perdeu!" ;
}

}
