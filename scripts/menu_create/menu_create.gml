function menu_create(xbegin, ybegin, width, valueoffset, spacing, taboffset, tabspacing, tabmargin) {
	// argument0 - x position
	// argument1 - y position
	// argument2 - width
	// argument3 - valueoffset
	// argument4 - spacing
	// argument5 - tab offset (upwards) [thanks GM for making unset args default to 0!!!11] (not anymore)
	// argument6 - tab spacing
	// argument7 - tab margin

	virtualitem = -1;
	self.xbegin = xbegin;
	self.ybegin = ybegin;
	self.width = width;
	self.valueoffset = valueoffset;
	self.spacing = spacing;
	self.taboffset = taboffset;
	self.tabspacing = tabspacing;
	self.tabmargin = tabmargin;
	if (taboffset == undefined) self.taboffset = 0;
	if (tabspacing == undefined) self.tabspacing = 0;
	if (tabmargin == undefined) self.tabmargin = 0;
	items = 0;
	tabs = 0;
	editing = -1;
	dimmed = false;
	stepHasRun = false;
	drawbg = false;
	getsHighlight = true;
	bgtabs = false;
	menumode = false;
	screenheight = 600;

	// Hack: The back button should usually appear last in the menu, even if plugins
	// add new items later, so we treat it separately.
	menu_script_back = "";
	menu_text_back = "";



}
