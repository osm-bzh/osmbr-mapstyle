/* LABELS.MSS CONTENTS:
 * - area labels
 * - waterway labels 
 */

/* Font sets are defined in palette.mss */




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

#building_label [zoom>=16] {
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

#leisure_label [zoom>=16] {
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
/* AMENITY LABELS
/* ================================================================== */

#townhall_label [zoom>=16] {
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
/* TRAIN STATION LABELS
/* ================================================================== */

#train_station_label [zoom>=16] {
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




