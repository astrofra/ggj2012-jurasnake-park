/*
	File: scripts/scene_title
	Author: Astrofra
*/

	Include("scripts/base_scene.nut")

//------------
class	TitleUI	extends	BaseUI
//------------
{

	title_widget			=	0
	title_widget_shadow		=	0
	overlay					=	0

	best_score				=	0

	constructor(_ui)
	{
		local	_title_text = "JURASNAKE PARK"
		base.constructor(_ui)

		overlay = UIAddSprite(ui, -1, EngineLoadTexture(g_engine, "ui/main_menu.png"), 0, 300, 1024, 512)
		WindowSetPivot(overlay, 512, 256)
		WindowSetPosition(overlay, 640, 580)
		WindowSetScale(overlay, 1.75, 1.5)

		title_widget = CreateLabel(ui, _title_text, 0, 200, 180, 1280, 200, Vector(255, 80, 10, 255), g_ui_default_font, TextAlignCenter)
		title_widget_shadow = CreateLabel(ui, _title_text, 0, 10, 180, 1280, 200, Vector(0, 0, 0, 128), g_ui_default_font, TextAlignCenter)
		WindowSetZOrder(title_widget_shadow[0], 0.7)
		WindowSetParent(title_widget_shadow[0], title_widget[0])
		WindowSetCommandList(title_widget[0], "loop;toscale 0,1,1;toscale 2,1,1.25;toscale 2,1.0,1.0;next;")

		local	press_a_shadow = CreateLabel(ui, "Press A to Start", 0, 5, 80, 1280, 200, Vector(0,0,0,128), g_ui_default_font, TextAlignCenter)
		local	press_a = CreateLabel(ui, "Press A to Start", 0, 450, 80, 1280, 200, g_hud_font_color, g_ui_default_font, TextAlignCenter)
		WindowSetParent(press_a_shadow[0], press_a[0])
		WindowSetCommandList(press_a[0], "loop;toalpha 0,0.75;nop 1;toalpha 0,1;nop 1;next;")

		local	best_score_shadow = CreateLabel(ui, "Best Score Today : " + g_best_score.tostring(), 0, 10, 100, 1280, 200, Vector(0,0,0,128), g_ui_default_font, TextAlignCenter)
		best_score = CreateLabel(ui, "Best Score Today : " + g_best_score.tostring(), 0, 600, 100, 1280, 200, g_hud_font_color, g_ui_default_font, TextAlignCenter)
		WindowSetParent(best_score_shadow[0], best_score[0])

		local	creadits = CreateLabel(ui, "MrKaox (Art) | Djent (Sound) | Astrofra (Code)" + "\n" + "Made with TVPaint & GameStart", 0, 870, 30, 1280, 100, g_hud_font_color, "ahronbd", TextAlignCenter)

	}
}

/*!
	@short	TitleScene
	@author	Astrofra
*/
class	SceneTitle	extends	BaseScene
{
	title_ui				=	0
	pad_device				=	0
	title_music				=	0

	/*!
		@short	OnUpdate
		Called each frame.
	*/
	function	OnUpdate(scene)
	{
		base.OnUpdate(scene)
		title_ui.UpdateCursor()

		if (DeviceKeyPressed(pad_device, 82))
		{
			MixerChannelSetLoopMode(g_mixer, title_music, LoopNone)
			MixerChannelStop(g_mixer, title_music)
			MixerChannelStopAll(g_mixer)
			ProjectGetScriptInstance(g_project).ProjectGotoScene("scenes/screen_tutorial.nms")
		}
	}

	/*!
		@short	OnSetup
		Called when the scene is about to be setup.
	*/
	function	OnSetup(scene)
	{
		base.OnSetup(scene)
		title_ui = TitleUI(SceneGetUI(scene))
	}

	constructor()
	{
		base.constructor()
		pad_device = GetInputDevice("xinput0")
		title_music =	MixerStreamStart(g_mixer, "audio/music/music_sans_piano.ogg")
		MixerChannelSetLoopMode(g_mixer, title_music, LoopRepeat)		
	}
}
