import wollok.game.*
import juego.*
object serpiente {
  var vida=5
  var position= game.at(0,0)
  method quitarVida(cantidad){ vida= (vida-cantidad).max(0)}
  method image()= if (vida> 0)"serpiente.png" else "serpiente2.png"
  method position()=position
  method position(nueva){
    position=nueva
  }
  method estaViva()= vida>0
  method comer(){vida+=1}
  method mostrarVida()= "vida: " + vida
  method vida() = vida
 
}

class Manzana{
  var position
  method image()="manzana.png"
  method position()=position
  method position(nueva){
    position=nueva
  }
  method interaccion(){
    if(serpiente.estaViva()){
    game.removeVisual(self)
    serpiente.comer()
    }else{
      game.say(serpiente, "Perdiste no te quedan vidas")
      game.stop()
    }
    game.say(serpiente, serpiente.mostrarVida())
    }
  
}
object manzanaDorada{
  const position= game.center()
  method position()= position
  method image()="manzanaDorada.png"
  method interaccion(){
    serpiente.position(game.origin())
   
  }
}

class ManzanaEnvenenada inherits Manzana{
  const nivelVeneno
  override method interaccion(){ 
    if(serpiente.estaViva()){
    game.removeVisual(self)
    serpiente.quitarVida(nivelVeneno.cantidad())
    }
    else{
      game.stop()
    }
    game.say(serpiente, serpiente.mostrarVida())
  }
}
 object venenoFuerte{
  method cantidad()=3
 }
object venenoMedio{
  method cantidad()=2
}
object venenoSuave{
  method cantidad()=1
}


