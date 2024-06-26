--[[
Copyright (C) 2007 <SWGEmu>

This File is part of Core3.

This program is free software; you can redistribute
it and/or modify it under the terms of the GNU Lesser
General Public License as published by the Free Software
Foundation; either version 2 of the License,
or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for
more details.

You should have received a copy of the GNU Lesser General
Public License along with this program; if not, write to
the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

Linking Engine3 statically or dynamically with other modules
is making a combined work based on Engine3.
Thus, the terms and conditions of the GNU Lesser General Public License
cover the whole combination.

In addition, as a special exception, the copyright holders of Engine3
give you permission to combine Engine3 program with free software
programs or libraries that are released under the GNU LGPL and with
code included in the standard release of Core3 under the GNU LGPL
license (or modified versions of such code, with unchanged license).
You may copy and distribute such a system following the terms of the
GNU LGPL for Engine3 and the licenses of the other code concerned,
provided that you include the source code of that other code when
and as the GNU LGPL requires distribution of source code.

Note that people who make modified versions of Engine3 are not obligated
to grant this special exception for their modified versions;
it is their choice whether to do so. The GNU Lesser General Public License
gives permission to release a modified version without this exception;
this exception also makes it possible to release a modified version
which carries forward this exception.
--]]


--[[
		Table Breakdown

	DPS:
		1 to 20 - 2 to 40, increments of 2
		21 to 30 - 50 to 140, increments of 10
		31 to 40 - 150 to 240, increments of 10
		41 to 50 - 243 to 270, increments of 3
		51 to 60 - 272 to 290, increments of 2
		61+ - increments of 2

	toHit:
		Hit is calculated with multiplier of 100
		1 to 20 - 10 to 29, increments of 10
		21 to 30 - 29.3 to 32, increments of 0.3
		31 to 40 - 32.3 to 35, increments of 0.3
		41 to 50 - 35.2 to 37, increments of 0.2
		51 to 60 - 37.2 to 39, increments of 0.2
		61+ - increments of 0.225

	HAM:
		1 to 20 - 3000 to 4900, incrememnts of 100
		21 to 30 - 5150 to 7400, increments of 250
		31 to 40 - 7600 to 9400, increments of 200
		41 to 50 - 9450 to 9900, increments of 50
		51 to 60 - 9950 to 10400, increments of 50
		61+ - incrememnts of 100

	Armor:
		1 to 20 - 0, no incrementing
		21 to 30 - 25 to 250, increments of 25
		31 to 40 - 275 to 500, increments of 25
		41 to 50 - 550 to 1000, increments of 50
		51 to 60 - 1050 to 1500, increments of 50
		61+ - increments of 100

	Regen:
		1 to 20 - 4 to 80, increments of 4
		21 to 30 - 83 to 110, incrememnts of 3
		31 to 40 - 113 to 140, increments of 3
		41 to 50 - 142 to 160, increments of 2
		51 to 60 - 162 to 180, increments of 2
		61+ - increments of 2
]]


-- level, dps, hit, ham, armor, regen
DNACharacteristics = {
	{ 1, 2, 10, 3000, 0, 4},
	{ 2, 4, 11, 3100, 0, 8},
	{ 3, 6, 12, 3200, 0, 12},
	{ 4, 8, 13, 3300, 0, 16},
	{ 5, 10, 14, 3400, 0, 20},
	{ 6, 12, 15, 3500, 0, 24},
	{ 7, 14, 16, 3600, 0, 28},
	{ 8, 16, 17, 3700, 0, 32},
	{ 9, 18, 18, 3800, 0, 36},
	{ 10, 20, 19, 3900, 0, 40},
	{ 11, 22, 20, 4000, 0, 44},
	{ 12, 24, 21, 4100, 0, 48},
	{ 13, 26, 22, 4200, 0, 52},
	{ 14, 28, 23, 4300, 0, 56},
	{ 15, 30, 24, 4400, 0, 60},
	{ 16, 32, 25, 4500, 0, 64},
	{ 17, 34, 26, 4600, 0, 68},
	{ 18, 36, 27, 4700, 0, 72},
	{ 19, 38, 28, 4800, 0, 76},
	{ 20, 40, 29, 4900, 0, 80},
	{ 21, 50, 29.3, 5150, 25, 83},
	{ 22, 60, 29.6, 5400, 50, 86},
	{ 23, 70, 29.9, 5650, 75, 89},
	{ 24, 80, 30.2, 5900, 100, 92},
	{ 25, 90, 30.5, 6150, 125, 95},
	{ 26, 100, 30.8, 6400, 150, 98},
	{ 27, 110, 31.1, 6650, 175, 101},
	{ 28, 120, 31.4, 6900, 200, 104},
	{ 29, 130, 31.7, 7150, 225, 107},
	{ 30, 140, 32, 7400, 250, 110},
	{ 31, 150, 32.3, 7600, 275, 113},
	{ 32, 160, 32.6, 7800, 300, 116},
	{ 33, 170, 32.9, 8000, 325, 119},
	{ 34, 180, 33.2, 8200, 350, 122},
	{ 35, 190, 33.5, 8400, 375, 125},
	{ 36, 200, 33.8, 8600, 400, 128},
	{ 37, 210, 34.1, 8800, 425, 131},
	{ 38, 220, 34.4, 9000, 450, 134},
	{ 39, 230, 34.7, 9200, 475, 137},
	{ 40, 240, 35, 9400, 500, 140},
	{ 41, 243, 35.2, 9450, 550, 142},
	{ 42, 246, 35.4, 9500, 600, 144},
	{ 43, 249, 35.6, 9550, 650, 146},
	{ 44, 252, 35.8, 9600, 700, 148},
	{ 45, 255, 36, 9650, 750, 150},
	{ 46, 258, 36.2, 9700, 800, 152},
	{ 47, 261, 36.4, 9750, 850, 154},
	{ 48, 264, 36.6, 9800, 900, 156},
	{ 49, 267, 36.8, 9850, 950, 158},
	{ 50, 270, 37, 9900, 1000, 160},
	{ 51, 272, 37.2, 9950, 1050, 162},
	{ 52, 274, 37.4, 10000, 1100, 164},
	{ 53, 276, 37.6, 10050, 1150, 166},
	{ 54, 278, 37.8, 10100, 1200, 168},
	{ 55, 280, 38, 10150, 1250, 170},
	{ 56, 282, 38.2, 10200, 1300, 172},
	{ 57, 284, 38.4, 10250, 1350, 174},
	{ 58, 286, 38.6, 10300, 1400, 176},
	{ 59, 288, 38.8, 10350, 1450, 178},
	{ 60, 290, 39, 10400, 1500, 180},
	{ 61, 292, 39.225, 10500, 1550, 182},
	{ 62, 294, 39.45, 10600, 1600, 184},
	{ 63, 296, 39.675, 10700, 1650, 186},
	{ 64, 298, 39.9, 10800, 1700, 188},
	{ 65, 300, 40.125, 10900, 1750, 190},
	{ 66, 302, 40.35, 11000, 1800, 192},
	{ 67, 304, 40.575, 11100, 1850, 194},
	{ 68, 306, 40.8, 11200, 1900, 196},
	{ 69, 308, 41.025, 11300, 1950, 198},
	{ 70, 310, 41.25, 11400, 2000, 200},
	{ 71, 312, 41.475, 11500, 2050, 202},
	{ 72, 314, 41.7, 11600, 2100, 204},
	{ 73, 316, 41.925, 11700, 2150, 206},
	{ 74, 318, 42.15, 11800, 2200, 208},
	{ 75, 320, 42.375, 11900, 2250, 210},
	{ 76, 322, 42.6, 12000, 2300, 212},
	{ 77, 324, 42.825, 12100, 2350, 214},
	{ 78, 326, 43.05, 12200, 2400, 216},
	{ 79, 328, 43.275, 12300, 2450, 218},
	{ 80, 330, 43.5, 12400, 2500, 220},
	{ 81, 332, 43.725, 12500, 2550, 222},
	{ 82, 334, 43.95, 12600, 2600, 224},
	{ 83, 336, 44.175, 12700, 2650, 226},
	{ 84, 338, 44.4, 12800, 2700, 228},
	{ 85, 340, 44.625, 12900, 2750, 230},
	{ 86, 342, 44.85, 13000, 2800, 232},
	{ 87, 344, 45.075, 13100, 2850, 234},
	{ 88, 346, 45.3, 13200, 2900, 236},
	{ 89, 348, 45.525, 13300, 2950, 238},
	{ 90, 350, 45.75, 13400, 3000, 240},
	{ 91, 352, 45.975, 13500, 3050, 242},
	{ 92, 354, 46.2, 13600, 3100, 244},
	{ 93, 356, 46.4249, 13700, 3150, 246},
	{ 94, 358, 46.6499, 13800, 3200, 248},
	{ 95, 360, 46.8749, 13900, 3250, 250},
	{ 96, 362, 47.0999, 14000, 3300, 252},
	{ 97, 364, 47.3249, 14100, 3350, 254},
	{ 98, 366, 47.5499, 14200, 3400, 256},
	{ 99, 368, 47.7749, 14300, 3450, 258},
	{ 100, 370, 47.9999, 14400, 3500, 260},
	{ 101, 372, 48.2249, 14500, 3550, 262},
	{ 102, 374, 48.4499, 14600, 3600, 264},
	{ 103, 376, 48.6749, 14700, 3650, 266},
	{ 104, 378, 48.8999, 14800, 3700, 268},
	{ 105, 380, 49.1249, 14900, 3750, 270},
	{ 106, 382, 49.3499, 15000, 3800, 272},
	{ 107, 384, 49.5749, 15100, 3850, 274},
	{ 108, 386, 49.7999, 15200, 3900, 276},
	{ 109, 388, 50.0249, 15300, 3950, 278},
	{ 110, 390, 50.2499, 15400, 4000, 280},
	{ 111, 392, 50.4749, 15500, 4050, 282},
	{ 112, 394, 50.6999, 15600, 4100, 284},
	{ 113, 396, 50.9249, 15700, 4150, 286},
	{ 114, 398, 51.1499, 15800, 4200, 288},
	{ 115, 400, 51.3749, 15900, 4250, 290},
	{ 116, 402, 51.5999, 16000, 4300, 292},
	{ 117, 404, 51.8249, 16100, 4350, 294},
	{ 118, 406, 52.0499, 16200, 4400, 296},
	{ 119, 408, 52.2749, 16300, 4450, 298},
	{ 120, 410, 52.4999, 16400, 4500, 300},
	{ 121, 412, 52.7249, 16500, 4550, 302},
	{ 122, 414, 52.9499, 16600, 4600, 304},
	{ 123, 416, 53.1749, 16700, 4650, 306},
	{ 124, 418, 53.3999, 16800, 4700, 308},
	{ 125, 420, 53.6249, 16900, 4750, 310},
	{ 126, 422, 53.8499, 17000, 4800, 312},
	{ 127, 424, 54.0749, 17100, 4850, 314},
	{ 128, 426, 54.2999, 17200, 4900, 316},
	{ 129, 428, 54.5249, 17300, 4950, 318},
	{ 130, 430, 54.7499, 17400, 5000, 320},
	{ 131, 432, 54.9749, 17500, 5050, 322},
	{ 132, 434, 55.1999, 17600, 5100, 324},
	{ 133, 436, 55.4249, 17700, 5150, 326},
	{ 134, 438, 55.6499, 17800, 5200, 328},
	{ 135, 440, 55.8749, 17900, 5250, 330},
	{ 136, 442, 56.0999, 18000, 5300, 332},
	{ 137, 444, 56.3249, 18100, 5350, 334},
	{ 138, 446, 56.5499, 18200, 5400, 336},
	{ 139, 448, 56.7749, 18300, 5450, 338},
	{ 140, 450, 56.9999, 18400, 5500, 340},
	{ 141, 452, 57.2249, 18500, 5550, 342},
	{ 142, 454, 57.4499, 18600, 5600, 344},
	{ 143, 456, 57.6749, 18700, 5650, 346},
	{ 144, 458, 57.8999, 18800, 5700, 348},
	{ 145, 460, 58.1249, 18900, 5750, 350},
	{ 146, 462, 58.3499, 19000, 5800, 352},
	{ 147, 464, 58.5749, 19100, 5850, 354},
	{ 148, 466, 58.7999, 19200, 5900, 356},
	{ 149, 468, 59.0249, 19300, 5950, 358},
	{ 150, 470, 59.2499, 19400, 6000, 360},
	{ 151, 472, 59.4749, 19500, 6050, 362},
	{ 152, 474, 59.6999, 19600, 6100, 364},
	{ 153, 476, 59.9249, 19700, 6150, 366},
	{ 154, 478, 60.1499, 19800, 6200, 368},
	{ 155, 480, 60.3749, 19900, 6250, 370},
	{ 156, 482, 60.5999, 20000, 6300, 372},
	{ 157, 484, 60.8249, 20100, 6350, 374},
	{ 158, 486, 61.0499, 20200, 6400, 376},
	{ 159, 488, 61.2748, 20300, 6450, 378},
	{ 160, 490, 61.4998, 20400, 6500, 380},
	{ 161, 492, 61.7248, 20500, 6550, 382},
	{ 162, 494, 61.9498, 20600, 6600, 384},
	{ 163, 496, 62.1748, 20700, 6650, 386},
	{ 164, 498, 62.3998, 20800, 6700, 388},
	{ 165, 500, 62.6248, 20900, 6750, 390},
	{ 166, 502, 62.8498, 21000, 6800, 392},
	{ 167, 504, 63.0748, 21100, 6850, 394},
	{ 168, 506, 63.2998, 21200, 6900, 396},
	{ 169, 508, 63.5248, 21300, 6950, 398},
	{ 170, 510, 63.7498, 21400, 7000, 400},
	{ 171, 512, 63.9748, 21500, 7050, 402},
	{ 172, 514, 64.1998, 21600, 7100, 404},
	{ 173, 516, 64.4248, 21700, 7150, 406},
	{ 174, 518, 64.6498, 21800, 7200, 408},
	{ 175, 520, 64.8748, 21900, 7250, 410},
	{ 176, 522, 65.0998, 22000, 7300, 412},
	{ 177, 524, 65.3248, 22100, 7350, 414},
	{ 178, 526, 65.5498, 22200, 7400, 416},
	{ 179, 528, 65.7748, 22300, 7450, 418},
	{ 180, 530, 65.9998, 22400, 7500, 420},
	{ 181, 532, 66.2248, 22500, 7550, 422},
	{ 182, 534, 66.4498, 22600, 7600, 424},
	{ 183, 536, 66.6748, 22700, 7650, 426},
	{ 184, 538, 66.8998, 22800, 7700, 428},
	{ 185, 540, 67.1248, 22900, 7750, 430},
	{ 186, 542, 67.3498, 23000, 7800, 432},
	{ 187, 544, 67.5748, 23100, 7850, 434},
	{ 188, 546, 67.7998, 23200, 7900, 436},
	{ 189, 548, 68.0248, 23300, 7950, 438},
	{ 190, 550, 68.2498, 23400, 8000, 440},
	{ 191, 552, 68.4748, 23500, 8050, 442},
	{ 192, 554, 68.6998, 23600, 8100, 444},
	{ 193, 556, 68.9248, 23700, 8150, 446},
	{ 194, 558, 69.1498, 23800, 8200, 448},
	{ 195, 560, 69.3748, 23900, 8250, 450},
	{ 196, 562, 69.5998, 24000, 8300, 452},
	{ 197, 564, 69.8248, 24100, 8350, 454},
	{ 198, 566, 70.0498, 24200, 8400, 456},
	{ 199, 568, 70.2748, 24300, 8450, 458},
	{ 200, 570, 70.4998, 24400, 8500, 460},
}

addQualityTemplate(1,"object/tangible/component/dna/dna_sample_very_high.iff")
addQualityTemplate(2,"object/tangible/component/dna/dna_sample_high.iff")
addQualityTemplate(3,"object/tangible/component/dna/dna_sample_above_average.iff")
addQualityTemplate(4,"object/tangible/component/dna/dna_sample_average.iff")
addQualityTemplate(5,"object/tangible/component/dna/dna_sample_below_average.iff")
addQualityTemplate(6,"object/tangible/component/dna/dna_sample_low.iff")
addQualityTemplate(7,"object/tangible/component/dna/dna_sample_very_low.iff")
