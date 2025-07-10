import teclado.*
object instrucciones{
    method iniciar(){
        game.addVisual(self)
        configuracionTeclado.modoInstrucciones()
    }
    method image() = "instrucciones.jpg"
    method position() = game.origin()
}