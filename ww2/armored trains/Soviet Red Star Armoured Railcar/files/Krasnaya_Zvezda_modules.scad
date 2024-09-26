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

include <Krasnaya_Zvezda_params.scad>

//-----------------------------------------------------------------------------
// Krasnaya_Zvezda_modules - test
//-----------------------------------------------------------------------------
/*
access_door_l = scale_conversion(input_scale,output_scale,9.18);
access_door_w = scale_conversion(input_scale,output_scale,0.80);
access_door_h = scale_conversion(input_scale,output_scale,12.70);
access_door_pos_l = scale_conversion(input_scale,output_scale,102.52);
access_door_pos_left_w = -(access_door_w);
access_door_pos_right_w = lower_body_width_outside;
access_door_pos_h = scale_conversion(input_scale,output_scale,14.90);

union() {
  door_block(door_frame_pos_l,-tolerance,0,door_frame_length,door_frame_width,door_frame_height);
  personnel_access_doors(access_door_pos_l,
    access_door_pos_left_w,
    access_door_pos_h,
    body_side_left);
  personnel_access_doors(access_door_pos_l,
    access_door_pos_right_w-tolerance,
    access_door_pos_h,
    body_side_right);
}
*/
//lower_body_armour(0,-tolerance,0,body_side_left);
//lower_body_armour(0,lower_body_width_outside-armour_gap+tolerance,0,body_side_right);
//lower_body_armour(0,0,0,body_end_near);
//lower_body_armour(0,0,0,body_end_far);
//upper_body_armour(0,0,lower_to_waist_body_height,body_side_left);
//upper_body_armour(0,lower_body_width_outside-armour_gap+tolerance,lower_to_waist_body_height,body_side_right);
/*
top_body_armour(offset_top_body_length_outside,
  offset_top_body_width_outside,
  (lower_to_waist_body_height+waist_to_top_body_height),
  body_side_left);

top_body_armour(offset_top_body_length_outside,
  offset_top_body_width_outside+top_body_width_outside,
  (lower_to_waist_body_height+waist_to_top_body_height),
  body_side_right);

crestline_armour_gap(top_plate_len_1,
  ((turret_block_pos_l-offset_top_body_length_outside)-turret_block_fr_pos_l)-top_plate_len_1,
  (centre_line)-(armour_gap/2),
  (lower_to_waist_body_height+waist_to_top_body_height+top_to_crest_height)-(armour_gap/2));
  
crestline_armour_gap(plate_len_4,
  ((turret_block_pos_l-offset_top_body_length_outside)-turret_block_fr_pos_l)-offset_crest,
  (centre_line)-(armour_gap/2),
  (lower_to_waist_body_height+waist_to_top_body_height+top_to_crest_height)-(armour_gap/2));
*/
//access_flap(access_flap_l_1_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
//access_flap(access_flap_l_2_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
//access_flap(access_flap_l_3_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
//access_flap(access_flap_l_4_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
//access_flap(access_flap_l_5_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
//access_flap(access_flap_l_6_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);

//access_flap(access_flap_l_1_pos,lower_body_width_outside,access_flap_h_pos,body_side_right);
//access_flap(access_flap_l_2_pos,lower_body_width_outside,access_flap_h_pos,body_side_right);
//access_flap(access_flap_l_3_pos,lower_body_width_outside,access_flap_h_pos,body_side_right);
//access_flap(access_flap_l_4_pos,lower_body_width_outside,access_flap_h_pos,body_side_right);
//access_flap(access_flap_l_5_pos,lower_body_width_outside,access_flap_h_pos,body_side_right);
//access_flap(access_flap_l_6_pos,lower_body_width_outside,access_flap_h_pos,body_side_right);

//lower_body_rivet_detail(plate_len_2,armour_gap*3, 0, armour_gap*2, rivet_no_6, rivet_dia, body_side_left);
//lower_body_rivet_detail(plate_len_2,armour_gap*3, lower_body_width_outside, armour_gap*2, rivet_no_6, rivet_dia, body_side_right);
//lower_body_rivet_detail(lower_body_width_outside, -rivet_dia, armour_gap*3, armour_gap*2,
//      rivet_no_7, rivet_dia, body_end_near);
//lower_body_rivet_detail(lower_body_width_outside, lower_body_length_outside, armour_gap*3, armour_gap*2,
//      rivet_no_7, rivet_dia, body_end_far);

//left_side_top_body_rivets(0,0,lower_to_waist_body_height);
//right_side_top_body_rivets(0,waist_body_width_outside,lower_to_waist_body_height);

//turret_mount(0,0,0);

//buffers();
//couplings();

//motor_block_lug_position(0,0,0);
/*
near_left_buffer_prot_plate(buffer_prot_plate_near_pos_l,
  buffer_prot_plate_left_pos_w,
  buffer_prot_plate_pos_h);
near_right_buffer_prot_plate(buffer_prot_plate_near_pos_l,
  buffer_prot_plate_right_pos_w,
  buffer_prot_plate_pos_h);

far_left_buffer_prot_plate(buffer_prot_plate_far_pos_l,
  buffer_prot_plate_left_pos_w,
  buffer_prot_plate_pos_h);
far_right_buffer_prot_plate(buffer_prot_plate_far_pos_l,
  buffer_prot_plate_right_pos_w,
  buffer_prot_plate_pos_h);

//large_hinges(0,0,0);
top_body_armour_hinges(top_plate_len_1,
        (((top_body_width_outside/2)/4)-(large_hinge_w/2)),
        body_side_left,angle_end_top_to_crest);
top_body_armour_hinges(top_plate_len_1+(armour_gap/2),
        ((((top_body_width_outside/2)/4)*3)-(large_hinge_w/2)),
        body_side_left,angle_end_top_to_crest);

top_body_armour_hinges(top_plate_len_1+(armour_gap/2),
        (top_body_width_outside/2)+((((top_body_width_outside/2)/4)*3)-(large_hinge_w/2)),
        body_side_right,angle_end_top_to_crest);
top_body_armour_hinges(top_plate_len_1+(armour_gap/2),
        (top_body_width_outside/2)+(((top_body_width_outside/2)/4)-(large_hinge_w/2)),
        body_side_right,angle_end_top_to_crest);

*/

//=======================================
// Library Modules
//=======================================
// c - ControlPoints
module BezQuadCurve(c, focalPoint, steps=gSteps, height=gHeight)
{
	for(step = [1:steps])
	{
		linear_extrude(height = height, convexity = 10) 
		polygon(
			points=[
				focalPoint,
				PointAlongBez4(c[0], c[1], c[2],c[3], step/steps),
				PointAlongBez4(c[0], c[1], c[2],c[3], (step-1)/steps)],
			paths=[[0,1,2,0]]
		);
	}
}

// Lengthwise prisms
module prism1(l, w, h){
  polyhedron(
    points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,0,h], [l,0,h]],
    faces=[[0,1,2,3],[2,3,4,5],[0,4,5,1],[0,3,4],[5,2,1]]
  );
}        

module prism2(l, w, h){
  polyhedron(
    points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
    faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
  );
}        
// Vertical prisms
module prism3(l, w, h){
    linear_extrude(
      height = h, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0, $fn = 3) {
      polygon(points=[[l,0],[0,0],[l,w]], paths=[[0,1,2]], convexity=10);
    }
}        

module prism4(l, w, h){
    linear_extrude(
      height = h, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0, $fn = 3) {
      polygon(points=[[l,0],[0,w],[l,w]], paths=[[0,1,2]], convexity=10);
    }
}        

module prism5(l, w, h){
    linear_extrude(
      height = h, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0, $fn = 3) {
      polygon(points=[[0,0],[0,w],[l,0]], paths=[[0,1,2]], convexity=10);
    }
}        

module prism6(l, w, h){
    linear_extrude(
      height = h, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0, $fn = 3) {
      polygon(points=[[0,0],[l,w],[0,w]], paths=[[0,1,2]], convexity=10);
    }
}        

module nutHole(l,w,h,size)
{
//takes a metric screw/nut size and looksup nut dimensions
	radius = (METRIC_NUT_DMENSIONS[find_size(size)] [nut_e_min]/2)+tolerance;
	height = (METRIC_NUT_DMENSIONS[find_size(size)] [nut_depth])+(tolerance);
  translate([l,w,h-height]) {
      cylinder(r= radius, h=height+tolerance, $fn = 6, center=[0,0]);
	}
}

module boltHole(l,w,h,size,length)
{
	radius = (METRIC_SCREW_DMENSIONS[find_size(size)] [hole_dia]/2)+tolerance;
	capHeight = (METRIC_SCREW_DMENSIONS[find_size(size)] [screw_cap_depth])+(tolerance*2);
	capRadius = (METRIC_SCREW_DMENSIONS[find_size(size)] [screw_cap_dia]/2)+tolerance;

	translate([l,w,h-length-tolerance]) {
    union() {
      cylinder(r= capRadius, h=capHeight, $fn = 50, center=[0,0]);
      translate([0,0,capHeight-tolerance])
        cylinder(r = radius, h = length, $fn = 50, center=[0,0]);
    }
  }
}

module screwHole(l,w,h,size,length)
{
	radius = (METRIC_SCREW_DMENSIONS[find_size(size)] [hole_dia]/2)+tolerance;

	translate([l,w,h-tolerance]) {
     cylinder(r = radius, h = length, $fn = 50, center=[0,0]);
  }
}
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

module wormGear(l,w,h,size,length,shaft_dia) {
  translate([l,w,h])rotate([0,90,0])
    schnecke(modul=size, gangzahl=2, laenge=length, bohrung=shaft_dia, eingriffswinkel=20,
      steigungswinkel=10, zusammen_gebaut=true);
}

//-----------------------------------------------------------------------------
// Body side doors and entry frame
//-----------------------------------------------------------------------------
module door_block(l1,w1,h1,l2,w2,h2) {
  translate([l1,w1-tolerance,h1]) {
    union() {
      difference() {
        cube([l2,w2+(tolerance*2),h2]);
// Cut out arch to match inside of the body profile
        translate([-tolerance,body_thickness+(tolerance*2),-tolerance]) {
          cube([l2+(tolerance*2),
                lower_body_width_inside,
                lower_to_waist_body_height+(tolerance*3)]);
            }
        translate([-tolerance,body_thickness+(tolerance*2),h1+lower_to_waist_body_height-tolerance]) {
          polyhedron(
            points=[
            [0,0,0],
            [l2+(tolerance*2),0,0],
            [l2+(tolerance*2),waist_body_width_inside,0],
            [0,waist_body_width_inside,0],

            [0,
              offset_top_body_width_outside+body_thickness,
              waist_to_top_body_height], 
            [l2+(tolerance*2),
              offset_top_body_width_outside+body_thickness,
              waist_to_top_body_height], 
            [l2+(tolerance*2),
              top_body_width_inside+(offset_top_body_width_outside-body_thickness),
              waist_to_top_body_height], 
            [0,
              top_body_width_inside+(offset_top_body_width_outside-body_thickness),
              waist_to_top_body_height]
          ],

          faces=[
            [0,1,2,3],  // bottom
            [4,5,1,0],  // front
            [7,6,5,4],  // top
            [5,6,2,1],  // right
            [6,7,3,2],  // back
            [7,4,0,3]   // left
          ]);
        }
 // Cut in the doors outline
        translate([door_gap/2,-tolerance,door_gap/2])
          cube([door_gap/2,door_gap,h2-door_gap]);
        translate([l2-door_gap,-tolerance,door_gap/2])
          cube([door_gap/2,door_gap,h2-door_gap]);
        translate([door_gap/2,-tolerance,door_gap/2])
          cube([l2-door_gap,door_gap,door_gap/2]);
        translate([door_gap/2,-tolerance,h2-door_gap])
          cube([l2-door_gap,door_gap,door_gap/2]);

        translate([door_gap/2,w2+tolerance,door_gap/2])
          cube([door_gap/2,door_gap,h2-door_gap]);
        translate([l2-door_gap,w2+tolerance,door_gap/2])
          cube([door_gap/2,door_gap,h2-door_gap]);
        translate([door_gap/2,w2+tolerance,door_gap/2])
          cube([l2-door_gap,door_gap,door_gap/2]);
        translate([door_gap/2,w2+tolerance,h2-door_gap])
          cube([l2-door_gap,door_gap,door_gap/2]);
      }
    }
  }
}

module personnel_access_doors(l,w,h,side) {
  translate([l,w,h]) {
    if (side == body_side_left) {
      union() {
        cube([access_door_l,access_door_w+tolerance,access_door_h]);
        translate([small_access_door_pos_l,-small_access_door_pos_w,small_access_door_pos_h])
          cube([small_access_door_l,small_access_door_w+tolerance,small_access_door_h]);
        
      }
    }

    if (side == body_side_right) {
      union() {
        cube([access_door_l,access_door_w+tolerance,access_door_h]);
        translate([small_access_door_pos_l,access_door_w-tolerance,small_access_door_pos_h])
          cube([small_access_door_l,small_access_door_w+tolerance,small_access_door_h]);
        
      }
    }
  }
}

//-----------------------------------------------------------------------------
// Gaps between armour plates on lower body
//-----------------------------------------------------------------------------

module lower_body_armour(l,w,h,side) {
  translate([l,w,h]) {
    union() {
      if ((side == body_side_left) || (side == body_side_right)) {
        translate([plate_len_1,0,0])
          cube([armour_gap,armour_gap,lower_to_waist_body_height]);
        translate([plate_len_2,0,0])
          cube([armour_gap,armour_gap,lower_to_waist_body_height]);
        translate([plate_len_3,0,0])
          cube([armour_gap,armour_gap,lower_to_waist_body_height]);
        translate([plate_len_4,0,0])
          cube([armour_gap,armour_gap,lower_to_waist_body_height]);
        translate([plate_len_5,0,0])
          cube([armour_gap,armour_gap,lower_to_waist_body_height]);
        translate([plate_len_6,0,0])
          cube([armour_gap,armour_gap,lower_to_waist_body_height]);
        translate([plate_len_7,0,0])
          cube([armour_gap,armour_gap,lower_to_waist_body_height]);

        translate([0,0,lower_to_waist_body_height-(armour_gap/2)])
          cube([door_frame_pos_l,armour_gap,armour_gap]);
        translate([door_frame_pos_l+door_frame_length,0,lower_to_waist_body_height-(armour_gap/2)])
          cube([lower_body_length_outside-(door_frame_pos_l+door_frame_length),armour_gap,armour_gap]);

      }
    
      if (side == body_end_near) {
        translate([0,0,lower_to_waist_body_height-(armour_gap/2)])
          cube([armour_gap,lower_body_width_outside,armour_gap]);
      }
      if (side == body_end_far) {
        translate([(lower_body_length_outside-armour_gap)+tolerance,0,lower_to_waist_body_height-(armour_gap/2)])
          cube([armour_gap,lower_body_width_outside,armour_gap]);
      }
    }
  }
}

//-----------------------------------------------------------------------------
// Gaps between armour plates on upper body
//-----------------------------------------------------------------------------
module upper_body_armour(l,w,h,side) {
//  angle_side_waist_to_top,angle_end_waist_to_top,
  translate([l,w,h]) {
    union() {
      if (side == body_side_left) {
        angle_armour_gaps(plate_len_1,
          ((waist_body_length_outside-top_body_length_outside)/2),
          ((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_2,
          0,
          ((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_3,
          0,
          ((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_4,
          0,
          ((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_5,
          0,
          ((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_6,
          0,
          ((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_7,
          -((waist_body_length_outside-top_body_length_outside)/2),
          ((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height+(armour_gap/2));
      }
      
      if (side == body_side_right) {
        angle_armour_gaps(plate_len_1,
          ((waist_body_length_outside-top_body_length_outside)/2),
          -((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_2,
          0,
          -((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_3,
          0,
          -((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_4,
          0,
          -((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_5,
          0,
          -((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_6,
          0,
          -((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);

        angle_armour_gaps(plate_len_7,
          -((waist_body_length_outside-top_body_length_outside)/2),
          -((waist_body_width_outside-top_body_width_outside)/2),
          waist_to_top_body_height);
      }
    }
  }
}

module angle_armour_gaps(pos,tl,tw,th) {
  translate([pos,0,0]) {
    polyhedron(

      points=[
        [0,0,0],
        [armour_gap,0,0],
        [armour_gap,armour_gap,0],
        [0,armour_gap,0],

        [tl, tw, th],
        [tl+armour_gap, tw, th], 
        [tl+armour_gap, tw+armour_gap, th], 
        [tl, tw+armour_gap, th]
      ],

      faces=[
        [0,1,2,3],  // bottom
        [4,5,1,0],  // front
        [7,6,5,4],  // top
        [5,6,2,1],  // right
        [6,7,3,2],  // back
        [7,4,0,3]   // left
      ]);
  }
}

//-----------------------------------------------------------------------------
// Gaps between armour plates on body top to crest
//-----------------------------------------------------------------------------
module crestline_armour_gap(pos,l,w,h) {
  translate([pos,w,h])
    cube([l,armour_gap,armour_gap]);
}  

module top_body_armour(l,w,h,side) {
  translate([l-offset_top_body_length_outside,w,h]) {
    union() {
      if (side == body_side_left) {

        top_angle_armour_gaps_left(top_plate_len_1,
          0,
          (top_body_width_outside/2),
          top_to_crest_height);

        top_angle_armour_gaps_left(top_plate_len_2,
          0,
          (top_body_width_outside/2),
          top_to_crest_height);

        top_angle_armour_gaps_left(top_plate_len_3,
          0,
          (top_body_width_outside/2),
          top_to_crest_height);

        top_angle_armour_gaps_left(top_plate_len_6,
          0,
          (top_body_width_outside/2),
          top_to_crest_height);

        top_angle_armour_gaps_left(top_plate_len_7,
          0,
          (top_body_width_outside/2),
          top_to_crest_height);

      }
      
      if (side == body_side_right) {

        top_angle_armour_gaps_right(top_plate_len_1,
          0,
          (top_body_width_outside/2)+(tolerance*2),
          top_to_crest_height);

        top_angle_armour_gaps_right(top_plate_len_2,
          0,
          (top_body_width_outside/2)+(tolerance*2),
          top_to_crest_height);

        top_angle_armour_gaps_right(top_plate_len_3,
          0,
          (top_body_width_outside/2)+(tolerance*2),
          top_to_crest_height);

        top_angle_armour_gaps_right(top_plate_len_6,
          0,
          (top_body_width_outside/2)+(tolerance*2),
          top_to_crest_height);

        top_angle_armour_gaps_right(top_plate_len_7,
          0,
          (top_body_width_outside/2)+(tolerance*2),
          top_to_crest_height);

      }
    }
  }
}

module top_angle_armour_gaps_left(pos,tl,tw,th) {
  translate([pos,-tolerance,0]) {
    polyhedron(

      points=[
        [0,0,-armour_gap],
        [0,armour_gap,armour_gap],
        [armour_gap,armour_gap,armour_gap],
        [armour_gap,0,-armour_gap],

        [tl, tw, th-armour_gap],
        [tl, tw+armour_gap, th+armour_gap], 
        [tl+armour_gap, tw+armour_gap, th+armour_gap], 
        [tl+armour_gap, tw, th-armour_gap]
      ],

      faces=[
        [0,1,2,3],  // bottom
        [4,5,1,0],  // front
        [7,6,5,4],  // top
        [5,6,2,1],  // right
        [6,7,3,2],  // back
        [7,4,0,3]   // left
      ]);
  }
}

module top_angle_armour_gaps_right(pos,tl,tw,th) {
  translate([pos,-tolerance,0]) {
    polyhedron(

      points=[
        [0,0,th-armour_gap],
        [0,armour_gap,th+armour_gap],
        [armour_gap,armour_gap,th+armour_gap],
        [armour_gap,0,th-armour_gap],

        [tl, tw, -armour_gap],
        [tl, tw+armour_gap, armour_gap], 
        [tl+armour_gap, tw+armour_gap, armour_gap], 
        [tl+armour_gap, tw, -armour_gap]
      ],

      faces=[
        [0,1,2,3],  // bottom
        [4,5,1,0],  // front
        [7,6,5,4],  // top
        [5,6,2,1],  // right
        [6,7,3,2],  // back
        [7,4,0,3]   // left
      ]);
  }
}


//-----------------------------------------------------------------------------
// Top to crest body hinges
//-----------------------------------------------------------------------------
module top_body_armour_hinges(l,w,side,angle) {
  $fn=50;
  if (side == body_side_left) {
    h = (sin(angle)*w);
    translate([l-offset_top_body_length_outside,w,h]) {
      union() {
        rotate([270+angle,0,0]) {
          translate([-(med_hinge_l/2),-(med_hinge_w-tolerance),0])
            cube([med_hinge_l,med_hinge_w,med_hinge_h]);
          translate([0,-(med_hinge_w-tolerance),0])
            cylinder(d=med_hinge_pivot_depth,h=med_hinge_h);
        }
      }
    }
  }

  if (side == body_side_right) {
    h = (sin(-angle)*w);
    translate([l-offset_top_body_length_outside,w,h+((top_to_crest_height*2)-(tolerance*2))]) {
      union() {
        rotate([90-angle,0,0]) {
          translate([-(med_hinge_l/2),-tolerance,0])
            cube([med_hinge_l,med_hinge_w,med_hinge_h]);
          translate([0,med_hinge_w-tolerance,0])
            cylinder(d=med_hinge_pivot_depth,h=med_hinge_h);
        }
      }
    }
  }
}

//-----------------------------------------------------------------------------
// Add turret mounting block for imported KV-1 turret
//-----------------------------------------------------------------------------

module turret_mount(l,w,h) {
  $fn=50;
  translate([l,w,h]) {
    union() {
      difference() {
        cube([turret_block_length,turret_block_width,turret_block_height]);
        translate([turret_block_length/2,turret_block_width/2,-tolerance])
          cylinder(d=turret_spigot_dia+tolerance,h=turret_block_height+(tolerance*2));
      }
      translate([turret_block_fr_pos_l,turret_block_fr_pos_wl,0])
        cube([turret_block_fr_l,turret_block_fr_w,turret_block_height]);
      translate([turret_block_fr_pos_l,0,0]) {
        prism4(turret_block_fr_l, turret_block_fr_pos_wl, turret_block_height);
      }
      translate([turret_block_fr_pos_l,turret_block_fr_pos_w2,0]) {
        prism3(turret_block_fr_l, turret_block_fr_pos_wl, turret_block_height);
      }
    }
  }
}

//-----------------------------------------------------------------------------
// Lower Buffing gear protection plates
//-----------------------------------------------------------------------------

module near_left_buffer_prot_plate(l,w,h) {
  translate([l,w,h]) {
    union() {
      cube([buffer_prot_plate_l,buffer_prot_plate_w,buffer_prot_plate_h]);
      translate([buffer_prot_plate_l-buffer_prot_fillet_l,buffer_prot_plate_w,0]) {
        prism3(buffer_prot_fillet_l, buffer_prot_fillet_w, buffer_prot_fillet_h);
      large_hinges(large_hinge_l/2,-buffer_prot_fillet_w,buffer_prot_plate_hinge_lower,
        body_side_left,0);
      large_hinges(large_hinge_l/2,-buffer_prot_fillet_w,buffer_prot_plate_hinge_upper,
        body_side_left,0);
      }
    }
  }
}

module near_right_buffer_prot_plate(l,w,h) {
  translate([l,w,h]) {
    union() {
      cube([buffer_prot_plate_l,buffer_prot_plate_w,buffer_prot_plate_h]);
      translate([buffer_prot_plate_l-buffer_prot_fillet_l,-buffer_prot_plate_w,0])
        prism4(buffer_prot_fillet_l, buffer_prot_fillet_w, buffer_prot_fillet_h);
      large_hinges(buffer_prot_plate_l,buffer_prot_plate_w,buffer_prot_plate_hinge_lower,
        body_side_right,0);
      large_hinges(buffer_prot_plate_l,buffer_prot_plate_w,buffer_prot_plate_hinge_upper,
        body_side_right,0);
    }
  }
}

module far_left_buffer_prot_plate(l,w,h) {
  translate([l,w,h]) {
    union() {
      cube([buffer_prot_plate_l,buffer_prot_plate_w,buffer_prot_plate_h]);
      translate([0,buffer_prot_plate_w,0])
        prism5(buffer_prot_fillet_l, buffer_prot_fillet_w, buffer_prot_fillet_h);
      large_hinges(0,0,
        buffer_prot_plate_hinge_lower, body_side_left,0);
      large_hinges(0,0,
        buffer_prot_plate_hinge_upper, body_side_left,0);
    }
  }
}

module far_right_buffer_prot_plate(l,w,h) {
  translate([l,w,h]) {
    union() {
      cube([buffer_prot_plate_l,buffer_prot_plate_w,buffer_prot_plate_h]);
      translate([0,-buffer_prot_plate_w,0])
        prism6(buffer_prot_fillet_l, buffer_prot_fillet_w, buffer_prot_fillet_h);
      large_hinges(0,buffer_prot_plate_w,
        buffer_prot_plate_hinge_lower, body_side_right,0);
      large_hinges(0,buffer_prot_plate_w,
        buffer_prot_plate_hinge_upper, body_side_right,0);
    }
  }
}


//-----------------------------------------------------------------------------
// Rivet detail - Lower flat body
//-----------------------------------------------------------------------------

module lower_body_rivet_detail(plate_len,offset_l, offset_w, offset_h, n_rivets, rivet_dia, side) {
  if (side == body_side_left) {
    pitch = (plate_len - (armour_gap*5))/n_rivets;
    translate([offset_l, offset_w, offset_h]) {
      for (n =[0:n_rivets]) rivet(n*pitch, 0, 0, rivet_dia, left_side_angle,no_tilt);
    }
    translate([offset_l, 0, rivet_row_mid_lower]) {
      for (n =[0:n_rivets]) rivet(n*pitch, 0, 0, rivet_dia, left_side_angle,no_tilt);
    }
    translate([offset_l, 0, rivet_row_mid_upper]) {
      for (n =[0:n_rivets]) rivet(n*pitch, 0, 0, rivet_dia, left_side_angle,no_tilt);
    }
    translate([offset_l, 0, lower_to_waist_body_height-offset_h]) {
      for (n =[0:n_rivets]) rivet(n*pitch, 0, 0, rivet_dia, left_side_angle,no_tilt);
    }
  }

  if (side == body_side_right) {
    pitch = (plate_len - (armour_gap*5))/n_rivets;
    translate([offset_l, offset_w, offset_h]) {
      for (n =[0:n_rivets]) rivet(n*pitch, 0, 0, rivet_dia, right_side_angle, no_tilt);
    }
    translate([offset_l, offset_w, rivet_row_mid_lower]) {
      for (n =[0:n_rivets]) rivet(n*pitch, 0, 0, rivet_dia, right_side_angle, no_tilt);
    }
    translate([offset_l, offset_w, rivet_row_mid_upper]) {
      for (n =[0:n_rivets]) rivet(n*pitch, 0, 0, rivet_dia, right_side_angle, no_tilt);
    }
    translate([offset_l, offset_w, lower_to_waist_body_height-offset_h]) {
      for (n =[0:n_rivets]) rivet(n*pitch, 0, 0, rivet_dia, right_side_angle, no_tilt);
    }
  }
  if (side == body_end_near) {
    pitch = (plate_len - (armour_gap*5))/n_rivets;
    translate([0, offset_w, offset_h]) {
      for (n =[0:n_rivets]) rivet(0, n*pitch, 0, rivet_dia, near_end_angle, no_tilt);
    }
  }
  if (side == body_end_far) {
    pitch = (plate_len - (armour_gap*5))/n_rivets;
    translate([lower_body_length_outside, offset_w, offset_h]) {
      for (n =[0:n_rivets]) rivet(0, n*pitch, 0, rivet_dia, far_end_angle, no_tilt);
    }
  }
}

//-----------------------------------------------------------------------------
// Rivet detail - upper body - left side
//-----------------------------------------------------------------------------

module left_side_top_body_rivets(l,w,h) {
  translate([l,w,h]) {
    top_body_rivet_detail(
      plate_len_2 - (armour_gap*2), // Position of first rivet
      sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      (plate_len_2 - (armour_gap*5))/rivet_no_6, // Maximun possible rivets per plate (pitch)
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top);  // angle of rivet

    top_body_rivet_detail(
      plate_len_2 - (armour_gap*2), // Position of first rivet
      (offset_top_body_width_outside/2),
      (waist_to_top_body_height/2),
      (plate_len_2 - (armour_gap*5))/rivet_no_6, // Maximun possible rivets per plate (pitch)
      rivet_no_4, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_2 - (armour_gap*2), // Position of first rivet
      (offset_top_body_width_outside)-sin(angle_side_waist_to_top*(armour_gap*2)),
      waist_to_top_body_height-(armour_gap*2),
      (plate_len_2 - (armour_gap*5))/rivet_no_6, // Maximun possible rivets per plate (pitch)
      rivet_no_4, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

// left side near end rivets on slope 
    top_body_rivet_detail(
      (armour_gap*7), // Position of first rivet
      sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      (offset_top_body_length_outside/3)+(armour_gap*5), // Position of first rivet
      (offset_top_body_width_outside/3)-sin(angle_side_waist_to_top*(armour_gap/2)),
      (waist_to_top_body_height/3),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      ((offset_top_body_length_outside/3)*2)+(armour_gap*5), // Position of first rivet
      ((offset_top_body_width_outside/3)*2)-sin(angle_side_waist_to_top*(armour_gap/2)),
      ((waist_to_top_body_height/3)*2),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      offset_top_body_length_outside+(armour_gap*3), // Position of first rivet
      offset_top_body_width_outside-sin(angle_side_waist_to_top*(armour_gap*2.5)),
      waist_to_top_body_height-(armour_gap*2),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

// Left side rest of panels
    top_body_rivet_detail(
      plate_len_3 - (armour_gap*2), // Position of first rivet
      sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      ((plate_len_3 - plate_len_2) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_3 - (armour_gap*2), // Position of first rivet
      (offset_top_body_width_outside/2),
      (waist_to_top_body_height/2),
      ((plate_len_3 - plate_len_2) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_3 - (armour_gap*2), // Position of first rivet
      (offset_top_body_width_outside)-sin(angle_side_waist_to_top*(armour_gap*2)),
      waist_to_top_body_height-(armour_gap*2),
      ((plate_len_3 - plate_len_2) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_4 - (armour_gap*2), // Position of first rivet
      sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      ((plate_len_4 - plate_len_3) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_4 - (armour_gap*2), // Position of first rivet
      (offset_top_body_width_outside/2),
      (waist_to_top_body_height/2),
      ((plate_len_4 - plate_len_3) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_4 - (armour_gap*2), // Position of first rivet
      (offset_top_body_width_outside)-sin(angle_side_waist_to_top*(armour_gap*2)),
      waist_to_top_body_height-(armour_gap*2),
      ((plate_len_4 - plate_len_3) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_6 - (armour_gap*2), // Position of first rivet
      sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      ((plate_len_6 - plate_len_5) - (armour_gap*5))/rivet_no_3,
      rivet_no_3, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_6 - (armour_gap*2), // Position of first rivet
      (offset_top_body_width_outside/2),
      (waist_to_top_body_height/2),
      ((plate_len_6 - plate_len_5) - (armour_gap*5))/rivet_no_3,
      rivet_no_3, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_6 - (armour_gap*2), // Position of first rivet
      (offset_top_body_width_outside)-sin(angle_side_waist_to_top*(armour_gap*2)),
      waist_to_top_body_height-(armour_gap*2),
      ((plate_len_6 - plate_len_5) - (armour_gap*5))/rivet_no_3,
      rivet_no_3, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

// left side plate 7
    top_body_rivet_detail(
      plate_len_6+(((plate_len_7-plate_len_6)/rivet_no_6)*4)-(armour_gap*2),
      sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      ((plate_len_7 - plate_len_6)/(rivet_no_6+(armour_gap*2))),
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet
      
    top_body_rivet_detail(
      plate_len_6+(((plate_len_7-plate_len_6)/rivet_no_6)*3)-(armour_gap),
      (offset_top_body_width_outside/2),
      (waist_to_top_body_height/2),
      ((plate_len_7 - plate_len_6)/(rivet_no_6+(armour_gap*2))),
      rivet_no_4, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet
      
    top_body_rivet_detail(
      plate_len_6+(((plate_len_7-plate_len_6)/rivet_no_6)*3)-(armour_gap),
      (offset_top_body_width_outside)-sin(angle_side_waist_to_top*(armour_gap*2)),
      waist_to_top_body_height-(armour_gap*2),
      ((plate_len_7 - plate_len_6)/(rivet_no_6+(armour_gap*2))),
      rivet_no_4, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

// left side far end rivets on slope 
    top_body_rivet_detail(
      plate_len_7 - (armour_gap*7), // Position of first rivet
      sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      rivet_no_1, // Maximun possible rivets per plate (pitch)
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_7 - ((offset_top_body_length_outside/3)+(armour_gap*3)), // Position of first rivet
      (offset_top_body_width_outside/3)-sin(angle_side_waist_to_top*(armour_gap/2)),
      (waist_to_top_body_height/3),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_7 - (((offset_top_body_length_outside/3)*2)+(armour_gap*3)), // Position of first rivet
      ((offset_top_body_width_outside/3)*2)-sin(angle_side_waist_to_top*(armour_gap/2)),
      ((waist_to_top_body_height/3)*2),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_7 - (offset_top_body_length_outside+(armour_gap)), // Position of first rivet
      offset_top_body_width_outside-sin(angle_side_waist_to_top*(armour_gap*2.5)),
      waist_to_top_body_height-(armour_gap*2),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      left_side_angle,  // face of vehicle
      angle_side_waist_to_top); // angle of rivet

  }
}

//-----------------------------------------------------------------------------
// Rivet detail - upper body - right side
//-----------------------------------------------------------------------------

module right_side_top_body_rivets(l,w,h) {
  translate([l,w,h]) {

    top_body_rivet_detail(
      plate_len_2 - (armour_gap*2), // Position of first rivet
      -sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      (plate_len_2 - (armour_gap*5))/rivet_no_6, // Maximun possible rivets per plate (pitch)
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_2 - (armour_gap*2), // Position of first rivet
      -(offset_top_body_width_outside/2),
      (waist_to_top_body_height/2),
      (plate_len_2 - (armour_gap*5))/rivet_no_6, // Maximun possible rivets per plate (pitch)
      rivet_no_4, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_2 - (armour_gap*2), // Position of first rivet
      -(offset_top_body_width_outside-sin(angle_side_waist_to_top*(armour_gap*2))),
      waist_to_top_body_height-(armour_gap*2),
      (plate_len_2 - (armour_gap*5))/rivet_no_6, // Maximun possible rivets per plate (pitch)
      rivet_no_4, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

// Right side near end rivets on slope
    top_body_rivet_detail(
      (armour_gap*7), // Position of first rivet
      -sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      (offset_top_body_length_outside/3)+(armour_gap*5), // Position of first rivet
      -(offset_top_body_width_outside/3)-sin(angle_side_waist_to_top*(armour_gap/2)),
      (waist_to_top_body_height/3),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      ((offset_top_body_length_outside/3)*2)+(armour_gap*5), // Position of first rivet
      -((offset_top_body_width_outside/3)*2)-sin(angle_side_waist_to_top*(armour_gap/2)),
      ((waist_to_top_body_height/3)*2),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      offset_top_body_length_outside+(armour_gap*5), // Position of first rivet
      -(offset_top_body_width_outside-
        sin(angle_side_waist_to_top*(armour_gap*2.5))),
      waist_to_top_body_height-(armour_gap*2),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

// Right side rest of panels
    top_body_rivet_detail(
      plate_len_3 - (armour_gap*2), // Position of first rivet
      -sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      ((plate_len_3 - plate_len_2) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_3 - (armour_gap*2), // Position of first rivet
      -(offset_top_body_width_outside/2),
      (waist_to_top_body_height/2),
      ((plate_len_3 - plate_len_2) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_3 - (armour_gap*2), // Position of first rivet
      -(offset_top_body_width_outside-sin(angle_side_waist_to_top*(armour_gap*2))),
      waist_to_top_body_height-(armour_gap*2),
      ((plate_len_3 - plate_len_2) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_4 - (armour_gap*2), // Position of first rivet
      -sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      ((plate_len_4 - plate_len_3) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet
      
    top_body_rivet_detail(
      plate_len_4 - (armour_gap*2), // Position of first rivet
      -(offset_top_body_width_outside/2),
      (waist_to_top_body_height/2),
      ((plate_len_4 - plate_len_3) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_4 - (armour_gap*2), // Position of first rivet
      -(offset_top_body_width_outside-sin(angle_side_waist_to_top*(armour_gap*2))),
      waist_to_top_body_height-(armour_gap*2),
      ((plate_len_4 - plate_len_3) - (armour_gap*5))/rivet_no_5,
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_6 - (armour_gap*2), // Position of first rivet
      -sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      ((plate_len_6 - plate_len_5) - (armour_gap*5))/rivet_no_3,
      rivet_no_3, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet
     
    top_body_rivet_detail(
      plate_len_6 - (armour_gap*2), // Position of first rivet
      -(offset_top_body_width_outside/2),
      (waist_to_top_body_height/2),
      ((plate_len_6 - plate_len_5) - (armour_gap*5))/rivet_no_3,
      rivet_no_3, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_6 - (armour_gap*2), // Position of first rivet
      -(offset_top_body_width_outside-sin(angle_side_waist_to_top*(armour_gap*2))),
      waist_to_top_body_height-(armour_gap*2),
      ((plate_len_6 - plate_len_5) - (armour_gap*5))/rivet_no_3,
      rivet_no_3, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

// Right side plate 7
    top_body_rivet_detail(
      plate_len_6+(((plate_len_7-plate_len_6)/rivet_no_6)*4)-(armour_gap*2),
      -sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      ((plate_len_7 - plate_len_6)/(rivet_no_6+(armour_gap*2))),
      rivet_no_5, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet
      
    top_body_rivet_detail(
      plate_len_6+(((plate_len_7-plate_len_6)/rivet_no_6)*3)-(armour_gap),
      -(offset_top_body_width_outside/2),
      (waist_to_top_body_height/2),
      ((plate_len_7 - plate_len_6)/(rivet_no_6+(armour_gap*2))),
      rivet_no_4, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet
      
    top_body_rivet_detail(
      plate_len_6+(((plate_len_7-plate_len_6)/rivet_no_6)*3)-(armour_gap),
      -(offset_top_body_width_outside-sin(angle_side_waist_to_top*(armour_gap*2))),
      waist_to_top_body_height-(armour_gap*2),
      ((plate_len_7 - plate_len_6)/(rivet_no_6+(armour_gap*2))),
      rivet_no_4, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

// Right side far end rivets on slope 
    top_body_rivet_detail(
      plate_len_7 - (armour_gap*7), // Position of first rivet
      -sin(angle_side_waist_to_top*(armour_gap*2.5)),
      (armour_gap*2),
      rivet_no_1, // Maximun possible rivets per plate (pitch)
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_7 - ((offset_top_body_length_outside/3)+(armour_gap*3)), // Position of first rivet
      -(offset_top_body_width_outside/3)-sin(angle_side_waist_to_top*(armour_gap/2)),
      (waist_to_top_body_height/3),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_7 - (((offset_top_body_length_outside/3)*2)+(armour_gap*3)), // Position of first rivet
      -((offset_top_body_width_outside/3)*2)-sin(angle_side_waist_to_top*(armour_gap/2)),
      ((waist_to_top_body_height/3)*2),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

    top_body_rivet_detail(
      plate_len_7 - (offset_top_body_length_outside+(armour_gap)), // Position of first rivet
      -(offset_top_body_width_outside-sin(angle_side_waist_to_top*(armour_gap*2))),
      waist_to_top_body_height-(armour_gap*2),
      rivet_no_1, // Actual number of rivets
      rivet_no_1, // Actual number of rivets
      rivet_dia,  // diameter of rivet head
      right_side_angle, // face of vehicle
      -angle_side_waist_to_top); // angle of rivet

  }
}

//-----------------------------------------------------------------------------
// Rivet detail - Positioning modules
//-----------------------------------------------------------------------------

module top_body_rivet_detail(l, w, h, pitch, n_rivets, rivet_dia, angle, tilt) {
 
  if (n_rivets == rivet_no_1) {
    rivet(l, w, h, rivet_dia, angle, tilt);
  }
  else
  {
    for (n =[0:n_rivets]) {
      l_plate = l-(n*pitch);
        rivet(l_plate,w,h, rivet_dia, angle,tilt);
    }
  }
}

module rivet(l, w, h, dia, angle, tilt) {

  $fn=50;
  translate([l,w,h]) {
    rotate([270-tilt,0,0]) {
      difference() {
        sphere(r=dia/2);
        rotate([0,angle,0])
            cylinder(d=dia+tolerance,h=dia);
      }
    }
  }
}  

//-----------------------------------------------------------------------------
// Bodyside machinery access flaps
//-----------------------------------------------------------------------------

module access_flap(l,w,h,side) {
  $fn=50;
  if (side == body_side_left) {
    translate([l,w,h]) {
      union() {
        rotate([270,270,0]) {
          minkowski() {
            cube([access_flap_h-(access_flap_corner_radius/2),access_flap_l,access_flap_w/2]);
            cylinder(r=access_flap_corner_radius,h=access_flap_w);
          }
        }
        translate([access_flap_handle_pos_l,
          -(access_flap_w+access_flap_handle_pos_w),
          access_flap_handle_pos_h])
          cube([access_flap_handle_l,access_flap_handle_w,access_flap_handle_h]);
        translate([access_flap_hinge_pos_l,
          -(access_flap_w/2),
          access_flap_upper_hinge_h])
          cube([access_flap_hinge_l,access_flap_hinge_w+access_flap_w,access_flap_hinge_h]);
        translate([access_flap_hinge_pos_l,
          -(access_flap_w/2),
          access_flap_lower_hinge_h])
          cube([access_flap_hinge_l,access_flap_hinge_w+access_flap_w,access_flap_hinge_h]);
      }
    }
  }
  if (side == body_side_right) {
    translate([l,w-access_flap_w,h]) {
      union() {
        rotate([270,270,0]) {
          minkowski() {
            cube([access_flap_h-(access_flap_corner_radius/2),access_flap_l,access_flap_w/2]);
            cylinder(r=access_flap_corner_radius,h=access_flap_w);
          }
        }
        translate([access_flap_handle_pos_l,
          access_flap_w+access_flap_handle_pos_w,access_flap_handle_pos_h])
          cube([access_flap_handle_l,access_flap_handle_w,access_flap_handle_h]);
        translate([access_flap_hinge_pos_l,
          (access_flap_w/2),
          access_flap_upper_hinge_h])
          cube([access_flap_hinge_l,access_flap_hinge_w+access_flap_w,access_flap_hinge_h]);
        translate([access_flap_hinge_pos_l,
          (access_flap_w/2),
          access_flap_lower_hinge_h])
          cube([access_flap_hinge_l,access_flap_hinge_w+access_flap_w,access_flap_hinge_h]);
      }
    }
  }
}

//-----------------------------------------------------------------------------
// Buffer printed and provision for added metal buffers
//-----------------------------------------------------------------------------

module buffers() {
  near_buffer(left_near_buffer_pos_l,left_near_buffer_pos_w,left_near_buffer_pos_h);
  near_buffer(right_near_buffer_pos_l,right_near_buffer_pos_w,right_near_buffer_pos_h);
  far_buffer(left_far_buffer_pos_l,left_far_buffer_pos_w,left_far_buffer_pos_h);
  far_buffer(right_far_buffer_pos_l,right_far_buffer_pos_w,right_far_buffer_pos_h);
}

module near_buffer(l,w,h) {
  $fn = 50;
  if (print_buffer == true) {
    union() {
      translate([l-buffer_mounting_block_l,w-(buffer_mounting_block_w/2),h-(buffer_mounting_block_h/2)])
        cube([buffer_mounting_block_l,buffer_mounting_block_w,buffer_mounting_block_h]);
      translate([l-buffer_mounting_block_l,w,h]) rotate([270,0,90])
        cylinder(d=pbuffer_shank_1st_d,h=pbuffer_shank_1st_l+tolerance);
      translate([l-buffer_mounting_block_l,w,h]) rotate([270,0,90])
        cylinder(d=pbuffer_shank_2nd_d,h=pbuffer_shank_2nd_l+tolerance);
      translate([l-buffer_mounting_block_l,w,h]) rotate([270,0,90])
        cylinder(d=pbuffer_shank_3rd_d,h=pbuffer_shank_3rd_l+tolerance);
      translate([l-(buffer_mounting_block_l+pbuffer_shank_3rd_l),w,h]) rotate([270,0,90])
        cylinder(d=pbuffer_head_d,h=pbuffer_head_l+tolerance);
    }
  }
  else {
    difference() {
    translate([l-buffer_mounting_block_l,w-(buffer_mounting_block_w/2),h-(buffer_mounting_block_h/2)])
      cube([buffer_mounting_block_l*2,buffer_mounting_block_w,buffer_mounting_block_h]);
      translate([l+buffer_mounting_block_l+tolerance,w,h]) rotate([270,0,90])
        cylinder(r=buffer_hole_radius,h=(buffer_mounting_block_l*2)+(tolerance*2));
    }
  }
}

module far_buffer(l,w,h) {
  $fn = 50;
  if (print_buffer == true) {
    union() {
      translate([l,w-(buffer_mounting_block_w/2),h-(buffer_mounting_block_h/2)])
        cube([buffer_mounting_block_l,buffer_mounting_block_w,buffer_mounting_block_h]);
      translate([l+pbuffer_shank_1st_l+buffer_mounting_block_l,w,h])
        rotate([270,0,90]) cylinder(d=pbuffer_shank_1st_d,h=pbuffer_shank_1st_l+tolerance);
      translate([l+pbuffer_shank_2nd_l+buffer_mounting_block_l,w,h])
        rotate([270,0,90]) cylinder(d=pbuffer_shank_2nd_d,h=pbuffer_shank_2nd_l+tolerance);
      translate([l+pbuffer_shank_3rd_l+buffer_mounting_block_l,w,h])
        rotate([270,0,90]) cylinder(d=pbuffer_shank_3rd_d,h=pbuffer_shank_3rd_l+tolerance);
      translate([l+buffer_mounting_block_l+pbuffer_shank_3rd_l+pbuffer_head_l,w,h])
        rotate([270,0,90]) cylinder(d=pbuffer_head_d,h=pbuffer_head_l+tolerance);
    }
  }
  else {
    difference() {
    translate([l-buffer_mounting_block_l,w-(buffer_mounting_block_w/2),h-(buffer_mounting_block_h/2)])
      cube([buffer_mounting_block_l*2,buffer_mounting_block_w,buffer_mounting_block_h]);
      translate([l+buffer_mounting_block_l+tolerance,w,h]) rotate([270,0,90])
        cylinder(r=buffer_hole_radius,h=(buffer_mounting_block_l*2)+(tolerance*2));
    }
  }
}


//-----------------------------------------------------------------------------
// coupling mounting blocks - European drawhook only (not provided)
//-----------------------------------------------------------------------------

module couplings() {
  near_end_coupling(-coupling_pos_l,coupling_pos_w,coupling_pos_h);
  far_end_coupling((lower_body_length_outside+coupling_pos_l)-coupling_mounting_block_l,
    coupling_pos_w,coupling_pos_h);
}

module near_end_coupling(l,w,h) {
  translate([l,w,h]) {
    difference() {
      cube([coupling_mounting_block_l,coupling_mounting_block_w,coupling_mounting_block_h]);
      translate([-coupling_hole_pos_l,coupling_hole_pos_w,coupling_hole_pos_h])
        cube([coupling_hole_l,coupling_hole_w,coupling_hole_h]);
    }
  }
}

module far_end_coupling(l,w,h) {
  translate([l,w,h]) {
    difference() {
      cube([coupling_mounting_block_l,coupling_mounting_block_w,coupling_mounting_block_h]);
      translate([-coupling_hole_pos_l,coupling_hole_pos_w,coupling_hole_pos_h])
        cube([coupling_hole_l,coupling_hole_w,coupling_hole_h]);
    }
  }
}

//-----------------------------------------------------------------------------
// Standard hinges - decoration only
//-----------------------------------------------------------------------------

module large_hinges(l,w,h,side,angle) {
  $fn=50;
  translate([l,w,h]) {
    if (side == body_side_left) {
      union() {
        translate([-(large_hinge_l/2),-(large_hinge_w-tolerance),0])
          cube([large_hinge_l,large_hinge_w,large_hinge_h]);
        translate([0,-(large_hinge_w-tolerance),0])
          cylinder(d=large_hinge_pivot_depth,h=large_hinge_h);
      }
    }
    if (side == body_side_right) {
      union() {
        translate([-(large_hinge_l/2),-tolerance,0])
          cube([large_hinge_l,large_hinge_w,large_hinge_h]);
        translate([0,large_hinge_w,0])
          cylinder(d=large_hinge_pivot_depth,h=large_hinge_h);
      }
    }
  }
}

module small_hinges(l,w,h) {
  translate([l,w,h]) {

  }
}

module motor_block_lug_position(l,w,h) {
  translate([l,w,h]) 
    cube([motor_casing_loc_lug_l,motor_casing_loc_lug_w,motor_casing_loc_lug_h]);
}