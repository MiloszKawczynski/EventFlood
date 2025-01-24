event_inherited();

ui = new UI();

with(ui)
{
	mainLayer = new Layer();
	mainLayer.setGrid(10, 10, false);

	airBar = new GradientBar(1); 
	//airBar.setScale(10, 10);
	airBar.setSprites(ats_gradientBarBackground, ats_gradientBarValueBasic, ats_gradientBarFront);
	
	mainLayer.addComponent(1, 1, airBar);

	pushLayer(mainLayer);
}

window_set_fullscreen(true);