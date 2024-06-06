import personas.*

class Enfermedad{
	var cantDeCelulasAmenazadas
	var persona = null
	
	method atacarA(unaPersona){persona = unaPersona}
	
	method efectoQueProvoca(){}
	
	method cantDeCelulasAmenazadas() = cantDeCelulasAmenazadas
	
	method disminuyeCantDeCelulasAmenazadas(num) {
		cantDeCelulasAmenazadas = 0.max(cantDeCelulasAmenazadas - num)
	}
}
class Infecciosa inherits Enfermedad{
	
	override method efectoQueProvoca() {
		 persona.aumentaDeTemperatura(cantDeCelulasAmenazadas * 0.001)		 
	 }
	method reproducirse() {
		 cantDeCelulasAmenazadas = cantDeCelulasAmenazadas + (cantDeCelulasAmenazadas * 2)
	}
	method esAgresiva(){
		return (cantDeCelulasAmenazadas > persona.celulasTotales() * 0.10  )
	}
}
class Autoinmune inherits Enfermedad {
	override method efectoQueProvoca() { persona.disminuyenLasCelulas(cantDeCelulasAmenazadas) }
	method reproducirse(){}
	method esAgresiva(){
		return persona.diasTrancurridos() == 30
	}
}
class Muerte inherits Enfermedad{
	override method cantDeCelulasAmenazadas() = 0
	override method efectoQueProvoca(){
		persona.disminuyeLaTemperatura(persona.temperatura())
}
	method reproducirse(){}
	method esAgresiva() = true
}

