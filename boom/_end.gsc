#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
init()
{
	level.movingEnding = spawn( "script_model", level.endingPoints[ 0 ][ 0 ] );
	level.movingEnding.angles = level.endingPoints[ 0 ][ 1 ];
	level.movingEnding setModel( "tag_origin" );
	level.movingEnding hide();
	
	time = 30; // change to your needs ( 30s suits best )
	waittillframeend;
	
	players = level.players;
	for( i = 0; i < players.size; i++ )
	{
		player = players[ i ];
		player thread spawnEnding();
		player thread endingAngles();
		player setClientDvars( "ui_hud_hardcore", 1,"cg_drawSpectatorMessages", 0,"g_compassShowEnemies", 0 );
	}

	rand = (1+randomInt(2));
	level thread duffman\_common::playSoundOnAllPlayers( "endmap" + rand);

 	thread boom\_credits::init();//Credits
	
	if( level.endingPoints.size < 2 )
		return;
	
	fullDist = 0;
	for( i = 1; i < level.endingPoints.size; i++ )
		fullDist += distance( level.endingPoints[ i - 1 ][ 0 ], level.endingPoints[ i ][ 0 ] );
	
	level.endingMoveSpeed = fullDist / time;

	for( i = 1; i < level.endingPoints.size; i++ )
	{
		duration = distance( level.endingPoints[ i - 1 ][ 0 ], level.endingPoints[ i ][ 0 ] ) / level.endingMoveSpeed;
		level.movingEnding moveTo( level.endingPoints[ i ][ 0 ], duration );
		level.movingEnding rotateTo( level.endingPoints[ i ][ 1 ], duration );
		wait duration;
	}
}

//Thanks to Frames For The Arrays :P
setStuff()
{
	array = 0;
	array = [];
	switch( toLower( getDvar( "mapname" ) ) )
	{
		case "mp_backlot":
				array[ array.size ] = ( 632.152, -259.681, 436.125 );
				array[ array.size ] = ( 24.5038, 33.23, 0 );
				array[ array.size ] = ( 230.328, -221.462, 436.125 );
				array[ array.size ] = ( 28.2556, 125.751, 0 );
				array[ array.size ] = ( 196.716, -532.554, 436.125 );
				array[ array.size ] = ( 25.119, -143.09, 0 );
				array[ array.size ] = ( 599.905, -579.745, 436.125 );
				array[ array.size ] = ( 20.7959, -56.4569, 0 );
				array[ array.size ] = ( 636.121, -256.483, 436.125 );
				array[ array.size ] = ( 23.2623, 36.3446, 0 );
				break;
				
			case "mp_nuketown":
				array[ array.size ] = (1870.41, 214.654, 242.282);
				array[ array.size ] = (9.61623, -165.599, 0);
				array[ array.size ] = (1879.22, -130.337, 274.516);
				array[ array.size ] = (4.54604, -162.852, 0);
				array[ array.size ] = (838.799, -491.844, 301.478);
				array[ array.size ] = (14.1975, -121.686, 0);
				array[ array.size ] = (468.009, -376.022, 326.074);
				array[ array.size ] = (20.2785, 126.363, 0);
				array[ array.size ] = (-105.045, 551.953, 333.055);
				array[ array.size ] = (16.3014, -99.3292, 0);
				array[ array.size ] = (-1409.22, 818.578, 337.528);
				array[ array.size ] = (18.7184, -98.8678, 0);
				array[ array.size ] = (-1449.45, -189.884, 836.627);
				array[ array.size ] = (34.9672, -7.05505, 0);
				break;
			
			case "mp_bloc":
				array[ array.size ] = ( 532.617, -5824.3, 103.279 );
				array[ array.size ] = ( 0.218506, 0.258179, 0 );
				array[ array.size ] = ( 1106.63, -6332.14, 126.074 );
				array[ array.size ] = ( 2.89917, 90.39, 0 );
				array[ array.size ] = ( 1678.21, -5823.98, 126.074 );
				array[ array.size ] = ( 2.0752, 179.901, 0 );
				array[ array.size ] = ( 1103.39, -5316.33, 126.074 );
				array[ array.size ] = ( 2.0752, -89.5551, 0 );
				array[ array.size ] = ( 534.407, -5826.23, 126.074 );
				array[ array.size ] = ( 2.27844, 0.362549, 0 );
				break;
			
			case "mp_bog":
				array[ array.size ] = ( 6443.11, -14.6996, 395.141 );
				array[ array.size ] = ( 16.2543, 150.236, 0 );
				array[ array.size ] = ( 6092.53, 1425.36, 395.141 );
				array[ array.size ] = ( 14.6118, -172.52, 0 );
				array[ array.size ] = ( 5713.52, 3250.76, 395.141 );
				array[ array.size ] = ( 14.8151, -131.157, 0 );
				break;
			
			case "mp_cargoship":
				array[ array.size ] = ( 4557.29, 9.42193, 373.427 );
				array[ array.size ] = ( 5.56885, 179.349, 0 );
				array[ array.size ] = ( 2968.04, -1219.76, 373.427 );
				array[ array.size ] = ( 15.2423, 88.6015, 0 );
				array[ array.size ] = ( -2506.21, -1329, 708.939 );
				array[ array.size ] = ( 15.2423, 88.6015, 0 );
				array[ array.size ] = ( -4583.84, -2.36443, 629.941 );
				array[ array.size ] = ( 9.68872, -1.94238, 0 );
				break;
				
			case "mp_citystreets":
				array[ array.size ] = ( 2843.61, 785.444, 867.3 );
				array[ array.size ] = ( 85, -89.3573, 0 );
				array[ array.size ] = ( 2843.61, 785.444, 100.108 );
				array[ array.size ] = ( 14.2151, -89.1541, 0 );
				array[ array.size ] = ( 2990.22, -1305.69, 100.108 );
				array[ array.size ] = ( 14.2151, -89.1541, 0 );
				array[ array.size ] = ( 2990.22, -1305.69, 862.094 );
				array[ array.size ] = ( 85, -90.1813, 0 );
				break;
			
			case "mp_convoy":
				array[ array.size ] = ( 177.527, -6598.66, 240.932 );
				array[ array.size ] = ( 8.84949, 87.7149, 0 );
				array[ array.size ] = ( 387.23, -4538.82, 240.932 );
				array[ array.size ] = ( 8.02551, 94.2957, 0 );
				array[ array.size ] = ( 139.045, -1630.3, 62.5052 );
				array[ array.size ] = ( 0.615234, 89.3573, 0 );
				array[ array.size ] = ( 509.655, -1103.21, 143.653 );
				array[ array.size ] = ( 15.8423, 136.994, 0 );
				array[ array.size ] = ( 710.67, 299.978, 143.653 );
				array[ array.size ] = ( 17.699, -175.062, 0 );
				array[ array.size ] = ( 303.027, 1728.93, 143.653 );
				array[ array.size ] = ( 22.8406, -142.344, 0 );
				array[ array.size ] = ( 46.7493, 2680.65, 143.653 );
				array[ array.size ] = ( 11.5247, -90.2857, 0 );
				break;
			
			case "mp_countdown":
				array[ array.size ] = ( 6730.02, -4214.44, 3002.4 );
				array[ array.size ] = ( 23.8678, 135.505, 0 );
				array[ array.size ] = ( 3866, -1420.36, 2008.56 );
				array[ array.size ] = ( 29.4269, 146.201, 0 );
				array[ array.size ] = ( 3652.95, 1684.36, 2008.56 );
				array[ array.size ] = ( 34.3652, -170.793, 0 );
				array[ array.size ] = ( 4339.54, 8499.13, 2072.76 );
				array[ array.size ] = ( 22.2253, -117.081, 0 );
				break;
			
			case "mp_crash":
			case "mp_crash_snow":
				array[ array.size ] = ( -642.1, -1707.08, 194.526 );
				array[ array.size ] = ( 11.5344, 21.4288, 0 );
				array[ array.size ] = ( -177.69, -1555.56, 194.526 );
				array[ array.size ] = ( 7.42004, 97.7728, 0 );
				array[ array.size ] = ( 1225.59, -1401.48, 194.526 );
				array[ array.size ] = ( 10.0952, 90.3626, 0 );
				array[ array.size ] = ( 1152.95, -407.898, 194.526 );
				array[ array.size ] = ( 10.304, -178.478, 0 );
				array[ array.size ] = ( 247.417, -312.382, 194.526 );
				array[ array.size ] = ( 8.24402, 75.7562, 0 );
				array[ array.size ] = ( 224.095, 895.877, 194.526 );
				array[ array.size ] = ( 13.1824, -46.6809, 0 );
				break;
			
			case "mp_crossfire":
				array[ array.size ] = ( 3321.89, 514.317, 37.2527 );
				array[ array.size ] = ( 1.23596, -80.4864, 0 );
				array[ array.size ] = ( 3416.83, -43.3893, 37.2527 );
				array[ array.size ] = ( 1.23596, -80.2832, 0 );
				array[ array.size ] = ( 3538.09, -864.219, 37.2527 );
				array[ array.size ] = ( 1.02722, -27.1973, 0 );
				array[ array.size ] = ( 4945.05, -1360.77, 37.2527 );
				array[ array.size ] = ( -0.609733, -33.1683, 0 );
				array[ array.size ] = ( 5604.05, -1594.81, 37.2527 );
				array[ array.size ] = ( 5.35034, -124.937, 0 );
				array[ array.size ] = ( 4389.02, -3482.88, -42.3672 );
				array[ array.size ] = ( 13.5791, -117.939, 0 );
				array[ array.size ] = ( 4342.17, -4279.88, -42.3672 );
				array[ array.size ] = ( 7.81677, -6.41662, 0 );
				array[ array.size ] = ( 6106.74, -4543.84, -42.3672 );
				array[ array.size ] = ( 6.78955, 87.2144, 0 );
				break;
			
			case "mp_farm":
				array[ array.size ] = ( -2096.64, -3049.86, 328.129 );
				array[ array.size ] = ( 16.051, 39.9761, 0 );
				array[ array.size ] = ( -1511.03, -2611.61, 248.074 );
				array[ array.size ] = ( 16.2543, 39.9761, 0 );
				array[ array.size ] = ( -962.843, -2309.48, 311.388 );
				array[ array.size ] = ( 4.93835, 93.4795, 0 );
				array[ array.size ] = ( 345.992, -1878.42, 494.546 );
				array[ array.size ] = ( 10.7007, 117.144, 0 );
				array[ array.size ] = ( 1510.39, -370.159, 1120.78 );
				array[ array.size ] = ( 20.1654, 145.95, 0 );
				array[ array.size ] = ( 2103.88, 2447.26, 1120.78 );
				array[ array.size ] = ( 27.1637, -161.37, 0 );
				array[ array.size ] = ( -493.637, 4290.04, 1120.78 );
				array[ array.size ] = ( 27.9877, -80.9175, 0 );
				array[ array.size ] = ( -1389.55, 1232.61, 1120.78 );
				array[ array.size ] = ( 25.3125, 42.3436, 0 );
				break;
			
			case "mp_overgrown":
				array[ array.size ] = ( -16.5178, -5465.88, -206.136 );
				array[ array.size ] = ( 8.4375, 89.0974, 0 );
				array[ array.size ] = ( 82.4006, -4747.45, -206.136 );
				array[ array.size ] = ( 8.4375, 89.0974, 0 );
				array[ array.size ] = ( 37.3323, -4138.58, -262.467 );
				array[ array.size ] = ( 6.17432, 89.3007, 0 );
				array[ array.size ] = ( 40.559, -3874.23, -262.467 );
				array[ array.size ] = ( 6.17432, 89.3007, 0 );
				array[ array.size ] = ( -53.9731, -3307.49, -262.467 );
				array[ array.size ] = ( 4.32312, 65.8449, 0 );
				array[ array.size ] = ( 123.281, -2556.41, -262.467 );
				array[ array.size ] = ( 3.70239, 45.8827, 0 );
				array[ array.size ] = ( 709.135, -2034.44, -262.467 );
				array[ array.size ] = ( 4.52637, 46.7067, 0 );
				array[ array.size ] = ( 1059.96, -1873.86, -262.467 );
				array[ array.size ] = ( 4.93835, 85.5983, 0 );
				array[ array.size ] = ( 1152.57, -1246.02, -325.786 );
				array[ array.size ] = ( 4.93835, 87.4495, 0 );
				array[ array.size ] = ( 1169.23, -871.875, -325.786 );
				array[ array.size ] = ( 4.93835, 87.4495, 0 );
				array[ array.size ] = ( 1302.98, -420.272, 44.1015 );
				array[ array.size ] = ( 16.051, 161.322, 0 );
				array[ array.size ] = ( 1285.35, 596.12, 44.1015 );
				array[ array.size ] = ( 10.7007, -94.3468, 0 );
				break;
			
			case "mp_pipeline":
				array[ array.size ] = ( -1971.42, -3803.22, 393.039 );
				array[ array.size ] = ( 6.78955, 51.9177, 0 );
				array[ array.size ] = ( -1616.51, -3356.01, 393.039 );
				array[ array.size ] = ( 5.35034, 37.1027, 0 );
				array[ array.size ] = ( -925.629, -2952.66, 393.039 );
				array[ array.size ] = ( 3.91113, 60.9705, 0 );
				array[ array.size ] = ( -278.803, -2395.52, 325.961 );
				array[ array.size ] = ( 5.1471, 103.57, 0 );
				array[ array.size ] = ( -415.593, -1858.83, 274.622 );
				array[ array.size ] = ( 9.05273, 113.65, 0 );
				array[ array.size ] = ( -657.629, -1254.81, 250.034 );
				array[ array.size ] = ( 10.9039, 85.871, 0 );
				array[ array.size ] = ( -715.399, -996.219, 223.231 );
				array[ array.size ] = ( 13.5791, 62.2064, 0 );
				array[ array.size ] = ( -696.217, -717.81, 223.231 );
				array[ array.size ] = ( 15.8423, 48.0066, 0 );
				array[ array.size ] = ( -520.505, -460.484, 163.269 );
				array[ array.size ] = ( 16.463, 36.6907, 0 );
				array[ array.size ] = ( -157.214, -188.487, 69.5334 );
				array[ array.size ] = ( 21.8134, 15.4981, 0 );
				array[ array.size ] = ( 256.96, -108.291, 302.724 );
				array[ array.size ] = ( 18.7262, 91.0181, 0 );
				array[ array.size ] = ( 1140.21, 460.786, 933.795 );
				array[ array.size ] = ( 36.0132, 139.166, 0 );
				array[ array.size ] = ( 134.717, 3816.68, 933.795 );
				array[ array.size ] = ( 33.9532, -88.1085, 0 );
				break;
			
			case "mp_showdown":
				array[ array.size ] = ( 9.64074, 2656.92, 30.7767 );
				array[ array.size ] = ( 1.64795, -89.3024, 0 );
				array[ array.size ] = ( 14.5538, 2151.75, 30.7767 );
				array[ array.size ] = ( 2.05994, -89.5056, 0 );
				array[ array.size ] = ( 21.1956, 1382.05, 30.7767 );
				array[ array.size ] = ( 2.05994, -89.5056, 0 );
				array[ array.size ] = ( -32.3971, 862.197, 30.7767 );
				array[ array.size ] = ( 2.05994, -89.5056, 0 );
				array[ array.size ] = ( 9.84008, 466.521, 30.7767 );
				array[ array.size ] = ( 2.05994, -89.5056, 0 );
				array[ array.size ] = ( 10.6912, 360.79, 267.417 );
				array[ array.size ] = ( 4.73511, -89.0936, 0 );
				array[ array.size ] = ( -214.496, 306.882, 267.417 );
				array[ array.size ] = ( 3.91113, -44.4397, 0 );
				array[ array.size ] = ( -340.982, 63.2711, 267.417 );
				array[ array.size ] = ( 2.26318, 3.7024, 0 );
				array[ array.size ] = ( -219.591, -158.814, 267.417 );
				array[ array.size ] = ( 2.87842, 50.2075, 0 );
				array[ array.size ] = ( 0.762029, -246.711, 267.417 );
				array[ array.size ] = ( 2.67517, 92.807, 0 );
				array[ array.size ] = ( 273.374, -133.146, 267.417 );
				array[ array.size ] = ( 2.87842, 145.278, 0 );
				array[ array.size ] = ( 350.21, 90.8337, 267.417 );
				array[ array.size ] = ( 2.67517, -175.831, 0 );
				break;
			
			case "mp_strike":
				array[ array.size ] = ( -2133.64, -2193.82, 272.616 );
				array[ array.size ] = ( -3.90563, -0.670166, 0 );
				array[ array.size ] = ( -1317.45, -2203.37, 272.616 );
				array[ array.size ] = ( -3.90563, -0.670166, 0 );
				array[ array.size ] = ( -948.751, -2206.48, 272.616 );
				array[ array.size ] = ( 5.96558, 93.988, 0 );
				array[ array.size ] = ( -800.608, -1754.59, 169.404 );
				array[ array.size ] = ( 11.3159, 105.919, 0 );
				array[ array.size ] = ( -1104.83, -1077.87, 76.8076 );
				array[ array.size ] = ( 9.26147, 88.6377, 0 );
				array[ array.size ] = ( -1091.78, -528.887, 76.8076 );
				array[ array.size ] = ( 9.26147, 88.6377, 0 );
				array[ array.size ] = ( -1117.51, -263.412, 76.8076 );
				array[ array.size ] = ( 10.9039, 27.9327, 0 );
				array[ array.size ] = ( -613.228, -153.65, 76.8076 );
				array[ array.size ] = ( 10.4919, 94.1913, 0 );
				array[ array.size ] = ( -637.193, 280.21, 76.8076 );
				array[ array.size ] = ( -17.8967, 91.3129, 0 );
				array[ array.size ] = ( -640.219, 450.725, 76.8076 );
				array[ array.size ] = ( -32.5085, 90.4889, 0 );
				array[ array.size ] = ( -364.131, 513.468, 76.8076 );
				array[ array.size ] = ( -29.2126, 136.582, 0 );
				array[ array.size ] = ( -395.497, 789.293, 76.8076 );
				array[ array.size ] = ( 11.7279, 92.1314, 0 );
				array[ array.size ] = ( -351.209, 1145.37, 76.8076 );
				array[ array.size ] = ( 12.7606, -175.062, 0 );
				array[ array.size ] = ( -646.226, 1100.72, 76.8076 );
				array[ array.size ] = ( 14.1998, 91.7194, 0 );
				array[ array.size ] = ( -653.256, 1979.08, 76.8076 );
				array[ array.size ] = ( 16.875, 89.2529, 0 );
				break;
			
			case "mp_vacant":
				array[ array.size ] = ( 2436.32, 1557.28, 45.6645 );
				array[ array.size ] = ( 14.8151, -120.168, 0 );
				array[ array.size ] = ( 2493.06, 971.953, 45.6645 );
				array[ array.size ] = ( 14.6118, -133.748, 0 );
				array[ array.size ] = ( 2452.35, -185.273, 45.6645 );
				array[ array.size ] = ( 15.2271, 178.72, 0 );
				array[ array.size ] = ( 2437.1, -960.567, 45.6645 );
				array[ array.size ] = ( 15.0238, 147.03, 0 );
				array[ array.size ] = ( 2148.31, -1307.77, 45.6645 );
				array[ array.size ] = ( 13.9911, 127.271, 0 );
				break;
			
			case "mp_killhouse":
				array[ array.size ] = (-2357.56, 2623.76, 390.15);
				array[ array.size ] = (2.8894, -88.8464, 0);
				array[ array.size ] = ( -3696.63, -270.007, 228.35 );
				array[ array.size ] = ( 14.6118, 1.43921, 0 );
				array[ array.size ] = ( -1951.17, -301.137, 228.35 );
				array[ array.size ] = ( 13.1671, -1.02172, 0 );
				array[ array.size ] = ( -1368.33, -243.579, 228.35 );
				array[ array.size ] = ( 13.1671, -47.9388, 0 );
				array[ array.size ] = ( 612.329, -177.555, 228.35 );
				array[ array.size ] = ( 13.5791, -91.9775, 0 );
				array[ array.size ] = ( 609.545, -1341.39, -31.1749 );
				array[ array.size ] = ( 5.35034, -91.1536, 0 );
				break;
        
				case "mp_toujane_beta":
				array[ array.size ] = (182.175, 28.6012, 150.979);
				array[ array.size ] = (6.64673, 26.1951, 0);
				array[ array.size ] = (525.283, 270.653, 150.979);
				array[ array.size ] = (6.08093, 11.6657, 0);
				array[ array.size ] = (1240.49, 301.914, 150.979);
				array[ array.size ] = (6.22375, -1.76513, 0);
				array[ array.size ] = (1654.07, 311.352, 150.979);
				array[ array.size ] = (4.98779, 41.543, 0);
				array[ array.size ] = (1978.86, 748.263, 150.979);
				array[ array.size ] = (3.71338, 64.6692, 0);
				array[ array.size ] = (2207.87, 1081.67, 150.979);
				array[ array.size ] = (3.60901, 42.6416, 0);
				array[ array.size ] = (2770.58, 1313.6, 293.157);
				array[ array.size ] = (-6.11389, 20.1141, 0);
				break;

			case "mp_bubba":
				array[ array.size ] = (-2357.56, 2623.76, 390.15);
				array[ array.size ] = (2.8894, -88.8464, 0);
				array[ array.size ] = (-2343.08, 1904.33, 353.83);
				array[ array.size ] = (2.8894, -88.8464, 0);
				array[ array.size ] = (-2335.48, 1527.15, 334.789);
				array[ array.size ] = (2.86194, -89.9561, 0);
				array[ array.size ] = (-2335.18, 1139.13, 315.391);
				array[ array.size ] = (2.74109, -87.2919, 0);
				array[ array.size ] = (-2329.61, 1021.35, 309.746);
				array[ array.size ] = (10.4205, -43.2861, 0);
				array[ array.size ] = (-2080.11, 868.284, 254.486);
				array[ array.size ] = (10.3711, -11.6785, 0);
				array[ array.size ] = (-1874.92, 960.983, 221.274);
				array[ array.size ] = (6.49292, 55.6073, 0);
				array[ array.size ] = (-1825.01, 1221.06, 188.649);
				array[ array.size ] = (6.47095, 106.88, 0);
				array[ array.size ] = (-1967.95, 1362.38, 165.412);
				array[ array.size ] = (6.74011, 141.367, 0);
				array[ array.size ] = (-2411.69, 1518.62, 120.008);
				array[ array.size ] = (3.80127, 171.53, 0);
				array[ array.size ] = (-2903.69, 1523.32, 87.5756);
				array[ array.size ] = (3.82874, -177.913, 0);
			
			case "mp_shipment":
				array[ array.size ] = ( 7380.19, 838.15, 257.574 );
				array[ array.size ] = ( 7.20154, -179.089, 0 );
				array[ array.size ] = ( 2275.92, 829.074, 257.574 );
				array[ array.size ] = ( 7.20154, -179.089, 0 );
				array[ array.size ] = ( 1710.06, 936.453, 257.574 );
				array[ array.size ] = ( 1.43921, -144.521, 0 );
				array[ array.size ] = ( 834.206, 853.26, 208.961 );
				array[ array.size ] = ( 4.11438, -85.0574, 0 );
				array[ array.size ] = ( 882.852, -484.497, 208.961 );
				array[ array.size ] = ( 4.11438, -88.1445, 0 );
				array[ array.size ] = ( 811.288, -671.743, 208.961 );
				array[ array.size ] = ( 7.61353, -176.623, 0 );
				array[ array.size ] = ( -706.043, -694.496, 208.961 );
				array[ array.size ] = ( 3.08716, -177.238, 0 );
				array[ array.size ] = ( -840.594, -686.777, 208.961 );
				array[ array.size ] = ( 9.26147, 90.9821, 0 );
				array[ array.size ] = ( -827.539, -141.223, 208.961 );
				array[ array.size ] = ( 5.76233, 125.759, 0 );
				break;
				
			case "mp_broadcast":
				array[ array.size ] = ( -3652.66, 4129.85, 23.9365 );
				array[ array.size ] = ( -4.93285, 4.1272, 0 );
				array[ array.size ] = ( -1889.94, 4195.61, 23.9365 );
				array[ array.size ] = ( -4.93285, 4.1272, 0 );
				array[ array.size ] = ( -1673.67, 4214.46, 23.9365 );
				array[ array.size ] = ( -2.05443, -32.9132, 0 );
				array[ array.size ] = ( -1202.97, 4195.73, 23.9365 );
				array[ array.size ] = ( 0.203247, -58.8409, 0 );
				array[ array.size ] = ( -373.003, 3972.64, 23.9365 );
				array[ array.size ] = ( 0.615234, -90.531, 0 );
				array[ array.size ] = ( 534.309, 3097.05, 23.9365 );
				array[ array.size ] = ( 3.70239, -115.844, 0 );
				array[ array.size ] = ( 1228.5, 1952.26, 23.9365 );
				array[ array.size ] = ( 4.32312, -145.474, 0 );
				array[ array.size ] = ( 1806.42, 1133.17, -65.9299 );
				array[ array.size ] = ( 3.49915, -104.731, 0 );
				array[ array.size ] = ( 2368.5, -430.923, -65.9299 );
				array[ array.size ] = ( 3.49915, -104.731, 0 );
				break;
			
			case "mp_creek":
				array[ array.size ] = ( 280.451, 14121.1, 399.056 );
				array[ array.size ] = ( -0.411987, -161.677, 0 );
				array[ array.size ] = ( -186.117, 13966.6, 399.056 );
				array[ array.size ] = ( -0.411987, -161.677, 0 );
				array[ array.size ] = ( -223.105, 13950.6, 399.056 );
				array[ array.size ] = ( 2.26318, -154.476, 0 );
				array[ array.size ] = ( -697.003, 13724.3, 399.056 );
				array[ array.size ] = ( 2.26318, -154.476, 0 );
				array[ array.size ] = ( -729.625, 13703.3, 399.056 );
				array[ array.size ] = ( 3.2959, -145.632, 0 );
				array[ array.size ] = ( -1600.14, 13108, 347.668 );
				array[ array.size ] = ( 3.08716, -140.897, 0 );
				array[ array.size ] = ( -1828.37, 12931.8, 329.393 );
				array[ array.size ] = ( 4.73511, -137.606, 0 );
				array[ array.size ] = ( -1993.27, 12809.6, 329.393 );
				array[ array.size ] = ( 4.93835, -93.161, 0 );
				array[ array.size ] = ( -2532.32, 12348.8, 329.393 );
				array[ array.size ] = ( 5.1471, -46.6559, 0 );
				array[ array.size ] = ( -3576.87, 11362.9, 329.393 );
				array[ array.size ] = ( 5.1471, -46.6559, 0 );
				array[ array.size ] = ( -2967.26, 10721.7, 329.393 );
				array[ array.size ] = ( 5.1471, -46.4471, 0 );
				array[ array.size ] = ( -2606.52, 10323.9, 329.393 );
				array[ array.size ] = ( 4.32312, -53.8574, 0 );
				array[ array.size ] = ( -2355.86, 10007.1, 329.393 );
				array[ array.size ] = ( 4.53186, -62.0862, 0 );
				array[ array.size ] = ( -2146.64, 9664.97, 329.393 );
				array[ array.size ] = ( 4.53186, -63.9374, 0 );
				array[ array.size ] = ( -1877.98, 9083.12, 329.393 );
				array[ array.size ] = ( 4.53186, -66.2006, 0 );
				array[ array.size ] = ( -1678.91, 8608.15, 329.393 );
				array[ array.size ] = ( 4.73511, -68.4637, 0 );
				array[ array.size ] = ( -1668.78, 8556.82, 329.393 );
				array[ array.size ] = ( 8.23425, -152.009, 0 );
				array[ array.size ] = ( -2889.77, 7907.88, 329.393 );
				array[ array.size ] = ( 8.23425, -152.009, 0 );
				array[ array.size ] = ( -2984.57, 7849.96, 329.393 );
				array[ array.size ] = ( 8.02551, -143.16, 0 );
				array[ array.size ] = ( -4011.45, 6926.23, 329.393 );
				array[ array.size ] = ( 6.5863, -128.553, 0 );
				array[ array.size ] = ( -4011.45, 6926.23, 2181.42 );
				array[ array.size ] = ( 50.0043, -25.6665, 0 );
				break;

				case "mp_slick":
				array[ array.size ] = ( 632.152, -259.681, 436.125 );
				array[ array.size ] = ( 24.5038, 33.23, 0 );
				array[ array.size ] = ( 230.328, -221.462, 436.125 );
				array[ array.size ] = ( 28.2556, 125.751, 0 );
				array[ array.size ] = ( 196.716, -532.554, 436.125 );
				array[ array.size ] = ( 25.119, -143.09, 0 );
				array[ array.size ] = ( 599.905, -579.745, 436.125 );
				array[ array.size ] = ( 20.7959, -56.4569, 0 );
				array[ array.size ] = ( 636.121, -256.483, 436.125 );
				array[ array.size ] = ( 23.2623, 36.3446, 0 );
				break;
		
		default:
			array[ array.size ] = ( -50, 50, 400 );
			array[ array.size ] = ( 0, 0, 0 );
			break;
	}
	n = 0;
	points = array.size / 2;
	for( i = 0; i < points; i++ )
	{
		level.endingPoints[ i ][ 0 ] = array[ n ];
		level.endingPoints[ i ][ 1 ] = array[ n + 1 ];
		n += 2;
		
	}
}

spawnEnding()
{
	self.sessionstate = "spectator";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.friendlydamage = undefined;
	
	self.statusicon = "";
	
	waittillframeend;
	self hide();
	self TakeAllWeapons();
	self freezeControls( true );
	
	self linkTo( level.movingEnding, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
	self setPlayerAngles( level.movingEnding.angles );
}

endingAngles()
{
	self endon( "disconnect" );
	
	for( ;; )
	{
		self setPlayerAngles( level.movingEnding.angles );
		wait 0.05;
	}
}