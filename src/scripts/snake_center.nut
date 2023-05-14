/*
	File: scripts/snake_center.nut
	Author: GGJ2012
*/

/*!
	@short	SnakeHead
	@author	GGJ2012
*/

//---------------
class	SnakeHead
//---------------
{
	head_rot		=	0
	hit				=	false

	function	OnSetup(item)
	{
		head_rot = Vector(0,0,0)
		hit				=	false
	}

	function	OnUpdate(item)
	{
		local	_open_factor
		_open_factor = ItemGetWorldPosition(item).x
		_open_factor = Abs(_open_factor)
		_open_factor = Clamp(_open_factor, 0.0, Mtr(15.0))
		_open_factor = RangeAdjust(_open_factor, 0.0, 15.0, 1.0, 0.0)
		_open_factor = _open_factor * -55.0

		if (hit) 
			_open_factor = Max(_open_factor * 0.2, 0.0)

		ItemSetRotation(item, Vector(0,0, DegreeToRadian(_open_factor)))
	}

	function	GotHit()
	{
		hit = true
	}

	function	Heal()
	{
		hit = false
	}

	function	IsHit()
	{
		return	hit
	}

	function	OnTrigger(item, trigger_item)
	{
		if (ItemGetName(trigger_item) == "trigger_spawn")
		{
			Heal()
			print("Heal()")
		}
	}
}

/*!
	@short	SnakeCenter
	@author	GGJ2012
*/
class	SnakeCenter
{
/*<
	<Parameter =
		<speed = <Name = "Angular Speed"> <Type = "float"> <Default = 45.0>>
	>
>*/
	angle		=	0.0
	speed		=	45.0
	scene		=	0

	/*!
		@short	OnUpdate
		Called during the scene update, each frame.
	*/
	function	OnUpdate(item)
	{
		local	_speed_factor = 1.0
		try
		{
			_speed_factor = SceneGetScriptInstance(scene).speed_factor
		}
		catch(e)
		{
			_speed_factor = 1.0
		}
//		if (SceneGetScriptInstance(scene).rawin("speed_factor"))
//			_speed_factor = SceneGetScriptInstance(scene).speed_factor)
		angle -= (g_dt_frame * speed * _speed_factor)
		ItemSetRotation(item, Vector(0, 0, DegreeToRadian(angle)))
	}

	/*!
		@short	OnSetup
		Called when the item is about to be setup.
	*/
	function	OnSetup(item)
	{
		scene		= ItemGetScene(item)
		angle		=	RadianToDegree(ItemGetRotation(item).z)
	}
}
