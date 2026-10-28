# console_pages

**One capability bit from GBT V8, packaged standalone.** No. 23 of 341,
`creation` domain (Creation).

<p>
<img alt="python" src="https://img.shields.io/badge/python-3.9%2B-blue">
<img alt="license" src="https://img.shields.io/badge/license-MIT-green">
<img alt="deps" src="https://img.shields.io/badge/runtime%20dependencies-0-brightgreen">
</p>

> 工作台页面渲染器：把 `console_hub` 的真读数**内联**进页面（渲染产物，file:// 直开）——Bento 自定义工作台（9 部件/拖拽编排/布局记忆）· 触手 3D 全景（域环→能力节点→绑定弧→运行脉冲，签名元素占首屏≥1/5、有光、字不歪）· 每工作流独立页（film/movie/music/short-video）。设计契约按 `gbt-aesthetic` 定档（数据台 4/3/6 · 3D 5/4/5）· 品牌三色冻结不引第四色 · 尊重 prefers-reduced-motion · 无 indigo/无 emoji 图标/无编造指标/无外链图床。op=render/list/verify/where

That description is copied verbatim from the registry. `tests/test_spec.py` pins it,
so documentation drift fails the build instead of shipping quietly.

## What this package actually is

It is the **contract** for one capability: its name, its parameters, the values it
accepts, and whether it can change state that cannot be restored. It is not the
implementation — that lives in the runtime this bit was extracted from.

So `run()` goes through a narrow `Backend` protocol, and the default backend is a
stub that **says so**:

```
status="validated"   backend="stub"   data={"executed": false}
```

Never `status="ok"`. A stub that reports success is worse than no stub, because the
caller stops looking for the real thing.

## Install

```bash
git clone https://github.com/gbtweilai-star/gbt-console-pages.git
cd gbt-console-pages
python -m pip install -e ".[dev]"
```

## Use

```bash
python -m gbt_console_pages info                  # capability card
python -m gbt_console_pages spec --json           # machine-readable contract
python -m gbt_console_pages check --payload '{}'
python -m gbt_console_pages run   --payload '{}'
```

Real `info` output from this machine:

```text
console_pages  (creation)  v1.0.0
----------------------------------------
工作台页面渲染器：把 `console_hub` 的真读数**内联**进页面（渲染产物，file:// 直开）——Bento 自定义工作台（9 部件/拖拽编排/布局记忆）· 触手 3D 全景（域环→能力节点→绑定弧→运行脉冲，签名元素占首屏≥1/5、有光、字不歪）· 每工作流独立页（film/movie/music/short-video）。设计契约按 `gbt-aesthetic` 定档（数据台 4/3/6 · 3D 5/4/5）· 品牌三色冻结不引第四色 · 尊重 prefers-reduced-motion · 无 indigo/无 emoji 图标/无编造指标/无外链图床。op=render/list/verify/where

gated      : False
external   : False
multi-op   : True
params     : (none)
values     : film, movie, music, short
```

Wire a real implementation:

```python
from gbt_console_pages import run

class MyBackend:
    name = "my-backend"
    def invoke(self, cap, payload):
        return {"cap": cap, "handled": sorted(payload)}

result = run({}, backend=MyBackend())
assert result.status == "ok"
```

## Parameters

| name | required | notes |
|---|---|---|
| — | no | the registry declares no required parameters |

Registry hint (`params_hint`): (empty)

**注册表登记的取值 / 子动作（4 个）**：`film`、`movie`、`music`、`short`

Types are deliberately absent: the registry does not declare them, and an invented
type is worse than no type, because callers believe it.

## Boundaries

- Not gated: the registry marks this bit `safe: true`.
- No external service dependency declared.
- Multi-op (`multi_op: true`): several sub-actions share one name — read `op` before calling.
- No implementation ships here. Bring a backend; the protocol is one method.

## What this is not

Not a wrapper around a hosted API. Not a model. Not a promise that calling it does
anything on its own. It is the typed seam plus the validation, which is the part that
stays correct even when the implementation changes.

## Tests

```bash
python -m pytest
```

```text
20 passed, 3 skipped in 0.14s
```

## Provenance

| field | value |
|---|---|
| capability | `console_pages` |
| domain | `creation` |
| handler | `console_pages` |
| safe | `True` (gated = `False`) |
| external | `False` |
| atlas page | [creation/console_pages](https://github.com/gbtweilai-star/gbt-caps/blob/main/caps/creation/console_pages.md) |
| full index | [https://github.com/gbtweilai-star/gbt-caps](https://github.com/gbtweilai-star/gbt-caps) |

The parent README says 348 capabilities; an AST pass over the registry enumerates
`341 + 0 unimplemented + 0 disabled = 341`. The extra 7 are historical duplicates.
Numbering here follows 341 and matches the `gbt-caps` index one-to-one.

## License

MIT.
