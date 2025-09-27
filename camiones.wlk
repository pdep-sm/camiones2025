import cosos.*
import estados.*
class Camion {
  var property estado
  const cargaMaxima
  const cososPorDestino = new Dictionary()

  // Pto 1 - Pto 3 - Pto 13.a
  method carcoso(coso, destino) {
    if (self.puedeAceptar(coso)) {
      const cosos = cososPorDestino.getOrElse(destino, { [] } )
      cosos.add(coso)
      cososPorDestino.put(destino, cosos)
    }
    //TODO
  }
  
  method cosos() = cososPorDestino.values().flatten()

  // Pto 2
  method puedeAceptar(coso) = estado.puedeAceptar(coso,self)

  method puedeCargar(coso) = not self.superaCargaMaxima(coso)

  method superaCargaMaxima(coso) =  self.cargaActual() + coso.peso() > cargaMaxima

  method cargaActual() = self.cosos().sum{ coso => coso.peso() }

  method tieneCargaMinimaParaPartir() = self.cargaActual() >= cargaMaxima * 0.75

  // Pto 4.a
  method salirDeReparacion() = estado.salirDeReparacion(self)

  // Pto 4.b
  method entrarEnReparacion() = estado.entrarEnReparacion(self)

  // Pto 4.c
  method salirDeViaje() = estado.salirDeViaje(self)

  // Pto 4.d
  method volverDeViaje() = estado.volverDeViaje(self)

  method cargaEnViaje() = estado.cargaEnViaje(self)

  // Pto 7
  method elementos() = self.cosos().map{ coso => coso.elemento() }.asSet()

  // Pto 5
  method estaListoParaPartir() = estado.estaListoParaPartir(self)

  method estaCargando(elemento) = 
    not self.estaListoParaPartir() and 
      self.elementos().contains(elemento)

  // Pto 9
  method elementosEnComun(camion) = 
    self.elementos().intersection(camion.elementos()) 

  // Pto 10
  method cosoMasLiviano() = self.cosos().min{ coso => coso.peso() }

  method cantidadDeCosos() = self.cosos().size()

  // Pto 13.b
  method llegarA(destino) {
    const cosos = cososPorDestino.getOrElse(destino, { [] })
    destino.guardarCarga(cosos)
    cososPorDestino.remove(destino)
    if (cososPorDestino.isEmpty()) 
      self.volverDeViaje()
  }
}

//Pto 13.c
class CamionFrigorifico inherits Camion {

  override method puedeCargar(coso) =
    super(coso) and coso.soportaTemperatura(self.temperaturaMaxima())

  method temperaturaMaxima() = camionFrigorifico.temperaturaMaxima()

}

object camionFrigorifico {
  var property temperaturaMaxima = 10
}