# Nine-roadmap native closeout audit — 2026-10-30

All twenty-one source prerequisites are present, or semantically preserved by reviewed successors,
on actual Tau Ceti main [daa66339a578b8c1c41c20b94839ca25444cc1e8](https://github.com/TauCetiProject/TauCeti/commit/daa66339a578b8c1c41c20b94839ca25444cc1e8),
tree `4813e5fa8a876016ab49a67d36c9da0efbfe9881`. The final current-source replay succeeded on this exact revision:
934 distinct entry modules built in 24,174 Lake jobs; sixteen probes exited zero with warnings
treated as errors, producing exactly 128 axiom reports, all confined to `propext`,
`Classical.choice` and `Quot.sound`. No source, dependency, input or proof patch was applied
during this replay.

## Source and scope

Normal Bors batch 2204 promoted the exact tested candidate. Its [genuine CI run 41041868635](https://github.com/TauCetiProject/TauCeti/actions/runs/41041868635)
passed all four jobs. The trusted tested-integration record binds base
`1aaef7af4eb8f03177a34c2004de2838a796a9cb`, head and tested commit both `daa66339a578b8c1c41c20b94839ca25444cc1e8`,
and the tree above. Artifact `12971187635` has ZIP SHA256
`057af09c14bcf45d969889c2615b82e6048564cfed4fba35459d351759dbe605`.
Actual Git main inclusion is the source proof; a delayed GitHub PR merged-state field is not used.

The full nine README specifications, their conventions, rejection tests and owner boundaries were
audited. The [catalogs](CloseoutAudit-20261030/manifest.json) contain 927 distinct roots;
seven further probe-only imports make 934. Their static import closure contains 14,089 modules.
Overlapping positive inventories include Conformal 239, Global Number Fields 138, Heights and Units
117, Local Fields 85, Effective Bounds 15 and Hopf–Rinow 209, including all 167 current Riemannian
modules. The geometric/peripheral catalogs cover their complete owned endpoint inventories too.
Compiling additional prime-end, Riemannian or other companion modules asserts no completion of
their separate roadmaps.

Canonical source migration of `SMulGroupoid.lean` required moving its catalog entry to
`SMulGroupoid/Basic.lean` and importing `Basic` plus `Curvature` in one probe. Every other byte
of that probe, its declaration checks and its 35 report IDs was retained. No mathematical
hypothesis or acceptance conclusion was weakened. Other probe bytes remained unchanged.
The older admitted `Suggested.lean` files remain design prototypes at the roadmap repository's
historical dependency pin; they are not the current-source native certificates.

## Qualified source prerequisites

The heads below identify the reviewed contributions, not a claim that every whole source file
remains byte-identical after later additive refactors. Exact payload comparisons and successor
semantic audits preserve all required conclusions. In particular, the later `Matrix.rank_neg`
addition retains #20658's prior declarations/proofs; the additive Liouville section retains
#22059's height statements; later ray-class refactors retain both #22015 characteristic equations.

| Roadmap | Reviewed source PRs and heads |
| --- | --- |
| [GlobalNumberFields](GlobalNumberFields/README.md) | [#22015](https://github.com/TauCetiProject/TauCeti/pull/22015) (`ea05ae6ffecd1bec4daaf06d4ccb23cfd5f22ea4`) |
| [ConformalMapping](ConformalMapping/README.md) | [#21991](https://github.com/TauCetiProject/TauCeti/pull/21991) (`1c0831d0e76ff1a7791b25893f1ba35ac9f8aa2a`), [#22743](https://github.com/TauCetiProject/TauCeti/pull/22743) (`59aac74836254d9dd985f417119aa0a29c3a64f2`), [#22936](https://github.com/TauCetiProject/TauCeti/pull/22936) (`03719e1a298fdde99a78be0e2027ebc0cf88604c`), [#23036](https://github.com/TauCetiProject/TauCeti/pull/23036) (`8a1f9ef261b0648f7bc92092d40d90ffc0262824`) |
| [PeripheralActions](PeripheralActions/README.md) | [#22013](https://github.com/TauCetiProject/TauCeti/pull/22013) (`1837f77243ab67475b442cdfc842c86111ec575d`) |
| [AnalyticToricGeometry](AnalyticToricGeometry/README.md) | [#22017](https://github.com/TauCetiProject/TauCeti/pull/22017) (`1c14e0ea516a73fe31c89c429c63b2f0bd51cee8`) |
| [OrthogonalSpinGroups](OrthogonalSpinGroups/README.md) | [#22023](https://github.com/TauCetiProject/TauCeti/pull/22023) (`40bc1c43779db5d437068c7c5c0250f535e22cec`), [#22024](https://github.com/TauCetiProject/TauCeti/pull/22024) (`4589478f1240afbb9fb6c1cab41f1b2826fa29bd`) |
| [LocalFieldsRamification](LocalFieldsRamification/README.md) | [#22018](https://github.com/TauCetiProject/TauCeti/pull/22018) (`5d2883167f8a0b24d9ea580342c683f7960277ca`), [#22046](https://github.com/TauCetiProject/TauCeti/pull/22046) (`d9c5dce54b5fea21635e6da1a34cf5b53d03da64`), [#22047](https://github.com/TauCetiProject/TauCeti/pull/22047) (`02a131ed10be0817018d4211f13c97771a665896`) |
| [HeightsAndUnits](HeightsAndUnits/README.md) | [#19468](https://github.com/TauCetiProject/TauCeti/pull/19468) (`d39d38c3ebb56851d007cd0e93402b52953465e8`), [#20658](https://github.com/TauCetiProject/TauCeti/pull/20658) (`845df50aaf6bf535acdbbd11145d7feec4e63d1a`), [#20707](https://github.com/TauCetiProject/TauCeti/pull/20707) (`f8eff0549270416fc92f7b3ec279cf9929822156`) |
| [EffectiveBounds](EffectiveBounds/README.md) | [#22059](https://github.com/TauCetiProject/TauCeti/pull/22059) (`bc20ab2249ca9bb9beec195e114861c9edffdf23`), [#22064](https://github.com/TauCetiProject/TauCeti/pull/22064) (`1b334efdcc4441eb8ca3880cbbb3f27a75e8d46e`), [#22092](https://github.com/TauCetiProject/TauCeti/pull/22092) (`35edf89e32bd584800cbb4a42368fa9f03db1a47`) |
| [HopfRinow](HopfRinow/README.md) | [#18707](https://github.com/TauCetiProject/TauCeti/pull/18707) (`b9e6ce94f83c66d8f4f121f46091ac7e908a8866`), [#19453](https://github.com/TauCetiProject/TauCeti/pull/19453) (`abd6a3f0077d59ada10d83abba44307091b39ae8`), [#21067](https://github.com/TauCetiProject/TauCeti/pull/21067) (`7bd7c7558aa213b87ad9b17e4fd954e1bff82424`) |

The Conformal prior-work condition was checked separately from proof correctness: all 53 mapped
L0–L3 supplier files cite the preceding human-curated [Mathlib #33505](https://github.com/leanprover-community/mathlib4/pull/33505).
The finite implementing-PR audit covered 139 PRs: 138 historical PRs including incoming #22547,
plus #23036, which was pending at audit time and is now on main. Of these, 112 applicable historical
descriptions plus #23036 cite that work (113 applicable in total); 26 are justified mechanical
maintenance or L4/L5-only exclusions. Forty-seven missing citations and incoming #22547 were
repaired by append-only PR-description notes preserving original prose, authors and AI credits.
This is a bounded historical audit, not an assertion about future PR descriptions.

## Native acceptance results

All rows ran with `-DwarningAsError=true`. Zero-report probes are executable acceptance/rejection
checks and are not missing axiom reports. Report counts are exact per file, not just an aggregate.

| Probe | Exit | Axiom reports | Output |
| --- | ---: | ---: | --- |
| [conformal-current-source-acceptance.lean](CloseoutAudit-20261030/inputs/conformal-current-source-acceptance.lean.txt) | 0 | 4 | [log](CloseoutAudit-20261030/logs/conformal-current-source-acceptance.log) |
| [global-heights-current-source-axioms.lean](CloseoutAudit-20261030/inputs/global-heights-current-source-axioms.lean.txt) | 0 | 19 | [log](CloseoutAudit-20261030/logs/global-heights-current-source-axioms.log) |
| [hopf-full-scope-axioms.lean](CloseoutAudit-20261030/inputs/hopf-full-scope-axioms.lean.txt) | 0 | 35 | [log](CloseoutAudit-20261030/logs/hopf-full-scope-axioms.log) |
| [hopf-boundary-index-acceptance.lean](CloseoutAudit-20261030/inputs/hopf-boundary-index-acceptance.lean.txt) | 0 | 0 | [log](CloseoutAudit-20261030/logs/hopf-boundary-index-acceptance.log) |
| [hopf-corner-index-acceptance.lean](CloseoutAudit-20261030/inputs/hopf-corner-index-acceptance.lean.txt) | 0 | 0 | [log](CloseoutAudit-20261030/logs/hopf-corner-index-acceptance.log) |
| [hopf-flat-and-rejection-acceptance.lean](CloseoutAudit-20261030/inputs/hopf-flat-and-rejection-acceptance.lean.txt) | 0 | 0 | [log](CloseoutAudit-20261030/logs/hopf-flat-and-rejection-acceptance.log) |
| [effective-scope-probes.lean](CloseoutAudit-20261030/inputs/effective-scope-probes.lean.txt) | 0 | 5 | [log](CloseoutAudit-20261030/logs/effective-scope-probes.log) |
| [localfields-scope-probes.lean](CloseoutAudit-20261030/inputs/localfields-scope-probes.lean.txt) | 0 | 22 | [log](CloseoutAudit-20261030/logs/localfields-scope-probes.log) |
| [peripheral-full-scope-replay-20261028.lean](CloseoutAudit-20261030/inputs/peripheral-full-scope-replay-20261028.lean.txt) | 0 | 7 | [log](CloseoutAudit-20261030/logs/peripheral-full-scope-replay-20261028.log) |
| [toric-full-scope-replay-20261028.lean](CloseoutAudit-20261030/inputs/toric-full-scope-replay-20261028.lean.txt) | 0 | 9 | [log](CloseoutAudit-20261030/logs/toric-full-scope-replay-20261028.log) |
| [spin-full-scope-replay-20261028.lean](CloseoutAudit-20261030/inputs/spin-full-scope-replay-20261028.lean.txt) | 0 | 12 | [log](CloseoutAudit-20261030/logs/spin-full-scope-replay-20261028.log) |
| [AnalyticToricGeometry.lean](CloseoutAudit-20261030/inputs/AnalyticToricGeometry.lean.txt) | 0 | 3 | [log](CloseoutAudit-20261030/logs/AnalyticToricGeometry.log) |
| [OrthogonalSpinGroups.lean](CloseoutAudit-20261030/inputs/OrthogonalSpinGroups.lean.txt) | 0 | 2 | [log](CloseoutAudit-20261030/logs/OrthogonalSpinGroups.log) |
| [EffectiveBounds.lean](CloseoutAudit-20261030/inputs/EffectiveBounds.lean.txt) | 0 | 6 | [log](CloseoutAudit-20261030/logs/EffectiveBounds.log) |
| [LocalFieldsRamification.lean](CloseoutAudit-20261030/inputs/LocalFieldsRamification.lean.txt) | 0 | 4 | [log](CloseoutAudit-20261030/logs/LocalFieldsRamification.log) |
| [hopf-native-variation-acceptance.lean](CloseoutAudit-20261030/inputs/hopf-native-variation-acceptance.lean.txt) | 0 | 0 | [log](CloseoutAudit-20261030/logs/hopf-native-variation-acceptance.log) |
| **Total** | **all zero** | **128** | |

The machine-readable [actual results](CloseoutAudit-20261030/actual-main-results.json) have SHA256
`813c49bbfc48b576a59b93da5d31b7fa5061af9a9f658e9aa09a84cb49f9ed5e`;
the [build log](CloseoutAudit-20261030/actual-main-build.log) has SHA256
`18c4bd92720d9606b880d9020f86dc5e9a8184243a43ba9de9dd2f206f713eeb`.
The exact [executed manifest](CloseoutAudit-20261030/executed-manifest.json) has SHA256
`87739ed9ba79bb650f932d0ef78b25700435c9323cca6de0111bc72b88c72854`. All 24 catalog/probe input hashes were checked before
and after each command, as were source manifest/toolchain and the frozen copies. The source and
all nine dependency worktrees remained clean at their declared pins.

## Reproduction

The [bundle](CloseoutAudit-20261030/manifest.json) contains all eight catalogs and sixteen probes
as exact executed bytes, the unchanged replay driver and dependency-pin checker, and primary
output snapshots. The convenience `manifest.json` relocates only the 24 input path names to
`inputs/`; `executed-manifest.json` preserves the actual run's original paths and bytes.
Input hashes, module/report inventories and gate settings are identical. Recorded absolute paths
in historical results are provenance, not required installation paths. The relocated manifest
was not itself executed as the recorded run. Probe files are stored as `.lean.txt` so they do not
enter the roadmap repository's historical-pin default Lean build. The small materialization helper
copies their exact bytes to original `.lean` basenames in a new external directory; it changes no
proofs, imports, report IDs or driver gates.

Use a separate clean Tau Ceti checkout at the exact source commit above, with `origin/main`
containing it, its declared packages installed at the following pins, and Lean `4.36.0-rc1`.
Run from this bundle directory, replacing `/path/to/TauCeti` with that checkout and choosing a new
external directory for the reproduced run:

```sh
python3 materialize.py /tmp/tauceti-closeout-replay
cd /tmp/tauceti-closeout-replay
python3 run.py --source-dir /path/to/TauCeti --verified-main daa66339a578b8c1c41c20b94839ca25444cc1e8
```

The driver builds the full root union and checks every probe's exact report count and standard
axiom allowlist. It refuses a dirty source, changed pin or changed input. A reproduced run writes
its own output files in the materialized external directory, preserving the recorded snapshots.

| Dependency | Exact revision |
| --- | --- |
| mathlib | `2cabef97b63d3275776b8b060d802de6a6fa1055` |
| plausible | `c2d7840c65673533e15b499f25beecdc6227f7d8` |
| LeanSearchClient | `9d39f9bb0c30aa2f6200808805ff16e6ce950890` |
| importGraph | `b3cc36c295aa5e3e3c0197b09a6556298e710447` |
| proofwidgets | `17137fad38a2cc782ff00b323a13c3a991d085ab` |
| aesop | `29c64c56cc38211d39b306db2df11701e3d3de11` |
| Qq | `6d26f8bb4b2bb78f929ad160feac508866821316` |
| batteries | `30691c775364967184547c94468bf6b5f25400fb` |
| Cli | `34d2efffcb6dc8d5f3537cf6a7f88bfaa999ec49` |

## Scope limits retained

The native evidence supports the nine archived full specifications; it does not turn admitted
historical prototypes into proofs or replace owner boundaries with import reachability.
The active [quadratic-form invariants](../TauCetiRoadmap/QuadraticFormInvariants/README.md),
[Grothendieck–Euler forms](../TauCetiRoadmap/GrothendieckEulerForms/README.md), and
[CFSG statement](../TauCetiRoadmap/CFSGStatement/README.md) roadmaps keep their separately audited
remaining targets: the explicit Brauer/comparison ULift squares; the original single-variable
Cartan–Poincaré converse; and the missing pinned carrier comparisons for the stated Lie-type
families and Suzuki. The new quotient transport, forward Euler computations and Type-C descent
are progress rather than completion of those remaining contracts.

Audit and record preparation used Codex (GPT-6), with independent semantic and replay-result review.
