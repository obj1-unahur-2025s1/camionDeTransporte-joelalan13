object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee{
    var transformadoAuto = true
    method transformarse(){transformadoAuto = !transformadoAuto}
    method peso() = 800
    method peligrosidad() = if(transformadoAuto){15}else{30}
}

object ladrillo{
    var cantidad = 0
    method cantidad(unaCantidad){cantidad = unaCantidad}
    method peso() = cantidad * 2
    method peligrosidad() = 2
}

object arenaAGranel{
    var peso = 0

    method pesoTotal(unPeso){ peso = unPeso}
    method peso() = peso
    method peligrosidad() = 1
}

object bateriaAntiaerea{
    var tieneMisiles = true

    method estaDescargado(){tieneMisiles = !tieneMisiles}
    method peso() = if(tieneMisiles){300}else{200}
    method peligrosidad() = if(tieneMisiles){100}else{0}
}

object contenedor{
    const contiene = []

    method contiene(unaCosa) = contiene.add(unaCosa)

    method peso() = 100 + self.pesoContenido()
    method pesoContenido() = contiene.sum({c => c.peso()})
    method peligrosidad() =
        if(contiene.isEmpety()){0}else{self.objectoMasPeligroso()}
    method objectoMasPeligroso() =
     contiene.max({c => c.peligrosidad()}).peligrosidad()
}

object residuosRadiactivos{
    var peso = 0
    method peso(unPeso) = peso + unPeso
    method peso() = peso
    method peligrosidad() = 200
}

object embalaje{
    var contiene = residuosRadiactivos
    method embala(unaCosa){contiene = unaCosa}
    method peso() = contiene.peso()
    method peligrosidad() = contiene.peligrosidad() / 2
}