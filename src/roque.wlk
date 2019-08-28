import ciudades.*
import wollok.game.*
import comidas.*

object roque {
	
	var property comidaGuardada = ""
	var property position = game.at(8,8)
	
	
		method image() = "pepona.png"
		
		method move(nuevaPosicion) {
			self.position(nuevaPosicion)
	}
	
	
	
	
	
}