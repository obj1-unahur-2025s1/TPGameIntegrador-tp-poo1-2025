import serpiente.*
import mainExample.*

object juego{
    var nivelDificultad= facil
  method iniciar(){
    keyboard.enter().onPressDo({instruccionJuego.empezarJuego()})
    game.addVisualCharacter(serpiente)
    serpiente.comerManzana()
    game.addVisual(manzanaDorada)
    game.addVisual(instruccionJuego)
    
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
    self.agregarFilaManzanas(7,[14])
    self.agregarFilaManzanas(6, [14,15,16,17,18])
    self.agregarColManzanas(18, [4,5])
    self.agregarFilaManzanas(3, [11,12,13,14,15,16,17,18])
    self.agregarManzana(11,4)
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
  method hasGanado(){
    game.onCollideDo(serpiente, manzanaDorada)
  }
}
object facil{
    method nivelDeDificultad()=1
}
object dificl{
    method nivelDeDificultad()=2
}
object instruccionJuego{
    method position() = game.center()
    method image()= "instrucciones.jpg"
    method empezarJuego(){
        game.removeVisual(self)
    }
}