import Mathlib
import TauCeti.KnotTheory.BraidWord.PDCode
import TauCeti.KnotTheory.Khovanov.EnhancedState
import TauCeti.KnotTheory.Khovanov.EulerCharacteristic
import TauCeti.KnotTheory.PDCode.Basic
import TauCeti.KnotTheory.PDCode.Oriented.Reidemeister.Equivalence
import TauCeti.KnotTheory.PDCode.ResolvedCircle.Adjacent

/-!
# Khovanov homology of classical links: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

The carriers are Tau Ceti's: oriented PD-codes `TauCeti.OrientedPDCode` with planarity
`TauCeti.PDCode.IsPlanar`, Reidemeister equivalence `TauCeti.OrientedPDCode.ReidemeisterEquiv`, the
normalized Khovanov complex `TauCeti.OrientedPDCode.khovanovComplex` (one cochain complex of
`R`-modules for each quantum degree), Khovanov homology `TauCeti.OrientedPDCode.khovanovHomology`
and its graded Euler characteristic `TauCeti.OrientedPDCode.khovanovEulerChar`. Khovanov's theorem
that this Euler characteristic is `(q + q⁻¹)` times the Jones polynomial at `t^(1/2) = -q` is
Tau Ceti's `TauCeti.OrientedPDCode.khovanovEulerChar_eq_mul_eval₂_jonesPolynomial` and is not
restated here.

The headlines stated below are Reidemeister invariance of the complex (README §4.5), duality of
the homology of the mirror over a field (§5.4), the value `2^c` of the graded Euler
characteristic at `q = 1` (§5.6), the integral homology of the positive two-strand torus links
`T(2, m)` with its `ℤ/2` torsion (§6.4), and crossing minimality of adequate diagrams (§6.5).

Three headlines are not statable at the pins, and nothing is stated in their place.

* Invariance under ambient isotopy of smooth links in `ℝ³` (§4.6, with Layer 8): the pins
  have smooth links `TauCeti.SmoothLinkEmbedding` and their ambient isotopy, but no plane
  realization of a PD-code as a smooth link, which Layer 8 constructs.
* Functoriality of Khovanov homology, up to one global sign, under boundary-fixed isotopy classes
  of link cobordisms in `ℝ³ × [0, 1]` (§7.8): the pins have neither the category of collared link
  cobordisms of §7.1 nor the movie presentation of §7.5.
* Mark independence of reduced Khovanov homology and its connected-sum formula (§§5.9, 5.11): the
  pins have marks (`TauCeti.PDCode.Mark`) but not the action of `X` at a mark on the complex,
  which is a chain map of §5.7, nor the reduced complex built from it.
-/

universe u

namespace TauCetiRoadmap.KhovanovHomology

open CategoryTheory CategoryTheory.Limits TauCeti Finset

/-! ## Layer 4: Reidemeister chain homotopies and link invariance -/

/-- **Reidemeister invariance of the Khovanov complex.** If two planar oriented PD-codes are
related by a finite sequence of isomorphisms of codes and Reidemeister moves, then for every
commutative ring `R` and every quantum degree `j` their normalized Khovanov complexes in quantum
degree `j` are chain homotopy equivalent. In particular `Khⁱʲ(D; R) ≅ Khⁱʲ(D'; R)` for all
`i, j`. Khovanov, *A categorification of the Jones polynomial*, §4.2, Theorem 1 (proved in §5)
and §7.1, Theorem 2 (the specialization `c = 0` used here); Bar-Natan, *Khovanov's homology for
tangles and cobordisms*, §4.2, Theorem 1. -/
theorem nonempty_homotopyEquiv_khovanovComplex_of_reidemeisterEquiv {n m : ℕ}
    {D : OrientedPDCode n} {D' : OrientedPDCode m} (hD : D.toPDCode.IsPlanar)
    (hD' : D'.toPDCode.IsPlanar) (h : OrientedPDCode.ReidemeisterEquiv D D')
    (R : Type u) [CommRing R] (j : ℤ) :
    Nonempty (HomotopyEquiv (D.khovanovComplex hD R j) (D'.khovanovComplex hD' R j)) := by
  sorry

/-! ## Layer 5: exact sequences, coefficients, symmetry and based links -/

/-- **Mirror duality over a field.** For a planar oriented PD-code `D` and a field `F`, the
Khovanov homology of the mirror diagram in bidegree `(i, j)` is the dual of the Khovanov homology
of `D` in bidegree `(-i, -j)`. Khovanov, *A categorification of the Jones polynomial*, §7.3,
Proposition 32 (the complex of the mirror is the dual complex) and Corollary 11. -/
theorem nonempty_khovanovHomology_mirror_iso_dual {n : ℕ} (D : OrientedPDCode n)
    (hD : D.toPDCode.IsPlanar) (hD' : D.mirror.toPDCode.IsPlanar) (F : Type u) [Field F]
    (i j : ℤ) :
    Nonempty (D.mirror.khovanovHomology hD' F i j ≅
      ModuleCat.of F (Module.Dual F (D.khovanovHomology hD F (-i) (-j)))) := by
  sorry

/-- **The graded Euler characteristic at `q = 1`.** For a planar oriented PD-code `D` with `c`
components, the signed enhanced-state count `Σ_S (-1)^(|S| - n₋) 2^(k(S))`, which is the value at
`q = 1` of the graded Euler characteristic of Khovanov homology, equals `2^c`. The empty diagram
gives `1`. -/
theorem eval₂_one_enhancedStateSum {n : ℕ} (D : OrientedPDCode n) (hD : D.toPDCode.IsPlanar) :
    LaurentPolynomial.eval₂ (RingHom.id ℤ) 1 D.enhancedStateSum =
      2 ^ D.toPDCode.componentCount := by
  sorry

/-! ## Layer 6: certified computations and applications -/

/-- The bidegrees `(i, j)` in which the integral Khovanov homology of the positive two-strand
torus link `T(2, m)`, `m ≥ 2`, is a free group `ℤ`: `(0, m - 2)` and `(0, m)`; for
`1 ≤ r` with `2r + 1 ≤ m`, the bidegrees `(2r, m + 4r - 2)` and `(2r + 1, m + 4r + 2)`; and, for
`m` even, `(m, 3m - 2)` and `(m, 3m)`. -/
def torusLinkFreeBidegrees (m : ℕ) : Set (ℤ × ℤ) :=
  {p | (p.1 = 0 ∧ (p.2 = m - 2 ∨ p.2 = m)) ∨
    (∃ r : ℤ, 1 ≤ r ∧ 2 * r + 1 ≤ m ∧
      ((p.1 = 2 * r ∧ p.2 = m + 4 * r - 2) ∨ (p.1 = 2 * r + 1 ∧ p.2 = m + 4 * r + 2))) ∨
    (Even m ∧ p.1 = m ∧ (p.2 = 3 * m - 2 ∨ p.2 = 3 * m))}

/-- The bidegrees `(i, j)` in which the integral Khovanov homology of the positive two-strand
torus link `T(2, m)` is `ℤ/2`: `(2r + 1, m + 4r)` for `1 ≤ r` with `2r + 1 ≤ m`. -/
def torusLinkTorsionBidegrees (m : ℕ) : Set (ℤ × ℤ) :=
  {p | ∃ r : ℤ, 1 ≤ r ∧ 2 * r + 1 ≤ m ∧ p.1 = 2 * r + 1 ∧ p.2 = m + 4 * r}

/-- **Integral Khovanov homology of the two-strand torus links.** Let `D` be the closure of the
two-strand braid word with `m ≥ 2` letters `σ₁`, all positive, the positive torus link
`T(2, m)`. Its integral Khovanov homology is `ℤ` in the bidegrees of
`torusLinkFreeBidegrees m`, `ℤ/2` in those of `torusLinkTorsionBidegrees m`, and zero in every
other bidegree. For `m = 3`, the right-handed trefoil, this is `ℤ` in `(0, 1)`, `(0, 3)`,
`(2, 5)`, `(3, 9)` and `ℤ/2` in `(3, 7)`. Khovanov, *A categorification of the Jones polynomial*,
§7.6, Proposition 35, whose list, in that paper's conventions, is the image of this one under the
mirror comparison of README §5.4 (free summands at `(i, j)` go to `(-i, -j)`, torsion summands to
`(1 - i, -j)`). -/
theorem khovanovHomology_closure_replicate (m : ℕ) (hm : 2 ≤ m)
    (hD : (BraidWord.closure (List.replicate m ((0, 1) : Fin 1 × ℤˣ) : BraidWord 2)).toPDCode.IsPlanar)
    (i j : ℤ) :
    ((i, j) ∈ torusLinkFreeBidegrees m →
      Nonempty ((BraidWord.closure (List.replicate m ((0, 1) : Fin 1 × ℤˣ) : BraidWord 2)).khovanovHomology
        hD ℤ i j ≅ ModuleCat.of ℤ ℤ)) ∧
    ((i, j) ∈ torusLinkTorsionBidegrees m →
      Nonempty ((BraidWord.closure (List.replicate m ((0, 1) : Fin 1 × ℤˣ) : BraidWord 2)).khovanovHomology
        hD ℤ i j ≅ ModuleCat.of ℤ (ZMod 2))) ∧
    ((i, j) ∉ torusLinkFreeBidegrees m → (i, j) ∉ torusLinkTorsionBidegrees m →
      IsZero ((BraidWord.closure (List.replicate m ((0, 1) : Fin 1 × ℤˣ) : BraidWord 2)).khovanovHomology
        hD ℤ i j)) := by
  sorry

/-- A PD-code is **adequate** when, in each of its two extreme states, all `A`-smoothings
(`true` at every crossing) and all `B`-smoothings (`false` at every crossing), the two arcs of
the smoothing at every crossing lie on two different circles. Equivalently, every edge of the
cube of resolutions leaving the all-`A` vertex is a merge, and every edge entering the all-`B`
vertex is a split. -/
def IsAdequate {n : ℕ} (D : PDCode n) : Prop :=
  ∀ c : Fin n, #(D.circlesAt (fun _ ↦ true) c) = 2 ∧ #(D.circlesAt (fun _ ↦ false) c) = 2

/-- **Adequate diagrams have the fewest crossings.** If `D` is an adequate planar oriented PD-code
with `n` crossings, every oriented PD-code Reidemeister equivalent to `D` has at least `n`
crossings. The proof compares supports of integral Khovanov homology: it vanishes outside cochain
degrees `[-n₋, n₊]` for every diagram, and is nonzero in cochain degrees `-n₋` and `n₊` for an
adequate one. Khovanov, *A categorification of the Jones polynomial*, §7.7, Propositions 36
and 37 and Corollary 13, after Thistlethwaite. -/
theorem le_of_isAdequate_of_reidemeisterEquiv {n m : ℕ} {D : OrientedPDCode n}
    {D' : OrientedPDCode m} (hD : D.toPDCode.IsPlanar) (hA : IsAdequate D.toPDCode)
    (h : OrientedPDCode.ReidemeisterEquiv D D') : n ≤ m := by
  sorry

end TauCetiRoadmap.KhovanovHomology
