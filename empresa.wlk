import mensajeros.*
import destinos.*

object empresaMensajeria {

    const mensajeros = []
    var paquetesPendientes = []
    var facturacion = 0
    
    method contratarMensajeros(mensajero) {mensajeros.add(mensajero)}
    method despedirMensajero(mensajero) {mensajeros.remove(mensajero)} 
    method despedirATodos() {mensajeros.clear()}
    method entregarPaquete(destino, p) {
        if (mensajeros.anyOne().puedeLlegarA_Con_(destino, p)) {
            facturacion += p.precio()
        }
        else{
            paquetesPendientes.add(p)
        }
    }
    method enviarPaquetes(listaPaquetes) {
        if (listaPaquetes.all({p => self.puede_SerLlevadoPorLaEmpresa(p)})) {
            facturacion += listaPaquetes.sum({p => p.precio()})
        }
        else{
            paquetesPendientes += listaPaquetes
        }
    }
    
    method paquetePendienteMasCaro() = paquetesPendientes.max({p => p.precio()})
    method facturacion() = facturacion 
    method paquetesPendientes() = paquetesPendientes
    method mostrarMensajeros() = mensajeros 
    method esGrande() = mensajeros.size() > 2
    method mensajerosPuedeEntregarPaquete(destino, p) = mensajeros.first().puedeLlegarA_Con_(destino, p)
    method ultimoMensajeroPeso() = mensajeros.last().peso()
    method puede_SerLlevadoPorLaEmpresa(p) = mensajeros.any({m => p.puedeSerEntregado(m)})
    method mensajerosQuePuedenLlevarPaquete(paquete) = mensajeros.filter({m => paquete.puedeSerEntregado(m)})
    method sobrepeso() = mensajeros.sum({m => m.peso()})  / mensajeros.size() > 500
}