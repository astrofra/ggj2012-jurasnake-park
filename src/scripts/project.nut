/*
*/

	Include("scripts/base_project.nut")
	
//
class	ProjectHandler	extends	BaseProjectHandler
{

	save_game 	=	0

	function	OnUpdate(project)
	{
		base.OnUpdate(project)
	}

	function	OnSetup(project)
	{
		base.OnSetup(project)
	}
	
	constructor()
	{
		base.constructor()
		entry_point			=	"scenes/title.nms"
		save_game = SaveGame()
		try
		{
			g_best_score = save_game.LoadPlayerData().best_score
		}
		catch(e)
		{
			print("Load/Save Failed")
		}
	}
}
