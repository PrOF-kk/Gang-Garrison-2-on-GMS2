function calculateAprilFools() {
	var currentDate;
	currentDate = date_current_datetime();
	global.aFirst = (date_get_month(currentDate) == 4 and date_get_day(currentDate) == 1);



}
