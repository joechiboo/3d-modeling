// ============================================================
// TSC TDP-225 (DT2205) 撥紙模組替換件 v2 — 參數化（單位 mm）
// v2 修正：腳改為側牆的延伸、沿斜面方向伸出（可調角度）
// ============================================================

/* ---------- 實測值 ---------- */
A  = 80;    B  = 76;
G  = 61.5;  Hs = 6.5;
Gx = (B-G)/2;
Gy_ratio = 0.35;   // 開槽沿斜面位置 0=低端 1=高端
I  = 10;  J  = 26;  K  = 38;

/* ---------- 粗估值 ---------- */
D  = 8;     // 腳寬（正面看）
E  = 3;     // 勾伸出量（朝外）
F  = 2;     // 勾厚
L  = 18;    // 腳全長
M  = 2.5;   // 板厚（原1.5加厚）

/* ---------- v2 關鍵參數 ---------- */
leg_angle = atan2(J-I, K);  // 腳的傾角：預設=斜面角(23°)，可改 0=垂直
leg_t     = 3;              // 腳厚（側牆延伸的厚度，原件約2，加厚）
wall      = 2;
fillet_r  = 3;
clr       = 0.2;
$fn=32;

/* ============================================================ */
module slab_profile()  { polygon([[0,I],[K,J],[K,J-M],[0,I-M]]); }
module full_profile()  { polygon([[0,0],[K,0],[K,J],[0,I]]); }

module body() {
    difference() {
        union() {
            rotate([90,0,90]) linear_extrude(B) slab_profile();          // 斜板
            rotate([90,0,90]) linear_extrude(wall) full_profile();       // 左側牆
            translate([B-wall,0,0]) rotate([90,0,90]) linear_extrude(wall) full_profile(); // 右側牆
            cube([B, wall, I]);                                          // 低端牆
            translate([0,K-wall,0]) cube([B, wall, J]);                  // 高端牆
        }
        translate([Gx, K*Gy_ratio, -1]) cube([G, Hs, J+2]);              // 開槽
    }
}

// v2 腳：從高端角落沿斜面方向延伸的扁平臂，勾在末端朝外
// 畫在原點：腳身 X 0..D，勾朝 -X 伸出
module leg() {
    rotate([-leg_angle,0,0])
    union() {
        cube([D, leg_t, L]);                          // 腳身
        translate([-(E-clr), 0, L-F])                 // 勾朝外
            cube([E-clr+1, leg_t, F]);
        translate([0,leg_t,0]) rotate([0,90,0]) linear_extrude(D)
            polygon([[0,0],[0,fillet_r*2],[fillet_r*2,0]]);  // 根部補強
    }
}

body();
// 左腳：勾尖對齊整體最外緣（A寬），A 含勾尖
translate([-(A-B)/2 + (E-clr), K-leg_t, J]) leg();
// 右腳：鏡像
translate([B+(A-B)/2 - (E-clr), K-leg_t, J]) mirror([1,0,0]) leg();

/* 列印：斜面朝下平放｜PETG｜0.2層高｜4周圈｜40%填充｜勾加支撐
   leg_angle 改 0 可讓腳變垂直；試裝主要調 E、clr、leg_angle */
