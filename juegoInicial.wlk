import proyectil.*
import score.*
import teclado.*
import naveEspacial.*
object juegoInicial{
    method image() = "fondoArcade.jpeg"
    method position() = game.origin()
    method iniciar(){
        game.addVisual(self)
        naveEspacial.iniciar()
        self.generarNavesEnemigas()
        score.posicionar()
        score.addVisual()
        configuracionTeclado.modoJuego()
         // game.schedule(100000, {game.removeTickEvent("aparecer enemigo")})
        game.onCollideDo(naveEspacial, {algo=>algo.chocarNave()})
        //keyboard.r().onPressDo({self.reiniciar()})
    }
    method generarNavesEnemigas(){
        var naveEnemiga = new NaveEnemiga(position=self.posicionAleatoria())
        game.onTick(4000, "", {naveEnemiga = new NaveEnemiga(position=self.posicionAleatoria())})
        game.onTick(8000, "aparecer enemigo", {naveEnemiga.aparecer()})
       // game.onCollideDo(naveEnemiga, {elemento => elemento.interaccion()})
        
    }
    
    method posicionAleatoria() =
        game.at(
            0.randomUpTo(game.width() - 2),
            (game.height()-1).randomUpTo(game.height())
        )
    method gameOver(){
        if (not naveEspacial.estaConVida()){
            game.removeVisual(self)
            game.addVisual(gameOver)
            game.stop()
        }
    }
    
    /*
    method reiniciar(){
        game.removeVisual(self)
        game.removeVisual(naveEspacial)
        score.removeVisual()
        game.removeTickEven()
        game.removeVisual(Proyectil)
        naveEspacial.vida(3)
        game.addVisual(self)
        score.addVisual()
        game.addVisual(naveEspacial)
        game.addVisual(NaveEnemiga)
        game.addVisual(Proyectil)
        self.iniciar()
    }
    */
        
}
object gameOver{
    method image()= "GameOver.jpeg"
    method position()= game.origin()
}