//	Save

class	SaveGame
{

	save_game_filename	=	""

	//-----------
	constructor()
	//-----------
	{
		print("SaveGame::constructor()")
		if (EngineGetToolMode(g_engine) == NoTool)
			save_game_filename = "@root/save.nml"
		else
			save_game_filename = "./save.nml"
	}

	//------------------------------------
	function	SavePlayerData(data_table)
	//------------------------------------
	{	
		local file = MetafileNew()
		serializeObjectToMetatag(data_table, MetafileAddRoot(file, "save"))
	
		MetafileSave(file, save_game_filename)
	}
	
	//------------------------------------
	function	LoadPlayerData()
	//------------------------------------
	{
		print("SaveGame::LoadPlayerData()")

		local	_file, data_table

		if (FileExists(save_game_filename))
		{
			_file = MetafileNew()

			if	(MetafileLoad(_file, save_game_filename))
			{
				local tag = MetafileGetTag(_file, "save;")
				data_table = deserializeObjectFromMetatag(tag)
			}	
		}

		return	data_table
	}
}