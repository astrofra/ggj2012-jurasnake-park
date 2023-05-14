/*
	File: scripts/trigger_garbage.nut
	Author: GGJ2012
*/

/*!
	@short	TriggerGarbage
	@author	GGJ2012
*/
class	TriggerGarbage
{	
	scene		=	0
	/*!
		@short	OnUpdate
		Called during the scene update, each frame.
	*/
	function	OnUpdate(item)
	{
	}

	/*!
		@short	OnSetup
		Called when the item is about to be setup.
	*/
	function	OnSetup(item)
	{
		scene = ItemGetScene(item)
	}
}
