import juegoInicial.*
import score.*
import proyectil.*
object naveEspacial{
    //const proyectil = new Proyectil()
    var property vida=1
    var position = game.at(0,3)
    method quitarVida(cantidad){vida=(vida-cantidad).max(0)}
    method image() = "Nave.png"
    method position() = position
    method estaConVida()= vida>0
    method iniciar(){
        game.addVisual(self)
    }
    method moverDerecha(){
        if(position.x() < 38){
            position = position.right(1)
        }
    }
    method moverIzquierda(){
        if(position.x() > 0){
            position = position.left(1)
        }
    }
    method disparar(){
        const proyectil = new Proyectil()
        proyectil.iniciar()
        game.onTick(100, "disparar Proyectil", {proyectil.moverArriba()})
        game.onCollideDo(proyectil, {unEnemigo => proyectil.interaccion(unEnemigo)})
    }
}
class NaveEnemiga{
    var position
    var image = "naveEnemiga.png"
    method image() = image
    method position() = position
    method aparecer(){
        game.addVisual(self)
        game.onTick(200, "naves enemigas bajan", {self.moverAbajo()})
    }
    method moverAbajo(){
        position = position.down(1)
        if(position.y() < 0){
            game.removeVisual(self)
        }
    }
    method chocarNave(){
        //game.removeVisual(self)
        naveEspacial.quitarVida(1)
        //game.removeVisual(naveEspacial)
        //game.addVisual(explocion)
        //game.addVisual(naveEspacial)
        juegoInicial.gameOver()

    
    }
    method interaccion(){
        image = "explosion.png"
        game.schedule(2000, {game.removeVisual(self)})
        score.sumarScore(1)
    }
    
}
object explocion{
    method image()="explosion.png"
    method position()=naveEspacial.position()
}