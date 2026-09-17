B=76; K=38; I=10; J=26; M=2.5;
G=61.5; Hs=6.5; Gx=(B-G)/2;
ang=atan2(J-I,K); Lp=sqrt(K*K+(J-I)*(J-I)); // 斜面真實長度
Gy=Lp*0.35;
// 放平：板子躺在 XY 平面，Y 方向是原本的斜面方向（低端→高端）
difference(){
  cube([B, Lp, M]);
  translate([Gx, Gy, -1]) cube([G, Hs, M+2]);
}
echo(slope_len=Lp, angle=ang);
