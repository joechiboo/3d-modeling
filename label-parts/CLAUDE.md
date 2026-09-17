# 給 Claude Code 的工作說明

- 這是 3D 列印零件的階梯式開發專案，一次只推進一階，不要跳階。
- 修改 .scad 後：一律重出 STL 到 stl/、渲染 PNG 到 renders/，並在 README 的試印紀錄補一行。
- 所有尺寸參數集中在各 .scad 檔開頭的參數區；README 的 A–M 表是唯一真值來源，兩邊要同步。
- 帶 ⚠ 的尺寸是粗估，試印回饋後更新並移除 ⚠。
- 回覆風格：簡短、直接、中文。
- 使用者提供照片時放進 photos/，檔名用「主體_面_角度.jpg」（peeler_/module_ 開頭），並在 `photos/INDEX.md` 補一行。
