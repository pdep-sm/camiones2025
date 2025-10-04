import excepciones.*

class Estado {

  method puedeAceptar(coso, camion) = false

  method validarCargarCoso(coso, camion) {
    throw new EstadoInvalidoException(message = "No se encuentra en estado disponible")
  }

  method estaListoParaPartir(camion) = false

  method cargaEnViaje(camion) = 0

  method salirDeReparacion(camion) {
     throw new EstadoInvalidoException(message = "No está en reperación")
  }

  method entrarEnReparacion(camion) {
    throw new EstadoInvalidoException(message = "No está disponible")
  }

  method salirDeViaje(camion) {
    throw new EstadoInvalidoException(message = "No está disponible")
  }

  method volverDeViaje(camion) {
    throw new EstadoInvalidoException(message = "No está en viaje")
  }
}

object disponible inherits Estado {

  override method puedeAceptar(coso, camion) = camion.puedeCargar(coso)

  override method validarCargarCoso(coso, camion) {
    camion.validarPuedeCargar(coso)
  }

  override method estaListoParaPartir(camion) = camion.tieneCargaMinimaParaPartir()

  override method entrarEnReparacion(camion) {
    camion.estado(enReparacion)
  }

  override method salirDeViaje(camion) {
    camion.estado(enViaje)
  }

}

object enViaje inherits Estado {

  override method cargaEnViaje(camion) = camion.cargaActual()

  override method volverDeViaje(camion) {
    camion.estado(disponible)
  }

}

object enReparacion inherits Estado {

  override method salirDeReparacion(camion) {
    camion.estado(disponible)
  }

}
