import serpiente.*
import mainExample.*

object nivel1{
    const manzanas=#{}
    const manzanasEnvenenadas=#{} 
    method agregarManzana(x,y){
    const manzana= new Manzana(position= game.at(x,y))
    game.addVisual(manzana)
    manzanas.add(manzana)
 }
   
  method agregarManzanaEnvenenada(x,y,unVeneno){
    const manzana= new ManzanaEnvenenada(position=game.at(x,y),nivelVeneno=unVeneno)
    game.addVisual(manzana)
    manzanasEnvenenadas.add(manzana)
  }
  method quitarTodasLasManzanasDelEscenario(){
    self.quitarManzanasEnvenenadas()
    self.quitarManzanasNoEnvenenadas()
    }
    method quitarManzanasNoEnvenenadas() {
      manzanas.forEach({manzana=>manzana.borrar()})
      manzanas.clear()
    }
  method quitarManzanasEnvenenadas(){
    manzanasEnvenenadas.forEach({manzana=>manzana.borrar()})
    manzanasEnvenenadas.clear()
    }
    method iniciar(){
    keyboard.enter().onPressDo{game.say(instruccionJuego,instruccionJuego.instruccion())}
    self.escenario()
    game.addVisualCharacter(serpiente)
    serpiente.comerManzana()
    game.addVisual(manzanaDorada)
    game.addVisual(instruccionJuego)
    self.agregarCaminoCorrecto()
    
	
    
  }
   method agregarCaminoCorrecto(){
    self.agregarManzana(14, 8)
    self.agregarFilaManzanas(7,[14])
    self.agregarFilaManzanas(6, [14,15,16,17,18])
    self.agregarColManzanas(18, [4,5])
    self.agregarFilaManzanas(3, [11,12,13,14,15,16,17,18])
    self.agregarManzana(11,4)
  }
    method escenario(){
  self.agregarFilaEnvenenada(1,[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20] ,venenoSuave)
	self.agregarFilaEnvenenada(8,[5,6,7,8,9,10,11,12,13,15,16,17,18,19,20] ,venenoSuave)
	self.agregarColEnvenenada(4,[1,2,3,4,5,6,7,8] ,venenoSuave)
	self.agregarColEnvenenada(20,[2,3,4,5,6,7] ,venenoSuave)
	self.agregarFilaEnvenenada(7, [6,7,8,9,10,11,12,13,15,16,17,18,19], venenoMedio)
	self.agregarColEnvenenada(19, [7,6,5,4,3,2], venenoMedio)
	self.agregarFilaEnvenenada(2, [18,17,16,15,14,13,12,11,10,9,8,7,6,5], venenoMedio)
	self.agregarColEnvenenada(5, [3,4,6,7],venenoMedio)
	self.agregarFilaEnvenenada(6, [6,7,8,9,10,11,12,13], venenoFuerte)
	self.agregarFilaEnvenenada(5, [5,6,7,8,9,10,12,13,14,15,16,17], venenoFuerte)
	self.agregarFilaEnvenenada(4, [5,6,7,8,9,10,12,13,14,15,16,17], venenoFuerte)
	self.agregarFilaEnvenenada(3, [6,7,8,9,10], venenoFuerte)
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
object instruccionJuego{
    method position() = game.at(0,9)
    method instruccion()="Move la serpiente (↑, ↓, ←, →).Eleji un camino,avanza para llegar a comer la manzana dorada y ganá.¡Cuidado hay manzanas envenenadas!.                                                                    "
    method empezarJuego(){
        game.removeVisual(self)
    }
}

object music{
    method play(){game.sound("cancion.mp3").play()}
}
object nivel2{
  method iniciar(){
    self.escenario()
  }
  method escenario(){
    game.addVisual(manzanaDorada)
    self.agregarManzana(11, 6)
    self.agregarManzanaEnvenenada(11, 4,venenoFuerte)
    self.agregarManzanaEnvenenada(12, 5,venenoFuerte)
    self.agregarManzanaEnvenenada(12, 4,venenoFuerte)
    self.agregarManzanaEnvenenada(10, 5,venenoFuerte)
    self.agregarManzanaEnvenenada(10, 4,venenoFuerte)
    self.agregarManzanaEnvenenada(10, 6,venenoFuerte)
    self.agregarManzanaEnvenenada(12, 6,venenoFuerte)
  }
  method agregarManzana(x,y){
    const manzana= new Manzana(position= game.at(x,y))
    game.addVisual(manzana)
 }
 method agregarManzanaEnvenenada(x,y,unVeneno){
    const manzana= new ManzanaEnvenenada(position=game.at(x,y),nivelVeneno=unVeneno)
    game.addVisual(manzana)
  }
}