class CamionesException inherits DomainException {

}


class NoSePuedeCargarException inherits CamionesException(message = "Imposible cargar coso") {

}


class CargaMaximaException inherits CamionesException(message = "Carga máxima superada") {
    const coso
}

class TemperaturaException inherits CamionesException {

}

class EstadoInvalidoException inherits CamionesException {

}


