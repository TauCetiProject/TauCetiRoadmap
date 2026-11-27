import Mathlib
import TauCeti.Probability.Kernel.Matrix
import TauCeti.Probability.Process.MarkovChain

/-!
# Lumpability and Kemeny's constant: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the theorem of
every numbered section of the README against the pinned Mathlib and Tau Ceti, each with `sorry`,
together with the definitions they need; every definition has a real body.

The definition `transitionMatrix` is a verbatim copy of MarkovChainMixing 2.1, and
`stationaryMatrix` and `fundamentalMatrix` are verbatim copies of MCMCAsymptoticVariance 1.1,
made in this namespace because a roadmap's file cannot import another roadmap's module.

Suppliers used by the statements: Mathlib `Kernel.Invariant`, `Kernel.IsReversible`,
`Kernel.IsIrreducible`, `Measure.map`, `Matrix.charpoly`, `Matrix.trace`, `Matrix.inv` and
`Polynomial.roots`; Tau Ceti `Kernel.toMatrix` and `TauCeti.Probability.markovChainLaw`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Polynomial TauCeti.Probability
open scoped ENNReal Matrix

namespace TauCetiRoadmap.LumpabilityAndKemenyConstant

section Copied

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 1.4 (copied verbatim from MarkovChainMixing 2.1): the real transition matrix
`P x y = κ x {y}`. -/
def transitionMatrix (κ : Kernel S S) : Matrix S S ℝ :=
  κ.toMatrix.map (↑)

/-- 3.1 (copied verbatim from MCMCAsymptoticVariance 1.1): the matrix `Π` all of whose rows are
the law `π`, `Π x y = π {y}`. -/
def stationaryMatrix (π : Measure S) : Matrix S S ℝ :=
  Matrix.of fun _ y ↦ π.real {y}

/-- 3.1 (copied verbatim from MCMCAsymptoticVariance 1.1): the fundamental matrix
`Z = (I − P + Π)⁻¹ − Π` of a chain with stationary law `π`. -/
def fundamentalMatrix [Fintype S] [DecidableEq S] (κ : Kernel S S) (π : Measure S) :
    Matrix S S ℝ :=
  (1 - transitionMatrix κ + stationaryMatrix π)⁻¹ - stationaryMatrix π

end Copied

variable {S T : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]
  [MeasurableSpace T] [MeasurableSingletonClass T]

/-! ## Layer 1: strong lumpability -/

/-- 1.1: the kernel `κ'` on blocks is a lumping of `κ` along `f`: from every state `x`, the
probability `κ x (f⁻¹ {t})` of stepping into the block of `t` is `κ' (f x) {t}`. -/
def IsLumping (κ : Kernel S S) (f : S → T) (κ' : Kernel T T) : Prop :=
  ∀ x t, κ x (f ⁻¹' {t}) = κ' (f x) {t}

/-- 1.1: strong lumpability in the sense of Kemeny and Snell: one Markov kernel `κ'` on `T`
such that, for every initial law `ν`, the image path `n ↦ f (X n)` of the chain is the chain of
`κ'` started from the image law of `ν`. -/
def IsStronglyLumpable (κ : Kernel S S) [IsMarkovKernel κ] (f : S → T) : Prop :=
  ∃ (κ' : Kernel T T) (_ : IsMarkovKernel κ'), ∀ ν : Measure S, IsProbabilityMeasure ν →
    (markovChainLaw ν κ).map (fun ω n ↦ f (ω n)) = markovChainLaw (ν.map f) κ'

/-- 1.1: a chain is strongly lumpable along `f` exactly when, for any two states of one block,
the probabilities of stepping into each block agree. -/
theorem isStronglyLumpable_iff [Fintype S] [Fintype T] (κ : Kernel S S) [IsMarkovKernel κ]
    (f : S → T) :
    IsStronglyLumpable κ f ↔
      ∀ x x', f x = f x' → ∀ t, κ x (f ⁻¹' {t}) = κ x' (f ⁻¹' {t}) :=
  sorry

/-- 1.2: for a lumping `κ'` of `κ` along `f` and every finite initial measure `ν`, the image
path of the chain of `κ` is the chain of `κ'` started from the image of `ν`. -/
theorem map_markovChainLaw_of_isLumping [Fintype S] [Fintype T] {κ : Kernel S S}
    [IsMarkovKernel κ] {f : S → T} {κ' : Kernel T T} [IsMarkovKernel κ']
    (h : IsLumping κ f κ') (ν : Measure S) [IsFiniteMeasure ν] :
    (markovChainLaw ν κ).map (fun ω n ↦ f (ω n)) = markovChainLaw (ν.map f) κ' :=
  sorry

/-- 1.3: a lumping inherits invariance and reversibility of every measure, and irreducibility
when `f` is onto. -/
theorem isLumping_invariant_isReversible_isIrreducible [Fintype S] [Fintype T]
    {κ : Kernel S S} [IsMarkovKernel κ] {f : S → T} {κ' : Kernel T T} [IsMarkovKernel κ']
    (h : IsLumping κ f κ') :
    (∀ π : Measure S, κ.Invariant π → κ'.Invariant (π.map f)) ∧
      (∀ π : Measure S, κ.IsReversible π → κ'.IsReversible (π.map f)) ∧
      (Kernel.IsIrreducible Measure.count κ → Function.Surjective f →
        Kernel.IsIrreducible Measure.count κ') :=
  sorry

/-- 1.4: for a lumping along an onto map, the characteristic polynomial of the lumped transition
matrix divides that of the original one; so every eigenvalue of the lumped chain is an
eigenvalue of the chain, with at most its multiplicity. -/
theorem charpoly_dvd_of_isLumping [Fintype S] [Fintype T] [DecidableEq S] [DecidableEq T]
    {κ : Kernel S S} [IsMarkovKernel κ] {f : S → T} {κ' : Kernel T T} [IsMarkovKernel κ']
    (h : IsLumping κ f κ') (hf : Function.Surjective f) :
    (transitionMatrix κ').charpoly ∣ (transitionMatrix κ).charpoly :=
  sorry

/-! ## Layer 2: lumping from one initial law -/

/-- 2.1: the image path of the chain started from `ν` is a homogeneous Markov chain: it is the
chain of some Markov kernel `κ'` on `T`, started from the image of `ν`. -/
def IsLumpableFrom (κ : Kernel S S) [IsMarkovKernel κ] (f : S → T) (ν : Measure S) : Prop :=
  ∃ (κ' : Kernel T T) (_ : IsMarkovKernel κ'),
    (markovChainLaw ν κ).map (fun ω n ↦ f (ω n)) = markovChainLaw (ν.map f) κ'

/-- 2.1: if the time reversal of a stationary chain satisfies the block condition, written
without division as `π {y'} · ∫_{f⁻¹ {t}} κ(·, {y}) dπ = π {y} · ∫_{f⁻¹ {t}} κ(·, {y'}) dπ` for `y`,
`y'` in one block, then the chain started from `π` lumps along `f`. -/
theorem isLumpableFrom_of_reversal [Fintype S] [Fintype T] (κ : Kernel S S) [IsMarkovKernel κ]
    (f : S → T) (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π)
    (hrev : ∀ y y', f y = f y' → ∀ t,
      π {y'} * (∫⁻ x in f ⁻¹' {t}, κ x {y} ∂π) = π {y} * (∫⁻ x in f ⁻¹' {t}, κ x {y'} ∂π)) :
    IsLumpableFrom κ f π :=
  sorry

/-- 2.2: for a chain reversible with respect to a law `π` of full support, lumpability from `π`
forces the block condition, hence strong lumpability. -/
theorem lumping_condition_of_isLumpableFrom [Fintype S] [Fintype T] (κ : Kernel S S)
    [IsMarkovKernel κ] (f : S → T) (π : Measure S) [IsProbabilityMeasure π]
    (hrev : κ.IsReversible π) (hpos : ∀ x, 0 < π {x}) (h : IsLumpableFrom κ f π) :
    ∀ x x', f x = f x' → ∀ t, κ x (f ⁻¹' {t}) = κ x' (f ⁻¹' {t}) :=
  sorry

/-! ## Layer 3: Kemeny's constant and the spectrum -/

/-- 3.1: for a Markov kernel and any probability `π`, `(X − 1) · χ_{P − Π} = X · χ_P`. -/
theorem charpoly_sub_stationaryMatrix [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] :
    (X - 1) * (transitionMatrix κ - stationaryMatrix π).charpoly =
      X * (transitionMatrix κ).charpoly :=
  sorry

/-- 3.2: for an irreducible chain, `1` is a simple root of `χ_P`, and for any probability `π`
the trace of `Z` is the sum of `1/(1 − λ)` over the complex roots `λ` of `χ_P`, counted with
multiplicity, one root `1` removed. -/
theorem trace_fundamentalMatrix_eq_sum_roots [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] :
    (transitionMatrix κ).charpoly.rootMultiplicity 1 = 1 ∧
      ((fundamentalMatrix κ π).trace : ℂ) =
        ((((transitionMatrix κ).charpoly.map (algebraMap ℝ ℂ)).roots.erase 1).map
          fun z ↦ (1 - z)⁻¹).sum :=
  sorry

/-- 3.3: for an irreducible chain on `n` states and any probability `π`, `(n − 1)/2 ≤ tr Z`,
with equality exactly when the chain moves deterministically by a permutation of the states. -/
theorem card_sub_one_div_two_le_trace [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ] (π : Measure S)
    [IsProbabilityMeasure π] :
    ((Fintype.card S : ℝ) - 1) / 2 ≤ (fundamentalMatrix κ π).trace ∧
      (((Fintype.card S : ℝ) - 1) / 2 = (fundamentalMatrix κ π).trace ↔
        ∃ σ : Equiv.Perm S, ∀ x, κ x {σ x} = 1) :=
  sorry

/-- 3.4: lumping an irreducible chain along an onto map lowers the trace of the fundamental
matrix by at least half the number of states removed. -/
theorem trace_fundamentalMatrix_add_le_of_isLumping [Fintype S] [Fintype T] [DecidableEq S]
    [DecidableEq T] {κ : Kernel S S} [IsMarkovKernel κ] [Kernel.IsIrreducible Measure.count κ]
    {f : S → T} {κ' : Kernel T T} [IsMarkovKernel κ'] (h : IsLumping κ f κ')
    (hf : Function.Surjective f) (π : Measure S) [IsProbabilityMeasure π] :
    (fundamentalMatrix κ' (π.map f)).trace + ((Fintype.card S : ℝ) - Fintype.card T) / 2 ≤
      (fundamentalMatrix κ π).trace :=
  sorry

end TauCetiRoadmap.LumpabilityAndKemenyConstant
