/*
	File: scripts/base_player_platformer.nut
	Author: Astrofra
*/

/*!
	@short	BasePlayerPlatformer
	@author	Astrofra
*/

class	BasePlayerPlatformer	extends	PlayerPhysic2D
{
	max_speed				=	Mtrs(2.0)
	pad_is_enabled			=	true
	pad_device				=	0
	pad_device_2			=	0
	pad						=	0
	strength				=	100.0

	car_body				=	0
	cannon_rot				=	0

	jump_timeout			=	0.0

	life					=	3
	water 					=	3

	hit_the_ground			=	true
	hit_timeout				=	0.0
	double_jump_counter		=	0

	update_function			=	0

	sfx_motor_low_speed		=	0
	sfx_motor_hi_speed		=	0
	sfx_car_fall			=	0
	sfx_car_jump			=	0

	game_ui					=	0

	cannon_item				=	0
	aim_item				=	0
	origin_item				=	0
	stream_mesh				=	0
	water_stream_handler	=	0
	drop_emitter			=	0

	snake_jaw				=	0

	swallowed				=	false

	function	SfxRollingMotorSound()
	{
		sfx_motor_low_speed = MixerSoundStart(g_mixer, EngineLoadSound(g_engine, "audio/sfx/sfx_motor_low_speed.wav"))
		sfx_motor_hi_speed = MixerSoundStart(g_mixer, EngineLoadSound(g_engine, "audio/sfx/sfx_motor_hi_speed.wav"))
		MixerChannelSetLoopMode(g_mixer, sfx_motor_low_speed, LoopRepeat)
		MixerChannelSetLoopMode(g_mixer, sfx_motor_hi_speed, LoopRepeat)
		MixerChannelSetGain(g_mixer, sfx_motor_low_speed, 1.0)
		MixerChannelSetGain(g_mixer, sfx_motor_hi_speed, 0.0)
		MixerChannelSetPitch(g_mixer, sfx_motor_hi_speed, 1.5)

		sfx_car_fall = EngineLoadSound(g_engine, "audio/sfx/sfx_car_fall.wav")
		sfx_car_jump = EngineLoadSound(g_engine, "audio/sfx/sfx_car_jump.wav")
	}

	function	SfxStartingMotorSound()
	{
		local	_snd = MixerSoundStart(g_mixer, EngineLoadSound(g_engine, "audio/sfx/sfx_motor_start.wav"))
		MixerChannelSetLoopMode(g_mixer, _snd, LoopNone)
		MixerChannelSetGain(g_mixer, _snd, 1.0)
	}

	function	StopAllSound()
	{
		MixerChannelStop(g_mixer, sfx_motor_low_speed)
		MixerChannelStop(g_mixer, sfx_motor_hi_speed)
	}

	function	HandleSoundSpeed()
	{
		local	_speed = current_velocity.Len()
		_speed = Clamp(_speed, 0.0, 10.0)
		_speed = _speed / 10.0

		MixerChannelSetGain(g_mixer, sfx_motor_low_speed, 1.0 - _speed)
		MixerChannelSetGain(g_mixer, sfx_motor_hi_speed, _speed)
		
//		print("_speed = " + _speed)
	}

	function	UpdatePlayerIsDead(item)
	{
		pad.d_vector.y = -1.0
	}

	//----------------------------
	function	HandleCannon(item)
	//----------------------------
	{
		ItemSetRotation(cannon_item, cannon_rot)

//		print("cannon_rot.z = " + RadianToDegree(cannon_rot.z))
		cannon_rot.z += (DeviceInputValue(pad_device_2, DeviceAxisY) * g_dt_frame)
		cannon_rot.z = Clamp(cannon_rot.z, DegreeToRadian(-45.0), DegreeToRadian(45.0))

		if (DeviceIsKeyDown(pad_device_2, 83))
		{
			if (water > 0)
			{
				ShowStream(true)
				RayCastCannon(item)
				water -= g_dt_frame
				water = Max(water, 0)
				game_ui.UpdateWater(water)
			}
			else
			{
				ItemGetScriptInstance(drop_emitter).Emit()
				ShowStream(false)
			}
		}
		else
			ShowStream(false)
	}
	
	//-----------------------------
	function	RayCastCannon(item)
	//-----------------------------
	{
		local	_origin	=	ItemGetWorldPosition(origin_item)
		local	_direction	=	(ItemGetWorldPosition(aim_item) - _origin).Normalize()
		//	Raycast the terrain & snake
		local	_hit = SceneCollisionRaytrace(scene, _origin, _direction, 3, CollisionTraceAll, Mtr(100.0))
		if (_hit.hit)
		{
			print("Hit.d" + _hit.d)
			ItemSetScale(water_stream_handler, Vector(_hit.d / 2.0 + Rand(-0.3, 0.3), Rand(0.7,1.5), 1))
			if (ItemGetName(_hit.item) == "snake_collision")
				ItemGetScriptInstance(snake_jaw).GotHit()
				
		}
		else
			ItemSetScale(water_stream_handler, Vector(20.0 + Rand(-0.3, 0.3), Rand(0.7,1.5), 1))

	}

	//-----------------------------
	function	UpdateRolling(item)
	{
		HandleCannon(item)
		CheckPlayerLife()

		pad.d_vector.x = DeviceInputValue(pad_device, DeviceAxisX)
		pad.d_vector.y = -1.0

		if (DeviceKeyPressed(pad_device, 82))
		{
			jump_timeout = g_clock
			double_jump_counter = 0
			update_function = UpdateJumping
			MixerSoundStart(g_mixer, sfx_car_jump)
			ItemApplyLinearImpulse(item, Vector(0,-1,0).Scale(strength * ItemGetMass(item) * low_dt_compensation / 50.0))
		}

	}

	//-------------------------------
	function	CarIsUpsideDown(item)
	//-------------------------------
	{
		local	_top_y = ItemGetWorldPosition(ItemGetChild(item, "top")).y
		local	_bottom_y = ItemGetWorldPosition(ItemGetChild(item, "bottom")).y

		if (_top_y > _bottom_y) 
			return false
		else
			return true
	}

	function	UpdateJumping(item)
	{
		HandleCannon(item)
		CheckPlayerLife()

		UpdateJumpMotion(item)
		if (!CarIsUpsideDown(item))
			pad.d_vector.y = 2.0
		else
			pad.d_vector.y = 5.0

		hit_the_ground	=	false

		if ((g_clock - jump_timeout) > SecToTick(Sec(0.125)))
			if (!DeviceIsKeyDown(pad_device, 82))
				update_function = UpdateFalling

		if ((g_clock - jump_timeout) > SecToTick(Sec(0.25)))
			update_function = UpdateFalling
	}

	function	UpdateFalling(item)
	{
		HandleCannon(item)
		CheckPlayerLife()

		if (double_jump_counter < 1)
		{
			print("Double Jump ?????")
			if (DeviceKeyPressed(pad_device, 82))
			{
				double_jump_counter++
				print("Double Jump!!!")
				jump_timeout = g_clock
				update_function = UpdateJumping
				MixerSoundStart(g_mixer, sfx_car_jump)
				ItemApplyLinearImpulse(item, Vector(0,-1,0).Scale(strength * ItemGetMass(item) * low_dt_compensation / 50.0))
			}
		}

		UpdateJumpMotion(item)
		pad.d_vector.y = -2.0
		if (hit_the_ground)
			update_function = UpdateRolling
	}

	function	UpdateJumpMotion(item)
	{
		HandleCannon(item)
		CheckPlayerLife()

		pad.d_vector.x = 0.0
		pad.d_vector.x = DeviceInputValue(pad_device, DeviceAxisX) * 0.35
		pad.d_vector.y = -2.0
	}

	function	OnCollision(item, with_item)
	{
		hit_the_ground	=	true
		double_jump_counter = 0
		if (ItemGetName(with_item) == "snake_collision")
			GotHitBySnake(item)
		if (ItemGetName(with_item) == "wing")
			GotHitByWing(item)
	}

	function	GotHitBySnake(item)
	{
		if ((g_clock - hit_timeout) > SecToTick(Sec(2.0)))
			TakeHitDamage(item)
	}

	function	GotHitByWing(item)
	{
		if ((g_clock - hit_timeout) > SecToTick(Sec(2.0)))
			TakeHitDamage(item)
	}

	function	OnTrigger(item, trigger_item)
	{
		if (ItemGetName(trigger_item) == "trigger_snake")
		{
			if (!ItemGetScriptInstance(snake_jaw).IsHit())
				GotHitBySnake(item)
		}
/*
		if (ItemGetName(trigger_item) == "trigger_jaws")
		{
			print("trigger_jaws")
			if (!ItemGetScriptInstance(snake_jaw).IsHit())
			{
				swallowed = true
				InstantDeath(item)
			}
		}	
*/
	}

	//----------------------------
	function	InstantDeath(item)
	//----------------------------
	{
		hit_timeout = g_clock
		local	_str = ""
		for(local n = 0; n < 5; n++)
			_str += "toalpha 0,0.5;nop 0.075;toalpha 0,1;nop 0.075;"
		ItemSetCommandList(car_body, _str)
		life = 0
		game_ui.UpdateLife(life)
	}

	//-----------------------------
	function	TakeHitDamage(item)
	{
		print("TakeHitDamage()")
		hit_timeout = g_clock
		local	_str = ""
		for(local n = 0; n < 5; n++)
			_str += "toalpha 0,0.5;nop 0.075;toalpha 0,1;nop 0.075;"
		ItemSetCommandList(car_body, _str)
		life--
		game_ui.UpdateLife(life)
	}

	constructor()
	{
		base.constructor()

		pad_device		= GetInputDevice("xinput0")
//		if (EngineGetToolMode(g_engine) == NoTool)
//			pad_device_2	= GetInputDevice("xinput1")
//		else
			pad_device_2	= GetInputDevice("xinput0")

		pad = {	d_vector = Vector(0,0,0)
			}

		update_function = UpdateRolling
	}

	//-----------------------
	function	OnSetup(item)
	//-----------------------
	{
		base.OnSetup(item)

		snake_jaw = SceneFindItem(ItemGetScene(item), "snake_head_top")

		cannon_item = ItemGetChild(item, "cannon")
		origin_item = ItemGetChild(cannon_item, "cannon_origin")
		aim_item = ItemGetChild(cannon_item, "cannon_aim")


		water_stream_handler = ItemGetChild(cannon_item, "water_stream")
		drop_emitter	=	ItemGetChild(cannon_item, "drop_emitter")

		stream_mesh = []
		stream_mesh.append(ItemGetChild(water_stream_handler ,"water_stream_mesh_0"))
		stream_mesh.append(ItemGetChild(water_stream_handler ,"water_stream_mesh_1"))
		stream_mesh.append(ItemGetChild(water_stream_handler ,"water_stream_mesh_2"))
		ShowStream(false)

		cannon_rot = Vector(0,0,0)
	}

	function	ShowStream(_flag)
	{
		foreach(_mesh in stream_mesh)
			ItemActivate(_mesh, _flag)
	}

	//---------------------------
	function	OnSetupDone(item)
	//---------------------------
	{
		//base.OnSetupDone(item)
		SfxStartingMotorSound()
		SfxRollingMotorSound()
		hit_timeout = g_clock
		car_body = ItemGetChild(item, "player_mesh")
		swallowed = false

		try
		{
			game_ui = SceneGetScriptInstance(ItemGetScene(item)).game_ui
		}
		catch(e)
		{
			game_ui = 0
		}
		life = 3
	}

	function	CheckPlayerLife()
	{
		if (life <= 0)
		{
			if (game_ui != 0)
				game_ui.ShowGameOverMessage()
			update_function = UpdatePlayerIsDead
		}
	}

	//------------------------
	function	OnUpdate(item)
	//------------------------
	{
		HandleSoundSpeed()
		update_function(item)
		//		pad.d_vector.Print("pad.d_vector")		
	}

	//--------------------------------
	function	OnPhysicStep(item, dt)
	//--------------------------------
	{
		base.OnPhysicStep(item, dt)
		ItemApplyLinearForce(item, pad.d_vector.Scale(strength * ItemGetMass(item) * low_dt_compensation))
	}
}