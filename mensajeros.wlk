import paquete.*
import vehiculo.*
import destinos.*
object roberto {
    var vehiculo = bicicleta

    method peso() = 90 + vehiculo.peso()

    method puedeLlamar() = false

    method cambiarVehiculo(vehiculoNuevo) {
        vehiculo = vehiculoNuevo
    }
    method puedeLlegarA_Con_(destino, p) = destino.puedePasar(self, p)
}

object chuckNorris {
    method peso() = 80
    method puedeLlamar() = true
    method puedeLlegarA_Con_(destino, p) = destino.puedePasar(self, p)
}

object neo {
    var credito = 10

    method peso() = 0
    method tieneCredito() = credito > 0 
    method cargarCredito(cant) {
        credito += cant
    }
    method puedeLlamar() = self.tieneCredito()
    method puedeLlegarA_Con_(destino, p) = destino.puedePasar(self, p)
}

object rambo {
    method peso() = 90
    method puedeLlamar() = false
    method puedeLlegarA_Con_(destino, p) = destino.puedePasar(self, p)
}