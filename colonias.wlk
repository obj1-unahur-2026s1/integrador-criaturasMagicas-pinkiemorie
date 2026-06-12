class Colonia {
    const criaturas = []

    method poderOfensivo() = criaturas.sum({c => c.poderOfensivo()})
    method cantCriaturasFormidables() = criaturas.count({c => c.esFormidable()})

    method conquistarArea(area) {
        if (self.poderOfensivo() > area.poderDefensivo()) {
            area.cambiarAColonia(self)
        }

        else {
            criaturas.forEach({c => c.disminuirPoderMagicoEnCantidad(c.poderMagico() * 0.15)})
        }
    }
}

class Area {
    var coloniaQueLaHabita

    method coloniaQueLaHabita() = coloniaQueLaHabita
    method poderDefensivo()

    method cambiarAColonia(colonia) {
        coloniaQueLaHabita = colonia
    }
}

class Claro inherits Area {
    override method poderDefensivo() = coloniaQueLaHabita.poderOfensivo() + 100
}

class Castillo inherits Area {
    override method poderDefensivo() = coloniaQueLaHabita.cantCriaturasFormidables() * 200
}