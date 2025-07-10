import juegoInicial.*
import menu.*
import teclado.*
object juego{
  method iniciar(){
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