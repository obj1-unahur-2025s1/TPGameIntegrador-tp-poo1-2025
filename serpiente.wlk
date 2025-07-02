import wollok.game.*

object juego{
  method iniciar(){
    game.addVisualCharacter(serpiente)
    game.onCollideDo(serpiente,{elemento=>elemento.interaccion()})
  }
  method agregarManzana(x,y){
    const manzana= new Manzana(position= game.at(x,y))
    game.addVisual(manzana)

    }
  method agregarManzanaEnvenenada(x,y,unVeneno){
    const manzana= new ManzanaEnvenenada(position=game.at(x,y),nivelVeneno=unVeneno)
    game.addVisual(manzana)

  }
  method agregarCaminoCorrecto(){
    self.agregarManzana(14, 8)
    self.agregarFilaManzanas(7,[8,9,10,11,12,13,14])
    self.agregarFilaManzanas(6, [8,9,10,11,12,13,14,15,16,17,18])
    self.agregarColManzanas(18, [4,5])
    self.agregarFilaManzanas(3, [8,9,10,11,12,13,14,15,16,17,18])
  }
  method agregarFilaEnvenenada(fila,listaPosCol ,nivelVeneno){
    listaPosCol.forEach({x => self.agregarManzanaEnvenenada(x,fila, nivelVeneno)})
  }
  method agregarColEnvenenada(col, listaPosFila, nivelVeneno){
    listaPosFila.forEach({y => self.agregarManzanaEnvenenada(col, y, nivelVeneno)})
  }
  method agregarFilaManzanas(fila, listaPosCol){
    listaPosCol.forEach({x => self.agregarManzana(x,fila)})
  }
  method agregarColManzanas(col,listaPosFila){
    listaPosFila.forEach({y => self.agregarManzana(col, y)})
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
//game.whenCollideDo(objeto, accionConColisionado).

class ManzanaEnvenenada inherits Manzana{
  const nivelVeneno
  override method interaccion(){ 
    if(serpiente.estaViva()){
    game.removeVisual(self)
    serpiente.quitarVida(nivelVeneno.cantidad())
    }
    else{
      game.say(serpiente, "Perdiste no te quedan vidas")
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


