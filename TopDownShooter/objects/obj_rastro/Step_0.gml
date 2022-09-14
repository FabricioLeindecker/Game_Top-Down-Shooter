/// @description Insert description here

//Diminui o alpha
image_alpha	-= 0.005;

//Destroi o rastro quando ele fica invísivel
if (image_alpha <= 0) instance_destroy();






