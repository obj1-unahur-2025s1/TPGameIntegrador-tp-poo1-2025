import naveEspacial.*
import juegoInicial.*
import instrucciones.*
import menu.*
object configuracionTeclado{
    var teclado = tecladoJuego
    method iniciar(){
        keyboard.num1().onPressDo({teclado.num1()})
        keyboard.num2().onPressDo({teclado.num2()})
        keyboard.num3().onPressDo({teclado.num3()})
        keyboard.m().onPressDo({teclado.m()})
        keyboard.left().onPressDo({teclado.left()})
        keyboard.right().onPressDo({teclado.right()})
        keyboard.space().onPressDo({teclado.space()})
        keyboard.r().onPressDo({teclado.r()})
    }
    method modoMenu(){
        teclado = tecladoMenu
    }
    method modoInstrucciones(){
        teclado = tecladoInstrucciones
    }
    method modoJuego(){
        teclado = tecladoJuego
    }
}

class Teclado{
    method num1(){}
    method num2(){}
    method num3(){}
    method m(){}
    method right(){}
    method left(){}
    method space(){}
    method r(){}
}

object tecladoMenu inherits Teclado{
    override method num1(){
        game.removeVisual(menu)
        juegoInicial.iniciar()
    }
    override method num2(){
        game.removeVisual(menu)
        instrucciones.iniciar()
    }
    
    
}
object tecladoInstrucciones inherits Teclado{
    override method m(){
        game.removeVisual(instrucciones)
        gameOver.quitar()
        menu.iniciar()
    }
}
object tecladoJuego inherits Teclado{
    override method right(){
        naveEspacial.moverDerecha()
    }
    override method left(){
        naveEspacial.moverIzquierda()
    }
    override method space(){
        naveEspacial.disparar()
    }
    override method r(){
        juegoInicial.reset()
    }
    
}
