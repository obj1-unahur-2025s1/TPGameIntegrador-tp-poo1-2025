import teclado.*
object instrucciones{
    method iniciar(){
        game.addVisual(self)
        configuracionTeclado.modoInstrucciones()
    }
    method image() = "instruccion.png"
    method position() = game.origin()
}