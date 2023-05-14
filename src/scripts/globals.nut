	//	Globals.nut

	g_device				<-	GetKeyboardDevice()
	g_is_touch_platform		<-	(g_platform == "Android"?true:false)
	g_ui_cursor				<-	UICreateCursor(0)


	g_gravity				<-	Vector(0.0, -9.8, 0.0)
	g_reversed_controls		<-	false
	g_time_key_order		<-	["hour", "minute", "second", "ms"]

	g_best_score			<-	0

	g_screen_width			<-	1280.0
	g_screen_height			<-	960.0

	g_score_amber			<-	100
	g_score_savage			<-	-200

	