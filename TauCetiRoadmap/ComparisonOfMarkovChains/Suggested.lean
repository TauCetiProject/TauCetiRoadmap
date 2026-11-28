import Mathlib
import TauCeti.Probability.Kernel.Matrix

/-!
# Comparison of Markov chains: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

`transitionMatrix`, `dirichletForm` and `spectralGap` are verbatim copies of the definitions of
MarkovChainMixing 2.1 and 2.4; `randomWalk`, `randomTransposition` and the two instances on
permutations are verbatim copies from RandomWalksOnFiniteGroups 1.1 and 4.2; `funEntropy` and
`logSobolevConstant` are verbatim copies from LogSobolevForMarkovChains 1.1 and 1.2. They are
carried here because a roadmap's file cannot import another roadmap's module.

Suppliers used by the statements: Mathlib `Kernel.Invariant`, `Kernel.IsReversible`,
`Kernel.const`, `Kernel.ofFunOfCountable`, `variance`, `Matrix.charpoly`, `Polynomial.roots`,
`Multiset.sort`, `List.IsChain`, `Finsupp`, `Measure.uniformOfFinset` and `Equiv.swap`; Tau Ceti
`Kernel.toMatrix`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset
open scoped ENNReal

namespace TauCetiRoadmap.ComparisonOfMarkovChains

section Copied

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- Conventions (copied verbatim from MarkovChainMixing 2.1): the real transition matrix
`P x y = κ x {y}`. -/
def transitionMatrix (κ : Kernel S S) : Matrix S S ℝ :=
  κ.toMatrix.map (↑)

/-- Conventions (copied verbatim from MarkovChainMixing 2.4): the Dirichlet form
`E(f) = ½ Σ_{x,y} (f x − f y)² π(x) κ(x, {y})`. -/
def dirichletForm [Fintype S] (κ : Kernel S S) (π : Measure S) (f : S → ℝ) : ℝ :=
  2⁻¹ * ∑ x, ∑ y, (f x - f y) ^ 2 * π.real {x} * (κ x).real {y}

/-- Conventions (copied verbatim from MarkovChainMixing 2.4): the spectral gap `γ`, the infimum
of `E(f) / Var_π(f)` over the functions of nonzero variance, and `0` if there is none. -/
def spectralGap [Fintype S] (κ : Kernel S S) (π : Measure S) : ℝ :=
  ⨅ f : {f : S → ℝ // Var[f; π] ≠ 0}, dirichletForm κ π f / Var[f; π]

end Copied

/-! ## Layer 1: comparison of Dirichlet forms by paths -/

section Paths

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 1.1: `l` is a path from `x` to `y` along the transitions of `κ` charged by `π`: its first
vertex is `x`, its last is `y`, and each consecutive pair `(u, v)` has `π(u) κ(u, {v}) > 0`. -/
def IsChainPath (κ : Kernel S S) (π : Measure S) (x y : S) (l : List S) : Prop :=
  l.head? = some x ∧ l.getLast? = some y ∧
    l.IsChain fun u v ↦ 0 < π.real {u} * (κ u).real {v}

/-- 1.1: `ν` routes every transition `(x, y)` of `κ'` charged by `π'` through paths of `κ`
charged by `π`: `ν x y` is a finitely supported probability weight on paths from `x` to `y`. -/
def IsPathFlow (κ : Kernel S S) (π : Measure S) (κ' : Kernel S S) (π' : Measure S)
    (ν : S → S → List S →₀ ℝ) : Prop :=
  ∀ x y, 0 < π'.real {x} * (κ' x).real {y} →
    (∀ l ∈ (ν x y).support, IsChainPath κ π x y l ∧ 0 ≤ ν x y l) ∧
      ((ν x y).sum fun _ c ↦ c) = 1

/-- 1.1: the load of the directed edge `(z, w)`:
`Σ_{x,y} π'(x) κ'(x, {y}) Σ_Γ ν x y Γ · N((z, w), Γ) · |Γ|`, where `N((z, w), Γ)` counts the
steps of `Γ` from `z` to `w` and `|Γ|` is the number of steps of `Γ`. -/
def edgeLoad [Fintype S] [DecidableEq S] (κ' : Kernel S S) (π' : Measure S)
    (ν : S → S → List S →₀ ℝ) (z w : S) : ℝ :=
  ∑ x, ∑ y, π'.real {x} * (κ' x).real {y} *
    (ν x y).sum fun l c ↦ c * (((l.zip l.tail).count (z, w) : ℝ) * ((l.length - 1 : ℕ) : ℝ))

/-- 1.2: comparison of Dirichlet forms through a flow of paths: if every edge `(z, w)` of `κ`
charged by `π` carries a load at most `B π(z) κ(z, {w})`, then `E'(f) ≤ B E(f)` for every `f`.
No reversibility, stationarity or normalization is assumed. -/
theorem dirichletForm_le_of_edgeLoad_le [Fintype S] [DecidableEq S] (κ : Kernel S S)
    (π : Measure S) (κ' : Kernel S S) (π' : Measure S) {ν : S → S → List S →₀ ℝ}
    (hν : IsPathFlow κ π κ' π' ν) {B : ℝ}
    (hB : ∀ z w, 0 < π.real {z} * (κ z).real {w} →
      edgeLoad κ' π' ν z w ≤ B * (π.real {z} * (κ z).real {w}))
    (f : S → ℝ) :
    dirichletForm κ' π' f ≤ B * dirichletForm κ π f :=
  sorry

/-- 1.4: the method of canonical paths: if the pairs `(x, y)` are routed through paths of `κ`
with every edge load, for the weights `π(x) π(y)`, at most `B π(z) κ(z, {w})`, and `π` charges
two distinct states, then `γ ≥ 1/B`. -/
theorem inv_le_spectralGap_of_edgeLoad_le [Fintype S] [DecidableEq S] (κ : Kernel S S)
    (π : Measure S) [IsProbabilityMeasure π] (htwo : ∃ x y, x ≠ y ∧ 0 < π {x} ∧ 0 < π {y})
    {ν : S → S → List S →₀ ℝ} (hν : IsPathFlow κ π (Kernel.const S π) π ν) {B : ℝ}
    (hB : ∀ z w, 0 < π.real {z} * (κ z).real {w} →
      edgeLoad (Kernel.const S π) π ν z w ≤ B * (π.real {z} * (κ z).real {w})) :
    B⁻¹ ≤ spectralGap κ π :=
  sorry

end Paths

/-! ## Layer 2: random walks on finite groups -/

section Group

variable {G : Type*} [Group G] [Fintype G] [MeasurableSpace G] [MeasurableSingletonClass G]

/-- 2.1 (copied verbatim from RandomWalksOnFiniteGroups 1.1): the random walk driven by `μ`:
from `x` it moves to `x * ξ` with `ξ` of law `μ`. -/
def randomWalk (μ : Measure G) : Kernel G G :=
  Kernel.ofFunOfCountable fun x ↦ μ.map (x * ·)

/-- 2.1: comparison of two random walks on a finite group. If every `a` charged by `μ'` carries
a probability weight `ν a` on words with product `a` in elements charged by `μ`, and
`Σ_a μ'(a) Σ_w ν a w · N(s, w) |w| ≤ B μ(s)` for every `s` charged by `μ`, where `N(s, w)`
counts the occurrences of `s` in `w` and `|w|` is its length, then `γ' ≤ B γ` for the walks under
the uniform law. One word per element is the case of point masses. -/
theorem spectralGap_randomWalk_le [DecidableEq G] (μ μ' : Measure G) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure μ'] (ν : G → List G →₀ ℝ)
    (hν : ∀ a, μ' {a} ≠ 0 →
      (∀ w ∈ (ν a).support, w.prod = a ∧ (∀ s ∈ w, μ {s} ≠ 0) ∧ 0 ≤ ν a w) ∧
        ((ν a).sum fun _ c ↦ c) = 1) {B : ℝ}
    (hB : ∀ s, μ {s} ≠ 0 →
      ∑ a, μ'.real {a} * (ν a).sum (fun w c ↦ c * ((w.count s : ℝ) * (w.length : ℝ))) ≤
        B * μ.real {s}) :
    spectralGap (randomWalk μ') (Measure.uniformOfFinset univ) ≤
      B * spectralGap (randomWalk μ) (Measure.uniformOfFinset univ) :=
  sorry

end Group

/-- 2.2 (copied verbatim from RandomWalksOnFiniteGroups 4.2): every set of permutations of
`Fin n` is measurable. -/
instance instMeasurableSpacePermFin (n : ℕ) : MeasurableSpace (Equiv.Perm (Fin n)) := ⊤

/-- 2.2 (copied verbatim from RandomWalksOnFiniteGroups 4.2): singletons of permutations of
`Fin n` are measurable. -/
instance instMeasurableSingletonClassPermFin (n : ℕ) :
    MeasurableSingletonClass (Equiv.Perm (Fin n)) :=
  ⟨fun _ ↦ MeasurableSpace.measurableSet_top⟩

/-- 2.2 (copied verbatim from RandomWalksOnFiniteGroups 4.2): the random transposition measure:
the law of `(i j)` for `i`, `j` independent and uniform. -/
def randomTransposition (n : ℕ) : Measure (Equiv.Perm (Fin n)) :=
  (Measure.uniformOfFinset (univ : Finset (Fin n × Fin n))).map fun p ↦ Equiv.swap p.1 p.2

/-- 2.2: the lazy random adjacent transposition measure: mass `1/2` at the identity and
`1/(2(n − 1))` at each transposition `(i i+1)`. -/
def adjacentTransposition (n : ℕ) : Measure (Equiv.Perm (Fin n)) :=
  (2⁻¹ : ℝ≥0∞) • Measure.dirac 1 + (2⁻¹ : ℝ≥0∞) • Measure.uniformOfFinset
    {σ | ∃ i j : Fin n, (j : ℕ) = i + 1 ∧ σ = Equiv.swap i j}.toFinset

/-- 2.2: the spectral gap of random transpositions is at most `4 n²` times that of lazy random
adjacent transpositions. -/
theorem spectralGap_randomTransposition_le (n : ℕ) :
    spectralGap (randomWalk (randomTransposition n)) (Measure.uniformOfFinset univ) ≤
      4 * n ^ 2 *
        spectralGap (randomWalk (adjacentTransposition n)) (Measure.uniformOfFinset univ) :=
  sorry

/-! ## Layer 3: eigenvalues one by one and logarithmic Sobolev constants -/

section Spectrum

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 3.1: the real roots of the characteristic polynomial of the transition matrix, with
multiplicity, in decreasing order. -/
def transitionEigenvalues [Fintype S] [DecidableEq S] (κ : Kernel S S) : List ℝ :=
  (transitionMatrix κ).charpoly.roots.sort (· ≥ ·)

/-- 3.1: comparison of the eigenvalues one by one. For Markov kernels `κ`, `κ'` reversible with
respect to positive laws `π`, `π'`, if `E'(f) ≤ a E(f)` for every `f`, then both transition
matrices have `|S|` real eigenvalues with multiplicity, and the `k`-th largest satisfy
`1 − λ'_k ≤ max_x (π(x)/π'(x)) · a · (1 − λ_k)`. -/
theorem one_sub_transitionEigenvalues_le [Fintype S] [DecidableEq S] [Nonempty S]
    (κ : Kernel S S) [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π]
    (hrev : κ.IsReversible π) (hpos : ∀ x, 0 < π {x}) (κ' : Kernel S S) [IsMarkovKernel κ']
    (π' : Measure S) [IsProbabilityMeasure π'] (hrev' : κ'.IsReversible π')
    (hpos' : ∀ x, 0 < π' {x}) {a : ℝ}
    (h : ∀ f, dirichletForm κ' π' f ≤ a * dirichletForm κ π f) :
    (transitionEigenvalues κ).length = Fintype.card S ∧
      (transitionEigenvalues κ').length = Fintype.card S ∧
      ∀ k < Fintype.card S, 1 - (transitionEigenvalues κ').getD k 0 ≤
        (univ.sup' univ_nonempty fun x ↦ π.real {x} / π'.real {x}) * a *
          (1 - (transitionEigenvalues κ).getD k 0) :=
  sorry

/-- 3.2 (copied verbatim from LogSobolevForMarkovChains 1.1): the entropy
`Ent_π(g) = Σ_x π(x) g(x) log g(x) − m log m` of a function `g`, where `m = Σ_x π(x) g(x)`; it is
applied to `g = f²`. -/
def funEntropy [Fintype S] (π : Measure S) (g : S → ℝ) : ℝ :=
  ∑ x, π.real {x} * (g x * Real.log (g x)) -
    (∑ x, π.real {x} * g x) * Real.log (∑ x, π.real {x} * g x)

/-- 3.2 (copied verbatim from LogSobolevForMarkovChains 1.2): the logarithmic Sobolev constant
`α`, the infimum of `E(f) / Ent_π(f²)` over the functions with `Ent_π(f²) ≠ 0`, and `0` if there
is none. -/
def logSobolevConstant [Fintype S] (κ : Kernel S S) (π : Measure S) : ℝ :=
  ⨅ f : {f : S → ℝ // funEntropy π (f ^ 2) ≠ 0}, dirichletForm κ π f / funEntropy π (f ^ 2)

/-- 3.2: comparison of logarithmic Sobolev constants: if `E'(f) ≤ a E(f)` for every `f`, then
`α' ≤ max_x (π(x)/π'(x)) · a · α`. -/
theorem logSobolevConstant_le_of_dirichletForm_le [Fintype S] [Nonempty S] (κ : Kernel S S)
    (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π) (κ' : Kernel S S)
    (π' : Measure S) [IsProbabilityMeasure π'] (hpos : ∀ x, 0 < π' {x}) {a : ℝ}
    (h : ∀ f, dirichletForm κ' π' f ≤ a * dirichletForm κ π f) :
    logSobolevConstant κ' π' ≤
      (univ.sup' univ_nonempty fun x ↦ π.real {x} / π'.real {x}) * a * logSobolevConstant κ π :=
  sorry

end Spectrum

end TauCetiRoadmap.ComparisonOfMarkovChains
