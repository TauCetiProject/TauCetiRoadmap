module

public import Mathlib
public import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Polydisc.Basic

/-!
# Foundations of adic spaces, part V: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable there, each with `sorry`,
together with the one predicate their statements need.

Stated below:

* Gauss-point closure (README §3.4): over a complete nontrivially normed nonarchimedean field with
  infinite residue field, the unit Gauss point of every closed polydisc lies in the closure of its
  rational evaluation points. The polydisc, its evaluation points and the Gauss norm are Tau
  Ceti's `TauCeti.ValuationSpectrum.closedPolydisc`, `TauCeti.ValuationSpectrum.classicalPoint`
  and Mathlib's `MvPowerSeries.gaussNorm`; the predicate `IsUnitGaussPoint` pins the valuation
  class of the Gauss point by comparison of Gauss norms.
* The analytic constant-rank normal form (README §6.1), on Mathlib's analytic manifolds over a
  complete nontrivially normed field of characteristic zero.
* The identity theorem across a subfield (README §6.6), in its coordinate form on `C^m`.

Headline theorems of the README that are not statable at the pins, and the carrier each lacks:

* Functorial resolution of rigid spaces in characteristic zero and the connectedness of the
  resolution of an irreducible space (§§5.3–5.4): Tau Ceti has rigid spaces, as objects of
  `TauCeti.AdicSpace` locally of finite type over `Spa(K, K°)`, but no smooth or proper morphism
  of adic spaces, no coherent ideal sheaf and no blow-up, so neither the smoothness of the source
  nor the properness of the resolution map can be expressed.
* The analytic manifold of rational points of a smooth rigid space and the submersion theorem
  (§§6.2, 6.3, 6.5): there is no smooth morphism of adic spaces, and the manifold structure is a
  construction of charted-space data, not a property.
* The group form of the subfield identity theorem on `G(C)` (§6.6): it needs the algebraic-point
  analytic atlas of §6.4 on `G(F)` for a smooth algebraic group over a complete nontrivially
  normed field of characteristic zero, which is charted-space data absent at the pins (Mathlib's
  analytic Lie-group structure on the units of a complete normed algebra covers `GL_n` only).

The supporting theorems of Layers 0–2 and 4 (proper images, nowhere density, normalization and
irreducible components, Riemann extension, regular and smooth loci, Shilov and weakly Shilov
points) are README targets and are not stated here. The pins provide adic spaces, morphisms
locally of finite type, closed immersions of pre-adic spaces and the canonical reduction of an
affinoid algebra, but no coherent ideal sheaf, proper morphism, normalization or specialization
map from an affinoid open to the spectrum of its canonical reduction; stating these targets on the
available carriers would be a long ad hoc encoding.
-/

@[expose] public section

namespace TauCetiRoadmap.AdicSpacesPartV

open Filter
open scoped Topology ContDiff Manifold

/-! ## Layer 3: classical points, finite-extension classes and Gauss closure -/

/-- A point `η` of the closed unit polydisc of dimension `n` over `K` is the unit Gauss point if it
compares restricted power series as their unit Gauss norms `‖∑ a_α T^α‖ = max ‖a_α‖` do. This
fixes the valuation class of `η` (README §3.4). -/
def IsUnitGaussPoint (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
    [NonarchimedeanRing K] (n : ℕ)
    (η : TauCeti.ValuationSpectrum.closedPolydisc n K) : Prop :=
  ∀ f g : TauCeti.Huber.weightedRestrictedSubring
      (fun _ : Fin n ↦ ({1} : Set K)) TauCeti.Huber.isWeightFamily_one_weight,
    η.1.toValuativeRel.vle f g ↔
      MvPowerSeries.gaussNorm norm (fun _ : Fin n ↦ (1 : ℝ))
        (f : MvPowerSeries (Fin n) K) ≤
      MvPowerSeries.gaussNorm norm (fun _ : Fin n ↦ (1 : ℝ))
        (g : MvPowerSeries (Fin n) K)

/-- **Gauss-point closure.** Over a complete nontrivially normed nonarchimedean field `K` whose
residue field `K° / K°°` is infinite, the unit Gauss point exists on the closed unit polydisc of
every dimension `n` and lies in the closure of the evaluation points at tuples of power-bounded
elements of `K`. Howe–Klevdal II, proof of Lemma 9.3.5; README §3.4. -/
theorem gaussPoint_mem_closure_rationalPoints
    (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
    [NonarchimedeanRing K] [CompleteSpace K]
    [Infinite (TauCeti.Huber.powerBoundedSubring K ⧸
      TauCeti.Huber.topologicallyNilpotentIdeal K)]
    (n : ℕ) (x : TauCeti.ValuationSpectrum.spa (TauCeti.Huber.powerBoundedSubring K)) :
    ∃ η : TauCeti.ValuationSpectrum.closedPolydisc n K,
      IsUnitGaussPoint K n η ∧ η ∈ closure (Set.range
        (fun a : {a : Fin n → K // ∀ i, TauCeti.Huber.IsPowerBounded (a i)} ↦
          TauCeti.ValuationSpectrum.classicalPoint x a.1 a.2)) := by
  sorry

/-! ## Layer 6: analytic manifolds, constant rank and identities -/

/-- **Analytic constant-rank theorem.** Let `F` be a complete nontrivially normed field of
characteristic zero and `f : M → N` an analytic map of analytic manifolds modelled on `F^m` and
`F^n` whose tangent map has rank `k` at every point near `a`. Then there are analytic charts `φ`
at `a` and `ψ` at `f a`, centred at zero, with analytic inverses, such that `f` maps the source of
`φ` into the source of `ψ` and `ψ ∘ f ∘ φ⁻¹ (x₁, …, x_m) = (x₁, …, x_k, 0, …, 0)`. No separation
axiom is required of `M` or `N`. Schneider, *p-Adic Lie Groups*, Corollary 5.8 and Proposition
9.3; Howe–Klevdal II, proof of Theorem 9.1.3; README §6.1. -/
theorem analytic_constantRank
    (F : Type*) [NontriviallyNormedField F] [CompleteSpace F] [CharZero F]
    (m n k : ℕ) (hkm : k ≤ m) (hkn : k ≤ n)
    (M N : Type*) [TopologicalSpace M] [TopologicalSpace N]
    [ChartedSpace (Fin m → F) M] [ChartedSpace (Fin n → F) N]
    [IsManifold (modelWithCornersSelf F (Fin m → F)) ω M]
    [IsManifold (modelWithCornersSelf F (Fin n → F)) ω N]
    (f : M → N) (a : M)
    (ha : ContMDiffAt (modelWithCornersSelf F (Fin m → F))
      (modelWithCornersSelf F (Fin n → F)) ω f a)
    (hrank : ∀ᶠ x in 𝓝 a, Module.finrank F (LinearMap.range
      (mfderiv (modelWithCornersSelf F (Fin m → F))
        (modelWithCornersSelf F (Fin n → F)) f x).toLinearMap) = k) :
    ∃ (φ : OpenPartialHomeomorph M (Fin m → F))
      (ψ : OpenPartialHomeomorph N (Fin n → F)),
      a ∈ φ.source ∧ f a ∈ ψ.source ∧ φ a = 0 ∧ ψ (f a) = 0 ∧
      ContMDiffOn (modelWithCornersSelf F (Fin m → F))
        (modelWithCornersSelf F (Fin m → F)) ω φ φ.source ∧
      ContMDiffOn (modelWithCornersSelf F (Fin m → F))
        (modelWithCornersSelf F (Fin m → F)) ω φ.symm φ.target ∧
      ContMDiffOn (modelWithCornersSelf F (Fin n → F))
        (modelWithCornersSelf F (Fin n → F)) ω ψ ψ.source ∧
      ContMDiffOn (modelWithCornersSelf F (Fin n → F))
        (modelWithCornersSelf F (Fin n → F)) ω ψ.symm ψ.target ∧
      Set.MapsTo f φ.source ψ.source ∧
      ∀ x ∈ φ.source, ∀ j : Fin n,
        ψ (f x) j = if h : j.val < k then φ x ⟨j.val, lt_of_lt_of_le h hkm⟩ else 0 := by
  sorry

/-- **Identity theorem across a subfield.** Let `E` and `C` be nontrivially normed fields and `C`
a normed `E`-algebra, so that `E → C` is an isometric embedding. A `C`-analytic germ `f` at `0` on
`C^m` that vanishes at every point of `E^m` near `0` vanishes near `0` on `C^m`. Neither
completeness nor a characteristic hypothesis is needed. Howe–Klevdal II, proof of Theorem 9.1.3
(with `E = ℚ_p`, `C = ℂ_p`); README §6.6. -/
theorem analytic_germ_eq_zero_of_subfield
    (E C : Type*) [NontriviallyNormedField E] [NontriviallyNormedField C] [NormedAlgebra E C]
    (m : ℕ) (f : (Fin m → C) → C) (hf : AnalyticAt C f 0)
    (hzero : ∀ᶠ x : Fin m → E in 𝓝 0, f (fun i ↦ algebraMap E C (x i)) = 0) :
    ∀ᶠ z in 𝓝 (0 : Fin m → C), f z = 0 := by
  sorry

end TauCetiRoadmap.AdicSpacesPartV
