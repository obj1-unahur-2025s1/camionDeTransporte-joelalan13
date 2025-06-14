object knightRider{
   method peso()= 500
   method peligrosidad()=10
   method bultos() = 1
   method consecuenciaDeLaCarga(){

   }
}
object bumblebee{
     var estaComoRobot = false
     method estaComoRobot()= estaComoRobot
     method peso()= 800
     method transformarseEnAuto(){
        estaComoRobot = false
     }
     method transformarseEnRobot(){
        estaComoRobot = true
     }

     method peligrosidad()= if(estaComoRobot) 30 else 15
      method bultos() = 2
       method consecuenciaDeLaCarga(){
        self.transformarseEnRobot()
    }
    
     }
     
object ladrillos{
    var cantidad = 0
    method cantidad(unaCantidad){
        cantidad = unaCantidad
    }
    method peso()= 2 * cantidad
    method peligrosidad()= 2 
    method bultos() = if (cantidad<=100) 1 
                      else if (cantidad.between(101, 300)) 2
                      else 3
     method consecuenciaDeLaCarga(){
        cantidad += 12
    }
    
}
object arena{
    //var peso= 0
    var property peso = 0 //Define auto. un setter y un getter
    /*
    method peso(unPeso){
        peso = unPeso
    }
    method peso()= peso
    */
    method peligrosidad() = 1
    method bultos() = 1
     method consecuenciaDeLaCarga(){
        peso = 0.max(peso - 10)
    }
    
}
object bateria{
    var estaConMisiles = false
    method cargarMisiles(){estaConMisiles = true}
    method descargarMisiles(){estaConMisiles = false}
    method peso()= if (estaConMisiles)300 else 200
    method peligrosidad()= if (estaConMisiles)100 else 0
    method bultos()= if(estaConMisiles) 2 else 1
     method consecuenciaDeLaCarga(){
        self.cargarMisiles()
    }
    
}
object contenedor{
    const cosas = []
    method bultos()= 1 + cosas.sum({cosas => cosas.bultos()})
    method agregarCosa(unaCosa){
        cosas.add(unaCosa)
    }
    method quitarCosa(unaCosa){
        cosas.remove(unaCosa)
    }
    method agregarVariasCosas(unaListaDeCosas){
        cosas.addAll(unaListaDeCosas)
    }
    method pesoDeLasCosas()= cosas.sum({cosa => cosa.peso()})
    method peso()= 100 + self.pesoDeLasCosas()
    method peligrosidad() = if(cosas.isEmpty()) 0 else cosas.max({cosa => cosa.peligrosidad()}).peligrosidad()
     method consecuenciaDeLaCarga(){
       cosas.forEach({cosa => cosa.consecuenciaDeLaCarga()})
    }
    
}
object residuos{
    var property peso = 0
    method peligrosidad() = 200
    method bultos() = 1
     method consecuenciaDeLaCarga(){
        peso += 15
    }
    
}
object embalaje{
    var property cosaEnvuelta = arena
    method peso()= cosaEnvuelta.peso()
    method peligrosidad()= cosaEnvuelta.peligrosidad() / 2
    method bultos() = 2
     method consecuenciaDeLaCarga(){}
    
}
