import Mathlib
import TauCeti.RingTheory.MvPolynomial.ToricIdeal.Basic
import TauCeti.RingTheory.MvPolynomial.Groebner.NormalForm
import TauCeti.RingTheory.MvPolynomial.Groebner.Reduced

/-!
# Toric ideals and Markov bases: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, each with `sorry`, the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, with the definitions those
statements need, all with real bodies. Every headline theorem of the README is statable at the
pins and is stated here.

The toric ideal of an integer matrix `A` is Tau Ceti's `TauCeti.toricIdeal` of the family of
columns of `A`, the kernel of `X j ↦ χ^(A e_j)`; its binomial generation
(`TauCeti.toricIdeal_eq_span`), Gröbner bases, standard monomials, normal forms and reduced
bases are Tau Ceti library and are not restated. Three definitions are copied verbatim, each
marked: the fibre `Fibre` from TensorProductCombinatorics §1.5, and the Metropolis–Hastings kernel
`mhKernel` with its acceptance probability `mhAcceptance` from LangevinAndHamiltonianMonteCarlo
1.1–1.2.
Irreducibility is Mathlib's `ProbabilityTheory.Kernel.IsIrreducible` for the counting measure.
-/

noncomputable section

open MeasureTheory ProbabilityTheory MvPolynomial Matrix
open scoped ENNReal

namespace TauCetiRoadmap.ToricIdealsAndMarkovBases

/-! ## Layer 1: Markov bases and the fibre chain -/

section ChamberCountingCopy

variable {r : ℕ} {ι : Type*} [Fintype ι]

/-- 1.1 The nonnegative integer solutions of `A c = b` (copied verbatim from
TensorProductCombinatorics §1.5). -/
abbrev Fibre (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℤ) :=
  {c : ι → ℕ // ∀ i, ∑ j, A i j * (c j : ℤ) = b i}

end ChamberCountingCopy

variable {r : ℕ} {ι : Type*} [Fintype ι]

/-- 1.1 `y` is obtained from `x` by adding or subtracting one vector of `M`. -/
def IsMoveStep (M : Set (ι → ℤ)) (x y : ι → ℕ) : Prop :=
  ∃ m ∈ M, (∀ j, (y j : ℤ) = x j + m j) ∨ ∀ j, (x j : ℤ) = y j + m j

/-- 1.1 A Markov basis of `A`: any two points of a fibre `F(b)` are joined by a sequence of
points of `F(b)`, each obtained from the previous one by adding or subtracting a vector of `M`.
-/
def IsMarkovBasis (A : Matrix (Fin r) ι ℤ) (M : Set (ι → ℤ)) : Prop :=
  ∀ (b : Fin r → ℤ) (x y : Fibre A b),
    Relation.ReflTransGen (fun u v : Fibre A b => IsMoveStep M u.1 v.1) x y

/-- 1.1 The binomial `X^(m⁺) − X^(m⁻)` of an integer vector `m`, where `m⁺` and `m⁻` are the
positive and negative parts of `m`. -/
def moveBinomial (R : Type*) [CommRing R] (m : ι → ℤ) : MvPolynomial ι R :=
  monomial (Finsupp.equivFunOnFinite.symm fun j => (m j).toNat) 1 -
    monomial (Finsupp.equivFunOnFinite.symm fun j => (-m j).toNat) 1

/-- 1.1 The fundamental theorem of Markov bases (Diaconis–Sturmfels): over any nontrivial
commutative ring, a set `M` of integer kernel vectors of `A` is a Markov basis exactly when its
binomials generate the toric ideal of the columns of `A`. -/
theorem isMarkovBasis_iff_span_eq_toricIdeal (R : Type*) [CommRing R] [Nontrivial R]
    (A : Matrix (Fin r) ι ℤ) (M : Set (ι → ℤ)) (hM : ∀ m ∈ M, A *ᵥ m = 0) :
    IsMarkovBasis A M ↔
      Ideal.span (moveBinomial R '' M) = TauCeti.toricIdeal R (fun j i => A i j) := by
  sorry

section MetropolisHastingsCopy

open Set

variable {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]

/-- 1.2 The Metropolis–Hastings kernel with proposal `Q` and acceptance function `a` (copied
verbatim from LangevinAndHamiltonianMonteCarlo 1.1). -/
def mhKernel (Q : Kernel X X) [IsSFiniteKernel Q] (a : X → X → ℝ≥0∞) : Kernel X X :=
  Q.withDensity a +
    (Kernel.id : Kernel X X).withDensity fun x _ ↦ 1 - Q.withDensity a x univ

/-- 1.2 The Metropolis–Hastings acceptance probability for a target density `p` and a proposal
density `q` (copied verbatim from LangevinAndHamiltonianMonteCarlo 1.2). -/
def mhAcceptance (p : X → ℝ≥0∞) (q : X → X → ℝ≥0∞) (x y : X) : ℝ≥0∞ :=
  min 1 (p y * q y x / (p x * q x y))

end MetropolisHastingsCopy

/-- 1.2 The point `x + v` of the fibre if it lies in the fibre, and `x` otherwise. -/
def fibreStep {A : Matrix (Fin r) ι ℤ} {b : Fin r → ℤ} (x : Fibre A b) (v : ι → ℤ) :
    Fibre A b := by
  classical
  exact if h : ∃ y : Fibre A b, ∀ j, (y.1 j : ℤ) = x.1 j + v j then h.choose else x

/-- 1.2 The proposal of the fibre chain: from `x`, choose a vector of `M` and a sign uniformly at
random, and move to `x ± m` if this point lies in the fibre, staying at `x` otherwise. -/
def fibreProposal (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℤ) (M : Finset (ι → ℤ)) :
    Kernel (Fibre A b) (Fibre A b) :=
  Kernel.ofFunOfCountable fun x =>
    ∑ s ∈ M ×ˢ (Finset.univ : Finset Bool),
      ((M ×ˢ (Finset.univ : Finset Bool)).card : ℝ≥0∞)⁻¹ •
        Measure.dirac (fibreStep x (if s.2 then s.1 else -s.1))

/-- 1.2 The proposal kernel has total mass at most one. -/
instance (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℤ) (M : Finset (ι → ℤ)) :
    IsFiniteKernel (fibreProposal A b M) := by
  refine ⟨⟨1, ENNReal.one_lt_top, fun x => ?_⟩⟩
  simp [fibreProposal, Kernel.ofFunOfCountable]

/-- 1.2 The fibre chain of Diaconis and Sturmfels: the Metropolis–Hastings kernel on the fibre
`F(b)` with proposal `fibreProposal A b M` and target weights `p`. -/
def fibreChain (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℤ) (M : Finset (ι → ℤ))
    (p : Fibre A b → ℝ≥0∞) : Kernel (Fibre A b) (Fibre A b) :=
  mhKernel (fibreProposal A b M) (mhAcceptance p fun x y => fibreProposal A b M x {y})

/-- 1.2 The fibre chain: for a finite set `M` of moves joining the points of a finite nonempty
fibre and positive finite weights `p`, the fibre chain is a Markov kernel, it is irreducible, it
is reversible for the measure with weights `p`, and it has exactly one invariant probability. -/
theorem fibreChain_isIrreducible (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℤ)
    [Finite (Fibre A b)] [Nonempty (Fibre A b)] (M : Finset (ι → ℤ))
    (hconn : ∀ x y : Fibre A b,
      Relation.ReflTransGen (fun u v : Fibre A b => IsMoveStep (M : Set (ι → ℤ)) u.1 v.1) x y)
    (p : Fibre A b → ℝ≥0∞) (hp0 : ∀ x, p x ≠ 0) (hptop : ∀ x, p x ≠ ∞) :
    IsMarkovKernel (fibreChain A b M p) ∧
      Kernel.IsIrreducible Measure.count (fibreChain A b M p) ∧
      (fibreChain A b M p).IsReversible (Measure.count.withDensity p) ∧
      ∃! π : Measure (Fibre A b), IsProbabilityMeasure π ∧ (fibreChain A b M p).Invariant π := by
  sorry

/-! ## Layer 2: standard monomials and integer programming -/

/-- 2.1 For a monomial order `m` and a nontrivial commutative ring, an exponent `u` is a standard
monomial of the toric ideal of `A` exactly when it is the `m`-least point of its fibre. -/
theorem mem_standardMonomials_toricIdeal_iff (R : Type*) [CommRing R] [Nontrivial R]
    (A : Matrix (Fin r) ι ℤ) (m : MonomialOrder ι) (u : ι →₀ ℕ) :
    u ∈ m.standardMonomials (TauCeti.toricIdeal R (fun j i => A i j)) ↔
      ∀ v : ι →₀ ℕ, Finsupp.linearCombination ℕ (fun j i => A i j) v =
          Finsupp.linearCombination ℕ (fun j i => A i j) u → m.toSyn u ≤ m.toSyn v := by
  sorry

/-- 2.2 Conti–Traverso: if the monomial order `m` refines the cost `c`, the normal form of `X^u`
modulo the toric ideal, for any Gröbner basis with unit leading coefficients, is a monomial
`X^w` with `w` in the fibre of `u`, `m`-least there, and of least cost in that fibre. -/
theorem normalForm_monomial_eq (R : Type*) [CommRing R] [Nontrivial R]
    (A : Matrix (Fin r) ι ℤ) (m : MonomialOrder ι) (c : ι → ℝ)
    (hc : ∀ u v : ι →₀ ℕ, ∑ j, c j * (u j : ℝ) < ∑ j, c j * (v j : ℝ) → m.toSyn u < m.toSyn v)
    {G : Set (MvPolynomial ι R)}
    (h : m.IsGroebnerBasis G (TauCeti.toricIdeal R (fun j i => A i j)))
    (hG : ∀ g ∈ G, g ≠ 0 → IsUnit (m.leadingCoeff g)) (u : ι →₀ ℕ) :
    ∃ w : ι →₀ ℕ, h.normalForm hG (monomial u 1) = monomial w 1 ∧
      Finsupp.linearCombination ℕ (fun j i => A i j) w =
        Finsupp.linearCombination ℕ (fun j i => A i j) u ∧
      ∀ v : ι →₀ ℕ, Finsupp.linearCombination ℕ (fun j i => A i j) v =
          Finsupp.linearCombination ℕ (fun j i => A i j) u →
        m.toSyn w ≤ m.toSyn v ∧ ∑ j, c j * (w j : ℝ) ≤ ∑ j, c j * (v j : ℝ) := by
  sorry

/-! ## Layer 3: Graver bases, circuits and test sets -/

/-- 3.1 `h` is conformal to `g`: in every coordinate `h` has the sign of `g` and at most its
absolute value. -/
def IsConformal (h g : ι → ℤ) : Prop :=
  ∀ j, 0 ≤ h j * g j ∧ |h j| ≤ |g j|

/-- 3.1 The Graver basis of `A`: the nonzero integer kernel vectors that are minimal for the
conformal order. -/
def graverBasis (A : Matrix (Fin r) ι ℤ) : Set (ι → ℤ) :=
  {g | A *ᵥ g = 0 ∧ g ≠ 0 ∧ ∀ h, A *ᵥ h = 0 → h ≠ 0 → IsConformal h g → h = g}

/-- 3.1 The circuits of `A`: the nonzero integer kernel vectors of minimal support whose entries
have no common divisor other than a unit. -/
def circuits (A : Matrix (Fin r) ι ℤ) : Set (ι → ℤ) :=
  {c | A *ᵥ c = 0 ∧ c ≠ 0 ∧
    (∀ h, A *ᵥ h = 0 → h ≠ 0 → (∀ j, c j = 0 → h j = 0) → ∀ j, h j = 0 → c j = 0) ∧
    ∀ d : ℤ, (∀ j, d ∣ c j) → IsUnit d}

/-- 3.1 The Graver basis is finite (Gordan–Dickson). -/
theorem graverBasis_finite (A : Matrix (Fin r) ι ℤ) : (graverBasis A).Finite := by
  sorry

/-- 3.2 Every element of the reduced Gröbner basis of the toric ideal, for any monomial order,
is the binomial of a Graver basis element `v`, with leading exponent the positive part of `v`. -/
theorem exists_mem_graverBasis_of_isReducedGroebnerBasis (k : Type*) [Field k]
    (A : Matrix (Fin r) ι ℤ) (m : MonomialOrder ι) {G : Set (MvPolynomial ι k)}
    (hG : m.IsReducedGroebnerBasis G (TauCeti.toricIdeal k (fun j i => A i j))) :
    ∀ g ∈ G, ∃ v ∈ graverBasis A, g = moveBinomial k v ∧
      m.degree g = Finsupp.equivFunOnFinite.symm fun j => (v j).toNat := by
  sorry

/-- 3.3 For every circuit `c` there is a monomial order whose reduced Gröbner basis of the toric
ideal contains the binomial of `c` or of `-c`. -/
theorem exists_isReducedGroebnerBasis_of_mem_circuits (k : Type*) [Field k]
    (A : Matrix (Fin r) ι ℤ) {c : ι → ℤ} (hc : c ∈ circuits A) :
    ∃ (m : MonomialOrder ι) (G : Set (MvPolynomial ι k)),
      m.IsReducedGroebnerBasis G (TauCeti.toricIdeal k (fun j i => A i j)) ∧
        (moveBinomial k c ∈ G ∨ moveBinomial k (-c) ∈ G) := by
  sorry

/-- 3.4 Let `d` be the real rank of `A` and `ρ` a choice of `d` rows. If every `d × d` minor of
these rows lies in `{0, δ, −δ}` for one integer `δ`, and some such minor is nonzero, then the
Graver basis is the set of circuits. -/
theorem graverBasis_eq_circuits (A : Matrix (Fin r) ι ℤ) {d : ℕ}
    (hrank : (A.map ((↑) : ℤ → ℝ)).rank = d) (ρ : Fin d → Fin r) (δ : ℤ)
    (hdet : ∀ e : Fin d → ι, (A.submatrix ρ e).det ∈ ({0, δ, -δ} : Set ℤ))
    (hne : ∃ e : Fin d → ι, (A.submatrix ρ e).det ≠ 0) :
    graverBasis A = circuits A := by
  sorry

/-- 3.5 A test set for the integer programs `min c·v` over `{v : A v = A u, 0 ≤ v ≤ a}`: whenever
a feasible `u` is not optimal, some kernel vector `t ∈ T` with `t ≤ u`, `-t ≤ a - u` and
`c·t > 0` improves it to the feasible point `u - t`. -/
def IsTestSet (A : Matrix (Fin r) ι ℤ) (T : Set (ι → ℤ)) : Prop :=
  ∀ (a : ι → ℕ) (c : ι → ℝ) (u : ι → ℕ), u ≤ a →
    (∃ v : ι → ℕ, v ≤ a ∧ A *ᵥ (fun j => (v j : ℤ)) = A *ᵥ (fun j => (u j : ℤ)) ∧
      ∑ j, c j * (v j : ℝ) < ∑ j, c j * (u j : ℝ)) →
    ∃ t ∈ T, A *ᵥ t = 0 ∧ (∀ j, t j ≤ u j ∧ -t j ≤ (a j : ℤ) - u j) ∧
      0 < ∑ j, c j * (t j : ℝ)

/-- 3.5 The Graver basis is the least test set for the bounded integer programs of `A`. -/
theorem isLeast_graverBasis (A : Matrix (Fin r) ι ℤ) :
    IsLeast {T | IsTestSet A T} (graverBasis A) := by
  sorry

end TauCetiRoadmap.ToricIdealsAndMarkovBases
