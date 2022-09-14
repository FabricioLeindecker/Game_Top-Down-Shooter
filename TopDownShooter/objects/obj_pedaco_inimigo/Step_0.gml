/// @description Insert description here

//Diminui a velocidade e o alpha
speed		*= 0.92;
image_alpha	-= 0.005;

//Destroi os pedaços quando ficam invisíveis
if (image_alpha <= 0) instance_destroy();

colisao();







