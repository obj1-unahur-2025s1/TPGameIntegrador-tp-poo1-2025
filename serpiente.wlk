import wollok.game.*
import juego.*
object serpiente {
  var vida=3
  var contador=0
  method contador()=contador
  method aumentarCotador(){contador+=1}
  const  manzanas=#{}
  method agregarManzana(unaManzana){manzanas.add(unaManzana)}
  var position= game.at(0,0)
  method quitarVida(cantidad){ vida= (vida-cantidad).max(0)}
  method image()= if (vida> 0)"serpiente.png" else "serpiente2.png"
  method position()=position
  method position(nueva){
    position=nueva
  }
  method manzanasComidas()= manzanas.size()
  method comerManzana(){ game.onCollideDo(self,{elemento=>elemento.interaccion()})}
  method estaViva()= vida>0
  method mostrarVida()= "vida: " + vida
  method vida() = vida
  method ganar() {
    if (contador == 2){
      game.say(self, "Gané!!!!")
      game.stop()
    }
  }
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
    serpiente.agregarManzana(self)
    }else{
      game.say(serpiente, "Perdiste no te quedan vidas")
      game.stop()
    }
    game.say(serpiente, serpiente.mostrarVida())
    }
    method borrar(){
      game.removeVisual(self)
    }
  
}
class ManzanaDorada{
  var position= game.center()
  method position()=position
  method image()="manzanaDorada.png"
  method interaccion(){
    if(serpiente.manzanasComidas()==18 and serpiente.contador()==0){
    game.removeVisual(self)
    nivel1.quitarTodasLasManzanasDelEscenario()
    serpiente.position(game.origin())
    game.clear()
    nivel2.iniciar()
    serpiente.aumentarCotador()
    }
    else{
      game.removeVisual(self)
      serpiente.aumentarCotador()
    }
   
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


