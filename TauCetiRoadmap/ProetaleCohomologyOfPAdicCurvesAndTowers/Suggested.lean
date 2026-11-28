module

import Mathlib
import TauCeti.GroupTheory.TitsSystem.Parabolic.Basic
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.TitsSystem
import TauCeti.RingTheory.CompositionSeries.Multiplicity

/-!
# Pro-étale cohomology of p-adic curves, Drinfeld half-spaces and the rank-two Drinfeld tower: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions their statements need.

Stated here, for `K/ℚ_p` finite:

* the generalized Steinberg representations `Sp_J(A)` of `GL_{d+1}(K)` over a coefficient field
  `A` of characteristic `0` or `p` are irreducible, pairwise non-isomorphic, and occur each once
  in a composition series of the locally constant functions on `G/B` (README §0.4(a)). The
  representations are the quotients of the locally constant functions on `GL_{d+1}(K)/P_J` by the
  functions pulled back from the larger flag varieties (README §0.3). The standard parabolic
  subgroups `P_J = B W_J B` are Tau Ceti's `TauCeti.TitsSystem.standardParabolic` of the standard
  Tits system `TauCeti.glTitsSystem` of `GL_{d+1}(K)` (upper triangular `B`, simple reflections
  the adjacent transpositions), indexed by sets `J` of its simple reflections; this file defines
  the translation representation, the relation submodule and the quotient representation;
* the Schneider–Stuhler and Iovita–Spiess presentation of `Sp_r(ℤ)`, `0 ≤ r ≤ d`, as the
  locally constant `ℤ`-valued cocycles on `(r+1)`-tuples of `K`-rational hyperplanes that vanish
  on dependent tuples (README §0.5); this file defines the translation representation on
  functions of hyperplane tuples and the subrepresentation of these cocycles.

These are the coefficients of every cohomology computation of the Drinfeld half-spaces in
Layer 6.

Not statable at the pins, by headline theorem and missing carrier:

* the fundamental diagrams of affinoid, proper, overconvergent and Stein curves (README §§3.5,
  4.1, 4.2, 4.7), the Kummer regulator `Symb_ℓ(Y) ≅ H¹_ét(Y, ℤ_ℓ(1))` (§2.4), the ℓ-adic,
  de Rham and Hyodo–Kato filtrations and the Weil–Deligne similarity (§§2.5, 3.2, 4.3, 4.6):
  Tau Ceti has the category `TauCeti.AdicSpace` of adic spaces, but neither library has the
  étale or pro-étale site or cohomology of an adic space, the de Rham cohomology of a rigid
  curve, Hyodo–Kato cohomology, or `B_cris^+` and `B_st^+` (Mathlib has `BDeRhamPlus` only);
* the period isomorphism `Ĵ ≅ X^1_st(H¹_HK(X))` and its integration form (§§4.8–4.9): Jacobians
  of curves and universal vector extensions are missing;
* the `G_K`-equivariant fundamental diagram of a semistable Stein weak formal scheme (§5.5):
  weak formal schemes, dagger spaces and syntomic cohomology are missing (Tau Ceti has dagger
  algebras only);
* the cohomology of the Drinfeld half-space `Ω^d` as duals of generalized Steinberg
  representations in every coefficient theory, integral `p`-adic étale cohomology and Dat's
  compactly supported ℓ-adic complex (§§6.2, 6.4, 6.5, 6.9, 6.10): the rigid space `Ω^d` and its
  cohomology are missing;
* the connected components of the Lubin–Tate and Drinfeld towers, the equivariant semistable
  models of the rank-two Drinfeld levels, the Hyodo–Kato and de Rham multiplicities, the
  multiplicity diagram, the finite copresentation of mod `p^k` cohomology and the
  non-admissibility for `F ≠ ℚ_p` (§§7.1, 7.2, 7.4, 7.5, 7.7, 7.8): Lubin–Tate and Drinfeld
  spaces, their cohomology and the Jacquet–Langlands and Langlands correspondences are missing.
-/

namespace TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers

open TauCeti
open scoped LinearAlgebra.Projectivization Matrix

/-! ## Layer 0: Graphs with legs and generalized Steinberg representations -/

/-- The left translation representation of a topological group `G` on the `A`-valued locally
constant functions on `G ⧸ H`: `(g · f)(x) = f(g⁻¹ x)` (README §0.3). -/
noncomputable def translation (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (H : Subgroup G) (A : Type*) [CommRing A] :
    Representation A G (LocallyConstant (G ⧸ H) A) where
  toFun g := LocallyConstant.comapₗ A ⟨fun x => g⁻¹ • x, continuous_const_smul _⟩
  map_one' := by
    ext f x
    simp
  map_mul' g g' := by
    ext f x
    simp [mul_smul]

/-- The relation submodule of `LC(G/P_J, A)`, `G = GL_{d+1}(K)` and `P_J` the standard parabolic
of the standard Tits system of `G` attached to a set `J` of simple reflections: the sum, over the
simple reflections `s ∉ J`, of the functions pulled back along `G/P_J → G/P_{J ∪ {s}}`
(CDN-STEIN §5.2.1, README §0.3). -/
noncomputable def steinbergRelations (K : Type*) [Field K] [Nontrivial Kˣ] [TopologicalSpace K]
    [IsTopologicalRing K] (A : Type*) [CommRing A] (d : ℕ) (J : Set (glTitsSystem K d).simple) :
    Submodule A
      (LocallyConstant (GL (Fin (d + 1)) K ⧸ (glTitsSystem K d).standardParabolic J) A) :=
  ⨆ (s : (glTitsSystem K d).simple) (_ : s ∉ J), LinearMap.range (LocallyConstant.comapₗ A
    ⟨Subgroup.quotientMapOfLE
        ((glTitsSystem K d).standardParabolic_monotone (Set.subset_insert s J)),
      (QuotientGroup.isQuotientMap_mk _).continuous_iff.2 QuotientGroup.continuous_mk⟩)

/-- The relation submodule `Σ_{s ∉ J} LC(G/P_{J ∪ {s}}, A)` of `LC(G/P_J, A)` is stable under the
translation action of every `g ∈ GL_{d+1}(K)`: translating a function pulled back from
`G/P_{J ∪ {s}}` gives the pullback of its translate, the projection being `G`-equivariant. This is
the invariance needed to form the quotient representation `generalizedSteinberg` (README §0.3). -/
theorem steinbergRelations_le_comap (K : Type*) [Field K] [Nontrivial Kˣ] [TopologicalSpace K]
    [IsTopologicalRing K] (A : Type*) [CommRing A] (d : ℕ) (J : Set (glTitsSystem K d).simple)
    (g : GL (Fin (d + 1)) K) :
    steinbergRelations K A d J ≤ (steinbergRelations K A d J).comap
      (translation (GL (Fin (d + 1)) K) ((glTitsSystem K d).standardParabolic J) A g) := by
  refine iSup₂_le fun s hs => ?_
  rintro _ ⟨f, rfl⟩
  refine Submodule.mem_comap.2 (Submodule.mem_iSup_of_mem s (Submodule.mem_iSup_of_mem hs
    ⟨translation (GL (Fin (d + 1)) K) ((glTitsSystem K d).standardParabolic (insert s J)) A g f,
      ?_⟩))
  ext x
  induction x using QuotientGroup.induction_on
  simp [translation, Subgroup.quotientMapOfLE_apply_mk, MulAction.Quotient.smul_mk]

/-- The generalized Steinberg representation `Sp_J(A) = LC(G/P_J, A) / Σ_{s ∉ J} LC(G/P_{J∪{s}}, A)`
of `G = GL_{d+1}(K)` with coefficients in `A`, `G` acting by left translation, `P_J` the standard
parabolic subgroup of the standard Tits system of `G` attached to the set `J` of simple
reflections (CDN-STEIN §5.2.1, README §0.3). For `J = ∅` it is the Steinberg representation, for
`J` all simple reflections it is `A` with the trivial action. -/
noncomputable def generalizedSteinberg (K : Type*) [Field K] [Nontrivial Kˣ] [TopologicalSpace K]
    [IsTopologicalRing K] (A : Type*) [CommRing A] (d : ℕ) (J : Set (glTitsSystem K d).simple) :
    Representation A (GL (Fin (d + 1)) K)
      (LocallyConstant (GL (Fin (d + 1)) K ⧸ (glTitsSystem K d).standardParabolic J) A ⧸
        steinbergRelations K A d J) :=
  (translation (GL (Fin (d + 1)) K) ((glTitsSystem K d).standardParabolic J) A).quotient
    (steinbergRelations K A d J) (steinbergRelations_le_comap K A d J)

/-- **Irreducibility of the generalized Steinberg representations** (README §0.4(a);
CDN-STEIN Proposition 5.1, after Casselman in characteristic `0`, Borel–Wallach, Chapter X,
Theorem 4.11, extended from `ℂ` to every field of characteristic `0` by base change of the
Hecke modules of invariants, and Grosse-Klönne, GK14 Corollaries 4.3–4.4, in characteristic `p`).
Let `K` be a finite extension of `ℚ_p` with its absolute value and `A` a field of characteristic
`0` or `p`. Then for every `d` and every set `J` of simple reflections of the standard Tits
system of `GL_{d+1}(K)`, `Sp_J(A)` is an irreducible representation of `GL_{d+1}(K)`. The
instance `Nontrivial Kˣ`, which the Tits system requires, holds for every such `K`: it has
characteristic `0`, so `-1 ≠ 1`. -/
theorem generalizedSteinberg_isIrreducible (p : ℕ) [Fact p.Prime] (K : Type*)
    [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [Nontrivial Kˣ] (A : Type*) [Field A] (hA : CharZero A ∨ CharP A p) (d : ℕ)
    (J : Set (glTitsSystem K d).simple) :
    (generalizedSteinberg K A d J).IsIrreducible := by
  sorry

/-- **The generalized Steinberg representations are pairwise non-isomorphic** (README §0.4(a);
GK14 Corollary 4.4(a); CDN-STEIN Proposition 5.1, where it is part of the multiplicity-one
statement). Let `K` be a finite extension of `ℚ_p` and `A` a field of characteristic `0` or `p`.
Two generalized Steinberg representations `Sp_J(A)` and `Sp_{J′}(A)` of `GL_{d+1}(K)` are
isomorphic exactly when `J = J′`. For `d = 1` it separates the trivial representation `Sp_{{s}}(A)`
from the Steinberg representation `Sp_∅(A)`, which a construction assigning the trivial
representation to every `J` would not. -/
theorem nonempty_equiv_generalizedSteinberg_iff (p : ℕ) [Fact p.Prime] (K : Type*)
    [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [Nontrivial Kˣ] (A : Type*) [Field A] (hA : CharZero A ∨ CharP A p) (d : ℕ)
    (J J' : Set (glTitsSystem K d).simple) :
    Nonempty ((generalizedSteinberg K A d J).Equiv (generalizedSteinberg K A d J')) ↔ J = J' := by
  sorry

/-- **Multiplicity one** (README §0.4(a); CDN-STEIN Proposition 5.1; GK14 Corollary 4.4(b) in
characteristic `p`). Let `K` be a finite extension of `ℚ_p`, `A` a field of characteristic `0` or
`p` and `G = GL_{d+1}(K)`. The module `LC(G/B, A)` over the group algebra `A[G]`, `B` the upper
triangular group, has a composition series of length `2^d` in which every `Sp_J(A)` occurs as a
factor exactly once. With `nonempty_equiv_generalizedSteinberg_iff`, the `2^d` labels `J` occupy
`2^d` distinct places of the series, so the `Sp_J(A)` are all the constituents of `LC(G/B, A)`.
For `d = 1` the series is `0 ⊂ A ⊂ LC(ℙ¹(K), A)`. -/
theorem exists_compositionSeries_generalizedSteinberg_multiplicity_eq_one (p : ℕ) [Fact p.Prime]
    (K : Type*) [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [Nontrivial Kˣ] (A : Type*) [Field A] (hA : CharZero A ∨ CharP A p) (d : ℕ) :
    ∃ s : CompositionSeries (Submodule (MonoidAlgebra A (GL (Fin (d + 1)) K))
        (translation (GL (Fin (d + 1)) K) ((glTitsSystem K d).standardParabolic ∅) A).asModule),
      s.head = ⊥ ∧ s.last = ⊤ ∧ s.length = 2 ^ d ∧
        ∀ J : Set (glTitsSystem K d).simple,
          compositionMultiplicity s (generalizedSteinberg K A d J).asModule = 1 := by
  sorry

/-- The translation representation of `GL_{d+1}(K)` on the `ℤ`-valued locally constant functions
on `(r+1)`-tuples of `K`-rational hyperplanes of `K^{d+1}` (README §0.5). A hyperplane is the class
`[a] ∈ ℙ(K^{d+1})` of a nonzero row vector `a`, with equation `x ↦ ∑ᵢ aᵢ xᵢ`. The element `g`
sends the hyperplane `ker a` to `g(ker a) = ker (a g⁻¹)`, so that
`(g · f)(H₀, …, H_r) = f(H₀ g, …, H_r g)` with `[a] g = [a g]`. -/
noncomputable def hyperplaneTranslation (K : Type*) [Field K] [TopologicalSpace K]
    [IsTopologicalRing K] (d r : ℕ) :
    Representation ℤ (GL (Fin (d + 1)) K)
      (LocallyConstant (Fin (r + 1) → ℙ K (Fin (d + 1) → K)) ℤ) where
  toFun g :=
    have hg : Function.Injective (Matrix.vecMulLinear (g : Matrix (Fin (d + 1)) (Fin (d + 1)) K)) :=
      Matrix.vecMul_injective_of_isUnit g.isUnit
    LocallyConstant.comapₗ ℤ ⟨fun H i => (H i).map _ hg, continuous_pi fun i =>
      (Projectivization.continuous_map hg (continuous_id.matrix_vecMul continuous_const)).comp
        (continuous_apply i)⟩
  map_one' := by
    ext f H
    show f _ = f H
    congr 1
    funext i
    dsimp only [ContinuousMap.coe_mk]
    induction H i using Projectivization.ind with
    | h v hv =>
      simp only [Projectivization.map_mk, Matrix.vecMulLinear_apply, Units.val_one,
        Matrix.vecMul_one]
  map_mul' g g' := by
    ext f H
    show f _ = f _
    congr 1
    funext i
    dsimp only [ContinuousMap.coe_mk]
    induction H i using Projectivization.ind with
    | h v hv =>
      show Projectivization.mk K _ _ = Projectivization.mk K _ _
      congr 1
      simp only [Matrix.vecMulLinear_apply, Units.val_mul, Matrix.vecMul_vecMul]

/-- The Iovita–Spiess cocycles `LC_c(𝓗^{r+1}, ℤ)` as a subrepresentation of
`hyperplaneTranslation`: the locally constant `f` on `(r+1)`-tuples of `K`-rational hyperplanes
with `∑_{i=0}^{r+1} (-1)^i f(H₀, …, Ĥᵢ, …, H_{r+1}) = 0` for all `H₀, …, H_{r+1}`, and
`f(H₀, …, H_r) = 0` whenever the equations of `H₀, …, H_r` are linearly dependent (CDN-STEIN
§5.4.1, lines 2046–2049; README §0.5). Both conditions are preserved by `g`, which permutes the
tuples compatibly with omitting an entry and preserves linear dependence. -/
noncomputable def hyperplaneCocycles (K : Type*) [Field K] [TopologicalSpace K]
    [IsTopologicalRing K] (d r : ℕ) : Subrepresentation (hyperplaneTranslation K d r) where
  toSubmodule :=
    { carrier := {f | (∀ H : Fin (r + 2) → ℙ K (Fin (d + 1) → K),
          ∑ i : Fin (r + 2), (-1 : ℤ) ^ (i : ℕ) * f (H ∘ Fin.succAbove i) = 0) ∧
        ∀ H : Fin (r + 1) → ℙ K (Fin (d + 1) → K), ¬ Projectivization.Independent H → f H = 0}
      add_mem' := by
        intro f g hf hg
        simp only [Set.mem_ofPred_eq] at hf hg ⊢
        refine ⟨fun H => ?_, fun H hH => ?_⟩
        · simp only [LocallyConstant.coe_add, Pi.add_apply, mul_add, Finset.sum_add_distrib,
            hf.1 H, hg.1 H, add_zero]
        · simp only [LocallyConstant.coe_add, Pi.add_apply, hf.2 H hH, hg.2 H hH, add_zero]
      zero_mem' := by
        simp only [Set.mem_ofPred_eq]
        exact ⟨fun H => by simp, fun H _ => rfl⟩
      smul_mem' := by
        intro c f hf
        simp only [Set.mem_ofPred_eq] at hf ⊢
        refine ⟨fun H => ?_, fun H hH => ?_⟩
        · calc ∑ i : Fin (r + 2), (-1 : ℤ) ^ (i : ℕ) * (c • f) (H ∘ Fin.succAbove i)
              = c * ∑ i : Fin (r + 2), (-1 : ℤ) ^ (i : ℕ) * f (H ∘ Fin.succAbove i) := by
                rw [Finset.mul_sum]
                refine Finset.sum_congr rfl fun i _ => ?_
                simp only [LocallyConstant.coe_smul, Pi.smul_apply, smul_eq_mul]
                ring
            _ = 0 := by rw [hf.1 H, mul_zero]
        · simp [hf.2 H hH] }
  apply_mem_toSubmodule g f hf := by
    obtain ⟨hc, hv⟩ := hf
    have hg : Function.Injective (Matrix.vecMulLinear (g : Matrix (Fin (d + 1)) (Fin (d + 1)) K)) :=
      Matrix.vecMul_injective_of_isUnit g.isUnit
    have key : ∀ x, hyperplaneTranslation K d r g f x = f (fun j => (x j).map _ hg) :=
      fun x => rfl
    refine ⟨fun H => ?_, fun H hH => ?_⟩
    · simp only [key]
      exact hc (fun j => (H j).map _ hg)
    rw [key]
    refine hv _ ?_
    rw [← Projectivization.dependent_iff_not_independent] at hH ⊢
    obtain ⟨v, hv0, hdep⟩ := hH
    exact Projectivization.Dependent.mk
      (fun j => v j ᵥ* (g : Matrix (Fin (d + 1)) (Fin (d + 1)) K))
      (fun j h => hv0 j (by
        have := congrArg (· ᵥ* ((g⁻¹ : GL (Fin (d + 1)) K) : Matrix (Fin (d + 1)) (Fin (d + 1)) K)) h
        simpa only [Matrix.vecMul_vecMul, Units.mul_inv, Matrix.vecMul_one,
          Matrix.zero_vecMul] using this))
      (fun hli => hdep (LinearIndependent.of_comp
        (Matrix.vecMulLinear (g : Matrix (Fin (d + 1)) (Fin (d + 1)) K)) hli))

/-- **The Schneider–Stuhler and Iovita–Spiess presentation of `Sp_r(ℤ)`** (README §0.5;
CDN-STEIN Proposition 5.6 and §5.4.1, line 2054, after Schneider–Stuhler, SS91, and
Iovita–Spiess, IS01). Let `K` be a finite extension of `ℚ_p` and `0 ≤ r ≤ d`. Then
`Sp_r(ℤ) = Sp_{{1,…,d−r}}(ℤ)`, the generalized Steinberg representation of `GL_{d+1}(K)` whose
set `J` consists of the simple reflections of index `i` with `i + r < d` (the reflections
`s_1, …, s_{d−r}` of README §0.3, indexed from `0`), is isomorphic as a representation of
`GL_{d+1}(K)` to the cocycles `hyperplaneCocycles K d r`. For `r = 0` both sides are `ℤ` with the
trivial action; for `d = r = 1` both are `LC(ℙ¹(K), ℤ)/ℤ`, a cocycle being `φ(H₁) − φ(H₀)`. The
bound `r ≤ d` is needed: for `r > d` the set `J` is empty and the left side is the Steinberg
representation, while every `r + 1 > d + 1` equations are dependent and the right side is `0`. -/
theorem nonempty_equiv_hyperplaneCocycles (p : ℕ) [Fact p.Prime] (K : Type*)
    [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [Nontrivial Kˣ] (d r : ℕ) (hr : r ≤ d) :
    Nonempty ((generalizedSteinberg K ℤ d
      {s | ∃ i : Fin d, (i : ℕ) + r < d ∧ (s : (glTitsSystem K d).WeylGroup) =
        (QuotientGroup.mk (glTitsSystemSimpleRep K d i) : (glTitsSystem K d).WeylGroup)}).Equiv
      (hyperplaneCocycles K d r).toRepresentation) := by
  sorry

end TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers
