import Mathlib
import TauCeti.AlgebraicTopology.SimplicialSet.WeakEquivalence
import TauCeti.Topology.Homotopy.HurewiczFibration.Basic
import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.Basic
import TauCeti.AlgebraicTopology.Homotopy.Relative.Basic
import TauCeti.Topology.Category.TopPair

/-!
# Generalized cohomology, spectra and orientations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, and is
the acceptance test of the finished roadmap.

Statable at the pins, and stated below:

* the Kan–Quillen model structure on simplicial sets (G2.1), with Mathlib's cofibrations and
  fibrations `SSet.modelCategoryQuillen.I` and `J` and Tau Ceti's realization weak equivalences
  `SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences`;
* the unit half of the Quillen equivalence of realization and `Sing` (G2.1), on Mathlib's
  `sSetTopAdj`; the counit half is CharacteristicClasses C1.2b's;
* homotopy excision for a CW complex that is the union of two subcomplexes (G2.5), on Tau Ceti's
  relative homotopy sets `TauCeti.RelHomotopyGroup` of the based pairs `TauCeti.BasedTopPair`
  of nested subsets `TopPair.ofInclusion`, and Mathlib's `Topology.RelCWComplex.Subcomplex`;
* the Hurewicz–Dold theorem for numerable locally trivial maps (G2.10), on Tau Ceti's
  `TauCeti.IsHurewiczFibration` and Mathlib's `Bundle.Trivialization` and `PartitionOfUnity`;
* the comparison theorem for extraordinary homology theories on CW complexes (G3.3), on Mathlib's
  `TopPair.HomologyPretheory` and `Topology.CWComplex`; the cohomological comparison theorem is its
  instance `C := Dᵒᵖ`, since a `ℤ`-graded cohomology theory valued in an abelian category `D` is an
  extraordinary Eilenberg–Steenrod homology pretheory valued in `Dᵒᵖ`, whose boundary for
  `c.Rel i (i - 1)` is the connecting map `h^(i-1)(A) → h^i(X, A)` and whose additivity is the
  product axiom;
* Serre's theorem that the positive stable stems are torsion (G5.6), on Mathlib's
  `HomotopyGroup` of Euclidean spheres in the Freudenthal stable range;
* the unstable rational Hurewicz theorem (G5.6), on Tau Ceti's `HomotopyGroup.hurewiczHom`.

Headline theorems of the roadmap that are not statable at the pins, with the missing carrier:

* the stable model structure on symmetric spectra and the stable homotopy category (G2.3,
  G2.4): Tau Ceti has `TauCeti.SymmetricSpectrum` with its point-set smash product, but no
  stable equivalences;
* the Freudenthal suspension theorem (G2.5): there is no topological reduced suspension of
  pointed spaces and no suspension homomorphism on homotopy groups;
* the Quillen equivalence of symmetric and sequential spectra (G2.5): there are no sequential
  spectra;
* Brown representability (G3.1): Tau Ceti has the pointed homotopy category
  `TauCeti.PointedHomotopyCat` and the wedge sum `TauCeti.WedgeSum`, but no CW structure on a
  wedge of CW complexes other than a wedge of circles, so the wedge axiom on connected pointed
  CW complexes is not statable without an ad hoc encoding;
* the Milnor sequence `0 → lim¹ E^(q-1)(X_i) → E^q(X) → lim E^q(X_i) → 0` (G3.4): Tau Ceti has
  `lim` and `lim¹` of towers of modules (`TauCeti.ModuleTower.lim`, `TauCeti.ModuleTower.limOne`),
  but there is no mapping telescope of a sequence of spaces and hence no Milnor connecting map
  `lim¹ E^(q-1)(X_i) → E^q(X)`; asserting only an abstract isomorphism of the kernel of restriction
  with `lim¹` would drop that natural map, so nothing is stated;
* the Leray–Hirsch and Thom isomorphisms (G4.1, G4.3): Mathlib's homology pretheories carry no
  product (no cross or cup product on a theory, so no module structure over the base and no
  `E`-orientation); Tau Ceti's Thom pairs `TauCeti.thomPair` and Thom classes
  `TauCeti.IsThomClass` are for singular cohomology only, and there are no Thom spaces of vector
  bundles;
* Spanier–Whitehead duality (G5.1) and the stable rational Hurewicz isomorphism
  `π_n E ⊗ ℚ ≅ H_n(E; ℚ)` (G5.6): there is no stable homotopy category.
-/

open CategoryTheory HomotopicalAlgebra

open scoped SSet.modelCategoryQuillen

universe u w

namespace TauCetiRoadmap.GeneralizedCohomology

/-! ## Layer 2: a concrete spectral model and represented theories -/

/-- **The Kan–Quillen model structure.** The monomorphisms (Mathlib's cofibrations, generated
by the boundary inclusions `SSet.modelCategoryQuillen.I`), the Kan fibrations (Mathlib's
fibrations, the maps with the right lifting property against the horn inclusions
`SSet.modelCategoryQuillen.J`) and the maps whose geometric realization is a weak homotopy
equivalence (Tau Ceti's scoped weak equivalences) are the three classes of a model structure on
simplicial sets (Quillen, *Homotopical Algebra*, Chapter II, Section 3). README G2.1. -/
theorem kanQuillen_modelCategory :
    ∃ M : ModelCategory SSet.{u},
      M.categoryWithWeakEquivalences =
          SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences ∧
        M.categoryWithFibrations = (inferInstance : CategoryWithFibrations SSet.{u}) ∧
        M.categoryWithCofibrations = (inferInstance : CategoryWithCofibrations SSet.{u}) := by
  sorry

/-- **Realization and `Sing` form a Quillen equivalence: the unit.** For every simplicial set
`X` the unit `X → Sing |X|` of Mathlib's adjunction `sSetTopAdj` is a Kan–Quillen weak
equivalence. Every simplicial set is cofibrant, every space is fibrant for the Serre model
structure and realization detects weak equivalences by their definition, so this and the counit
theorem of CharacteristicClasses C1.2b (`|Sing Y| → Y` is a weak homotopy equivalence) make
the adjunction a Quillen equivalence (Quillen, *Homotopical Algebra*, Chapter II, Section 3).
The route is the triangle identity `ε_|X| ∘ |η_X| = id`, the counit theorem at `|X|` and two out
of three. README G2.1. -/
theorem sSetTopAdj_unit_weakEquivalence (X : SSet.{u}) :
    WeakEquivalence (sSetTopAdj.unit.app X) := by
  sorry

/-- The based pair `(t, s, a)` of nested subsets `s ⊆ t` of a space, based at a point `a ∈ s`:
Tau Ceti's topological pair `TopPair.ofInclusion` of the inclusion `s ↪ t` with its basepoint.
Its relative homotopy set `TauCeti.RelHomotopyGroup (Fin i)` is `π_(i+1)(t, s, a)`. README
G2.5. -/
abbrev subsetPair {X : TopCat.{u}} {s t : Set X} (hst : s ⊆ t) (a : s) :
    TauCeti.BasedTopPair.{u} :=
  ⟨TopPair.ofInclusion hst, a⟩

/-- The inclusion of based pairs `(t, s, a) → (t', s', a)` for `s ⊆ s'` and `t ⊆ t'`, Tau
Ceti's `TopPair.ofInclusionMap` of the inclusion `t ↪ t'`. README G2.5. -/
def subsetPairInclusion {X : TopCat.{u}} {s t s' t' : Set X} (hst : s ⊆ t) (hst' : s' ⊆ t')
    (hs : s ⊆ s') (ht : t ⊆ t') (a : s) :
    subsetPair hst a ⟶ subsetPair hst' ⟨a, hs a.2⟩ where
  toTopPairHom := TopPair.ofInclusionMap hst hst' (ContinuousMap.inclusion ht) fun _ hx ↦ hs hx
  map_basepoint := rfl

/-- **`m`-connected pairs.** The pair `(t, s)` of nested subsets `s ⊆ t` is `m`-connected in
Hatcher's sense (*Algebraic Topology*, Section 4.1, p. 346): every point of `t` is joined by a
path in `t` to a point of `s`, and the relative homotopy set `π_(i+1)(t, s, a)` is trivial for
`i + 1 ≤ m` at every basepoint `a ∈ s`. For `m = 0` only the path condition is imposed, which is
Hatcher's condition in degree `0`, where no relative `π₀` is defined. README G2.5. -/
def IsConnectedPair {X : TopCat.{u}} {s t : Set X} (hst : s ⊆ t) (m : ℕ) : Prop :=
  (∀ x ∈ t, ∃ a ∈ s, JoinedIn t x a) ∧
    ∀ (a : s) (i : ℕ), i + 1 ≤ m →
      Subsingleton (TauCeti.RelHomotopyGroup (Fin i) (subsetPair hst a))

/-- **Homotopy excision.** Let `X` be a CW complex that is the union of subcomplexes `A` and `B`
whose intersection `C = A ∩ B` is nonempty and connected. If `(A, C)` is `m`-connected and
`(B, C)` is `n`-connected, then at every basepoint `c ∈ C` the inclusion of pairs
`(A, C) → (X, B)`, with `X` read as `Set.univ`, induces a bijection
`π_(i+1)(A, C, c) → π_(i+1)(X, B, c)` for `i + 1 < m + n` and a surjection for `i + 1 = m + n`
(Hatcher, *Algebraic Topology*, Theorem 4.23, p. 360). For `m = n = 0` nothing is asserted.
Applied to the two cones of a suspension it gives the Freudenthal suspension theorem (Hatcher,
Corollary 4.24), which needs a suspension the pins lack. README G2.5. -/
theorem homotopyExcision {X : TopCat.{u}} [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    (A B : Topology.RelCWComplex.Subcomplex (Set.univ : Set X))
    (hAB : (A : Set X) ∪ B = Set.univ) (hC : IsConnected ((A : Set X) ∩ B)) (m n : ℕ)
    (hA : IsConnectedPair (Set.inter_subset_left : (A : Set X) ∩ B ⊆ A) m)
    (hB : IsConnectedPair (Set.inter_subset_right : (A : Set X) ∩ B ⊆ B) n)
    (c : ((A : Set X) ∩ B : Set X)) (i : ℕ) :
    (i + 1 < m + n → Function.Bijective (TauCeti.RelHomotopyGroup.map (N := Fin i)
      (subsetPairInclusion Set.inter_subset_left (Set.subset_univ (B : Set X))
        Set.inter_subset_right (Set.subset_univ _) c))) ∧
    (i + 1 = m + n → Function.Surjective (TauCeti.RelHomotopyGroup.map (N := Fin i)
      (subsetPairInclusion Set.inter_subset_left (Set.subset_univ (B : Set X))
        Set.inter_subset_right (Set.subset_univ _) c))) := by
  sorry

/-- **Hurewicz–Dold theorem for numerable locally trivial maps.** A map `p : Z → B` that is
trivial, with fibre `F`, over the base sets of a family of local trivializations admitting a
subordinate partition of unity is a Hurewicz fibration, for test spaces in every universe. The
sets where the partition functions are positive form a numerable open cover over each member of
which `p` is a product projection, and a map that is a fibration over every member of a numerable
open cover is a fibration (May, *A Concise Course in Algebraic Topology*, Chapter 7, Section 4,
Theorem, p. 51). README G2.10. -/
theorem numerableFiberBundle_hurewicz {B F Z : Type*} [TopologicalSpace B]
    [TopologicalSpace F] [TopologicalSpace Z] {p : Z → B} {ι : Type*}
    (t : ι → Bundle.Trivialization F p) (ρ : PartitionOfUnity ι B)
    (hρ : ρ.IsSubordinate fun i ↦ (t i).baseSet) :
    TauCeti.IsHurewiczFibration.{w} p := by
  sorry

/-! ## Layer 3: Brown representation, arbitrary CW and infinite comparisons -/

/-- **Comparison theorem for homology theories.** A morphism of extraordinary
Eilenberg–Steenrod homology theories, `ℤ`-graded and valued in an abelian category, that is an
isomorphism on a point in every degree is an isomorphism on every CW complex, of arbitrary
dimension and with an arbitrary set of cells. The finite-dimensional case is induction on
skeleta with excision and the five lemma; the infinite-dimensional case uses the additivity
axiom and the mapping telescope of the skeleta (Hatcher, *Algebraic Topology*, Proposition
3.17, p. 217, stated there for cohomology; the homology proof is the same). The Hausdorff
hypothesis makes Mathlib's `Topology.CWComplex` structure a CW complex in Hatcher's sense.
README G3.3. -/
theorem homologyComparison {C : Type*} [Category C] [Abelian C]
    {HP HP' : TopPair.HomologyPretheory.{u} C (ComplexShape.down ℤ)}
    [HP.IsExtraordinaryEilenbergSteenrod] [HP'.IsExtraordinaryEilenbergSteenrod]
    (f : HP ⟶ HP') (hpt : ∀ i, IsIso ((f.hom i).app (TopCat.of PUnit.{u + 1})))
    (X : TopCat.{u}) [T2Space X] [Topology.CWComplex (Set.univ : Set X)] (i : ℤ) :
    IsIso ((f.hom i).app X) := by
  sorry

/-! ## Layer 5: finite duality, Thom spectra and rational Hurewicz -/

/-- **Serre's theorem: the positive stable stems are torsion.** In the Freudenthal stable range
`k ≥ n + 3`, the group `π_(k+n+1)(Sᵏ)` is the stable stem `π_(n+1) S`, and every element of it
has finite order; equivalently `π_m S ⊗ ℚ = 0` for `m > 0`. The route is the torsion Serre-class
Hurewicz theorem and the rational cohomology of `K(ℤ, k)`; Hatcher proves the stronger
finiteness of `π_i(Sⁿ)` for `i > n` outside `π_(4m-1)(S^(2m))`, which lies outside this range
(Hatcher, *Spectral Sequences in Algebraic Topology*, Theorem 1.21, p. 32). README G5.6. -/
theorem stableStem_isOfFinOrder (n k : ℕ) (hk : n + 3 ≤ k)
    (x : Metric.sphere (0 : EuclideanSpace ℝ (Fin (k + 1))) 1)
    (a : HomotopyGroup (Fin (k + n + 1)) (Metric.sphere (0 : EuclideanSpace ℝ (Fin (k + 1))) 1) x) :
    IsOfFinOrder a := by
  sorry

/-- **Unstable rational Hurewicz theorem.** Let `X` be a pointed space with `π_j(X, x)` trivial
for `j < k` (so `X` is `(k - 1)`-connected, and path connected when `k ≥ 1`). The Hurewicz map
`π_(n+1)(X, x) → H_(n+1)(X; ℚ)` is a rational isomorphism in degrees `n + 1 ≤ 2k - 2`: its
kernel consists of elements of finite order and its image spans the rational homology; and it is
rationally surjective in degree `2k - 1`. For `k = 1` only the degree-one surjectivity is
asserted, and for `k = 0` nothing, since `2 * 0 - 1 = 0` in `ℕ`. The route is Freudenthal and
the stable rational Hurewicz isomorphism, after CW approximation (Hatcher, *Spectral Sequences in
Algebraic Topology*, Proposition 1.22, p. 34, for the stable isomorphism, and Hatcher,
*Algebraic Topology*, Corollary 4.24, p. 360, for the Freudenthal range). README G5.6. -/
theorem rationalHurewicz {X : Type} [TopologicalSpace X] (x : X) (k : ℕ)
    (hconn : ∀ j < k, Subsingleton (HomotopyGroup (Fin j) X x)) (n : ℕ) :
    (n + 1 ≤ 2 * k - 2 → ∀ a,
        HomotopyGroup.hurewiczHom (X := X) (x := x) (C := ModuleCat.{0} ℚ) (ModuleCat.of ℚ ℚ) n a
          = 0 → IsOfFinAddOrder a) ∧
      (n + 1 ≤ 2 * k - 1 →
        Submodule.span ℚ (Set.range (HomotopyGroup.hurewiczHom (X := X) (x := x)
          (C := ModuleCat.{0} ℚ) (ModuleCat.of ℚ ℚ) n)) = ⊤) := by
  sorry

end TauCetiRoadmap.GeneralizedCohomology
