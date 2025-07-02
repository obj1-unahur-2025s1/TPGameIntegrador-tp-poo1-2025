import wollok.game.*

object juego{
  method iniciar(){
    game.addVisualCharacter(serpiente)
    game.onCollideDo(serpiente,{elemento=>elemento.interaccion()})
  }
  method agregarManzanas(x,y){
    const manzana= new Manzana(position= game.at(x,y))
    game.addVisual(manzana)

    }
  method agregarManzanaEnvenenada(x,y,unVeneno){
    const manzana= new ManzanaEnvenenada(position=game.at(x,y),nivelVeneno=unVeneno)
    game.addVisual(manzana)

  }
  
    
}

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
  method text()= "vida: " + vida
 
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
    serpiente.comer()}
    game.say(serpiente, serpiente.mostrarVida())
    }
  
}
//game.whenCollideDo(objeto, accionConColisionado).

class ManzanaEnvenenada inherits Manzana{
  const nivelVeneno
  override method interaccion(){ 
    if(serpiente.estaViva()){
    game.removeVisual(self)
    serpiente.quitarVida(nivelVeneno.cantidad())}
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


