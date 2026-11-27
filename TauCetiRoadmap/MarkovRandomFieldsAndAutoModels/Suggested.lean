module

public import Mathlib
public import TauCeti.Probability.Distributions.Gaussian.Density
public import TauCeti.Probability.Distributions.Gaussian.Affine
public import TauCeti.Probability.Distributions.Gaussian.Conditional.Basic

/-!
# Markov random fields and auto-models: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose. Every definition has a real body.

The conventions of the README are used throughout. The sites form a finite type `S`; the state
space at `i` is a measurable space `E i` with a σ-finite reference measure `ρ i`, and a
configuration is `x : ∀ i, E i`. A law is given by a density `π : (∀ i, E i) → ℝ≥0` with respect
to `Measure.pi ρ`, not necessarily normalized: full conditionals, the Markov property and
factorizations are unchanged when `π` is multiplied by a positive constant. Countable state
spaces are the case `ρ i = Measure.count`. Full conditionals and normalizers take values in
`ℝ≥0∞`; every statement says where a normalizer must be nonzero and finite.

Definitions owned by `GraphicalModelsAndConditionalIndependence` (margins, conditional
independence and the local Markov property for finite state spaces) and by `MarkovChainMixing`
(the Glauber kernel and the distance to stationarity) appear here as local copies, each with a
docstring naming its owner. The implementation namespace of the README is `TauCeti`; the
prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Finset Filter Topology
open scoped ENNReal NNReal Matrix

namespace TauCetiRoadmap.MarkovRandomFieldsAndAutoModels

/-! ## Local copies of vocabulary owned elsewhere -/

section GraphicalModelsCopies

variable {V : Type*} [Fintype V] [DecidableEq V] {X : V → Type*} [∀ v, Fintype (X v)]
  [∀ v, DecidableEq (X v)]

/-- Local copy of GraphicalModelsAndConditionalIndependence §1.1: the margin of `p` on the set
`A` at the configuration `x`, the total mass of the configurations that agree with `x` on `A`. -/
def margin (p : (∀ v, X v) → ℝ≥0) (A : Finset V) (x : ∀ v, X v) : ℝ≥0 :=
  ∑ y ∈ univ.filter (fun y => ∀ v ∈ A, y v = x v), p y

/-- Local copy of GraphicalModelsAndConditionalIndependence §1.1: the variables in `A` and in
`B` are conditionally independent given those in `S` under `p`. -/
def CondIndep (p : (∀ v, X v) → ℝ≥0) (A B S : Finset V) : Prop :=
  ∀ x, margin p S x * margin p (A ∪ B ∪ S) x = margin p (A ∪ S) x * margin p (B ∪ S) x

/-- Local copy of GraphicalModelsAndConditionalIndependence §2.2: the local Markov property:
every vertex is conditionally independent of the vertices that are neither it nor its
neighbours, given its neighbours. -/
def IsLocalMarkov (G : SimpleGraph V) [DecidableRel G.Adj] (p : (∀ v, X v) → ℝ≥0) : Prop :=
  ∀ v, CondIndep p {v} (univ \ insert v (G.neighborFinset v)) (G.neighborFinset v)

end GraphicalModelsCopies

section MarkovChainMixingCopies

/-- Local copy of MarkovChainMixing §6.1: the Glauber dynamics of a measure `π` on
configurations `V → A`, a uniform random-site update from the conditional law, keeping the
configuration where the conditioning event is `π`-null. -/
def glauber {V A : Type*} [Fintype V] [Countable A] [MeasurableSpace (V → A)]
    [MeasurableSingletonClass (V → A)] (π : Measure (V → A)) : Kernel (V → A) (V → A) :=
  Kernel.ofFunOfCountable fun x ↦ (Fintype.card V : ℝ≥0∞)⁻¹ • ∑ v : V,
    if π {y | ∀ w, w ≠ v → y w = x w} = 0 then Measure.dirac x
    else π[|{y | ∀ w, w ≠ v → y w = x w}]

/-- Local copy of MarkovChainMixing §1.2: the distance to stationarity
`d(t) = max_x ‖κ^t(x, ·) − π‖_TV`. -/
def tvToStationary {T : Type*} [MeasurableSpace T] [Fintype T] [Nonempty T] (κ : Kernel T T)
    (π : Measure T) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun x ↦ tvDist ((κ ^ t) x) π / 2

end MarkovChainMixingCopies

/-! ## Layer 1: densities, full conditionals and Brook's lemma -/

section Layer1

variable {S : Type*} [Fintype S] [DecidableEq S] {E : S → Type*} [∀ i, MeasurableSpace (E i)]

/-- 1.1: the normalizer of the full conditional at site `i` and configuration `x`,
`∫ π(x with x_i := z) dρ_i(z)`; it does not depend on `x i`. -/
def siteNormalizer (ρ : ∀ i, Measure (E i)) (π : (∀ i, E i) → ℝ≥0) (i : S) (x : ∀ i, E i) :
    ℝ≥0∞ :=
  ∫⁻ z, (π (Function.update x i z) : ℝ≥0∞) ∂ρ i

/-- 1.1: the full conditional density `π_i(y ∣ x_{-i})` with respect to `ρ i`. It is the
junk value `π(x with x_i := y) / 0` or `… / ∞` where the normalizer is `0` or `∞`. -/
def fullConditional (ρ : ∀ i, Measure (E i)) (π : (∀ i, E i) → ℝ≥0) (i : S) (x : ∀ i, E i)
    (y : E i) : ℝ≥0∞ :=
  π (Function.update x i y) / siteNormalizer ρ π i x

/-- 1.1: the marginal mass `π(x_i = a)` of a law on countable state spaces. -/
def marginalMass (π : (∀ i, E i) → ℝ≥0) (i : S) (a : E i) : ℝ≥0∞ :=
  ∑' x : {x : ∀ i, E i // x i = a}, (π x : ℝ≥0∞)

/-- 1.1: the **positivity condition**: the support of `π` is the product of the supports of its
marginals. -/
def SatisfiesPositivity (π : (∀ i, E i) → ℝ≥0) : Prop :=
  ∀ x, (∀ i, marginalMass π i (x i) ≠ 0) → π x ≠ 0

/-- 1.2: `π` is a **Markov random field** for `G`: the full conditional at every site depends on
the other coordinates only through the neighbours of the site, wherever the normalizers are
nonzero and finite. -/
def IsMarkovRandomField (ρ : ∀ i, Measure (E i)) (G : SimpleGraph S) (π : (∀ i, E i) → ℝ≥0) :
    Prop :=
  ∀ i x x', (∀ j, G.Adj i j → x j = x' j) →
    siteNormalizer ρ π i x ≠ 0 → siteNormalizer ρ π i x ≠ ∞ →
    siteNormalizer ρ π i x' ≠ 0 → siteNormalizer ρ π i x' ≠ ∞ →
    fullConditional ρ π i x = fullConditional ρ π i x'

/-- 1.2: on finite state spaces with counting measures, the Markov property of full conditionals
is the local Markov property of `GraphicalModelsAndConditionalIndependence`, for every law. -/
theorem isMarkovRandomField_count_iff_isLocalMarkov [∀ i, Fintype (E i)]
    [∀ i, DecidableEq (E i)] [∀ i, MeasurableSingletonClass (E i)] (G : SimpleGraph S)
    [DecidableRel G.Adj] (π : (∀ i, E i) → ℝ≥0) :
    IsMarkovRandomField (fun _ ↦ Measure.count) G π ↔ IsLocalMarkov G π := by
  sorry

/-- 1.3: the full conditional densities are the conditional laws: for the law
`P = (Measure.pi ρ).withDensity π`, the conditional distribution of `x i` given the other
coordinates is, for `P`-almost every `x`, the measure with density `fullConditional ρ π i x`. -/
theorem condDistrib_ae_eq_withDensity_fullConditional [∀ i, StandardBorelSpace (E i)]
    [∀ i, Nonempty (E i)] (ρ : ∀ i, Measure (E i)) [∀ i, SigmaFinite (ρ i)]
    {π : (∀ i, E i) → ℝ≥0} (hπ : Measurable π) {P : Measure (∀ i, E i)}
    [IsProbabilityMeasure P] (hP : P = (Measure.pi ρ).withDensity fun x ↦ (π x : ℝ≥0∞))
    (i : S) :
    ∀ᵐ x ∂P, condDistrib (fun x ↦ x i) (fun x (j : {j // j ≠ i}) ↦ x j) P
        (fun j : {j // j ≠ i} ↦ x j) = (ρ i).withDensity (fullConditional ρ π i x) := by
  sorry

/-- 1.3: a Markov random field has the local Markov property in Mathlib's sense: the coordinate
at `i` is conditionally independent of the coordinates at the non-neighbours, given the
coordinates at the neighbours. -/
theorem IsMarkovRandomField.condIndepFun [∀ i, StandardBorelSpace (E i)] [∀ i, Nonempty (E i)]
    {ρ : ∀ i, Measure (E i)} [∀ i, SigmaFinite (ρ i)] {G : SimpleGraph S}
    {π : (∀ i, E i) → ℝ≥0} (h : IsMarkovRandomField ρ G π) (hπ : Measurable π)
    {P : Measure (∀ i, E i)} [IsProbabilityMeasure P]
    (hP : P = (Measure.pi ρ).withDensity fun x ↦ (π x : ℝ≥0∞)) (i : S) :
    (fun x ↦ x i) ⟂ᵢ[fun x (j : {j // G.Adj i j}) ↦ x j, (by fun_prop); P]
      (fun x (j : {j // j ≠ i ∧ ¬ G.Adj i j}) ↦ x j) := by
  sorry

/-- 1.4 **Brook's lemma**: if `π y` and `π` at the intermediate configurations
`(x_1, …, x_{i-1}, y_i, …, y_n)` are nonzero and the normalizers at the conditioning
configurations are nonzero and finite, then `π(x)/π(y)` is the product over `i` of the ratios of
the full conditionals at `x_i` and `y_i` given `x_1, …, x_{i-1}, y_{i+1}, …, y_n`. -/
theorem brook_factorization {n : ℕ} {E : Fin n → Type*} [∀ i, MeasurableSpace (E i)]
    (ρ : ∀ i, Measure (E i)) (π : (∀ i, E i) → ℝ≥0) (x y : ∀ i, E i) (hy : π y ≠ 0)
    (hmid : ∀ i, π (Function.update (fun j ↦ if j < i then x j else y j) i (y i)) ≠ 0)
    (hZ : ∀ i, siteNormalizer ρ π i (fun j ↦ if j < i then x j else y j) ≠ 0 ∧
      siteNormalizer ρ π i (fun j ↦ if j < i then x j else y j) ≠ ∞) :
    (π x : ℝ≥0∞) / π y =
      ∏ i, fullConditional ρ π i (fun j ↦ if j < i then x j else y j) (x i) /
        fullConditional ρ π i (fun j ↦ if j < i then x j else y j) (y i) := by
  sorry

/-- 1.4 Brook's lemma on countable state spaces under the positivity condition, for `x` and `y`
in the support of a law of finite total mass. -/
theorem brook_factorization_of_satisfiesPositivity {n : ℕ} {E : Fin n → Type*}
    [∀ i, MeasurableSpace (E i)] [∀ i, MeasurableSingletonClass (E i)] [∀ i, Countable (E i)]
    {π : (∀ i, E i) → ℝ≥0} (hpos : SatisfiesPositivity π) (hfin : ∑' x, (π x : ℝ≥0∞) ≠ ∞)
    {x y : ∀ i, E i} (hx : π x ≠ 0) (hy : π y ≠ 0) :
    (π x : ℝ≥0∞) / π y =
      ∏ i, fullConditional (fun _ ↦ Measure.count) π i (fun j ↦ if j < i then x j else y j)
          (x i) /
        fullConditional (fun _ ↦ Measure.count) π i (fun j ↦ if j < i then x j else y j)
          (y i) := by
  sorry

/-- 1.4: two everywhere positive densities with nonzero finite normalizers, the same full
conditionals and the same nonzero finite total mass coincide. -/
theorem eq_of_fullConditional_eq (ρ : ∀ i, Measure (E i)) [∀ i, SigmaFinite (ρ i)]
    {π π' : (∀ i, E i) → ℝ≥0} (hπ : ∀ x, π x ≠ 0) (hπ' : ∀ x, π' x ≠ 0)
    (hZ : ∀ i x, siteNormalizer ρ π i x ≠ 0 ∧ siteNormalizer ρ π i x ≠ ∞)
    (hZ' : ∀ i x, siteNormalizer ρ π' i x ≠ 0 ∧ siteNormalizer ρ π' i x ≠ ∞)
    (hmass : ∫⁻ x, (π x : ℝ≥0∞) ∂Measure.pi ρ = ∫⁻ x, (π' x : ℝ≥0∞) ∂Measure.pi ρ)
    (hmass₀ : ∫⁻ x, (π x : ℝ≥0∞) ∂Measure.pi ρ ≠ 0)
    (hmass₁ : ∫⁻ x, (π x : ℝ≥0∞) ∂Measure.pi ρ ≠ ∞)
    (h : ∀ i x, fullConditional ρ π i x = fullConditional ρ π' i x) : π = π' := by
  sorry

/-- 1.4: on countable state spaces, two laws with the positivity condition, the same finite
total mass and the same full conditionals at every site and configuration coincide. -/
theorem eq_of_fullConditional_eq_of_satisfiesPositivity [∀ i, MeasurableSingletonClass (E i)]
    [∀ i, Countable (E i)] {π π' : (∀ i, E i) → ℝ≥0} (hpos : SatisfiesPositivity π)
    (hpos' : SatisfiesPositivity π') (hmass : ∑' x, (π x : ℝ≥0∞) = ∑' x, (π' x : ℝ≥0∞))
    (hfin : ∑' x, (π x : ℝ≥0∞) ≠ ∞)
    (h : ∀ i x, fullConditional (fun _ ↦ Measure.count) π i x =
      fullConditional (fun _ ↦ Measure.count) π' i x) : π = π' := by
  sorry

end Layer1

/-! ## Layer 2: the canonical potential and the Hammersley–Clifford theorem -/

section Layer2

variable {S : Type*} [Fintype S] [DecidableEq S] {E : S → Type*} [∀ i, MeasurableSpace (E i)]

/-- 2.1: the **canonical potential** of `π` relative to the reference configuration `a`,
`V_A(x) = ∑_{B ⊆ A} (-1)^{|A ∖ B|} log π(x^B)`, where `x^B` agrees with `x` on `B` and with `a`
off `B`. -/
def canonicalPotential (π : (∀ i, E i) → ℝ≥0) (a : ∀ i, E i) (A : Finset S) (x : ∀ i, E i) :
    ℝ :=
  ∑ B ∈ A.powerset, (-1) ^ (A.card - B.card) *
    Real.log (π fun j ↦ if j ∈ B then x j else a j)

/-- 2.1: Möbius inversion: `log π` is the sum of the canonical potentials, each `V_A` depends
only on the coordinates in `A`, and `V_A(x) = 0` when `x` agrees with `a` at some site of `A`
(which forces `A` to be nonempty). -/
theorem canonicalPotential_spec (π : (∀ i, E i) → ℝ≥0) (a : ∀ i, E i) :
    (∀ x, Real.log (π x) = ∑ A : Finset S, canonicalPotential π a A x) ∧
      (∀ A : Finset S, DependsOn (canonicalPotential π a A) (A : Set S)) ∧
      ∀ (A : Finset S) x, (∃ i ∈ A, x i = a i) → canonicalPotential π a A x = 0 := by
  sorry

/-- 2.1: uniqueness: a family `V` with the three properties of `canonicalPotential_spec` is the
canonical potential. -/
theorem eq_canonicalPotential (π : (∀ i, E i) → ℝ≥0) (a : ∀ i, E i)
    (V : Finset S → (∀ i, E i) → ℝ) (hsum : ∀ x, Real.log (π x) = ∑ A : Finset S, V A x)
    (hloc : ∀ A : Finset S, DependsOn (V A) (A : Set S))
    (hnorm : ∀ (A : Finset S) x, (∃ i ∈ A, x i = a i) → V A x = 0) :
    V = canonicalPotential π a := by
  sorry

/-- 2.1: the canonical potential through the full conditionals at one site `i ∈ A`. -/
theorem canonicalPotential_eq_sum_log_fullConditional (ρ : ∀ i, Measure (E i))
    {π : (∀ i, E i) → ℝ≥0} (hπ : ∀ x, π x ≠ 0)
    (hZ : ∀ i x, siteNormalizer ρ π i x ≠ 0 ∧ siteNormalizer ρ π i x ≠ ∞) (a : ∀ i, E i)
    {A : Finset S} {i : S} (hi : i ∈ A) (x : ∀ i, E i) :
    canonicalPotential π a A x = ∑ B ∈ (A.erase i).powerset,
      (-1) ^ ((A.erase i).card - B.card) *
        Real.log ((fullConditional ρ π i (fun j ↦ if j ∈ B then x j else a j) (x i) /
          fullConditional ρ π i (fun j ↦ if j ∈ B then x j else a j) (a i)).toReal) := by
  sorry

open Classical in
/-- 2.2 **Hammersley–Clifford theorem**: an everywhere positive density with nonzero finite
normalizers is a Markov random field for `G` if and only if it is a product of positive functions
of the cliques of `G`. -/
theorem isMarkovRandomField_iff_factorization (ρ : ∀ i, Measure (E i)) (G : SimpleGraph S)
    {π : (∀ i, E i) → ℝ≥0} (hπ : ∀ x, π x ≠ 0)
    (hZ : ∀ i x, siteNormalizer ρ π i x ≠ 0 ∧ siteNormalizer ρ π i x ≠ ∞) :
    IsMarkovRandomField ρ G π ↔ ∃ ψ : Finset S → (∀ i, E i) → ℝ≥0, (∀ C x, ψ C x ≠ 0) ∧
      (∀ C, DependsOn (ψ C) (C : Set S)) ∧
      ∀ x, π x = ∏ C ∈ univ.filter (fun C : Finset S ↦ G.IsClique (C : Set S)), ψ C x := by
  sorry

/-- 2.2: equivalently, the canonical potential relative to any reference configuration vanishes
on every set that is not a clique. -/
theorem isMarkovRandomField_iff_canonicalPotential (ρ : ∀ i, Measure (E i))
    (G : SimpleGraph S) {π : (∀ i, E i) → ℝ≥0} (hπ : ∀ x, π x ≠ 0)
    (hZ : ∀ i x, siteNormalizer ρ π i x ≠ 0 ∧ siteNormalizer ρ π i x ≠ ∞) (a : ∀ i, E i) :
    IsMarkovRandomField ρ G π ↔
      ∀ A : Finset S, ¬ G.IsClique (A : Set S) → ∀ x, canonicalPotential π a A x = 0 := by
  sorry

open Classical in
/-- 2.2: without positivity, every product of nonnegative functions of the cliques is a Markov
random field. -/
theorem isMarkovRandomField_of_factorization (ρ : ∀ i, Measure (E i)) (G : SimpleGraph S)
    (ψ : Finset S → (∀ i, E i) → ℝ≥0) (hψ : ∀ C, DependsOn (ψ C) (C : Set S)) :
    IsMarkovRandomField ρ G
      (fun x ↦ ∏ C ∈ univ.filter (fun C : Finset S ↦ G.IsClique (C : Set S)), ψ C x) := by
  sorry

/-- 2.3: the normalizer of the conditional density of the coordinates in `A` given the others. -/
def blockNormalizer (ρ : ∀ i, Measure (E i)) [∀ i, SigmaFinite (ρ i)] (π : (∀ i, E i) → ℝ≥0)
    (A : Finset S) (x : ∀ i, E i) : ℝ≥0∞ :=
  ∫⁻ w, (π fun j ↦ if h : j ∈ A then w ⟨j, h⟩ else x j : ℝ≥0∞) ∂Measure.pi fun j : A ↦ ρ j

/-- 2.3: the conditional density `π_A(z_A ∣ x_{S ∖ A})` of the block `A`. -/
def setConditional (ρ : ∀ i, Measure (E i)) [∀ i, SigmaFinite (ρ i)] (π : (∀ i, E i) → ℝ≥0)
    (A : Finset S) (x z : ∀ i, E i) : ℝ≥0∞ :=
  π (fun j ↦ if j ∈ A then z j else x j) / blockNormalizer ρ π A x

/-- 2.3: for a positive Markov random field the conditional density of a block given the rest
depends only on the coordinates on the boundary of the block. -/
theorem setConditional_eq_of_eqOn_boundary (ρ : ∀ i, Measure (E i)) [∀ i, SigmaFinite (ρ i)]
    (G : SimpleGraph S) {π : (∀ i, E i) → ℝ≥0} (hπ : ∀ x, π x ≠ 0)
    (hZ : ∀ i x, siteNormalizer ρ π i x ≠ 0 ∧ siteNormalizer ρ π i x ≠ ∞)
    (hG : IsMarkovRandomField ρ G π) (A : Finset S) {x x' : ∀ i, E i}
    (h : ∀ j ∉ A, (∃ i ∈ A, G.Adj i j) → x j = x' j) :
    setConditional ρ π A x = setConditional ρ π A x' := by
  sorry

end Layer2

/-! ## Layer 3: auto-models -/

section Layer3

variable {S : Type*} [Fintype S] [DecidableEq S] {E : S → Type*} [∀ i, MeasurableSpace (E i)]

/-- 3.1: the exponent `∑_i (α_i B_i(x_i) + C_i(x_i)) + ∑_{i<j} β_{ij} B_i(x_i) B_j(x_j)` of an
auto-model, the pair sum written as half the sum over ordered pairs `i ≠ j`. -/
def autoModel (α : S → ℝ) (β : S → S → ℝ) (B C : ∀ i, E i → ℝ) (x : ∀ i, E i) : ℝ :=
  ∑ i, (α i * B i (x i) + C i (x i)) +
    (1 / 2) * ∑ i, ∑ j ∈ univ.erase i, β i j * B i (x i) * B j (x j)

/-- 3.1 **Besag's auto-model theorem**: a positive Markov random field whose canonical potential
relative to `0` vanishes on sets of more than two sites, and whose full conditionals are
one-parameter exponential families `log π_i(x_i ∣ x_{-i}) = A_i(x) B_i(x_i) + C_i(x_i) + D_i(x)`
with `B_i(0) = C_i(0) = 0` and `B_i ≠ 0`, is an auto-model. -/
theorem exists_autoModel [∀ i, Zero (E i)] (ρ : ∀ i, Measure (E i)) (G : SimpleGraph S)
    {π : (∀ i, E i) → ℝ≥0} (hπ : ∀ x, π x ≠ 0)
    (hZ : ∀ i x, siteNormalizer ρ π i x ≠ 0 ∧ siteNormalizer ρ π i x ≠ ∞)
    (hG : IsMarkovRandomField ρ G π)
    (hpair : ∀ T : Finset S, 2 < T.card → ∀ x, canonicalPotential π 0 T x = 0)
    (A D : S → (∀ i, E i) → ℝ) (B C : ∀ i, E i → ℝ) (hB0 : ∀ i, B i 0 = 0)
    (hC0 : ∀ i, C i 0 = 0) (hBne : ∀ i, ∃ e, B i e ≠ 0)
    (hA : ∀ i x y, A i (Function.update x i y) = A i x)
    (hD : ∀ i x y, D i (Function.update x i y) = D i x)
    (hexp : ∀ i x, Real.log (fullConditional ρ π i x (x i)).toReal =
      A i x * B i (x i) + C i (x i) + D i x) :
    ∃ (α : S → ℝ) (β : S → S → ℝ), (∀ i j, β i j = β j i) ∧
      (∀ i j, i ≠ j → ¬ G.Adj i j → β i j = 0) ∧
      (∀ i x, A i x = α i + ∑ j ∈ univ.erase i, β i j * B j (x j)) ∧
      ∀ x, (π x : ℝ) = π 0 * Real.exp (autoModel α β B C x) := by
  sorry

/-- 3.1 Converse: for symmetric `β`, the full conditionals of `exp (autoModel α β B C)` are the
exponential families with natural parameter `α_i + ∑_{j ≠ i} β_{ij} B_j(x_j)`. -/
theorem fullConditional_autoModel (ρ : ∀ i, Measure (E i)) (α : S → ℝ) {β : S → S → ℝ}
    (hβ : ∀ i j, β i j = β j i) (B C : ∀ i, E i → ℝ) (i : S) (x : ∀ i, E i) (y : E i) :
    fullConditional ρ (fun x ↦ (Real.exp (autoModel α β B C x)).toNNReal) i x y =
      ENNReal.ofReal (Real.exp ((α i + ∑ j ∈ univ.erase i, β i j * B j (x j)) * B i y + C i y)) /
        ∫⁻ z, ENNReal.ofReal
          (Real.exp ((α i + ∑ j ∈ univ.erase i, β i j * B j (x j)) * B i z + C i z)) ∂ρ i := by
  sorry

/-- 3.2 **The auto-logistic model**: on `{0, 1}^S` (`true` is `1`), the full conditional of
`exp (∑ α_i x_i + ∑_{i<j} β_{ij} x_i x_j)` at `1` is `e^η / (1 + e^η)` with
`η = α_i + ∑_{j ≠ i} β_{ij} x_j`. -/
theorem fullConditional_autoLogistic (α : S → ℝ) {β : S → S → ℝ} (hβ : ∀ i j, β i j = β j i)
    (i : S) (x : S → Bool) :
    fullConditional (E := fun _ ↦ Bool) (fun _ ↦ Measure.count)
        (fun x ↦ (Real.exp (autoModel (E := fun _ ↦ Bool) α β
          (fun _ b ↦ if b then 1 else 0) (fun _ _ ↦ 0) x)).toNNReal) i x true =
      ENNReal.ofReal (Real.exp (α i + ∑ j ∈ univ.erase i, β i j * (if x j then 1 else 0)) /
        (1 + Real.exp (α i + ∑ j ∈ univ.erase i, β i j * (if x j then 1 else 0)))) := by
  sorry

/-- 3.3: the unnormalized auto-Poisson weight
`exp (∑ (α_i x_i - log x_i!) + ∑_{i<j} β_{ij} x_i x_j)` on `ℕ^S`. -/
def autoPoissonWeight (α : S → ℝ) (β : S → S → ℝ) (x : S → ℕ) : ℝ :=
  Real.exp (autoModel (E := fun _ ↦ ℕ) α β (fun _ n ↦ n) (fun _ n ↦ -Real.log n.factorial) x)

/-- 3.3 **The auto-Poisson model**: for symmetric `β`, the weight is summable if and only if
every interaction is nonpositive. -/
theorem tsum_autoPoissonWeight_ne_top_iff (α : S → ℝ) {β : S → S → ℝ}
    (hβ : ∀ i j, β i j = β j i) :
    ∑' x : S → ℕ, ENNReal.ofReal (autoPoissonWeight α β x) ≠ ∞ ↔
      ∀ i j, i ≠ j → β i j ≤ 0 := by
  sorry

/-- 3.3: the full conditionals of the auto-Poisson weight are Poisson laws with
`log` mean `α_i + ∑_{j ≠ i} β_{ij} x_j`. -/
theorem fullConditional_autoPoisson (α : S → ℝ) {β : S → S → ℝ} (hβ : ∀ i j, β i j = β j i)
    (i : S) (x : S → ℕ) (y : ℕ) :
    fullConditional (E := fun _ ↦ ℕ) (fun _ ↦ Measure.count)
        (fun x ↦ (autoPoissonWeight α β x).toNNReal) i x y =
      poissonMeasure (Real.exp (α i + ∑ j ∈ univ.erase i, β i j * x j)).toNNReal {y} := by
  sorry

end Layer3

/-! ## Layer 4: conditional and simultaneous autoregressions -/

section Layer4

variable {S : Type*} [Fintype S] [DecidableEq S]

/-- 4.1: the density of `N(μ, V)` on `S → ℝ`, Tau Ceti's multivariate Gaussian density read in
coordinates. -/
def gaussianDensity (μ : S → ℝ) (V : Matrix S S ℝ) (x : S → ℝ) : ℝ≥0 :=
  (TauCeti.Probability.multivariateGaussianPDFReal (WithLp.toLp 2 μ) V
    (WithLp.toLp 2 x)).toNNReal

/-- 4.1: `π` has the Gaussian full conditionals
`x_i ∣ x_{-i} ~ N(μ_i + ∑_{j ≠ i} C_{ij} (x_j - μ_j), κ_i)` with respect to Lebesgue measure. -/
def HasGaussianFullConditionals (π : (S → ℝ) → ℝ≥0) (μ : S → ℝ) (C : Matrix S S ℝ)
    (κ : S → ℝ≥0) : Prop :=
  ∀ i x, fullConditional (E := fun _ ↦ ℝ) (fun _ ↦ volume) π i x =
    gaussianPDF (μ i + ∑ j ∈ univ.erase i, C i j * (x j - μ j)) (κ i)

/-- 4.1 **Conditional autoregression**: if `M⁻¹ (1 - C)` is positive definite, the law
`N(μ, (1 - C)⁻¹ M)` has the Gaussian full conditionals with coefficients `C` and variances `κ`,
and its density is that of Mathlib's `multivariateGaussian`. -/
theorem hasGaussianFullConditionals_gaussianDensity (μ : S → ℝ) {C : Matrix S S ℝ}
    {κ : S → ℝ≥0} (hκ : ∀ i, 0 < κ i) (hC : ∀ i, C i i = 0)
    (hQ : ((Matrix.diagonal fun i ↦ (κ i : ℝ))⁻¹ * (1 - C)).PosDef) :
    HasGaussianFullConditionals
        (gaussianDensity μ ((1 - C)⁻¹ * Matrix.diagonal fun i ↦ (κ i : ℝ))) μ C κ ∧
      (volume : Measure (S → ℝ)).withDensity
          (fun x ↦ (gaussianDensity μ ((1 - C)⁻¹ * Matrix.diagonal fun i ↦ (κ i : ℝ)) x :
            ℝ≥0∞)) =
        (multivariateGaussian (WithLp.toLp 2 μ)
          ((1 - C)⁻¹ * Matrix.diagonal fun i ↦ (κ i : ℝ))).map WithLp.ofLp := by
  sorry

/-- 4.1 **Besag's Gaussian conditional specification theorem**, converse: a probability density
with these Gaussian full conditionals satisfies `C_{ij} κ_j = C_{ji} κ_i`, has `M⁻¹ (1 - C)`
positive definite, and is the density of `N(μ, (1 - C)⁻¹ M)`. -/
theorem eq_gaussianDensity_of_hasGaussianFullConditionals {π : (S → ℝ) → ℝ≥0} {μ : S → ℝ}
    {C : Matrix S S ℝ} {κ : S → ℝ≥0} (hκ : ∀ i, 0 < κ i) (hC : ∀ i, C i i = 0)
    (hmass : ∫⁻ x, (π x : ℝ≥0∞) = 1) (h : HasGaussianFullConditionals π μ C κ) :
    (∀ i j, C i j * κ j = C j i * κ i) ∧
      ((Matrix.diagonal fun i ↦ (κ i : ℝ))⁻¹ * (1 - C)).PosDef ∧
      π = gaussianDensity μ ((1 - C)⁻¹ * Matrix.diagonal fun i ↦ (κ i : ℝ)) := by
  sorry

/-- 4.2: under the symmetry condition `C_{ij} κ_j = C_{ji} κ_i`, `M⁻¹ (1 - C)` is positive
definite if and only if every real eigenvalue of `1 - C` is positive. -/
theorem posDef_iff_forall_hasEigenvalue_pos {C : Matrix S S ℝ} {κ : S → ℝ}
    (hκ : ∀ i, 0 < κ i) (hsymm : ∀ i j, C i j * κ j = C j i * κ i) :
    ((Matrix.diagonal κ)⁻¹ * (1 - C)).PosDef ↔
      ∀ r : ℝ, Module.End.HasEigenvalue (Matrix.toLin' (1 - C)) r → 0 < r := by
  sorry

/-- 4.2: for `C = φ N` with `N` the adjacency matrix and `φ ≠ 0`, the symmetry condition forces
`κ` to be constant on each connected component. -/
theorem eq_of_reachable_of_adjMatrix (G : SimpleGraph S) [DecidableRel G.Adj] {φ : ℝ}
    (hφ : φ ≠ 0) {κ : S → ℝ}
    (hsymm : ∀ i j, (φ • G.adjMatrix ℝ) i j * κ j = (φ • G.adjMatrix ℝ) j i * κ i)
    {i j : S} (h : G.Reachable i j) : κ i = κ j := by
  sorry

/-- 4.2: for `C = φ N` with `κ` equal at adjacent sites, `|φ| · deg i < 1` at every site gives a
positive definite `M⁻¹ (1 - φ N)`. -/
theorem posDef_of_abs_mul_degree_lt_one (G : SimpleGraph S) [DecidableRel G.Adj] {φ : ℝ}
    {κ : S → ℝ} (hκ : ∀ i, 0 < κ i) (hκG : ∀ i j, G.Adj i j → κ i = κ j)
    (hdeg : ∀ i, |φ| * G.degree i < 1) :
    ((Matrix.diagonal κ)⁻¹ * (1 - φ • G.adjMatrix ℝ)).PosDef := by
  sorry

/-- 4.3 **Simultaneous autoregressions are conditional autoregressions**: the covariance
`(1 - B)⁻¹ Λ (1 - B)⁻ᵀ` of a simultaneous autoregression is `(1 - C)⁻¹ M` for a unique pair
`(C, κ)` with zero diagonal and positive `κ`; `M⁻¹ (1 - C) = (1 - B)ᵀ Λ⁻¹ (1 - B)`,
`κ_i⁻¹ = λ_i⁻¹ + ∑_j b_{ji}² λ_j⁻¹`, and every `C_{ij} ≠ 0` with `i ≠ j` has `b_{ij} ≠ 0`,
`b_{ji} ≠ 0` or `b_{li} b_{lj} ≠ 0` for some `l`. -/
theorem exists_unique_car_of_sar {B : Matrix S S ℝ} (hB : ∀ i, B i i = 0)
    (hdet : (1 - B).det ≠ 0) {v : S → ℝ} (hv : ∀ i, 0 < v i) :
    ∃ (C : Matrix S S ℝ) (κ : S → ℝ), (∀ i, C i i = 0) ∧ (∀ i, 0 < κ i) ∧
      (1 - B)⁻¹ * Matrix.diagonal v * (1 - B)⁻¹ᵀ = (1 - C)⁻¹ * Matrix.diagonal κ ∧
      (Matrix.diagonal κ)⁻¹ * (1 - C) = (1 - B)ᵀ * (Matrix.diagonal v)⁻¹ * (1 - B) ∧
      (∀ i, (κ i)⁻¹ = (v i)⁻¹ + ∑ j, B j i ^ 2 / v j) ∧
      (∀ i j, i ≠ j → C i j ≠ 0 → B i j ≠ 0 ∨ B j i ≠ 0 ∨ ∃ l, B l i * B l j ≠ 0) ∧
      ∀ (C' : Matrix S S ℝ) (κ' : S → ℝ), (∀ i, C' i i = 0) → (∀ i, 0 < κ' i) →
        (1 - B)⁻¹ * Matrix.diagonal v * (1 - B)⁻¹ᵀ = (1 - C')⁻¹ * Matrix.diagonal κ' →
        C' = C ∧ κ' = κ := by
  sorry

end Layer4

/-! ## Layer 5: coding sets and pseudolikelihood -/

section Layer5

variable {S : Type*} [Fintype S] [DecidableEq S] {E : S → Type*} [∀ i, MeasurableSpace (E i)]

/-- 5.1: the pseudolikelihood `∏_{i ∈ D} π_i(x_i ∣ x_{-i})` of `π` at `x` over the window `D`;
over a coding set it is the coding likelihood. -/
def pseudoLikelihood (ρ : ∀ i, Measure (E i)) (π : (∀ i, E i) → ℝ≥0) (D : Finset S)
    (x : ∀ i, E i) : ℝ≥0∞ :=
  ∏ i ∈ D, fullConditional ρ π i x (x i)

/-- 5.1 **Coding sets**: for a measurable positive Markov random field and a set `C` of pairwise
non-adjacent sites, the coordinates in `C` are conditionally independent given the others, with
the full conditionals as their laws; in particular the coding likelihood is the conditional
density of `x_C` given `x_{S ∖ C}`. -/
theorem setConditional_eq_prod_of_isIndepSet (ρ : ∀ i, Measure (E i))
    [∀ i, SigmaFinite (ρ i)] (G : SimpleGraph S) {π : (∀ i, E i) → ℝ≥0} (hπm : Measurable π)
    (hπ : ∀ x, π x ≠ 0) (hZ : ∀ i x, siteNormalizer ρ π i x ≠ 0 ∧ siteNormalizer ρ π i x ≠ ∞)
    (hG : IsMarkovRandomField ρ G π) {C : Finset S} (hC : G.IsIndepSet (C : Set S)) :
    (∀ x z, setConditional ρ π C x z = ∏ i ∈ C, fullConditional ρ π i x (z i)) ∧
      ∀ x, pseudoLikelihood ρ π C x = setConditional ρ π C x x := by
  sorry

/-- 5.2 **Pseudolikelihood of the one-parameter Gaussian conditional autoregression**: for the
full conditionals `x_i ∣ x_{-i} ~ N(b (W x)_i, k)` on all sites, the pseudolikelihood has the
unique maximizer `b̂ = ⟨x, W x⟩ / ⟨W x, W x⟩`,
`k̂ = (⟨x, x⟩ - ⟨x, W x⟩² / ⟨W x, W x⟩) / |S|` over `b ∈ ℝ`, `k > 0`. The inequality holds
for every `W`; a zero diagonal is what makes the factors full conditionals. -/
theorem gaussianCAR_pseudoLikelihood_le_max (W : Matrix S S ℝ) (x : S → ℝ) (hv : W *ᵥ x ≠ 0)
    (hk : 0 < x ⬝ᵥ x - (x ⬝ᵥ (W *ᵥ x)) ^ 2 / ((W *ᵥ x) ⬝ᵥ (W *ᵥ x))) (b : ℝ) (k : ℝ≥0)
    (hk₀ : 0 < k) :
    (∏ i, gaussianPDFReal (b * (W *ᵥ x) i) k (x i)) ≤
        ∏ i, gaussianPDFReal (x ⬝ᵥ (W *ᵥ x) / ((W *ᵥ x) ⬝ᵥ (W *ᵥ x)) * (W *ᵥ x) i)
          ((x ⬝ᵥ x - (x ⬝ᵥ (W *ᵥ x)) ^ 2 / ((W *ᵥ x) ⬝ᵥ (W *ᵥ x))) /
            Fintype.card S).toNNReal (x i) ∧
      ((∏ i, gaussianPDFReal (b * (W *ᵥ x) i) k (x i)) =
          ∏ i, gaussianPDFReal (x ⬝ᵥ (W *ᵥ x) / ((W *ᵥ x) ⬝ᵥ (W *ᵥ x)) * (W *ᵥ x) i)
            ((x ⬝ᵥ x - (x ⬝ᵥ (W *ᵥ x)) ^ 2 / ((W *ᵥ x) ⬝ᵥ (W *ᵥ x))) /
              Fintype.card S).toNNReal (x i) →
        b = x ⬝ᵥ (W *ᵥ x) / ((W *ᵥ x) ⬝ᵥ (W *ᵥ x)) ∧
          (k : ℝ) = (x ⬝ᵥ x - (x ⬝ᵥ (W *ᵥ x)) ^ 2 / ((W *ᵥ x) ⬝ᵥ (W *ᵥ x))) /
            Fintype.card S) := by
  sorry

end Layer5

/-! ## Layer 6: the finite Gibbs sampler -/

section Layer6

variable {S : Type*} [Fintype S] [DecidableEq S] {E : S → Type*} [∀ i, Fintype (E i)]
  [∀ i, MeasurableSpace (E i)] [∀ i, MeasurableSingletonClass (E i)]

/-- 6.1: the single-site Gibbs update at `i`: the row at `x` is `π` conditioned on the
configurations that agree with `x` off `i`, and `δ_x` where that event is `π`-null. -/
def gibbsUpdate (π : Measure (∀ i, E i)) (i : S) : Kernel (∀ i, E i) (∀ i, E i) :=
  Kernel.ofFunOfCountable fun x ↦
    if π {y | ∀ j, j ≠ i → y j = x j} = 0 then Measure.dirac x
    else π[|{y | ∀ j, j ≠ i → y j = x j}]

/-- 6.2: the systematic sweep that updates the sites in the order of the list `l`, the first
entry first. -/
def gibbsSweep (π : Measure (∀ i, E i)) (l : List S) : Kernel (∀ i, E i) (∀ i, E i) :=
  ((l.map (gibbsUpdate π)).reverse).prod

/-- 6.3: the random scan that updates site `i` with probability `q i`. -/
def gibbsRandomScan (π : Measure (∀ i, E i)) (q : S → ℝ≥0∞) : Kernel (∀ i, E i) (∀ i, E i) :=
  Kernel.ofFunOfCountable fun x ↦ ∑ i, q i • gibbsUpdate π i x

/-- 6.1: every single-site update of a probability measure is a Markov kernel. -/
theorem isMarkovKernel_gibbsUpdate (π : Measure (∀ i, E i)) [IsProbabilityMeasure π] (i : S) :
    IsMarkovKernel (gibbsUpdate π i) := by
  sorry

/-- 6.1: every single-site update is reversible for `π`. -/
theorem isReversible_gibbsUpdate (π : Measure (∀ i, E i)) [IsProbabilityMeasure π] (i : S) :
    (gibbsUpdate π i).IsReversible π := by
  sorry

/-- 6.2: every sweep is a Markov kernel; the empty sweep is the identity kernel. -/
theorem isMarkovKernel_gibbsSweep (π : Measure (∀ i, E i)) [IsProbabilityMeasure π]
    (l : List S) : IsMarkovKernel (gibbsSweep π l) := by
  sorry

/-- 6.2: every sweep leaves `π` invariant. -/
theorem invariant_gibbsSweep (π : Measure (∀ i, E i)) [IsProbabilityMeasure π] (l : List S) :
    (gibbsSweep π l).Invariant π := by
  sorry

/-- 6.3: a random scan whose site probabilities sum to `1` is a Markov kernel. -/
theorem isMarkovKernel_gibbsRandomScan (π : Measure (∀ i, E i)) [IsProbabilityMeasure π]
    {q : S → ℝ≥0∞} (hq₁ : ∑ i, q i = 1) : IsMarkovKernel (gibbsRandomScan π q) := by
  sorry

/-- 6.3: every random scan is reversible for `π`, whatever the weights `q`. -/
theorem isReversible_gibbsRandomScan (π : Measure (∀ i, E i)) [IsProbabilityMeasure π]
    (q : S → ℝ≥0∞) : (gibbsRandomScan π q).IsReversible π := by
  sorry

/-- 6.3: the uniform random scan is the Glauber dynamics of `MarkovChainMixing` 6.1. -/
theorem gibbsRandomScan_uniform_eq_glauber {A : Type*} [Fintype A] [MeasurableSpace A]
    [MeasurableSingletonClass A] (π : Measure (S → A)) :
    gibbsRandomScan (E := fun _ ↦ A) π (fun _ ↦ (Fintype.card S : ℝ≥0∞)⁻¹) = glauber π := by
  sorry

/-- 6.4 **Doeblin's bound**: if `κ^N(x, ·) ≥ ε π` for every `x`, then
`d(n) ≤ (1 - ε)^⌊n/N⌋`. At `N = 0` the bound is `1`, which `d(n) ≤ 1` meets. -/
theorem tvToStationary_le_of_minorization {T : Type*} [Fintype T] [Nonempty T]
    [MeasurableSpace T] [MeasurableSingletonClass T] (κ : Kernel T T) [IsMarkovKernel κ]
    (π : Measure T) [IsProbabilityMeasure π] (hinv : κ.Invariant π) {N : ℕ} {ε : ℝ}
    (hmin : ∀ x y, ε * π.real {y} ≤ ((κ ^ N) x).real {y}) (n : ℕ) :
    tvToStationary κ π n ≤ (1 - ε) ^ (n / N) := by
  sorry

/-- 6.4: for a positive `π` and a sweep visiting every site, every row of the sweep dominates
`ε π` for some `ε > 0`, and the sweep converges to `π` in total variation uniformly in the
initial state. -/
theorem tendsto_tvToStationary_gibbsSweep [∀ i, Nonempty (E i)] (π : Measure (∀ i, E i))
    [IsProbabilityMeasure π] (hπ : ∀ x, π {x} ≠ 0) {l : List S} (hl : ∀ i, i ∈ l) :
    (∃ ε > 0, ∀ x y, ε * π.real {y} ≤ (gibbsSweep π l x).real {y}) ∧
      Tendsto (tvToStationary (gibbsSweep π l) π) atTop (𝓝 0) := by
  sorry

/-- 6.4: for a positive `π` and positive site probabilities, every row of the `|S|`-step random
scan dominates `ε π` for some `ε > 0`, and the random scan converges to `π` in total variation
uniformly in the initial state. -/
theorem tendsto_tvToStationary_gibbsRandomScan [∀ i, Nonempty (E i)] (π : Measure (∀ i, E i))
    [IsProbabilityMeasure π] (hπ : ∀ x, π {x} ≠ 0) {q : S → ℝ≥0∞} (hq : ∀ i, q i ≠ 0)
    (hq₁ : ∑ i, q i = 1) :
    (∃ ε > 0, ∀ x y,
        ε * π.real {y} ≤ ((gibbsRandomScan π q ^ Fintype.card S) x).real {y}) ∧
      Tendsto (tvToStationary (gibbsRandomScan π q) π) atTop (𝓝 0) := by
  sorry

end Layer6

end TauCetiRoadmap.MarkovRandomFieldsAndAutoModels

/-! ### Upstream names used in the README -/

#check @MeasureTheory.Measure.pi
#check @MeasureTheory.Measure.count
#check @MeasureTheory.Measure.withDensity
#check @MeasureTheory.lintegral
#check @ProbabilityTheory.cond
#check @MeasureTheory.tvDist
#check @ProbabilityTheory.condDistrib
#check @ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd
#check @ProbabilityTheory.condDistrib_apply_of_ne_zero
#check @ProbabilityTheory.CondIndepFun
#check @ProbabilityTheory.condIndepFun_iff_condDistrib_prod_ae_eq_prodMkRight
#check @ProbabilityTheory.Kernel.ofFunOfCountable
#check @ProbabilityTheory.Kernel.IsReversible
#check @ProbabilityTheory.Kernel.IsReversible.invariant
#check @ProbabilityTheory.Kernel.Invariant
#check @SimpleGraph.IsClique
#check @SimpleGraph.IsIndepSet
#check @SimpleGraph.adjMatrix
#check @SimpleGraph.degree
#check @SimpleGraph.Reachable
#check @Finset.sum_powerset_neg_one_pow_card
#check @DependsOn
#check @ProbabilityTheory.gaussianPDF
#check @ProbabilityTheory.gaussianPDFReal
#check @ProbabilityTheory.multivariateGaussian
#check @ProbabilityTheory.poissonMeasure
#check @Matrix.PosDef
#check @Matrix.inv
#check @Module.End.HasEigenvalue
#check @eigenvalue_mem_ball
#check @dotProduct
#check @Matrix.mulVec
#check @EuclideanSpace
#check @TauCeti.Probability.multivariateGaussianPDFReal
#check @TauCeti.Probability.multivariateGaussian_eq_withDensity
#check @TauCeti.Probability.map_affine_multivariateGaussian
#check @TauCeti.Probability.condDistrib_multivariateGaussian
