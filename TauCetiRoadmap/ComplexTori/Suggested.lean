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

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`. One headline is stated here:
a period family is holomorphically locally trivial over every open set on which its periods vary
by complex-linear automorphisms (Layer 2, §2.3). Several of the other headlines are already proved
at the Tau Ceti pin, where the README cites them by name; the `#check` lines below pin those
declarations. The rest are not statable at the pins.

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
  `m` (Layer 5, §§5.2–5.3): the order of vanishing of a holomorphic function along a hypersurface
  of a complex manifold is not a carrier at the pins (Mathlib's `analyticOrderAt` and
  `meromorphicOrderAt` are for functions of one variable), and neither is the complex-manifold
  structure of a closed complex submanifold of a complex manifold (Tau Ceti's
  `TauCeti.IsAnalyticSubmanifold` concerns subsets of `𝕜ⁿ`); nor do the pins give `Q` itself,
  since the rotated disc `TauCeti.rootsOfUnityBall m r` carries no atlas there and the map
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

open scoped Manifold ContDiff

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

/-- **Holomorphic local triviality of a period family** (README §2.3). Let `Π : Y → (Λ →ₗ[ℤ] E)`
be a holomorphic period family over a complex manifold `Y` that is Hausdorff and locally compact,
let `Λ` act on `Y × E` by the period action `λ +ᵥ (y, v) = (y, v + Π y λ)`, and give the orbit
space `(Y × E)/Λ` Mathlib's quotient atlas. If `U ⊆ Y` is open, `y₀ ∈ Y`, and
`g : U → (E ≃L[ℂ] E)` is holomorphic with `Π y = g(y) ∘ Π y₀` for every `y ∈ U`, then
`(y, [w]) ↦ [y, g(y) w]` is a biholomorphism from `U × E/Π(y₀)Λ` onto the part
`p⁻¹(U) = q(U × E)` of the total space over `U`; its inverse is `[y, v] ↦ (y, [g(y)⁻¹ v])`, well
defined because `g(y)⁻¹(v + Π y λ) = g(y)⁻¹ v + Π y₀ λ`.

The instances `ContinuousConstVAdd`, `ProperlyDiscontinuousVAdd` and `IsCancelVAdd`, through which
Mathlib's atlas `AddAction.instChartedSpaceQuotient` is installed, hold for the period action
(`TauCeti.continuousConstVAdd_periodAddAction`, `TauCeti.properlyDiscontinuousVAdd_periodAddAction`,
`TauCeti.isCancelVAdd_periodAddAction`). -/
theorem exists_diffeomorph_torusFamily_of_periods_eq
    {EY : Type*} [NormedAddCommGroup EY] [NormedSpace ℂ EY] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℂ EY H} {Y : Type*} [TopologicalSpace Y] [ChartedSpace H Y]
    [IsManifold I ∞ Y] [T2Space Y] [LocallyCompactSpace Y]
    {Λ : Type*} [AddCommGroup Λ] [Module.Free ℤ Λ] [Module.Finite ℤ Λ]
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (P : Y → Λ →ₗ[ℤ] E) [∀ y, DiscreteTopology (LinearMap.range (P y))]
    [∀ y, IsZLattice ℝ (LinearMap.range (P y))]
    (hinj : ∀ y, Function.Injective (P y))
    (hP : ∀ l, ContMDiff I 𝓘(ℂ, E) ∞ fun y ↦ P y l)
    [AddAction Λ (Y × E)] (hact : ∀ (l : Λ) (y : Y) (v : E), l +ᵥ (y, v) = (y, v + P y l))
    [ContinuousConstVAdd Λ (Y × E)] [ProperlyDiscontinuousVAdd Λ (Y × E)]
    [IsCancelVAdd Λ (Y × E)]
    (U : TopologicalSpace.Opens Y) (y₀ : Y) (g : U → E ≃L[ℂ] E)
    (hg : ContMDiff I 𝓘(ℂ, E →L[ℂ] E) ∞ fun y : U ↦ (g y : E →L[ℂ] E))
    (hgP : ∀ (y : U) (l : Λ), P y l = g y (P y₀ l)) :
    ∃ Φ : Diffeomorph (I.prod 𝓘(ℂ, E)) (I.prod 𝓘(ℂ, E))
        (U × AddAction.orbitRel.Quotient (LinearMap.range (P y₀)) E)
        (⟨Quotient.mk _ '' (Prod.fst ⁻¹' (U : Set Y)),
          isOpenMap_quotient_mk'_add _ (U.isOpen.preimage continuous_fst)⟩ :
          TopologicalSpace.Opens (AddAction.orbitRel.Quotient Λ (Y × E))) ∞,
      ∀ (y : U) (w : E), (Φ (y, Quotient.mk _ w) : AddAction.orbitRel.Quotient Λ (Y × E)) =
        Quotient.mk _ ((y : Y), g y w) := by
  sorry

end TauCetiRoadmap.ComplexTori
