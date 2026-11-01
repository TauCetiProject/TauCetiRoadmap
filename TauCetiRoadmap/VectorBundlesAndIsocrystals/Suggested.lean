import Mathlib

/-!
# Isocrystals, vector bundles and Banach–Colmez spaces: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems that are statable against the pinned Mathlib and Tau Ceti APIs,
using only the simple definitions needed for those statements.

Layer 1's equal-characteristic Dieudonné–Manin theorem is stated in every finite rank
and for arithmetic q-Frobenius, q = p^f with f > 0. Mathlib's Laurent series, coefficient
Frobenius and bases suffice to express existence of a cyclic decomposition and uniqueness
of its coprime block slopes. A block with wrap π^s has isocrystal slope s/r.

The mixed-characteristic supplier comparison and the general-coefficient endomorphism
invariant comparison require the ramified Witt coefficient ring, its comparison with the
completed maximal unramified field, and the corresponding standard blocks. These objects
are absent from the pins. Mathlib's Witt isocrystals cover the ordinary p-Frobenius carrier;
their finite-carrier identification alone is not the classification theorem.

The geometric headline statements are not statable here because their objects are absent from
the pins: Layer 0's relative ringed curve, twists and homogeneous section ring; Layer 2's analytic
bundle carrier, curve degree and HN filtration; and Layer 3's curve-specific Proj map and GAGA
functor. Thus positive generation, Picard and bundle classification, coherent classification
and finite étale curve-algebra classification have no signatures here. Tau Ceti's fixed-field
`spaX` is a topological orbit quotient, without the required curve structure sheaf.

Layer 5's projectivized properness, two-term cohomological smoothness, Le Bras equivalence,
dimension-height and curvature theorems require the perfectoid sites, Banach–Colmez sheaves,
period functors and curve's tilted coherent heart. Layer 6's family HN filtration, pure-model and
local-system comparisons, ampleness criterion and integral group-torsor theorem require the
relative curve and integral/bounded/full Robba rings with their Frobenius and local systems.
These structures also are absent from the pins; generic abelian categories, numerical
polygons or unspecified period objects do not express those results.
-/

namespace TauCetiRoadmap.VectorBundlesAndIsocrystals

/-! ## Layer 1: Finite isocrystals and division algebras -/

/-- Arithmetic p^f-Frobenius on coefficients, fixing the Laurent-series uniformizer. -/
noncomputable def coefficientFrobenius (p f : ℕ) [Fact p.Prime]
    (k : Type*) [Field k] [CharP k p] [PerfectRing k p] :
    LaurentSeries k ≃+* LaurentSeries k where
  toFun x := x.map (iterateFrobeniusEquiv k p f)
  invFun x := x.map (iterateFrobeniusEquiv k p f).symm
  left_inv x := by
    ext n
    exact (iterateFrobeniusEquiv k p f).symm_apply_apply (x.coeff n)
  right_inv x := by
    ext n
    exact (iterateFrobeniusEquiv k p f).apply_symm_apply (x.coeff n)
  map_add' x y := by ext n; simp
  map_mul' x y := HahnSeries.map_mul (iterateFrobeniusEquiv k p f).toRingHom.toNonUnitalRingHom

/-- A basis partitioned into coprime cyclic Frobenius blocks D(s,r).
The last vector of each block maps to π^s times its first vector. -/
structure CyclicSlopeDecomposition {L V : Type*} [Field L] [AddCommGroup V] [Module L V]
    {σ : L ≃+* L} (Φ : V →ₛₗ[σ.toRingHom] V) (π : L) where
  blocks : ℕ
  rank : Fin blocks → ℕ+
  exponent : Fin blocks → ℤ
  coprime : ∀ i, (exponent i).natAbs.Coprime (rank i)
  basis : Module.Basis (Σ i, Fin (rank i)) L V
  frobenius_basis : ∀ i j, Φ (basis ⟨i, j⟩) =
    (if j.val + 1 = rank i then π ^ exponent i else 1) •
      basis ⟨i, finRotate (rank i) j⟩

/-- The multiset of simple-block slopes, counting each block once. -/
def CyclicSlopeDecomposition.slopes {L V : Type*} [Field L]
    [AddCommGroup V] [Module L V] {σ : L ≃+* L}
    {Φ : V →ₛₗ[σ.toRingHom] V} {π : L} (D : CyclicSlopeDecomposition Φ π) : Multiset ℚ :=
  (List.ofFn fun i => (D.exponent i : ℚ) / (D.rank i : ℕ) : List ℚ)

/-- Layer 1: equal-characteristic Dieudonné–Manin classification over k((π)), with
arithmetic q-Frobenius for q = p^f. Every finite isocrystal has a coprime cyclic
block decomposition, and its multiset of block slopes is independent of the basis.
See README, “Dieudonné–Manin classification of finite isocrystals”. -/
theorem dieudonneManinEqualChar (p : ℕ) [Fact p.Prime] (f : ℕ+)
    (k : Type*) [Field k] [CharP k p] [IsAlgClosed k]
    (V : Type*) [AddCommGroup V] [Module (LaurentSeries k) V]
    [FiniteDimensional (LaurentSeries k) V]
    (Φ : V →ₛₗ[(coefficientFrobenius p f k).toRingHom] V)
    (hΦ : Function.Bijective Φ) :
    ∃ D : CyclicSlopeDecomposition Φ (HahnSeries.single 1 1),
      ∀ D' : CyclicSlopeDecomposition Φ (HahnSeries.single 1 1), D.slopes = D'.slopes := by
  sorry

end TauCetiRoadmap.VectorBundlesAndIsocrystals
