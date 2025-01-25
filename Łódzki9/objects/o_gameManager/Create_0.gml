event_inherited();

ui = new UI();

with(ui)
{
	mainLayer = new Layer();
	mainLayer.setGrid(10, 10, false);

	airBar = new GradientBar(1); 
	airText = new Text("Air", f_main, fa_center, fa_middle);
	
	with(airBar)
	{
		var drawAirBar = function()
		{					
			var widthBackground = 200;
			var heightBackground = 360;
			
			if (!surface_exists(surface))
			{
				surface = surface_create(widthBackground, heightBackground);
			}
			
			surface_set_target(surface);
		
			draw_clear_alpha(c_white, 0);
			
			var x1 = 0;
			var y1 = heightBackground * (1 - value);
			var x2 = x1 + widthBackground;
			var y2 = y1 + heightBackground;
			
			draw_set_color(c_aqua);
			draw_sprite(s_tank, 0, widthBackground / 2, heightBackground / 2);
			gpu_set_colorwriteenable(1, 1, 1, 0);
			draw_rectangle(x1, y1, x2, y2, false);
			draw_sprite(s_tank, 1, widthBackground / 2, heightBackground / 2);
			gpu_set_colorwriteenable(1, 1, 1, 1);
		
			surface_reset_target();
		
			draw_surface_ext(surface, posX, posY, scaleX, scaleY, 0, c_white, 1);
		}
		
		setDrawFunction(drawAirBar, 200, 360);
	}
	
	heads = new Group();
	heads.setGrid(5, 1, false);
	
	Julka = new Output();
	Julka.state.setSpriteSheet(s_headBlack, 0);
	
	Karolina = new Output();
	Karolina.state.setSpriteSheet(s_headBlack, 1);
	
	Milosz = new Output();
	Milosz.state.setSpriteSheet(s_headBlack, 2);
	
	Potax = new Output();
	Potax.state.setSpriteSheet(s_headBlack, 3);
	
	heads.addComponent(2, 1, Julka);
	heads.addComponent(6, 1, Karolina);
	heads.addComponent(10, 1, Milosz);
	heads.addComponent(14, 1, Potax);
	
	mainLayer.addComponent(0.25, 0.5, airBar);
	mainLayer.addComponent(0.5, 2.5, airText);
	mainLayer.addComponent(1, 0.5, heads);

	pushLayer(mainLayer);
}

window_set_fullscreen(true);

xVal = 0;
yVal = 0;