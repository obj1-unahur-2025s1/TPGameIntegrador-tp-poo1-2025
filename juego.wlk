import serpiente.*
import mainExample.*
object juego{
    var nivelDificultad= facil
  method iniciar(){
    game.addVisualCharacter(serpiente)
    serpiente.comerManzana()
    game.addVisual(manzanaDorada)
  }
  //method cambiarNivelDificultad() {if serpiente.cantidadManzanasNoEnvenenadas()>} <------- puede servir para que se cambiar el nivel de dificultad y hacer algo mas

  method agregarManzana(x,y){
    const manzana= new Manzana(position= game.at(x,y))
    game.addVisual(manzana)

    }
  method agregarManzanaEnvenenada(x,y,unVeneno){
    const manzana= new ManzanaEnvenenada(position=game.at(x,y),nivelVeneno=unVeneno)
    game.addVisual(manzana)
  }
  method agregarCaminoCorrecto(){
    self.agregarFilaManzanas(1,[2,4,6,8,10,12,14,16,18,20])
    self.agregarFilaManzanas(8, [1,3,5,7,9,11,13,15,17,19])
    self.agregarColManzanas(1, [2,4,6])
    self.agregarColManzanas(20, [3,5,7])
    self.agregarFilaManzanas(3,[5,6,9,10,13,14,17,18])
    self.agregarFilaManzanas(6, [3,4,7,8,11,12,15,16])
    self.agregarColManzanas(3, [5,6])
    self.agregarColManzanas(18, [4])
  }
  method agregarCaminoEnvenenado(){
    self.agregarFilaEnvenenada(1,[1,3,5,7,9,11,13,15,17,19], venenoSuave)
	self.agregarFilaEnvenenada(8,[2,4,6,8,10,12,14,16,18,20], venenoSuave)
	self.agregarColEnvenenada(1, [3,5,7], venenoSuave)
	self.agregarColEnvenenada(20, [2,4,6], venenoSuave)
    self.agregarFilaEnvenenada(3,[3,4,7,8,11,12,15,16], venenoMedio)
	self.agregarFilaEnvenenada(6,[5,6,9,10,13,14,17,18], venenoMedio)
	self.agregarColEnvenenada(3, [3,4], venenoMedio)
	self.agregarColEnvenenada(18, [5,6], venenoMedio)
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
    method position() = game.at(0,0)
    method mensaje() = 
    "instrucciones de uso:
    -tecla ↑ Arriba = Mover arriba
    -tecla ↓ Abajo = Mover abajo
    -tecla → Derecha = Mover derecha
    -tecla ← Izquierda = Mover izquierda
    
Controla la serpiente para comer manzanas
movete por el camino correcto
presta Atención en el camino puede haber manzanas
envenenadas
"
}