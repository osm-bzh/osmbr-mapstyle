

/* Font sets are defined in palette.mss */


@standard-halo-radius: 1;
@standard-halo-fill: rgba(255,255,255,0.6);


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
/* PLACE NAMES  for cities, towns
/* ================================================================== */


/* ---- Big cities -------------------------------------------------- */
/* Rennes Brest Nantes… */

#placenames_medium
  [place='city']
  [admin_level>=3]
  [zoom>=6][zoom<=13] {
    
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
    [zoom>=12][zoom<=13] {
        text-size: 26;
        text-face-name: @sans;
        text-character-spacing: 1;
    }
}


/* ---- Regional cities --------------------------------------------- */
/* France = (en gros) préfectures */

#placenames_medium
  [place!='city']
  [admin_level=6]
  [zoom>=7][zoom<=15] {

    text-name: '[name]';
    text-face-name: @sans;
    text-placement: point;
    text-fill: @city_text;
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
    [zoom>=12][zoom<=15] {
        text-size: 22;
        text-face-name: @sans_bold;
        text-character-spacing: 1.5;
    }
}



/* ---- Minor cities ------------------------------------------------ */
/* France = sous-préfectures */

#placenames_medium
  [admin_level=7]
  [place!='city']
  [zoom>=8][zoom<=15] {
  
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
    [zoom>=12][zoom<=15] {
        text-size: 17;
        text-face-name: @sans_bold;
    }
}


/* France = chef-lieu de canton */
#placenames_medium
  [admin_level=8]
  [place!='city']
  [zoom>=9][zoom<=15] {
    
    text-name: '[name]';
    text-face-name: @sans;
    text-placement: point;
    text-fill: @town_text;
    text-halo-fill: @town_halo;
    text-halo-radius: 1.5;
    text-wrap-width: 35;
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
        text-size: 13;
        text-face-name: @sans_bold;
        text-wrap-width: 50;
    }
    [zoom>=12][zoom<=15]{
        text-size: 16;
        text-face-name: @sans;
        text-line-spacing: 1;
        text-wrap-width: 50;
    }
}



/* ================================================================== */
/* PLACE NAMES  for all others types : quarter, suburbs, village…
/* ================================================================== */


#placenames_small::suburb {
  [place = 'suburb'][zoom >= 12][zoom < 17] {
    text-name: "[name]";
    text-size: 11;
    text-fill: @suburb_text;
    text-face-name: @sans_italic;
    text-halo-fill: @suburb_halo;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 55; // 5.0 em
    text-line-spacing: -0.55; // -0.05 em
    text-margin: 7.7; // 0.7 em

    [zoom >= 13] {
      text-size: 12;
      text-wrap-width: 60; // 5.0 em
      text-line-spacing: -0.60; // -0.05 em
      text-margin: 8.4; // 0.7 em
    }
    [zoom >= 14] {
      text-size: 14;
      text-wrap-width: 70; // 5.0 em
      text-line-spacing: -0.70; // -0.05 em
      text-margin: 9.8; // 0.7 em
      text-halo-fill: white;
    }
    [zoom >= 16] {
      text-size: 15;
      text-wrap-width: 75; // 5.0 em
      text-line-spacing: -0.75; // -0.05 em
      text-margin: 10.5; // 0.7 em
    }
  }
}


#placenames_small::village {
  [place = 'village'] {
  [zoom >=10 ][zoom <=16 ] {
      
      text-name: "[name]";
      text-size: 10;
      text-fill: @village_text;
      text-face-name: @sans;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-wrap-width: 50; // 5.0 em
      text-line-spacing: -0.50; // -0.05 em
      text-margin: 7.0; // 0.7 em

      [zoom = 10 ] {
        text-size: 8;
        text-wrap-width: 30; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
      [zoom = 11 ] {
        text-size: 10;
        text-wrap-width: 40; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
      [zoom = 12 ] {
        text-size: 12;
        text-wrap-width: 50; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
      [zoom = 13 ] {
        text-size: 13;
        text-wrap-width: 55; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
      [zoom >= 14] {
        text-fill: @place_text_light;
        text-halo-fill: white;
        text-size: 14;
        text-wrap-width: 65; // 5.0 em
        text-line-spacing: -0.65; // -0.05 em
        text-margin: 9.1; // 0.7 em
      }
      [zoom >= 15] {
        text-size: 15;
        text-wrap-width: 70; // 5.0 em
        text-line-spacing: -0.70; // -0.05 em
        text-margin: 9.8; // 0.7 em
      }
      [zoom >= 16] {
        text-size: 16;
        text-wrap-width: 75; // 5.0 em
        text-line-spacing: -0.75; // -0.05 em
        text-margin: 10.5; // 0.7 em
      }
    }
  }
}


#placenames_small::quarter {
  [place = 'quarter'] {
    [zoom >= 14][zoom < 17] {
      text-name: "[name]";
      text-fill: @place_text;
      text-face-name: @sans;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
      [zoom >= 14] {
        text-halo-fill: white;
        text-size: 11;
        text-wrap-width: 55; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
      [zoom >= 15] {
        text-fill: @place_text_light;
        text-size: 12;
        text-wrap-width: 60; // 5.0 em
        text-line-spacing: -0.60; // -0.05 em
        text-margin: 8.4; // 0.7 em
      }
      [zoom >= 16] {
        text-size: 14;
        text-wrap-width: 70; // 5.0 em
        text-line-spacing: -0.70; // -0.05 em
        text-margin: 9.8; // 0.7 em
      }
    }
  }
}


#placenames_small::hamlet {
  [place = 'hamlet'],
  [place = 'locality'] {
    [zoom >= 13] {

      text-name: '[name]';
      text-face-name: @sans;
      text-placement: point;
      text-halo-fill: @other_halo;
      text-avoid-edges: true;
      text-label-position-tolerance: 20;
      
      [zoom=13] {
        text-size: 8;
        text-fill: @place_text;
        text-halo-radius: 1;
        text-character-spacing: 0.55;
        text-wrap-width: 30;
        text-line-spacing: 1;
      }
      [zoom>=14] {
        text-size: 10;
        text-fill: @place_text;
        text-halo-radius: 1.5;
        text-character-spacing: 0.75;
        text-wrap-width: 50;
        text-line-spacing: 1;
      }
      [zoom=15] {
        text-size: 11;
        text-fill: @place_text_light;
        text-halo-radius: 1.5;
        text-wrap-width: 60;
        text-label-position-tolerance: 10;
      }
      [zoom>=16] {
        text-size: 13;
        text-fill: @place_text_light;
        text-halo-radius: 2;
        text-wrap-width: 60;
        text-label-position-tolerance: 10;
      }
    }
  }
}


#placenames_small::neighbourhood {
  [place = 'neighbourhood'],
  [place = 'isolated_dwelling'],
  [place = 'farm'] {
    [zoom >= 14] {

      text-name: '[name]';
      text-face-name: @sans;
      text-placement: point;
      text-fill: @suburb_text;
      text-halo-fill: @suburb_halo;
      text-halo-radius: 2.0;
      text-wrap-width: 50;
      text-label-position-tolerance: 20;
      text-allow-overlap: false;

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
      [zoom>=16] {
        text-size: 16;
        text-character-spacing: 4;
        text-line-spacing: 2;
      }
    }
  }
}


