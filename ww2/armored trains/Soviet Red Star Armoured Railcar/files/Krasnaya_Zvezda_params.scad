/***************************************************************************

Openscad code for Nscale Krasnaya Zvezda Armoured Railcar.
Copyright (C) 2021  Anthony Pemberton (tony.pemberton.cowroast@gmail.com)

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

***************************************************************************/
// Optional libraries for involute gear calculations credited as below.
//////////////////////////////////////////////////////////////////////////////////////////////
// LibFile: involute_gears.scad
//   Involute Spur Gears and Racks
//   
//   by Leemon Baird, 2011, Leemon@Leemon.com
//   http://www.thingiverse.com/thing:5505
//   
//   Additional fixes and improvements by Revar Desmera, 2017-2019, revarbat@gmail.com
//   
//   This file is public domain.  Use it for any purpose, including commercial
//   applications.  Attribution would be nice, but is not required.  There is
//   no warranty of any kind, including its correctness, usefulness, or safety.
//   
//   This is parameterized involute spur (or helical) gear.  It is much simpler
//   and less powerful than others on Thingiverse.  But it is public domain.  I
//   implemented it from scratch from the descriptions and equations on Wikipedia
//   and the web, using Mathematica for calculations and testing, and I now
//   release it into the public domain.
//   
//////////////////////////////////////////////////////////////////////////////////////////////



echo(version=version());
//-----------------------------------------------------------------------------
// Use libraries for complex parts which will not be printed
//-----------------------------------------------------------------------------
include <BOSL-master/constants.scad>
use <BOSL-master/involute_gears.scad>
use <Getriebe.scad>

//-----------------------------------------------------------------------------
// Set Parameters for design - Do this before printing anything!
// DON'T FORGET TO SAVE FILES BEFORE Previewing and Rendering!
//-----------------------------------------------------------------------------

// Select Scale - One only
//scale = 1/32;
//scale = 1/35;
//scale = 1/48;
//scale = 1/72;
//scale = 1/76;
//scale = 1/87;
//scale = 1/100;
//scale = 1/120;
//scale = 1/144;
//scale = 1/148;
//scale = 1/150;
scale = 1/160;
//scale = 1/200;
//scale = 1/220;

output_scale = scale; // For .STL file scalar conversion

//-----------------------------------------------------------------------------
// Body dimensions from general arrangement drawing at 1/62.5 scale
// The diagram is dimensionless apart from a 1 metre scale bar.
// Translating the printed diagram scale measured by an accurate caliper gives
// a scale of 1/62.5. Very rough and ready but that is all I have to use
// to provide a realistic print.
//-----------------------------------------------------------------------------
input_scale = 1/62.5;

//-----------------------------------------------------------------------------
// To save time and 're-inventing the wheel' I have taken designs for the 
// KV-1 turret used on this railcar. I had a scale diagram at 1/48 to design
// the turret using a caliper to measure sizes, but having found a very good
// existing .STL of the turret in KV-1 1941 Tank Breakdown - Remix by T1ckL35
// is licensed under the Creative Commons - Attribution - Non-Commercial - Share Alike license.
// http://www.thingiverse.com/thing:3469644
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Super kudos to TigerAce1945 for some amazing free models.
//-----------------------------------------------------------------------------

KV_1_diagram_scale = 1/48;
KV_1_import_scale = 1/100;

//-----------------------------------------------------------------------------
// Select either printed buffer (delicate - true) or metal add on buffer (robust - false)
//-----------------------------------------------------------------------------

print_buffer = true;

//-----------------------------------------------------------------------------

tolerance = 5 * scale;

body_thickness = 200 * scale; // 200mm - Armour Plate?


lower_body_length_outside = scale_conversion(input_scale,output_scale,167.7);
waist_body_length_outside = lower_body_length_outside;
top_body_length_outside = scale_conversion(input_scale,output_scale,145.04);
crest_length = scale_conversion(input_scale,output_scale,137.83);
crest_pos_near = scale_conversion(input_scale,output_scale,14.3);;

lower_body_length_inside = lower_body_length_outside-(body_thickness*2);
waist_body_length_inside = waist_body_length_outside-(body_thickness*2);
top_body_length_inside = top_body_length_outside-(body_thickness*2);

lower_body_width_outside = scale_conversion(input_scale,output_scale,45.25);
waist_body_width_outside = lower_body_width_outside;
top_body_width_outside = scale_conversion(input_scale,output_scale,32.52);

lower_body_width_inside = lower_body_width_outside-(body_thickness*2);
waist_body_width_inside = waist_body_width_outside-(body_thickness*2);
top_body_width_inside = top_body_width_outside-(body_thickness*2);

lower_to_waist_body_height = scale_conversion(input_scale,output_scale,20.00);
waist_to_top_body_height = scale_conversion(input_scale,output_scale,11.38);
waist_to_crest_body_height = scale_conversion(input_scale,output_scale,14.89);
top_to_crest_height = waist_to_crest_body_height-waist_to_top_body_height;
body_height_above_rail = scale_conversion(input_scale,output_scale,5.95);

centre_line = waist_body_width_outside/2;   // Position of crest 

// To identify each side of the body in common modules
body_side_left = 1;
body_end_near = 2;
body_side_right = 3;
body_end_far = 4;

// Calculate body angles in order to rotate attached objects
near_side = 0;
near_end = 90;
far_side = 0;
far_end = 90;

// For rivet positioning
left_side_angle = 0;
near_end_angle = 90;
right_side_angle = 180;
far_end_angle = 270;
no_tilt = 0;

length_end_waist_to_top =
  sqrt((pow(waist_to_top_body_height,2))+(pow(((waist_body_length_outside-top_body_length_outside)/2),2)));
angle_end_waist_to_top =
  (90-(atan(waist_to_top_body_height/((waist_body_length_outside-top_body_length_outside)/2))));

width_side_waist_to_top =
  sqrt((pow(waist_to_top_body_height,2))+(pow(((waist_body_width_outside-top_body_width_outside)/2),2)));
angle_side_waist_to_top =
  (90-(atan(waist_to_top_body_height/((waist_body_width_outside-top_body_width_outside)/2))));

mitre_base_length = sqrt((pow(((waist_body_length_outside-top_body_length_outside)/2),2))+
  (pow(((waist_body_width_outside-top_body_width_outside)/2),2)));
mitre_length = sqrt((pow(waist_to_top_body_height,2))+(pow(mitre_base_length,2)));

angle_mitre_waist_to_top =
  (90-(atan(waist_to_top_body_height/mitre_base_length)));

offset_top_body_length_outside =
  ((waist_body_length_outside-top_body_length_outside)/2);

offset_top_body_width_outside =
  ((waist_body_width_outside-top_body_width_outside)/2);

offset_crest =
  ((top_body_length_outside-crest_length));

angle_end_top_to_crest =
  atan(top_to_crest_height/(top_body_width_outside/2));

//-----------------------------------------------------------------------------
// Personnel Doors
door_frame_pos_l = scale_conversion(input_scale,output_scale,98.90);

door_frame_length = scale_conversion(input_scale,output_scale,15.86);
door_frame_width = lower_body_width_outside;
door_frame_height = scale_conversion(input_scale,output_scale,30.83);
door_gap = 20 * scale;

door_pos_l = door_frame_pos_l+door_gap;
door_length = door_frame_length-(door_gap*2);
door_width = door_frame_width;
door_pos_h = door_gap;
door_height = door_frame_height-(door_gap*2);

// Representation of personnel access doors, locks, hinges and handles
access_door_l = scale_conversion(input_scale,output_scale,9.18);
access_door_w = scale_conversion(input_scale,output_scale,0.80);
access_door_h = scale_conversion(input_scale,output_scale,12.70);
access_door_pos_l = scale_conversion(input_scale,output_scale,102.52);
access_door_pos_left_w = -(access_door_w);
access_door_pos_right_w = lower_body_width_outside;
access_door_pos_h = scale_conversion(input_scale,output_scale,14.90);
small_access_door_l = scale_conversion(input_scale,output_scale,5.12);
small_access_door_w = scale_conversion(input_scale,output_scale,0.54);
small_access_door_h = scale_conversion(input_scale,output_scale,4.08);
small_access_door_pos_l = scale_conversion(input_scale,output_scale,1.98);
small_access_door_pos_w = small_access_door_w;
small_access_door_pos_h = scale_conversion(input_scale,output_scale,7.15);

door_handle_pos_l = 2175 * scale;
door_handle_pos_h = 500 * scale;
door_handle_depth = 220 * scale;

//-----------------------------------------------------------------------------
// Gaps in armour plate
armour_gap = 20 * scale;
// Plate Lengths from origin
plate_len_1 = armour_gap;
plate_len_2 = scale_conversion(input_scale,output_scale,37.87)-(armour_gap/2);
plate_len_3 = scale_conversion(input_scale,output_scale,67.16)-(armour_gap/2);
plate_len_4 = door_pos_l-(armour_gap*2);
plate_len_5 = door_pos_l+door_frame_length-(armour_gap);
plate_len_6 = scale_conversion(input_scale,output_scale,127.83)-(armour_gap/2);
plate_len_7 = lower_body_length_outside-(armour_gap*2);

top_plate_len_1 = scale_conversion(input_scale,output_scale,15.66);
top_plate_len_2 = scale_conversion(input_scale,output_scale,27.05)-(armour_gap/2);
top_plate_len_3 = plate_len_2;
top_plate_len_6 = plate_len_6;
top_plate_len_7 = lower_body_length_outside-
                    (scale_conversion(input_scale,output_scale,15.66)+(armour_gap*2));

//-----------------------------------------------------------------------------
// Representation of bodyside hinges
//-----------------------------------------------------------------------------

large_hinge_l = scale_conversion(input_scale,output_scale,3.52);
large_hinge_w = scale_conversion(input_scale,output_scale,0.60);
large_hinge_h = scale_conversion(input_scale,output_scale,2.36);
large_hinge_pivot_point = large_hinge_l/2;
large_hinge_pivot_length = tolerance*2;
large_hinge_pivot_depth = tolerance*2;

med_hinge_l = scale_conversion(input_scale,output_scale,2.50);
med_hinge_w = scale_conversion(input_scale,output_scale,0.50);
med_hinge_h = scale_conversion(input_scale,output_scale,2.36);
med_hinge_pivot_point = med_hinge_l/2;
med_hinge_pivot_length = tolerance*2;
med_hinge_pivot_depth = tolerance*2;

small_hinge_l = scale_conversion(input_scale,output_scale,2.50);
small_hinge_w = scale_conversion(input_scale,output_scale,0.50);
small_hinge_h = scale_conversion(input_scale,output_scale,2.36);
small_hinge_pivot_point = small_hinge_l/2;
small_hinge_pivot_length = tolerance*2;
small_hinge_pivot_depth = tolerance*2;

buffer_prot_plate_hinge_lower = scale_conversion(input_scale,output_scale,0.90);
buffer_prot_plate_hinge_upper = scale_conversion(input_scale,output_scale,7.25);

//-----------------------------------------------------------------------------
// Lower body machinery access flaps

access_flap_l = scale_conversion(input_scale,output_scale,9.53);
access_flap_w = scale_conversion(input_scale,output_scale,0.86);
access_flap_h = scale_conversion(input_scale,output_scale,6.28);
access_flap_corner_radius = 50*scale;
access_flap_handle_l = scale_conversion(input_scale,output_scale,0.64);
access_flap_handle_w = scale_conversion(input_scale,output_scale,1.50);
access_flap_handle_h = scale_conversion(input_scale,output_scale,2.18);
access_flap_handle_pos_l = scale_conversion(input_scale,output_scale,7.42);
access_flap_handle_pos_w = 0;
access_flap_handle_pos_h = scale_conversion(input_scale,output_scale,2.18);
access_flap_hinge_l = scale_conversion(input_scale,output_scale,1.5);
access_flap_hinge_w = 40*scale;
access_flap_hinge_h = scale_conversion(input_scale,output_scale,1.3);
access_flap_hinge_pos_l = -(access_flap_hinge_l);
access_flap_hinge_pos_w = access_flap_w;
access_flap_upper_hinge_h = scale_conversion(input_scale,output_scale,4.35);
access_flap_lower_hinge_h = scale_conversion(input_scale,output_scale,0.20);


access_flap_l_1_pos = scale_conversion(input_scale,output_scale,19);
access_flap_l_2_pos = scale_conversion(input_scale,output_scale,42.06);
access_flap_l_3_pos = scale_conversion(input_scale,output_scale,69.73);
access_flap_l_4_pos = scale_conversion(input_scale,output_scale,88.31);
access_flap_l_5_pos = scale_conversion(input_scale,output_scale,115.75);
access_flap_l_6_pos = scale_conversion(input_scale,output_scale,138.97);
access_flap_w_pos = 0;
access_flap_h_pos = scale_conversion(input_scale,output_scale,1.36);

//-----------------------------------------------------------------------------
// Buffing Housings - location at centre of buffer
left_near_buffer_pos_l = 0;
left_near_buffer_pos_w = scale_conversion(input_scale,output_scale,8.09);
left_near_buffer_pos_h = scale_conversion(input_scale,output_scale,7.64);
right_near_buffer_pos_l = 0;
right_near_buffer_pos_w = scale_conversion(input_scale,output_scale,36.09);
right_near_buffer_pos_h = scale_conversion(input_scale,output_scale,7.64);
left_far_buffer_pos_l = lower_body_length_outside;
left_far_buffer_pos_w = scale_conversion(input_scale,output_scale,8.09);
left_far_buffer_pos_h = scale_conversion(input_scale,output_scale,7.64);
right_far_buffer_pos_l = lower_body_length_outside;
right_far_buffer_pos_w = scale_conversion(input_scale,output_scale,36.09);
right_far_buffer_pos_h = scale_conversion(input_scale,output_scale,7.64);

// Printed buffer dimensions
buffer_mounting_block_l = scale_conversion(input_scale,output_scale,1.81);
buffer_mounting_block_w = scale_conversion(input_scale,output_scale,6.18);
buffer_mounting_block_h = scale_conversion(input_scale,output_scale,6.18);

pbuffer_shank_1st_l = scale_conversion(input_scale,output_scale,2.88);
pbuffer_shank_1st_d = scale_conversion(input_scale,output_scale,3.52);
pbuffer_shank_2nd_l = scale_conversion(input_scale,output_scale,4.16);
pbuffer_shank_2nd_d = scale_conversion(input_scale,output_scale,2.60);
pbuffer_shank_3rd_l = scale_conversion(input_scale,output_scale,7.82);
pbuffer_shank_3rd_d = scale_conversion(input_scale,output_scale,2.45);

pbuffer_head_l = scale_conversion(input_scale,output_scale,0.80);
pbuffer_head_d = scale_conversion(input_scale,output_scale,6.20);

buffer_hole_radius = 64 * scale; // number depends on shank of buffer fitted

//-----------------------------------------------------------------------------
// coupling mounts
// It is assumed that separate metal couplings are purchased for this model.
// I have not generated 3D printed couplings

coupling_pos = centre_line;
coupling_mounting_block_l = 400 * scale; // Block lengthened inside body for strength.
coupling_mounting_block_w = scale_conversion(input_scale,output_scale,5.72);
coupling_mounting_block_h = scale_conversion(input_scale,output_scale,5.72);
coupling_pos_l = scale_conversion(input_scale,output_scale,1.00);
coupling_pos_w = centre_line-(coupling_mounting_block_w/2);
coupling_pos_h = scale_conversion(input_scale,output_scale,7.64)-(coupling_mounting_block_h/2);

coupling_hole_l = coupling_mounting_block_l+(tolerance*2);
coupling_hole_w = 64 * scale; // depends on shank of buffer fitted
coupling_hole_h = 128 * scale; // depends on shank of buffer fitted
coupling_hole_pos_l = tolerance;
coupling_hole_pos_w = (coupling_mounting_block_w/2)-(coupling_hole_w/2);
coupling_hole_pos_h = (coupling_mounting_block_h/2)-(coupling_hole_h/2);

//-----------------------------------------------------------------------------
// Buffing gear protection plates
buffer_prot_plate_l = scale_conversion(input_scale,output_scale,10.20);
buffer_prot_plate_w = body_thickness/2; // a bit overscale for strength
buffer_prot_plate_h = scale_conversion(input_scale,output_scale,10.20);

buffer_prot_plate_near_pos_l = -(buffer_prot_plate_l);
buffer_prot_plate_far_pos_l = lower_body_length_outside;
buffer_prot_plate_left_pos_w = 0;
buffer_prot_plate_right_pos_w = lower_body_width_outside-buffer_prot_plate_w;
buffer_prot_plate_pos_h = scale_conversion(input_scale,output_scale,1.60);

// Add fillets for strength in smaller scales
buffer_prot_fillet_l = body_thickness/2;
buffer_prot_fillet_w = body_thickness/2;
buffer_prot_fillet_h = buffer_prot_plate_h;

//-----------------------------------------------------------------------------
// Rivet detail
//-----------------------------------------------------------------------------
rivet_dia = 50*scale;
// Number of rivets per row through each armour plate
rivet_no_1 = 0;
rivet_no_2 = 1;
rivet_no_3 = 2;
rivet_no_4 = 3;
rivet_no_5 = 4;
rivet_no_6 = 5;
rivet_no_7 = 6;

rivet_row_mid_lower = scale_conversion(input_scale,output_scale,7.14);
rivet_row_mid_upper = scale_conversion(input_scale,output_scale,9.44);
rivet_row_end_mid = scale_conversion(input_scale,output_scale,13.57);
rivet_row_end_upper = scale_conversion(input_scale,output_scale,19.37);


//-----------------------------------------------------------------------------
// Select turret location hole size in body top
//-----------------------------------------------------------------------------

// Turret adapter block
turret_block_length = plate_len_4-plate_len_3;
turret_block_width = top_body_width_outside;
turret_block_height = top_to_crest_height;
turret_block_pos_l = plate_len_3;
turret_block_pos_w = offset_top_body_width_outside;
turret_block_pos_h = waist_to_top_body_height;
turret_block_fr_l = scale_conversion(input_scale,output_scale,4.94);
turret_block_fr_w = scale_conversion(input_scale,output_scale,12.84);
turret_block_fr_pos_l = -(scale_conversion(input_scale,output_scale,4.94));
turret_block_fr_pos_wl = ((turret_block_width-turret_block_fr_w)/2);
turret_block_fr_pos_w2 = turret_block_fr_pos_wl+turret_block_fr_w;

turret_location_hole_dia = 1280 * scale;

turret_core_base_dia = scale_conversion(KV_1_diagram_scale,output_scale,39.71);
turret_core_top_dia = scale_conversion(KV_1_diagram_scale,output_scale,31.28);
turret_core_height = scale_conversion(KV_1_diagram_scale,output_scale,17.05);

turret_spigot_depth = (turret_core_height+turret_block_height)-(body_thickness+tolerance);
turret_spigot_dia = turret_location_hole_dia - (tolerance*PI);

// Fiddle factor to align imported KV-1 turret to build plate
turret_import_align_l = 960 * scale;
turret_import_align_w = 480 * scale;
turret_import_align_h = -(1424 * scale);



//-----------------------------------------------------------------------------
// Table of metric nuts from DIN934 or ISO 4032
// Larger sizes added for completeness plus some dummies for unknown sizes
//-----------------------------------------------------------------------------
METRIC_NUT_DMENSIONS = [ 
//   index                d1      e min        s    m max 
    [   0,                 0,         0,       0,       0   ],   // Dummy to offset base to look pretty!
    [   1,             1.000,     2.710,   2.500,   0.800   ],   // M1
    [   2,             1.200,     3.280,   3.000,   1.000   ],   // M1.2
    [   3,             1.400,     3.410,   3.200,   1.200   ],   // M1.4
    [   4,             1.600,     3.410,   3.200,   1.300   ],   // M1.6
    [   5,             1.800,     0.000,   0.000,   0.000   ],   // M1.8
    [   6,             2.000,     4.320,   4.000,   1.600   ],   // M2
    [   7,             2.300,     4.880,   4.500,   1.800   ],   // M2.3
    [   8,             2.500,     5.450,   5.000,   2.000   ],   // M2.5
    [   9,             2.600,     5.450,   5.000,   2.000   ],   // M2.6
    [  10,             3.000,     6.010,   5.500,   2.400   ],   // M3
    [  11,             3.500,     6.580,   6.000,   2.800   ],   // M3.5
    [  12,             4.000,     7.660,   7.000,   3.200   ],   // M4
    [  13,             5.000,     8.790,   8.000,   4.000   ],   // M5
    [  14,             6.000,    11.050,  10.000,   5.000   ],   // M6
    [  15,             7.000,    12.120,  11.000,   5.500   ],   // M7
    [  16,             8.000,    14.380,  13.000,   6.500   ],   // M8
    [  17,            10.000,    18.900,  17.000,   8.000   ],   // M10
    [  18,            12.000,    21.100,  19.000,  10.000   ],   // M12
    [  19,            14.000,    24.490,  22.000,  11.000   ],   // M14
    [  20,            16.000,    26.750,  24.000,  13.000   ],   // M16
    [  21,            18.000,    29.560,  27.000,  15.000   ],   // M18
    [  22,            20.000,    32.950,  30.000,  16.000   ],   // M20
    [  23,            22.000,    35.030,  32.000,  18.000   ],   // M22
    [  24,            24.000,    39.550,  36.000,  19.000   ],   // M24
    [  25,            27.000,    45.200,  41.000,  22.000   ],   // M27
    [  26,            30.000,    50.850,  46.000,  24.000   ],   // M30
    [  27,            33.000,    55.370,  50.000,  26.000   ],   // M33
    [  28,            36.000,    60.790,  55.000,  29.000   ],   // M36
    [  29,            39.000,     0.000,   0.000,   0.000   ],   // M39
    [  30,            42.000,    71.300,  65.000,  34.000   ]    // M42
  ];

//-----------------------------------------------------------------------------
// Table of metric cheese head screws from ISO 965
// Table incomplete! Some dummies added for unknown sizes
//-----------------------------------------------------------------------------
METRIC_SCREW_DMENSIONS = [ 
//   index       hole diameter    d1max    d2max     kmax 
    [   0,                   0,       0,       0,       0   ],   // Dummy offset
    [   1,   1.0+(tolerance*2),   1.000,   2.000,   0.700   ],   // M1
    [   2,   1.2+(tolerance*2),   1.200,   2.300,   0.800   ],   // M1.2
    [   3,   1.4+(tolerance*2),   1.400,   2.600,   0.900   ],   // M1.4
    [   4,   1.6+(tolerance*2),   1.600,   3.000,   1.000   ],   // M1.6
    [   5,   1.8+(tolerance*2),   1.800,   3.400,   1.200   ],   // M1.8
    [   6,   2.0+(tolerance*2),   2.000,   3.800,   1.300   ],   // M2
    [   7,   2.3+(tolerance*2),   0.000,   0.000,   0.000   ],   // M2.3
    [   8,   2.5+(tolerance*2),   2.500,   4.500,   1.600   ],   // M2.5
    [   9,   2.5+(tolerance*2),   0.000,   0.000,   0.000   ],   // M2.6
    [  10,   3.0+(tolerance*2),   3.000,   5.500,   2.000   ],   // M3
    [  11,   3.5+(tolerance*2),   3.500,   6.000,   2.400   ],   // M3.5
    [  12,   4.0+(tolerance*2),   4.000,   7.000,   2.600   ],   // M4
    [  13,   5.0+(tolerance*2),   5.000,   8.500,   3.000   ],   // M5
    [  14,   6.0+(tolerance*2),   6.000,  10.000,   3.900   ],   // M6
    [  15,   7.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M7
    [  16,   8.0+(tolerance*2),   8.000,  13.000,   5.000   ],   // M8
    [  17,  10.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M10
    [  18,  12.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M12
    [  19,  14.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M14
    [  20,  16.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M16
    [  21,  18.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M18
    [  22,  20.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M20
    [  23,  22.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M22
    [  24,  24.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M24
    [  25,  27.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M27
    [  26,  30.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M30
    [  27,  33.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M33
    [  28,  36.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M36
    [  29,  39.0+(tolerance*2),   0.000,   0.000,   0.000   ],   // M39
    [  30,  42.0+(tolerance*2),   0.000,   0.000,   0.000   ]    // M42
];

// Column selection values for above tables
hole_dia = 1;
nut_e_min = 2;
nut_depth = 4;
screw_cap_dia = 3;
screw_cap_depth = 4;

// --------------------------- VERY IMPORTANT ---------------------------------
//
// The sizing information below is for an N scale version only
// If you choose to make this design in another scale, you MUST refactor
// dimensions according to the actual dimensions of the motorised chassis,
// wheels, axles and decoder you wish to use.
//
//-----------------------------------------------------------------------------

wheelset_dia = 1030 * scale;  // Diameter of Su class tender wheel
//motor_bogie_axle_dia = 240 * scale; // Axle diameter (1.5mm @ N scale) according to the wheelset in use
motor_bogie_axle_dia = 320 * scale; // Axle diameter (2mm @ N scale) according to the wheelset in use
motor_bogie_wheelbase = 1920 * scale;
chassis_bogie_centres = 6000 * scale;
// Gear calculation parameters
  n1 = 10; // Axle mounted gear number of teeth (red gear)
  n2 = 16; // Idler gear number of teeth (green gear)
//  mm_per_tooth = ("M0.3"); //all meshing gears need the same mm_per_tooth (and the same pressure_angle) M0.3
  mm_per_tooth = find_pitch("M0.4"); //all meshing gears need the same mm_per_tooth
                                     //(and the same pressure_angle)
  thickness    = 240 * scale; // width of gears (1.5mm @ N scale)
  hole         = 240 * scale; // Diameter of axle and idler pin diameter (1.5mm @ N scale)

  d1 =pitch_radius(mm_per_tooth,n1);
  d12=pitch_radius(mm_per_tooth,n1) + pitch_radius(mm_per_tooth,n2);

gear_radius = pitch_radius(mm_per_tooth, n1);

echo(d1, d12, gear_radius);

drive_shaft_bearing_l = 1; // 681ZZ ball bearing dimensions - thickness of bearing
drive_shaft_bearing_id = 1; // 681ZZ ball bearing dimensions - inner diameter of bearing
drive_shaft_bearing_od = 3; // 681ZZ ball bearing dimensions - outer diameter of bearing

bearing_retainer_od = drive_shaft_bearing_od + body_thickness;

motor_bogie_l = 3200 * scale; // N scale = 20mm
//motor_bogie_w = 982 * scale; // N scale = 6.14mm
motor_bogie_w = 880 * scale; // N scale = 5.5mm
motor_bogie_h = 1040 * scale; // N scale = 6.50mm
motor_bogie_origin_l = scale_conversion(input_scale,output_scale,6.86);
motor_bogie_origin_w = ((lower_body_width_outside-motor_bogie_w)/2);
motor_bogie_origin_h = (wheelset_dia/2) - (motor_bogie_h/3);
motor_bogie_near_axle = ((motor_bogie_l-motor_bogie_wheelbase)/2)-(motor_bogie_axle_dia/2);
motor_bogie_far_axle = motor_bogie_l-(((motor_bogie_l-motor_bogie_wheelbase)/2)+(motor_bogie_axle_dia/2));
motor_bogie_axle_h = motor_bogie_h/4; // Axle height may vary according to the wheelset in use

//motor_bogie_gear_slot_l = 960 * scale; // N scale = 6.00mm
motor_bogie_gear_slot_l = 1024 * scale; // N scale = 6.40mm
//motor_bogie_gear_slot_w = 436 * scale; // N scale = 2.725mm
motor_bogie_gear_slot_w = 320 * scale; // N scale = 2.5mm
motor_bogie_gear_slot_h = motor_bogie_h +(tolerance*2);
motor_bogie_gear_slot_pos1_l = (motor_bogie_near_axle+(motor_bogie_axle_dia/2)) - (motor_bogie_gear_slot_l/2);
motor_bogie_gear_slot_pos2_l = (motor_bogie_far_axle+(motor_bogie_axle_dia/2)) - (motor_bogie_gear_slot_l/2);
motor_bogie_gear_slot_comb_l = motor_bogie_l-(motor_bogie_gear_slot_pos1_l*2);
motor_bogie_gear_slot_pos_w = (motor_bogie_w - motor_bogie_gear_slot_w)/2;
motor_bogie_gear_slot_pos_h = -tolerance;

motor_bogie_cutout_l= motor_bogie_l-((motor_bogie_gear_slot_l+motor_bogie_gear_slot_pos1_l+body_thickness)*2);
motor_bogie_cutout_w = motor_bogie_gear_slot_w+((motor_bogie_w-motor_bogie_gear_slot_w)/2);
motor_bogie_cutout_h = motor_bogie_h;
motor_bogie_cutout_pos_l = motor_bogie_gear_slot_l+motor_bogie_gear_slot_pos1_l+body_thickness;
motor_bogie_cutout_pos_w = (motor_bogie_w-motor_bogie_gear_slot_w)/4;
motor_bogie_cutout_pos_h = (METRIC_NUT_DMENSIONS[find_size("M1.6")][1])*2;

motor_bogie_gear_pin_dia = hole; // Pin diameter (1.5mm @ N scale) according to the gears used
motor_bogie_gear_pin_l = motor_bogie_w + (tolerance*2);

motor_bogie_pivot_dia = 320 * scale;
motor_bogie_pivot_h = motor_bogie_h + (tolerance*2);
motor_bogie_pivot_pos_l = motor_bogie_l/2;
motor_bogie_pivot_pos_w = motor_bogie_w/2;
motor_bogie_pivot_pos_h = -tolerance;

motor_bogie_locater_l = motor_bogie_gear_slot_pos1_l+(tolerance*2);
motor_bogie_locater_w = motor_bogie_w/5;
motor_bogie_locater_h = motor_bogie_h/10;
motor_bogie_locater_pos1_l = -tolerance;
motor_bogie_locater_pos2_l = (motor_bogie_gear_slot_pos2_l+motor_bogie_gear_slot_l) - tolerance;
motor_bogie_locater_pos_w = (motor_bogie_w - motor_bogie_locater_w)/2;
motor_bogie_locater_pos_h = -tolerance;

motor_bogie_pickup_blk_l = 960 * scale;
motor_bogie_pickup_blk_w = 330 * scale;
motor_bogie_pickup_blk_h = motor_bogie_h - (640 * scale);
motor_bogie_pickup_blk_pos_l = (motor_bogie_l - motor_bogie_pickup_blk_l)/2;
motor_bogie_pickup_blk_pos1_w = -(motor_bogie_pickup_blk_w-tolerance);
motor_bogie_pickup_blk_pos2_w = motor_bogie_w - tolerance;
motor_bogie_pickup_blk_pos_h = motor_bogie_h-motor_bogie_pickup_blk_h;
pickup_screw_dia = "M1";

// Body mounted bogie attachment blocks 
motor_bogie_mounting_block_l = 960 * scale;
motor_bogie_mounting_block_w = motor_bogie_w+motor_bogie_pickup_blk_w;
motor_bogie_mounting_block_h = 
  (lower_to_waist_body_height + waist_to_top_body_height) - (motor_bogie_h+motor_bogie_axle_h);
motor_bogie_pivot_washer_thickness = 48 * scale; // 0.3mm
near_motor_bogie_mounting_block_pos_l = 
  (lower_body_length_outside-chassis_bogie_centres-motor_bogie_mounting_block_l)/2;
far_motor_bogie_mounting_block_pos_l = 
  lower_body_length_outside-((lower_body_length_outside-chassis_bogie_centres+motor_bogie_mounting_block_l)/2);
motor_bogie_mounting_block_pos_w = centre_line - (motor_bogie_mounting_block_w/2);
motor_bogie_mounting_block_pos_h = 
  (motor_bogie_h+motor_bogie_axle_h);

// M1.6 securing nuts and bolts for bogies. Change for your scale amd gear module size
motor_bogie_nut_dia = METRIC_NUT_DMENSIONS[find_size("M1.6")][2];
/* 
schnecke = worm gear
modul = module (standard size for gears according to DIN 780)
gangzahl = speed
laenge = length
bohrung = shaft diameter
eingriffswinkel = pressure angle
steigungswinkel = incline angle
zusammen_gebaut = built together, assembled
*/

worm_module_size = worm_module("M0.4"); // Change for your scale amd gear module size
worm_length = 800 * scale;
worm_shaft_dia = 160 * scale; // 1mm at 1/160

worm_pos1_l = motor_bogie_near_axle - ((worm_length/2)-(motor_bogie_axle_dia/2));
worm_pos2_l = motor_bogie_far_axle - ((worm_length/2)-(motor_bogie_axle_dia/2));
worm_clearance_d = 880 * scale; // 5.5mm at 1/160
worm_pos_w = (motor_bogie_w/2);
//worm_pos_h = motor_bogie_h+(motor_bogie_axle_dia);
worm_pos_h = motor_bogie_axle_h+(gear_radius*2)+(tolerance*5);

drive_shaft_h = worm_pos_h;

wiring_channel_l = 160 * scale;
wiring_channel_w = 160 * scale;

/*
// --------------------------- VERY IMPORTANT ---------------------------------
//
// The sizing information below is for an N scale version only
// If you choose to make this design in another scale, you MUST refactor
// dimensions according to the actual dimensions of the motorised chassis,
// wheels, axles and decoder you wish to use.
//
//-----------------------------------------------------------------------------

wheelset_dia = 1030 * scale;  // Diameter of Su class tender wheel
motor_bogie_axle_dia = 240 * scale; // Axle diameter (1.5mm @ N scale) according to the wheelset in use
motor_bogie_wheelbase = scale_conversion(input_scale,output_scale,31.50);
chassis_bogie_centres = 6000 * scale;
// Gear calculation parameters
  n1 = 10; // Axle mounted gear number of teeth (red gear)
  n2 = 16; // Idler gear number of teeth (green gear)
//  mm_per_tooth = 0.943; //all meshing gears need the same mm_per_tooth (and the same pressure_angle) M0.3
  mm_per_tooth = find_pitch("M0.4"); //all meshing gears need the same mm_per_tooth
                                     //(and the same pressure_angle)
  thickness    = 240 * scale; // width of gears
  hole         = 240 * scale; // Diameter of axle and idler pin diameter (1.5mm @ N scale)

  d1 =pitch_radius(mm_per_tooth,n1);
  d12=pitch_radius(mm_per_tooth,n1) + pitch_radius(mm_per_tooth,n2);


motor_bogie_l = 3936 * scale; // N scale = 24.60mm
motor_bogie_w = 982 * scale; // N scale = 6.14mm
motor_bogie_h = 1760 * scale; // N scale = 11.00mm
motor_bogie_origin_l = scale_conversion(input_scale,output_scale,6.86);
motor_bogie_origin_w = ((lower_body_width_outside-motor_bogie_w)/2);
motor_bogie_origin_h = (wheelset_dia/2) - (motor_bogie_h/3);
motor_bogie_near_axle = ((motor_bogie_l-motor_bogie_wheelbase)/2)-(motor_bogie_axle_dia/2);
motor_bogie_far_axle = motor_bogie_l-(((motor_bogie_l-motor_bogie_wheelbase)/2)+(motor_bogie_axle_dia/2));
motor_bogie_axle_h = motor_bogie_h/5; // Axle height may vary according to the wheelset in use

motor_bogie_gear_slot_l = 1280 * scale; // N scale = 8.00mm
motor_bogie_gear_slot_w = 480 * scale; // N scale = 2.725mm
motor_bogie_gear_slot_h = motor_bogie_h +(tolerance*2);
motor_bogie_gear_slot_pos1_l = (motor_bogie_near_axle+(motor_bogie_axle_dia/2)) - (motor_bogie_gear_slot_l/2);
motor_bogie_gear_slot_pos2_l = (motor_bogie_far_axle+(motor_bogie_axle_dia/2)) - (motor_bogie_gear_slot_l/2);
motor_bogie_gear_slot_comb_l = motor_bogie_l-(motor_bogie_gear_slot_pos1_l*2);
motor_bogie_gear_slot_pos_w = (motor_bogie_w - motor_bogie_gear_slot_w)/2;
motor_bogie_gear_slot_pos_h = -tolerance;

motor_bogie_cutout_l = motor_bogie_l-((motor_bogie_gear_slot_l*2)+(motor_bogie_gear_slot_pos1_l*2));
motor_bogie_cutout_w = motor_bogie_gear_slot_w+((motor_bogie_w-motor_bogie_gear_slot_w)/2);
motor_bogie_cutout_h = motor_bogie_h;
motor_bogie_cutout_pos_l = motor_bogie_gear_slot_l+(motor_bogie_gear_slot_pos1_l);
motor_bogie_cutout_pos_w = (motor_bogie_w-motor_bogie_gear_slot_w)/4;
motor_bogie_cutout_pos_h = (880 * scale);

motor_bogie_gear_pin_dia = hole; // Pin diameter (1.5mm @ N scale) according to the gears used
motor_bogie_gear_pin_l = motor_bogie_w + (tolerance*2);

motor_bogie_pivot_dia = 320 * scale;
motor_bogie_pivot_h = motor_bogie_h + (tolerance*2);
motor_bogie_pivot_pos_l = motor_bogie_l/2;
motor_bogie_pivot_pos_w = motor_bogie_w/2;
motor_bogie_pivot_pos_h = -tolerance;

motor_bogie_locater_l = motor_bogie_gear_slot_pos1_l+(tolerance*2);
motor_bogie_locater_w = motor_bogie_w/5;
motor_bogie_locater_h = motor_bogie_h/10;
motor_bogie_locater_pos1_l = -tolerance;
motor_bogie_locater_pos2_l = (motor_bogie_gear_slot_pos2_l+motor_bogie_gear_slot_l) - tolerance;
motor_bogie_locater_pos_w = (motor_bogie_w - motor_bogie_locater_w)/2;
motor_bogie_locater_pos_h = -tolerance;

motor_bogie_pickup_blk_l = 1200 * scale;
motor_bogie_pickup_blk_w = 433 * scale;
motor_bogie_pickup_blk_h = (1760-1000) * scale;
motor_bogie_pickup_blk_pos_l = (motor_bogie_l - motor_bogie_pickup_blk_l)/2;
motor_bogie_pickup_blk_pos1_w = -(motor_bogie_pickup_blk_w-tolerance);
motor_bogie_pickup_blk_pos2_w = motor_bogie_w - tolerance;
motor_bogie_pickup_blk_pos_h = 1000 * scale;
pickup_screw_dia = "M1";

// M1.6 securing nuts and bolts for bogies. Change for your scale amd gear module size
motor_bogie_nut_dia = METRIC_NUT_DMENSIONS[find_size("M1.6")][2];
//echo(motor_bogie_nut_dia);
//motor_bogie_screw_dia = 
//motor_bogie_screw_dia = 
//motor_bogie_screw_dia = 
*/
/* 
schnecke = worm gear
modul = module (standard size for gears according to DIN 780)
gangzahl = speed
laenge = length
bohrung = shaft diameter
eingriffswinkel = pressure angle
steigungswinkel = incline angle
zusammen_gebaut = built together, assembled
*/
/*
worm_module_size = worm_module("M0.4"); // Change for your scale amd gear module size
worm_length = 800 * scale;
worm_shaft_dia = hole;

worm_pos1_l = motor_bogie_near_axle - ((worm_length/2)-(motor_bogie_axle_dia/2));
worm_pos2_l = motor_bogie_far_axle - ((worm_length/2)-(motor_bogie_axle_dia/2));
worm_pos_w = (motor_bogie_w/2);
worm_pos_h = motor_bogie_h+(motor_bogie_axle_dia);
*/
//-----------------------------------------------------------------------------
// For a coreless 12V motor 08/16 with 1 mm shafts at both ends set dual_shaft = true;
// For a coreless 12V motor 06/12 with 0.8 mm shaft one end only set dual_shaft = false;
//-----------------------------------------------------------------------------

dual_shaft = true;

//-----------------------------------------------------------------------------
// Select motor and housing
//-----------------------------------------------------------------------------

motor_dia = (dual_shaft == true) ? 8 : 6;
motor_l = (dual_shaft == true) ? 16 : 12;
motor_shaft_dia = (dual_shaft == true) ? 1 : 0.8;
motor_shaft_near = (dual_shaft == true) ? 10 : 3.8;
motor_shaft_far = (dual_shaft == true) ? 7.5 : 0;

motor_casing_l = (dual_shaft == true) ? 18 : 14;
motor_casing_w = waist_body_width_inside - (tolerance*2);
motor_casing_h = lower_to_waist_body_height + waist_to_top_body_height;

motor_casing_inside_dia = motor_dia+(tolerance*2);
motor_casing_inside_l = motor_casing_l - ((motor_casing_l - motor_l)/2);
motor_casing_lip_dia = (dual_shaft == true) ? motor_dia - 2 : motor_dia - 0.5;
motor_casing_lip_l = (dual_shaft == true) ? 2 : 2;

motor_casing_cutout_l = (dual_shaft == true) ? 10 : 9;
motor_casing_cutout_w = motor_casing_w + (tolerance*2);
motor_casing_cutout_h = motor_casing_h + (tolerance*2);
motor_casing_cutout_pos_l = (motor_casing_l-motor_l)*2;
motor_casing_cutout_pos_w = (motor_casing_w/4);
motor_casing_cutout_pos_h = (motor_casing_h/6);

motor_casing_loc_lug_l = 80 * scale;
motor_casing_loc_lug_w = 80 * scale;
motor_casing_loc_lug_h = 320 * scale;

//-----------------------------------------------------------------------------
// DCC Decoder Dimensions - N scale - adjust for other scales or suitable types
//-----------------------------------------------------------------------------

// DCC Decoder type can be a Zimo MX616F (or with wires, NOT NEM651 direct) or
// ESU Lokpilot Micro V5 with wires (I use ESU 59826 removing plug).
// Clearance dimensions are the same for both vendors of decoder.

// Select one only
LP_M5 = false;
MX616 = true;

// DCC Decoder type. Note the decoder voltage output settings must correspond to the
// allowed maximum voltage of the motor. For NG_1306 motor, max. voltage is 9Vdc;
// for TU-16A voltage must not exceed 3Vdc. Other chassis motor specifications must be considered
// when setting decoder CV's. Due to significant voltage drops, care must be taken about heat
// dissapation with regard to the print material used!
// It is possible to obtain replacement 12Vdc coreless motors.

decoder_length = (LP_M5 == true) ? 8.5 : // Length of decoder mounted vertically and sideways
  (MX616 == true) ? 8.5 :
  0;

decoder_width = (LP_M5 == true) ? 2.5 : // Length of decoder mounted vertically and sideways
  (MX616 == true) ? 2.5 :
  0;

decoder_height = (LP_M5 == true) ? 10 : // Length of decoder mounted vertically and sideways
  (MX616 == true) ? 10 :
  0;

decoder_cutout_l = decoder_length + 0.5;
decoder_cutout_w = decoder_width + (tolerance*2);
decoder_cutout_h = decoder_height + 2;

decoder_cutout_pos_l = (motor_casing_l - decoder_cutout_l)/2;
decoder_cutout_pos_w = body_thickness/2;

wiring_cutout_l = motor_casing_l + (tolerance*2);
wiring_cutout_w = decoder_cutout_w/2;
wiring_cutout_h = lower_to_waist_body_height-body_thickness;

//-----------------------------------------------------------------------------
// Functions
//-----------------------------------------------------------------------------

function BEZ03(u) = pow((1-u), 3);
function BEZ13(u) = 3*u*(pow((1-u),2));
function BEZ23(u) = 3*(pow(u,2))*(1-u);
function BEZ33(u) = pow(u,3);

function PointAlongBez4(p0, p1, p2, p3, u) = [
	BEZ03(u)*p0[0]+BEZ13(u)*p1[0]+BEZ23(u)*p2[0]+BEZ33(u)*p3[0],
	BEZ03(u)*p0[1]+BEZ13(u)*p1[1]+BEZ23(u)*p2[1]+BEZ33(u)*p3[1]];


// Function for converting from one scale to another e.g for imported .STL's
function scale_conversion(in_scale,out_scale,value) =
  ((value*(1/in_scale))*out_scale);
  
function find_size(MyString) = 
  (MyString == "null") ? 0  :
  (MyString == "M1")   ? 1  :
  (MyString == "M1.2") ? 2  :
  (MyString == "M1.4") ? 3  :
  (MyString == "M1.6") ? 4  :
  (MyString == "M1.8") ? 5  :
  (MyString == "M2")   ? 6  :
  (MyString == "M2.3") ? 7  :
  (MyString == "M2.5") ? 8  :
  (MyString == "M2.6") ? 9  :
  (MyString == "M3")   ? 10 :
  (MyString == "M3.5") ? 11 :
  (MyString == "M4")   ? 12 :
  (MyString == "M5")   ? 13 :
  (MyString == "M6")   ? 14 :
  (MyString == "M7")   ? 15 :
  (MyString == "M8")   ? 16 :
  (MyString == "M10")  ? 17 :
  (MyString == "M12")  ? 18 :
  (MyString == "M14")  ? 19 :
  (MyString == "M16")  ? 20 :
  (MyString == "M18")  ? 21 :
  (MyString == "M20")  ? 22 :
  (MyString == "M22")  ? 23 :
  (MyString == "M24")  ? 24 :
  (MyString == "M27")  ? 25 :
  (MyString == "M30")  ? 26 :
  (MyString == "M33")  ? 27 :
  (MyString == "M36")  ? 28 :
  (MyString == "M39")  ? 29 :
  (MyString == "M42")  ? 30 : 0;
 
function find_pitch(MyString) = 
  (MyString == "null") ? 0.000  :
  (MyString == "M0.2") ? 0.628  :
  (MyString == "M0.3") ? 0.943  :
  (MyString == "M0.4") ? 1.256  :
  (MyString == "M0.5") ? 1.571  :
  (MyString == "M0.6") ? 1.885  :
  (MyString == "M0.7") ? 2.199  :
  (MyString == "M0.8") ? 2.513  :
  (MyString == "M1.0") ? 3.142  : 0;
 
// Erlaubte Module nach DIN 780:
function worm_module(MyString) = 
  (MyString == "null")  ?  0.000  :
  (MyString == "M0.05") ?  0.050  :
  (MyString == "M0.06") ?  0.060  :
  (MyString == "M0.08") ?  0.080  :
  (MyString == "M0.10") ?  0.100  :
  (MyString == "M0.12") ?  0.120  :
  (MyString == "M0.16") ?  0.160  :
  (MyString == "M0.20") ?  0.200  :
  (MyString == "M0.25") ?  0.250  :
  (MyString == "M0.3")  ?  0.300  :
  (MyString == "M0.4")  ?  0.400  :
  (MyString == "M0.5")  ?  0.500  :
  (MyString == "M0.6")  ?  0.600  :
  (MyString == "M0.7")  ?  0.700  :
  (MyString == "M0.8")  ?  0.800  :
  (MyString == "M0.9")  ?  0.900  :
  (MyString == "M1")    ?  1.000  :
  (MyString == "M1.25") ?  1.250  :
  (MyString == "M1.5")  ?  1.500  :
  (MyString == "M2")    ?  2.000  :
  (MyString == "M2.5")  ?  2.500  :
  (MyString == "M3")    ?  3.000  :
  (MyString == "M4")    ?  4.000  :
  (MyString == "M5")    ?  5.000  :
  (MyString == "M6")    ?  6.000  :
  (MyString == "M8")    ?  8.000  :
  (MyString == "M10")   ? 10.000  :
  (MyString == "M12")   ? 12.000  :
  (MyString == "M16")   ? 16.000  :
  (MyString == "M20")   ? 20.000  :
  (MyString == "M25")   ? 25.000  :
  (MyString == "M32")   ? 32.000  :
  (MyString == "M40")   ? 40.000  :
  (MyString == "M50")   ? 50.000  :
  (MyString == "M60")   ? 60.000  : 0;
 