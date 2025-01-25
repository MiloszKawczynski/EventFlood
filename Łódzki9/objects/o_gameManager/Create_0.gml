event_inherited();

ui = new UI();

with(ui)
{
	mainLayer = new Layer();
	mainLayer.setGrid(10, 10, false);

	airBar = new GradientBar(1); 
	
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
			
			draw_sprite(s_tank, 0, widthBackground / 2, heightBackground / 2);
			gpu_set_colorwriteenable(1, 1, 1, 0);
			draw_set_color(c_aqua);
			draw_rectangle(x1, y1, x2, y2, false);
			gpu_set_colorwriteenable(1, 1, 1, 1);
			draw_sprite(s_tank, 1, widthBackground / 2, heightBackground / 2);
		
			surface_reset_target();
		
			draw_surface_ext(surface, posX, posY, scaleX, scaleY, 0, c_white, 1);
		}
		
		setDrawFunction(drawAirBar, 200, 360);
	}
	
	mainLayer.addComponent(1, 1, airBar);

	pushLayer(mainLayer);
}

window_set_fullscreen(true);

xVal = 0;
yVal = 0;