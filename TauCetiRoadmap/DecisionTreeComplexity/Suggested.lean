import Mathlib

/-!
# Decision tree complexity: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

A Boolean function on `n` variables is a map `f : (Fin n → Bool) → Bool`. Its complexity
measures are natural numbers: the least depth `D(f)` of a decision tree computing it, the
certificate complexity `C(f)`, the sensitivity `s(f)`, the block sensitivity `bs(f)` and the
degree `deg(f)` of a real polynomial representing it on the points of `{0, 1}ⁿ`. The least
values are `sInf`s of sets of natural numbers that are nonempty (1.1, 1.2, 2.1); the maxima over
inputs are `Finset.sup`s, which are `0` for a constant function. A real polynomial is evaluated
at an input by sending `true` to `1` and `false` to `0`.
-/

noncomputable section

open Finset
open scoped Classical Polynomial

namespace TauCetiRoadmap.DecisionTreeComplexity

variable {n : ℕ}

/-! ## Layer 1: the combinatorial measures and their chain -/

/-- 1.1 A deterministic decision tree on `n` Boolean variables: a leaf carrying an output, or a
node that queries the variable `i` and continues with the first subtree when `x i = false` and
with the second when `x i = true`. -/
inductive DecisionTree (n : ℕ) : Type where
  | leaf (b : Bool) : DecisionTree n
  | node (i : Fin n) (t₀ t₁ : DecisionTree n) : DecisionTree n

namespace DecisionTree

/-- 1.1 The output of a decision tree on the input `x`: the label of the leaf reached. -/
def eval : DecisionTree n → (Fin n → Bool) → Bool
  | leaf b, _ => b
  | node i t₀ t₁, x => if x i then t₁.eval x else t₀.eval x

/-- 1.1 The depth of a decision tree: the largest number of queries on a path from the root to
a leaf. -/
def depth : DecisionTree n → ℕ
  | leaf _ => 0
  | node _ t₀ t₁ => max t₀.depth t₁.depth + 1

end DecisionTree

/-- 1.1 The deterministic decision-tree complexity `D(f)`: the least depth of a decision tree
computing `f`. -/
def decisionTreeDepth (f : (Fin n → Bool) → Bool) : ℕ :=
  sInf {d | ∃ T : DecisionTree n, T.eval = f ∧ T.depth ≤ d}

/-- 1.2 A set `S` of variables is a certificate for `f` at `x` when every input that agrees
with `x` on `S` has the value `f x`. -/
def IsCertificate (f : (Fin n → Bool) → Bool) (x : Fin n → Bool) (S : Finset (Fin n)) : Prop :=
  ∀ y : Fin n → Bool, (∀ i ∈ S, y i = x i) → f y = f x

/-- 1.2 The certificate complexity of `f` at `x`: the least size of a certificate at `x`. -/
def certComplexityAt (f : (Fin n → Bool) → Bool) (x : Fin n → Bool) : ℕ :=
  sInf (Finset.card '' {S | IsCertificate f x S})

/-- 1.2 The certificate complexity `C(f)`: the largest certificate complexity at an input. -/
def certComplexity (f : (Fin n → Bool) → Bool) : ℕ :=
  univ.sup (certComplexityAt f)

/-- 1.2 The `b`-certificate complexity `C^(b)(f)`: the largest certificate complexity at an
input where `f` takes the value `b` (`0` if there is none). -/
def certComplexityOn (f : (Fin n → Bool) → Bool) (b : Bool) : ℕ :=
  ({x | f x = b} : Finset (Fin n → Bool)).sup (certComplexityAt f)

/-- 1.3 The input `x` with the variables of the block `B` flipped. -/
def flipBlock (x : Fin n → Bool) (B : Finset (Fin n)) : Fin n → Bool :=
  fun i => if i ∈ B then !x i else x i

/-- 1.3 The sensitivity of `f` at `x`: the number of variables whose flip changes the value. -/
def sensitivityAt (f : (Fin n → Bool) → Bool) (x : Fin n → Bool) : ℕ :=
  #{i | f (flipBlock x {i}) ≠ f x}

/-- 1.3 The sensitivity `s(f)`: the largest sensitivity at an input. -/
def sensitivity (f : (Fin n → Bool) → Bool) : ℕ :=
  univ.sup (sensitivityAt f)

/-- 1.3 The block sensitivity of `f` at `x`: the largest number of pairwise disjoint blocks
whose flip changes the value. -/
def blockSensitivityAt (f : (Fin n → Bool) → Bool) (x : Fin n → Bool) : ℕ :=
  ({𝓑 | (𝓑 : Set (Finset (Fin n))).PairwiseDisjoint id ∧ ∀ B ∈ 𝓑, f (flipBlock x B) ≠ f x} :
    Finset (Finset (Finset (Fin n)))).sup Finset.card

/-- 1.3 The block sensitivity `bs(f)`: the largest block sensitivity at an input. -/
def blockSensitivity (f : (Fin n → Bool) → Bool) : ℕ :=
  univ.sup (blockSensitivityAt f)

/-- 1.4 Sensitivity is at most block sensitivity. -/
theorem sensitivity_le_blockSensitivity (f : (Fin n → Bool) → Bool) :
    sensitivity f ≤ blockSensitivity f := by
  sorry

/-- 1.4 Block sensitivity is at most certificate complexity. -/
theorem blockSensitivity_le_certComplexity (f : (Fin n → Bool) → Bool) :
    blockSensitivity f ≤ certComplexity f := by
  sorry

/-- 1.4 Certificate complexity is at most decision-tree complexity. -/
theorem certComplexity_le_decisionTreeDepth (f : (Fin n → Bool) → Bool) :
    certComplexity f ≤ decisionTreeDepth f := by
  sorry

/-! ## Layer 2: the degree of a Boolean function -/

/-- 2.1 The point of `ℝⁿ` attached to an input: `true` becomes `1` and `false` becomes `0`. -/
def boolVec (x : Fin n → Bool) : Fin n → ℝ :=
  fun i => if x i then 1 else 0

/-- 2.1 A real polynomial in `n` variables represents `f` when its value at every input is
`1` where `f` is true and `0` where it is false. -/
def Represents (p : MvPolynomial (Fin n) ℝ) (f : (Fin n → Bool) → Bool) : Prop :=
  ∀ x : Fin n → Bool, MvPolynomial.eval (boolVec x) p = if f x then 1 else 0

/-- 2.1 The degree `deg(f)`: the least total degree of a real polynomial representing `f`. -/
def degree (f : (Fin n → Bool) → Bool) : ℕ :=
  sInf {d | ∃ p : MvPolynomial (Fin n) ℝ, p.totalDegree ≤ d ∧ Represents p f}

/-- 2.1 Every Boolean function is represented by exactly one multilinear polynomial, that is,
one of degree at most `1` in each variable. -/
theorem existsUnique_represents (f : (Fin n → Bool) → Bool) :
    ∃! p : MvPolynomial (Fin n) ℝ, p ∈ MvPolynomial.restrictDegree (Fin n) ℝ 1 ∧
      Represents p f := by
  sorry

/-- 2.1 The degree of `f` is the total degree of its multilinear representing polynomial. -/
theorem totalDegree_eq_degree (f : (Fin n → Bool) → Bool) (p : MvPolynomial (Fin n) ℝ)
    (hp : p ∈ MvPolynomial.restrictDegree (Fin n) ℝ 1) (hf : Represents p f) :
    p.totalDegree = degree f := by
  sorry

/-- 2.2 The degree is at most the decision-tree complexity. -/
theorem degree_le_decisionTreeDepth (f : (Fin n → Bool) → Bool) :
    degree f ≤ decisionTreeDepth f := by
  sorry

/-! ## Layer 3: certificates, sensitivity and depth -/

/-- 3.1 Nisan's theorem: `C(f) ≤ s(f) · bs(f)`. -/
theorem certComplexity_le_sensitivity_mul_blockSensitivity (f : (Fin n → Bool) → Bool) :
    certComplexity f ≤ sensitivity f * blockSensitivity f := by
  sorry

/-- 3.2 The theorem of Beals, Buhrman, Cleve, Mosca and de Wolf: `D(f) ≤ C^(b)(f) · bs(f)`
for each value `b`. -/
theorem decisionTreeDepth_le_certComplexityOn_mul_blockSensitivity
    (f : (Fin n → Bool) → Bool) (b : Bool) :
    decisionTreeDepth f ≤ certComplexityOn f b * blockSensitivity f := by
  sorry

/-- 3.3 `D(f) ≤ s(f) · bs(f)²` and `D(f) ≤ bs(f)³`. -/
theorem decisionTreeDepth_le_blockSensitivity_pow_three (f : (Fin n → Bool) → Bool) :
    decisionTreeDepth f ≤ sensitivity f * blockSensitivity f ^ 2 ∧
      decisionTreeDepth f ≤ blockSensitivity f ^ 3 := by
  sorry

/-- 3.3 `D(f) ≤ C^(0)(f) · C^(1)(f)`. -/
theorem decisionTreeDepth_le_certComplexityOn_mul (f : (Fin n → Bool) → Bool) :
    decisionTreeDepth f ≤ certComplexityOn f false * certComplexityOn f true := by
  sorry

/-! ## Layer 4: the polynomial method -/

/-- 4.1 Symmetrization (Minsky–Papert): for every real polynomial `p` in `m` variables there is
a polynomial `q` in one variable, of degree at most the total degree of `p`, whose value at each
`k ≤ m` is the average of `p` over the inputs with exactly `k` variables true. -/
theorem exists_natDegree_le_eval_mul_choose {m : ℕ} (p : MvPolynomial (Fin m) ℝ) :
    ∃ q : ℝ[X], q.natDegree ≤ p.totalDegree ∧ ∀ k ≤ m,
      q.eval (k : ℝ) * (m.choose k : ℝ) =
        ∑ x : Fin m → Bool with #{i | x i = true} = k, MvPolynomial.eval (boolVec x) p := by
  sorry

/-- 4.2 The lemma of Ehlich–Zeller and Rivlin–Cheney: if `b₁ ≤ p(i) ≤ b₂` at the integers
`0 ≤ i ≤ m` and `|p'(x)| ≥ c ≥ 0` at some `x ∈ [0, m]`, then `c m ≤ deg(p)² (c + b₂ - b₁)`. -/
theorem mul_le_natDegree_sq_mul (p : ℝ[X]) (m : ℕ) {b₁ b₂ c x : ℝ} (hc : 0 ≤ c)
    (hp : ∀ i : ℕ, i ≤ m → b₁ ≤ p.eval (i : ℝ) ∧ p.eval (i : ℝ) ≤ b₂)
    (hx : x ∈ Set.Icc (0 : ℝ) m) (hd : c ≤ |p.derivative.eval x|) :
    c * m ≤ (p.natDegree : ℝ) ^ 2 * (c + b₂ - b₁) := by
  sorry

/-- 4.3 The theorem of Nisan and Szegedy: `bs(f) ≤ 2 deg(f)²`. -/
theorem blockSensitivity_le_two_mul_degree_sq (f : (Fin n → Bool) → Bool) :
    blockSensitivity f ≤ 2 * degree f ^ 2 := by
  sorry

/-- 4.4 The theorem of Nisan and Smolensky: `D(f) ≤ deg(f)² · bs(f)`. -/
theorem decisionTreeDepth_le_degree_sq_mul_blockSensitivity (f : (Fin n → Bool) → Bool) :
    decisionTreeDepth f ≤ degree f ^ 2 * blockSensitivity f := by
  sorry

/-! ## Layer 5: the sensitivity theorem -/

/-- 5.1 Huang's theorem: a set of more than half of the vertices of the cube `{0, 1}ⁿ` contains
a vertex with at least `√n` neighbours in the set. -/
theorem exists_sqrt_le_card_flipBlock_mem (H : Finset (Fin n → Bool))
    (hH : 2 ^ n < 2 * #H) :
    ∃ x ∈ H, √(n : ℝ) ≤ (#{i | flipBlock x {i} ∈ H} : ℝ) := by
  sorry

/-- 5.2 The sensitivity theorem: `deg(f) ≤ s(f)²`, that is, `s(f) ≥ √deg(f)`. -/
theorem degree_le_sensitivity_sq (f : (Fin n → Bool) → Bool) :
    degree f ≤ sensitivity f ^ 2 := by
  sorry

/-- 5.3 Block sensitivity is polynomial in sensitivity: `bs(f) ≤ 2 s(f)⁴`. -/
theorem blockSensitivity_le_two_mul_sensitivity_pow_four (f : (Fin n → Bool) → Bool) :
    blockSensitivity f ≤ 2 * sensitivity f ^ 4 := by
  sorry

end TauCetiRoadmap.DecisionTreeComplexity
