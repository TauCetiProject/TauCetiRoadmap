import Mathlib
import TauCeti.Algebra.TemperleyLieb.MarkovTrace

/-!
# Temperley–Lieb diagrams, categories, and algebras: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the three definitions they need: the quantum integer `qInt`, the carrier `PlanarMatching` of
planar matchings, and the predicate `IsMarkovTrace`. The algebraic headlines are stated on Tau
Ceti's presented algebra `TauCeti.TemperleyLieb R δ n` on `n` strands, which Layer 4 of the README
identifies with the diagram algebra; through that identification they are the README's statements
about the diagram algebra.

Headline theorems of the README that are not statable at the pins, with the missing carrier:

* the universal properties of the free self-duality and of the diagram category (Layer 2): the
  pins have no monoidal category presented by generators and relations and no Temperley–Lieb
  diagram category with gluing composition;
* the `R`-linear universal property, the pivotal, spherical, braided and ribbon structures and the
  evaluation representation (Layer 3): no linear Temperley–Lieb category, and no pivotal or
  spherical API (that is the PivotalSpherical roadmap's, not yet in Tau Ceti);
* the Gram determinant formula, semisimplicity via Gram determinants, and nondegeneracy of the
  closure pairings `Hom(n, m) × Hom(m, n) → R` (Layer 5): no cell modules, cell forms or
  hom-pairings of a linear Temperley–Lieb category;
* Goodman–Wenzl, the uniqueness of the proper nonzero tensor ideal at a root of unity (Layer 6):
  no tensor ideals of a linear Temperley–Lieb category;
* the generic classification of the Karoubi envelope, Clebsch–Gordan, and the root-of-unity
  fusion quotients (Layer 7): no monoidal structure on `Mat_ C` or `Karoubi C`, no monoidal
  quotient by a tensor ideal, and no semisimple-category predicate at the pins.

Conventions (see `README.md`): the loop parameter is `δ = q + q⁻¹`, a closed circle evaluates to
`δ`; the Markov trace is unnormalized, `tr 1 = δ ^ n` on `n` strands. Tau Ceti's spin-model trace
is stated for `δ = -(q + q⁻¹)`, the case `q ↦ -q` of this convention.
-/

namespace TauCetiRoadmap.TemperleyLieb

/-! ## Layer 0: quantum integers -/

/-- The **quantum integer** `[n]` at the loop parameter `δ`: Mathlib's rescaled Chebyshev
polynomial `Polynomial.Chebyshev.S` at the integer index `n - 1`, evaluated at `δ`. The integer
index makes `[0] = S_{-1}(δ) = 0`; then `[1] = 1`, `[2] = δ` and `[n + 2] = δ [n + 1] - [n]`, and
for a unit `q` with `δ = q + q⁻¹`, `[n] = q^{n-1} + q^{n-3} + ⋯ + q^{1-n}`. -/
noncomputable def qInt (R : Type*) [CommRing R] (δ : R) (n : ℕ) : R :=
  (Polynomial.Chebyshev.S R ((n : ℤ) - 1)).eval δ

/-- **The root-of-unity dictionary.** Over an algebraically closed field of characteristic zero,
some quantum integer `[n]` with `n ≥ 1` vanishes iff `δ = ζ + ζ⁻¹` for a root of unity `ζ ≠ ±1`.
The exclusions are needed: `[n](2) = n` and `[n](-2) = (-1)^{n-1} n` never vanish in
characteristic zero. -/
theorem exists_qInt_eq_zero_iff (K : Type*) [Field K] [IsAlgClosed K] [CharZero K] (δ : K) :
    (∃ n : ℕ, 1 ≤ n ∧ qInt K δ n = 0) ↔
      ∃ ζ : Kˣ, (∃ m : ℕ, 0 < m ∧ ζ ^ m = 1) ∧ ζ ≠ 1 ∧ ζ ≠ -1 ∧
        δ = (ζ : K) + ((ζ⁻¹ : Kˣ) : K) := sorry

/-! ## Layer 1: planar matchings -/

/-- A **planar matching** on `k` boundary points: a fixed-point-free involution `σ` of `Fin k`
whose pairs do not interleave, that is, whenever `a < b < σ a` the partner `σ b` also lies strictly
between `a` and `σ a`. -/
def PlanarMatching (k : ℕ) : Type :=
  {σ : Equiv.Perm (Fin k) // Function.Involutive σ ∧ (∀ i, σ i ≠ i) ∧
    ∀ a b : Fin k, a < b → b < σ a → a < σ b ∧ σ b < σ a}

/-- The non-interleaving condition admits the nested pairing `{0, 3}, {1, 2}` of four points and
excludes the crossing pairing `{0, 2}, {1, 3}`. -/
example :
    (∃ x : PlanarMatching 4,
        x.1 = (Equiv.swap (0 : Fin 4) 3 * Equiv.swap 1 2 : Equiv.Perm (Fin 4))) ∧
      ¬ ∃ x : PlanarMatching 4,
        x.1 = (Equiv.swap (0 : Fin 4) 2 * Equiv.swap 1 3 : Equiv.Perm (Fin 4)) := by
  refine ⟨⟨⟨_, fun x ↦ by revert x; decide, by decide, by decide⟩, rfl⟩, ?_⟩
  rintro ⟨⟨σ, -, -, h⟩, rfl⟩
  exact absurd h (by decide)

/-- **Catalan count.** The planar matchings on `2k` points are counted by the Catalan number
`catalan k` (through the innermost-cup bijection with Dyck words of semilength `k` and Mathlib's
`DyckWord.card_dyckWord_semilength_eq_catalan`). -/
theorem card_planarMatching (k : ℕ) : Nat.card (PlanarMatching (2 * k)) = catalan k := sorry

/-! ## Layer 4: the algebras and the Markov trace -/

/-- **The presentation theorem, as a basis.** Over every commutative ring `R` and for every `δ`,
Tau Ceti's presented algebra on `n` strands is a free `R`-module with a basis indexed by the planar
matchings of `2n` points, the diagrams `n → n`. Bijectivity of the comparison with the diagram
algebra (Jones normal form plus the diagram basis) gives it; in particular the rank is
`catalan n`. -/
theorem exists_basis_planarMatching (R : Type*) [CommRing R] (δ : R) (n : ℕ) :
    Nonempty (Module.Basis (PlanarMatching (2 * n)) R (TauCeti.TemperleyLieb R δ n)) := sorry

/-- A **Markov trace** on the Temperley–Lieb tower at loop parameter `δ`: a family of `R`-linear
forms, unnormalized (`tr 1 = δ ^ n` on `n` strands), tracial, multiplied by `δ` along the strand
inclusion `TauCeti.TemperleyLieb.strandIncl`, and satisfying the Markov property: capping the added
strand with the previous one, by the last generator, recovers the trace one level down. -/
structure IsMarkovTrace (R : Type*) [CommRing R] (δ : R)
    (tr : ∀ n : ℕ, TauCeti.TemperleyLieb R δ n →ₗ[R] R) : Prop where
  map_one : ∀ n, tr n 1 = δ ^ n
  map_mul_comm : ∀ n (x y : TauCeti.TemperleyLieb R δ n), tr n (x * y) = tr n (y * x)
  map_strandIncl : ∀ n (x : TauCeti.TemperleyLieb R δ (n + 1)),
    tr (n + 2) (TauCeti.TemperleyLieb.strandIncl x) = δ * tr (n + 1) x
  map_strandIncl_mul_e_last : ∀ n (x : TauCeti.TemperleyLieb R δ (n + 1)),
    tr (n + 2) (TauCeti.TemperleyLieb.strandIncl x * TauCeti.TemperleyLieb.e δ (Fin.last n)) =
      tr (n + 1) x

/-- Tau Ceti's spin-model trace at `δ = -(q + q⁻¹)` is a Markov trace in this sense, with the same
normalization and the same Markov generator. -/
example (R : Type*) [CommRing R] (q : Rˣ) {δ : R} (hδ : δ = -((q : R) + ((q⁻¹ : Rˣ) : R))) :
    IsMarkovTrace R δ (fun _ ↦ TauCeti.TemperleyLieb.markovTrace q hδ) :=
  ⟨fun _ ↦ TauCeti.TemperleyLieb.markovTrace_one q hδ,
    fun _ x y ↦ TauCeti.TemperleyLieb.markovTrace_mul_comm q hδ x y,
    fun _ x ↦ TauCeti.TemperleyLieb.markovTrace_strandIncl q hδ x,
    fun _ x ↦ TauCeti.TemperleyLieb.markovTrace_strandIncl_mul_e_last q hδ x⟩

/-- **Existence and uniqueness of the Markov trace**, at every loop parameter over every
commutative ring. Existence is the diagrammatic trace (close to the right and evaluate circles),
transported along the comparison with the diagram algebra; uniqueness follows from the Jones normal
form, since every element on `n + 2` strands is a combination of `strandIncl a` and
`strandIncl a * e (Fin.last n) * strandIncl b`. For `δ = -(q + q⁻¹)` the unique trace is Tau
Ceti's `TauCeti.TemperleyLieb.markovTrace`. -/
theorem existsUnique_isMarkovTrace (R : Type*) [CommRing R] (δ : R) :
    ∃! tr : ∀ n : ℕ, TauCeti.TemperleyLieb R δ n →ₗ[R] R, IsMarkovTrace R δ tr := sorry

/-! ## Layer 5: semisimplicity -/

/-- **Generic semisimplicity**, over any field: if `[1], …, [n]` are nonzero then the
Temperley–Lieb algebra on `n` strands is semisimple. This is not an iff: on three strands at
`δ = 0` the algebra is semisimple although `[2] = 0`. -/
theorem isSemisimpleRing_of_qInt_ne_zero (K : Type*) [Field K] (δ : K) (n : ℕ)
    (h : ∀ k ∈ Finset.Icc 1 n, qInt K δ k ≠ 0) :
    IsSemisimpleRing (TauCeti.TemperleyLieb K δ n) := sorry

/-- **The semisimplicity classification** over a field of characteristic zero: the algebra on `n`
strands is semisimple iff `[1], …, [n]` are nonzero (the quantum order of `δ` exceeds `n`), or
`δ = 0` and `n` is odd (over `ℂ`: Ridout–Saint-Aubin, arXiv:1204.4505, Theorem 4.7 for the Gram
determinants and the remark after Corollary 4.8 for `δ = 0`, with the Graham–Lehrer criterion
that a cellular algebra is semisimple iff every cell form is nondegenerate). The characteristic
hypothesis is needed: on five
strands at `δ = 0` a Gram determinant is `-2`, so the algebra is semisimple in characteristic zero
and not in characteristic two. -/
theorem isSemisimpleRing_iff_of_charZero (K : Type*) [Field K] [CharZero K] (δ : K) (n : ℕ) :
    IsSemisimpleRing (TauCeti.TemperleyLieb K δ n) ↔
      (∀ k ∈ Finset.Icc 1 n, qInt K δ k ≠ 0) ∨ (δ = 0 ∧ Odd n) := sorry

/-! ## Layer 6: Jones–Wenzl projections -/

/-- **Existence and uniqueness of the Jones–Wenzl projection** `f_n`, over any commutative ring in
which `[1], …, [n]` are units: there is exactly one element of the algebra on `n` strands that is
idempotent, has augmentation `1` (coefficient `1` on the identity diagram; the augmentation
`TauCeti.TemperleyLieb.aug` kills every generator), and is killed on both sides by every
generator. Uniqueness needs no invertibility: the kernel of the augmentation is the two-sided
ideal generated by the `e i`, which two such elements both annihilate. -/
theorem existsUnique_jonesWenzl (R : Type*) [CommRing R] (δ : R) (n : ℕ)
    (h : ∀ k ∈ Finset.Icc 1 n, IsUnit (qInt R δ k)) :
    ∃! f : TauCeti.TemperleyLieb R δ n, IsIdempotentElem f ∧ TauCeti.TemperleyLieb.aug f = 1 ∧
      ∀ i : Fin (n - 1),
        TauCeti.TemperleyLieb.e δ i * f = 0 ∧ f * TauCeti.TemperleyLieb.e δ i = 0 := sorry

/-- **The trace of the Jones–Wenzl projection** is the quantum integer `[n + 1]`, for every
Markov trace (by `existsUnique_isMarkovTrace` there is exactly one). At `n = 2`,
`f_2 = 1 - δ⁻¹ e` has trace `δ² - 1 = [3]`. -/
theorem IsMarkovTrace.apply_jonesWenzl {R : Type*} [CommRing R] {δ : R}
    {tr : ∀ n : ℕ, TauCeti.TemperleyLieb R δ n →ₗ[R] R} (htr : IsMarkovTrace R δ tr) {n : ℕ}
    (h : ∀ k ∈ Finset.Icc 1 n, IsUnit (qInt R δ k)) (f : TauCeti.TemperleyLieb R δ n)
    (hf : TauCeti.TemperleyLieb.aug f = 1)
    (hfe : ∀ i : Fin (n - 1),
      TauCeti.TemperleyLieb.e δ i * f = 0 ∧ f * TauCeti.TemperleyLieb.e δ i = 0) :
    tr n f = qInt R δ (n + 1) := sorry

end TauCetiRoadmap.TemperleyLieb
