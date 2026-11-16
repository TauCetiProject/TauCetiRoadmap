module

import Mathlib
import TauCeti.Combinatorics.Enumerative.PerfectMatching

/-!
# Constructive scalar field theory on the lattice: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the simple
definitions those statements need: admissible single-site measures, the φ⁴ and Ising single-site
measures, the Hamiltonian, partition function and Gibbs measure of a pair interaction on a finite
set (a coupling is a function on unordered pairs, `Sym2 V`, whose diagonal values are ignored),
Ising-block measures and the Griffiths–Simon class, currents with their sources and weights, the
boxes of `ℤ^d` with their free-boundary Gibbs measures extended by zero, the nearest-neighbour
coupling, the free-boundary two-point function, susceptibility and critical point, the periodic
coupling on the discrete torus with its Fourier symbol, structure factor and infrared constant,
random fields indexed by compactly supported continuous test functions, the rescaled lattice field
with its block second moment, reachability schemes with their field laws and double limits, and the
Gaussian-free-field covariance. Pairings of `Fin (2n)` are
Tau Ceti's `TauCeti.PerfectMatching` (fixed-point-free involutions).

Stated here:

* Layer 2: the Lee–Yang theorem for ferromagnetic Ising pair interactions with complex fields of
  positive real part; the Lee–Yang property and the product formula of the Laplace transform of an
  Ising-block measure; the tail control of Ising-block sequences converging to a measure with a
  super-Gaussian growth condition; the finite-volume transfer from Ising blocks to the
  Griffiths–Simon class; membership of every φ⁴ measure in the class;
* Layer 3: Griffiths' first and second inequalities, the FKG inequality, the random current
  representation and the switching lemma, the Gaussian (and Lebowitz) inequality and the
  Simon–Lieb inequality for the Griffiths–Simon class, the Messager–Miracle-Solé reflection
  inequality, the uniform second-moment bound for φ⁴ measures and Newman's exponential bound;
* Layer 4: the free-boundary infinite-volume state, the uniform exponential moments of φ⁴ systems,
  the high-temperature bound on the Ising susceptibility with the resulting lower bound on the
  Ising critical point, and the axis monotonicity of the free-boundary two-point function;
* Layer 5: reflection positivity of the periodic measure through vertex and edge hyperplanes, the
  chessboard estimate in dimension at least one, Gaussian domination, the infrared bound and
  long-range order of the Ising model in dimension at least three;
* Layer 6: Gaussian processes with a prescribed positive semidefinite kernel on an arbitrary index
  type, and Wick's law as a characterisation of centred Gaussian random fields;
* Layer 7: the existence, symmetry and `W_d`-invariance of the reachable random field of a
  convergent reachability scheme, and the reachability of the massive (and, in dimension at least
  three, massless) Gaussian free field from Gaussian lattice fields.

Every headline theorem of the roadmap is statable at the pins. The marginal-triviality theorems of
Aizenman–Duminil-Copin are goals of ConstructiveFieldTheoryPhi4PartII, not of this roadmap, and are
not stated here.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal NNReal ComplexOrder FourierTransform CompactlySupported
  BoundedContinuousFunction

namespace TauCetiRoadmap.ConstructiveFieldTheoryPhi4

/-! ## Layer 0: Single-site measures -/

/-- **0.1.** A single-site measure `ρ` on `ℝ` is admissible when `exp (c φ²)` is `ρ`-integrable
for every real `c` (README §0.1). Evenness is Mathlib's `MeasureTheory.Measure.IsNegInvariant`. -/
def IsAdmissible (ρ : Measure ℝ) : Prop :=
  ∀ c : ℝ, Integrable (fun φ : ℝ ↦ Real.exp (c * φ ^ 2)) ρ

/-- **0.2.** The φ⁴ single-site measure `ρ_{λ,b}`, with density proportional to
`exp (−λ φ⁴ + b φ²)` with respect to Lebesgue measure (Aizenman–Duminil-Copin (1.12)): Mathlib's
exponential tilt of Lebesgue measure, a probability measure for `λ > 0`, and for `λ = 0`, `b < 0`
the centred Gaussian of variance `1/(2|b|)` (README §0.2). -/
def phi4Measure (lam b : ℝ) : Measure ℝ :=
  volume.tilted fun φ ↦ -lam * φ ^ 4 + b * φ ^ 2

/-- **0.2.** The Ising single-site measure `ρ_I = ½(δ₋₁ + δ₁)` (README §0.2). -/
def isingMeasure : Measure ℝ :=
  (2 : ℝ≥0∞)⁻¹ • (Measure.dirac (-1) + Measure.dirac 1)

/-! ## Layer 1: Finite-volume lattice measures -/

section FiniteVolume

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **1.1.** The Hamiltonian of a coupling `J` on the unordered pairs of `V`:
`H(φ) = −Σ_{{x,y}, x ≠ y} J_{xy} φ_x φ_y`, the sum over unordered pairs of distinct sites, so
that the diagonal values of `J` play no role (Aizenman–Duminil-Copin (1.12), (1.16); README
§1.1). -/
def hamiltonian (J : Sym2 V → ℝ) (φ : V → ℝ) : ℝ :=
  -∑ e ∈ Finset.univ.filter (fun e : Sym2 V ↦ ¬ e.IsDiag),
    J e * Sym2.lift ⟨fun x y ↦ φ x * φ y, fun _ _ ↦ mul_comm _ _⟩ e

/-- **1.1.** The partition function `Z_{V,J}(ρ) = ∫ exp (−H) dρ^{⊗V} ∈ (0, ∞]`; the triple
`(V, J, ρ)` is stable when it is finite (README §1.1). -/
def partitionFunction (J : Sym2 V → ℝ) (ρ : Measure ℝ) : ℝ≥0∞ :=
  ∫⁻ φ, ENNReal.ofReal (Real.exp (-hamiltonian J φ)) ∂Measure.pi fun _ : V ↦ ρ

/-- **1.1.** The finite-volume Gibbs measure `μ_{V,J,ρ} = Z⁻¹ exp (−H) · ρ^{⊗V}` on `ℝ^V`, the
exponential tilt of `ρ^{⊗V}` by `−H` (Aizenman–Duminil-Copin (1.11)–(1.12); Sokal (2.17); README
§1.1). It is a probability measure when the triple is stable, and the zero measure when `Z = ∞`. -/
def gibbsMeasure (J : Sym2 V → ℝ) (ρ : Measure ℝ) : Measure (V → ℝ) :=
  (Measure.pi fun _ : V ↦ ρ).tilted fun φ ↦ -hamiltonian J φ

end FiniteVolume

/-! ## Layer 2: The Griffiths–Simon class -/

/-- **2.1.** The Ising-block measure `ρ_{N,K,q}`: the law of `Σ_n q_n σ_n` under the Ising Gibbs
measure on `Fin N` with coupling `K` (Aizenman–Duminil-Copin, Definition 2.1(1); README §2.1). -/
def isingBlockMeasure {N : ℕ} (K : Sym2 (Fin N) → ℝ) (q : Fin N → ℝ) : Measure ℝ :=
  (gibbsMeasure K isingMeasure).map fun σ ↦ ∑ n, q n * σ n

/-- **2.1.** `η` is an Ising-block measure with a ferromagnetic coupling and nonnegative weights
(README §2.1). -/
def IsIsingBlock (η : Measure ℝ) : Prop :=
  ∃ (N : ℕ) (K : Sym2 (Fin N) → ℝ) (q : Fin N → ℝ), 0 ≤ K ∧ 0 ≤ q ∧ η = isingBlockMeasure K q

/-- **2.2.** The Griffiths–Simon class: weak limits of sequences of Ising-block measures with
nonnegative weights that satisfy `∫ exp (|φ|^α) dρ < ∞` for some `α > 2` (Aizenman–Duminil-Copin,
Definition 2.1(2) and (2.2), with nonnegative block weights; README §2.2). -/
def griffithsSimonClass : Set (ProbabilityMeasure ℝ) :=
  {ρ | (∃ α : ℝ, 2 < α ∧ Integrable (fun φ : ℝ ↦ Real.exp (|φ| ^ α)) (ρ : Measure ℝ)) ∧
    ∃ η : ℕ → ProbabilityMeasure ℝ, (∀ k, IsIsingBlock (η k : Measure ℝ)) ∧
      Tendsto η atTop (𝓝 ρ)}

section GriffithsSimon

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **2.1, the Lee–Yang theorem.** For a ferromagnetic coupling `J` on a finite set `V` and complex
fields `h` with `Re h_x > 0` at every site, the complex Ising partition function
`∫ exp (−H(σ) + Σ_x h_x σ_x) dρ_I^{⊗V}(σ)` does not vanish (Lebowitz–Ruelle–Speer, Section 1,
the sentence of (1.2), and Lemma 2.4; README §2.1). -/
theorem leeYang (J : Sym2 V → ℝ) (hJ : 0 ≤ J) (h : V → ℂ) (hh : ∀ x, 0 < (h x).re) :
    ∫ σ, Complex.exp (-(hamiltonian J σ : ℂ) + ∑ x, h x * σ x)
      ∂Measure.pi (fun _ : V ↦ isingMeasure) ≠ 0 := by
  sorry

/-- **2.1, the Lee–Yang property of Ising blocks.** The Laplace transform
`h ↦ ∫ exp (h φ) dη` of an Ising-block measure with ferromagnetic coupling and nonnegative
weights vanishes nowhere off the imaginary axis (Aizenman–Duminil-Copin, the paragraph after
Definition 2.1; README §2.1). -/
theorem isingBlock_laplace_ne_zero {η : Measure ℝ} (hη : IsIsingBlock η) {h : ℂ}
    (hh : h.re ≠ 0) : ∫ φ, Complex.exp (h * φ) ∂η ≠ 0 := by
  sorry

/-- **2.1, the product formula.** The Laplace transform of an Ising-block measure with ferromagnetic
coupling and nonnegative weights is `Π_j (1 + h² x_j)` with `x_j = a_j⁻² ≥ 0` summable and
`Σ_j x_j = ½ ∫ φ² dη`; padding by `x_j = 0` covers finitely many zeros. In particular the fourth
cumulant of `η` is `−12 Σ_j x_j² ≤ 0` (Newman's inequalities, which Sokal, property (i) and (2.26),
states for the infinite-volume φ⁴ state; README §2.1). -/
theorem isingBlock_laplace_hasProd {η : Measure ℝ} (hη : IsIsingBlock η) :
    ∃ x : ℕ → ℝ, (∀ j, 0 ≤ x j) ∧ HasSum x (2⁻¹ * ∫ φ, φ ^ 2 ∂η) ∧
      ∀ h : ℂ, HasProd (fun j ↦ 1 + h ^ 2 * (x j : ℂ)) (∫ φ, Complex.exp (h * φ) ∂η) := by
  sorry

/-- **2.2, tail control.** If Ising-block measures `η_k` converge weakly to a probability measure
`ρ` with `∫ exp (|φ|^α) dρ < ∞` for some `α > 2`, then for every real `c` the quadratic
exponential moments `∫ exp (c φ²) dη_k` are bounded uniformly in `k` (README §2.2). -/
theorem isingBlock_tailControl (η : ℕ → ProbabilityMeasure ℝ)
    (hη : ∀ k, IsIsingBlock (η k : Measure ℝ)) (ρ : ProbabilityMeasure ℝ)
    (hlim : Tendsto η atTop (𝓝 ρ)) {α : ℝ} (hα : 2 < α)
    (hρ : Integrable (fun φ : ℝ ↦ Real.exp (|φ| ^ α)) (ρ : Measure ℝ)) (c : ℝ) :
    ∃ C : ℝ, ∀ k, ∫ φ, Real.exp (c * φ ^ 2) ∂(η k : Measure ℝ) ≤ C := by
  sorry

/-- **2.2, the finite-volume transfer.** For `ρ` in the Griffiths–Simon class, every sequence of
Ising-block measures `η_k` converging weakly to `ρ`, every coupling `J` on a finite set and every
continuous `F` with `|F(φ)| ≤ C (1 + Σ_x φ_x²)^m`, the partition functions and the expectations of
`F` converge (Aizenman–Duminil-Copin, the first paragraph of Section 7 and the paragraph after
Proposition 7.2; README §2.2, through §1.4). -/
theorem tendsto_gibbs_of_isingBlock (ρ : ProbabilityMeasure ℝ) (hρ : ρ ∈ griffithsSimonClass)
    (η : ℕ → ProbabilityMeasure ℝ) (hη : ∀ k, IsIsingBlock (η k : Measure ℝ))
    (hlim : Tendsto η atTop (𝓝 ρ)) (J : Sym2 V → ℝ) (F : (V → ℝ) → ℝ) (hF : Continuous F)
    (C : ℝ) (m : ℕ) (hFC : ∀ φ, |F φ| ≤ C * (1 + ∑ x, φ x ^ 2) ^ m) :
    Tendsto (fun k ↦ partitionFunction J (η k : Measure ℝ)) atTop
        (𝓝 (partitionFunction J (ρ : Measure ℝ))) ∧
      Tendsto (fun k ↦ ∫ φ, F φ ∂gibbsMeasure J (η k : Measure ℝ)) atTop
        (𝓝 (∫ φ, F φ ∂gibbsMeasure J (ρ : Measure ℝ))) := by
  sorry

end GriffithsSimon

/-- **2.3.** Every φ⁴ measure `ρ_{λ,b}`, `λ > 0`, `b ∈ ℝ`, belongs to the Griffiths–Simon class: it
is the weak limit of rescaled Curie–Weiss block spins (Griffiths–Simon 1973;
Aizenman–Duminil-Copin (2.3)–(2.4); README §2.3). -/
theorem phi4Measure_mem_griffithsSimonClass {lam : ℝ} (hlam : 0 < lam) (b : ℝ) :
    ∃ ρ ∈ griffithsSimonClass, (ρ : Measure ℝ) = phi4Measure lam b := by
  sorry

/-! ## Layer 3: Correlation inequalities in finite volume -/

section Correlation

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **3.1, Griffiths' first inequality.** For a ferromagnetic coupling and an even admissible
single-site probability measure, every moment `⟨φ_A⟩ = ⟨Π_x φ_x^{A(x)}⟩` is nonnegative
(Peled–Spinka, Theorem 2.1, for Ising spins; Sokal (2.19), for the infinite-volume φ⁴ state;
README §3.1). -/
theorem griffiths_first (J : Sym2 V → ℝ) (hJ : 0 ≤ J) (ρ : Measure ℝ) [IsProbabilityMeasure ρ]
    [ρ.IsNegInvariant] (hρ : IsAdmissible ρ) (A : V → ℕ) :
    0 ≤ ∫ φ, ∏ x, φ x ^ A x ∂gibbsMeasure J ρ := by
  sorry

/-- **3.1, Griffiths' second inequality.** Under the same hypotheses,
`⟨φ_A φ_B⟩ ≥ ⟨φ_A⟩ ⟨φ_B⟩` for all multi-indices `A`, `B` (Peled–Spinka, Theorem 2.3, for products
of two spins in the spin O(n) model with `n ∈ {1, 2}`; Sokal (2.20), for the infinite-volume φ⁴
state; README §3.1). -/
theorem griffiths_second (J : Sym2 V → ℝ) (hJ : 0 ≤ J) (ρ : Measure ℝ) [IsProbabilityMeasure ρ]
    [ρ.IsNegInvariant] (hρ : IsAdmissible ρ) (A B : V → ℕ) :
    (∫ φ, ∏ x, φ x ^ A x ∂gibbsMeasure J ρ) * (∫ φ, ∏ x, φ x ^ B x ∂gibbsMeasure J ρ) ≤
      ∫ φ, (∏ x, φ x ^ A x) * ∏ x, φ x ^ B x ∂gibbsMeasure J ρ := by
  sorry

/-- **3.3, the FKG inequality.** For a ferromagnetic coupling and an admissible single-site
probability measure (not necessarily even), bounded measurable functions non-decreasing in each
coordinate are positively correlated (Sokal (2.25), for the infinite-volume φ⁴ state;
README §3.3). -/
theorem fkg_gibbs (J : Sym2 V → ℝ) (hJ : 0 ≤ J) (ρ : Measure ℝ) [IsProbabilityMeasure ρ]
    (hρ : IsAdmissible ρ) (F G : (V → ℝ) → ℝ) (hF : Monotone F) (hG : Monotone G)
    (hFm : Measurable F) (hGm : Measurable G) (hFb : ∃ C, ∀ φ, |F φ| ≤ C)
    (hGb : ∃ C, ∀ φ, |G φ| ≤ C) :
    (∫ φ, F φ ∂gibbsMeasure J ρ) * (∫ φ, G φ ∂gibbsMeasure J ρ) ≤
      ∫ φ, F φ * G φ ∂gibbsMeasure J ρ := by
  sorry

end Correlation

/-- **3.4.** The edges of a finite set: unordered pairs of distinct points. Currents are functions
from edges to `ℕ` (Aizenman–Duminil-Copin, Definition 3.1; README §3.4). -/
abbrev Edge (V : Type*) : Type _ := {e : Sym2 V // ¬ e.IsDiag}

section Currents

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **3.4.** The sources `∂n` of a current `n`: the sites at which the total current is odd
(Aizenman–Duminil-Copin, Definition 3.1; README §3.4). -/
def sources (n : Edge V → ℕ) : Finset V :=
  Finset.univ.filter fun x ↦ Odd (∑ e ∈ Finset.univ.filter (fun e : Edge V ↦ x ∈ e.1), n e)

/-- **3.4.** The weight `w_J(n) = Π_{{x,y}} J_{xy}^{n_{xy}} / n_{xy}!` of a current
(Aizenman–Duminil-Copin (3.2); README §3.4). -/
def currentWeight (J : Sym2 V → ℝ) (n : Edge V → ℕ) : ℝ :=
  ∏ e, J e.1 ^ n e / ((n e).factorial : ℝ)

/-- **3.4, the random current representation.** For a ferromagnetic coupling and `A ⊆ V`,
`Z ⟨σ_A⟩ = ∫ σ_A exp (−H) dρ_I^{⊗V}` is the sum of the weights of the currents with sources `A`
(Aizenman–Duminil-Copin (3.3)–(3.5); README §3.4). -/
theorem randomCurrent_representation (J : Sym2 V → ℝ) (hJ : 0 ≤ J) (A : Finset V) :
    HasSum (fun n : Edge V → ℕ ↦ if sources n = A then currentWeight J n else 0)
      (∫ σ, (∏ x ∈ A, σ x) * Real.exp (-hamiltonian J σ)
        ∂Measure.pi fun _ : V ↦ isingMeasure) := by
  sorry

open Classical in
/-- **3.4, the switching lemma.** For a ferromagnetic coupling, `A, B ⊆ V` and every
`F` from currents to `[0, ∞]`,
`Σ_{∂n₁ = A, ∂n₂ = B} F(n₁ + n₂) w(n₁) w(n₂)` equals the same sum over `∂n₁ = A ∆ B`, `∂n₂ = ∅`
restricted to the event that `n₁ + n₂` contains a current with sources `B`
(Aizenman–Duminil-Copin, Lemma 3.3 and (3.6); README §3.4). -/
theorem switching_lemma (J : Sym2 V → ℝ) (hJ : 0 ≤ J) (A B : Finset V)
    (F : (Edge V → ℕ) → ℝ≥0∞) :
    ∑' (n₁ : Edge V → ℕ) (n₂ : Edge V → ℕ),
        (if sources n₁ = A ∧ sources n₂ = B then
          F (n₁ + n₂) * ENNReal.ofReal (currentWeight J n₁) *
            ENNReal.ofReal (currentWeight J n₂) else 0) =
      ∑' (n₁ : Edge V → ℕ) (n₂ : Edge V → ℕ),
        (if sources n₁ = symmDiff A B ∧ sources n₂ = ∅ ∧ ∃ m ≤ n₁ + n₂, sources m = B then
          F (n₁ + n₂) * ENNReal.ofReal (currentWeight J n₁) *
            ENNReal.ofReal (currentWeight J n₂) else 0) := by
  sorry

end Currents

section ClassInequalities

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **3.5, the Gaussian inequality** (whose case `n = 2` is the Lebowitz inequality `U₄ ≤ 0`).
For a ferromagnetic coupling, `ρ` in the Griffiths–Simon class and sites `x₁, …, x_{2n}`,
repetitions allowed, `⟨φ_{x₁} ⋯ φ_{x_{2n}}⟩` is at most the sum over pairings of the products of
two-point functions (Aizenman–Duminil-Copin (3.11), for the Lebowitz inequality of Ising spins in
infinite volume, and Section 7.1; Sokal (2.23)–(2.24), for the infinite-volume φ⁴ state;
README §3.5). -/
theorem gaussian_inequality (J : Sym2 V → ℝ) (hJ : 0 ≤ J) (ρ : ProbabilityMeasure ℝ)
    (hρ : ρ ∈ griffithsSimonClass) (n : ℕ) (x : Fin (2 * n) → V) :
    ∫ φ, ∏ i, φ (x i) ∂gibbsMeasure J (ρ : Measure ℝ) ≤
      ∑ π : TauCeti.PerfectMatching (Fin (2 * n)),
        ∏ i ∈ Finset.univ.filter (fun i ↦ i < π.1 i),
          ∫ φ, φ (x i) * φ (x (π.1 i)) ∂gibbsMeasure J (ρ : Measure ℝ) := by
  sorry

/-- **3.5, the Simon–Lieb inequality.** For a ferromagnetic coupling, `ρ` in the Griffiths–Simon
class, a set `Λ ⊆ V` containing `o` and a site `y ∉ Λ`,
`⟨φ_o φ_y⟩_V ≤ Σ_{u ∈ Λ, v ∉ Λ} ⟨φ_o φ_u⟩_Λ J_{uv} ⟨φ_v φ_y⟩_V`, where `⟨·⟩_Λ` is the Gibbs
measure of the restriction of `J` to `Λ` (Aizenman–Duminil-Copin, Lemma 5.7 and footnote 5;
README §3.5). -/
theorem simon_lieb (J : Sym2 V → ℝ) (hJ : 0 ≤ J) (ρ : ProbabilityMeasure ℝ)
    (hρ : ρ ∈ griffithsSimonClass) (Λ : Finset V) (o y : V) (ho : o ∈ Λ) (hy : y ∉ Λ) :
    ∫ φ, φ o * φ y ∂gibbsMeasure J (ρ : Measure ℝ) ≤
      ∑ u : Λ, ∑ v ∈ Λᶜ,
        (∫ φ, φ ⟨o, ho⟩ * φ u
            ∂gibbsMeasure (fun e : Sym2 Λ ↦ J (e.map Subtype.val)) (ρ : Measure ℝ)) *
          J s(u.1, v) * ∫ φ, φ v * φ y ∂gibbsMeasure J (ρ : Measure ℝ) := by
  sorry

/-- **3.6, the Messager–Miracle-Solé inequality.** Let `R` be an involution of `V`, `P` a set with
`R(P) ∩ P = ∅` such that every site lies in `P`, in `R(P)` or is fixed by `R`; let `J` be
ferromagnetic, `R`-invariant, and satisfy `J_{x,Ry} ≤ J_{xy}` for distinct `x, y ∈ P`. For an even
admissible single-site probability measure and multi-indices `A`, `B` vanishing on `R(P)`,
`⟨φ_A φ_{B∘R}⟩ ≤ ⟨φ_A φ_B⟩` (Sokal (2.29)–(2.30) and the Remark after them, for the
infinite-volume φ⁴ state; Aizenman–Duminil-Copin (5.2), for single-site measures with their growth
condition (2.2); README §3.6). -/
theorem messager_miracleSole (J : Sym2 V → ℝ) (hJ : 0 ≤ J) (ρ : Measure ℝ)
    [IsProbabilityMeasure ρ] [ρ.IsNegInvariant] (hρ : IsAdmissible ρ) (R : Equiv.Perm V)
    (hR : Function.Involutive R) (P : Finset V) (hPR : ∀ x ∈ P, R x ∉ P)
    (hcover : ∀ x, x ∈ P ∨ R x ∈ P ∨ R x = x) (hJR : ∀ e, J (e.map R) = J e)
    (hJP : ∀ x ∈ P, ∀ y ∈ P, x ≠ y → J s(x, R y) ≤ J s(x, y)) (A B : V → ℕ)
    (hA : ∀ x, R x ∈ P → A x = 0) (hB : ∀ x, R x ∈ P → B x = 0) :
    ∫ φ, (∏ x, φ x ^ A x) * ∏ x, φ x ^ B (R x) ∂gibbsMeasure J ρ ≤
      ∫ φ, (∏ x, φ x ^ A x) * ∏ x, φ x ^ B x ∂gibbsMeasure J ρ := by
  sorry

/-- **3.7, the uniform second-moment bound.** For `λ > 0`, `b ∈ ℝ` and any coupling whose row sums
`Σ_{y ≠ x} |J_{xy}|` are at most `K`, every `⟨φ_x²⟩` under the φ⁴ Gibbs measure is at most
`[(2b₊ + K) + √((2b₊ + K)² + 16λ)] / (8λ)`, independently of `V` (derived from the
integration-by-parts identity, which Sokal, Section 3.1, (3.4)–(3.5), states for the
nearest-neighbour φ⁴ model, by Jensen's and the Cauchy–Schwarz inequalities; README §3.7). -/
theorem phi4_secondMoment_le {lam : ℝ} (hlam : 0 < lam) (b : ℝ) (J : Sym2 V → ℝ) (K : ℝ)
    (hK : ∀ x, ∑ y ∈ Finset.univ.erase x, |J s(x, y)| ≤ K) (x : V) :
    ∫ φ, φ x ^ 2 ∂gibbsMeasure J (phi4Measure lam b) ≤
      ((2 * max b 0 + K) + Real.sqrt ((2 * max b 0 + K) ^ 2 + 16 * lam)) / (8 * lam) := by
  sorry

/-- **3.7, Newman's exponential bound.** For a ferromagnetic coupling, `ρ` in the Griffiths–Simon
class and complex coefficients `z`,
`|⟨exp (Σ_x z_x φ_x)⟩| ≤ exp (½ Σ_{x,y} |Re z_x| |Re z_y| ⟨φ_x φ_y⟩)` (Sokal, property (j),
(2.27), for the infinite-volume φ⁴ state; README §3.7). -/
theorem newman_bound (J : Sym2 V → ℝ) (hJ : 0 ≤ J) (ρ : ProbabilityMeasure ℝ)
    (hρ : ρ ∈ griffithsSimonClass) (z : V → ℂ) :
    ‖∫ φ, Complex.exp (∑ x, z x * φ x) ∂gibbsMeasure J (ρ : Measure ℝ)‖ ≤
      Real.exp (2⁻¹ * ∑ x, ∑ y, |(z x).re| * |(z y).re| *
        ∫ φ, φ x * φ y ∂gibbsMeasure J (ρ : Measure ℝ)) := by
  sorry

end ClassInequalities

/-! ## Layer 4: The free-boundary infinite-volume state -/

/-- **4.1.** The box `V_R = [−R, R]^d ∩ ℤ^d` (Aizenman–Duminil-Copin (1.8); README Conventions). -/
def box (d R : ℕ) : Finset (Fin d → ℤ) :=
  Fintype.piFinset fun _ ↦ Finset.Icc (-(R : ℤ)) R

/-- **4.1.** The free-boundary Gibbs measure on the box `V_R` of the restriction of a coupling `J`
on `ℤ^d`, transported to `ℝ^{ℤ^d}` by extending configurations by zero outside `V_R`
(README §4.1). -/
def boxGibbs (d : ℕ) (J : Sym2 (Fin d → ℤ) → ℝ) (ρ : Measure ℝ) (R : ℕ) :
    Measure ((Fin d → ℤ) → ℝ) :=
  (gibbsMeasure (fun e : Sym2 (box d R) ↦ J (e.map Subtype.val)) ρ).map
    fun φ x ↦ if h : x ∈ box d R then φ ⟨x, h⟩ else 0

/-- The nearest-neighbour coupling of strength `1` on `ℤ^d`: `J_{xy} = 1` when `‖x − y‖₁ = 1` and
`0` otherwise (README Conventions). -/
def nnCoupling (d : ℕ) : Sym2 (Fin d → ℤ) → ℝ :=
  Sym2.lift ⟨fun x y ↦ if ∑ i, |x i - y i| = 1 then 1 else 0,
    fun x y ↦ by simp only [abs_sub_comm]⟩

/-- **4.3.** The free-boundary two-point function `S(x) = ⟨φ_0 φ_x⟩ ∈ [0, ∞]`, the supremum over
boxes of the box correlations, which for an even admissible `ρ` and a ferromagnetic `J` is their
monotone limit (Aizenman–Duminil-Copin (5.1); README §4.3). -/
def twoPoint (d : ℕ) (J : Sym2 (Fin d → ℤ) → ℝ) (ρ : Measure ℝ) (x : Fin d → ℤ) : ℝ≥0∞ :=
  ⨆ R : ℕ, ENNReal.ofReal (∫ ω, ω 0 * ω x ∂boxGibbs d J ρ R)

/-- **4.3.** The susceptibility `χ(ρ, J) = Σ_x S(x) ∈ [0, ∞]` (README §4.3). -/
def susceptibility (d : ℕ) (J : Sym2 (Fin d → ℤ) → ℝ) (ρ : Measure ℝ) : ℝ≥0∞ :=
  ∑' x, twoPoint d J ρ x

/-- **4.3.** The critical point `β_c(ρ, J) = sup {β ≥ 0 : χ(ρ, βJ) < ∞} ∈ [0, ∞]`
(Aizenman–Duminil-Copin (5.1); Sokal (2.33); README §4.3). -/
def criticalPoint (d : ℕ) (J : Sym2 (Fin d → ℤ) → ℝ) (ρ : Measure ℝ) : ℝ≥0∞ :=
  ⨆ (β : ℝ≥0) (_ : susceptibility d (fun e ↦ (β : ℝ) * J e) ρ < ⊤), (β : ℝ≥0∞)

/-- **4.2, the free-boundary infinite-volume state.** Let `J` be a translation-invariant,
finite-range ferromagnetic coupling on `ℤ^d` and `ρ` an even admissible single-site probability
measure with uniformly bounded exponential moments `⟨exp (a |φ_x|)⟩_{V_R}`. Then the box Gibbs
measures converge weakly on `ℝ^{ℤ^d}` (product topology, equivalently in finite-dimensional
distributions) to a probability measure whose moments are the limits of the box moments and which
is invariant under translations and under `φ ↦ −φ` (Sokal, properties (a)–(b) and (2.18), for the
nearest-neighbour φ⁴ model; README §4.2). -/
theorem exists_infiniteVolume_limit (d : ℕ) (J : Sym2 (Fin d → ℤ) → ℝ) (hJ : 0 ≤ J)
    (hJt : ∀ (a : Fin d → ℤ) (e : Sym2 (Fin d → ℤ)), J (e.map (· + a)) = J e)
    (hJr : ∃ r : ℝ, ∀ x y : Fin d → ℤ, r < ‖x - y‖ → J s(x, y) = 0)
    (ρ : Measure ℝ) [IsProbabilityMeasure ρ] [ρ.IsNegInvariant] (hρ : IsAdmissible ρ)
    (hexp : ∃ a : ℝ, 0 < a ∧ ∃ C : ℝ, ∀ (R : ℕ) (x : Fin d → ℤ), x ∈ box d R →
      ∫ ω, Real.exp (a * |ω x|) ∂boxGibbs d J ρ R ≤ C) :
    ∃ μ : Measure ((Fin d → ℤ) → ℝ), IsProbabilityMeasure μ ∧
      (∀ f : ((Fin d → ℤ) → ℝ) →ᵇ ℝ,
        Tendsto (fun R ↦ ∫ ω, f ω ∂boxGibbs d J ρ R) atTop (𝓝 (∫ ω, f ω ∂μ))) ∧
      (∀ A : (Fin d → ℤ) →₀ ℕ,
        Tendsto (fun R ↦ ∫ ω, A.prod (fun x k ↦ ω x ^ k) ∂boxGibbs d J ρ R) atTop
          (𝓝 (∫ ω, A.prod (fun x k ↦ ω x ^ k) ∂μ))) ∧
      (∀ a : Fin d → ℤ, μ.map (fun ω x ↦ ω (x + a)) = μ) ∧ μ.map (fun ω ↦ -ω) = μ := by
  sorry

/-- **4.2, uniform exponential moments of φ⁴ systems.** For a translation-invariant, finite-range
ferromagnetic coupling on `ℤ^d` and a φ⁴ single-site measure, `⟨exp (a |φ_x|)⟩_{V_R}` is bounded
uniformly in `R` and `x ∈ V_R` for every `a > 0`, so the infinite-volume state exists (README §4.2,
through §2.3 and §3.7). -/
theorem phi4_uniform_expMoment (d : ℕ) (J : Sym2 (Fin d → ℤ) → ℝ) (hJ : 0 ≤ J)
    (hJt : ∀ (a : Fin d → ℤ) (e : Sym2 (Fin d → ℤ)), J (e.map (· + a)) = J e)
    (hJr : ∃ r : ℝ, ∀ x y : Fin d → ℤ, r < ‖x - y‖ → J s(x, y) = 0) {lam : ℝ} (hlam : 0 < lam)
    (b : ℝ) (a : ℝ) :
    ∃ C : ℝ, ∀ (R : ℕ) (x : Fin d → ℤ), x ∈ box d R →
      ∫ ω, Real.exp (a * |ω x|) ∂boxGibbs d J (phi4Measure lam b) R ≤ C := by
  sorry

/-- **4.3, the high-temperature bound.** For the nearest-neighbour Ising model on `ℤ^d` and every
`β ≥ 0` with `2dβ < 1`, the susceptibility at coupling `β J^{nn}` is at most `1/(1 − 2dβ)`; in
particular the critical point is at least `1/(2d)` (from the Simon–Lieb inequality of §3.5 with `Λ`
a single site, in the finite-volume form of Aizenman–Duminil-Copin, Lemma 5.7 with footnote 5,
p. 30; README §4.3). -/
theorem criticalPoint_ising_ge (d : ℕ) :
    (∀ β : ℝ≥0, 2 * (d : ℝ) * β < 1 →
        susceptibility d (fun e ↦ (β : ℝ) * nnCoupling d e) isingMeasure ≤
          ENNReal.ofReal (1 - 2 * (d : ℝ) * β)⁻¹) ∧
      ((2 * d : ℝ≥0∞))⁻¹ ≤ criticalPoint d (nnCoupling d) isingMeasure := by
  sorry

/-- **4.4, axis monotonicity of the two-point function.** For the nearest-neighbour coupling of
strength `J ≥ 0` and an even admissible single-site probability measure: `S(n e_i)` is
non-increasing in `n`; `S(‖x‖₁ e_i) ≤ S(x) ≤ S(‖x‖∞ e_i)`; and `S(y) ≤ S(x)` whenever
`‖y‖∞ ≥ d ‖x‖∞` (Aizenman–Duminil-Copin, Proposition 5.1 and (5.3)–(5.4), for single-site measures
with their growth condition (2.2); README §4.4). -/
theorem twoPoint_reflection_monotone (d : ℕ) {J : ℝ} (hJ : 0 ≤ J) (ρ : Measure ℝ)
    [IsProbabilityMeasure ρ] [ρ.IsNegInvariant] (hρ : IsAdmissible ρ) (i : Fin d) :
    Antitone (fun n : ℕ ↦ twoPoint d (fun e ↦ J * nnCoupling d e) ρ (Pi.single i (n : ℤ))) ∧
      (∀ x : Fin d → ℤ,
        twoPoint d (fun e ↦ J * nnCoupling d e) ρ (Pi.single i (∑ j, |x j|)) ≤
          twoPoint d (fun e ↦ J * nnCoupling d e) ρ x ∧
        twoPoint d (fun e ↦ J * nnCoupling d e) ρ x ≤
          twoPoint d (fun e ↦ J * nnCoupling d e) ρ
            (Pi.single i ((Finset.univ.sup fun j ↦ (x j).natAbs : ℕ) : ℤ))) ∧
      ∀ x y : Fin d → ℤ, (d : ℝ) * ‖x‖ ≤ ‖y‖ →
        twoPoint d (fun e ↦ J * nnCoupling d e) ρ y ≤
          twoPoint d (fun e ↦ J * nnCoupling d e) ρ x := by
  sorry

/-! ## Layer 5: Reflection positivity and the infrared bound on the torus -/

/-- **5.1.** The periodic nearest-neighbour coupling of strength `J` on the torus
`T_L = (ℤ/2Lℤ)^d`: `J^{per}_{xy} = J · #{(j, ±) : y = x ± e_j}`, so that each pair of neighbours
carries `J` for `L ≥ 2` and `2J` for `L = 1` (Aizenman–Duminil-Copin (5.5)–(5.6); README §5.1). -/
def torusCoupling (d L : ℕ) (J : ℝ) : Sym2 (Fin d → ZMod (2 * L)) → ℝ :=
  Sym2.lift ⟨fun x y ↦ J * (((Finset.univ.filter fun j ↦ y = x + Pi.single j 1).card +
      (Finset.univ.filter fun j ↦ x = y + Pi.single j 1).card : ℕ) : ℝ),
    fun x y ↦ by simp only [Nat.add_comm]⟩

/-- **5.1.** The symbol `E(p) = 2 Σ_j (1 − cos p_j)` of the lattice Laplacian at the dual torus
point `p = (π/L) k` (README Conventions). -/
def torusSymbol {d : ℕ} (L : ℕ) (k : Fin d → ZMod (2 * L)) : ℝ :=
  2 * ∑ j, (1 - Real.cos (Real.pi * (k j).val / L))

/-- **5.1.** The structure factor `Ŝ_L(p) = Σ_{x ∈ T_L} e^{i p·x} ⟨φ_0 φ_x⟩^{per}` at
`p = (π/L) k`, written with cosines since the two-point function is even (Aizenman–Duminil-Copin
(5.7)–(5.8); README §5.1). -/
def structureFactor (d L : ℕ) [NeZero L] (J : ℝ) (ρ : Measure ℝ) (k : Fin d → ZMod (2 * L)) :
    ℝ :=
  ∑ x, Real.cos (Real.pi * (∑ j, ((k j).val : ℝ) * (x j).val) / L) *
    ∫ φ, φ 0 * φ x ∂gibbsMeasure (torusCoupling d L J) ρ

/-- **5.4.** The constant `I_d = (2π)^{−d} ∫_{[−π,π]^d} dp / E(p)`, finite for `d ≥ 3`; for `d = 3`
it is half of Watson's integral (README §5.4). -/
def infraredConstant (d : ℕ) : ℝ :=
  (2 * Real.pi)⁻¹ ^ d * ∫ p in Set.univ.pi (fun _ : Fin d ↦ Set.Ioc (-Real.pi) Real.pi),
    (2 * ∑ j, (1 - Real.cos (p j)))⁻¹

/-- **5.2, reflection positivity.** For `J ≥ 0`, an admissible single-site probability measure, a
coordinate `j`, a base point `a` and `ε ∈ {0, 1}` (`ε = 0`: the hyperplane through the vertices
`x_j ∈ {a, a + L}`; `ε = 1`: the hyperplane bisecting the edges between `a, a + 1` and between
`a + L, a + L + 1`), every bounded measurable complex `f` depending only on the spins `φ_x` with
`ε ≤ (x_j − a) mod 2L ≤ L` satisfies `⟨f · conj (f ∘ R)⟩^{per} ≥ 0`, where `R` reflects `x_j` to
`2a + ε − x_j` (Peled–Spinka, Propositions 2.14 and 2.15; README §5.2). -/
theorem reflectionPositive (d L : ℕ) [NeZero L] {J : ℝ} (hJ : 0 ≤ J) (ρ : Measure ℝ)
    [IsProbabilityMeasure ρ] (hρ : IsAdmissible ρ) (j : Fin d) (a : ZMod (2 * L)) (ε : ℕ)
    (hε : ε ≤ 1) (f : ((Fin d → ZMod (2 * L)) → ℝ) → ℂ) (hf : Measurable f)
    (hfb : ∃ C, ∀ φ, ‖f φ‖ ≤ C)
    (hloc : ∀ φ ψ : (Fin d → ZMod (2 * L)) → ℝ,
      (∀ x, ε ≤ (x j - a).val → (x j - a).val ≤ L → φ x = ψ x) → f φ = f ψ) :
    0 ≤ ∫ φ, f φ * starRingEnd ℂ (f fun x ↦ φ (Function.update x j (2 * a + ε - x j)))
      ∂gibbsMeasure (torusCoupling d L J) ρ := by
  sorry

/-- **5.2, the chessboard estimate.** For `d ≥ 1`, so that `|T_L| = (2L)^d` is even, `J ≥ 0`, an
admissible single-site probability measure and bounded measurable real functions `f_v`, `v ∈ T_L`,
`|⟨Π_v f_v(φ_v)⟩|^{|T_L|} ≤ Π_w ⟨Π_v f_w(φ_v)⟩` (Peled–Spinka, Proposition 2.16;
README §5.2). On the one-point torus (`d = 0`) the estimate fails for `f ≡ −1`. -/
theorem chessboard (d L : ℕ) (hd : 1 ≤ d) [NeZero L] {J : ℝ} (hJ : 0 ≤ J) (ρ : Measure ℝ)
    [IsProbabilityMeasure ρ] (hρ : IsAdmissible ρ) (f : (Fin d → ZMod (2 * L)) → ℝ → ℝ)
    (hf : ∀ v, Measurable (f v)) (hfb : ∃ C, ∀ v t, |f v t| ≤ C) :
    |∫ φ, ∏ v, f v (φ v) ∂gibbsMeasure (torusCoupling d L J) ρ| ^
        Fintype.card (Fin d → ZMod (2 * L)) ≤
      ∏ w, ∫ φ, ∏ v, f w (φ v) ∂gibbsMeasure (torusCoupling d L J) ρ := by
  sorry

/-- **5.3, Gaussian domination.** For `J ≥ 0`, an admissible single-site probability measure `ρ` and
every `h ∈ ℝ^{T_L}`, `Z(h) ≤ Z(0)`, where
`Z(h) = ∫ exp (−(J/2) Σ_x Σ_j (φ_x + h_x − φ_{x+e_j} − h_{x+e_j})²) Π_x ρ̃(dφ_x)` and
`ρ̃(dφ) = exp (d J φ²) ρ(dφ)` (Peled–Spinka (43)–(48) and Simon, Twelve Tales (5.19)–(5.21), for
the spin O(n) model; README §5.3). -/
theorem gaussian_domination (d L : ℕ) [NeZero L] {J : ℝ} (hJ : 0 ≤ J) (ρ : Measure ℝ)
    [IsProbabilityMeasure ρ] (hρ : IsAdmissible ρ) (h : (Fin d → ZMod (2 * L)) → ℝ) :
    ∫⁻ φ, ENNReal.ofReal (Real.exp (-(J / 2) * ∑ x, ∑ j,
        (φ x + h x - φ (x + Pi.single j 1) - h (x + Pi.single j 1)) ^ 2))
        ∂Measure.pi (fun _ : Fin d → ZMod (2 * L) ↦
          ρ.withDensity fun t ↦ ENNReal.ofReal (Real.exp (d * J * t ^ 2))) ≤
      ∫⁻ φ, ENNReal.ofReal (Real.exp (-(J / 2) * ∑ x, ∑ j, (φ x - φ (x + Pi.single j 1)) ^ 2))
        ∂Measure.pi (fun _ : Fin d → ZMod (2 * L) ↦
          ρ.withDensity fun t ↦ ENNReal.ofReal (Real.exp (d * J * t ^ 2))) := by
  sorry

/-- **5.4, the infrared bound.** For `J > 0` and an admissible single-site probability measure,
`E(p) Ŝ_L(p) ≤ 1/J` at every nonzero dual point `p = (π/L) k` (Peled–Spinka (49)–(52), for the
spin O(n) model; Fröhlich–Simon–Spencer 1976, Theorem 1; Aizenman–Duminil-Copin (5.9), for
single-site measures with their growth condition (2.2), with the constant corrected as in the
README Conventions; README §5.4). -/
theorem infrared_bound (d L : ℕ) [NeZero L] {J : ℝ} (hJ : 0 < J) (ρ : Measure ℝ)
    [IsProbabilityMeasure ρ] (hρ : IsAdmissible ρ) (k : Fin d → ZMod (2 * L)) (hk : k ≠ 0) :
    torusSymbol L k * structureFactor d L J ρ k ≤ 1 / J := by
  sorry

/-- **5.5, long-range order of the Ising model.** For `d ≥ 3` and `J > 0`,
`liminf_L ⟨(|T_L|⁻¹ Σ_x σ_x)²⟩^{per} ≥ 1 − I_d / J`, positive for `J > I_d`; here the torus
`T_{L+1}` runs over `L ∈ ℕ` (Peled–Spinka, Theorem 2.13 and (53); Fröhlich–Simon–Spencer 1976;
README §5.5). -/
theorem ising_longRangeOrder (d : ℕ) (hd : 3 ≤ d) {J : ℝ} (hJ : 0 < J) (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ L : ℕ in atTop, 1 - infraredConstant d / J - ε ≤
      ∫ σ, ((Fintype.card (Fin d → ZMod (2 * (L + 1))) : ℝ)⁻¹ * ∑ x, σ x) ^ 2
        ∂gibbsMeasure (torusCoupling d (L + 1) J) isingMeasure := by
  sorry

/-! ## Layer 6: Random fields, Schwinger functions and Gaussian fields -/

/-- **6.1.** A random field on `ℝ^d` over `(Ω, P)`: real random variables `T_f` indexed by
compactly supported continuous `f`, with `T_{af + bg} = a T_f + b T_g` almost surely
(Aizenman–Duminil-Copin (1.4); README §6.1). -/
def IsRandomField {Ω : Type*} [MeasurableSpace Ω] (d : ℕ)
    (T : C_c(EuclideanSpace ℝ (Fin d), ℝ) → Ω → ℝ) (P : Measure Ω) : Prop :=
  (∀ f, Measurable (T f)) ∧
    ∀ (f g : C_c(EuclideanSpace ℝ (Fin d), ℝ)) (a b : ℝ),
      T (a • f + b • g) =ᵐ[P] fun ω ↦ a * T f ω + b * T g ω

/-- **6.3, Gaussian processes with a prescribed covariance.** For any index type `I` and any
symmetric positive semidefinite kernel `K`, there is a unique probability measure on `ℝ^I` (product
σ-algebra) under which the coordinate process is a centred Gaussian process with covariance `K`
(README §6.3). -/
theorem exists_unique_gaussianProcess {I : Type*} (K : I → I → ℝ) (hK : ∀ i j, K i j = K j i)
    (hpsd : ∀ (s : Finset I) (c : I → ℝ), 0 ≤ ∑ i ∈ s, ∑ j ∈ s, c i * c j * K i j) :
    ∃! μ : Measure (I → ℝ), IsProbabilityMeasure μ ∧ IsGaussianProcess (fun i ω ↦ ω i) μ ∧
      (∀ i, ∫ ω, ω i ∂μ = 0) ∧ ∀ i j, ∫ ω, ω i * ω j ∂μ = K i j := by
  sorry

/-- **6.4, Wick's law.** A random field with moments of all orders and mean zero is a generalised
Gaussian process if and only if its odd moments vanish and its even moments are sums over
pairings of products of second moments (Aizenman–Duminil-Copin (1.7); README §6.4). -/
theorem isGaussianProcess_iff_wick {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P] (d : ℕ) (T : C_c(EuclideanSpace ℝ (Fin d), ℝ) → Ω → ℝ)
    (hT : IsRandomField d T P) (hmom : ∀ f (n : ℕ), Integrable (fun ω ↦ T f ω ^ n) P)
    (hcent : ∀ f, ∫ ω, T f ω ∂P = 0) :
    IsGaussianProcess T P ↔
      (∀ (n : ℕ) (f : Fin (2 * n + 1) → C_c(EuclideanSpace ℝ (Fin d), ℝ)),
        ∫ ω, ∏ i, T (f i) ω ∂P = 0) ∧
      ∀ (n : ℕ) (f : Fin (2 * n) → C_c(EuclideanSpace ℝ (Fin d), ℝ)),
        ∫ ω, ∏ i, T (f i) ω ∂P =
          ∑ π : TauCeti.PerfectMatching (Fin (2 * n)),
            ∏ i ∈ Finset.univ.filter (fun i ↦ i < π.1 i), ∫ ω, T (f i) ω * T (f (π.1 i)) ω ∂P := by
  sorry

/-! ## Layer 7: Reachable random fields -/

/-- **7.1.** The point `x / L ∈ ℝ^d` of the rescaled lattice (README §7.1). -/
def latticePoint {d : ℕ} (L : ℕ) (x : Fin d → ℤ) : EuclideanSpace ℝ (Fin d) :=
  WithLp.toLp 2 fun i ↦ (x i : ℝ) / L

/-- **7.1.** The block second moment `Σ^{(R)}_L = ⟨(Σ_{x ∈ Λ_L} φ_x)²⟩_{V_R}`
(Aizenman–Duminil-Copin (1.15); README §7.1). -/
def blockSecondMoment (d : ℕ) (J : Sym2 (Fin d → ℤ) → ℝ) (ρ : Measure ℝ) (L R : ℕ) : ℝ :=
  ∫ ω, (∑ x ∈ box d L, ω x) ^ 2 ∂boxGibbs d J ρ R

/-- **7.1.** The rescaled lattice field `T_{f,L,Σ}(φ) = Σ^{−1/2} Σ_{x ∈ V_R} f(x/L) φ_x` of a
function `f : ℝ^d → ℝ` on the box `V_R`, evaluated on a configuration of `ℝ^{ℤ^d}`
(Aizenman–Duminil-Copin (1.14); README §7.1); with Lean's conventions it is `0` when `Σ = 0`. -/
def rescaledField {d : ℕ} (L R : ℕ) (s : ℝ) (f : EuclideanSpace ℝ (Fin d) → ℝ)
    (ω : (Fin d → ℤ) → ℝ) : ℝ :=
  (Real.sqrt s)⁻¹ * ∑ x ∈ box d R, f (latticePoint L x) * ω x

/-- **7.2.** A reachability scheme for a class `𝒞` of single-site measures: single-site measures
`ρ_n ∈ 𝒞`, strengths `J_n ≥ 0` of the nearest-neighbour coupling, scales `L_n → ∞` and volumes
`R_{n,k} ≥ L_n` with `R_{n,k} → ∞` as `k → ∞`, such that every box Gibbs measure is a probability
measure (the triple is stable) with square-integrable coordinates (Aizenman–Duminil-Copin,
Definition 1.1 and footnote 2; README §7.2). -/
structure ReachabilityScheme (d : ℕ) (𝒞 : Set (Measure ℝ)) where
  /-- The single-site measures `ρ_n`. -/
  ρ : ℕ → Measure ℝ
  /-- The strengths `J_n` of the nearest-neighbour coupling. -/
  J : ℕ → ℝ
  /-- The scales `L_n`. -/
  L : ℕ → ℕ
  /-- The volumes `R_{n,k}`. -/
  R : ℕ → ℕ → ℕ
  /-- Every single-site measure lies in the class. -/
  mem : ∀ n, ρ n ∈ 𝒞
  /-- The couplings are ferromagnetic. -/
  nonneg : ∀ n, 0 ≤ J n
  /-- The scales are at least one. -/
  one_le : ∀ n, 1 ≤ L n
  /-- The scales tend to infinity. -/
  tendsto_L : Tendsto L atTop atTop
  /-- Every volume contains the block of its scale. -/
  le_R : ∀ n k, L n ≤ R n k
  /-- For each scale the volumes tend to infinity. -/
  tendsto_R : ∀ n, Tendsto (R n) atTop atTop
  /-- Every box Gibbs measure is a probability measure. -/
  isProbabilityMeasure :
    ∀ n k, IsProbabilityMeasure (boxGibbs d (fun e ↦ J n * nnCoupling d e) (ρ n) (R n k))
  /-- Every coordinate is square integrable under every box Gibbs measure. -/
  integrable_sq : ∀ n k (x : Fin d → ℤ), Integrable (fun ω : (Fin d → ℤ) → ℝ ↦ ω x ^ 2)
    (boxGibbs d (fun e ↦ J n * nnCoupling d e) (ρ n) (R n k))

namespace ReachabilityScheme

variable {d : ℕ} {𝒞 : Set (Measure ℝ)}

/-- **7.2.** The law at `(n, k)` of the rescaled lattice fields `(T^{n,k}_{f_i})_i`, normalised by
the block second moment `Σ^{(R_{n,k})}_{L_n}` (README §7.2). -/
def fieldLaw (S : ReachabilityScheme d 𝒞) (n k : ℕ) {ι : Type*}
    (f : ι → C_c(EuclideanSpace ℝ (Fin d), ℝ)) : Measure (ι → ℝ) :=
  (boxGibbs d (fun e ↦ S.J n * nnCoupling d e) (S.ρ n) (S.R n k)).map fun ω i ↦
    rescaledField (S.L n) (S.R n k)
      (blockSecondMoment d (fun e ↦ S.J n * nnCoupling d e) (S.ρ n) (S.L n) (S.R n k)) (f i) ω

/-- **7.2.** `ν` is the double limit of the scheme along the finite family `f`: for each `n` the
laws `fieldLaw n k f` converge weakly as `k → ∞` to a probability measure `ν_n`, and `ν_n`
converges weakly to `ν` (volume first, then scale; README §7.2). -/
def HasLimitLaw (S : ReachabilityScheme d 𝒞) {ι : Type*} [Fintype ι]
    (f : ι → C_c(EuclideanSpace ℝ (Fin d), ℝ)) (ν : Measure (ι → ℝ)) : Prop :=
  ∃ νn : ℕ → Measure (ι → ℝ), (∀ n, IsProbabilityMeasure (νn n)) ∧
    (∀ (n : ℕ) (g : (ι → ℝ) →ᵇ ℝ),
      Tendsto (fun k ↦ ∫ v, g v ∂S.fieldLaw n k f) atTop (𝓝 (∫ v, g v ∂νn n))) ∧
    ∀ g : (ι → ℝ) →ᵇ ℝ, Tendsto (fun n ↦ ∫ v, g v ∂νn n) atTop (𝓝 (∫ v, g v ∂ν))

/-- **7.2.** The scheme converges: every finite family of test functions has a double limit law
(README §7.2). -/
def Converges (S : ReachabilityScheme d 𝒞) : Prop :=
  ∀ F : Finset C_c(EuclideanSpace ℝ (Fin d), ℝ), ∃ ν : Measure (F → ℝ),
    S.HasLimitLaw (fun f : F ↦ f.1) ν

end ReachabilityScheme

/-- **7.3, structure of reachable fields.** A convergent reachability scheme has a reachable random
field: a probability measure on `ℝ^{C_c(ℝ^d)}` (product σ-algebra) whose coordinate process is a
random field and whose finite-dimensional marginals are the double limits of the scheme
(Aizenman–Duminil-Copin, the paragraph after Definition 1.1 and footnote 2). It is symmetric under
`Φ ↦ −Φ` when every member of `𝒞` is even, invariant under every linear isometry of `ℝ^d`
preserving `ℤ^d` (the hyperoctahedral group `W_d`) acting on test functions, and `E[T_f²]` is at
most `liminf_n liminf_k ⟨(T^{n,k}_f)²⟩` (stated in this form by the roadmap: the box Gibbs
measures have these symmetries, and the second moment is lower semicontinuous under weak
convergence; compare Sokal, Lemma 2.2, for φ⁴ lattice measures along a subsequence; README §7.3). -/
theorem exists_reachableField {d : ℕ} {𝒞 : Set (Measure ℝ)} (S : ReachabilityScheme d 𝒞)
    (hS : S.Converges) :
    ∃ μ : Measure (C_c(EuclideanSpace ℝ (Fin d), ℝ) → ℝ), IsProbabilityMeasure μ ∧
      IsRandomField d (fun f ω ↦ ω f) μ ∧
      (∀ (F : Finset C_c(EuclideanSpace ℝ (Fin d), ℝ)) (ν : Measure (F → ℝ)),
        S.HasLimitLaw (fun f : F ↦ f.1) ν → μ.map (fun ω (f : F) ↦ ω f.1) = ν) ∧
      ((∀ ρ ∈ 𝒞, ρ.IsNegInvariant) → μ.map (fun ω ↦ -ω) = μ) ∧
      (∀ g : EuclideanSpace ℝ (Fin d) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin d),
        (∀ x : Fin d → ℤ, ∃ y : Fin d → ℤ, g (latticePoint 1 x) = latticePoint 1 y) →
          μ.map (fun ω f ↦ ω (f.comp g.toHomeomorph.toCocompactMap)) = μ) ∧
      ∀ f : C_c(EuclideanSpace ℝ (Fin d), ℝ),
        ∫⁻ ω, ENNReal.ofReal (ω f ^ 2) ∂μ ≤
          liminf (fun n ↦ liminf (fun k ↦
            ∫⁻ v, ENNReal.ofReal (v () ^ 2) ∂S.fieldLaw n k (fun _ : Unit ↦ f)) atTop) atTop := by
  sorry

/-- **7.4.** The Gaussian-free-field covariance
`C_m(f, g) = ∫ conj (𝓕f(ξ)) 𝓕g(ξ) / (4π²|ξ|² + m²) dξ`, with Mathlib's Fourier transform
`𝓕` (kernel `e^{−2πi⟨x,ξ⟩}`); the integral is real for real `f`, `g` (README §7.4). -/
def gffCovariance (d : ℕ) (m : ℝ) (f g : EuclideanSpace ℝ (Fin d) → ℝ) : ℝ :=
  (∫ ξ, starRingEnd ℂ (𝓕 (fun x ↦ (f x : ℂ)) ξ) * 𝓕 (fun x ↦ (g x : ℂ)) ξ /
    ((4 * Real.pi ^ 2 * ‖ξ‖ ^ 2 + m ^ 2 : ℝ) : ℂ)).re

/-- **7.4, reachability of the Gaussian free field.** For `m > 0` in every dimension, and for
`m = 0` in dimension `d ≥ 3`: take the nearest-neighbour coupling of strength `1`, the Gaussian
single-site measures of variance `1 / (2d + m²/L_n²)` (that is, `b_n = −(d + m²/(2L_n²))`), any
scales `L_n → ∞` and any volumes `R_{n,k} ≥ L_n` with `R_{n,k} → ∞` as `k → ∞`. For every finite
family `(f_i)` of test functions the laws of the rescaled fields `(T^{n,k}_{f_i})_i`, normalised by
the block second moment, converge as `k → ∞` and then as `n → ∞` to the centred Gaussian law with
covariance `C_m(f_i, f_j) / C_m(1_Q, 1_Q)`, `Q = [−1, 1]^d`; the statement in this form is the
roadmap's (Fröhlich, the paragraph after (33), for the free lattice field; README §7.4). -/
theorem gff_reachable (d : ℕ) (m : ℝ) (hm : 0 < m ∨ (m = 0 ∧ 3 ≤ d)) (L : ℕ → ℕ)
    (hL1 : ∀ n, 1 ≤ L n) (hL : Tendsto L atTop atTop) (R : ℕ → ℕ → ℕ)
    (hRL : ∀ n k, L n ≤ R n k) (hR : ∀ n, Tendsto (R n) atTop atTop) {ι : Type*} [Fintype ι]
    [DecidableEq ι]
    (f : ι → C_c(EuclideanSpace ℝ (Fin d), ℝ)) :
    ∃ ν : ℕ → Measure (EuclideanSpace ℝ ι), (∀ n, IsProbabilityMeasure (ν n)) ∧
      (∀ (n : ℕ) (g : EuclideanSpace ℝ ι →ᵇ ℝ),
        Tendsto (fun k ↦ ∫ ω, g (WithLp.toLp 2 fun i ↦
            rescaledField (L n) (R n k)
              (blockSecondMoment d (nnCoupling d)
                (gaussianReal 0 (Real.toNNReal (2 * d + m ^ 2 / (L n : ℝ) ^ 2)⁻¹)) (L n) (R n k))
              (f i) ω)
            ∂boxGibbs d (nnCoupling d)
              (gaussianReal 0 (Real.toNNReal (2 * d + m ^ 2 / (L n : ℝ) ^ 2)⁻¹)) (R n k))
          atTop (𝓝 (∫ v, g v ∂ν n))) ∧
      ∀ g : EuclideanSpace ℝ ι →ᵇ ℝ,
        Tendsto (fun n ↦ ∫ v, g v ∂ν n) atTop
          (𝓝 (∫ v, g v ∂multivariateGaussian 0 (Matrix.of fun i j ↦
            gffCovariance d m (f i) (f j) /
              gffCovariance d m ({x | ∀ i, |x i| ≤ 1}.indicator 1)
                ({x | ∀ i, |x i| ≤ 1}.indicator 1)))) := by
  sorry

end TauCetiRoadmap.ConstructiveFieldTheoryPhi4
