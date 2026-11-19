import Mathlib
import TauCeti.Algebra.Module.Submodule.OrbitRelQuotient
import TauCeti.Algebra.Module.ZLattice.Quotient
import TauCeti.Geometry.Manifold.Algebra.Quotient
import TauCeti.AlgebraicTopology.Singular.Torus.ZLattice
import TauCeti.Algebra.Module.ZLattice.Family.Basic
import TauCeti.Algebra.Module.ZLattice.Family.Manifold
import TauCeti.Algebra.Module.ZLattice.Family.DiffeomorphProd
import TauCeti.AlgebraicTopology.Singular.Torus.Family
import TauCeti.Algebra.Module.ZLattice.Family.RotatedDisc
import TauCeti.RepresentationTheory.Cyclic.Affine
import TauCeti.RepresentationTheory.Homological.GroupCohomology.CyclicAutomorphism

/-!
# Complex tori, varying lattices and logarithmic transforms: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is meant to state the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`. Every headline that
is statable against the pinned interfaces is already proved at the Tau Ceti pin, where the README
cites it by name; the `#check` lines below pin those declarations. The remaining headlines are not
statable at the pins, so this file states no theorem.

Headlines proved at the pin:

* a lattice quotient `E/L` is a complex Lie group, compact, with integral homology the exterior
  algebra on `L` (Layer 1): `Submodule.instLieAddGroupOrbitRelQuotient`,
  `Submodule.instCompactSpaceOrbitRelQuotient`, `Submodule.orbitRelQuotientHomologyEquiv`; the
  component group of the kernel of an induced homomorphism,
  `Submodule.orbitRelQuotientComapQuotientEquiv`;
* the family `(Y × E)/Λ` of a period map is a complex manifold, its orbit map a covering map and
  a local biholomorphism, its projection a holomorphic submersion, smoothly trivial with fibre
  `ℝ^d/ℤ^d`, with a canonical marking of trivial monodromy (Layer 2):
  `TauCeti.isManifold_torusFamily`, `TauCeti.isAddQuotientCoveringMap_torusFamily_mk`,
  `TauCeti.isLocalDiffeomorph_torusFamily_mk`,
  `TauCeti.isSubmersionOfComplement_torusFamilyProjection`, `TauCeti.torusFamilyDiffeomorphProd`,
  `TauCeti.torusFamilyMarking_loopClass_eq_of_homotopy`;
* an affine action of a group on the family is free exactly when no nonidentity element of a base
  stabilizer has a fixed point on its fibre (Layer 3):
  `TauCeti.isCancelSMul_torusFamilyAffineMulAction_iff`;
* the fixed-point and exact-order criteria for `x ↦ A x + t`, the classification of
  translation-conjugacy classes by `H¹(C_m, T)`, and the integral connecting isomorphism
  `H¹(C_m, T) ≃ H²(C_m, Λ)` with `δ[t] = [N(t̃)]` (Layer 4):
  `AddEquiv.exists_affineEquiv_iterate_apply_eq_self_iff`, `AddEquiv.orderOf_affineEquiv_eq_iff`,
  `AddEquiv.groupCohomologyπOdd_cyclicRep_eq_iff_exists_conj_affineEquiv`,
  `TauCeti.δ_cyclicRepShortComplex_groupCohomologyπOdd_one`, `TauCeti.cyclicConnectingEquiv`;
* a cyclic affine action over the rotated disc is free exactly when it is free on the central
  torus, and it has exact order `m` (Layer 5):
  `TauCeti.isCancelSMul_torusFamilyAffineMulAction_rootsOfUnityBall_iff`,
  `TauCeti.orderOf_toPerm_torusFamilyAffineMulAction_rootsOfUnityBall`.

Headlines not statable at the pins:

* the monodromy of the descended family over `Y/Γ` is `ρ(g⁻¹)` on the marking (Layer 3, §3.4):
  the descended projection from the second quotient to `Y/Γ` is not defined at the pins, and fibre
  transport on homology exists there only for a Hurewicz fibration given with a lifting function;
* the central fibre of the cyclic quotient `Q = X/C_m` is a complex hypersurface of multiplicity
  `m` (Layer 5, §§5.2–5.3): the rotated disc `TauCeti.rootsOfUnityBall m r` carries no manifold
  structure at the pins, so neither does the family over it or its quotient, and the map
  `Q → D_t` descended from `z ↦ z^m` is not defined;
* the normal bundle of the central fibre has character `ζ`, and adjunction
  `K_F ≅ K_Q|_F ⊗ N_{F/Q}` holds (Layer 5, §§5.4–5.5): the holomorphic normal and canonical line
  bundles of a complex submanifold are not carriers at the pins;
* the logarithmic gauge `Q* ≃ Y*` over the punctured disc and the covering identification
  `X* ≃ β_m^* Q*` (Layer 6, §§6.1–6.3): they need `Q` above, and an atlas on the literal pullback
  over the punctured disc, which is not a carrier at the pins;
* the reglued manifold, its independence of choices and its fundamental group and first homology
  (Layer 6, §§6.4–6.6): they need `Q` and open gluing of complex manifolds, which is not a carrier
  at the pins.
-/

namespace TauCetiRoadmap.ComplexTori

#check @Submodule.instLieAddGroupOrbitRelQuotient
#check @Submodule.instCompactSpaceOrbitRelQuotient
#check @Submodule.orbitRelQuotientHomologyEquiv
#check @Submodule.orbitRelQuotientComapQuotientEquiv
#check @TauCeti.isManifold_torusFamily
#check @TauCeti.isAddQuotientCoveringMap_torusFamily_mk
#check @TauCeti.isLocalDiffeomorph_torusFamily_mk
#check @TauCeti.isSubmersionOfComplement_torusFamilyProjection
#check @TauCeti.torusFamilyDiffeomorphProd
#check @TauCeti.torusFamilyMarking_loopClass_eq_of_homotopy
#check @TauCeti.isCancelSMul_torusFamilyAffineMulAction_iff
#check @AddEquiv.exists_affineEquiv_iterate_apply_eq_self_iff
#check @AddEquiv.orderOf_affineEquiv_eq_iff
#check @AddEquiv.groupCohomologyπOdd_cyclicRep_eq_iff_exists_conj_affineEquiv
#check @TauCeti.δ_cyclicRepShortComplex_groupCohomologyπOdd_one
#check @TauCeti.cyclicConnectingEquiv
#check @TauCeti.isCancelSMul_torusFamilyAffineMulAction_rootsOfUnityBall_iff
#check @TauCeti.orderOf_toPerm_torusFamilyAffineMulAction_rootsOfUnityBall

end TauCetiRoadmap.ComplexTori
