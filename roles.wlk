class Rol {
    method poderExtra()
    method esRolExtraordinario(criatura)
}

class Guardian inherits Rol {
    override method poderExtra() = 100
    override method esRolExtraordinario(criatura) = criatura.poderMagico() > 50
}

class Domador inherits Rol {
    const mascotasMitologicas = []

    override method poderExtra() = self.cantMascotasConCuernos() * 150
    method cantMascotasConCuernos() = mascotasMitologicas.filter({m => m.tieneCuernos()})
    override method esRolExtraordinario(criatura) = criatura.poderMagico() >= 15 and self.sonTodasMascotasVeteranas()
    method sonTodasMascotasVeteranas() = mascotasMitologicas.all({m => m.edad() >= 10})
    
    method agregarMascota(mascota) {
        mascotasMitologicas.add(mascota)
    }
}

class Hechicero inherits Rol {
    override method poderExtra() = 0
    override method esRolExtraordinario(criatura) = true
}