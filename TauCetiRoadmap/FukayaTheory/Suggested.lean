module

public import Mathlib
public import TauCeti.Geometry.Symplectic.Manifold.TwoForm
public import TauCeti.Geometry.Symplectic.Lagrangian.Manifold
public import TauCeti.Geometry.Symplectic.Hamiltonian.Manifold
public import TauCeti.Geometry.Manifold.Flow.TimeDependent
public import TauCeti.Geometry.Manifold.SmoothSingular.Integral

/-!
# Fukaya categories of compact Lagrangian branes: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the two
simple definitions one of them needs, and nothing else. The pinned Tau Ceti has symplectic forms
on a manifold (`TauCeti.SmoothTwoForm.IsSymplectic`), Lagrangian and exact Lagrangian maps
(`TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianMap`,
`TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap`), Hamiltonian vector fields
(`TauCeti.SmoothTwoForm.hamiltonianVectorField`, in the convention `ι_X σ = df`) with their
Poisson bracket, time-dependent flows and the diffeotopy of a time-dependent field with complete
suspension (`TauCeti.timeDependentFlowOf`, `TauCeti.timeDependentFlowDiffeotopy`), smooth
singular simplices with the integral of a form over them (`TauCeti.SmoothSimplex`,
`TauCeti.SmoothSimplex.integral`), Novikov series with their period filtration, nonnegative
subring and positive ideal (`TauCeti.NovikovSeries`) and the manifold Floer energy identity
(`TauCeti.SmoothTwoForm.floerEnergyDensity`), and the pinned Mathlib has singular homology
(`AlgebraicTopology.singularHomologyFunctor`). Neither has a Lagrangian Floer complex, a moduli
space of discs with Lagrangian boundary, a relative spin structure, or a Liouville domain with
its completion. The headline theorems and what each lacks:

* the filtered curved Fukaya category of compact Lagrangian branes with its curved `A∞` relations
  and strict weakly unobstructed objects (README FK7): lacks the bordered disc moduli with their
  rational virtual chains and the relative spin data;
* the `Λ_loc`-linear quasi-equivalence of the localized fixed-potential categories under
  Hamiltonian isotopy, with the finite-loss comparisons of the positive lattices (README FK9.2):
  lacks the Floer complexes and the bordered moduli of the comparison functors;
* the bound `#(L ∩ φ_H(L)) ≥ Σ_j dim_k H^j(L; k)` for a compact exact or weakly exact brane `L`
  (oriented and relatively spin; over `k` of characteristic 2 the spin lift is not used) and a
  Hamiltonian diffeomorphism `φ_H` with `L ⋔ φ_H(L)` (README FK9.0): its closed weakly exact
  branch over `k = 𝔽₂` is stated below as `weaklyExact_intersection_bound`, with weak exactness
  of the Lagrangian as `IsWeaklyExact` (the vanishing of `ω` on every smooth 2-simplex of the
  target whose boundary lies on the Lagrangian, which is `ω = 0` on `π₂(X, L)`) and the time-one
  map of the Hamiltonian flow as `hamiltonianTimeOne`; the statement mentions no Floer complex.
  The same branch over a general field `k` lacks the relative spin structure that orients the
  count, and the exact branch lacks the Liouville completion of its target; neither is stated;
* the zero-section computation `HF(L, L) ≅ H^*(L; End E)` with its cup product (README FK8.0):
  lacks the Floer complex and the bordered moduli of its Hamiltonian perturbations;
* the torus computation `H^0 ≅ Λ₀² ⊕ Λ₀/(T^A)` with `A = 1/(4π) − 1/16` (README FK8.1): lacks
  the lune/strip complex; its coefficient ring `Λ₀` is at the pin, as the nonnegative subring
  `TauCeti.NovikovSeries.nonnegSubring` of the real-exponent Novikov series over the field.

The finite matrix of the torus computation is a README Check, not a declaration here, because it
does not identify the geometric differential. The universes of the Lagrangian `N` and of its
model space are tied to the universe of the coefficient category `ModuleCat (ZMod 2)` by the
singular homology functor, and the coefficient module is `ZMod 2` lifted to that universe, whose
homology has the same `ZMod 2`-dimensions.
-/

@[expose] public section

open TauCeti CategoryTheory
open scoped Manifold ContDiff

namespace TauCetiRoadmap.FukayaTheory

universe u

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {E' H' : Type u} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'}
  {N : Type u} [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N]

/-! ## Layer 4: Compact oriented counts and exact/weakly exact operations -/

/-- **Weak exactness** of the Lagrangian `f(N)` (README FK4.2, the ClosedWeakExact data): the
two-form `om` integrates to zero over every smooth singular 2-simplex of `M` whose boundary (the
image of the frontier of the full-dimensional simplex `Δ²`) lies in the image of `f`. A smooth
disc with boundary on `f(N)` is such a simplex and the integral depends only on its relative
class, so this is `ω = 0` on the image of `π₂(M, f(N))`; spheres are the simplices whose
boundary is sent to a single point of `f(N)`. -/
def IsWeaklyExact (om : SmoothTwoForm I M) (f : N → M) : Prop :=
  ∀ σ : SmoothSimplex I M 2,
    (∀ x ∈ frontier (fullSimplex 2), σ.extension x ∈ Set.range f) → σ.integral om.1 = 0

/-! ## Layer 9: Continuation, modules and derived Fukaya categories -/

/-- The **time-one map** `φ_H` of the Hamiltonian flow of a time-dependent Hamiltonian
`H : ℝ → M → ℝ` (README FK1.2b), in this roadmap's convention `ι_{X_H} ω = −dH`: the field is
`hamiltonianVectorField ω (−H_t)` (Tau Ceti's convention is `ι_X ω = dH`) and the flow runs from
time `0` to time `1`. On a closed manifold the suspension of the field is complete and this is a
symplectomorphism; elsewhere it carries the junk values of `timeDependentFlowOf`. -/
noncomputable def hamiltonianTimeOne (om : SmoothTwoForm I M) (Hm : ℝ → M → ℝ) : M → M :=
  timeDependentFlowOf (fun t => om.hamiltonianVectorField (-(Hm t))) 0 1

/-- **Floer's intersection bound for a weakly exact Lagrangian over `𝔽₂`** (README FK9.0, the
closed weakly exact branch with trivial rank-one coefficients). Let `(M, ω)` be a closed
symplectic manifold, `f : N → M` a smooth Lagrangian embedding of a closed manifold `N`, weakly
exact in the sense of `IsWeaklyExact`, and `H_t` a smooth time-dependent Hamiltonian whose
time-one map `φ_H` is transverse to `f(N)` along `f(N)`: at every intersection point the tangent
images of `f` and of `φ_H ∘ f` span the tangent space of `M`. Then the number of intersection
points of `f(N)` with `φ_H(f(N))` is at least the sum of the mod-2 Betti numbers of `N`.
(Floer, *Morse theory for Lagrangian intersections*, J. Differential Geom. 28 (1988), for
`π₂(M, L) = 0`; the weakly exact case by the same argument, every disc with boundary on `L`
having zero energy.) The intersection set is finite under transversality, so `Nat.card` is its
cardinality; the sum runs over the degrees `0, …, dim N`, above which homology vanishes. -/
theorem weaklyExact_intersection_bound [CompactSpace M] [T2Space M] [BoundarylessManifold I M]
    [CompactSpace N] [T2Space N] [BoundarylessManifold J N]
    (om : SmoothTwoForm I M) (hom : om.IsSymplectic)
    (f : N → M) (hf : ContMDiff J I ∞ f) (hemb : Topology.IsEmbedding f)
    (hL : hom.isNondegenerate.IsLagrangianMap J f) (hwe : IsWeaklyExact om f)
    (Hm : ℝ → M → ℝ) (hHm : ContMDiff (𝓘(ℝ).prod I) 𝓘(ℝ) ∞ (Function.uncurry Hm))
    (htrans : ∀ x y : N, f x = hamiltonianTimeOne om Hm (f y) →
      LinearMap.range (mfderiv J I f x).toLinearMap ⊔
        LinearMap.range (mfderiv J I (hamiltonianTimeOne om Hm ∘ f) y).toLinearMap = ⊤) :
    ∑ j ∈ Finset.range (Module.finrank ℝ E' + 1),
      Module.finrank (ZMod 2)
        (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ZMod 2)) j).obj
          (ModuleCat.of (ZMod 2) (ULift.{u} (ZMod 2)))).obj (TopCat.of N)) ≤
    Nat.card {x : N // f x ∈ hamiltonianTimeOne om Hm '' Set.range f} := by
  sorry

end TauCetiRoadmap.FukayaTheory
