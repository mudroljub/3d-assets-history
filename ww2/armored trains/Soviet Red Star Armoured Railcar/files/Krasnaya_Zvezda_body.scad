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

//-----------------------------------------------------------------------------
// Set Parameters for design - Do this before printing anything!
// DON'T FORGET TO SAVE FILES BEFORE Previewing and Rendering!
//-----------------------------------------------------------------------------

include <Krasnaya_Zvezda_params.scad>
use <Krasnaya_Zvezda_modules.scad>
use <Krasnaya_Zvezda_chassis.scad>

$fn=50;

//-----------------------------------------------------------------------------
// Start of Body Code
//-----------------------------------------------------------------------------
translate([0,0,0]) { // Position module on plate
  union() {
    lower_body(0,0,0);
    upper_body(0,0,0);
    body_top(0,0,0);
  }
}

//-----------------------------------------------------------------------------
// Lower Body Module
//-----------------------------------------------------------------------------

module lower_body (l,w,h) {
  translate([l,w,h]) {
    union() {
      difference() {

        cube([lower_body_length_outside,lower_body_width_outside,lower_to_waist_body_height+tolerance]);
          translate([body_thickness,body_thickness,-tolerance])
            cube([lower_body_length_inside,
              lower_body_width_inside,
              lower_to_waist_body_height+(tolerance*3)]);
       
        lower_body_armour(0,-tolerance,0,body_side_left);
        lower_body_armour(0,lower_body_width_outside-armour_gap+tolerance,0,body_side_right);
        lower_body_armour(-tolerance,0,0,body_end_near);
        lower_body_armour(0,0,0,body_end_far);
        
      } //End of difference

// Rivet detail - left side
      lower_body_rivet_detail(plate_len_2,armour_gap*3, 0, armour_gap*2,
        rivet_no_6, rivet_dia, body_side_left);
      lower_body_rivet_detail(plate_len_3-plate_len_2,plate_len_2+armour_gap*2, 0, armour_gap*2,
        rivet_no_5, rivet_dia, body_side_left);
      lower_body_rivet_detail(plate_len_4-plate_len_3,plate_len_3+armour_gap*2, 0, armour_gap*2,
        rivet_no_5, rivet_dia, body_side_left);
      lower_body_rivet_detail(plate_len_6-plate_len_5,plate_len_5+armour_gap*2, 0, armour_gap*2,
        rivet_no_3, rivet_dia, body_side_left);
      lower_body_rivet_detail(plate_len_7-plate_len_6,plate_len_6+armour_gap*2, 0, armour_gap*2,
        rivet_no_6, rivet_dia, body_side_left);

// Rivet detail - right side
      lower_body_rivet_detail(plate_len_2,
        armour_gap*3, lower_body_width_outside, armour_gap*2,
        rivet_no_6, rivet_dia, body_side_right);
      lower_body_rivet_detail(plate_len_3-plate_len_2,
        plate_len_2+armour_gap*2, lower_body_width_outside, armour_gap*2,
        rivet_no_5, rivet_dia, body_side_right);
      lower_body_rivet_detail(plate_len_4-plate_len_3,
        plate_len_3+armour_gap*2, lower_body_width_outside, armour_gap*2,
        rivet_no_5, rivet_dia, body_side_right);
      lower_body_rivet_detail(plate_len_6-plate_len_5,
        plate_len_5+armour_gap*2, lower_body_width_outside, armour_gap*2,
        rivet_no_3, rivet_dia, body_side_right);
      lower_body_rivet_detail(plate_len_7-plate_len_6,
        plate_len_6+armour_gap*2, lower_body_width_outside, armour_gap*2,
        rivet_no_6, rivet_dia, body_side_right);
      
// Rivet detail - near end
      lower_body_rivet_detail(lower_body_width_outside, 0, armour_gap*2, armour_gap*2,
        rivet_no_7, rivet_dia, body_end_near);
      lower_body_rivet_detail(lower_body_width_outside, 0, armour_gap*2, rivet_row_end_mid,
        rivet_no_7, rivet_dia, body_end_near);
      lower_body_rivet_detail(lower_body_width_outside, 0, armour_gap*2, rivet_row_end_upper,
        rivet_no_7, rivet_dia, body_end_near);

// Rivet detail - far end
      lower_body_rivet_detail(lower_body_width_outside, lower_body_length_outside, armour_gap*3, armour_gap*2,
        rivet_no_7, rivet_dia, body_end_far);
      lower_body_rivet_detail(lower_body_width_outside,
        lower_body_length_outside, armour_gap*3, rivet_row_end_mid,
        rivet_no_7, rivet_dia, body_end_far);
      lower_body_rivet_detail(lower_body_width_outside,
        lower_body_length_outside, armour_gap*3, rivet_row_end_upper,
        rivet_no_7, rivet_dia, body_end_far);


      union() {
        door_block(door_frame_pos_l,-tolerance,0,
          door_frame_length,door_frame_width+(tolerance*2),door_frame_height);
        personnel_access_doors(access_door_pos_l,
          access_door_pos_left_w,
          access_door_pos_h,
          body_side_left);
        personnel_access_doors(access_door_pos_l,
          access_door_pos_right_w-tolerance,
          access_door_pos_h,
          body_side_right);
      }

// Near Side access flaps accessories
      access_flap(access_flap_l_1_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
      access_flap(access_flap_l_2_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
      access_flap(access_flap_l_3_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
      access_flap(access_flap_l_4_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
      access_flap(access_flap_l_5_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
      access_flap(access_flap_l_6_pos,access_flap_w_pos-access_flap_w,access_flap_h_pos,body_side_left);
// Far Side access flaps accessories
      access_flap(access_flap_l_1_pos,lower_body_width_outside+tolerance,access_flap_h_pos,body_side_right);
      access_flap(access_flap_l_2_pos,lower_body_width_outside+tolerance,access_flap_h_pos,body_side_right);
      access_flap(access_flap_l_3_pos,lower_body_width_outside+tolerance,access_flap_h_pos,body_side_right);
      access_flap(access_flap_l_4_pos,lower_body_width_outside+tolerance,access_flap_h_pos,body_side_right);
      access_flap(access_flap_l_5_pos,lower_body_width_outside+tolerance,access_flap_h_pos,body_side_right);
      access_flap(access_flap_l_6_pos,lower_body_width_outside+tolerance,access_flap_h_pos,body_side_right);

      buffers();
      couplings(); // Only hook needed. SA3 couplers were not used.

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

      motor_block_lug_position(((lower_body_length_outside-motor_casing_l)/2)-motor_casing_loc_lug_l,
        body_thickness,0);
      motor_block_lug_position(((lower_body_length_outside-motor_casing_l)/2)-motor_casing_loc_lug_l,
        body_thickness,lower_to_waist_body_height-motor_casing_loc_lug_l-motor_casing_loc_lug_h);
      motor_block_lug_position(((lower_body_length_outside-motor_casing_l)/2)-motor_casing_loc_lug_l,
        lower_body_width_outside-(body_thickness+motor_casing_loc_lug_w),0);
      motor_block_lug_position(((lower_body_length_outside-motor_casing_l)/2)-motor_casing_loc_lug_l,
        lower_body_width_outside-(body_thickness+motor_casing_loc_lug_w),
        lower_to_waist_body_height-motor_casing_loc_lug_l-motor_casing_loc_lug_h);

      motor_block_lug_position(((lower_body_length_outside+motor_casing_l)/2),
        body_thickness,0);
      motor_block_lug_position(((lower_body_length_outside+motor_casing_l)/2),
        body_thickness,lower_to_waist_body_height-motor_casing_loc_lug_l-motor_casing_loc_lug_h);
      motor_block_lug_position(((lower_body_length_outside+motor_casing_l)/2),
        lower_body_width_outside-(body_thickness+motor_casing_loc_lug_w),0);
      motor_block_lug_position(((lower_body_length_outside+motor_casing_l)/2),
        lower_body_width_outside-(body_thickness+motor_casing_loc_lug_w),
        lower_to_waist_body_height-motor_casing_loc_lug_l-motor_casing_loc_lug_h);

    }  // End of Union
  }
}

//-----------------------------------------------------------------------------
// Upper Body Module - top removed
//-----------------------------------------------------------------------------
module upper_body (l,w,h) {
  translate([l,w,h+lower_to_waist_body_height]){
    union(){
      difference() {
// Basic top body outside shell      
        polyhedron(
          points=[
            [0,0,0],
            [waist_body_length_outside,0,0],
            [waist_body_length_outside,waist_body_width_outside,0],
            [0,waist_body_width_outside,0],

            [offset_top_body_length_outside,
              offset_top_body_width_outside,
              waist_to_top_body_height], 
            [top_body_length_outside+(offset_top_body_length_outside),
              offset_top_body_width_outside,
              waist_to_top_body_height], 
            [top_body_length_outside+(offset_top_body_length_outside),
              top_body_width_outside+(offset_top_body_width_outside),
              waist_to_top_body_height], 
            [offset_top_body_length_outside,
              top_body_width_outside+(offset_top_body_width_outside),
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

// Create internal space
        translate([body_thickness,body_thickness,-tolerance]) {
          polyhedron(
            points=[
            [0,0,0],
            [waist_body_length_inside,0,0],
            [waist_body_length_inside,waist_body_width_inside,0],
            [0,waist_body_width_inside,0],

            [offset_top_body_length_outside+body_thickness,
              offset_top_body_width_outside+body_thickness,
              waist_to_top_body_height], 
            [top_body_length_inside+(offset_top_body_length_outside-body_thickness),
              offset_top_body_width_outside+body_thickness,
              waist_to_top_body_height], 
            [top_body_length_inside+(offset_top_body_length_outside-body_thickness),
              top_body_width_inside+(offset_top_body_width_outside-body_thickness),
              waist_to_top_body_height], 
            [offset_top_body_length_outside+body_thickness,
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
        upper_body_armour(l,w,h+(armour_gap/2), body_side_left);

        upper_body_armour(l,waist_body_width_outside-(armour_gap/2),h+(armour_gap/2),body_side_right);

        translate([(turret_block_pos_l+(turret_spigot_dia/2))+(offset_top_body_length_outside/2),
          (waist_body_width_outside/2),
          waist_to_top_body_height-(body_thickness*2)])
          cylinder(d=turret_spigot_dia+tolerance,h=(turret_block_height+tolerance)*4);


      } // End of difference
      
// Rivet detail - left side
      left_side_top_body_rivets(0,0,0);
// Rivet detail - right side
      right_side_top_body_rivets(0,waist_body_width_outside,0);

// Internal bogie mounting blocks
      translate([near_motor_bogie_mounting_block_pos_l,
                motor_bogie_mounting_block_pos_w,
                (motor_bogie_h+motor_bogie_axle_h+motor_bogie_pivot_washer_thickness)
                -(lower_to_waist_body_height)])
        difference() {
          cube([motor_bogie_mounting_block_l,
            motor_bogie_mounting_block_w,
            motor_bogie_mounting_block_h-motor_bogie_pivot_washer_thickness]);
          screwHole((motor_bogie_mounting_block_l/2),
            motor_bogie_mounting_block_w/2,
            0,
            "M1.6",
            motor_bogie_mounting_block_h);
        }
        
      translate([far_motor_bogie_mounting_block_pos_l,
                motor_bogie_mounting_block_pos_w,
                (motor_bogie_h+motor_bogie_axle_h+motor_bogie_pivot_washer_thickness)
                -(lower_to_waist_body_height)])
        difference() {
          cube([motor_bogie_mounting_block_l,
            motor_bogie_mounting_block_w,
            motor_bogie_mounting_block_h-motor_bogie_pivot_washer_thickness]);
          screwHole((motor_bogie_mounting_block_l/2),
            motor_bogie_mounting_block_w/2,
            0,
            "M1.6",
            motor_bogie_mounting_block_h);
        }

    } // End of union
  }
}

//-----------------------------------------------------------------------------
// Body Top 
//-----------------------------------------------------------------------------

module body_top (l,w,h) {

  translate([l+(offset_top_body_length_outside),
    w+(offset_top_body_width_outside),
    h+lower_to_waist_body_height+waist_to_top_body_height]) {
    union() {
      difference() {
        polyhedron(
          points=[
            [0,
             0,
             0],        // Pos 0
            [top_body_length_outside,
              0,
              0],       // Pos 1
            [top_body_length_outside,
              top_body_width_outside,
              0],        // Pos 2
            [0,
              top_body_width_outside,
              0],        // Pos 3
            [(offset_crest/2),
              top_body_width_outside/2,
              top_to_crest_height],// Pos 4
            [(offset_crest/2)+crest_length,
              top_body_width_outside/2,
              top_to_crest_height]// Pos 5
          ],

          faces=[
            [0,1,2,3],  // bottom
            [5,4,3,2],  // right side
            [0,4,5,1],  // left side
            [0,3,4],    // far side
            [5,2,1]     // near side
          ]);
        translate([(turret_block_pos_l-(offset_top_body_length_outside/2))+(turret_spigot_dia/2),
          (top_body_width_outside/2),
          -(turret_block_height*2)])
          cylinder(d=turret_spigot_dia+tolerance,h=(turret_block_height+tolerance)*4);

        top_body_armour(0,0,h+(armour_gap/2),body_side_left);
        top_body_armour(0,top_body_width_outside/2,h+(armour_gap/2),body_side_right);

        crestline_armour_gap((l-offset_top_body_length_outside)+crest_pos_near,
          ((turret_block_pos_l-offset_top_body_length_outside)-turret_block_fr_pos_l),
          (top_body_width_outside/2)-(armour_gap/2),
          (top_to_crest_height)-(armour_gap/2));

        crestline_armour_gap((l-offset_top_body_length_outside)+plate_len_4,
          ((turret_block_pos_l-offset_top_body_length_outside)-turret_block_fr_pos_l),
          (top_body_width_outside/2)-(armour_gap/2),
          (top_to_crest_height)-(armour_gap/2));

      }
      turret_mount(turret_block_pos_l-offset_top_body_length_outside,0,0);
      
      top_body_armour_hinges(top_plate_len_1+(armour_gap/2),
        (((top_body_width_outside/2)/6)-(large_hinge_w/2)),
        body_side_left,angle_end_top_to_crest);
      top_body_armour_hinges(top_plate_len_1+(armour_gap/2),
        ((((top_body_width_outside/2)/4)*3)-(large_hinge_w/2)),
        body_side_left,angle_end_top_to_crest);
      top_body_armour_hinges(top_plate_len_3+(armour_gap/2),
        (((top_body_width_outside/2)/6)-(large_hinge_w/2)),
        body_side_left,angle_end_top_to_crest);
      top_body_armour_hinges(top_plate_len_3+(armour_gap/2),
        ((((top_body_width_outside/2)/4)*3)-(large_hinge_w/2)),
        body_side_left,angle_end_top_to_crest);
      top_body_armour_hinges(top_plate_len_1+(armour_gap/2),
        top_body_width_outside-(((top_body_width_outside/2)/6)-(large_hinge_w/2)),
        body_side_right,angle_end_top_to_crest);
      top_body_armour_hinges(top_plate_len_1+(armour_gap/2),
        top_body_width_outside-((((top_body_width_outside/2)/4)*3)-(large_hinge_w/2)),
        body_side_right,angle_end_top_to_crest);
      top_body_armour_hinges(top_plate_len_3+(armour_gap/2),
        top_body_width_outside-(((top_body_width_outside/2)/6)-(large_hinge_w/2)),
        body_side_right,angle_end_top_to_crest);
      top_body_armour_hinges(top_plate_len_3+(armour_gap/2),
        top_body_width_outside-((((top_body_width_outside/2)/4)*3)-(large_hinge_w/2)),
        body_side_right,angle_end_top_to_crest);
    }
  }
}



