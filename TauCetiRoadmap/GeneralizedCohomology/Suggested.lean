import Mathlib
import TauCeti.Topology.Homotopy.HurewiczFibration.Basic
import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.Basic

/-!
# Generalized cohomology, spectra and orientations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, and is
the acceptance test of the finished roadmap.

Statable at the pins, and stated below:

* the Hurewicz–Dold theorem for numerable locally trivial maps (G2.10), on Tau Ceti's
  `TauCeti.IsHurewiczFibration` and Mathlib's `Bundle.Trivialization` and `PartitionOfUnity`;
* the comparison theorem for extraordinary homology theories on CW complexes (G3.3, homology
  form), on Mathlib's `TopPair.HomologyPretheory` and `Topology.CWComplex`;
* Serre's theorem that the positive stable stems are torsion (G5.6), on Mathlib's
  `HomotopyGroup` of Euclidean spheres in the Freudenthal stable range;
* the unstable rational Hurewicz theorem (G5.6), on Tau Ceti's `HomotopyGroup.hurewiczHom`.

Headline theorems of the roadmap that are not statable at the pins, with the missing carrier:

* the Kan–Quillen model structure on simplicial sets and the Quillen equivalence of
  realization and `Sing` (G2.1): Mathlib has the generating classes
  `SSet.modelCategoryQuillen.I` and `J` with their cofibrations and fibrations, but no class of
  weak equivalences of simplicial sets and no `ModelCategory SSet`;
* the stable model structure on symmetric spectra and the stable homotopy category (G2.3,
  G2.4): Tau Ceti has `TauCeti.SymmetricSpectrum` with its point-set smash product, but no
  stable equivalences;
* the Freudenthal suspension theorem and homotopy excision (G2.5): there is no topological
  reduced suspension of pointed spaces and no suspension homomorphism on homotopy groups;
* the Quillen equivalence of symmetric and sequential spectra (G2.5): there are no sequential
  spectra;
* Brown representability (G3.1): Tau Ceti has the pointed homotopy category
  `TauCeti.PointedHomotopyCat` of all based spaces and the wedge sum `TauCeti.WedgeSum`, but no
  CW structure on a wedge of CW complexes other than a wedge of circles, so a wedge of connected
  pointed CW complexes cannot be exhibited as an object of the full subcategory of connected
  pointed CW complexes, and the wedge and Mayer–Vietoris axioms, which quantify over such wedges
  and over subcomplex triads, are not statable without an ad hoc encoding;
* the cohomological comparison theorem (G3.3) and the Milnor sequence (G3.4): Mathlib has
  homology pretheories only, and no cohomology theory;
* the Leray–Hirsch and Thom isomorphisms (G4.1, G4.3), Spanier–Whitehead duality (G5.1) and the
  stable rational Hurewicz isomorphism `π_n E ⊗ ℚ ≅ H_n(E; ℚ)` (G5.6): there is no stable
  homotopy category and no generalized cohomology theory represented by a spectrum.
-/

open CategoryTheory

universe u w

namespace TauCetiRoadmap.GeneralizedCohomology

/-! ## Layer 2: a concrete spectral model and represented theories -/

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
for `j < k` (so `X` is path connected, and `(k - 1)`-connected). The Hurewicz map
`π_(n+1)(X, x) → H_(n+1)(X; ℚ)` is a rational isomorphism in degrees `n + 1 ≤ 2k - 2`: its
kernel consists of elements of finite order and its image spans the rational homology; and it is
rationally surjective in degree `2k - 1`. For `k ≤ 1` only the degree-one surjectivity is
asserted. The route is Freudenthal and the stable rational Hurewicz isomorphism, after CW
approximation. README G5.6. -/
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
