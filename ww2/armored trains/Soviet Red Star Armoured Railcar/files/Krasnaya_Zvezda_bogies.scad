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
  motor_bogie(0,0,0);
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
  motor_bogie_attachment_block(l,w-(motor_bogie_origin_w*3),h);  
}

module motor_bogie_upper_block(l,w,h) {

  translate([l,w,h-motor_bogie_axle_h]) {
    union() {
      difference() {
// Basic Bogie Block starts below z=0 axis
        cube([motor_bogie_l,motor_bogie_w,motor_bogie_h]);

// Slice off portion for the keeper plate
        translate([-tolerance,-tolerance,-tolerance])
          cube([motor_bogie_l+(tolerance*2),
            motor_bogie_w+(tolerance*2),
            motor_bogie_axle_h+tolerance]);

// Hollow out upper half of motor bogie axles
        translate([motor_bogie_near_axle+(motor_bogie_axle_dia/2),
          -tolerance,
          motor_bogie_axle_h])
          rotate([270,0,0]) cylinder(d=motor_bogie_axle_dia+(tolerance*5),h=motor_bogie_w+(tolerance*2));
        translate([motor_bogie_far_axle+(motor_bogie_axle_dia/2),
          -tolerance,
          motor_bogie_axle_h])
          rotate([270,0,0]) cylinder(d=motor_bogie_axle_dia+(tolerance*5),h=motor_bogie_w+(tolerance*2));

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
          motor_bogie_cutout_pos_h*1.35])
          cube([motor_bogie_gear_slot_comb_l,motor_bogie_gear_slot_w,motor_bogie_gear_slot_h]);

        translate([motor_bogie_gear_slot_pos2_l-(body_thickness),
          motor_bogie_gear_slot_pos_w,
          motor_bogie_cutout_pos_h*1.35])
          cube([motor_bogie_gear_slot_comb_l,motor_bogie_gear_slot_w,motor_bogie_gear_slot_h]);

// Cut out slots for bogie locater slots which have significant tolerance to allow for overprint
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

// Cut out worm gear clearance
        translate([motor_bogie_gear_slot_pos1_l,
          motor_bogie_w/2,
          drive_shaft_h])
          rotate([0,90,0]) cylinder(d=worm_clearance_d,motor_bogie_gear_slot_l);

        translate([motor_bogie_gear_slot_pos2_l,
          motor_bogie_w/2,
          drive_shaft_h])
          rotate([0,90,0]) cylinder(d=worm_clearance_d,motor_bogie_l/2);

        translate([motor_bogie_gear_slot_pos2_l,
          -tolerance,
          motor_bogie_axle_h*3])
          cube([motor_bogie_l,motor_bogie_w+(tolerance*2),motor_bogie_h]);

          
// Cut out bearing retainers
        translate([ tolerance*8,motor_bogie_w/2,drive_shaft_h])
            rotate([0,90,0]) cylinder(d=drive_shaft_bearing_od+(tolerance*5),h=drive_shaft_bearing_l);
     
        translate([ drive_shaft_bearing_l+worm_length+(drive_shaft_bearing_l),motor_bogie_w/2,drive_shaft_h])
            rotate([0,90,0]) cylinder(d=drive_shaft_bearing_od+(tolerance*5),h=drive_shaft_bearing_l);

// Cut out drive shaft clearance
        translate([motor_bogie_gear_slot_pos2_l-body_thickness-tolerance,motor_bogie_w/2,drive_shaft_h])
          rotate([0,90,0]) cylinder(d=drive_shaft_bearing_od,h=body_thickness+(tolerance*2));

//        translate([motor_bogie_l-drive_shaft_bearing_l-tolerance,motor_bogie_w/2,drive_shaft_h])
//          rotate([0,90,0]) cylinder(d=drive_shaft_bearing_od,h=drive_shaft_bearing_l+(tolerance*2));

      } // End of difference()

// Add blocks to attach wheel wiper pickups and secure motor_bogie_attachment_block
      translate([motor_bogie_pickup_blk_pos_l,motor_bogie_pickup_blk_pos1_w,motor_bogie_pickup_blk_pos_h]) {
        difference() {
          cube([motor_bogie_pickup_blk_l,motor_bogie_pickup_blk_w,motor_bogie_pickup_blk_h]);
          screwHole((motor_bogie_pickup_blk_l/4),
            motor_bogie_pickup_blk_w/2,
            0,
            "M1",
            motor_bogie_pickup_blk_h+(tolerance*2));
          screwHole((motor_bogie_pickup_blk_l/4)*3,
            motor_bogie_pickup_blk_w/2,
            0,
            "M1",
            motor_bogie_pickup_blk_h+(tolerance*2));
// Cut out wiring channel
      translate([(motor_bogie_pickup_blk_l-wiring_channel_l)/2,
        -tolerance,-tolerance])
        cube([wiring_channel_l,wiring_channel_w+tolerance,motor_bogie_pickup_blk_h+(tolerance*2)]);
        }
      }

      translate([motor_bogie_pickup_blk_pos_l,motor_bogie_pickup_blk_pos2_w,motor_bogie_pickup_blk_pos_h]) {
        difference() {
        cube([motor_bogie_pickup_blk_l,motor_bogie_pickup_blk_w,motor_bogie_pickup_blk_h]);
          screwHole((motor_bogie_pickup_blk_l/4),
            motor_bogie_pickup_blk_w/2,
            0,
            "M1",
            motor_bogie_pickup_blk_h+(tolerance*2));
          screwHole((motor_bogie_pickup_blk_l/4)*3,
            motor_bogie_pickup_blk_w/2,
            0,
            "M1",
            motor_bogie_pickup_blk_h+(tolerance*2));
// Cut out wiring channel
      translate([(motor_bogie_pickup_blk_l-wiring_channel_l)/2,
        motor_bogie_pickup_blk_w-wiring_channel_w,-tolerance])
        cube([wiring_channel_l,wiring_channel_w+tolerance,motor_bogie_pickup_blk_h+(tolerance*2)]);
        }
      }
        
// Add bearing retainers
      translate([0,motor_bogie_w/2,drive_shaft_h]) {
        difference() {
          rotate([0,90,0]) cylinder(d=bearing_retainer_od,h=drive_shaft_bearing_l);
          translate([ -tolerance,0,0])
            rotate([0,90,0]) cylinder(d=drive_shaft_bearing_od,h=drive_shaft_bearing_l+(tolerance*2));
        }
      }

 //     translate([motor_bogie_l-drive_shaft_bearing_l,motor_bogie_w/2,drive_shaft_h]) {
 //       difference() {
 //         rotate([0,90,0]) cylinder(d=bearing_retainer_od,h=drive_shaft_bearing_l);
 //         translate([ -tolerance,0,0])
 //           rotate([0,90,0]) cylinder(d=drive_shaft_bearing_od,h=drive_shaft_bearing_l+(tolerance*2));
 //       }
 //     }
/*
// For illustration only  - Drive Shaft Bearings type 681ZZ
#      translate([ tolerance*10,motor_bogie_w/2,drive_shaft_h])
        difference() {
          rotate([0,90,0]) cylinder(d=drive_shaft_bearing_od,h=drive_shaft_bearing_l);
          translate([ -tolerance,0,0])
            rotate([0,90,0]) cylinder(d=drive_shaft_bearing_id,h=drive_shaft_bearing_l+(tolerance*2));
        }
     
#      translate([ drive_shaft_bearing_l+worm_length+tolerance*20,motor_bogie_w/2,drive_shaft_h])
        difference() {
          rotate([0,90,0]) cylinder(d=drive_shaft_bearing_od,h=drive_shaft_bearing_l);
          translate([ -tolerance,0,0])
            rotate([0,90,0]) cylinder(d=drive_shaft_bearing_id,h=drive_shaft_bearing_l+(tolerance*2));
        }
// For illustration only  - Add represetative gears
      # rotate([90,0,0])
        translate([ motor_bogie_near_axle+(motor_bogie_axle_dia/2), motor_bogie_axle_h, -motor_bogie_w/2])
          rotate([0,0, $t*360/n1]) color([1.00,0.75,0.75])
          gear(mm_per_tooth,n1,thickness,hole);
        
        translate([0,0,0])
          # wormGear(worm_pos1_l,worm_pos_w,worm_pos_h,
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
// Cut off top part of bogie
        translate([-tolerance,-tolerance,motor_bogie_axle_h])
          cube([motor_bogie_l+(tolerance*2),
            motor_bogie_w+(tolerance*2),
            motor_bogie_h]);

// Hollow out lower half of motor bogie axles
        translate([motor_bogie_near_axle+(motor_bogie_axle_dia/2),
          -tolerance,
          motor_bogie_axle_h])
          rotate([270,0,0]) cylinder(d=motor_bogie_axle_dia+(tolerance*5),h=motor_bogie_w+(tolerance*2));
        translate([motor_bogie_far_axle+(motor_bogie_axle_dia/2),
          -tolerance,
          motor_bogie_axle_h])
          rotate([270,0,0]) cylinder(d=motor_bogie_axle_dia+(tolerance*5),h=motor_bogie_w+(tolerance*2));

// Cut out slots for gears
        translate([motor_bogie_gear_slot_pos1_l,
          motor_bogie_gear_slot_pos_w,
          motor_bogie_gear_slot_pos_h])
          cube([motor_bogie_gear_slot_l,motor_bogie_gear_slot_w,motor_bogie_gear_slot_h]);
        translate([motor_bogie_gear_slot_pos2_l,
          motor_bogie_gear_slot_pos_w,
          motor_bogie_gear_slot_pos_h])
          cube([motor_bogie_gear_slot_l,motor_bogie_gear_slot_w,motor_bogie_gear_slot_h]);

// Cut out bolt hole
        translate([motor_bogie_pivot_pos_l,
          motor_bogie_pivot_pos_w,
          motor_bogie_pivot_pos_h])
          cylinder(d=motor_bogie_pivot_dia,motor_bogie_pivot_h);
        rotate([0,0,180]) boltHole(-motor_bogie_pivot_pos_l,
          -motor_bogie_pivot_pos_w,
          motor_bogie_pivot_h,
          "M1.6",
          motor_bogie_pivot_h);

      } // end of difference()
 
 // Add spigots to ensure alignment of motor_bogie_lower_block
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

// Attachment block for bogie to body pivot
module motor_bogie_attachment_block(l,w,h) {
  translate([l+((motor_bogie_l-motor_bogie_pickup_blk_l)/2),w-motor_bogie_pickup_blk_w,h]) {
    union() {
      difference() {
        cube([motor_bogie_pickup_blk_l,motor_bogie_w+(motor_bogie_pickup_blk_w*2),motor_bogie_h]);
// Cut off 'upper' bogie half        
        translate([-tolerance,-tolerance,motor_bogie_axle_h])
          cube([motor_bogie_l+(tolerance*2),
            motor_bogie_w+(motor_bogie_pickup_blk_w*2)+(tolerance*2),
            motor_bogie_h]);

// Cut out bolt hole
        translate([motor_bogie_pickup_blk_l/2,
          motor_bogie_pivot_pos_w+motor_bogie_pickup_blk_w,
          motor_bogie_pivot_pos_h])
          cylinder(d=motor_bogie_pivot_dia,motor_bogie_pivot_h);

        rotate([0,0,180]) boltHole(-(motor_bogie_pickup_blk_l/2),
          -(motor_bogie_pivot_pos_w+motor_bogie_pickup_blk_w),
          motor_bogie_pivot_h,
          "M1.6",
          motor_bogie_pivot_h);

// Add screw holes in alignment with wiper pickups to attach to 'upper bogie block
        translate([0,0,-tolerance]) {
          screwHole((motor_bogie_pickup_blk_l/4),
            motor_bogie_pickup_blk_w/2,
            0,
            "M1",
            motor_bogie_pickup_blk_h+(tolerance*2));
          screwHole((motor_bogie_pickup_blk_l/4)*3,
            motor_bogie_pickup_blk_w/2,
            0,
            "M1",
            motor_bogie_pickup_blk_h+(tolerance*2));
        }

      translate([0,motor_bogie_pickup_blk_pos2_w+motor_bogie_pickup_blk_w,-tolerance]) {
          screwHole((motor_bogie_pickup_blk_l/4),
            motor_bogie_pickup_blk_w/2,
            0,
            "M1",
            motor_bogie_pickup_blk_h+(tolerance*2));
          screwHole((motor_bogie_pickup_blk_l/4)*3,
            motor_bogie_pickup_blk_w/2,
            0,
            "M1",
            motor_bogie_pickup_blk_h+(tolerance*2));
        }
// Cut out wiring channels
      translate([(motor_bogie_pickup_blk_l-wiring_channel_l)/2,
        -tolerance,-tolerance])
        cube([wiring_channel_l,wiring_channel_w+tolerance,motor_bogie_axle_h+(tolerance*2)]);
        
      translate([(motor_bogie_pickup_blk_l-wiring_channel_l)/2,
        (motor_bogie_w+(motor_bogie_pickup_blk_w*2))-wiring_channel_w,-tolerance])
        cube([wiring_channel_l,wiring_channel_w+tolerance,motor_bogie_axle_h+(tolerance*2)]);

// Cut out bearing retainers
        translate([-(tolerance*22),motor_bogie_pivot_pos_w+motor_bogie_pickup_blk_w,l])
            rotate([0,90,0]) cylinder(d=drive_shaft_bearing_od+(tolerance*5),h=drive_shaft_bearing_l);

        translate([motor_bogie_pickup_blk_l-(tolerance*8),
          motor_bogie_pivot_pos_w+motor_bogie_pickup_blk_w,l])
          rotate([0,90,0]) cylinder(d=drive_shaft_bearing_od,h=drive_shaft_bearing_l);

// Cut out drive shaft clearance
        translate([-(tolerance),motor_bogie_pivot_pos_w+motor_bogie_pickup_blk_w,l])
            rotate([0,90,0]) cylinder(d=drive_shaft_bearing_id+(body_thickness/2),
              h=motor_bogie_l+(tolerance*2));
      }
    }
  }
}

