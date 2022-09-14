/// @description Insert description here

//
dar_dano = false;

//Método de colisão
colisao = function() {
	if (dar_dano) {
		var _inimigo = instance_place(x, y, obj_inimigo_pai);
		if (_inimigo) {
			_inimigo.leva_dano();
			_inimigo.dar_dano = true;
			instance_destroy();
		}
	}
}







