import teclado.*

object menu{
    
    method image() = "menu2.jpeg"
    method position() = game.origin()
    method iniciar(){
        game.addVisual(self)
        configuracionTeclado.modoMenu()
    }
    

}
