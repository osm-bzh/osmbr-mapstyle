/* ================================================================== */
/* ADMINISTRATIVE BOUNDARIES
/* ================================================================== */


#admin_boundaries [zoom>=11] {
  background/line-color: @admin_boundary_bkline;
  background/line-width: 0;
  comp-op: darken;
  opacity: 0.85;
  line-cap: round;
  line-width: 0;
  line-join: round;
  line-color: @admin_boundary_line;

  [admin_level = 2]{
    [nb>=2] {
      line-width: 3;
      background/line-width: 3;
    }
    [maritime='yes'] {
    	line-color: #0041ff;
      line-dasharray: 4, 8;
      line-width: 1.5;
      background/line-width: 1.5;
    }
  }

  [admin_level = 3],
  [admin_level = 4] {
    [nb>=2]{
      line-width: 3;
      background/line-width: 3;
      line-dasharray: 6,5,0.1,5,0.1,5;
    }
    [maritime='yes']
    {
    	line-color: #0041ff;
      line-dasharray: 6,5,1,5,1,5;
      line-width: 1;
      background/line-width: 1;
    }
  }

  [admin_level = 5],
  [admin_level = 6] {
    [nb>=2]{
      line-width: 2;
      background/line-width: 2;
      line-dasharray: 6,4,0.1,4;
    }
    [maritime='yes']
    {
    	line-color: #0041ff;
      line-dasharray: 6,4,1,4;
      line-width: 0.8;
      background/line-width: 0.8;
    }
  }

  [admin_level = 7],
  [admin_level = 8] {
    [zoom >= 12] {
      line-width: 1.5;
      background/line-width: 1.5;
      line-dasharray: 5,4;
      [maritime='yes']
      {
      	line-color: @admin_boundary_maritime;
        line-dasharray: 6,4,1,4;
        line-width: 0.8;
        background/line-width: 0.8;
      }
    }
  }

  [admin_level = 9] {
    [zoom >= 12] {
      line-width: 1.5;
      background/line-width: 1.5;
      line-dasharray: 3,6;
    }
  }

  [admin_level = 10] {
    [zoom >= 15] {
      line-width: 1.5;
      background/line-width: 1.5;
      line-dasharray: 1,6;
    }
  }
}