import naveEspacial.*
class Proyectil{
    var position = naveEspacial.position().up(1)
    method image()="laser_fondo_transparente.png"
    method position() = position
    method iniciar(){
        game.addVisual(self)
    }
    method interaccion(unEnemigo){
    game.removeVisual(self)
    unEnemigo.interaccion()
    }
    method moverArriba(){
        position = position.up(1)
        if(position.y() > game.height() - 1){
            game.removeVisual(self)
        }
    }

}