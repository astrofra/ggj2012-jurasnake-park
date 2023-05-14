/*
	File: scripts/screen_game_over.nut
	Author: Astrofra
*/

/*!
	@short	LogoScreen
	@author	Astrofra
*/
class	TutorialScreen
{
	display_timer		=	0
	pad_device			=	0
	
	/*!
		@short	OnUpdate
		Called each frame.
	*/
	function	OnUpdate(scene)
	{
		if ((DeviceKeyPressed(pad_device, 82)) || ((g_clock - display_timer) > SecToTick(Sec(10.0))))
		{
			ProjectGetScriptInstance(g_project).ProjectGotoScene("scenes/level_0.nms")
			MixerChannelStopAll(g_mixer)
		}
	}

	/*!
		@short	OnSetup
		Called when the scene is about to be setup.
	*/
	
	function	ShowStoryImage(scene)
	{
		print("GameOverScreen::ShowStoryImage()")
		local	story_texture, fname
		local	ui = SceneGetUI(scene)

//		CreateOpaqueScreen(ui)
		

		fname = "ui/tutorial.png"

		if (FileExists(fname))
		{
			story_texture = EngineLoadTexture(g_engine, fname)
			local	story_image
			story_image = UIAddSprite(ui, -1, story_texture, 0, 0, TextureGetWidth(story_texture), TextureGetHeight(story_texture))
			WindowShow(story_image, false)
			WindowSetPivot(story_image, TextureGetWidth(story_texture) * 0.5, TextureGetHeight(story_texture) * 0.5)
			WindowSetPosition(story_image, g_screen_width * 0.5, g_screen_height * 0.5)
			WindowSetOpacity(story_image, 0.0)
			WindowSetScale(story_image, 1.5, 1.5)
			WindowSetCommandList(story_image, "nop 0.5; show; toalpha 2.0, 1.0+toscale 10.0,1.75,1.75;")
		}
		else
		{
			print("LevelEndUI::ShowStoryImage() : Cannot find file '" + fname + "'.")
		}
	}
	
	function	OnSetupDone(scene)
	{
		ShowStoryImage(scene)
	}
	
	function	OnSetup(scene)
	{
		display_timer = g_clock
		pad_device = GetInputDevice("xinput0")
	}
}
