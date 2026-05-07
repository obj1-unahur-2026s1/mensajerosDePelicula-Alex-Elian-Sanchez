import paquete.*
import mensajeros.*
object puenteBrooklyn {
    method puedePasar(mensajero, p) = mensajero.peso() <= 1000 && p.estaPago()
}

object matrix {
    method puedePasar(mensajero, p) = mensajero.puedeLlamar() && p.estaPago()
}