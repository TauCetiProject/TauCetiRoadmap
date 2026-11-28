module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.Gram.Hadamard
public import TauCeti.LinearAlgebra.Matrix.Divisibility
public import TauCeti.Analysis.OperatorIdeal.Nuclear.Basic
public import TauCeti.Analysis.Bochner.BochnerTheorem

/-!
# Determinantal point processes: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). A point process is a measurable map `N : Ω → PointMeasure S`
into the point measures of SpatialPointProcessFoundations (§1.1), on a locally compact Polish
space `S` with a σ-finite reference measure `μ`. A kernel is a function `K : S → S → ℂ`;
`kernelMatrix K x` is the matrix `[K (x i) (x j)]`. `IsDeterminantal P N K μ` says that the
factorial moments of the counts on pairwise disjoint bounded windows are the integrals of
`det [K (xᵢ, xⱼ)]` against the product measure; this is the count form of "the correlation
functions are `det [K (xᵢ, xⱼ)]` with respect to `μ`", and `isDeterminantal_iff_isProductDensity`
identifies it with the product densities of SpatialPointProcessFoundations §4.2. Bounded windows
are measurable sets with compact closure. The order on `ℂ` is `ComplexOrder`, so `0 ≤ z` says
that `z` is a nonnegative real number. Fourier transforms are Mathlib's `𝓕`, with kernel
`exp (-2πi ⟪x, ξ⟫)`.

Local copies. `IsIntegerValued`, `IsPoissonRandomMeasure` and `expNeg` are verbatim copies of the
definitions of SpatialPointProcessFoundations §§1.1, 5.1 and 6.2, which copies them, with their
bodies, from the Tau Ceti library at commit `d395922` (its reference [TC]); the pinned Tau Ceti
does not contain them. `LocallyFiniteMeasure`, `PointMeasure`
with its coercions, vague topology and Borel structure, `PointMeasure.count`,
`PointMeasure.IsSimple`, `PointMeasure.restrict`, `intensity`, `IsReducedPalmKernel`,
`factorialMeasure`, `factorialMomentMeasure`, `IsProductDensity`, `factorialCountMoment`,
`IsPoissonPointProcess`, `markExponent`, `IsMarking`, `E`, the translation action on
`PointMeasure` with its supporting lemma and `IsStationary` are verbatim copies of the
definitions of SpatialPointProcessFoundations, each with a docstring naming its section.
`maternCorrelation`, `maternSpectralDensity` and `positiveAxisBesselK` are verbatim copies from
SecondOrderRandomFields (§4.1 and its copy of AnalyticNumberTheoryPartI §2.1a).

Bold headlines of the README not stated here, each for the reason given: the pair correlation
function (2.2), which is `pairCorrelation_determinantal` read through the case `n = 2` of the
definition; the bridge from continuous kernels to RandomMatrices 8.3 (3.3), whose accepted
kernels and joint count laws are that roadmap's definitions, not copied here; the central limit
theorem for counts (4.2), which is RandomMatrices 8.3's theorem for Bernoulli sums; the Janossy
densities (4.3), whose kernel `K (I - K)⁻¹` is defined through the window operator; and the
global form of the Macchi–Soshnikov theorem (5.1), which concerns the operator on all of `L²(μ)`.

Four declarations are supporting steps proved here, not targets: `det_kernelMatrix_eq_zero`,
`det_kernelMatrix_gauge`, `posSemidef_kernelMatrix` and the copied
`map_sub_add_eq_map_map_sub`.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology Function ComplexConjugate
open FourierTransform
open scoped ENNReal NNReal CompactlySupported ComplexOrder Real

attribute [local instance] Classical.propDecidable

/-! ## Local copies of SpatialPointProcessFoundations -/

namespace TauCetiRoadmap.DeterminantalPointProcesses

section TauCetiCopies

variable {Ω X : Type*} [MeasurableSpace Ω] [MeasurableSpace X]

/-- Local copy of SpatialPointProcessFoundations §1.1 (there a copy of
`MeasureTheory.Measure.IsIntegerValued` of the Tau Ceti library at commit `d395922`): a measure
is integer-valued if every measurable set of finite mass has natural-number mass. Sets of
infinite mass are allowed, and multiplicities need not be at most one. -/
def IsIntegerValued (μ : Measure X) : Prop :=
  ∀ ⦃A : Set X⦄, MeasurableSet A → μ A < ∞ → ∃ n : ℕ, μ A = n

/-- Local copy of SpatialPointProcessFoundations §5.1 (there a copy of
`TauCeti.Probability.IsPoissonRandomMeasure` of the Tau Ceti library at commit `d395922`): a
measurable random measure with independent Poisson counts on disjoint measurable sets of finite
intensity and almost surely infinite counts on measurable sets of infinite intensity. No topology
or simplicity assumption is imposed. -/
def IsPoissonRandomMeasure (P : Measure Ω) (N : Ω → Measure X) (Λ : Measure X) : Prop :=
  Measurable N ∧
    (∀ (n : ℕ) (A : Fin n → Set X), (∀ i, MeasurableSet (A i) ∧ Λ (A i) < ∞) →
      Pairwise (Disjoint on A) →
        iIndepFun (fun i ω => N ω (A i)) P ∧
          ∀ i, HasLaw (fun ω => N ω (A i))
            ((poissonMeasure (Λ (A i)).toNNReal).map (Nat.cast : ℕ → ℝ≥0∞)) P)
    ∧ ∀ A, MeasurableSet A → Λ A = ∞ → ∀ᵐ ω ∂P, N ω A = ∞

/-- Local copy of SpatialPointProcessFoundations §6.2 (there a copy of `expNeg` of the Tau Ceti
library at commit `d395922`): the negative exponential, with value zero at infinity. -/
def expNeg (x : ℝ≥0∞) : ℝ≥0 := (EReal.exp (-x.toEReal)).toNNReal

end TauCetiCopies

/-- Local copy of SpatialPointProcessFoundations §1.1: locally finite measures, finite on compact
sets. -/
def LocallyFiniteMeasure (S : Type*) [TopologicalSpace S] [MeasurableSpace S] :=
  {μ : Measure S // IsFiniteMeasureOnCompacts μ}

/-- Local copy of SpatialPointProcessFoundations §1.1: point measures, the locally finite
integer-valued measures. -/
def PointMeasure (S : Type*) [TopologicalSpace S] [MeasurableSpace S] :=
  {μ : Measure S // IsFiniteMeasureOnCompacts μ ∧ IsIntegerValued μ}

section Configuration

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- Local copy of SpatialPointProcessFoundations §1.1. -/
instance : CoeOut (LocallyFiniteMeasure S) (Measure S) := ⟨Subtype.val⟩
/-- Local copy of SpatialPointProcessFoundations §1.1. -/
instance : CoeOut (PointMeasure S) (Measure S) := ⟨Subtype.val⟩

/-- Supporting instance: a point measure is finite on compact sets. -/
instance (ξ : PointMeasure S) : IsFiniteMeasureOnCompacts (ξ : Measure S) := ξ.2.1

/-- Local copy of SpatialPointProcessFoundations §1.1: a point measure as a locally finite
measure. -/
def PointMeasure.toLocallyFinite (ξ : PointMeasure S) : LocallyFiniteMeasure S := ⟨ξ.1, ξ.2.1⟩

/-- Local copy of SpatialPointProcessFoundations §1.2: the vague topology, the coarsest one
making `μ ↦ ∫ f dμ` continuous for every compactly supported continuous `f`. -/
instance : TopologicalSpace (LocallyFiniteMeasure S) :=
  ⨅ f : C_c(S, ℝ), TopologicalSpace.induced
    (fun μ : LocallyFiniteMeasure S => ∫ x, f x ∂(μ : Measure S)) inferInstance

/-- Local copy of SpatialPointProcessFoundations §1.2: point measures carry the subspace
topology. -/
instance : TopologicalSpace (PointMeasure S) :=
  TopologicalSpace.induced PointMeasure.toLocallyFinite inferInstance

/-- Local copy of SpatialPointProcessFoundations §1.2: the Borel structure on point measures. -/
instance : MeasurableSpace (PointMeasure S) := borel _
instance : BorelSpace (PointMeasure S) := ⟨rfl⟩

/-- Local copy of SpatialPointProcessFoundations §1.1: the count of a point measure on a set, in
`ℕ∞`. -/
def PointMeasure.count (ξ : PointMeasure S) (A : Set S) : ℕ∞ :=
  if (ξ : Measure S) A = ∞ then ⊤ else (⌊((ξ : Measure S) A).toNNReal⌋₊ : ℕ∞)

/-- Local copy of SpatialPointProcessFoundations §1.1: a point measure is simple when no point has
multiplicity larger than one. -/
def PointMeasure.IsSimple (ξ : PointMeasure S) : Prop := ∀ x, (ξ : Measure S) {x} ≤ 1

/-- Local copy of SpatialPointProcessFoundations §1.3: the restriction of a point measure to a
measurable set. -/
def PointMeasure.restrict (ξ : PointMeasure S) {A : Set S} (hA : MeasurableSet A) :
    PointMeasure S :=
  ⟨(ξ : Measure S).restrict A,
    by
      have : IsFiniteMeasureOnCompacts (ξ : Measure S) := ξ.2.1
      infer_instance,
    fun B hB hfin => by
      rw [Measure.restrict_apply hB] at hfin ⊢
      exact ξ.2.2 (hB.inter hA) hfin⟩

end Configuration

section Laws

variable {Ω X : Type*} [MeasurableSpace Ω] [MeasurableSpace X]

/-- Local copy of SpatialPointProcessFoundations §2.1: the intensity measure of a random measure,
`B ↦ 𝔼 N(B)`, as a mixture. -/
def intensity (P : Measure Ω) (N : Ω → Measure X) : Measure X :=
  P.bind N

/-- Local copy of SpatialPointProcessFoundations §3.2: `κ` is a reduced Palm kernel of `N`: the
Campbell–Little–Mecke formula holds with the point `x` removed from `N`. -/
def IsReducedPalmKernel (P : Measure Ω) (N : Ω → Measure X) (κ : Kernel X (Measure X)) :
    Prop :=
  IsMarkovKernel κ ∧
    ∀ g : X → Measure X → ℝ≥0∞, Measurable (uncurry g) →
      ∫⁻ ω, ∫⁻ x, g x (N ω - Measure.dirac x) ∂N ω ∂P =
        ∫⁻ x, ∫⁻ μ, g x μ ∂κ x ∂intensity P N

/-- Local copy of SpatialPointProcessFoundations §4.1: the factorial powers of a measure, by the
recursion `μ⁽ⁿ⁺¹⁾ = (μ⁽ⁿ⁾ ⊗ μ) ∘ snoc⁻¹ - ∑ⱼ μ⁽ⁿ⁾ ∘ (x ↦ snoc x xⱼ)⁻¹`, starting from the point
mass on the empty tuple. -/
def factorialMeasure (μ : Measure X) : (n : ℕ) → Measure (Fin n → X)
  | 0 => Measure.dirac finZeroElim
  | n + 1 =>
      ((factorialMeasure μ n).prod μ).map (fun p => Fin.snoc (α := fun _ => X) p.1 p.2) -
        ∑ j : Fin n, (factorialMeasure μ n).map (fun x => Fin.snoc (α := fun _ => X) x (x j))

/-- Local copy of SpatialPointProcessFoundations §4.2: the `n`th factorial moment measure
`B ↦ 𝔼 N⁽ⁿ⁾(B)`. -/
def factorialMomentMeasure (P : Measure Ω) (N : Ω → Measure X) (n : ℕ) : Measure (Fin n → X) :=
  P.bind fun ω => factorialMeasure (N ω) n

/-- Local copy of SpatialPointProcessFoundations §4.2: `ρ` is an `n`th product density
(correlation function) of `N` with respect to `μ`. -/
def IsProductDensity (P : Measure Ω) (N : Ω → Measure X) (μ : Measure X) (n : ℕ)
    (ρ : (Fin n → X) → ℝ≥0∞) : Prop :=
  Measurable ρ ∧ factorialMomentMeasure P N n = (Measure.pi fun _ : Fin n => μ).withDensity ρ

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- Local copy of SpatialPointProcessFoundations §4.1: the factorial count moment
`∏ⱼ N(Bⱼ)^{(nⱼ)}` of an assignment `c` of `n` indices to windows, `nⱼ` being the number of indices
assigned to `Bⱼ`. -/
def factorialCountMoment (ξ : PointMeasure S) {m n : ℕ} (B : Fin m → Set S) (c : Fin n → Fin m) :
    ℝ≥0∞ :=
  ∏ j, (((ξ.count (B j)).toNat.descFactorial (Finset.univ.filter fun i => c i = j).card : ℕ) :
    ℝ≥0∞)

/-- Local copy of SpatialPointProcessFoundations §5.1: the Poisson property of a point process, on
the point-measure carrier. -/
abbrev IsPoissonPointProcess (P : Measure Ω) (N : Ω → PointMeasure S) (Λ : Measure S) : Prop :=
  IsPoissonRandomMeasure P (fun ω => (N ω : Measure S)) Λ

end Laws

section Markings

variable {Ω X Y : Type*} [MeasurableSpace Ω] [MeasurableSpace X] [MeasurableSpace Y]

/-- Local copy of SpatialPointProcessFoundations §6.2: `-log ∫ e^{-g(x, y)} K(x, dy)`, the
exponent contributed by a point at `x` to the conditional Laplace functional of a `K`-marking. -/
def markExponent (K : Kernel X Y) (g : X × Y → ℝ≥0∞) (x : X) : ℝ≥0∞ :=
  (-ENNReal.log (∫⁻ y, (expNeg (g (x, y)) : ℝ≥0∞) ∂K x)).toENNReal

/-- Local copy of SpatialPointProcessFoundations §6.2: `M` is a `K`-marking of `N`: given `N`,
the marks are independent with laws `K(x, ·)`, expressed through the conditional Laplace
functional `𝔼[e^{-∫ g dM} ; N ∈ C] = 𝔼[∏_{x ∈ N} ∫ e^{-g(x, y)} K(x, dy) ; N ∈ C]`. -/
def IsMarking (P : Measure Ω) (N : Ω → Measure X) (M : Ω → Measure (X × Y)) (K : Kernel X Y) :
    Prop :=
  Measurable N ∧ Measurable M ∧
    ∀ C : Set (Measure X), MeasurableSet C → ∀ g : X × Y → ℝ≥0∞, Measurable g →
      ∫⁻ ω in N ⁻¹' C, (expNeg (∫⁻ z, g z ∂M ω) : ℝ≥0∞) ∂P =
        ∫⁻ ω in N ⁻¹' C, (expNeg (∫⁻ x, markExponent K g x ∂N ω) : ℝ≥0∞) ∂P

end Markings

/-- Local copy of SpatialPointProcessFoundations §7.1: Euclidean space, the carrier of the
stationarity theory. -/
abbrev E (d : ℕ) := EuclideanSpace ℝ (Fin d)

section Translation

variable {Ω : Type*} [MeasurableSpace Ω]
variable {G : Type*} [MetricSpace G] [PolishSpace G] [LocallyCompactSpace G] [MeasurableSpace G]
  [BorelSpace G] [AddGroup G] [IsTopologicalAddGroup G]

omit [PolishSpace G] [LocallyCompactSpace G] in
/-- Local copy of SpatialPointProcessFoundations §7.1 (a supporting step there): translating by
`x + y` is translating by `y`, then by `x`. -/
theorem map_sub_add_eq_map_map_sub (μ : Measure G) (x y : G) :
    μ.map (· - (x + y)) = (μ.map (· - y)).map (· - x) := by
  rw [Measure.map_map (continuous_sub_right x).measurable (continuous_sub_right y).measurable]
  congr 1
  funext z
  simp [Function.comp, sub_eq_add_neg, neg_add_rev, add_assoc]

/-- Local copy of SpatialPointProcessFoundations §7.1: the translation action
`(x +ᵥ ξ) B = ξ (B + x)`, moving a point at `x` to the origin. -/
instance : AddAction G (PointMeasure G) where
  vadd x ξ := ⟨(ξ : Measure G).map (· - x),
    by
      have : IsFiniteMeasureOnCompacts (ξ : Measure G) := ξ.2.1
      exact Measure.IsFiniteMeasureOnCompacts.map (ξ : Measure G) (Homeomorph.subRight x),
    fun A hA hfin => by
      rw [Measure.map_apply (continuous_sub_right x).measurable hA] at hfin ⊢
      exact ξ.2.2 ((continuous_sub_right x).measurable hA) hfin⟩
  zero_vadd ξ := Subtype.ext (show (ξ : Measure G).map (· - 0) = ξ by simp)
  add_vadd x y ξ := Subtype.ext (map_sub_add_eq_map_map_sub (ξ : Measure G) x y)

/-- Local copy of SpatialPointProcessFoundations §7.1: a point process is stationary when its law
is invariant under all translations. -/
def IsStationary (P : Measure Ω) (N : Ω → PointMeasure G) : Prop :=
  VAddInvariantMeasure G (PointMeasure G) (P.map N)

end Translation

/-! ## Layer 1: kernel matrices -/

section KernelMatrices

variable {S : Type*}

/-! ### 1.1 Kernel matrices and positive semidefinite kernels -/

/-- The matrix `[K (x i) (x j)]` of a kernel at a tuple of points. -/
def kernelMatrix {n : ℕ} (K : S → S → ℂ) (x : Fin n → S) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.of fun i j => K (x i) (x j)

/-- A positive semidefinite kernel, `Matrix.PosSemidef K` with `K` read as a matrix indexed by
`S`, has positive semidefinite kernel matrices at every tuple, repeated points allowed. -/
theorem posSemidef_kernelMatrix {K : S → S → ℂ} (hK : Matrix.PosSemidef K) {n : ℕ}
    (x : Fin n → S) : (kernelMatrix K x).PosSemidef :=
  hK.submatrix x

/-- **Hadamard's inequality for kernel matrices** (HKPV (4.2.15), p. 53). -/
theorem det_kernelMatrix_mem_Icc {K : S → S → ℂ} (hK : Matrix.PosSemidef K) {n : ℕ}
    (x : Fin n → S) :
    0 ≤ (kernelMatrix K x).det ∧ (kernelMatrix K x).det ≤ ∏ i, K (x i) (x i) := by
  sorry

/-- A repeated point makes the kernel determinant vanish. -/
theorem det_kernelMatrix_eq_zero (K : S → S → ℂ) {n : ℕ} {x : Fin n → S} {i j : Fin n}
    (hij : i ≠ j) (hx : x i = x j) : (kernelMatrix K x).det = 0 :=
  Matrix.det_zero_of_row_eq hij (by ext k; simp [kernelMatrix, hx])

/-! ### 1.2 Gauge, weights and the pair correlation -/

/-- A gauge change `h x K x y (h y)⁻¹` does not change kernel determinants. -/
theorem det_kernelMatrix_gauge (K : S → S → ℂ) {h : S → ℂ} (hh : ∀ x, h x ≠ 0) {n : ℕ}
    (x : Fin n → S) :
    (kernelMatrix (fun y z => h y * K y z * (h z)⁻¹) x).det = (kernelMatrix K x).det := by
  have hM : kernelMatrix (fun y z => h y * K y z * (h z)⁻¹) x =
      Matrix.diagonal (fun i => h (x i)) * kernelMatrix K x *
        Matrix.diagonal (fun i => (h (x i))⁻¹) := by
    ext i j
    simp [kernelMatrix, Matrix.diagonal_mul, Matrix.mul_diagonal]
  rw [hM, Matrix.det_mul, Matrix.det_mul, Matrix.det_diagonal, Matrix.det_diagonal,
    mul_comm (∏ i, h (x i)), mul_assoc, ← Finset.prod_mul_distrib]
  simp [hh]

/-- **Weighted kernels.** The kernel `√f(x) K(x,y) √f(y)` has determinants
`∏ f (x i) · det [K (x i) (x j)]`. -/
theorem det_kernelMatrix_mul_sqrt (K : S → S → ℂ) (f : S → ℝ≥0) {n : ℕ} (x : Fin n → S) :
    (kernelMatrix (fun y z => (NNReal.sqrt (f y) : ℂ) * K y z * NNReal.sqrt (f z)) x).det =
      (∏ i, (f (x i) : ℂ)) * (kernelMatrix K x).det := by
  sorry

/-- The pair correlation function `1 - |K x y|² / (K x x K y y)` of a kernel. -/
def pairCorrelation (K : S → S → ℂ) (x y : S) : ℝ :=
  1 - ‖K x y‖ ^ 2 / ((K x x).re * (K y y).re)

/-- **The pair correlation of a positive semidefinite kernel** (LMR (2.3), p. 857): the second
kernel determinant is `K x x K y y g(x, y)` with `0 ≤ g ≤ 1`. -/
theorem pairCorrelation_determinantal {K : S → S → ℂ} (hK : Matrix.PosSemidef K) {x y : S}
    (hx : 0 < (K x x).re) (hy : 0 < (K y y).re) :
    (kernelMatrix K ![x, y]).det.re = (K x x).re * (K y y).re * pairCorrelation K x y ∧
      0 ≤ pairCorrelation K x y ∧ pairCorrelation K x y ≤ 1 := by
  sorry

/-! ### 1.3 The Schur complement -/

/-- The reduced kernel `K x y - K x u K u y / K u u` at the point `u`. -/
def reducedKernel (K : S → S → ℂ) (u : S) (x y : S) : ℂ :=
  K x y - K x u * K u y / K u u

/-- **Schur complement of kernel determinants.** -/
theorem det_kernelMatrix_cons (K : S → S → ℂ) {u : S} (hu : K u u ≠ 0) {n : ℕ}
    (x : Fin n → S) :
    (kernelMatrix K (Fin.cons u x : Fin (n + 1) → S)).det =
      K u u * (kernelMatrix (reducedKernel K u) x).det := by
  sorry

/-- **The reduced kernel of a positive semidefinite kernel is positive semidefinite.** -/
theorem posSemidef_reducedKernel {K : S → S → ℂ} (hK : Matrix.PosSemidef K) (u : S) :
    Matrix.PosSemidef (reducedKernel K u) := by
  sorry

/-! ### 1.4 Finite-rank kernels -/

/-- **Cauchy–Binet for finite-rank kernels** (HKPV (4.5.2), p. 65): for
`K = ∑ₖ λₖ φₖ ⊗ conj φₖ`, `n! det [K (xᵢ, xⱼ)] = ∑_f ∏ᵢ λ_{f i} |det [φ_{f j} (xᵢ)]|²` over all
maps `f : Fin n → Fin r`. -/
theorem factorial_mul_det_kernelMatrix_finiteRank {r : ℕ} (lam : Fin r → ℝ)
    (φ : Fin r → S → ℂ) {n : ℕ} (x : Fin n → S) :
    (n.factorial : ℂ) *
        (kernelMatrix (fun y z => ∑ k, (lam k : ℂ) * φ k y * conj (φ k z)) x).det =
      ∑ f : Fin n → Fin r, (∏ i, (lam (f i) : ℂ)) *
        ((‖(Matrix.of fun i j => φ (f j) (x i)).det‖ ^ 2 : ℝ) : ℂ) := by
  sorry

end KernelMatrices

/-! ## Layer 2: determinantal point processes -/

section Determinantal

variable {Ω : Type*} [MeasurableSpace Ω]
variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-! ### 2.1 The definition -/

/-- `N` is determinantal with kernel `K` with respect to `μ`: `K` is measurable, its kernel
determinants are a.e. nonnegative, and the factorial count moments on pairwise disjoint bounded
windows are the integrals of the kernel determinants. -/
def IsDeterminantal (P : Measure Ω) (N : Ω → PointMeasure S) (K : S → S → ℂ) (μ : Measure S)
    [SigmaFinite μ] : Prop :=
  Measurable N ∧ Measurable (uncurry K) ∧
    (∀ n : ℕ, ∀ᵐ x ∂(Measure.pi fun _ : Fin n => μ), 0 ≤ (kernelMatrix K x).det) ∧
    ∀ (m n : ℕ) (B : Fin m → Set S) (c : Fin n → Fin m),
      (∀ j, MeasurableSet (B j) ∧ IsCompact (closure (B j))) → Pairwise (Disjoint on B) →
        ∫⁻ ω, factorialCountMoment (N ω) B c ∂P =
          ∫⁻ x in Set.univ.pi (fun i => B (c i)), ENNReal.ofReal (kernelMatrix K x).det.re
            ∂(Measure.pi fun _ : Fin n => μ)

/-- The diagonal `x ↦ K x x` has finite integral over every bounded window. -/
def IsLocallyIntegrableDiagonal (K : S → S → ℂ) (μ : Measure S) : Prop :=
  ∀ W : Set S, MeasurableSet W → IsCompact (closure W) →
    ∫⁻ x in W, ENNReal.ofReal (K x x).re ∂μ < ∞

/-- The kernel matrices are positive semidefinite at almost every tuple of points. -/
def IsAEPSDKernel (K : S → S → ℂ) (μ : Measure S) [SigmaFinite μ] : Prop :=
  ∀ n : ℕ, ∀ᵐ x ∂(Measure.pi fun _ : Fin n => μ), (kernelMatrix K x).PosSemidef

variable {P : Measure Ω} {N : Ω → PointMeasure S} {K : S → S → ℂ} {μ : Measure S} [SigmaFinite μ]

/-- **Agreement with correlation functions** (HKPV (1.2.3), p. 8): for an a.e. positive
semidefinite kernel with locally integrable diagonal, the count form is the statement that every
`ofReal (det [K (xᵢ, xⱼ)])` is a product density in the sense of SpatialPointProcessFoundations
§4.2. -/
theorem isDeterminantal_iff_isProductDensity (hK : IsAEPSDKernel K μ)
    (hloc : IsLocallyIntegrableDiagonal K μ) :
    IsDeterminantal P N K μ ↔
      Measurable N ∧ Measurable (uncurry K) ∧
        (∀ n : ℕ, ∀ᵐ x ∂(Measure.pi fun _ : Fin n => μ), 0 ≤ (kernelMatrix K x).det) ∧
        ∀ n : ℕ, IsProductDensity P (fun ω => (N ω : Measure S)) μ n
          fun x => ENNReal.ofReal (kernelMatrix K x).det.re := by
  sorry

/-! ### 2.2 First properties -/

/-- **The intensity is `K x x μ(dx)`** (HKPV (1.2.2), p. 8; LMR (2.2), p. 857). -/
theorem intensity_eq_withDensity (h : IsDeterminantal P N K μ) :
    intensity P (fun ω => (N ω : Measure S)) =
      μ.withDensity fun x => ENNReal.ofReal (K x x).re := by
  sorry

/-- **A determinantal point process is simple** (BBK Lemma 5.1.4, p. 228). -/
theorem ae_isSimple [IsProbabilityMeasure P] (h : IsDeterminantal P N K μ) (hK : IsAEPSDKernel K μ)
    (hloc : IsLocallyIntegrableDiagonal K μ) : ∀ᵐ ω ∂P, (N ω).IsSimple := by
  sorry

/-- **Change of reference measure** (HKPV §4.2, observation (4), pp. 48–49, for `f > 0`). -/
theorem isDeterminantal_withDensity_iff {f : S → ℝ≥0} (hf : Measurable f)
    (hK : Measurable (uncurry K)) [SigmaFinite (μ.withDensity fun x => (f x : ℝ≥0∞))] :
    IsDeterminantal P N K (μ.withDensity fun x => (f x : ℝ≥0∞)) ↔
      IsDeterminantal P N (fun x y => (NNReal.sqrt (f x) : ℂ) * K x y * NNReal.sqrt (f y)) μ := by
  sorry

/-- **Gauge invariance**: `det_kernelMatrix_gauge` under the integrals. -/
theorem isDeterminantal_gauge_iff {h : S → ℂ} (hm : Measurable h) (hh : ∀ x, h x ≠ 0) :
    IsDeterminantal P N (fun x y => h x * K x y * (h y)⁻¹) μ ↔ IsDeterminantal P N K μ := by
  sorry

/-- **Indistinguishable kernels define the same processes** (BBK Definition 5.1.8, p. 230,
and Proposition 5.1.11, p. 231): agreement `μ ⊗ μ`-a.e. and on the diagonal `μ`-a.e. -/
theorem isDeterminantal_congr {K' : S → S → ℂ} (hK : Measurable (uncurry K))
    (hK' : Measurable (uncurry K')) (hdiag : ∀ᵐ x ∂μ, K x x = K' x x)
    (hoff : ∀ᵐ p ∂μ.prod μ, K p.1 p.2 = K' p.1 p.2) :
    IsDeterminantal P N K μ ↔ IsDeterminantal P N K' μ := by
  sorry

/-- **Restriction** (HKPV Remark 4.2.5, p. 52; BBK Lemma 5.1.5, p. 229): the restriction to a
measurable set `D` is determinantal with the same kernel with respect to `μ` restricted to `D`. -/
theorem isDeterminantal_restrict (h : IsDeterminantal P N K μ) {D : Set S} (hD : MeasurableSet D) :
    IsDeterminantal P (fun ω => (N ω).restrict hD) K (μ.restrict D) := by
  sorry

/-- **Thinning** (BBK Lemma 5.1.3, p. 228): the retained part of a Bool-valued marking with
retention probability `p x = κ x {true}` has the product densities of the kernel
`√p(x) K(x, y) √p(y)`, so it is determinantal with that kernel in the sense of 2.1. -/
theorem isProductDensity_thinning [IsProbabilityMeasure P] (h : IsDeterminantal P N K μ)
    (hK : IsAEPSDKernel K μ) (hloc : IsLocallyIntegrableDiagonal K μ)
    {M : Ω → Measure (S × Bool)} {κ : Kernel S Bool} [IsMarkovKernel κ]
    (hM : IsMarking P (fun ω => (N ω : Measure S)) M κ) (n : ℕ) :
    IsProductDensity P (fun ω => ((M ω).restrict (univ ×ˢ {true})).map Prod.fst) μ n
      fun x => ENNReal.ofReal (kernelMatrix (fun y z =>
        (NNReal.sqrt (κ y {true}).toNNReal : ℂ) * K y z * NNReal.sqrt (κ z {true}).toNNReal)
        x).det.re := by
  sorry

/-- **The Poisson process is determinantal** (BBK Example 5.1.6, pp. 229–230): for diffuse
locally finite `μ`, with kernel `1{x = y}`. -/
theorem isDeterminantal_poisson_iff [IsProbabilityMeasure P] [NullSingletonClass μ]
    [IsFiniteMeasureOnCompacts μ] :
    IsDeterminantal P N (fun x y => if x = y then 1 else 0) μ ↔ IsPoissonPointProcess P N μ := by
  sorry

/-! ### 2.4 Moments and uniqueness -/

/-- **Domination by the Poisson moments** (BBK Proposition 5.1.20(ii), p. 235, and
Corollary 5.1.21, p. 236). -/
theorem lintegral_factorialCountMoment_le_prod (h : IsDeterminantal P N K μ)
    (hK : IsAEPSDKernel K μ) {m n : ℕ} (B : Fin m → Set S) (c : Fin n → Fin m)
    (hB : ∀ j, MeasurableSet (B j) ∧ IsCompact (closure (B j))) (hd : Pairwise (Disjoint on B)) :
    ∫⁻ ω, factorialCountMoment (N ω) B c ∂P ≤
      ∏ i, ∫⁻ x in B (c i), ENNReal.ofReal (K x x).re ∂μ := by
  sorry

/-- **Exponential moments and exponential tails of counts** (BBK Corollary 5.1.14, p. 233;
HKPV Lemma 4.2.6, (4.2.13), p. 52). -/
theorem exponential_tail_determinantal [IsProbabilityMeasure P] (h : IsDeterminantal P N K μ)
    (hK : IsAEPSDKernel K μ) (hloc : IsLocallyIntegrableDiagonal K μ) {W : Set S}
    (hW : MeasurableSet W) (hWc : IsCompact (closure W)) :
    (∀ s : ℝ≥0, ∫⁻ ω, (1 + (s : ℝ≥0∞)) ^ ((N ω).count W).toNat ∂P ≤
      ENNReal.ofReal (Real.exp (s * (∫⁻ x in W, ENNReal.ofReal (K x x).re ∂μ).toReal))) ∧
    ∃ c C : ℝ, 0 < c ∧ ∀ k : ℕ,
      P {ω | (k : ℕ∞) < (N ω).count W} ≤ ENNReal.ofReal (C * Real.exp (-(c * k))) := by
  sorry

/-- **Uniqueness of the law** (HKPV Lemma 4.2.6, pp. 52–53; BBK Corollary 5.1.14, p. 233). -/
theorem map_eq_map_of_isDeterminantal {Ω' : Type*} [MeasurableSpace Ω'] {P' : Measure Ω'}
    {N' : Ω' → PointMeasure S} [IsProbabilityMeasure P] [IsProbabilityMeasure P']
    (h : IsDeterminantal P N K μ) (h' : IsDeterminantal P' N' K μ) (hK : IsAEPSDKernel K μ)
    (hloc : IsLocallyIntegrableDiagonal K μ) :
    P.map N = P'.map N' := by
  sorry

/-- **The void probability series** (BBK Corollary 5.1.19(iii), p. 235): for an a.e. positive
semidefinite kernel with locally integrable diagonal, on a bounded window. -/
theorem void_probability_eq_tsum [IsProbabilityMeasure P] (h : IsDeterminantal P N K μ)
    (hK : IsAEPSDKernel K μ) (hloc : IsLocallyIntegrableDiagonal K μ) {W : Set S}
    (hW : MeasurableSet W) (hWc : IsCompact (closure W)) :
    (P {ω | (N ω).count W = 0}).toReal =
      ∑' n : ℕ, (-1 : ℝ) ^ n / n.factorial *
        ∫ x in Set.univ.pi (fun _ : Fin n => W), (kernelMatrix K x).det.re
          ∂(Measure.pi fun _ : Fin n => μ) := by
  sorry

end Determinantal

/-! ## Layer 3: spectral kernels and integral operators -/

section Spectral

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-! ### 3.1 Integral operators -/

/-- `T` is the integral operator of `K` on `L²(ν)`: for every `f` and `ν`-a.e. `x`, the function
`y ↦ K x y * f y` is integrable and `(T f) x` is its integral. -/
def HasIntegralKernel {ν : Measure S} (T : Lp ℂ 2 ν →L[ℂ] Lp ℂ 2 ν) (K : S → S → ℂ) : Prop :=
  ∀ f : Lp ℂ 2 ν, ∀ᵐ x ∂ν, Integrable (fun y => K x y * f y) ν ∧
    (T f : S → ℂ) x = ∫ y, K x y * f y ∂ν

/-- **Square-integrable kernels have integral operators**, which are unique. -/
theorem existsUnique_hasIntegralKernel {ν : Measure S} [SigmaFinite ν] {K : S → S → ℂ}
    (hK : MemLp (uncurry K) 2 (ν.prod ν)) :
    ∃! T : Lp ℂ 2 ν →L[ℂ] Lp ℂ 2 ν, HasIntegralKernel T K := by
  sorry

/-! ### 3.2 The spectral form of a kernel on a window -/

/-- A spectral form of `K` on the window `W`: nonnegative summable eigenvalues, measurable
eigenfunctions in `L²(μ|W)`, orthonormal for the nonzero eigenvalues, and a carrier of full
measure in `W` on which `K x y = ∑ₖ λₖ φₖ(x) conj φₖ(y)` for every pair of points. -/
structure SpectralForm (K : S → S → ℂ) (μ : Measure S) (W : Set S) where
  /-- The eigenvalues, with multiplicity. -/
  eigenvalue : ℕ → ℝ
  /-- The eigenfunctions. -/
  eigenfunction : ℕ → S → ℂ
  eigenvalue_nonneg : ∀ k, 0 ≤ eigenvalue k
  summable_eigenvalue : Summable eigenvalue
  measurable_eigenfunction : ∀ k, Measurable (eigenfunction k)
  memLp_eigenfunction : ∀ k, MemLp (eigenfunction k) 2 (μ.restrict W)
  orthonormal : ∀ i j, eigenvalue i ≠ 0 → eigenvalue j ≠ 0 →
    ∫ x in W, conj (eigenfunction i x) * eigenfunction j x ∂μ = if i = j then 1 else 0
  /-- A subset of `W` of full measure on which the expansion holds pointwise. -/
  carrier : Set S
  carrier_subset : carrier ⊆ W
  measure_diff_carrier : μ (W \ carrier) = 0
  hasSum : ∀ x ∈ carrier, ∀ y ∈ carrier,
    HasSum (fun k => (eigenvalue k : ℂ) * eigenfunction k x * conj (eigenfunction k y)) (K x y)

/-- `K` has a spectral form on every bounded window: Hermitian, locally trace class, and equal
to its spectral version, diagonal included. -/
def IsSpectralKernel (K : S → S → ℂ) (μ : Measure S) : Prop :=
  ∀ W : Set S, MeasurableSet W → IsCompact (closure W) → Nonempty (SpectralForm K μ W)

/-- **The canonical version of a kernel** (HKPV Lemma 4.2.2, p. 50; BBK Proposition 5.2.9,
p. 243): a measurable kernel whose integral operator on a window is positive and trace class
agrees `μ ⊗ μ`-a.e. on the window with a kernel that has a spectral form there. -/
theorem exists_ae_eq_spectralForm {μ : Measure S} [SigmaFinite μ] {K : S → S → ℂ}
    (hKm : Measurable (uncurry K)) {W : Set S} (hW : MeasurableSet W)
    {T : Lp ℂ 2 (μ.restrict W) →L[ℂ] Lp ℂ 2 (μ.restrict W)}
    (hT : HasIntegralKernel T K) (hpos : T.IsPositive) (htr : T.nuclearENorm ≠ ⊤) :
    ∃ K' : S → S → ℂ, Measurable (uncurry K') ∧
      (∀ᵐ p ∂(μ.restrict W).prod (μ.restrict W), K' p.1 p.2 = K p.1 p.2) ∧
      Nonempty (SpectralForm K' μ W) := by
  sorry

/-- **The integral operator of a spectral form** (HKPV (4.2.12), p. 52; Assumption 4.2.3,
p. 51): positive, trace class with trace `∑ λₖ = ∫_W K(x,x) dμ`, and with spectrum in `[0, 1]`
exactly when every eigenvalue is at most `1`. -/
theorem SpectralForm.integralOperator {μ : Measure S} {K : S → S → ℂ} {W : Set S}
    (F : SpectralForm K μ W) (hW : MeasurableSet W)
    {T : Lp ℂ 2 (μ.restrict W) →L[ℂ] Lp ℂ 2 (μ.restrict W)} (hT : HasIntegralKernel T K) :
    T.IsPositive ∧ T.nuclearENorm = ∑' k, ENNReal.ofReal (F.eigenvalue k) ∧
      ∫⁻ x in W, ENNReal.ofReal (K x x).re ∂μ = ∑' k, ENNReal.ofReal (F.eigenvalue k) ∧
      (spectrum ℂ T ⊆ Icc 0 1 ↔ ∀ k, F.eigenvalue k ≤ 1) := by
  sorry

/-- **Spectral kernels have locally integrable diagonal and almost everywhere positive
semidefinite kernel matrices**, so that Layer 2 applies to them. -/
theorem IsSpectralKernel.isAEPSDKernel {μ : Measure S} [SigmaFinite μ] {K : S → S → ℂ}
    (hK : IsSpectralKernel K μ) :
    IsLocallyIntegrableDiagonal K μ ∧ IsAEPSDKernel K μ := by
  sorry

/-! ### 3.3 Continuous kernels -/

/-- **Continuous kernels are spectral kernels**: Mercer's theorem on the support of `μ`
restricted to each bounded window (RandomMatrices 8.3). -/
theorem isSpectralKernel_of_continuous {μ : Measure S} [SigmaFinite μ]
    [IsFiniteMeasureOnCompacts μ] {K : S → S → ℂ} (hc : Continuous (uncurry K))
    (hK : Matrix.PosSemidef K) : IsSpectralKernel K μ := by
  sorry

end Spectral

/-! ## Layer 4: projection kernels and Bernoulli mixtures -/

section Mixtures

variable {Ω : Type*} [MeasurableSpace Ω]
variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]
variable {μ : Measure S} [SigmaFinite μ]

/-- The functions `φ k`, `k ∈ I`, are measurable and orthonormal in `L²(μ)`; nothing is asked of
`φ k` for `k ∉ I`. -/
def IsOrthonormalOn (φ : ℕ → S → ℂ) (I : Set ℕ) (μ : Measure S) : Prop :=
  (∀ k ∈ I, Measurable (φ k)) ∧ (∀ k ∈ I, MemLp (φ k) 2 μ) ∧
    ∀ i ∈ I, ∀ j ∈ I, ∫ x, conj (φ i x) * φ j x ∂μ = if i = j then 1 else 0

/-- The projection kernel `∑_{k ∈ J} φₖ(x) conj φₖ(y)` onto the span of `φₖ`, `k ∈ J`. -/
def projectionKernel (φ : ℕ → S → ℂ) (J : Finset ℕ) (x y : S) : ℂ :=
  ∑ k ∈ J, φ k x * conj (φ k y)

/-- The weight `∏_{k ∈ J} λₖ ∏_{k ∉ J} (1 - λₖ)` of the Bernoulli configuration `J`. -/
def bernoulliWeight (lam : ℕ → ℝ) (J : Finset ℕ) : ℝ :=
  ∏' k, if k ∈ J then lam k else 1 - lam k

/-! ### 4.1 Projection processes -/

/-- **Finite projection processes exist** (HKPV Lemma 4.5.1, p. 65). -/
theorem exists_isDeterminantal_projectionKernel {φ : ℕ → S → ℂ} {J : Finset ℕ}
    (hφ : IsOrthonormalOn φ J μ) :
    ∃ L : Measure (PointMeasure S), IsProbabilityMeasure L ∧
      IsDeterminantal L id (projectionKernel φ J) μ := by
  sorry

/-- **A rank-`n` projection process has exactly `n` points** (HKPV Lemma 4.4.1, p. 63). -/
theorem count_univ_projectionKernel {P : Measure Ω} [IsProbabilityMeasure P]
    {N : Ω → PointMeasure S} {φ : ℕ → S → ℂ} {J : Finset ℕ} (hφ : IsOrthonormalOn φ J μ)
    (h : IsDeterminantal P N (projectionKernel φ J) μ) :
    ∀ᵐ ω ∂P, (N ω).count Set.univ = J.card := by
  sorry

/-! ### 4.2 Bernoulli mixtures -/

/-- **The Bernoulli mixture of projection processes** (HKPV Theorem 4.5.3, p. 67; BBK
Theorem 5.2.5, p. 239): eigenfunctions orthonormal where `λₖ ≠ 0`, the expansion on a set of
full measure, and the projection laws `L J` used only for `J` inside `{k | λₖ ≠ 0}`. -/
theorem isDeterminantal_mixture {φ : ℕ → S → ℂ} {lam : ℕ → ℝ}
    (hφ : IsOrthonormalOn φ {k | lam k ≠ 0} μ) (hlam : ∀ k, lam k ∈ Icc 0 1) (hsum : Summable lam)
    {K : S → S → ℂ} (hKm : Measurable (uncurry K)) {D : Set S} (hD : μ Dᶜ = 0)
    (hK : ∀ x ∈ D, ∀ y ∈ D, HasSum (fun k => (lam k : ℂ) * φ k x * conj (φ k y)) (K x y))
    (L : Finset ℕ → Measure (PointMeasure S)) [∀ J, IsProbabilityMeasure (L J)]
    (hL : ∀ J : Finset ℕ, (∀ k ∈ J, lam k ≠ 0) →
      IsDeterminantal (L J) id (projectionKernel φ J) μ) :
    IsProbabilityMeasure (Measure.sum fun J => ENNReal.ofReal (bernoulliWeight lam J) • L J) ∧
      IsDeterminantal (Measure.sum fun J => ENNReal.ofReal (bernoulliWeight lam J) • L J) id K
        μ := by
  sorry

/-- **The count on a window is a sum of independent Bernoulli variables** (HKPV Theorem 4.5.3,
p. 67; LMR Theorem 2 and (2.10), p. 859): every eigenvalue on the window is at most `1`, and the
count has generating function `∏ (1 - λₖ + λₖ z)`, mean `∑ λₖ`, variance `∑ λₖ (1 - λₖ)` and void
probability `∏ (1 - λₖ)`. -/
theorem count_determinantal {P : Measure Ω} [IsProbabilityMeasure P] {N : Ω → PointMeasure S}
    {K : S → S → ℂ} (h : IsDeterminantal P N K μ) {W : Set S} (hW : MeasurableSet W)
    (hWc : IsCompact (closure W)) (F : SpectralForm K μ W) :
    (∀ k, F.eigenvalue k ≤ 1) ∧
      (∀ z ∈ Icc (0 : ℝ) 1, ∫ ω, z ^ ((N ω).count W).toNat ∂P =
        ∏' k, (1 - F.eigenvalue k + F.eigenvalue k * z)) ∧
      ∫⁻ ω, (((N ω).count W).toNat : ℝ≥0∞) ∂P = ∑' k, ENNReal.ofReal (F.eigenvalue k) ∧
      variance (fun ω => (((N ω).count W).toNat : ℝ)) P =
        ∑' k, F.eigenvalue k * (1 - F.eigenvalue k) ∧
      (P {ω | (N ω).count W = 0}).toReal = ∏' k, (1 - F.eigenvalue k) := by
  sorry

end Mixtures

/-! ## Layer 5: existence -/

section Existence

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]
variable {μ : Measure S} [SigmaFinite μ]

/-- **The Macchi–Soshnikov theorem** (HKPV Theorem 4.5.5, p. 68; BBK Theorem 5.2.17, p. 248;
LMR Theorem 1, p. 858): a spectral kernel is the kernel of a determinantal point process iff
every eigenvalue on every bounded window is at most `1`. -/
theorem exists_isDeterminantal_iff {K : S → S → ℂ} (hK : IsSpectralKernel K μ)
    (hm : Measurable (uncurry K)) :
    (∃ L : Measure (PointMeasure S), IsProbabilityMeasure L ∧ IsDeterminantal L id K μ) ↔
      ∀ W : Set S, MeasurableSet W → IsCompact (closure W) →
        ∀ F : SpectralForm K μ W, ∀ k, F.eigenvalue k ≤ 1 := by
  sorry

/-- **The Macchi–Soshnikov theorem, operator form**: the window operators have spectrum in
`[0, 1]`. -/
theorem exists_isDeterminantal_iff_spectrum {K : S → S → ℂ} (hK : IsSpectralKernel K μ)
    (hm : Measurable (uncurry K)) :
    (∃ L : Measure (PointMeasure S), IsProbabilityMeasure L ∧ IsDeterminantal L id K μ) ↔
      ∀ W : Set S, MeasurableSet W → IsCompact (closure W) →
        ∀ T : Lp ℂ 2 (μ.restrict W) →L[ℂ] Lp ℂ 2 (μ.restrict W), HasIntegralKernel T K →
          spectrum ℂ T ⊆ Icc 0 1 := by
  sorry

end Existence

/-! ## Layer 6: Palm distributions -/

section Palm

variable {Ω : Type*} [MeasurableSpace Ω]
variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]
variable {μ : Measure S} [SigmaFinite μ]

/-- **The reduced Palm distributions are determinantal with the Schur-complement kernel**
(BBK Theorem 5.5.2, p. 273): there is a Markov kernel `Q` into point measures whose image in
measures is a reduced Palm kernel of SpatialPointProcessFoundations §3.2, and `Q u` is
determinantal with kernel `reducedKernel K u` for almost every `u` of the intensity. -/
theorem exists_isReducedPalmKernel_determinantal {P : Measure Ω} [IsProbabilityMeasure P]
    {N : Ω → PointMeasure S} {K : S → S → ℂ} (h : IsDeterminantal P N K μ)
    (hK : IsAEPSDKernel K μ) (hloc : IsLocallyIntegrableDiagonal K μ) :
    ∃ Q : ProbabilityTheory.Kernel S (PointMeasure S), IsMarkovKernel Q ∧
      IsReducedPalmKernel P (fun ω => (N ω : Measure S))
        (Q.map fun ξ : PointMeasure S => (ξ : Measure S)) ∧
      ∀ᵐ u ∂(intensity P fun ω => (N ω : Measure S)),
        IsDeterminantal (Q u) id (reducedKernel K u) μ := by
  sorry

end Palm

/-! ## Layer 7: stationary determinantal point processes on `ℝ^d` -/

section Stationary

variable {Ω : Type*} [MeasurableSpace Ω] {d : ℕ}

/-- The stationary kernel `C₀ (x - y)` of a covariance function `C₀`. -/
def stationaryKernel (C₀ : E d → ℂ) (x y : E d) : ℂ := C₀ (x - y)

/-! ### 7.1 Intensity and pair correlation -/

/-- **The intensity of a stationary kernel** (LMR (3.1), p. 861): `ρ = C₀(0)`. -/
theorem intensity_stationary {P : Measure Ω} {N : Ω → PointMeasure (E d)} {C₀ : E d → ℂ}
    (h : IsDeterminantal P N (stationaryKernel C₀) volume) :
    intensity P (fun ω => (N ω : Measure (E d))) = ENNReal.ofReal (C₀ 0).re • volume := by
  sorry

/-- **Stationarity** (BBK Proposition 5.6.1, p. 275; LMR (3.1), p. 861): for an a.e. positive
semidefinite kernel with locally integrable diagonal, a determinantal process is stationary iff
its kernel determinants are invariant, Lebesgue-a.e., under the shift of every point. -/
theorem isStationary_iff_det_kernelMatrix_add {P : Measure Ω} [IsProbabilityMeasure P]
    {N : Ω → PointMeasure (E d)} {K : E d → E d → ℂ} (h : IsDeterminantal P N K volume)
    (hK : IsAEPSDKernel K volume) (hloc : IsLocallyIntegrableDiagonal K volume) :
    IsStationary P N ↔
      ∀ (n : ℕ) (t : E d), ∀ᵐ x ∂(Measure.pi fun _ : Fin n => (volume : Measure (E d))),
        (kernelMatrix K fun i => x i + t).det = (kernelMatrix K x).det := by
  sorry

/-! ### 7.2 The spectral condition -/

/-- **The spectral condition for existence** (LMR Proposition 1, (3.3), p. 861; BBK
Theorem 5.6.8, p. 279): for a continuous square-integrable covariance function, a stationary
determinantal point process exists iff the spectral density is at most `1`. -/
theorem exists_isDeterminantal_stationary_iff {C₀ : E d → ℂ} (hc : Continuous C₀)
    (hpsd : Matrix.PosSemidef (stationaryKernel C₀)) (h2 : MemLp C₀ 2) :
    (∃ L : Measure (PointMeasure (E d)), IsProbabilityMeasure L ∧
        IsDeterminantal L id (stationaryKernel C₀) volume) ↔
      ∀ᵐ ξ, ((𝓕 (h2.toLp C₀) : Lp ℂ 2 (volume : Measure (E d))) ξ).re ≤ 1 := by
  sorry

/-- **Spectral construction** (LMR Corollary 1, p. 862; BBK Proposition 5.6.13, p. 282): an
integrable spectral density with values in `[0, 1]` defines a stationary determinantal point
process with intensity `∫ φ` times Lebesgue measure. -/
theorem exists_isDeterminantal_of_spectralDensity {φ : E d → ℝ} (hφi : Integrable φ)
    (hφ : ∀ ξ, φ ξ ∈ Icc 0 1) :
    ∃ L : Measure (PointMeasure (E d)), IsProbabilityMeasure L ∧
      IsDeterminantal L id (stationaryKernel (𝓕⁻ fun ξ => (φ ξ : ℂ))) volume ∧
      intensity L (fun ξ : PointMeasure (E d) => (ξ : Measure (E d))) =
        ENNReal.ofReal (∫ ξ, φ ξ) • volume := by
  sorry

/-! ### 7.3 Parametric families -/

/-- The Gaussian covariance `ρ exp (-(‖x‖/α)²)`. -/
def gaussianCovariance (ρ α : ℝ) (x : E d) : ℂ := ρ * Real.exp (-(‖x‖ / α) ^ 2)

/-- The generalized Cauchy covariance `ρ (1 + (‖x‖/α)²)^{-ν-d/2}`. -/
def cauchyCovariance (ρ α ν : ℝ) (x : E d) : ℂ :=
  ρ * (1 + (‖x‖ / α) ^ 2) ^ (-(ν + d / 2))

/-- Local copy of SecondOrderRandomFields' `positiveAxisBesselK` (its Local copies), itself a
local copy of AnalyticNumberTheoryPartI's `besselK` (its §2.1a), the K-Bessel kernel
`K_ν(c) = ½ ∫₀^∞ exp(−c(u + u⁻¹)/2) u^ν du/u` for complex order and real `c > 0`; the argument
`c ≤ 0` is outside its interface. SpecialFunctionsBessel §5.1 proves that it agrees with the
DLMF function `K_ν` on the positive axis. -/
def positiveAxisBesselK (ν : ℂ) (c : ℝ) : ℂ :=
  (1 / 2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
    Complex.exp (-(c : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹) / 2) *
      Complex.exp (ν * (Real.log u : ℂ)) / (u : ℂ)

/-- Local copy of SecondOrderRandomFields §4.1: the **Matérn correlation**
`φ_{ν,θ}(t) = 2^{1−ν}/Γ(ν) (|t|/θ)^ν K_ν(|t|/θ)`, with the value `1` at `t = 0`. -/
def maternCorrelation (ν θ t : ℝ) : ℝ :=
  if t = 0 then 1 else
    2 ^ (1 - ν) / Real.Gamma ν * (|t| / θ) ^ ν * (positiveAxisBesselK ν (|t| / θ)).re

/-- Local copy of SecondOrderRandomFields §4.1: the **Matérn spectral density** on `ℝ^d`,
`Γ(ν + d/2)/(Γ(ν) π^{d/2}) θ^d (1 + θ² ‖ω‖²)^{−ν−d/2}`, a probability density in the convention
of characteristic functions. -/
def maternSpectralDensity (ν θ : ℝ) (d : ℕ) (ω : EuclideanSpace ℝ (Fin d)) : ℝ :=
  Real.Gamma (ν + d / 2) / (Real.Gamma ν * Real.pi ^ ((d : ℝ) / 2)) * θ ^ d *
    (1 + θ ^ 2 * ‖ω‖ ^ 2) ^ (-ν - d / 2)

/-- The Whittle–Matérn covariance with intensity `ρ` and scale `α`: the inverse Fourier
transform, in Mathlib's convention `e^{-2πi⟨x, ξ⟩}`, of
`ρ (2π)^d maternSpectralDensity ν α d (2πξ)`, which is
`ρ Γ(ν + d/2) (2√π α)^d / (Γ(ν) (1 + ‖2παξ‖²)^{ν+d/2})`. -/
def maternCovariance (ρ α ν : ℝ) : E d → ℂ :=
  𝓕⁻ fun ξ => ((ρ * (2 * π) ^ d * maternSpectralDensity ν α d ((2 * π) • ξ) : ℝ) : ℂ)

/-- The power exponential spectral density
`ρ Γ(d/2 + 1) α^d / (π^{d/2} Γ(d/ν + 1)) exp (-‖αξ‖^ν)`. -/
def powerExponentialSpectralDensity (ρ α ν : ℝ) (ξ : E d) : ℝ :=
  ρ * Real.Gamma (d / 2 + 1) * α ^ d / (π ^ ((d : ℝ) / 2) * Real.Gamma (d / ν + 1)) *
    Real.exp (-(α * ‖ξ‖) ^ ν)

/-- The power exponential covariance, the inverse Fourier transform of its spectral density. -/
def powerExponentialCovariance (ρ α ν : ℝ) : E d → ℂ :=
  𝓕⁻ fun ξ => (powerExponentialSpectralDensity ρ α ν ξ : ℂ)

/-- **The Gaussian spectral density** (LMR Table 2, p. 863; BBK Example 5.6.11, p. 281). -/
theorem fourier_gaussianCovariance (ρ : ℝ) {α : ℝ} (hα : 0 < α) (ξ : E d) :
    𝓕 (gaussianCovariance ρ α) ξ = ρ * (√π * α) ^ d * Real.exp (-(π * α * ‖ξ‖) ^ 2) := by
  sorry

/-- **The Gaussian model** (LMR Table 2, p. 863; BBK Example 5.6.11, p. 281):
`ρ_max = (√π α)^{-d}`. -/
theorem exists_isDeterminantal_gaussian_iff {ρ α : ℝ} (hα : 0 < α) :
    (∃ L : Measure (PointMeasure (E d)), IsProbabilityMeasure L ∧
        IsDeterminantal L id (stationaryKernel (gaussianCovariance ρ α)) volume) ↔
      0 ≤ ρ ∧ ρ ≤ ((√π * α) ^ d)⁻¹ := by
  sorry

/-- **The Cauchy model** (LMR Table 2, p. 863; BBK Example 5.6.12, p. 282):
`ρ_max = Γ(ν + d/2) / (Γ(ν) π^{d/2} α^d)`. -/
theorem exists_isDeterminantal_cauchy_iff {ρ α ν : ℝ} (hα : 0 < α) (hν : 0 < ν) :
    (∃ L : Measure (PointMeasure (E d)), IsProbabilityMeasure L ∧
        IsDeterminantal L id (stationaryKernel (cauchyCovariance ρ α ν)) volume) ↔
      0 ≤ ρ ∧ ρ ≤ Real.Gamma (ν + d / 2) / (Real.Gamma ν * π ^ ((d : ℝ) / 2) * α ^ d) := by
  sorry

/-- **The Whittle–Matérn covariance in Bessel form** (LMR Table 2, p. 863): the covariance is `ρ`
times the Matérn correlation of SecondOrderRandomFields §4.1 at `‖x‖`, with scale `α`. -/
theorem maternCovariance_eq_maternCorrelation (ρ : ℝ) {α ν : ℝ} (hα : 0 < α) (hν : 0 < ν)
    (x : E d) :
    maternCovariance ρ α ν x = ((ρ * maternCorrelation ν α ‖x‖ : ℝ) : ℂ) := by
  sorry

/-- **The Whittle–Matérn model** (LMR Table 2, p. 863): `C₀(0) = ρ` and
`ρ_max = Γ(ν) / (Γ(ν + d/2) (2√π α)^d)`. -/
theorem exists_isDeterminantal_matern_iff {ρ α ν : ℝ} (hα : 0 < α) (hν : 0 < ν) :
    maternCovariance (d := d) ρ α ν 0 = ρ ∧
      ((∃ L : Measure (PointMeasure (E d)), IsProbabilityMeasure L ∧
          IsDeterminantal L id (stationaryKernel (maternCovariance ρ α ν)) volume) ↔
        0 ≤ ρ ∧ ρ ≤ Real.Gamma ν / (Real.Gamma (ν + d / 2) * (2 * √π * α) ^ d)) := by
  sorry

/-- **The power exponential model** (LMR (3.7), p. 863): `C₀(0) = ρ` and
`ρ_max = π^{d/2} Γ(d/ν + 1) / (Γ(d/2 + 1) α^d)`. -/
theorem exists_isDeterminantal_powerExponential_iff {ρ α ν : ℝ} (hα : 0 < α) (hν : 0 < ν) :
    powerExponentialCovariance (d := d) ρ α ν 0 = ρ ∧
      ((∃ L : Measure (PointMeasure (E d)), IsProbabilityMeasure L ∧
          IsDeterminantal L id (stationaryKernel (powerExponentialCovariance ρ α ν)) volume) ↔
        0 ≤ ρ ∧
          ρ ≤ π ^ ((d : ℝ) / 2) * Real.Gamma (d / ν + 1) / (Real.Gamma (d / 2 + 1) * α ^ d)) := by
  sorry

end Stationary

/-! ## Supplier names cited in the README

This block declares nothing. It pins every Mathlib and Tau Ceti name that the README writes in
code font to the pinned libraries, so that a renamed or removed supplier breaks the build here
instead of leaving a stale name in the README. -/

#check @Matrix.det_gram_le_prod_norm_sq
#check @Matrix.det_mul_eq_sum_prod_mul_det_submatrix
#check @ContinuousLinearMap.nuclearENorm
#check @Matrix.PosSemidef.det_nonneg
#check @Matrix.PosSemidef
#check @Matrix.PosSemidef.submatrix
#check @TauCeti.bochner_posSemidef
#check @fourier_gaussian_innerProductSpace
#check @MeasureTheory.Lp.fourierTransformₗᵢ
#check @Matrix.det_fromBlocks₁₁
#check @Matrix.PosDef.fromBlocks₁₁
#check @MeasureTheory.Lp
#check @Real.Gamma
#check @spectrum

end TauCetiRoadmap.DeterminantalPointProcesses
