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
// Basic custom motorised chassis for Krasnaya Zvezda Armoured Railcar.
// 
// Set Parameters for design - Do this before printing anything!
// DON'T FORGET TO SAVE FILES BEFORE Previewing and Rendering!
//-----------------------------------------------------------------------------

include <Krasnaya_Zvezda_params.scad>
use <Krasnaya_Zvezda_modules.scad>

$fn=50;

//-----------------------------------------------------------------------------
// Start of Chassis Code
//-----------------------------------------------------------------------------
translate([0,0,0]) { // Position module on plate
//  chassis_base_plate(0,0,0);
  chassis_motor_module(0,0,0);
//  chassis_motor_module((lower_body_length_outside)/2,6000 * scale,0);
//  motor_bogie((lower_body_length_outside-chassis_bogie_centres)/2,0,0);
//  motor_bogie(((lower_body_length_outside-chassis_bogie_centres)/2)+chassis_bogie_centres,0,0);
}

//-----------------------------------------------------------------------------
// Main Chassis Module
//-----------------------------------------------------------------------------
module chassis_base_plate(l,w,h) {
  translate([l,w,h]) {
  
  }
}

//-----------------------------------------------------------------------------
// Motor Holding Cradle Module
//-----------------------------------------------------------------------------

module chassis_motor_module(l,w,h) {
  translate([l,w,h]) {
    difference() {
      translate([-(motor_casing_l/2),-(motor_casing_w/2),h]) {
        difference() {
          union() {
            cube([motor_casing_l,motor_casing_w,lower_to_waist_body_height-(tolerance*2)]);
            translate([0,0,(h+lower_to_waist_body_height-(tolerance*2))])
              polyhedron(
                points=[
                [  0,  0,  0 ],  //0
                [ motor_casing_l,  0,  0 ],  //1
                [ motor_casing_l,  motor_casing_w,  0 ],  //2
                [  0,  motor_casing_w,  0 ],  //3
                [  0,((top_body_width_inside - (tolerance*2))/2),
                    waist_to_top_body_height-(tolerance*2) ],  //4
                [ motor_casing_l,((top_body_width_inside - (tolerance*2))/2),
                    waist_to_top_body_height-(tolerance*2) ],  //5
                [ motor_casing_l,
                  motor_casing_w-((top_body_width_inside - (tolerance*2))/2),
                  waist_to_top_body_height-(tolerance*2) ],  //6
                [  0,
                  motor_casing_w-((top_body_width_inside - (tolerance*2))/2),
                  waist_to_top_body_height-(tolerance*2) ]], //7
  
                faces = [
                [0,1,2,3],  // bottom
                [4,5,1,0],  // front
                [7,6,5,4],  // top
                [5,6,2,1],  // right
                [6,7,3,2],  // back
                [7,4,0,3]   // left
              ]);
          }
 // cutouts for body location lugs
        translate([-tolerance,-tolerance,-tolerance])
          cube([motor_casing_l+(tolerance*2),
            motor_casing_loc_lug_w+(tolerance*2),motor_casing_loc_lug_l+(tolerance*2)]);

        translate([-tolerance,motor_casing_w-(motor_casing_loc_lug_w+tolerance),0])
          cube([motor_casing_l+(tolerance*2),motor_casing_loc_lug_w+(tolerance*2),
            motor_casing_loc_lug_l+(tolerance*2)]);

// Drill bore for motor
        translate([-tolerance,motor_casing_w/2,h+((motor_casing_h+tolerance)/2)])
          rotate([0,90,0])cylinder(d = motor_dia+(tolerance*8), h = motor_casing_inside_l);

        translate([motor_casing_l-motor_casing_lip_l-tolerance,
          motor_casing_w/2,h+((motor_casing_h+tolerance)/2)])
          rotate([0,90,0])cylinder(d = motor_casing_lip_dia, h = motor_casing_inside_l);

// Cutouts to allow motor to 'breathe'
        translate([motor_casing_cutout_pos_l,-(tolerance),h+motor_casing_cutout_pos_h/1.5])
          cube([motor_casing_cutout_l,motor_casing_cutout_w+(tolerance*2),motor_casing_h/2]);

        translate([motor_casing_cutout_pos_l,motor_casing_cutout_pos_w,h-tolerance])
          cube([motor_casing_cutout_l,motor_casing_w/2,motor_casing_cutout_h+(tolerance*2)]);

// Cut slots for decoder and wiring
        translate([decoder_cutout_pos_l,decoder_cutout_pos_w,h-tolerance])
          cube([decoder_cutout_l,decoder_width,decoder_cutout_h+(tolerance*2)]);
        translate([-tolerance,decoder_cutout_pos_w,body_thickness])
          cube([wiring_cutout_l,wiring_cutout_w,wiring_cutout_h]);



        }
      }
/*
      #union() {
        translate([-(motor_l/2),0,h+((motor_casing_h+tolerance)/2)])
          rotate([0,90,0])cylinder(d = motor_dia, h = motor_l);
        translate([-((motor_l/2)+motor_shaft_near+tolerance),0,h+((motor_casing_h+tolerance)/2)])
          rotate([0,90,0])cylinder(d = motor_shaft_dia, h = motor_shaft_near);
        if(dual_shaft == true) {
          translate([(motor_l/2)-tolerance,0,h+((motor_casing_h+tolerance)/2)])
            rotate([0,90,0])cylinder(d = motor_shaft_dia, h = motor_shaft_far);

        }
      }
*/
    }
  }
}

//-----------------------------------------------------------------------------
// Inside Frame motorised bogie
// Wheelsets use phosphor-bronze electrical pickups for centering
// Prototype wheelsets should be 1030mm diameter (as used in a Su series locomotive tender)
// scaled to desired scale. In theory, the wheelsets should be coupled.
//-----------------------------------------------------------------------------

module motor_bogie(l,w,h) {
  motor_bogie_upper_block(l,w,h);
  motor_bogie_lower_block(l,w+(motor_bogie_origin_w*2),h);  
}

module motor_bogie_upper_block(l,w,h) {

  translate([l,w,h-motor_bogie_axle_h]) {
    union() {
      difference() {
// Basic Bogie Block starts below z=0 axis
        cube([motor_bogie_l,motor_bogie_w,motor_bogie_h]);

// Cut top corners to give better clearance from body
        translate([-(motor_bogie_h/4), -tolerance, (motor_bogie_h/3)])
          rotate([0,-angle_end_waist_to_top,0])
            cube([(motor_bogie_h),motor_bogie_w+(tolerance*2), (motor_bogie_h)]);
        translate([motor_bogie_l+(motor_bogie_h/4), -tolerance, (motor_bogie_h/3)])
          rotate([0,-angle_end_waist_to_top,0])
            cube([(motor_bogie_h),motor_bogie_w+(tolerance*2), (motor_bogie_h)]);

// Slice off portion for the keeper plate
        translate([-tolerance,-tolerance,-tolerance])
          cube([motor_bogie_l+(tolerance*2),
            motor_bogie_w+(tolerance*2),
            motor_bogie_axle_h+tolerance]);

// Hollow out upper half of motor bogie axles
        translate([motor_bogie_near_axle+(motor_bogie_axle_dia/2),
          -tolerance,
          motor_bogie_axle_h])
          rotate([270,0,0]) cylinder(d=motor_bogie_axle_dia,h=motor_bogie_w+(tolerance*2));
        translate([motor_bogie_far_axle+(motor_bogie_axle_dia/2),
          -tolerance,
          motor_bogie_axle_h])
          rotate([270,0,0]) cylinder(d=motor_bogie_axle_dia,h=motor_bogie_w+(tolerance*2));

// Cut out slots for the gear train
        translate([motor_bogie_gear_slot_pos1_l,
          motor_bogie_gear_slot_pos_w,
          motor_bogie_gear_slot_pos_h])
          cube([motor_bogie_gear_slot_l,motor_bogie_gear_slot_w,motor_bogie_gear_slot_h]);
        translate([motor_bogie_gear_slot_pos2_l,
          motor_bogie_gear_slot_pos_w,
          motor_bogie_gear_slot_pos_h])
          cube([motor_bogie_gear_slot_l,motor_bogie_gear_slot_w,motor_bogie_gear_slot_h]);
        translate([motor_bogie_gear_slot_pos1_l,
          motor_bogie_gear_slot_pos_w,
          motor_bogie_cutout_pos_h])
          cube([motor_bogie_gear_slot_comb_l,motor_bogie_gear_slot_w,motor_bogie_gear_slot_h]);

// Cut out slots for bogie locater slots which have significant tolerance to allow for print overprint
        translate([motor_bogie_locater_pos1_l,
          motor_bogie_locater_pos_w-(tolerance*3),
          motor_bogie_locater_pos_h+motor_bogie_axle_h])
          cube([motor_bogie_locater_l,
            motor_bogie_locater_w+(tolerance*6),
            motor_bogie_locater_h+(tolerance*6)]);
        translate([motor_bogie_locater_pos2_l,
          motor_bogie_locater_pos_w-(tolerance*3),
          motor_bogie_locater_pos_h+motor_bogie_axle_h])
          cube([motor_bogie_locater_l,
            motor_bogie_locater_w+(tolerance*6),
            motor_bogie_locater_h+(tolerance*6)]);

// Add holes for idler gear location pins.
          translate([motor_bogie_near_axle+(motor_bogie_gear_pin_dia/2),
            -tolerance,
            d12+motor_bogie_axle_h])
            rotate([270,0,0]) cylinder(d=motor_bogie_gear_pin_dia,h=motor_bogie_w+(tolerance*2));
          translate([motor_bogie_far_axle+(motor_bogie_gear_pin_dia/2),
            -tolerance,
            d12+motor_bogie_axle_h])
            rotate([270,0,0]) cylinder(d=motor_bogie_gear_pin_dia,h=motor_bogie_w+(tolerance*2));

// Cut out portion of bogie block for securing nut for keeper plate, avoiding gear shaft
        translate([motor_bogie_cutout_pos_l,
          motor_bogie_cutout_pos_w,
          motor_bogie_cutout_pos_h])
          cube([motor_bogie_cutout_l,motor_bogie_cutout_w,motor_bogie_cutout_h]);

// Cut out bolt hole
        translate([motor_bogie_pivot_pos_l,
          motor_bogie_pivot_pos_w,
          motor_bogie_pivot_pos_h])
          cylinder(d=motor_bogie_pivot_dia,motor_bogie_pivot_h);

// Cut out nut shape hole
        rotate([0,0,180]) nutHole(-motor_bogie_pivot_pos_l,
          -motor_bogie_pivot_pos_w,
          motor_bogie_cutout_pos_h,
          "M1.6");

// Cut worm gear clearance
        translate([-tolerance,
          motor_bogie_w/2,
          worm_pos_h])
          rotate([0,90,0]) cylinder(d=5.5,motor_bogie_l+(tolerance*2));

      } // End of difference()

// Add blocks to attach wheel wiper pickups
      translate([motor_bogie_pickup_blk_pos_l,motor_bogie_pickup_blk_pos1_w,motor_bogie_pickup_blk_pos_h]) {
        difference() {
          cube([motor_bogie_pickup_blk_l,motor_bogie_pickup_blk_w,motor_bogie_pickup_blk_h]);
          screwHole((motor_bogie_pickup_blk_l/4),
            motor_bogie_pickup_blk_w/2,
            motor_bogie_pickup_blk_h/3-tolerance,
            "M1",
            motor_bogie_pickup_blk_h/2);
          screwHole((motor_bogie_pickup_blk_l/4)*3,
            motor_bogie_pickup_blk_w/2,
            motor_bogie_pickup_blk_h/3-tolerance,
            "M1",
            motor_bogie_pickup_blk_h/2);
           translate([-tolerance,
            0,
            (motor_bogie_pickup_blk_h-motor_bogie_pickup_blk_w)])
            rotate([45,0,0]) cube([motor_bogie_pickup_blk_l+(tolerance*2),
              motor_bogie_pickup_blk_h,motor_bogie_pickup_blk_w]);
        }
      }

      translate([motor_bogie_pickup_blk_pos_l,motor_bogie_pickup_blk_pos2_w,motor_bogie_pickup_blk_pos_h]) {
        difference() {
        cube([motor_bogie_pickup_blk_l,motor_bogie_pickup_blk_w,motor_bogie_pickup_blk_h]);
          screwHole((motor_bogie_pickup_blk_l/4),
            motor_bogie_pickup_blk_w/2,
            motor_bogie_pickup_blk_h/3-tolerance,
            "M1",
            motor_bogie_pickup_blk_h/2);
          screwHole((motor_bogie_pickup_blk_l/4)*3,
            motor_bogie_pickup_blk_w/2,
            motor_bogie_pickup_blk_h/3-tolerance,
            "M1",
            motor_bogie_pickup_blk_h/2);
          translate([-tolerance,0,motor_bogie_pickup_blk_h])
            rotate([-45,0,0]) cube([motor_bogie_pickup_blk_l+(tolerance*2),
              motor_bogie_pickup_blk_h,motor_bogie_pickup_blk_w]);
        }
      }
/*      
// For illustration only  - Add represetative gears
      # rotate([90,0,0]) {
        translate([ motor_bogie_near_axle+(motor_bogie_axle_dia/2), motor_bogie_axle_h, -motor_bogie_w/2])
          rotate([0,0, $t*360/n1]) color([1.00,0.75,0.75])
          gear(mm_per_tooth,n1,thickness,hole);
        
        translate([ motor_bogie_near_axle+(motor_bogie_axle_dia/2),motor_bogie_axle_h+d12, -motor_bogie_w/2]) 
          rotate([0,0,-($t+n2/2-0*n1+1/2)*360/n2]) color([0.75,1.00,0.75])
          gear(mm_per_tooth,n2,thickness,hole);
    }
      # rotate([90,0,0]) {
        translate([ motor_bogie_far_axle+(motor_bogie_axle_dia/2), motor_bogie_axle_h, -motor_bogie_w/2])
          rotate([0,0, $t*360/n1]) color([1.00,0.75,0.75])
          gear(mm_per_tooth,n1,thickness,hole);
        
        translate([ motor_bogie_far_axle+(motor_bogie_axle_dia/2),motor_bogie_axle_h+d12, -motor_bogie_w/2]) 
          rotate([0,0,-($t+n2/2-0*n1+1/2)*360/n2]) color([0.75,1.00,0.75])
          gear(mm_per_tooth,n2,thickness,hole);
      }

       # wormGear(worm_pos1_l,worm_pos_w,worm_pos_h,
        worm_module_size,worm_length,worm_shaft_dia);
       # wormGear(worm_pos2_l,worm_pos_w,worm_pos_h,
        worm_module_size,worm_length,worm_shaft_dia);
*/        
    }
  }
}

// Wheelset keeper plate
module motor_bogie_lower_block(l,w,h) {
  translate([l,w,h]) {
    union() {
      difference() {
        cube([motor_bogie_l,motor_bogie_w,motor_bogie_h]);
        translate([-tolerance,-tolerance,motor_bogie_axle_h])
          cube([motor_bogie_l+(tolerance*2),
            motor_bogie_w+(tolerance*2),
            motor_bogie_h]);
        translate([motor_bogie_near_axle+(motor_bogie_axle_dia/2),
          -tolerance,
          motor_bogie_axle_h])
          rotate([270,0,0]) cylinder(d=motor_bogie_axle_dia,h=motor_bogie_w+(tolerance*2));
        translate([motor_bogie_far_axle+(motor_bogie_axle_dia/2),
          -tolerance,
          motor_bogie_axle_h])
          rotate([270,0,0]) cylinder(d=motor_bogie_axle_dia,h=motor_bogie_w+(tolerance*2));
        translate([motor_bogie_gear_slot_pos1_l,
          motor_bogie_gear_slot_pos_w,
          motor_bogie_gear_slot_pos_h])
          cube([motor_bogie_gear_slot_l,motor_bogie_gear_slot_w,motor_bogie_gear_slot_h]);
        translate([motor_bogie_gear_slot_pos2_l,
          motor_bogie_gear_slot_pos_w,
          motor_bogie_gear_slot_pos_h])
          cube([motor_bogie_gear_slot_l,motor_bogie_gear_slot_w,motor_bogie_gear_slot_h]);
        translate([motor_bogie_pivot_pos_l,
          motor_bogie_pivot_pos_w,
          motor_bogie_pivot_pos_h])
          cylinder(d=motor_bogie_pivot_dia,motor_bogie_pivot_h);

        rotate([0,0,180]) boltHole(-motor_bogie_pivot_pos_l,
          -motor_bogie_pivot_pos_w,
          motor_bogie_pivot_h,
          "M1.6",
          motor_bogie_pivot_h);

      }
      translate([motor_bogie_locater_pos1_l,
        motor_bogie_locater_pos_w,
        motor_bogie_axle_h])
        cube([motor_bogie_locater_l,
          motor_bogie_locater_w,
          motor_bogie_locater_h]);
      translate([motor_bogie_locater_pos2_l,
        motor_bogie_locater_pos_w,
        motor_bogie_axle_h])
        cube([motor_bogie_locater_l,
          motor_bogie_locater_w,
          motor_bogie_locater_h]);

    }
  }
}

