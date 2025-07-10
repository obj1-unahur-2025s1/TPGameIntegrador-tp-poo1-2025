import juegoInicial.*
import menu.*
import teclado.*
object juego{
  method iniciar(){
    keyboard.p().onPressDo({sonido.reproducir()})
    keyboard.o().onPressDo({sonido.parar()})
    game.title("galacticConflict")
    self.escenario()
    menu.iniciar()
    configuracionTeclado.iniciar()
  }
  method escenario(){
    game.height(38)
    game.width(38)
    game.cellSize(54)
  }
}


object sonido{
  const property musica = game.sound("musicaDeFondo.mp3")
  method reproducir(){
    musica.play()
    musica.shouldLoop(true)
  }
  method parar(){
    musica.stop()
  }
}