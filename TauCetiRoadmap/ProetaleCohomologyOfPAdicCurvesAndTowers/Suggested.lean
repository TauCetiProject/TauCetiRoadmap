module

import Mathlib
import TauCeti.GroupTheory.TitsSystem.Parabolic.Basic
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.TitsSystem

/-!
# Pro-étale cohomology of p-adic curves, Drinfeld half-spaces and the rank-two Drinfeld tower: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions their statements need.

Stated here: the irreducibility of the generalized Steinberg representations `Sp_J(A)` of
`GL_{d+1}(K)`, `K/ℚ_p` finite, over a coefficient field `A` of characteristic `0` or `p`
(README §0.4(a)). The representations are the quotients of the locally constant functions on
`GL_{d+1}(K)/P_J` by the functions pulled back from the larger flag varieties (README §0.3). The
standard parabolic subgroups `P_J = B W_J B` are Tau Ceti's `TauCeti.TitsSystem.standardParabolic`
of the standard Tits system `TauCeti.glTitsSystem` of `GL_{d+1}(K)` (upper triangular `B`,
simple reflections the adjacent transpositions), indexed by sets `J` of its simple reflections;
this file defines the translation representation, the relation submodule and the quotient
representation. These are the coefficients of every cohomology computation of the Drinfeld
half-spaces in Layer 6.

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

end TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers
