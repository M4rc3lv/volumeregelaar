$fn=200;

Top=1;
Bottom=1;
Ring=1;
Knop=1;
RingRotaryEncoder=1;

if(RingRotaryEncoder) {
 difference() {
  cylinder(d=14,h=2.2);
  translate([0,0,-1]) cylinder(d=7.6,h=10);
 }
}

if(Ring) {
 difference() {
  cylinder(d=48,h=20);
  translate([0,0,-1])cylinder(d=30,h=25,$fn=20);
 }
}

if(Knop) translate([0,0,20]){
 difference() {
  cylinder(d=30,h=20,$fn=20);
  translate([0,0,-1])cylinder(d=6,h=9.8+1);
 }
}

if(Bottom) translate([-2,-2,-40]) {
 difference() {
  hull() {
   cylinder(d=8,h=35);
   translate([104,0,0])cylinder(d=8,h=35);
   translate([104,64,0])cylinder(d=8,h=35);  
   translate([0,64,0])cylinder(d=8,h=35);
  }
  translate([2,2,2]) hull() {
   cylinder(d=8,h=35);
   translate([100,0,0])cylinder(d=8,h=35);
   translate([100,60,0])cylinder(d=8,h=35);  
   translate([0,60,0])cylinder(d=8,h=35);
  }
  // Kabel
  translate([80,59,3]) cube([11.2,10,7.4]);
 }
 
 // Cil's voor bevestiging frontplaat
 translate([1.4,1.4,0])difference(){cylinder(d=10,h=30);translate([0,0,30-4])cylinder(d=3.2,h=5);}
 translate([-1.4,1.4,0])difference(){translate([104,0,0])cylinder(d=10,h=30);translate([104,0,30-4])cylinder(d=3.2,h=5);}
 translate([-1.4,-1.4,0])difference(){translate([104,64,0])cylinder(d=10,h=30);translate([104,64,30-4])cylinder(d=3.2,h=5);}  
 translate([1.4,-1.4,0])difference(){translate([0,64,0])cylinder(d=10,h=30);translate([0,64,30-4])cylinder(d=3.2,h=5);}
}

if(Top) {
 difference() {
  hull() {
   cylinder(d=8,h=5);
   translate([100,0,0])cylinder(d=8,h=5);
   translate([100,60,0])cylinder(d=8,h=5);  
   translate([0,60,0])cylinder(d=8,h=5);
  }
  // Ring
  translate([30,30,1]) cylinder(d=45,h=10);
  // Gaten voor ringdraden
  translate([30+21,30,-1]) cylinder(d=3,h=10);
  translate([30-21,30,-1]) cylinder(d=3,h=10);
  translate([30,30+21,-1]) cylinder(d=3,h=10);
  // Rotary encoder
  translate([30,30,-1]) cylinder(d=7,h=10);
  
  translate([0,-2,0]) {
   // Pauze-knop
   translate([78,26,-1]) cylinder(d=30,h=10); 
   translate([78,26,-1]) cylinder(d=36,h=4.2); 
   // Aan-uit-schakelaar
   translate([78-14.2/2,46,-1]) cube([14.2,9.2,10]);   
  }
  
  translate([0,0,-1])cylinder(d=2.6,h=30);
  translate([100,0,-1])cylinder(d=2.6,h=30);
  translate([100,60,-1])cylinder(d=2.6,h=30);
  translate([0,60,-1])cylinder(d=2.6,h=30);
  
 }
}