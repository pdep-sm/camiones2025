class Estado {

  method puedeAceptar(coso, camion) = false

  method estaListoParaPartir(camion) = false

  method cargaEnViaje(camion) = 0

  method salirDeReparacion(camion) {
    //TODO
  }

  method entrarEnReparacion(camion) {
    //TODO
  }

  method salirDeViaje(camion) {
    //TODO
  }

  method volverDeViaje(camion) {
    //TODO
  }
}

object disponible inherits Estado {

  override method puedeAceptar(coso, camion) = camion.puedeCargar(coso)

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
