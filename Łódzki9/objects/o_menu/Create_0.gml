event_inherited();

ui = new UI();

with(ui)
{
	mainLayer = new Layer();
	mainLayer.setGrid(6, 3, false);

	var quitFun = function()
	{
		game_end();
	}
	
	var playFun = function()
	{
		room_goto_next();
	}
	
	quit = new Button(quitFun);
	quit.setSpriteSheet(s_buttonsQuit);
	
	play = new Button(playFun);
	play.setSpriteSheet(s_buttonsPlay);
	
	credits = new Button(quitFun);
	credits.setSpriteSheet(s_buttonsCredits);
	
	mainLayer.addComponent(2.25, 2, quit);
	mainLayer.addComponent(3.75, 2, credits);
	mainLayer.addComponent(2.95, 1.85, play);

	pushLayer(mainLayer);
}

window_set_fullscreen(true);