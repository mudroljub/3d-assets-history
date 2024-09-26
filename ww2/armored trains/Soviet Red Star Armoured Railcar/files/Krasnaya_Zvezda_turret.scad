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
// Krasnaya_Zvezda_turret - a remix of a KV-1 turret from
//-----------------------------------------------------------------------------
rotate([0,0,90]) KV_1_turret(0,0,-tolerance);

module KV_1_turret(l,w,h) {
  $fn = 50;
  translate([l,w,h]) {

    difference() {
// Fiddle factor to align imported KV-1 turret to build plate
      translate([turret_import_align_l,turret_import_align_w,turret_import_align_h]) {
        scale([scale_conversion(KV_1_import_scale,output_scale,1),
        scale_conversion(KV_1_import_scale,output_scale,1),
        scale_conversion(KV_1_import_scale,output_scale,1)])
        import("kv-1-1941-turretb.stl", convexity=3);
      }
    }
  }
}
