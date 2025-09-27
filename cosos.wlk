class Coso {
  const temperaturaMaxima

  method soportaTemperatura(temp) = temperaturaMaxima >= temp

  method peso()
  method elemento()

}
class Bulto inherits Coso {
  const pesoPallet
  const caja
  const cantidadCajas

  override method peso() = pesoPallet + caja.peso() * cantidadCajas 

  override method elemento() = caja.elemento()
}


class Caja inherits Coso {
  const property peso
  const property elemento
}

class Bidon inherits Coso {
  const liquido
  const litros
  const densidad

  override method peso() = densidad * litros

  override method elemento() = liquido
}

