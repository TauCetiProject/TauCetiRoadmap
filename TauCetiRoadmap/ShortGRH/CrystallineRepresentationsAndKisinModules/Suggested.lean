import Mathlib

/-!
# Crystalline representations and Kisin modules: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
stated here, for the reasons below.

At the pins Mathlib has the tilt `PreTilt`, Witt vectors, Fontaine's map
`WittVector.fontaineTheta` with its surjectivity (`surjective_fontaineTheta`), a ring
`BDeRhamPlus` and its localisation `BDeRham` built by another construction, `ℂ_p` as
`PadicComplex`, the algebraic closure `PadicAlgCl` and `cyclotomicCharacter`. Neither Mathlib nor
Tau Ceti has, at the pins, the action of `Gal(ℚ̄_p/ℚ_p)` on `ℂ_p` by continuous ring automorphisms
(Mathlib has only the operation `σ • x`, defined as `UniformSpace.Completion.map` of `σ`, with none
of the laws of an action) or on the tilt of its integers, Colmez's rings `A_max`, `B⁺` and
`B_max` with their Frobenius and Galois actions, the period `t`, or anything built on them:
admissible and crystalline representations, Hodge–Tate jumps, the linear Frobenius, crystalline
cocycles, charts and Kisin modules.

* Tate's vanishing theorem (1.6 (a)). It can be stated at the pins, on Mathlib's
  `PadicComplex`, `PadicAlgCl` and `cyclotomicCharacter`, with the Galois action written through
  `UniformSpace.Completion.map`. Its vanishing clause is the `H⁰` part of PadicPeriodRings §1.4,
  whose `Suggested.lean` states it as `tateSen_H0`, and its trace bound is the normalised trace of
  PadicPeriodRings §1.3; so it is not stated a second time here.
* The fundamental exact sequence for `B_max` (1.5 (c)): it needs `B_max` with its Frobenius and
  the field `B_dR` of 1.5 (b) with the embedding of `B_max`.
* The existence of Kummer charts (2.4 (b)): it needs `A_inf` with its Frobenius and its Galois
  action, and the charts of 2.1.
* The rank of the crystalline cocycles (4.2 (a)): it needs `B_max`, the group `Z_f(T)` and the
  Hodge–Tate jumps of 3.1.
* The frame theorem for a period matrix (5.4), the radius lemma (5.5) and the frame theorem for
  Kisin modules (5.8): they need `B⁺`, `A_max`, the ring `S_B` of a chart (2.1) and the modules
  `M(L)` and `N(L)` of 5.6.
* The limit theorem (6.2 (c)) and the local conditions at limits of traces (6.4): they need
  crystalline representations defined through `B_max` and, for 6.4, the local conditions of
  GaloisRepresentationsOfUnitaryEigenforms §1.3.
-/

namespace TauCetiRoadmap.ShortGRH.CrystallineRepresentationsAndKisinModules

end TauCetiRoadmap.ShortGRH.CrystallineRepresentationsAndKisinModules
