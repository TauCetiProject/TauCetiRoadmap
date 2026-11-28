import Mathlib

/-!
# Revealed preference: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's Checks and worked examples are not
restated.

A choice structure is a family of budgets `B : ι → Set α` with choices `c : ι → Set α`; budgets
may repeat and the family need not be closed under any operation. A preference is a relation
`R : α → α → Prop` that is total (`Std.Total R`) and transitive (`IsTrans α R`), as in
UtilityRepresentationTheorems. Commodity bundles and prices are vectors `Fin ℓ → ℝ`; the
definitions `budgetSet`, `LocallyNonsatiated`, `marshallianDemand` and `slutskyMatrix` are copied
verbatim from ConsumerTheoryDuality (Layers 1 and 5). Derivatives are `fderiv`, which is `0`
where the function is not differentiable.
-/

noncomputable section

open Matrix

namespace TauCetiRoadmap.RevealedPreference

/-! ## Layer 1: choice structures and Richter's theorem -/

section Choice

variable {α ι : Type*}

/-- 1.1 Direct revealed preference: `x` is chosen from some budget that contains `y`. -/
def revealedPreferred (B c : ι → Set α) (x y : α) : Prop :=
  ∃ i, x ∈ c i ∧ y ∈ B i

/-- 1.1 Strict revealed preference: `x` is chosen from some budget that contains `y`, and `y` is
not chosen from it. -/
def strictlyRevealedPreferred (B c : ι → Set α) (x y : α) : Prop :=
  ∃ i, x ∈ c i ∧ y ∈ B i ∧ y ∉ c i

/-- 1.1 The relation `R` rationalizes the choice: each choice set is the set of `R`-greatest
elements of its budget. -/
def RationalizedBy (B c : ι → Set α) (R : α → α → Prop) : Prop :=
  ∀ i, c i = {x | x ∈ B i ∧ ∀ y ∈ B i, R x y}

/-- 1.1 Richter's congruence axiom: if `y` is chosen from a budget containing `x`, and `x` is
indirectly revealed preferred to `y`, then `x` is chosen from that budget too. -/
def SatisfiesCongruence (B c : ι → Set α) : Prop :=
  ∀ i, ∀ x ∈ B i, ∀ y ∈ c i, Relation.TransGen (revealedPreferred B c) x y → x ∈ c i

/-- 1.1 The strong axiom of revealed preference: the transitive closure of the strict revealed
preference is asymmetric. -/
def SatisfiesSARP (B c : ι → Set α) : Prop :=
  ∀ x y, Relation.TransGen (strictlyRevealedPreferred B c) x y →
    ¬Relation.TransGen (strictlyRevealedPreferred B c) y x

/-- 1.2 Richter's theorem. A choice with `c i ⊆ B i` and every choice set nonempty is
rationalized by a total preorder if and only if it satisfies the congruence axiom. -/
theorem exists_totalPreorder_rationalizedBy_iff_congruence {B c : ι → Set α}
    (hc : ∀ i, c i ⊆ B i) (hne : ∀ i, (c i).Nonempty) :
    (∃ R : α → α → Prop, Std.Total R ∧ IsTrans α R ∧ RationalizedBy B c R) ↔
      SatisfiesCongruence B c := by
  sorry

/-- 1.3 Houthakker's theorem in Richter's form. A choice with `c i ⊆ B i` and every choice set a
singleton is rationalized by a total preorder if and only if it satisfies the strong axiom. -/
theorem exists_totalPreorder_rationalizedBy_iff_sarp {B c : ι → Set α}
    (hc : ∀ i, c i ⊆ B i) (hsing : ∀ i, ∃ a, c i = {a}) :
    (∃ R : α → α → Prop, Std.Total R ∧ IsTrans α R ∧ RationalizedBy B c R) ↔
      SatisfiesSARP B c := by
  sorry

end Choice

/-! ## Layer 2: finite consumption data and Afriat's theorem -/

section Copied

variable {ℓ : ℕ}

/-- 2.1 The budget set at prices `p` and income `m`: the nonnegative bundles that cost at most
`m` (copied verbatim from ConsumerTheoryDuality 1.1). -/
def budgetSet (p : Fin ℓ → ℝ) (m : ℝ) : Set (Fin ℓ → ℝ) :=
  {x | 0 ≤ x ∧ p ⬝ᵥ x ≤ m}

/-- 2.1 Local nonsatiation on the orthant: arbitrarily close to every nonnegative bundle there is
a nonnegative bundle of strictly higher utility (copied verbatim from ConsumerTheoryDuality
1.1). -/
def LocallyNonsatiated (u : (Fin ℓ → ℝ) → ℝ) : Prop :=
  ∀ x, 0 ≤ x → ∀ ε > 0, ∃ z, 0 ≤ z ∧ dist z x < ε ∧ u x < u z

/-- 2.1 The Marshallian demand at `(p, m)`: the set of maximizers of `u` on the budget set
(copied verbatim from ConsumerTheoryDuality 1.2). -/
def marshallianDemand (u : (Fin ℓ → ℝ) → ℝ) (p : Fin ℓ → ℝ) (m : ℝ) : Set (Fin ℓ → ℝ) :=
  {x | x ∈ budgetSet p m ∧ ∀ y ∈ budgetSet p m, u y ≤ u x}

end Copied

section Afriat

variable {ℓ : ℕ} {ι : Type*}

/-- 2.1 Observation `s` is directly revealed preferred to observation `t`: the bundle `x t` cost
at most `x s` at the prices `p s`. -/
def directlyRevealedPreferred (p x : ι → Fin ℓ → ℝ) (s t : ι) : Prop :=
  p s ⬝ᵥ x t ≤ p s ⬝ᵥ x s

/-- 2.1 The generalized axiom of revealed preference: if `s` is revealed preferred to `t`
through a chain of direct revelations, then `x s` is not strictly cheaper than `x t` at the
prices `p t`. -/
def SatisfiesGARP (p x : ι → Fin ℓ → ℝ) : Prop :=
  ∀ s t, Relation.TransGen (directlyRevealedPreferred p x) s t → p t ⬝ᵥ x t ≤ p t ⬝ᵥ x s

/-- 2.1 The numbers `φ` and `lam` solve the Afriat inequalities: every `lam t` is positive and
`φ t ≤ φ s + lam s * (p s ⬝ᵥ (x t - x s))` for all `s`, `t`. -/
def SatisfiesAfriatInequalities (p x : ι → Fin ℓ → ℝ) (φ lam : ι → ℝ) : Prop :=
  (∀ t, 0 < lam t) ∧ ∀ s t, φ t ≤ φ s + lam s * (p s ⬝ᵥ (x t - x s))

/-- 2.1 The utility `u` rationalizes the data: each `x t` maximizes `u` over the budget set at
the prices `p t` and the income `p t ⬝ᵥ x t`. -/
def Rationalizes (u : (Fin ℓ → ℝ) → ℝ) (p x : ι → Fin ℓ → ℝ) : Prop :=
  ∀ t, x t ∈ marshallianDemand u (p t) (p t ⬝ᵥ x t)

/-- 2.2 Afriat's theorem. For finitely many observations with prices with positive coordinates,
nonnegative bundles and at least one good, these are equivalent: the data are rationalized by a
locally nonsatiated utility; they satisfy GARP; the Afriat inequalities have a solution; they are
rationalized by a continuous, concave, strictly increasing utility. -/
theorem afriat_tfae [Finite ι] (hℓ : 0 < ℓ) {p x : ι → Fin ℓ → ℝ} (hp : ∀ t i, 0 < p t i)
    (hx : ∀ t, 0 ≤ x t) :
    List.TFAE
      [∃ u : (Fin ℓ → ℝ) → ℝ, LocallyNonsatiated u ∧ Rationalizes u p x,
        SatisfiesGARP p x,
        ∃ φ lam : ι → ℝ, SatisfiesAfriatInequalities p x φ lam,
        ∃ u : (Fin ℓ → ℝ) → ℝ, Continuous u ∧ ConcaveOn ℝ Set.univ u ∧ StrictMono u ∧
          Rationalizes u p x] := by
  sorry

end Afriat

/-! ## Layer 3: the weak axiom and the Slutsky matrix -/

section CopiedSlutsky

variable {ℓ : ℕ}

/-- 3.1 The Slutsky matrix of a demand function `x` at `(p, m)`: the entry `(i, j)` is
`∂xᵢ/∂pⱼ + xⱼ ∂xᵢ/∂m`, with the partial derivatives taken from the Fréchet derivative of
`(q, m') ↦ x q m'` at `(p, m)` (copied verbatim from ConsumerTheoryDuality 5.1). -/
def slutskyMatrix (x : (Fin ℓ → ℝ) → ℝ → Fin ℓ → ℝ) (p : Fin ℓ → ℝ) (m : ℝ) :
    Matrix (Fin ℓ) (Fin ℓ) ℝ :=
  fun i j => fderiv ℝ (Function.uncurry x) (p, m) (Pi.single j 1, 0) i +
    x p m j * fderiv ℝ (Function.uncurry x) (p, m) (0, 1) i

end CopiedSlutsky

section WARP

variable {ℓ : ℕ}

/-- 3.1 The weak axiom of revealed preference for a demand function on prices with positive
coordinates and positive incomes: if `x q n` differs from `x p m` and is affordable at
`(p, m)`, then `x p m` is not affordable at `(q, n)`. -/
def SatisfiesWARP (x : (Fin ℓ → ℝ) → ℝ → Fin ℓ → ℝ) : Prop :=
  ∀ p m q n, (∀ i, 0 < p i) → 0 < m → (∀ i, 0 < q i) → 0 < n →
    x q n ≠ x p m → p ⬝ᵥ x q n ≤ m → n < q ⬝ᵥ x p m

/-- 3.2 Samuelson's theorem. For a demand function that exhausts the budget and satisfies the
weak axiom, at prices with positive coordinates and positive income the Slutsky matrix is
negative semidefinite as a quadratic form, sends `p` to `0`, and has `p` as a left null vector.
No differentiability is assumed: where `x` is not differentiable the matrix is `0`. -/
theorem slutskyMatrix_negSemidef_of_warp {x : (Fin ℓ → ℝ) → ℝ → Fin ℓ → ℝ}
    (hW : SatisfiesWARP x) (hbe : ∀ q n, (∀ i, 0 < q i) → 0 < n → q ⬝ᵥ x q n = n)
    {p : Fin ℓ → ℝ} (hp : ∀ i, 0 < p i) {m : ℝ} (hm : 0 < m) :
    (∀ w, w ⬝ᵥ (slutskyMatrix x p m *ᵥ w) ≤ 0) ∧ slutskyMatrix x p m *ᵥ p = 0 ∧
      p ᵥ* slutskyMatrix x p m = 0 := by
  sorry

end WARP

end TauCetiRoadmap.RevealedPreference
