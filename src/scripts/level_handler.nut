/*
	File: scripts/level_handler.nut
	Author: Astrofra
*/

class	BonusScript
{
/*<
	<Parameter =
		<is_life = <Name = "Life Bonus"> <Type = "bool"> <Default = 1>>
		<is_water = <Name = "Water Bonus"> <Type = "bool"> <Default = 0>>
		<is_amber = <Name = "Amber Bonus"> <Type = "bool"> <Default = 0>>
		<is_savage = <Name = "Savage"> <Type = "bool"> <Default = 0>>
		<is_wing = <Name = "Wing"> <Type = "bool"> <Default = 0>>
	>
>*/
	scene		=	0

	is_life		=	true
	is_water	=	false
	is_amber	=	false
	is_savage	=	false
	is_wing		=	false

	sfx_water	=	0
	sfx_life	=	0
	sfx_score	=	0
	sfx_savage	=	0

	ace_deleter			=	0

	function	OnSetup(item)
	{
		scene = ItemGetScene(item)
		ace_deleter = AceDeleter()

		sfx_water	=	EngineLoadSound(g_engine, "audio/sfx/sfx_bonus_water.wav")
		sfx_life	=	EngineLoadSound(g_engine, "audio/sfx/sfx_bonus_life.wav")
		sfx_score	=	EngineLoadSound(g_engine, "audio/sfx/sfx_bonus_score.wav")
		sfx_savage	=	EngineLoadSound(g_engine, "audio/sfx/sfx_bonus_savage.wav")

		if(is_wing)
			ItemSetCommandList(item, "loop;tooffset 2,0,-2,0;nop 1;tooffset 2,0,-0.25,0;nop 0.5;next;")
	}

	function	OnUpdate(item)
	{
		ace_deleter.Update()
	}

	function	GetPlayerInstance()
	{
		return	ItemGetScriptInstance(SceneGetScriptInstance(g_scene).player_item)
	}

	function	Run(item)
	{
		local	_world_pos = ItemGetWorldPosition(item)
		ItemSetParent(item, NullItem)
		ItemSetPosition(item, _world_pos)
		ItemSetCommandList(item, "offsetposition 2,50,2,0;")
		//ace_deleter.RegisterItem(item)
	}

	function	OnTrigger(item, trigger_item)
	{
		switch(ItemGetName(trigger_item))
		{
			case	"trigger_garbage":
				print("Trigger !!!")
				if(!is_wing)
					SceneDeleteItem(scene, item)
				break

			case	"trigger_car":
				if(!is_wing)
					SceneDeleteItem(scene, item)
				
				if(is_life)
				{
					if (GetPlayerInstance().life >= 3)
						return

					GetPlayerInstance().life++
					GetPlayerInstance().game_ui.UpdateLife(GetPlayerInstance().life)
					MixerSoundStart(g_mixer, sfx_life)
					SceneGetScriptInstance(g_scene).game_ui.ShowScoreFeedBack("Life!")
					return
				}

				if(is_water)
				{
					if (GetPlayerInstance().water >= 3)
						return

					GetPlayerInstance().water++
					GetPlayerInstance().game_ui.UpdateWater(GetPlayerInstance().water)
					MixerSoundStart(g_mixer, sfx_water)
					SceneGetScriptInstance(g_scene).game_ui.ShowScoreFeedBack("Water!")
					return
				}

				if(is_amber)
				{
					SceneGetScriptInstance(g_scene).score += g_score_amber
					SceneGetScriptInstance(g_scene).game_ui.UpdateScore(SceneGetScriptInstance(g_scene).score)
					MixerSoundStart(g_mixer, sfx_score)
					SceneGetScriptInstance(g_scene).game_ui.ShowScoreFeedBack("+" + g_score_amber.tostring())
					return
				}

				if(is_savage)
				{
					SceneGetScriptInstance(g_scene).score += g_score_savage
					SceneGetScriptInstance(g_scene).score = Max(SceneGetScriptInstance(g_scene).score, 0)
					SceneGetScriptInstance(g_scene).game_ui.UpdateScore(SceneGetScriptInstance(g_scene).score)
					MixerSoundStart(g_mixer, sfx_savage)
					SceneGetScriptInstance(g_scene).game_ui.ShowScoreFeedBack(g_score_savage.tostring())
					return
				}

				break
		}
	}
}

class	BonusHandler
{

	scene				=	0

	org_bonus_life		=	0
	org_bonus_water		=	0
	org_bonus_amber		=	0

	org_fiend_savage	=	0

	spawn_timeout		=	0
	parent_item			=	0

	function	OnSetupDone(item)
	{
		scene = ItemGetScene(item)
		org_bonus_water = SceneFindItem(scene, "bonus_water")
		org_bonus_life = SceneFindItem(scene, "bonus_life")
		org_bonus_amber = SceneFindItem(scene, "bonus_amber")
		org_fiend_savage = SceneFindItem(scene, "savage")
		parent_item = SceneFindItem(scene, "snake_center")
		spawn_timeout = g_clock
	}

	function	OnTrigger(item, trigger_item)
	{
		if(ItemGetName(trigger_item) == "trigger_spawn")
		{
			if ((g_clock - spawn_timeout) < SecToTick(Sec(2.0)))
				return

			if(ProbabilityOccurence(70))
			{
				spawn_timeout = g_clock

				if (ProbabilityOccurence(20))
				{
					//	Spawn a savage
					local	_new
					_new = SceneDuplicateItem(scene, org_fiend_savage)
					ItemSetPosition(_new, ItemGetPosition(item))
					ItemSetRotation(_new, ItemGetRotation(item))
					ItemSetParent(_new, parent_item)
					ItemSetup(_new)		
					ItemSetupScript(_new)
					ItemSetup(_new)					
				}

				return
			}

			local	_org_item
			if(ProbabilityOccurence(10))
				_org_item = org_bonus_amber
			else
			if(ProbabilityOccurence(30))
				_org_item = org_bonus_life		
			else
				_org_item = org_bonus_water

			local	_new
			_new = SceneDuplicateItem(scene, _org_item)
			ItemSetPosition(_new, ItemGetPosition(item))
			ItemSetRotation(_new, ItemGetRotation(item))
			ItemSetParent(_new, parent_item)
			ItemSetup(_new)
			ItemSetupScript(_new)
			ItemSetup(_new)

			spawn_timeout = g_clock
			print("trigger_spawn !")
		}
	}

}

/*!
	@short	LevelHandler
	@author	Astrofra
*/
class	LevelHandler	extends	BaseScene
{

	camera_handler			=	0
	player_item				=	0
	game_ui					=	0
	score					=	0
	score_inc_timer			=	0

	bonus_handler			=	0

	music_channel			=	0
	channel_ambiant_jungle	=	0

	speed_factor			=	1.0

	function	SfxStartAmbiantJungle()
	{
		channel_ambiant_jungle = MixerStreamStart(g_mixer, "audio/sfx/sfx_ambiant_jungle.ogg")
		MixerChannelSetLoopMode(g_mixer, channel_ambiant_jungle, LoopRepeat)
		MixerChannelSetGain(g_mixer, channel_ambiant_jungle, 0.1)
		music_channel = MixerStreamStart(g_mixer, "audio/music/music_game.ogg")
		MixerChannelSetLoopMode(g_mixer, music_channel, LoopRepeat)
		MixerChannelSetGain(g_mixer, music_channel, 0.5)
	}

	function	StopAllSound()
	{
		MixerChannelStop(g_mixer, channel_ambiant_jungle)
		MixerChannelStop(g_mixer, music_channel)
	}
	
	constructor()
	{
		base.constructor()
	}

	function	OnUpdate(scene)
	{
		base.OnUpdate(scene)
		IncreaseScore()
		game_ui.UpdateCursor()
		CheckPlayerStats()
		speed_factor += (g_dt_frame / 100.0)
		MixerChannelSetPitch(g_mixer, music_channel, speed_factor)
		CheckPlayerIsUpsideDown()
//		bonus_handler.UpdateBonusSpawn()
//		camera_handler.FollowPlayerPosition(ItemGetPosition(player_item))
	}

	//-----------------------------------
	function	CheckPlayerIsUpsideDown()
	//-----------------------------------
	{
		if (ItemGetScriptInstance(player_item).CarIsUpsideDown(player_item))
			game_ui.ShowJumpButton(true)
		else
			game_ui.ShowJumpButton(false)
	}

	function	IncreaseScore()
	{
		if (ItemGetScriptInstance(player_item).life <= 0)
			return

		if ((g_clock - score_inc_timer) >  SecToTick(Sec(0.25)))
		{
			score++
			score_inc_timer
			game_ui.UpdateScore(score)

			if (score > g_best_score)
				g_best_score = score
		}
	}

	function	CheckPlayerStats()
	{
		if (ItemGetScriptInstance(player_item).life <= 0)
		{
			speed_factor -= g_dt_frame
			speed_factor = Clamp(speed_factor, 0.0, 1.0)
			if(game_ui.IsGameOverMessageDone())
			{
				ProjectGetScriptInstance(g_project).save_game.SavePlayerData({best_score = g_best_score})
				ItemGetScriptInstance(player_item).StopAllSound()
				StopAllSound()
				ProjectGetScriptInstance(g_project).ProjectGotoScene("scenes/screen_game_over.nms")
			}
		}
	}

	function	OnSetup(scene)
	{
		base.OnSetup(scene)
		game_ui = GameUI(SceneGetUI(scene))
		score_inc_timer = g_clock
		speed_factor = 1.0
	}

	function	OnSetupDone(scene)
	{
		//base.OnSetupDone(scene)
		//bonus_handler = BonusHandler(scene)
		camera_handler = CameraHandler(scene)
		player_item = SceneFindItem(scene, "player")
		SfxStartAmbiantJungle()
		speed_factor = 1.0
	}
}
