import Mathlib
import TauCeti.QuantumGroups.QuantumInteger.Chebyshev
import TauCeti.Combinatorics.PlanarMatching.Basic
import TauCeti.Algebra.TemperleyLieb.Trace
import TauCeti.Algebra.Cellular.Basic

/-!
# Temperley–Lieb diagrams, categories and algebras: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, each with `sorry`, the
roadmap's headline theorems that are statable against the pinned Mathlib and Tau Ceti and that
the pins do not prove. The algebraic headlines are stated on Tau Ceti's presented algebra
`TauCeti.TemperleyLieb R δ n` on `n` strands, which Layer 4 of the README identifies with the
diagram algebra; through that identification they are the README's statements about the diagram
algebra. Every carrier used here is Tau Ceti's or Mathlib's: the quantum integer `TauCeti.qInt`,
the planar matchings `TauCeti.PlanarMatching`, the Markov-trace predicate
`TauCeti.TemperleyLieb.IsMarkovTrace` and the cellular bases `TauCeti.CellularBasis`.

Headline theorems of the README that the Tau Ceti pin already proves, and which are therefore not
restated here: the root-of-unity dictionary `TauCeti.exists_qInt_eq_zero_iff` (Layer 0), the
Catalan count `TauCeti.PlanarMatching.card_planarMatching` (Layer 1), the uniqueness of the Markov
trace `TauCeti.TemperleyLieb.IsMarkovTrace.unique` (Layer 4), existence and uniqueness of the
Jones–Wenzl projection `TauCeti.TemperleyLieb.existsUnique_jonesWenzl` and its quantum dimension
`TauCeti.TemperleyLieb.IsMarkovTrace.apply_jonesWenzl` (Layer 6).

Headline theorems of the README that are not statable at the pins, with the missing carrier:

* the universal properties of the free self-duality and of the diagram category (Layer 2): the
  pins have no monoidal category presented by generators and relations and no Temperley–Lieb
  diagram category with gluing composition (Tau Ceti's `TauCeti.TLDiagram` has no composition);
* the `R`-linear universal property, the pivotal, spherical, braided and ribbon structures and the
  evaluation representation (Layer 3): no linear Temperley–Lieb category;
* the classification of the simple modules of a cellular algebra over a field (Layer 5): the pins
  have the cell representations only as the matrix representations
  `TauCeti.CellularBasis.cellRep`, with no cell module or its radical quotient as a module;
* the Gram determinant formula and the nondegeneracy of the closure pairings
  `Hom(n, m) × Hom(m, n) → R` (Layer 5): no cellular basis of the Temperley–Lieb algebras, no cell
  forms of them, and no hom-modules of a linear Temperley–Lieb category;
* the coefficient formula for the Jones–Wenzl projections and their partial trace (Layer 6): no
  diagram basis of the algebra and no conditional expectation;
* Goodman–Wenzl, the uniqueness of the proper nonzero tensor ideal at a root of unity (Layer 6):
  no linear Temperley–Lieb category whose tensor ideals `TauCeti.MonoidalIdeal` it would classify;
* the generic classification of the Karoubi envelope, Clebsch–Gordan, and the root-of-unity
  fusion quotients (Layer 7): no linear Temperley–Lieb category, hence no envelope of it, and no
  rigid structure on Tau Ceti's quotient `TauCeti.MonoidalQuotient`.

Conventions (see `README.md`): the loop parameter is `δ = q + q⁻¹`, a closed circle evaluates to
`δ`; the Markov trace is unnormalized, `tr 1 = δ ^ n` on `n` strands. Tau Ceti's spin-model trace
`TauCeti.TemperleyLieb.markovTrace` is stated for `δ = -(q + q⁻¹)`, the case `q ↦ -q` of this
convention.
-/

namespace TauCetiRoadmap.TemperleyLieb

/-! ## Layer 4: the algebras, the tower, and the Markov trace -/

/-- **The presentation theorem, as a basis.** Over every commutative ring `R` and for every `δ`,
Tau Ceti's presented algebra on `n` strands is a free `R`-module with a basis indexed by the planar
matchings of `2n` points, the diagrams `n → n`. Bijectivity of the comparison with the diagram
algebra (Jones normal form plus the diagram basis) gives it; in particular the rank is
`catalan n` (`TauCeti.PlanarMatching.card_planarMatching`). -/
theorem exists_basis_planarMatching (R : Type*) [CommRing R] (δ : R) (n : ℕ) :
    Nonempty (Module.Basis (TauCeti.PlanarMatching (2 * n)) R (TauCeti.TemperleyLieb R δ n)) :=
  sorry

/-- **Existence and uniqueness of the Markov trace**, at every loop parameter over every
commutative ring: exactly one family of linear forms on the Temperley–Lieb tower satisfies Tau
Ceti's `TauCeti.TemperleyLieb.IsMarkovTrace` (`tr 1 = δ ^ n`, traciality, multiplication by `δ`
along `strandIncl`, and the Markov property for the last generator). Uniqueness is Tau Ceti's
`TauCeti.TemperleyLieb.IsMarkovTrace.unique`; existence is the diagrammatic trace (close to the
right and evaluate circles), transported along the comparison with the diagram algebra. For
`δ = -(q + q⁻¹)` the trace is Tau Ceti's `TauCeti.TemperleyLieb.markovTrace`. -/
theorem existsUnique_isMarkovTrace (R : Type*) [CommRing R] (δ : R) :
    ∃! tr : ∀ n : ℕ, TauCeti.TemperleyLieb R δ n →ₗ[R] R,
      TauCeti.TemperleyLieb.IsMarkovTrace R δ tr :=
  sorry

/-! ## Layer 5: cellular algebras, Gram determinants, semisimplicity -/

/-- **The Graham–Lehrer semisimplicity criterion.** A cellular algebra over a field, with a finite
poset of cells, is semisimple iff the bilinear form of every cell is nondegenerate, that is, iff
the Gram matrix `TauCeti.CellularBasis.gramMatrix` of every cell has nonzero determinant
(Graham–Lehrer, *Cellular algebras*, §3). The field is needed: `ℤ` is cellular with
one cell, one basis vector and Gram matrix `1`, and is not a semisimple ring. -/
theorem isSemisimpleRing_iff_forall_det_gramMatrix_ne_zero {K A Λ : Type*} [Field K] [Ring A]
    [Algebra K A] [PartialOrder Λ] [Finite Λ] {M : Λ → Type*} [∀ μ, Fintype (M μ)]
    [∀ μ, DecidableEq (M μ)] (c : TauCeti.CellularBasis K A M) :
    IsSemisimpleRing A ↔ ∀ μ, (c.gramMatrix μ).det ≠ 0 :=
  sorry

/-- **Generic semisimplicity**, over any field: if `[1], …, [n]` are nonzero then the
Temperley–Lieb algebra on `n` strands is semisimple. This is not an iff: on three strands at
`δ = 0` the algebra is semisimple although `[2] = 0`. -/
theorem isSemisimpleRing_of_qInt_ne_zero (K : Type*) [Field K] (δ : K) (n : ℕ)
    (h : ∀ k ∈ Finset.Icc 1 n, TauCeti.qInt K δ k ≠ 0) :
    IsSemisimpleRing (TauCeti.TemperleyLieb K δ n) :=
  sorry

/-- **The semisimplicity classification** over a field of characteristic zero: the algebra on `n`
strands is semisimple iff `[1], …, [n]` are nonzero (the quantum order of `δ` exceeds `n`), or
`δ = 0` and `n` is odd (over `ℂ`: Ridout–Saint-Aubin, arXiv:1204.4505, Theorem 4.7 for the Gram
determinants and the remarks after Corollary 4.8 for `δ = 0`, with the Graham–Lehrer criterion
that a cellular algebra over a field is semisimple iff every cell form is nondegenerate). The
characteristic hypothesis is needed: on five strands at `δ = 0` a Gram determinant is `-2`, so the
algebra is semisimple in characteristic zero and not in characteristic two. -/
theorem isSemisimpleRing_iff_of_charZero (K : Type*) [Field K] [CharZero K] (δ : K) (n : ℕ) :
    IsSemisimpleRing (TauCeti.TemperleyLieb K δ n) ↔
      (∀ k ∈ Finset.Icc 1 n, TauCeti.qInt K δ k ≠ 0) ∨ (δ = 0 ∧ Odd n) :=
  sorry

end TauCetiRoadmap.TemperleyLieb
