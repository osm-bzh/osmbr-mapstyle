
/* ================================================================== */
/* WATER AREAS
/* ================================================================== */


#waterarea_low[zoom>=8][zoom<=10],
#waterarea_med[zoom>=11][zoom<=12],
#waterarea[zoom>=13] {
	polygon-fill: @water;
	polygon-smooth: 0.6;
	polygon-clip: false;
}


/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#waterway_low[zoom>=7][zoom<=12] {
	line-color: @water;
	[zoom=7] { line-width: 0.1; }
	[zoom=8] { line-width: 0.25; }
	[zoom=9] { line-width: 0.6; }
	[zoom=10]{ line-width: 1.0; }
	[zoom=11]{ line-width: 1.5; }
	[zoom=12]{ line-width: 2.0; }
}

#waterway_med[zoom>=13][zoom<=14] {
	/*polygon-fill: @water;*/
	line-color: @water;
	[type='river'],
	[type='canal'] {
		line-cap: round;
		line-join: round;
		[zoom=13]{ line-width: 3.0; }
		[zoom=14]{ line-width: 4.0; }
	}
	[type='stream'] {
		[zoom=13]{ line-width: 2.0; }
		[zoom=14]{ line-width: 1.75; }
	}
}
	
#waterway_high[zoom>=15] {
	line-color: @water;
	[type='river'],
	[type='canal'] {
		line-cap: round;
		line-join: round;
		[zoom=15]{ line-width: 4; }
		[zoom=16]{ line-width: 5; }
		[zoom=17]{ line-width: 6; }
		[zoom=18]{ line-width: 7; }
		[zoom=19]{ line-width: 8; }
		[zoom>19]{ line-width: 9; }
	}
	[type='stream'] {
		[zoom=15]{ line-width: 2.5; }
		[zoom=16]{ line-width: 3.0; }
		[zoom=17]{ line-width: 3.5; }
		[zoom=18]{ line-width: 4.0; }
		[zoom>18]{ line-width: 6.0; }
	}
	[type='ditch'],
	[type='drain'] {
		[zoom=15]{ line-width: 0.1; }
		[zoom=16]{ line-width: 0.3; }
		[zoom=17]{ line-width: 0.5; }
		[zoom=18]{ line-width: 0.7; }
		[zoom=19]{ line-width: 1; }
		[zoom>19]{ line-width: 1.5; }
	}
}

