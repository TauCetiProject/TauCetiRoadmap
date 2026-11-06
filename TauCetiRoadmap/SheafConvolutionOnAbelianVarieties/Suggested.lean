module

public import Mathlib

/-!
# Sheaf convolution on abelian varieties: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The finite permutation count in
`hasEulerianExteriorWeights` spells out the descent-indexed Eulerian number of
ClassicalArithmeticCompletion §2.18 solely to state the exterior-weight theorem.
It introduces no separate general Eulerian-number API. Jordan's theorem on finite
linear groups, which the family detection argument of §7.4 consumes, is stated by
FiniteGroupInvariants §10.5 (`jordanBound`, `jordan_exists_abelian_normal_index_le`,
`jordan_exists_abelian_normal_index_le_of_finite_map`, `finrank_le_jordanBound`)
and is not restated here.

The following headline theorems are not statable at the pins:
* Generic vanishing, the rigid perverse convolution quotient and its faithful
  cohomological fibre functor lack the constructible adic perverse category,
  geometric character sheaves, the six operations with the canonical
  compact-support direct image, and the kernel transforms built on them,
  through which derived convolution is formed.
* Arithmetic-geometric Tannaka exactness and Galois normalization lack those
  categories and the Tannaka reconstruction of their cohomological fibres.
* Hypersurface Euler characteristics and the torsion-twist Hodge-Tate row lack
  smooth ample divisor cohomology, intersection degrees and geometric comparison.
* The structure of exceptional character loci lacks the rank-one de Rham moduli
  space with its holonomy map and the cohomology support loci of perverse sheaves.
* The microlocal fibre functor, microlocal factorization, minuscule almost
  simplicity and classical convolution monodromy lack the clean conormal cycle
  ring, microdifferential modules and the represented sheaf group.
* Constant-constituent rigidity, finite representation detection and generic
  simultaneous-twist monodromy lack the sheaf-generated algebraic groups and
  their relative constructible direct images and invariant spaces.
* Frobenius avoidance and Galois-uniform product monodromy lack the geometric
  character space, its torsion restriction loci and the preceding family groups.
* Surface period finiteness and quasi-finiteness of an isogeny-pullback period
  map lack geometric polarized integral variations on the smooth-divisor space,
  their period maps and the transport Hodge relations of polarized integral
  variations.
-/

@[expose] public section

namespace TauCetiRoadmap.SheafConvolutionOnAbelianVarieties

/-! ## Layer 5: exterior-power counts and exceptional degrees -/

/-- The multiplicity of the integer weight `t` in the `k`th exterior power
of the diagonal representation with weight list `w`: subsets are unordered. -/
def wedgeMultiplicity {m : ℕ} (w : Fin m → ℤ) (k : ℕ) (t : ℤ) : ℕ :=
  ((Finset.univ.powersetCard k).filter fun S => (∑ i ∈ S, w i) = t).card

/-- The increasing positive pairs solving the specialized inhomogeneous Pell
relation, with initial pair `(1,5)` and successor `(a,b) ↦ (b,4*b+1-a)`. -/
def exceptionalPair : ℕ → ℕ × ℕ
  | 0 => (1, 5)
  | j + 1 => let p := exceptionalPair j; (p.2, 4 * p.2 + 1 - p.1)

/-- The normalized threefold degree attached to a Pell pair. The geometric
exception set uses indices at least one. -/
def exceptionalDegree (j : ℕ) : ℕ :=
  Nat.choose ((exceptionalPair j).1 + (exceptionalPair j).2) (exceptionalPair j).1 / 6

/-- An exterior-weight row is `d` times the descent-indexed Eulerian row,
shifted by `s`, and vanishes at every other integer weight. All finite sets and
permutations are native Mathlib carriers; the parameter `n` is positive in use. -/
def hasEulerianExteriorWeights {m : ℕ} (w : Fin m → ℤ) (k n d : ℕ) (s : ℤ) : Prop :=
  ∀ q : ℤ, wedgeMultiplicity w k (s + q) =
    if 0 ≤ q ∧ q < (n : ℤ) then
      d * (Finset.univ.filter fun σ : Equiv.Perm (Fin n) =>
        (Finset.univ.filter fun i : Fin n =>
          if h : i.val + 1 < n then σ ⟨i.val + 1, h⟩ < σ i else False).card = q.toNat).card
    else 0

/-- Positive ordered solutions of the inhomogeneous Pell equation are exactly
one term of the exceptional-pair sequence (Lawrence–Sawin, Lemma B.7). -/
theorem exceptionalPair_classification (a b : ℕ) (ha : 0 < a) (hab : a ≤ b) :
    ((a : ℤ) ^ 2 - 4 * a * b + (b : ℤ) ^ 2 = a + b) ↔
      ∃! j : ℕ, exceptionalPair j = (a, b) := by
  sorry

/-- A surface Eulerian exterior row forces a balanced exponent, the displayed
binomial degree and two adjacent weights with one singleton endpoint
(Lawrence–Sawin, Lemma B.4). -/
theorem surface_exterior_classification {m k d : ℕ} (w : Fin m → ℤ) (s : ℤ)
    (hk : 1 < k) (hkm : k + 1 < m) (hnorm : 2 * k ≤ m) (hd : 1 ≤ d)
    (hrow : hasEulerianExteriorWeights w k 2 d s) :
    m = 2 * k ∧ d = Nat.choose (2 * k - 1) k ∧
      ∃ v : ℤ, (∀ i, w i = v ∨ w i = v + 1) ∧
        ((Finset.univ.filter fun i => w i = v).card = 1 ∨
          (Finset.univ.filter fun i => w i = v + 1).card = 1) := by
  sorry

/-- The threefold row has either the classical exterior-square realization or
one of the Pell-pair parameters, with singleton endpoint weights
(Lawrence–Sawin, Lemmas B.5–B.8). -/
theorem threefold_exterior_classification {m k d : ℕ} (w : Fin m → ℤ) (s : ℤ)
    (hk : 1 < k) (hkm : k + 1 < m) (hnorm : 2 * k ≤ m) (hd : 1 ≤ d)
    (hrow : hasEulerianExteriorWeights w k 3 d s) :
    (m = 4 ∧ k = 2 ∧ d = 1) ∨
      ∃ j : ℕ, 1 ≤ j ∧ m = (exceptionalPair j).1 + (exceptionalPair j).2 ∧
        k = (exceptionalPair j).1 ∧ d = exceptionalDegree j ∧
        ∃ v : ℤ, (∀ i, w i = v - 1 ∨ w i = v ∨ w i = v + 1) ∧
          (Finset.univ.filter fun i => w i = v - 1).card = 1 ∧
          (Finset.univ.filter fun i => w i = v + 1).card = 1 := by
  sorry

/-! ## Layer 6: Eulerian exclusion and classical monodromy -/

/-- The complete necessary classification of Eulerian exterior rows. The only
ambient dimensions are two and three; complementary exponents use their minimum.
This is Lawrence–Sawin Proposition 3.15/B.1 with finite weight support and exact
normalization of the exceptional degree. -/
theorem exterior_eulerian_classification {m k n d : ℕ} (w : Fin m → ℤ) (s : ℤ)
    (hn : 2 ≤ n) (hd : 1 ≤ d) (hk : 1 < k) (hkm : k + 1 < m)
    (hrow : hasEulerianExteriorWeights w k n d s) :
    (n = 2 ∨ n = 3) ∧
      ((m = 4 ∧ k = 2) ∨
        (n = 2 ∧ 2 < min k (m - k) ∧
          d = Nat.choose (2 * min k (m - k) - 1) (min k (m - k))) ∨
        (n = 3 ∧ ∃ j : ℕ, 1 ≤ j ∧ d = exceptionalDegree j)) := by
  sorry

end TauCetiRoadmap.SheafConvolutionOnAbelianVarieties
