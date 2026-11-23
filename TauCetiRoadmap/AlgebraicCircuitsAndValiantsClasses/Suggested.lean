import Mathlib

/-!
# Algebraic circuits and Valiant's classes: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

A circuit with `s` gates assigns to each position `k < s` a gate that reads a variable, reads a
constant, or adds or multiplies the values at two positions below `k`; `Circuit.val` evaluates
it. A family of polynomials has `nvars n` variables, indexed by `Fin (nvars n)`, at each index
`n`. `VP` bounds the number of variables, the total degree and the number of gates by the value
at `n` of one polynomial with natural coefficients; `VNP` adds up a family in `VP` over all
subsets of a block of its last variables, those in the subset set to `1` and the others to `0`.
The permanent and the determinant are Mathlib's `Matrix.permanent` and `Matrix.det` of the
generic matrix `Matrix.mvPolynomialX`, and `hamCycleSum` is the analogous sum over the
permutations consisting of one cycle through every index.
-/

noncomputable section

open MvPolynomial Finset

namespace TauCetiRoadmap.AlgebraicCircuitsAndValiantsClasses

universe u v

/-! ## Layer 1: circuits and Valiant's classes -/

section Model

/-- 1.1 The gate at position `k` of a circuit: an input reading a variable or a constant, or
an addition or multiplication whose two arguments are positions `i, j < k` (`i = j` allowed). -/
inductive Gate (V : Type u) (R : Type v) (k : ℕ) where
  /-- reads the variable `v` -/
  | var : V → Gate V R k
  /-- reads the constant `a` -/
  | const : R → Gate V R k
  /-- adds the values at two earlier positions -/
  | add : Fin k → Fin k → Gate V R k
  /-- multiplies the values at two earlier positions -/
  | mul : Fin k → Fin k → Gate V R k

/-- 1.1 A circuit with `s` gates, inputs included: one gate at each position `k < s`. -/
abbrev Circuit (V : Type u) (R : Type v) (s : ℕ) : Type (max u v) := (k : Fin s) → Gate V R k

variable {V : Type u} {R : Type v} [CommSemiring R]

/-- 1.1 The polynomial at position `k` of the circuit `c`, by recursion on `k`. -/
def Circuit.val {s : ℕ} (c : Circuit V R s) (k : Fin s) : MvPolynomial V R :=
  match c k with
  | .var v => X v
  | .const a => C a
  | .add i j => c.val (Fin.castLT i (i.2.trans k.2)) + c.val (Fin.castLT j (j.2.trans k.2))
  | .mul i j => c.val (Fin.castLT i (i.2.trans k.2)) * c.val (Fin.castLT j (j.2.trans k.2))
termination_by k.val
decreasing_by all_goals (rw [Fin.val_castLT]; exact Fin.is_lt _)

/-- 1.1 `Computes f s`: some circuit with `s` gates has `f` as the value at one of its
positions. -/
def Computes (f : MvPolynomial V R) (s : ℕ) : Prop :=
  ∃ c : Circuit V R s, ∃ k, c.val k = f

/-- 1.1 `ComputesAll f s`: a single circuit with `s` gates has every `f i` among its values. -/
def ComputesAll {ι : Type*} (f : ι → MvPolynomial V R) (s : ℕ) : Prop :=
  ∃ c : Circuit V R s, ∀ i, ∃ k, c.val k = f i

/-- 1.1 A projection entry: a variable or a constant. -/
def IsProjEntry (p : MvPolynomial V R) : Prop :=
  (∃ v, p = X v) ∨ ∃ a, p = C a

/-- 1.1 The subset sum of a polynomial in `m + r` variables: for every subset `S` of the last
`r` variables, those in `S` are set to `1` and the other `r - |S|` to `0`, and the `2 ^ r`
results are added. -/
def subsetSum {m r : ℕ} (g : MvPolynomial (Fin (m + r)) R) : MvPolynomial (Fin m) R :=
  ∑ S : Finset (Fin r), aeval (Fin.append X fun i => if i ∈ S then 1 else 0) g

end Model

/-- 1.1 `PolyFamily R`: for each `n : ℕ` a number `nvars n` and a polynomial over `R` in the
variables `Fin (nvars n)`. -/
structure PolyFamily (R : Type v) [CommSemiring R] where
  /-- the number of variables of the `n`-th member -/
  nvars : ℕ → ℕ
  /-- the `n`-th member -/
  poly : ∀ n, MvPolynomial (Fin (nvars n)) R

/-- 1.1 Valiant's class `VP R`: one polynomial `p` with natural coefficients bounds, at every
`n`, the number of variables of the `n`-th member, its total degree, and the number of gates of
a circuit computing it. -/
def VP (R : Type v) [CommSemiring R] : Set (PolyFamily R) :=
  {f | ∃ p : Polynomial ℕ, ∀ n, f.nvars n ≤ p.eval n ∧ (f.poly n).totalDegree ≤ p.eval n ∧
    Computes (f.poly n) (p.eval n)}

/-- 1.1 Valiant's class `VNP R`: a family `g` in `VP R` whose `n`-th member has
`f.nvars n + r` variables, for some `r`, and whose subset sum over the last `r` of them is the
`n`-th member of `f`. -/
def VNP (R : Type v) [CommSemiring R] : Set (PolyFamily R) :=
  {f | ∃ g ∈ VP R, ∀ n, ∃ (r : ℕ) (h : g.nvars n = f.nvars n + r),
    f.poly n = subsetSum (rename (finCongr h) (g.poly n))}

variable {R : Type v} [CommSemiring R]

/-- 1.2 (a) `VNP` is closed under subset sums: if `g ∈ VNP R` has `f.nvars n + t n` variables at
`n`, and the subset sum of its `n`-th member over the last `t n` variables is the `n`-th member
of `f`, then `f ∈ VNP R`. -/
theorem mem_VNP_of_subsetSum (f g : PolyFamily R) (t : ℕ → ℕ)
    (h : ∀ n, g.nvars n = f.nvars n + t n)
    (hf : ∀ n, f.poly n = subsetSum (rename (finCongr (h n)) (g.poly n))) (hg : g ∈ VNP R) :
    f ∈ VNP R := by
  sorry

/-- 1.2 (b) `VP` is closed under polynomially bounded projections: if every variable of the
`q n`-th member of `g` is replaced by a variable or a constant, with `q n ≤ p.eval n` and at
most `p.eval n` variables in the result, the family obtained is in `VP`. -/
theorem mem_VP_of_projection (f g : PolyFamily R) (p : Polynomial ℕ) (q : ℕ → ℕ)
    (hq : ∀ n, q n ≤ p.eval n) (hcard : ∀ n, f.nvars n ≤ p.eval n)
    (σ : ∀ n, Fin (g.nvars (q n)) → MvPolynomial (Fin (f.nvars n)) R)
    (hσ : ∀ n i, IsProjEntry (σ n i))
    (hf : ∀ n, f.poly n = aeval (σ n) (g.poly (q n))) (hg : g ∈ VP R) : f ∈ VP R := by
  sorry

/-- 1.2 (b) `VNP` is closed under polynomially bounded projections, with the hypotheses of
`mem_VP_of_projection`. -/
theorem mem_VNP_of_projection (f g : PolyFamily R) (p : Polynomial ℕ) (q : ℕ → ℕ)
    (hq : ∀ n, q n ≤ p.eval n) (hcard : ∀ n, f.nvars n ≤ p.eval n)
    (σ : ∀ n, Fin (g.nvars (q n)) → MvPolynomial (Fin (f.nvars n)) R)
    (hσ : ∀ n i, IsProjEntry (σ n i))
    (hf : ∀ n, f.poly n = aeval (σ n) (g.poly (q n))) (hg : g ∈ VNP R) : f ∈ VNP R := by
  sorry

/-! ## Layer 2: homogeneous components and partial derivatives -/

/-- 2.1 Homogenization: if `f` is computed with `s` gates, then for every `d` some circuit with
`s * (d + 1) ^ 2 + 1` gates, the value at each of which is homogeneous, has the homogeneous
components of `f` of degrees `0, …, d` among its values. -/
theorem exists_homogeneous_circuit {V : Type u} {f : MvPolynomial V R} {s : ℕ}
    (hf : Computes f s) (d : ℕ) :
    ∃ c : Circuit V R (s * (d + 1) ^ 2 + 1), (∀ k, ∃ j, (c.val k).IsHomogeneous j) ∧
      ∀ i : Fin (d + 1), ∃ k, c.val k = homogeneousComponent i f := by
  sorry

/-- 2.2 Baur–Strassen: if `f` is computed with `s` gates, then one circuit with `5 * s + 2`
gates computes `f` and all its partial derivatives. -/
theorem computesAll_pderiv {V : Type u} {f : MvPolynomial V R} {s : ℕ} (hf : Computes f s) :
    ComputesAll (fun o : Option V => o.elim f fun v => pderiv v f) (5 * s + 2) := by
  sorry

/-! ## Layer 3: the permanent and the Hamiltonian cycle polynomial -/

/-- 3.1 Ryser's formula: `perm A = Σ_S (-1) ^ (n - |S|) ∏_i Σ_{j ∈ S} A i j`. -/
theorem permanent_eq_sum_powerset {R : Type*} [CommRing R] {n : Type*} [Fintype n]
    [DecidableEq n] (A : Matrix n n R) :
    A.permanent = ∑ S : Finset n, (-1) ^ (Fintype.card n - S.card) * ∏ i, ∑ j ∈ S, A i j := by
  sorry

/-- 3.2 Glynn's formula, with `ε true = 1` and `ε false = -1`: the sum over the sign vectors
with `δ i₀ = true` is `2 ^ (n - 1) * perm A`, and the sum over all sign vectors is
`2 ^ n * perm A`. -/
theorem permanent_glynn {R : Type*} [CommRing R] {n : Type*} [Fintype n] [DecidableEq n]
    (A : Matrix n n R) :
    (∀ i₀ : n, 2 ^ (Fintype.card n - 1) * A.permanent =
      ∑ δ ∈ univ.filter (fun δ : n → Bool => δ i₀ = true),
        (∏ k, (if δ k then 1 else -1 : R)) * ∏ i, ∑ j, (if δ j then 1 else -1 : R) * A i j) ∧
    2 ^ Fintype.card n * A.permanent =
      ∑ δ : n → Bool,
        (∏ k, (if δ k then 1 else -1 : R)) * ∏ i, ∑ j, (if δ j then 1 else -1 : R) * A i j := by
  sorry

/-- 3.3 The Hamiltonian cycle sum of a square matrix, beside `Matrix.permanent` and
`Matrix.det`: the sum of `∏ i, M i (σ i)` over the permutations `σ` whose cycle type is the
single cycle length `Fintype.card n`. It is `0` when there are fewer than two indices. -/
def hamCycleSum {n : Type*} [Fintype n] [DecidableEq n] (M : Matrix n n R) : R :=
  ∑ σ ∈ univ.filter (fun σ : Equiv.Perm n => σ.cycleType = {Fintype.card n}), ∏ i, M i (σ i)

/-- 3.3 The permanent family: the permanent of the generic `n × n` matrix, the entry in row `i`
and column `j` being the variable `finProdFinEquiv (i, j)` of `Fin (n * n)`. -/
def permFamily (R : Type v) [CommSemiring R] : PolyFamily R where
  nvars n := n * n
  poly n := rename finProdFinEquiv (Matrix.mvPolynomialX (Fin n) (Fin n) R).permanent

/-- 3.3 The Hamiltonian cycle family: `hamCycleSum` of the generic `n × n` matrix, with the
variables of `permFamily`. -/
def hcFamily (R : Type v) [CommSemiring R] : PolyFamily R where
  nvars n := n * n
  poly n := rename finProdFinEquiv (hamCycleSum (Matrix.mvPolynomialX (Fin n) (Fin n) R))

/-- 3.4 The permanent family is in `VNP` over every commutative ring. -/
theorem permFamily_mem_VNP (R : Type v) [CommRing R] : permFamily R ∈ VNP R := by
  sorry

/-- 3.4 The Hamiltonian cycle family is in `VNP` over every commutative ring. -/
theorem hcFamily_mem_VNP (R : Type v) [CommRing R] : hcFamily R ∈ VNP R := by
  sorry

/-! ## Layer 4: the determinant -/

/-- 4.1 The determinant family: the determinant of the generic `n × n` matrix, with the
variables of `permFamily`. -/
def detFamily (R : Type v) [CommRing R] : PolyFamily R where
  nvars n := n * n
  poly n := rename finProdFinEquiv (Matrix.mvPolynomialX (Fin n) (Fin n) R).det

/-- 4.1 The determinant of the generic `n × n` matrix is computed with `4 * (n + 1) ^ 4` gates,
over every commutative ring; hence the determinant family is in `VP`. -/
theorem computes_det_and_detFamily_mem_VP (R : Type v) [CommRing R] :
    (∀ n : ℕ, Computes (Matrix.mvPolynomialX (Fin n) (Fin n) R).det (4 * (n + 1) ^ 4)) ∧
      detFamily R ∈ VP R := by
  sorry

/-- 4.2 Arithmetic formulas: variables and constants at the leaves, sums and products at the
inner nodes. -/
inductive Formula (V : Type*) (R : Type*) where
  /-- a variable -/
  | var : V → Formula V R
  /-- a constant -/
  | const : R → Formula V R
  /-- the sum of two formulas -/
  | add : Formula V R → Formula V R → Formula V R
  /-- the product of two formulas -/
  | mul : Formula V R → Formula V R → Formula V R

namespace Formula

variable {V : Type*}

/-- 4.2 The polynomial a formula computes. -/
def eval : Formula V R → MvPolynomial V R
  | var v => X v
  | const a => C a
  | add φ ψ => eval φ + eval ψ
  | mul φ ψ => eval φ * eval ψ

/-- 4.2 The size of a formula: its number of nodes. -/
def size : Formula V R → ℕ
  | var _ => 1
  | const _ => 1
  | add φ ψ => size φ + size ψ + 1
  | mul φ ψ => size φ + size ψ + 1

end Formula

/-- 4.2 (a) Universality of the permanent: a formula of size `s` computes the permanent of a
square matrix of side at most `s + 1` whose entries are variables and constants. -/
theorem exists_permanent_eq_eval {V : Type*} (φ : Formula V R) :
    ∃ n ≤ φ.size + 1, ∃ M : Matrix (Fin n) (Fin n) (MvPolynomial V R),
      (∀ i j, IsProjEntry (M i j)) ∧ M.permanent = φ.eval := by
  sorry

/-- 4.2 (b) Universality of the determinant: over a commutative ring, a formula of size `s`
computes the determinant of a square matrix of side at most `s + 2` whose entries are
variables and constants. -/
theorem exists_det_eq_eval {R : Type*} [CommRing R] {V : Type*} (φ : Formula V R) :
    ∃ n ≤ φ.size + 2, ∃ M : Matrix (Fin n) (Fin n) (MvPolynomial V R),
      (∀ i j, IsProjEntry (M i j)) ∧ M.det = φ.eval := by
  sorry

/-! ## Layer 5: the permanent as a determinant -/

/-- 5.1 Mignon–Ressayre: over a field of characteristic `0` or of characteristic at least `m`, if
the permanent of the generic `m × m` matrix is the determinant of an `n × n` matrix whose
entries have total degree at most one, then `m ^ 2 ≤ 2 * n`. -/
theorem sq_le_two_mul_of_det_eq_permanent {F : Type*} [Field F] {m n : ℕ}
    (A : Matrix (Fin n) (Fin n) (MvPolynomial (Fin m × Fin m) F))
    (hA : ∀ i j, (A i j).totalDegree ≤ 1) (hchar : ringChar F = 0 ∨ m ≤ ringChar F)
    (h : A.det = (Matrix.mvPolynomialX (Fin m) (Fin m) F).permanent) : m ^ 2 ≤ 2 * n := by
  sorry

end TauCetiRoadmap.AlgebraicCircuitsAndValiantsClasses
