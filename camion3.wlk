object camion {
    const carga = []
   method cargar(unaCosa){
       carga.add(unaCosa)
       unaCosa.consecuenciaDeLaCarga()
   }
   method descargar(unaCosa){
      carga.remove(unaCosa)
   }
   method pesoTotal()= 1000 + self.cargaTotal()
   method cargaTotal() = carga.sum({cosa => cosa.peso()})
   method todoPesoPar(){
    return carga.all({cosa => cosa.peso().even()})
   }
   method algoQuePesa(unPeso) = carga.any({cosa => cosa.peso() == unPeso})
   method cosaConPeligrosidad(unNivel){
    return carga.find({cosa => cosa.peligrosidad() == unNivel})
   }
   method cosasSuperanPeligrosidad(unNivel){
    return carga.filter({cosa => cosa.peligrosidad() > unNivel})
   }
   method cosasMasPeligrosasQue2(unaCosa){
      return self.cosasSuperanPeligrosidad(unaCosa.peligrosidad())
   }
   method cosasMasPeligrosasQue(unaCosa){
    return carga.filter({cosa => cosa.peligrosidad() > unaCosa.peligrosidad()})
   }
   method excedidoDePeso(){
     return self.pesoTotal() > 2500
   }
   method puedeCircular(unNivel){
     return not self.excedidoDePeso() && self.cosasSuperanPeligrosidad(unNivel).isEmpty()
   }
   method tieneAlgoQuePesaEntre(min,max){
    return carga.any({cosa => cosa.peso().beetween(min,max)})
   }
   method cosaMasPesada(){
    return carga.max({cosa => cosa.peso()})
   }
   
}