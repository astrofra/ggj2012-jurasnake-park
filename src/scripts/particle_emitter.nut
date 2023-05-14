//
	Include("scripts/ace_deleter.nut")

class	ParticleEmitter
{
	
/*<
	<Parameter =
		<particle_mesh = <Name = "Particle Mesh"> <Type = "String"> <Default = "graphics/particle_star.nmg">>
		<is_billboard = <Name = "Billboard"> <Type = "bool"> <Default = 0>>
		<scale_factor = <Name = "Scale Factor"> <Type = "Float"> <Default = 1.0>>
		<particle_speed = <Name = "Particle Speed (m/s)"> <Type = "float"> <Default = 10.0>>
		<particle_life = <Name = "Particle Life (sec)"> <Type = "float"> <Default = 1.0>>
		<emit_freq = <Name = "Emit Interval (sec)"> <Type = "float"> <Default = 0.1>>
		<jitter = <Name = "Jitter"> <Type = "bool"> <Default = 1>>
		<jitter_radius_min = <Name = "Jitter Inner Radius (m)"> <Type = "float"> <Default = 0.125>>
		<jitter_radius_max = <Name = "Jitter Outer Radius (m)"> <Type = "float"> <Default = 0.95>>
		<autoemit = <Name = "Auto Emit"> <Type = "bool"> <Default = 0>>
	>
>*/

	scene				=	0
	current_camera		=	0
	lander_item			=	0
	emitter_item		=	0
	pos					=	0
	scale				=	0
	scale_factor		=	1.0
	emit_freq			=	Sec(0.01)
	emit_clock			=	0.0
	original_particle	=	0
	particle_mesh		=	"graphics/particle_star.nmg"
	ace_deleter			=	0
	particle_speed		=	10.0
	particle_life		=	1.0
	jitter				=	true
	jitter_radius_min	=	Mtr(0.125)
	jitter_radius_max	=	Mtr(0.95)
	autoemit			=	false
	is_billboard		=	false

	//-----------------------
	function	OnSetup(item)
	//-----------------------
	{
		emitter_item = item
		lander_item = ItemGetParent(item)
		if (!ObjectIsValid(lander_item))
			lander_item = 0
		pos	= ItemGetWorldPosition(item)
		scale = ItemGetScale(item)
		emit_clock = g_clock
		scene = ItemGetScene(item)
		original_particle = SceneAddObject(scene, "original_particle")
		local	geo = EngineLoadGeometry(g_engine, particle_mesh)
		ObjectSetGeometry(original_particle, geo)
		original_particle = ObjectGetItem(original_particle)
		ItemActivate(original_particle, false)

		particle_speed = particle_speed * particle_life

		//	Ace deleter
		ace_deleter = AceDeleter()

		print("ParticleEmitter::OnSetup() : OK.")
		print("ParticleEmitter::OnSetup() :jitter = " + jitter)

	}

	function	OnSetupDone(item)
	{
		current_camera = SceneGetCurrentCamera(scene)
	}

	//------------------------
	function	OnUpdate(item)
	//------------------------
	{
		ace_deleter.Update()
		
		if (CameraCullPosition(current_camera, ItemGetWorldPosition(emitter_item)) == VisibilityOutside)
			return

		if (autoemit)
			Emit()
		//ItemSetScale(item, scale.Scale(Rand(1,1.1)))
	}

	//----------------
	function	Emit()
	//----------------
	{
		if ((emit_freq == 0.0) || ((g_clock - emit_clock) > SecToTick(emit_freq)))
		{
			local	_size, new_part, _d
			_size = Rand(0.25, 1.0)
			pos = ItemGetWorldPosition(emitter_item)
			if (jitter)
				pos = pos + Vector(Rand(-1,1), Rand(-1,1), 0).Normalize().Scale(Rand(jitter_radius_min, jitter_radius_max))
			_d = ItemGetMatrix(emitter_item).GetRow(0)
			_d.y += -0.5
			_d = _d.Normalize().Scale(particle_speed) //	Emitter speed in m/s
			if (lander_item != 0)
				_d += ItemGetLinearVelocity(lander_item)
			_d.z = 0.0
			_d = Vector(0,-9.8,0)

			new_part = SceneDuplicateItem(scene, original_particle)
			ItemActivate(new_part, true)
			ItemSetPosition(new_part, pos + Vector(0,0,Mtr(Rand(0.25, 1.0))))
			ItemSetFlags(new_part, ItemFlagBillboard, is_billboard)
			ItemSetRotation(new_part, Vector(0,0,Rand(0,180)))
			ItemSetScale(new_part, Vector(_size * scale_factor,_size * scale_factor,1.0))
			ItemSetOpacity(new_part, 1.0)
			ItemSetCommandList(new_part, "offsetposition " + particle_life + "," + _d.x + "," + _d.y + "," + _d.z + "+toscale " + particle_life + ",0.05,0.05,1.0;")

			ace_deleter.RegisterItem(new_part)

			emit_clock = g_clock
		}
	}
}