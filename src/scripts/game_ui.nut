/* Game UI
*/

//------------
class	GameUI	extends	BaseUI
//------------
{
	score_widget		=	0
	life_widget			=	0
	life_icons			=	0
	water_widget		=	0
	water_icons			=	0
	game_over_widget	=	0
	button_handler		=	0
	button_off			=	0
	button_on			=	0
	score_feedback		=	0

	//--------------
	constructor(_ui)
	//--------------
	{
		base.constructor(_ui)
		score_widget	=	CreateLabel(ui, CreateScoreString(0), 0, 0, 60, 600, 80, g_hud_font_color, g_ui_default_font)

		//	Life
		life_widget	=	CreateLabel(ui, "Life :", 380, 0, 60, 600, 80, g_hud_font_color, g_ui_default_font)
		life_icons = []
		local	_life_texture = EngineLoadTexture(g_engine, "ui/life.png")
		local	_life_handler = UIAddWindow(ui, -1, 0, 0, 1, 1)
		WindowSetScale(_life_handler, 0.25, 0.25)
		WindowSetPosition(_life_handler, 505, 0)
		life_icons.append(UIAddSprite(ui, -1, _life_texture, 0, 0, 256, 256))
		life_icons.append(UIAddSprite(ui, -1, _life_texture, 256, 0, 256, 256))
		life_icons.append(UIAddSprite(ui, -1, _life_texture, 256 * 2, 0, 256, 256))
		foreach(_life in life_icons)
			WindowSetParent(_life, _life_handler)

		//	Water
		water_widget	=	CreateLabel(ui, "Water :", 750, 0, 60, 600, 80, g_hud_font_color, g_ui_default_font)
		water_icons = []
		local	_water_texture = EngineLoadTexture(g_engine, "ui/water.png")
		local	_water_handler = UIAddWindow(ui, -1, 0, 0, 1, 1)
		WindowSetScale(_water_handler, 0.5, 0.5)
		WindowSetPosition(_water_handler, 925, 0)
		water_icons.append(UIAddSprite(ui, -1, _water_texture, 0, 0, 128, 128))
		water_icons.append(UIAddSprite(ui, -1, _water_texture, 128, 0, 128, 128))
		water_icons.append(UIAddSprite(ui, -1, _water_texture, 128 * 2, 0, 128, 128))
		//water_icons.append(UIAddSprite(ui, -1, _water_texture, 128 * 3, 0, 128, 128))
		//water_icons.append(UIAddSprite(ui, -1, _water_texture, 128 * 4, 0, 128, 128))
		foreach(_water in water_icons)
			WindowSetParent(_water, _water_handler)

		//	Jump button
		button_handler = UIAddWindow(ui, -1, 0, 0, 1, 1)
		button_on = UIAddSprite(ui, -1, EngineLoadTexture(g_engine, "ui/bouton0.png"), 0,0, 256, 128)
		button_off = UIAddSprite(ui, -1, EngineLoadTexture(g_engine, "ui/bouton1.png"), 0,0, 256, 128)
		WindowSetCommandList(button_off, "loop;toalpha 0,1; nop 0.125;toalpha 0,0;nop 0.125;next;")
		WindowSetCommandList(button_on, "loop;toalpha 0,0; nop 0.125;toalpha 0,1;nop 0.125;next;")
		WindowSetParent(button_on, button_handler)
		WindowSetParent(button_off, button_handler)
		WindowSetPosition(button_handler, 640 - 128, 200)
		WindowShow(button_handler, false)

		score_feedback = CreateLabel(ui, "+100", 0, 180, 150, 1280, 200, g_hud_font_color, g_ui_default_font, TextAlignCenter)
		WindowShow(score_feedback[0], false)

		game_over_widget = CreateLabel(ui, "You Just Kissed the Serpent", 0, 500, 80, 1280, 200, g_hud_font_color, g_ui_default_font, TextAlignCenter)
		WindowShow(game_over_widget[0], false)
	}

	function	ShowScoreFeedBack(_value)
	{
		WindowResetCommandList(score_feedback[0])
		WindowShow(score_feedback[0], false)
		TextSetText(score_feedback[1], _value)
		WindowSetCommandList(score_feedback[0], "toalpha 0,0;show;toalpha 0.1,1;nop 3;toalpha 0.2,0;hide;")
		print("ShowScoreFeedBack()")
	}

	function	ShowJumpButton(_flag)
	{
		WindowShow(button_handler, _flag)
	}

	function	ShowGameOverMessage()
	{
		WindowSetCommandList(game_over_widget[0], "toalpha 0,0;show;toalpha 0.1,1;nop 4;toalpha 0.25,0;")
	}

	function	IsGameOverMessageDone()
	{
		return (WindowIsCommandListDone(game_over_widget[0]))
	}

	function	CreateScoreString(score)
	{
		return ("Score : " + score.tostring())
	}

	function	UpdateScore(score)
	{
		TextSetText(score_widget[1], CreateScoreString(score))
	}

	function	UpdateLife(life)
	{
		foreach(_life in life_icons)
			WindowShow(_life, false)

		local n
		for(n = 0; n < life; n++)
			WindowShow(life_icons[n], true)
	}

	function	UpdateWater(water)
	{
		water = water.tointeger()
		foreach(_water in water_icons)
			WindowShow(_water, false)

		local n
		for(n = 0; n < water; n++)
			WindowShow(water_icons[n], true)
	}
}