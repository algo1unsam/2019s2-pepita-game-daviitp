import ciudades.*
import wollok.game.*
import comidas.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property position = game.at(3,3)
	method image() = if (self.energia() > 100) "pepita-gorda-raw.png" else "pepita.png"

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			if (self.alcanzaEnergia(unaCiudad.position())) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
			self.yaLlegue()
			}
		else {self.dameComida()}
		}
	}
	
	method irAComer(comida) {
		self.move(comida.position())
		self.come(comida)
		comida.teComieron()
	}
	
	
	method yaLlegue() {
		game.say(self,"Ya llegue a " + ciudad)
	}
	
	method alcanzaEnergia(nuevaPosicion) {
		return energia >= position.distance(nuevaPosicion)
	}
	
	method dameComida() {
		game.say(self,"Dame de comer primero")
	}
	
	method energia2() {
		return energia
	}
	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
	}	
}
