
class Persona{
	const property lEnfermedades = []
	var temperatura
	var celulasTotales 
	var dias = 0
	
	method pasaUnDia(){
		dias +=1
		lEnfermedades.forEach({x => x.efectoQueProvoca()})
	}
	method diasTrancurridos() = dias
	
	method cantidadDeEnfermedades() = lEnfermedades.size()
	
	method contrae(unaEnfermedad) {
		if (self.cantidadDeEnfermedades() < 5){
			lEnfermedades.add(unaEnfermedad)
		}else {}
		unaEnfermedad.atacarA(self)	
	}
	
	 method temperatura() = temperatura
	 method aumentaDeTemperatura(num){
	 	temperatura = 45.min(temperatura + num)
	 }
	 method disminuyeLaTemperatura(num){
	 	temperatura = 0.max(temperatura - num)
	 }
	 
	method estaEnComa(){
		return (temperatura >= 45 or celulasTotales <= 1000000)
	}
	
	method celulasTotales() = celulasTotales

	method disminuyenLasCelulas(cantidad){
		celulasTotales = 0.max(celulasTotales - cantidad)
	}

	method celulasAmenazadasPorEnfermedadesAgresivas(){
		return lEnfermedades.filter({x => x.esAgresiva()}).sum({x =>x.cantDeCelulasAmenazadas()})
	}
	method enfermedadMasAmenazante(){
		return lEnfermedades.max({x => x.cantDeCelulasAmenazadas()})
	}
	method recibeMedicamento(cantidad){
		lEnfermedades.forEach({x => x.disminuyeCantDeCelulasAmenazadas(cantidad * 15)})
	}
	
	method totalDeCelulasAmenzadas(){
		return lEnfermedades.sum({x => x.cantDeCelulasAmenazadas()})
	}
}

class Medico inherits Persona{
	var dosisDeMedicamento
	method dosisDeMedicamento() = dosisDeMedicamento
	method atenderA(persona){
		persona.recibeMedicamento(dosisDeMedicamento)
	}
	 
}

class MedicoJefe inherits Medico{
	var medicoSubordinado
	
	override method dosisDeMedicamento() = medicoSubordinado.dosisDeMedicamento()
	override method atenderA(persona){
		medicoSubordinado.atenderA(persona)
	}
}