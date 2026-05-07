object bicicleta {
    method peso() = 5
}

object camion {
    var acoplados = 1
    method peso() = 500 * acoplados 

    method cambiarCantidadAcoplados(cant) {
        acoplados = cant
    }
}