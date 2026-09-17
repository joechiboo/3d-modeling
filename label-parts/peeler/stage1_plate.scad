// 第1階：斜板＋開槽（驗證寬度、斜角、槽位）
B=76; K=38; I=10; J=26; M=2.5;
G=61.5; Hs=6.5; Gx=(B-G)/2; Gy=K*0.35;
difference(){
  rotate([90,0,90]) linear_extrude(B) polygon([[0,I],[K,J],[K,J-M],[0,I-M]]);
  translate([Gx,Gy,-1]) cube([G,Hs,J+2]);
}
