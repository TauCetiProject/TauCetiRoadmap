import Mathlib

/-!
# Hecke stacks and local shtuka cohomology: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, with only
the simple definitions they need. None of them is statable at the pins, so nothing is declared
here. The headline theorems, each with the carrier it lacks:

* HS1.5 and HS1.9, the two-sided adjunction between the Hecke operators `T_V` and `T_{V∨}` on the
  lisse category of `Bun_G` and the continuous Weil descent of `T_V(A)`: no stack of `G`-bundles
  on the relative Fargues–Fontaine curve, no solid or lisse sheaf categories on it and no Satake
  kernels (Tau Ceti's `TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine` modules give the
  orbit space, not the relative curve with its bundles);
* HS1.0, integral exterior and tensor generation of `Rep_Λ((Ĝ⋊Q)^I)` with bounded-weight
  resolutions: no split reductive group scheme over `ℤ_ℓ[√q]` with its category of finite
  projective representations (the pinned `TauCeti.ReductiveAffineGroupSchemeCat` lives over a
  field);
* HS2.15, nonemptiness of the admissible locus exactly when `[b] ∈ B(G,μ⁻¹)`, with its
  connectedness and density: no local shtuka spaces, no bounded affine Grassmannians and no
  Kottwitz set `B(G)`;
* HS2.18, the reciprocity map `rec_HS : W_E^ab ≃ E^×` defined by the component torsor of the
  Lubin–Tate tower: no shtuka tower on which to define it;
* HS3.5, HS3.6 and HS3.8, finite generation, compactness, admissibility and duality of the tower
  complexes `C_K`: no towers, no compact-support functor and no enhanced derived category of
  smooth representations (the pinned `TauCeti.SmoothDiscreteTopRep` is the ordinary carrier);
* HS4.1, the coherent finite-set Hecke family: no Hecke functor.

No weakened substitute is stated in place of any of them.
-/

namespace TauCetiRoadmap.HeckeStacksAndLocalShtukas

end TauCetiRoadmap.HeckeStacksAndLocalShtukas
