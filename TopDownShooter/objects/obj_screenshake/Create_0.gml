/// @description Insert description here

//Valor para tremer a tela
global.shake = 0;

//Método para a tela tremer
tremer = function() {
	view_xport[0] = irandom_range(-global.shake, global.shake);
	view_yport[0] = irandom_range(-global.shake, global.shake);
	if (global.shake > 0) {
		global.shake *= 0.9;
		if (global.shake >= 0.1) global.shake = 0;
	}
}



