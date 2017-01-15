/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 */

/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#land[zoom>=0][zoom<20] {
	polygon-fill: @land;
	polygon-gamma: 0.75;
}

// raster z7.tif
#landuse_0[zoom<=6] {
  raster-opacity:0.7;
}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

Map{ 
	background-color:@water;
}

#water_gen0[zoom>6][zoom<=9],
#water_gen1[zoom>9][zoom<=11],
#water[zoom>11] {
	polygon-fill: @water;
	[zoom=4]{
		polygon-fill: @water4;
	}
	[zoom=5],[zoom=6]{
		polygon-fill: @water56;
	}
	[zoom=7]{
		polygon-fill: @water7;
	}
	polygon-smooth: 0.6;
	polygon-clip: false;
}


/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#waterway_low[zoom>=8][zoom<=12] {
	line-color: @water;
	[zoom=8] { line-width: 0.1; }
	[zoom=9] { line-width: 0.2; }
	[zoom=10]{ line-width: 0.4; }
	[zoom=11]{ line-width: 0.6; }
	[zoom=12]{ line-width: 0.8; }
}

#waterway_med[zoom>=13][zoom<=14] {
	line-color: @water;
	[type='river'],
	[type='canal'] {
		line-cap: round;
		line-join: round;
		[zoom=13]{ line-width: 1; }
		[zoom=14]{ line-width: 1.5; }
	}
	[type='stream'] {
		[zoom=13]{ line-width: 0.2; }
		[zoom=14]{ line-width: 0.4; }
	}
}
	
#waterway_high[zoom>=15] {
	line-color: @water;
	[type='river'],
	[type='canal'] {
		line-cap: round;
		line-join: round;
		[zoom=15]{ line-width: 2; }
		[zoom=16]{ line-width: 3; }
		[zoom=17]{ line-width: 4; }
		[zoom=18]{ line-width: 5; }
		[zoom=19]{ line-width: 6; }
		[zoom>19]{ line-width: 7; }
	}
	[type='stream'] {
		[zoom=15]{ line-width: 0.6; }
		[zoom=16]{ line-width: 0.8; }
		[zoom=17]{ line-width: 1; }
		[zoom=18]{ line-width: 1.5; }
		[zoom>18]{ line-width: 2; }
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
