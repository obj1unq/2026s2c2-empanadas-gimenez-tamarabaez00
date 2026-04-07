object galvan{
  var sueldo = 15000
  var dinero = 0
  var deuda = 0

  method cambiarSueldo(sueldoNuevo) { //para cambiar el sueldo de galván
    sueldo= sueldoNuevo
  }

  method sueldo() {
    return sueldo 
  }

  method dinero() {
    return dinero
  }

  method deuda() {
    return deuda
  }

  method gastar(cuanto) {
    if ((dinero - cuanto) > 0){
        dinero= dinero - cuanto
    } 
    else {
        deuda= deuda + cuanto - dinero   // descuenta el dinero disponible para pagar toda la deuda o una parte de ella
        dinero= 0 
    }
  }

  method cobrar() {
      if (self.sueldo() - deuda >0 ){
          dinero = dinero + self.sueldo() - deuda
          deuda= 0
      }
      else{
          deuda = deuda - self.sueldo()
      }
  }

}

object baigorria {
  var cantidadEmpanadasVendidas = 0 

  const precioPorEmpanada = 15

  var totalCobrado = 0

  method sueldo() {
    return cantidadEmpanadasVendidas * precioPorEmpanada
  }   

  method vendidas(cantidad) {
    cantidadEmpanadasVendidas = cantidadEmpanadasVendidas + cantidad
  }

  method cobrar() {
    totalCobrado = totalCobrado + self.sueldo()
    cantidadEmpanadasVendidas = 0 //cada vez que invoquemos "cobrar" se reinicia el contador 
                            //de empanadas vendidas para que no cobre por las anteriores
  }

  method totalCobrado() {
    return totalCobrado
  }
}

object gimenez {
  var fondo = 300000

  method pagarSueldo(empleado) {
    fondo= fondo - empleado.sueldo()
    empleado.cobrar() 
  }

  method fondoActual() {
    return fondo
  }

}