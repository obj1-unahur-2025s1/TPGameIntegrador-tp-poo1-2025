import wollok.game.*
import juego.*
object serpiente {
  const manzanasEnvenenadas=#{}
  const manzanasNoEnvenenadas=#{}
  var vida=5
  var position= game.at(0,0)
  method quitarVida(cantidad){ vida= (vida-cantidad).max(0)}
  method image()= if (vida> 0)"serpiente.png" else "serpiente2.png"
  method position()=position
  method position(nueva){
    position=nueva
  }
  method agregarManzanaNoEnvenenada(unaManzana){manzanasNoEnvenenadas.add(unaManzana)}
  method agregarManzanaEnvenenada(unaManzana){manzanasEnvenenadas.add(unaManzana)}
  method comerManzana(){ game.onCollideDo(self,{elemento=>elemento.interaccion()})}
  method estaViva()= vida>0
  method aumentarVida(){vida+=1}
  method mostrarVida()= "vida: " + vida
  method vida() = vida
  method cantidadManzanasNoEnvenenadas()= manzanasNoEnvenenadas.size() // <- creemos con miguel que tal vez pueda ser util para cambiar el nivel de dificultad.
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
    serpiente.aumentarVida()
    serpiente.agregarManzanaNoEnvenenada(self)
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
    //game.allVisuals().forEach({visual=>game.removeVisual(visual)})
    serpiente.position(game.origin())
    game.addVisualCharacter(serpiente)
   
  }
}

class ManzanaEnvenenada inherits Manzana{
  const nivelVeneno
  override method interaccion(){ 
    if(serpiente.estaViva()){
    game.removeVisual(self)
    serpiente.quitarVida(nivelVeneno.cantidad())
    serpiente.agregarManzanaEnvenenada(self)
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


