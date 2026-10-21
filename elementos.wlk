import plagas.*

class Barrio {
  var property elementos = []
  var property calidadBasica = 45

  method elementoEsBueno(elemento) {
    return elemento.esBueno(calidadBasica)
  }

  method elementosQueSonBuenos() {
    return elementos.filter({e => e.esBueno(calidadBasica)})
  }

  method esCopado() {
    return self.elementosQueSonBuenos().size() > elementos.size() / 2
  }
}

class Elemento {
  method esBueno(nivelDeCalidadBasica) {
    
  }
}

class Hogar inherits Elemento{
  var property nivelDeMugre = 0  
  var property confort = 50

  override method esBueno(nivelDeCalidadBasica) {
      return confort > nivelDeMugre
  }

  method sufrirAtaque(plaga){
      nivelDeMugre -= plaga.nivelDaño()
  }
}

class Huerta inherits Elemento{
  var property capacidadDeProducion = 0

  override method esBueno(nivelDeCalidadBasico){
    return capacidadDeProducion > nivelDeCalidadBasico
  }

  method sufrirAtaque(plaga){
        capacidadDeProducion -= (plaga.nivelDaño() * 0.1 + self.dañoPorEnfermedad(plaga)) 
    }

    method dañoPorEnfermedad(plaga){
        return if(plaga.transmiteEnfermedad()){10}else{0}
    }
}

class Mascota inherits Elemento{
  var property nivelDeSalud = 260

  override method esBueno(nivelDeCalidadBasica) {
    return nivelDeSalud > 250
  }

  method sufrirAtaque(plaga){
        nivelDeSalud -= self.dañoPorEnfermedad(plaga)
    }

    method dañoPorEnfermedad(plaga){
        return if(plaga.transmiteEnfermedad()){plaga.nivelDaño()}else{0}
    }
}