import roles.*

class Criatura {
    var rolEnParque

    method poderMagico() 
    method astucia()
    method rolEnParque()
    method poderOfensivo() = self.poderMagico() * 10 + rolEnParque.poderExtra()
    method esFormidable() = self.esAstuta() or self.esExtraordinaria(self)
    method esAstuta()
    method esExtraordinaria(criatura) = rolEnParque.esRolExtraordinario(criatura)

    method ritualDeCambioDeRol() {
        if (rolEnParque == Guardian) {
            rolEnParque = new Domador()
            // rolEnParque.agregarMascota(mascota = new Mascota())
        }

        else if (rolEnParque == Hechicero) {
            rolEnParque = new Guardian()
        }

        else {
            self.cambiarAHechiceroSiPuede()
        }
    }

    method cambiarAHechiceroSiPuede() {
        if (rolEnParque.cantMascotasConCuernos() > 0) {
            rolEnParque = new Hechicero()
        }

        else {
            self.error("No pudo completarse el ritual")
        }
    }
}

class Hada inherits Criatura {
    var kilometrosQuePuedeVolar = 2

    method kilometrosQuePuedeVolar() = kilometrosQuePuedeVolar
    override method esAstuta() = self.astucia() > 50
    override method esExtraordinaria(criatura) = super(self) and kilometrosQuePuedeVolar > 10

    method aumentarKilometros() {
        kilometrosQuePuedeVolar = 25.min(kilometrosQuePuedeVolar + 1)
    }
}

class Duende inherits Criatura {
    override method poderOfensivo() = super() * (super() * 0.1)
    override method esAstuta() = false
}