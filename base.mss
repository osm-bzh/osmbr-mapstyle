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
#landuse_0[zoom<=7] {
  raster-opacity:0.7;
}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

Map{ 
	background-color:@water;
}

#water[zoom>8] {
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

