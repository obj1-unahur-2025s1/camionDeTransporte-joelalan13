import cosas2.*
object camion {
    const carga = []
    method cargar(unaCosa){
        carga.add(unaCosa)
        carga.transmutarse()
    }
    method descargar(unaCosa) = carga.remove(unaCosa)

    method peso() = 1000 + self.pesoTotal()
    method pesoTotal() = carga.sum({c => c.peso()})
    method pesoCargaPar() = carga.all({c => c.peso().even()})
    
    method pesoDeterminado(unPeso) = 
        carga.any({c => c.peso() == unPeso})
    
    method determinadaPeligrosidad(unNivel) = 
        carga.find({c => c.peligrosidad() == unNivel})
    method superaPeligrosidad(unNivel) = 
        carga.filter({c => c.peligrosidad() > unNivel})

    method pesoExcedido() = self.peso() > 2500

    method puedeCircular(nivelPermitido) = !self.pesoExcedido() && self.superaPeligrosidad(nivelPermitido).isEmpty()
}