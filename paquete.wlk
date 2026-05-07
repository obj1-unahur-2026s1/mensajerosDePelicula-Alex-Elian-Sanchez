import mensajeros.*
import destinos.*
object paquete {
    var pago = false
    var destino = matrix

    method estaPago() = pago
    method precio() = 50

    method pagarPaquete() { pago = true }
    method fijarDestino(dest) { destino = dest }
    method puedeSerEntregado(mensajero) =
        mensajero.puedeLlegarA_Con_(destino, self) && self.estaPago()
}


object paquetito {
    method precio() = 0
    method estaPago() = true
    method puedeSerEntregado(mensajero) = true
}

object paquetonViajero {
    const destinos = []
    var pago = 0

    method destinos() = destinos
    method precio() = 100 * destinos.size()
    method estaPago() = self.precio() == pago
    method pagarPaquete() {pago = self.precio()}
    method recibirPago(paga) {pago += paga}
    method puedeSerEntregado(mensajero) =
        destinos.all({d => mensajero.puedeLlegarA_Con_(d, self)}) and self.estaPago()

    method agregarDestino(destino) {destinos.add(destino)} 
}

object paqueteCuotas {
    var paga = 0
    const pago = (self.precio() == paga)
    var destino = puenteBrooklyn

    method estaPago() = pago
    method precio() = 120
    method pagarPaquete(cuotas) { paga += cuotas * 10 }
    method puedeSerEntregado(mensajero) = mensajero.puedeLlegarA_Con_(destino, self)
    method fijarDestino(dest) { destino = dest }
}