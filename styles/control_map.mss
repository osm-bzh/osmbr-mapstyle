
@done:	#3d9733;
@null:	#a90825;



#admin_boudaries {
	line-color: #807c7f;
	[zoom>=11] {
		line-width: 2;
		opacity: 1.0;
	}
	[zoom<11][zoom>=7] {
		line-width: 0.1;
		opacity: 0.5;
	}
	[zoom<7] {
		line-width: 0;
		opacity: 0;
	}
}


#places {
	[check='done'] {
		marker-fill: @done;
	}
	[check='null'] {
		marker-fill: @null;
	}
	[zoom<10] { marker-width: 0 ; opacity: 0 ; }
	[zoom=10] { marker-width: 2 ; opacity: 1 ; marker-line-opacity: 0 }
	[zoom=11] { marker-width: 4 ; opacity: 1 ; marker-line-opacity: 0 }
	[zoom=12] { marker-width: 6 ; opacity: 1 ; marker-line-opacity: 0.3 }
	[zoom=13] { marker-width: 8 ; opacity: 1 ; marker-line-opacity: 0.6 }
	[zoom>=14] { marker-width: 10 ; opacity: 1 ; marker-line-opacity: 0.75 }
} 

#ways {
	[check='done'] {
		line-color: @done;
	}
	[check='null'] {
		line-color: @null;
	}
	[zoom<10] { line-width: 0 ; opacity: 0 ; }
	[zoom=10] { line-width: 0.2 ; opacity: 1 ; }
	[zoom=11] { line-width: 0.5 ; opacity: 1 ; }
	[zoom=12] { line-width: 1 ; opacity: 1 ; }
	[zoom=13] { line-width: 1.5 ; opacity: 1 ; }
	[zoom>=14] { line-width: 2.5 ; opacity: 1 ; }
} 
