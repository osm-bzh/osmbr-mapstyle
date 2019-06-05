/* LABELS.MSS CONTENTS:
 * - place names
 * - area labels
 * - waterway labels 
 */

/* Font sets are defined in palette.mss */

/* ================================================================== */
/* PLACE NAMES  for countries
/* ================================================================== */

#place::country[type='country'][zoom>=5][zoom<8] {
	text-name: '[name]';
	text-face-name: @sans_bold;
	text-placement: point;
	text-fill: @country_text;
	text-halo-fill: @country_halo;
	text-halo-radius: 1;
	[zoom=3] {
		text-size: 10 + @text_adjust;
		text-wrap-width: 40;
	}
	[zoom=4] {
		text-size: 11 + @text_adjust;
		text-wrap-width: 50;
	}
	[zoom>4] {
		text-halo-radius: 2;
	}
	[zoom=5] {
		text-size: 12 + @text_adjust;
		text-wrap-width: 50;
		text-line-spacing: 1;
		text-name: '[name]';
	}
	[zoom=6] {
		text-size: 13 + @text_adjust;
		text-character-spacing: 1;
		text-wrap-width: 80;
		text-line-spacing: 2;
	}
	[zoom=7] {
		text-size: 15 + @text_adjust;
		text-character-spacing: 2;
	}
}


/* ================================================================== */
/* PLACE NAMES  for zoom < 13 -> admin_place
/* ================================================================== */

/* ---- Big cities -------------------------------------------------- */
#admin_place [type='city'][admin_level>=3][zoom>=6][zoom<13] {
    text-name: '[name]';
    text-face-name: @sans_bold;
    text-placement: point;
    text-fill: @city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: 2;
    text-label-position-tolerance: 20;
    text-allow-overlap: true;

    [zoom=6] {
        text-size: 12;
    }
    [zoom=7] {
        text-size: 14;
    }
    [zoom=8] {
        text-size: 16;
    }
    [zoom=9] {
        text-size: 18;
    }
    [zoom=10] {
        text-size: 20;
        text-character-spacing: 1.5;
    }
    [zoom=11] {
        text-size: 22;
        text-face-name: @sans;
        text-character-spacing: 1.5;
    }
    [zoom=12] {
        text-size: 26;
        text-face-name: @sans;
        text-character-spacing: 1;
    }
}


/* ---- Regional cities --------------------------------------------- */
/* France = préfectures */
#admin_place [admin_level=4][type!='city'][zoom>=7][zoom<13] {
    text-name: '[name]';
    text-face-name: @sans;
    text-placement: point;
    text-fill: @town_text;
    text-halo-fill: @town_halo;
    text-halo-radius: 1.5;
    text-wrap-width: 50;
    text-label-position-tolerance: 20;
    text-allow-overlap: true;

    [zoom=7] {
        text-size: 10;
    }
    [zoom=8] {
        text-size: 12;
    }
    [zoom=9] {
        text-size: 14;
    }
    [zoom=10] {
        text-size: 16;
        text-face-name: @sans_bold;
    }
    [zoom=11] {
        text-size: 18;
        text-face-name: @sans_bold;
    }
    [zoom=12] {
        text-size: 22;
        text-face-name: @sans_bold;
        text-character-spacing: 1.5;
    }
}


/* ---- Minor cities ------------------------------------------------ */
/* France = sous-préfectures */
#admin_place [admin_level=3][type!='city'][zoom>=8][zoom<13] {
    text-name: '[name]';
    text-face-name: @sans;
    text-placement: point;
    text-fill: @town_text;
    text-halo-fill: @town_halo;
    text-halo-radius: 1.5;
    text-wrap-width: 50;
    text-label-position-tolerance: 20;
    text-allow-overlap: true;

    [zoom=8] {
        text-size: 9;
    }
    [zoom=9] {
        text-size: 11;
        text-face-name: @sans_bold;
    }
    [zoom=10] {
        text-size: 13;
        text-face-name: @sans_bold;
    }
    [zoom=11] {
        text-size: 15;
        text-face-name: @sans_bold;
    }
    [zoom=12] {
        text-size: 17;
        text-face-name: @sans_bold;
    }
}

/* France = chef-lieu de canton */
#admin_place [admin_level=2][type!='city'][zoom>=9][zoom<13] {
    text-name: '[name]';
    text-face-name: @sans;
    text-placement: point;
    text-fill: @town_text;
    text-halo-fill: @town_halo;
    text-halo-radius: 1.5;
    text-wrap-width: 25;
    text-placement-type: simple;
    text-placements: "N,S,E,W,NE,SE,NW,SW,16,14,12";
    text-dy: 3;
    text-dx: 3;

    [zoom=9] {
        text-size: 9;
    }
    [zoom=10] {
        text-size: 11;
        text-face-name: @sans_bold;
    }
    [zoom=11] {
        text-size: 14;
        text-face-name: @sans_bold;
        text-wrap-width: 50;
    }
    [zoom=12] {
        text-size: 17;
        text-face-name: @sans;
        text-line-spacing: 1;
        text-wrap-width: 50;
    }
}


/* ---- Town / village / municipality ------------------------------- */
/* France = commune */
#admin_place [admin_level=1][type!='city'][zoom>=10][zoom<13] {
    text-name: '[name]';
    text-face-name: @sans;
    text-placement: point;
    text-fill: @town_text;
    text-halo-fill: @town_halo;
    text-halo-radius: 1.5;
    text-placement-type: simple;
    text-placements: "N,S,E,W,NE,SE,NW,SW,16,14,12";
    text-dy: 3;
    text-dx: 3;

    [zoom=10] {
        text-size: 7;
        text-wrap-width: 30;
    }
    [zoom=11] {
        text-size: 10;
        text-wrap-width: 30;
    }
    [zoom=12] {
        text-size: 13;
        text-line-spacing: 1;
        text-wrap-width: 50;
    }
}




/* ================================================================== */
/* PLACE NAMES  for zoom >= 13 -> place
/* ================================================================== */

#place::city[type='city'][zoom>=13][zoom<=14] {
	text-name: '[name]';
	text-face-name: @sans;
	text-placement: point;
	text-fill: @city_text;
	text-halo-fill: @city_halo;
	text-halo-radius: 2;
	text-label-position-tolerance: 20;
    text-allow-overlap: true;
  
	[zoom=13] {
		text-size: 24;
		text-character-spacing: 3;
		text-wrap-width: 200;
		text-transform: uppercase;
	}
	[zoom=14] {
		text-size: 26;
		text-character-spacing: 4;
		text-wrap-width: 300;
		text-transform: uppercase;
	}
}


#place::town[type='town'][zoom>=13][zoom<15],
#place::village[type='village'][zoom>=13][zoom<15] {
	text-name: '[name]';
	text-face-name: @sans;
	text-placement: point;
	text-fill: @town_text;
	text-size: 15;
	text-halo-fill: @town_halo;
	text-halo-radius: 1.5;
	text-wrap-width: 50;
	text-label-position-tolerance: 20;
    text-allow-overlap: false;

	[zoom=13] {
		text-size: 15;
    	text-character-spacing: 1;
		text-line-spacing: 2;
	}
	[zoom=14] {
		text-size: 18;
    	text-character-spacing: 1;
		text-line-spacing: 2;
	}
}


#place::small[type='hamlet'][zoom>=13],
#place::small[type='locality'][zoom>=13],
#place::small[type='isolated_dwelling'][zoom>=13],
#place::small[type='farm'][zoom>=13] {
	text-name: '[name]';
	text-face-name: @sans;
	text-placement: point;
	text-fill: @place_text;
	text-size: 10;
	text-halo-fill: @other_halo;
	text-halo-radius: 1;
	text-wrap-width: 30;
	text-avoid-edges: true;
	text-label-position-tolerance: 20;
  
	[zoom=13] {
		text-size: 9;
    	text-fill: @place_text_light;
		text-character-spacing: 1;
		text-wrap-width: 40;
		text-line-spacing: 1;
	}
	[zoom>=14] {
		text-size: 10;
    	text-fill: @place_text;
    	text-halo-radius: 1.5;
		text-character-spacing: 1;
		text-wrap-width: 50;
		text-line-spacing: 1;
	}
	[zoom=15] {
		text-size: 11;
    	text-halo-radius: 2;
		text-wrap-width: 60; 
	}
  	[zoom>=16] {
		text-size: 13;
		text-wrap-width: 60; 
	}
}

#place::suburb[type='suburb'][zoom>=13][zoom<=16] {
	text-name: '[name]';
	text-face-name: @sans_bold_italic;
	text-placement: point;
	text-fill: @suburb_text;
	text-size: 15;
	text-halo-fill: @suburb_halo;
	text-halo-radius: 2.0;
	text-wrap-width: 50;
	text-label-position-tolerance: 20;
    text-allow-overlap: false;

	[zoom=13] {
		text-size: 11;
    	text-character-spacing: 1;
		text-line-spacing: 2;
	}
	[zoom=14] {
		text-size: 13;
    	text-character-spacing: 1;
		text-line-spacing: 2;
	}
	[zoom=15] {
		text-size: 16;
    	text-character-spacing: 2;
		text-line-spacing: 2;
	}
	[zoom=16] {
		text-size: 18;
    	text-character-spacing: 4;
		text-line-spacing: 2;
	}
}

#place::suburb[type='neighbourhood'][zoom>=13][zoom<=16] {
	text-name: '[name]';
	text-face-name: @sans_bold_italic;
	text-placement: point;
	text-fill: @suburb_text;
	text-size: 13;
	text-halo-fill: @suburb_halo;
	text-halo-radius: 2.0;
	text-wrap-width: 50;
	text-label-position-tolerance: 20;
    text-allow-overlap: false;

	[zoom=13] {
		text-size: 9;
    	text-character-spacing: 1;
		text-line-spacing: 2;
	}
	[zoom=14] {
		text-size: 11;
    	text-character-spacing: 1;
		text-line-spacing: 2;
	}
	[zoom=15] {
		text-size: 14;
    	text-character-spacing: 2;
		text-line-spacing: 2;
	}
	[zoom=16] {
		text-size: 16;
    	text-character-spacing: 4;
		text-line-spacing: 2;
	}
}


// =====================================================================
// POI LABELS
// =====================================================================


#poi[type='university'][zoom>=15],
#poi[type='hospital'][zoom>=16],
#poi[type='school'][zoom>=17],
#poi[type='library'][zoom>=17] {
	text-name: '[name]';
	text-face-name: @sans;
	text-size: 10;
	text-wrap-width: 30;
	text-fill: @poi_text;
}


/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=15],
#waterway_label[type='stream'][zoom>=17] {
	text-name: '[name]';
	text-face-name: @sans_italic;
	text-fill: @water * 0.75;
	text-halo-fill: @water*1.8;
	text-halo-radius: 1;
	text-placement: line;
	text-min-distance: 300;
	text-size: 10;
	[type='river'][zoom=15],
	[type='canal'][zoom=17] {
		text-size: 11;
		text-name: '[name]';
	}
	[type='river'][zoom>=16],
	[type='canal'][zoom=18] {
		text-size: 14;
		text-name: '[name]';
		text-spacing: 300;
	}
}

/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

#motorway_label[zoom>=9][zoom<=14][reflen<=8][reflen>=1] {
	shield-name: '[ref]';
	shield-size: 9;
	shield-face-name: @sans_bold;
	shield-fill: #fff;
	shield-file: url('img/shield-motorway-1.png');
	shield-avoid-edges: true;
	[type='motorway'] {
		[reflen=1] { shield-file: url('img/shield-motorway-1.png'); }
		[reflen=2] { shield-file: url('img/shield-motorway-2.png'); }
		[reflen=3] { shield-file: url('img/shield-motorway-3.png'); }
		[reflen=4] { shield-file: url('img/shield-motorway-4.png'); }
		[reflen=5] { shield-file: url('img/shield-motorway-5.png'); }
		[reflen=6] { shield-file: url('img/shield-motorway-6.png'); }
		[reflen=7] { shield-file: url('img/shield-motorway-7.png'); }
		[reflen=8] { shield-file: url('img/shield-motorway-8.png'); }
	}
	[type='trunk'] {
		[reflen=1] { shield-file: url('img/shield-trunk-1.png'); }
		[reflen=2] { shield-file: url('img/shield-trunk-2.png'); }
		[reflen=3] { shield-file: url('img/shield-trunk-3.png'); }
		[reflen=4] { shield-file: url('img/shield-trunk-4.png'); }
		[reflen=5] { shield-file: url('img/shield-trunk-5.png'); }
		[reflen=6] { shield-file: url('img/shield-trunk-6.png'); }
		[reflen=7] { shield-file: url('img/shield-trunk-7.png'); }
		[reflen=8] { shield-file: url('img/shield-trunk-8.png'); }
	}
	[zoom=9]  { shield-min-distance: 30; }
	[zoom=10] { shield-min-distance: 50; }
	[zoom=11] { shield-min-distance: 60; }
	[zoom=12] { shield-min-distance: 80; }
	[zoom=13] { shield-min-distance: 120; }
	[zoom=14] { shield-min-distance: 180; }
}

#motorway_label[type='motorway'][zoom>9],
#motorway_label[type='trunk'][zoom>9] {
	text-name: '[name]';
	text-face-name: @sans_bold;
	text-placement: line;
	text-fill: @road_text;
	text-halo-fill: @road_halo;
	text-halo-radius: 1;
	text-min-distance: 60;
	text-size: 11;
	[zoom=11] { text-min-distance: 70; }
	[zoom=12] { text-min-distance: 80; }
	[zoom=13] { text-min-distance: 100; }
}

#mainroad_label[type='primary'][zoom>12],
#mainroad_label[type='secondary'][zoom>13],
#mainroad_label[type='tertiary'][zoom>13] {
	text-name: '[name]';
	text-face-name: @sans;
	text-placement: line;
	text-fill: @road_text;
	text-halo-fill: @road_halo;
	text-halo-radius: 1;
	text-min-distance: 60;
	text-size: 12;
	[zoom=17]  { text-size: 13; }
	[zoom>=18] { text-size: 14; }
}

#minorroad_label[zoom>14] {
	text-name: '[name]';
	text-face-name: @sans;
	text-placement: line;
	text-size: 11;
	text-fill: @road_text;
	text-halo-fill: @road_halo;
	text-halo-radius: 1;
	text-min-distance: 60;
	[zoom=17]  { text-size: 12; }
	[zoom>=18] { text-size: 13; }
}

/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */

/*#motorway_label[zoom>=16],
#mainroad_label[zoom>=16],
#minorroad_label[zoom>=16] {
	[oneway='yes'],[oneway=1],[oneway='true'],[oneway=-1]{
		marker-placement: line;
		marker-max-error: 0.5;
		marker-spacing: 200;
		[zoom=16] { marker-transform: 'scale(0.6)'; }
		[zoom=17] { marker-transform: 'scale(0.75)'; }
		
	}
	[oneway=1] { marker-file: url('img/icon/oneway.svg'); }
	[oneway=-1] { marker-file: url('img/icon/oneway-reverse.svg'); }	
}*/

/* Addresses */

#addrinterpolation[zoom>=17] {
	line-width: 1;
	line-color: #bbbbbb;
	line-dasharray: 4, 4;
}

#housenumber[zoom>=17] {
	text-name: '[addr:housenumber]';
	text-face-name: @sans;
	text-placement: point;
	text-size: 10;
	text-wrap-width: 10;
	text-fill: @poi_text;
	text-min-distance: 3;
}

#laender_abk[zoom<5][zoom>2][ISO_A2!='-99'] {
	text-name: '[ISO_A2]';
	text-face-name: @sans_bold;
	text-placement: point;
	text-fill: @country_text;
	text-halo-fill: @country_halo;
	text-transform: uppercase;
	text-halo-radius: 1;
}

/* ================================================================== */
/* BUILDING LABELS
/* ================================================================== */

#building-text [zoom>=16] {
    text-name: '[name]';
    text-face-name: @sans;
    text-placement: point;
    text-fill: @poi_text;
    text-halo-fill: @town_halo;
    text-halo-radius: 1.5;
    text-wrap-width: 50;
    text-label-position-tolerance: 20;
    text-allow-overlap: true;
}

/* ================================================================== */
/* LEISURE LABELS
/* ================================================================== */

#leisure-text [zoom>=16] {
    text-name: '[name]';
    text-face-name: @sans;
    text-placement: point;
    text-fill: @poi_text;
    text-halo-fill: @town_halo;
    text-halo-radius: 1.5;
    text-wrap-width: 50;
    text-label-position-tolerance: 20;
    text-allow-overlap: true;
}

