# 3D 建模

個人 3D 建模／列印專案的集合 repo，一個案子一個子目錄。

## 案子

| 案子 | 說明 | 狀態 |
|------|------|------|
| [label-parts](label-parts/) | TSC TDP-225 標籤機撥紙模組替換件 | 階段 1 待試印 |
| [paper-dispenser](paper-dispenser/) | 撥紙器 | 構想中 |

## 子目錄慣例

```
<case-name>/
  README.md      # 需求、尺寸、設計決策
  reference/     # 參考資料、照片、丟進來的 zip 解壓內容
  models/        # 建模檔（.stl / .step / .3mf / .f3d ...）
  docs/          # 量測、列印參數、組裝說明
```

各案子照自己的階段調整（label-parts 用 `peeler/` `stl/` `renders/` `photos/` `scans/`）。
案子長大到需要獨立的 issue / release 節奏時再 split 出去，在那之前都留在這個 repo。

## 慣例

- 模型檔（stl/3mf/step/f3d）與素材在 `.gitattributes` 標成 binary，git 不動換行
- 匯出用的 `*.zip` 不進版控，內容以解壓後的目錄為準
