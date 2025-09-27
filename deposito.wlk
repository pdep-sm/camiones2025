class Deposito {
  const camiones = #{}
  const property cosos = #{}

  // Pto 6
  method totalDeCargaEnViaje() =
    camiones.sum{ camion => camion.cargaEnViaje() }

  // Pto 8
  method camionesCargando(elemento) = 
    camiones.filter{ camion => camion.estaCargando(elemento) }

  // Pto 11
  method camionConMasCosos() = camiones.max{ camion => camion.cantidadDeCosos() }

  // Pto 12
  method productosEnConjunto(deposito) = 
    cosos.union(deposito.cosos()).sortedBy{ c1,c2 => c1.peso() < c2.peso() }
                              //.sortedBy{ c1,c2 => c1.masLivianoQue(c2) }

  method guardarCarga(otrosCosos) {
    cosos.addAll(otrosCosos)
  }
}
