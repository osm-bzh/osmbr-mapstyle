
/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

// used for background color and coast line
#land_low[zoom>=0][zoom<10] {
	polygon-fill: @land;
	polygon-gamma: 0.75;
}
#land_high[zoom>=10] {
	polygon-fill: @land;
	polygon-gamma: 0.75;
}


#landcover_low[zoom>=6][zoom<=7] {
	[type='forest']            { polygon-fill: @wooded; polygon-opacity: 0.6; }
}
#landcover_low[zoom>=8][zoom<=9] {
	[type='forest']            { polygon-fill: @wooded; polygon-opacity: 0.8; }
}


#landcover[zoom>=10][zoom<=11] {
	[type='forest']            { polygon-fill: @wooded; }
	[type='farmland']          { polygon-fill: @farmland; polygon-opacity: 0.5; }
	[type='meadow']            { polygon-fill: @meadow; polygon-opacity: 0.5; }
	[type='residential']       { polygon-fill: @residential * 0.975; }
}

#landcover[zoom>=12] {
	
	[type='residential'] {
		[zoom<=14] { polygon-fill: @residential * 0.975; }
		[zoom>=15] { polygon-fill: @residential; }
	}

	[type='industrial'] {
		polygon-fill: @industrial;
		[zoom>=15] { polygon-fill: @residential * 0.975; }
	}

	[type='cemetery']          { polygon-fill: @cemetery; }
	[type='college']           { polygon-fill: @school; }
	[type='commercial']        { polygon-fill: @industrial; }
	[type='common']            { polygon-fill: @park; }
	[type='forest']            { polygon-fill: @wooded; }
	[type='golf_course']       { polygon-fill: @sports; line-color: @standard_case*0.95; line-width: 1; }
	[type='grass']             { polygon-fill: @grass; polygon-opacity: 0.6; }
	[type='recreation_ground'] { polygon-fill: @grass; }
	[type='meadow']            { polygon-fill: @meadow; }
	[type='farmland']          { polygon-fill: @farmland; }
	[type='heath']             { polygon-fill: @grass; polygon-opacity: 0.5;}
	[type='farm']              { polygon-fill: @grass; polygon-opacity: 0.4;}
	[type='scrub']             { polygon-fill: @grass; }
	[type='hospital']          { polygon-fill: @hospital; }
	
	[type='park']              { polygon-fill: @park; }
	[type='parking'] {
		polygon-fill: @parking*1.05;
		polygon-opacity: 0.9;
		[zoom>=17]{
			marker-file: url(img/icon/parking.svg);
			marker-opacity: 0.25;
		}
		[zoom=17]{
			marker-transform: "scale(0.3)";
		}
		[zoom>=18]{
			marker-transform: "scale(0.5)";
		}
	}
	[type='pedestrian']  { polygon-fill: @pedestrian_fill; }
	[type='school']      { polygon-fill: @school; }
	[type='sports_center'], [type='stadium'], [type='pitch'] {
		polygon-fill: @sports;
		
		[zoom>13]{
			line-color: @standard_case*0.95;
			line-width: 0.5;
			[zoom>14]{line-width: 1;}
		}
	}
	[type='university'] { polygon-fill: @school; }
	[type='wood']       { polygon-fill: @wooded; }
	[type='playground'] {
		polygon-fill: @sports;
		[zoom>=17]{
			marker-file: url(img/icon/playground.svg);
				marker-opacity: 0.5;
				marker-clip: false;
		}
		[zoom=17]{
			marker-transform: 'scale(0.03)';
		}
		[zoom>=18]{
			marker-transform: 'scale(0.03)';
		}
	}
}


/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway[zoom>10] {
	line-color:@aeroway;
	line-cap:butt;
	line-join:miter;
	[type='runway'] {
		[zoom=10]{ line-width:1; }
		[zoom=11]{ line-width:2; }
		[zoom=12]{ line-width:3; }
		[zoom=13]{ line-width:5; }
		[zoom=14]{ line-width:7; }
		[zoom=15]{ line-width:11; }
		[zoom=16]{ line-width:15; }
		[zoom=17]{ line-width:19; }
		[zoom>17]{ line-width:23; }
	}
	[type='taxiway'] {
		[zoom=10]{ line-width:0.2; }
		[zoom=11]{ line-width:0.2; }
		[zoom=12]{ line-width:0.2; }
		[zoom=13]{ line-width:1; }
		[zoom=14]{ line-width:1.5; }
		[zoom=15]{ line-width:2; }
		[zoom=16]{ line-width:3; }
		[zoom=17]{ line-width:4; }
		[zoom>17]{ line-width:5; }
	}
}



/* ================================================================== */
/* BUILDINGS
/* ================================================================== */

#buildings[zoom>=13] {
	polygon-fill:@building;
	[type='church'] {
		polygon-fill: @building*0.85;
	}
	[zoom>=14] {
		line-color:darken(@building, 10%);
		line-width: 0.2;
	}
	[zoom>=16] {
		line-color:darken(@building, 20%);
		line-width: 0.4;
	}
	[zoom>=18] {
		line-color:darken(@building, 40%);
		line-width: 0.6;
	}
}


