import elementos.*

class Plagas {

    var property poblacion
    
    method nivelDaño()

    method transmiteEnfermedad(){
        return poblacion > 10
    }

    method atacar(elemento){

        elemento.sufrirAtaque(self)
        poblacion += 0.1 * poblacion
    }
}  



class Cucarachas inherits Plagas {

    var property pesoPromedio

    override method nivelDaño(){
        return poblacion.div(2)
    }

    override method transmiteEnfermedad(){
        return pesoPromedio >= 10 && super()
    }
    override method atacar(elemento){
        
        super(elemento)
        pesoPromedio += 2
    }
}

class Pulgas inherits Plagas {

    override method nivelDaño(){
        return poblacion * 2
    }
}

class Garrapatas inherits Pulgas {

    override method atacar(elemento){
        poblacion += 0.2 * poblacion
        elemento.sufrirAtaque(self)
    }
}

class Mosquitos inherits Plagas {

    override method nivelDaño(){
        return poblacion
    }

    override method transmiteEnfermedad(){
        return poblacion % 3 == 0 && super()
    }
}