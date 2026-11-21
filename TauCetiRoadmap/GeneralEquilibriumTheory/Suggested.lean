import Mathlib

/-!
# General equilibrium theory: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's routes, Checks and worked examples are not
restated.

An exchange economy has a finite type `ι` of consumers and `ℓ` goods. A bundle is
`x : Fin ℓ → ℝ` with the pointwise order, and the consumption set is the orthant `0 ≤ x`.
Consumer `i` has a utility `u i : (Fin ℓ → ℝ) → ℝ`, of which only the values on the orthant
enter, and an endowment `ω i`; prices are vectors `p : Fin ℓ → ℝ`, and the income of `i` at `p`
is `p ⬝ᵥ ω i`. The budget set, local nonsatiation and the Marshallian demand are copied verbatim
from ConsumerTheoryDuality 1.1 and 1.2, and the probability simplex from
RegretMinimizationAndEquilibria (Conventions and Layer 1, 1.1), because a roadmap's Lean file does
not import another roadmap's module. Prices are normalized to `simplex (Fin ℓ)`.
-/

noncomputable section

open Matrix Set

namespace TauCetiRoadmap.GeneralEquilibriumTheory

variable {ℓ : ℕ}

/-! ## Layer 1: exchange economies and equilibrium notions -/

-- 1.1 (copied verbatim from ConsumerTheoryDuality, Layer 1, 1.1)
/-- 1.1 The budget set at prices `p` and income `m`: the nonnegative bundles that cost at most
`m`. -/
def budgetSet (p : Fin ℓ → ℝ) (m : ℝ) : Set (Fin ℓ → ℝ) :=
  {x | 0 ≤ x ∧ p ⬝ᵥ x ≤ m}

-- 1.1 (copied verbatim from ConsumerTheoryDuality, Layer 1, 1.1)
/-- 1.1 Local nonsatiation on the orthant: arbitrarily close to every nonnegative bundle there is
a nonnegative bundle of strictly higher utility. -/
def LocallyNonsatiated (u : (Fin ℓ → ℝ) → ℝ) : Prop :=
  ∀ x, 0 ≤ x → ∀ ε > 0, ∃ z, 0 ≤ z ∧ dist z x < ε ∧ u x < u z

-- 1.1 (copied verbatim from ConsumerTheoryDuality, Layer 1, 1.2)
/-- 1.2 The Marshallian demand at `(p, m)`: the set of maximizers of `u` on the budget set. -/
def marshallianDemand (u : (Fin ℓ → ℝ) → ℝ) (p : Fin ℓ → ℝ) (m : ℝ) : Set (Fin ℓ → ℝ) :=
  {x | x ∈ budgetSet p m ∧ ∀ y ∈ budgetSet p m, u y ≤ u x}

/-- 1.1 Strict quasiconcavity on the orthant: the utility of a proper convex combination of two
distinct nonnegative bundles exceeds the smaller of their utilities. -/
def IsStrictlyQuasiconcave (u : (Fin ℓ → ℝ) → ℝ) : Prop :=
  ∀ x, 0 ≤ x → ∀ y, 0 ≤ y → x ≠ y → ∀ a b : ℝ, 0 < a → 0 < b → a + b = 1 →
    min (u x) (u y) < u (a • x + b • y)

-- 1.2 (copied verbatim from RegretMinimizationAndEquilibria, Conventions and Layer 1, 1.1)
/-- The probability simplex on a finite type, as a set of weight vectors: the weights of
Mathlib's `Convexity.StdSimplex`. -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

section Economy

variable {ι : Type*} [Fintype ι]

/-- 1.2 An allocation of the endowments `ω`: nonnegative bundles whose sum is the total
endowment. -/
def IsAllocation (ω x : ι → Fin ℓ → ℝ) : Prop :=
  (∀ i, 0 ≤ x i) ∧ ∑ i, x i = ∑ i, ω i

/-- 1.2 Pareto optimality: `x` is an allocation, and no allocation gives every consumer at least
her utility at `x` and some consumer more. -/
def IsParetoOptimal (u : ι → (Fin ℓ → ℝ) → ℝ) (ω x : ι → Fin ℓ → ℝ) : Prop :=
  IsAllocation ω x ∧
    ¬∃ y, IsAllocation ω y ∧ (∀ i, u i (x i) ≤ u i (y i)) ∧ ∃ i, u i (x i) < u i (y i)

/-- 1.3 A Walrasian equilibrium `(p, x)`: every consumer's bundle is in her Marshallian demand at
the prices `p` and the income `p ⬝ᵥ ω i`, and the markets clear exactly. -/
def IsWalrasianEquilibrium (u : ι → (Fin ℓ → ℝ) → ℝ) (ω : ι → Fin ℓ → ℝ) (p : Fin ℓ → ℝ)
    (x : ι → Fin ℓ → ℝ) : Prop :=
  (∀ i, x i ∈ marshallianDemand (u i) p (p ⬝ᵥ ω i)) ∧ ∑ i, x i = ∑ i, ω i

/-- 1.3 A free-disposal equilibrium `(p, x)`: every bundle is demanded, and total demand is at
most the total endowment. -/
def IsFreeDisposalEquilibrium (u : ι → (Fin ℓ → ℝ) → ℝ) (ω : ι → Fin ℓ → ℝ) (p : Fin ℓ → ℝ)
    (x : ι → Fin ℓ → ℝ) : Prop :=
  (∀ i, x i ∈ marshallianDemand (u i) p (p ⬝ᵥ ω i)) ∧ ∑ i, x i ≤ ∑ i, ω i

/-- 1.3 A quasi-equilibrium `(p, x)`: `p ≠ 0`, `x` is an allocation, every bundle is affordable,
and every bundle at least as good as `x i` costs at least as much as `x i`. -/
def IsQuasiEquilibrium (u : ι → (Fin ℓ → ℝ) → ℝ) (ω : ι → Fin ℓ → ℝ) (p : Fin ℓ → ℝ)
    (x : ι → Fin ℓ → ℝ) : Prop :=
  p ≠ 0 ∧ IsAllocation ω x ∧
    ∀ i, x i ∈ budgetSet p (p ⬝ᵥ ω i) ∧ ∀ y, 0 ≤ y → u i (x i) ≤ u i y → p ⬝ᵥ x i ≤ p ⬝ᵥ y

/-! ## Layer 2: the Gale–Nikaido–Debreu lemma -/

/-- 2.1 **The Gale–Nikaido–Debreu lemma.** Let `ℓ ≥ 1` and let `ζ` be upper hemicontinuous on
the price simplex with nonempty, convex and compact values there, satisfying Walras' law in the
weak form `p ⬝ᵥ z ≤ 0` for every `z ∈ ζ p`. Then some price `p` in the simplex has some `z ∈ ζ p`
with `z ≤ 0`. -/
theorem gale_nikaido_debreu (hℓ : 0 < ℓ) {ζ : (Fin ℓ → ℝ) → Set (Fin ℓ → ℝ)}
    (huhc : UpperHemicontinuousOn ζ (simplex (Fin ℓ)))
    (hne : ∀ p ∈ simplex (Fin ℓ), (ζ p).Nonempty) (hconv : ∀ p ∈ simplex (Fin ℓ), Convex ℝ (ζ p))
    (hcpt : ∀ p ∈ simplex (Fin ℓ), IsCompact (ζ p))
    (hwalras : ∀ p ∈ simplex (Fin ℓ), ∀ z ∈ ζ p, p ⬝ᵥ z ≤ 0) :
    ∃ p ∈ simplex (Fin ℓ), ∃ z ∈ ζ p, z ≤ 0 := by
  sorry

/-! ## Layer 3: existence of equilibrium -/

/-- 3.1 Existence of a free-disposal equilibrium. If there is at least one consumer and every
utility is continuous, quasiconcave and locally nonsatiated on the orthant, and every endowment
has positive coordinates, then a free-disposal equilibrium exists at a price in the simplex. -/
theorem exists_isFreeDisposalEquilibrium [Nonempty ι] {u : ι → (Fin ℓ → ℝ) → ℝ}
    {ω : ι → Fin ℓ → ℝ} (hc : ∀ i, ContinuousOn (u i) (Set.Ici 0))
    (hq : ∀ i, QuasiconcaveOn ℝ (Set.Ici 0) (u i)) (hlns : ∀ i, LocallyNonsatiated (u i))
    (hω : ∀ i k, 0 < ω i k) :
    ∃ p ∈ simplex (Fin ℓ), ∃ x, IsFreeDisposalEquilibrium u ω p x := by
  sorry

/-- 3.2 **Existence of Walrasian equilibrium.** If there is at least one consumer and every
utility is continuous, quasiconcave, monotone and locally nonsatiated on the orthant, and every
endowment has positive coordinates, then a Walrasian equilibrium with exact market clearing
exists at a price in the simplex. -/
theorem exists_isWalrasianEquilibrium [Nonempty ι] {u : ι → (Fin ℓ → ℝ) → ℝ}
    {ω : ι → Fin ℓ → ℝ} (hc : ∀ i, ContinuousOn (u i) (Set.Ici 0))
    (hq : ∀ i, QuasiconcaveOn ℝ (Set.Ici 0) (u i)) (hm : ∀ i, MonotoneOn (u i) (Set.Ici 0))
    (hlns : ∀ i, LocallyNonsatiated (u i)) (hω : ∀ i k, 0 < ω i k) :
    ∃ p ∈ simplex (Fin ℓ), ∃ x, IsWalrasianEquilibrium u ω p x := by
  sorry

/-! ## Layer 4: the welfare theorems -/

/-- 4.1 **The first welfare theorem.** If every utility is locally nonsatiated, the allocation of
a Walrasian equilibrium, at any price vector, is Pareto optimal. -/
theorem isParetoOptimal_of_isWalrasianEquilibrium {u : ι → (Fin ℓ → ℝ) → ℝ}
    {ω : ι → Fin ℓ → ℝ} {p : Fin ℓ → ℝ} {x : ι → Fin ℓ → ℝ}
    (hlns : ∀ i, LocallyNonsatiated (u i)) (h : IsWalrasianEquilibrium u ω p x) :
    IsParetoOptimal u ω x := by
  sorry

/-- 4.2 The cheaper-point lemma. If every utility is continuous on the orthant, `(p, x)` is a
quasi-equilibrium and every consumer can afford a nonnegative bundle costing strictly less than
her income `p ⬝ᵥ ω i`, then `(p, x)` is a Walrasian equilibrium. -/
theorem isWalrasianEquilibrium_of_isQuasiEquilibrium {u : ι → (Fin ℓ → ℝ) → ℝ}
    {ω : ι → Fin ℓ → ℝ} {p : Fin ℓ → ℝ} {x : ι → Fin ℓ → ℝ}
    (hc : ∀ i, ContinuousOn (u i) (Set.Ici 0)) (h : IsQuasiEquilibrium u ω p x)
    (hcheap : ∀ i, ∃ y, 0 ≤ y ∧ p ⬝ᵥ y < p ⬝ᵥ ω i) :
    IsWalrasianEquilibrium u ω p x := by
  sorry

/-- 4.3 **The second welfare theorem.** If there is at least one consumer and every utility is
continuous, quasiconcave and locally nonsatiated on the orthant, then every Pareto optimal
allocation `x` is a quasi-equilibrium of the economy whose endowments are `x` itself: some
`p ≠ 0` makes every bundle at least as good as `x i` cost at least `p ⬝ᵥ x i`. -/
theorem exists_isQuasiEquilibrium_of_isParetoOptimal [Nonempty ι] {u : ι → (Fin ℓ → ℝ) → ℝ}
    {ω x : ι → Fin ℓ → ℝ} (hc : ∀ i, ContinuousOn (u i) (Set.Ici 0))
    (hq : ∀ i, QuasiconcaveOn ℝ (Set.Ici 0) (u i)) (hlns : ∀ i, LocallyNonsatiated (u i))
    (hx : IsParetoOptimal u ω x) :
    ∃ p, IsQuasiEquilibrium u x p x := by
  sorry

/-! ## Layer 5: the core and replica economies -/

/-- 5.1 The core: `x` is an allocation, and no nonempty coalition `S` can give each of its members
a nonnegative bundle she strictly prefers to `x a`, using only the endowments of its members. -/
def IsInCore (u : ι → (Fin ℓ → ℝ) → ℝ) (ω x : ι → Fin ℓ → ℝ) : Prop :=
  IsAllocation ω x ∧
    ¬∃ S : Finset ι, S.Nonempty ∧ ∃ y : ι → Fin ℓ → ℝ, (∀ a ∈ S, 0 ≤ y a) ∧
      ∑ a ∈ S, y a = ∑ a ∈ S, ω a ∧ ∀ a ∈ S, u a (x a) < u a (y a)

/-- 5.1 The `n`-th replica of data indexed by types: the agent `(i, j)` of `ι × Fin n` is the
`j`-th copy of type `i` and receives the datum of type `i`. -/
def replica {α : Type*} (f : ι → α) (n : ℕ) : ι × Fin n → α :=
  fun a => f a.1

/-- 5.2 Walrasian allocations are in the core: the allocation of a Walrasian equilibrium, at any
price vector, is in the core, with no hypothesis on the utilities. -/
theorem isInCore_of_isWalrasianEquilibrium {u : ι → (Fin ℓ → ℝ) → ℝ} {ω : ι → Fin ℓ → ℝ}
    {p : Fin ℓ → ℝ} {x : ι → Fin ℓ → ℝ} (h : IsWalrasianEquilibrium u ω p x) :
    IsInCore u ω x := by
  sorry

/-- 5.3 **Equal treatment in the core of a replica economy.** If every utility is continuous,
strictly monotone and strictly quasiconcave on the orthant, then in every core allocation of the
`n`-th replica economy any two consumers of the same type receive the same bundle. -/
theorem replica_equal_treatment {u : ι → (Fin ℓ → ℝ) → ℝ} {ω : ι → Fin ℓ → ℝ} {n : ℕ}
    {x : ι × Fin n → Fin ℓ → ℝ} (hc : ∀ i, ContinuousOn (u i) (Set.Ici 0))
    (hsm : ∀ i, StrictMonoOn (u i) (Set.Ici 0)) (hsq : ∀ i, IsStrictlyQuasiconcave (u i))
    (hx : IsInCore (replica u n) (replica ω n) x) (i : ι) (j k : Fin n) :
    x (i, j) = x (i, k) := by
  sorry

/-- 5.4 **The Debreu–Scarf theorem.** Let `ℓ ≥ 1`, let every utility be continuous and strictly
monotone on the orthant, and let every endowment have positive coordinates. An assignment `x` of
bundles to types, given to every copy of its type, lies in the core of the `n`-th replica economy
for every `n ≥ 1` if and only if `x` is the allocation of a Walrasian equilibrium at some price
in the simplex. -/
theorem forall_replica_isInCore_iff (hℓ : 0 < ℓ) {u : ι → (Fin ℓ → ℝ) → ℝ}
    {ω : ι → Fin ℓ → ℝ} (hc : ∀ i, ContinuousOn (u i) (Set.Ici 0))
    (hsm : ∀ i, StrictMonoOn (u i) (Set.Ici 0)) (hω : ∀ i k, 0 < ω i k) (x : ι → Fin ℓ → ℝ) :
    (∀ n : ℕ, 0 < n → IsInCore (replica u n) (replica ω n) (replica x n)) ↔
      ∃ p ∈ simplex (Fin ℓ), IsWalrasianEquilibrium u ω p x := by
  sorry

end Economy

end TauCetiRoadmap.GeneralEquilibriumTheory
