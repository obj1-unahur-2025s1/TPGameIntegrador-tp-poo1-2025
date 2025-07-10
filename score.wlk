object score{
    const property puntuacion = [new Numero(), new Numero(), new Numero(), new Numero()]
    var numero = 0
    method addVisual(){
        puntuacion.forEach({n => game.addVisual(n)})
    }
    method removeVisual(){
        puntuacion.forEach({n => game.removeVisual(n)})
    }
    method reset(){
        numero = 0
        puntuacion.forEach({n => n.cambiarNumero(0)})
    }
    method numero() = numero

    method posicionar(){
        puntuacion.get(0).cambiarUbicacion(0,0)
        puntuacion.get(1).cambiarUbicacion(1,0)
        puntuacion.get(2).cambiarUbicacion(2,0)
        puntuacion.get(3).cambiarUbicacion(3,0)

    }

    method cambiarUbicacion(){
        puntuacion.get(0).cambiarUbicacion(17,8)
        puntuacion.get(1).cambiarUbicacion(18,8)
        puntuacion.get(2).cambiarUbicacion(19,8)
        puntuacion.get(3).cambiarUbicacion(20,8)
    }

    method sumarScore(cantidad){
        numero += cantidad
        self.cambiarPuntuacion()
    }

   
    method cambiarPuntuacion(){
        puntuacion.get(3).cambiarNumero(numero % 10)
        puntuacion.get(2).cambiarNumero(((numero / 10).truncate(0))%10)
        puntuacion.get(1).cambiarNumero(((numero / 100).truncate(0))%10)
        puntuacion.get(0).cambiarNumero(((numero / 1000).truncate(0))%10)
    }
}

class Numero{
    var numero = 0
    var position = game.at(0,0)
    var image = "0.png"
    method position() = position
    method image() = "" + numero.toString() + ".png"
    method cambiarNumero(nuevoNumero){
        numero = nuevoNumero
    }
    method numero() = numero
    method cambiarUbicacion(x,y) {
        position = game.at(x,y)
    }
}