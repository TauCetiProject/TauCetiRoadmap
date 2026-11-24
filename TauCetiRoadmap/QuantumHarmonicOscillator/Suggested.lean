import Mathlib
import TauCeti.Analysis.SpecialFunctions.Hermite.Function.Lp
import TauCeti.Analysis.OperatorIdeal.Nuclear.Basic

/-!
# The quantum harmonic oscillator: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

The Hamiltonian is `H = ½(P² + Q²) = N + ½`, with `Q = x` and `P = -i d/dx`, so that
`PQ - QP = -i`. The Hermite functions are Tau Ceti's `TauCeti.hermiteFunction`, and
`TauCeti.hermiteFunctionLp ℂ n` is the class of the `n`-th one in complex `L²(ℝ)`. The operators
`e^{-tH}` and `e^{-itH}` enter through their action on this Hilbert basis: a bounded operator `T`
with `T hₙ = e^{-t(n+½)} hₙ` for every `n` (which determines `T`), and likewise for the unitary
group. The common invariant domains of the Rellich–Dixmier theorem are copied verbatim from
UnboundedOperators (README §5.3), and the Ornstein–Uhlenbeck kernel, semigroup and Mehler kernel
from OrnsteinUhlenbeckSemigroup (README 1.1–1.2), because a roadmap's file does not import
another roadmap's module.
-/

noncomputable section

open MeasureTheory InnerProductSpace
open scoped InnerProductSpace ENNReal

namespace TauCetiRoadmap.QuantumHarmonicOscillator

universe u

/-! ## Layer 1: the ladder theorem on an inner product space -/

/-- 1.1 Dirac's ladder theorem. Let `a, b` be linear maps of a complex inner product space `V`
(not necessarily complete) with `⟪a x, y⟫ = ⟪x, b y⟫` for all `x, y` and `ab - ba = 1`. If
`b (a x) = μ x` for a nonzero `x`, then `μ` is a natural number `n`, `aⁿ x ≠ 0` and
`aⁿ⁺¹ x = 0`. -/
theorem exists_nat_eigenvalue_eq {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
    (a b : Module.End ℂ V) (hadj : ∀ x y, ⟪a x, y⟫_ℂ = ⟪x, b y⟫_ℂ)
    (hccr : a * b - b * a = 1) {μ : ℂ} {x : V} (hx : x ≠ 0) (hμ : b (a x) = μ • x) :
    ∃ n : ℕ, μ = n ∧ (a ^ n) x ≠ 0 ∧ (a ^ (n + 1)) x = 0 := by
  sorry

/-- 1.2 Vacuum towers. Under the hypotheses of 1.1, for every `n`: `bⁿ` multiplies inner
products on `ker a` by `n!`; `a bⁿ⁺¹ = bⁿ⁺¹ a + (n + 1) bⁿ`; `bⁿ aⁿ` is the falling factorial
`N (N - 1) ⋯ (N - n + 1)` of `N = b a`; and the eigenspace of `N` for the eigenvalue `n` is the
image of `ker a` under `bⁿ`. -/
theorem vacuum_tower {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
    (a b : Module.End ℂ V) (hadj : ∀ x y, ⟪a x, y⟫_ℂ = ⟪x, b y⟫_ℂ)
    (hccr : a * b - b * a = 1) (n : ℕ) :
    (∀ y ∈ LinearMap.ker a, ∀ y' ∈ LinearMap.ker a,
      ⟪(b ^ n) y, (b ^ n) y'⟫_ℂ = (n.factorial : ℂ) * ⟪y, y'⟫_ℂ) ∧
    a * b ^ (n + 1) = b ^ (n + 1) * a + ((n + 1 : ℕ) : ℂ) • b ^ n ∧
    b ^ n * a ^ n = ((List.range n).map fun k : ℕ => b * a - (k : ℂ) • 1).prod ∧
    Module.End.eigenspace (b * a) (n : ℂ) = (LinearMap.ker a).map (b ^ n) := by
  sorry

/-! ## Layer 2: the Rellich–Dixmier theorem -/

section Nelson

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- 2.1 A common dense invariant domain inside the actual partial-operator domains (copied
verbatim from UnboundedOperators §5.3, UO-E03).
Graph-core density is a further theorem; dense invariance alone does not assert it. -/
structure CommonInvariantDomain (k : ℕ) (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] where
  /-- The partial operators, indexed by `Fin k`. -/
  operators : Fin k → H →ₗ.[ℂ] H
  /-- The common subspace. -/
  carrier : Submodule ℂ H
  /-- The common subspace is dense in `H`. -/
  dense : Dense (carrier : Set H)
  /-- The common subspace lies in the domain of every operator. -/
  domain_le : ∀ i, carrier ≤ (operators i).domain
  /-- Every operator maps the common subspace into itself. -/
  invariant : ∀ i (x : carrier),
    operators i ⟨x.1, domain_le i x.2⟩ ∈ carrier

/-- 2.1 The action on the common domain is determined by the actual operators (copied verbatim
from UnboundedOperators §5.3). -/
def CommonInvariantDomain.action {k : ℕ} (D : CommonInvariantDomain k H)
    (i : Fin k) : D.carrier →ₗ[ℂ] D.carrier :=
  ((D.operators i).toFun.comp (Submodule.inclusion (D.domain_le i))).codRestrict
    D.carrier (fun x => D.invariant i x)

/-- 2.1 The restriction to the common domain has the original operator's action (copied
verbatim from UnboundedOperators §5.3). -/
def CommonInvariantDomain.restricted {k : ℕ} (D : CommonInvariantDomain k H)
    (i : Fin k) : H →ₗ.[ℂ] H :=
  ⟨D.carrier, D.carrier.subtype.comp (D.action i)⟩

end Nelson

/-- 2.1 The Rellich–Dixmier theorem. Operator `0` is `P` and operator `1` is `Q`. If the
restrictions of `P` and `Q` to a dense common invariant subspace `X` are symmetric, satisfy
`PQ - QP = -i` on `X`, and `P² + Q²` restricted to `X` is essentially self-adjoint, then the
closures `P̄`, `Q̄` of the restrictions are self-adjoint and there is a Hilbert basis
`e (k, n)`, `k ∈ κ`, `n ∈ ℕ`, of `H` on which `Q̄` and `P̄` act by the Heisenberg matrices:
`Q̄ e(k, n) = √(n/2) e(k, n-1) + √((n+1)/2) e(k, n+1)` and
`P̄ e(k, n) = i√((n+1)/2) e(k, n+1) - i√(n/2) e(k, n-1)`. So `H` is a Hilbert sum, indexed by
`κ`, of copies of the Schrödinger pair (Dixmier 1958, Théorème 1). -/
theorem rellich_dixmier {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (D : CommonInvariantDomain 2 H)
    (hsym : ∀ i, (D.restricted i).IsFormalAdjoint (D.restricted i))
    (hccr : ∀ x : D.carrier,
      ((D.action 0 (D.action 1 x) : D.carrier) : H) - (D.action 1 (D.action 0 x) : H) =
        (-Complex.I) • (x : H))
    (hesa : IsSelfAdjoint
      (⟨D.carrier, D.carrier.subtype.comp
        (D.action 0 * D.action 0 + D.action 1 * D.action 1)⟩ : H →ₗ.[ℂ] H).closure) :
    IsSelfAdjoint (D.restricted 0).closure ∧ IsSelfAdjoint (D.restricted 1).closure ∧
    ∃ (κ : Type u) (e : HilbertBasis (κ × ℕ) ℂ H), ∀ k n,
      ∃ (hP : e (k, n) ∈ (D.restricted 0).closure.domain)
        (hQ : e (k, n) ∈ (D.restricted 1).closure.domain),
        (D.restricted 1).closure ⟨e (k, n), hQ⟩ =
          (Real.sqrt (n / 2) : ℂ) • e (k, n - 1) + (Real.sqrt ((n + 1) / 2) : ℂ) • e (k, n + 1) ∧
        (D.restricted 0).closure ⟨e (k, n), hP⟩ =
          (Complex.I * Real.sqrt ((n + 1) / 2)) • e (k, n + 1) -
            (Complex.I * Real.sqrt (n / 2)) • e (k, n - 1) := by
  sorry

/-! ## Layer 3: the heat semigroup -/

/-- Conventions. Complex `L²(ℝ)` for Lebesgue measure (the same declaration as
UnboundedOperators' `L2`). -/
abbrev L2 : Type := Lp ℂ 2 (volume : Measure ℝ)

section OrnsteinUhlenbeck

open ProbabilityTheory
open scoped RealInnerProductSpace

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-- 3.1 The variance-preserving noising kernel `x ↦ N(√a • x, 1 - a)` (copied verbatim from
DenoisingDiffusion 2.1, through OrnsteinUhlenbeckSemigroup 1.1). -/
def noiseKernel (a : ℝ) : Kernel E E :=
  (Kernel.id ×ₖ Kernel.const E (stdGaussian E)).map (fun p ↦ √a • p.1 + √(1 - a) • p.2)

/-- 3.1 The Ornstein–Uhlenbeck kernel at time `t`, the noising kernel at signal level
`exp (-2 t)`: for `t ≥ 0` it is `x ↦ N(e^{-t} x, 1 - e^{-2t})` (copied verbatim from
OrnsteinUhlenbeckSemigroup 1.1). -/
def ouKernel (t : ℝ) : Kernel E E :=
  noiseKernel (Real.exp (-2 * t))

/-- 3.1 The Ornstein–Uhlenbeck semigroup on functions, `P_t f x = ∫ f d(ouKernel t x)` (copied
verbatim from OrnsteinUhlenbeckSemigroup 1.1). -/
def ouSemigroup (t : ℝ) (f : E → ℝ) (x : E) : ℝ :=
  ∫ y, f y ∂(ouKernel t x)

/-- 3.2 Mehler's kernel: with `ρ = e^{-t}`,
`(1 - ρ²)^{-d/2} exp (-(ρ² ‖x‖² - 2 ρ ⟪x, y⟫ + ρ² ‖y‖²) / (2 (1 - ρ²)))` (copied verbatim from
OrnsteinUhlenbeckSemigroup 1.2). -/
def mehlerKernel (t : ℝ) (x y : E) : ℝ :=
  (1 - Real.exp (-2 * t)) ^ (-(d : ℝ) / 2) *
    Real.exp (-(Real.exp (-2 * t) * ‖x‖ ^ 2 - 2 * Real.exp (-t) * ⟪x, y⟫ +
      Real.exp (-2 * t) * ‖y‖ ^ 2) / (2 * (1 - Real.exp (-2 * t))))

end OrnsteinUhlenbeck

/-- 3.1 The ground-state transform `(W g)(x) = π^{-1/4} e^{-x²/2} g(√2 x)`, from real functions
on the one-dimensional Euclidean space to complex functions on `ℝ`. It is Tau Ceti's
`weightL2Isometry` (multiplication by the square root of the Gaussian density) composed with the
dilation by `√2`, and it carries `Heₙ/√(n!)` to `hₙ`. -/
def groundStateTransform (g : EuclideanSpace ℝ (Fin 1) → ℝ) (x : ℝ) : ℂ :=
  ((Real.pi ^ (-(1 : ℝ) / 4) * Real.exp (-(x ^ 2 / 2)) *
    g (EuclideanSpace.single 0 (Real.sqrt 2 * x)) : ℝ) : ℂ)

/-- 3.1 The Ornstein–Uhlenbeck semigroup is the oscillator semigroup in disguise. For `t ≥ 0`
and `g ∈ L²(γ)`, the ground-state transform is an isometry onto its image in `L²(ℝ)` and
`W (P_t g) = Σₙ e^{-nt} ⟪hₙ, W g⟫ hₙ`, that is `W P_t W⁻¹ = e^{-t(H - ½)}`. -/
theorem hasSum_groundStateTransform_ouSemigroup {t : ℝ} (ht : 0 ≤ t)
    {g : EuclideanSpace ℝ (Fin 1) → ℝ}
    (hg : MemLp g 2 (ProbabilityTheory.stdGaussian (EuclideanSpace ℝ (Fin 1)))) :
    ∃ (hW : MemLp (groundStateTransform g) 2 volume)
      (hWt : MemLp (groundStateTransform (ouSemigroup t g)) 2 volume),
      eLpNorm (groundStateTransform g) 2 volume =
          eLpNorm g 2 (ProbabilityTheory.stdGaussian (EuclideanSpace ℝ (Fin 1))) ∧
        HasSum (fun n : ℕ => ((Real.exp (-(n * t)) : ℝ) : ℂ) •
            (⟪TauCeti.hermiteFunctionLp ℂ n, hW.toLp _⟫_ℂ • TauCeti.hermiteFunctionLp ℂ n))
          (hWt.toLp _) := by
  sorry

/-- 3.2 Mehler's heat kernel of `H = ½(-d²/dx² + x²)`:
`(2π sinh t)^{-1/2} exp(-((x² + y²) cosh t - 2xy) / (2 sinh t))`. For `t > 0` it is
`e^{-t/2} π^{-1/2} e^{-(x²+y²)/2}` times OrnsteinUhlenbeckSemigroup's `mehlerKernel` at
`(√2 x, √2 y)` in dimension one (the last clause of 3.2). -/
def mehlerHeatKernel (t x y : ℝ) : ℝ :=
  (2 * Real.pi * Real.sinh t) ^ (-(1 : ℝ) / 2) *
    Real.exp (-((x ^ 2 + y ^ 2) * Real.cosh t - 2 * x * y) / (2 * Real.sinh t))

/-- 3.2 Mehler's formula and the partition function. For `t > 0` let `T` be a bounded operator
on `L²(ℝ)` with `T hₙ = e^{-t(n+½)} hₙ` for every `n` (that is, `T = e^{-tH}`). Then `T` is the
integral operator with kernel `mehlerHeatKernel t`, the integral converging absolutely at every
point; `T` is trace class with trace norm `1/(2 sinh(t/2))`; the integral of the kernel over the
diagonal is the same number; and the kernel is the transported Ornstein–Uhlenbeck Mehler
kernel. -/
theorem heat_eq_mehlerHeatKernel {t : ℝ} (ht : 0 < t) (T : L2 →L[ℂ] L2)
    (hT : ∀ n : ℕ, T (TauCeti.hermiteFunctionLp ℂ n) =
      ((Real.exp (-(t * (n + 1 / 2))) : ℝ) : ℂ) • TauCeti.hermiteFunctionLp ℂ n) :
    (∀ f : L2, (∀ x, Integrable (fun y => (mehlerHeatKernel t x y : ℂ) * f y) volume) ∧
      ∃ hm : MemLp (fun x : ℝ => ∫ y, (mehlerHeatKernel t x y : ℂ) * f y) 2 volume,
        T f = hm.toLp _) ∧
    T.nuclearENorm = ENNReal.ofReal (1 / (2 * Real.sinh (t / 2))) ∧
    ∫ x, mehlerHeatKernel t x x = 1 / (2 * Real.sinh (t / 2)) ∧
    ∀ x y, mehlerHeatKernel t x y = Real.exp (-(t / 2)) * Real.pi ^ (-(1 : ℝ) / 2) *
      Real.exp (-((x ^ 2 + y ^ 2) / 2)) *
        mehlerKernel t (EuclideanSpace.single (0 : Fin 1) (Real.sqrt 2 * x))
          (EuclideanSpace.single (0 : Fin 1) (Real.sqrt 2 * y)) := by
  sorry

/-! ## Layer 4: the unitary group -/

/-- 4.1 Mehler's kernel of `e^{-itH}` for `0 < t < π`, with the branch of the square root fixed:
`e^{-iπ/4} (2π sin t)^{-1/2} exp(i((x² + y²) cos t - 2xy) / (2 sin t))`. -/
def mehlerPropagatorKernel (t x y : ℝ) : ℂ :=
  Complex.exp (-(Real.pi / 4 : ℂ) * Complex.I) *
    ((2 * Real.pi * Real.sin t) ^ (-(1 : ℝ) / 2) : ℝ) *
    Complex.exp (Complex.I * (((x ^ 2 + y ^ 2) * Real.cos t - 2 * x * y) / (2 * Real.sin t) : ℝ))

/-- 4.1 Mehler's formula for the unitary group. For `0 < t < π` let `U` be a bounded operator on
`L²(ℝ)` with `U hₙ = e^{-it(n+½)} hₙ` for every `n` (that is, `U = e^{-itH}`). For every
`f ∈ L²(ℝ) ∩ L¹(ℝ)`, `U f` is the class of `x ↦ ∫ mehlerPropagatorKernel t x y f(y) dy`, the
integral converging absolutely at every point. -/
theorem propagator_eq_mehlerPropagatorKernel {t : ℝ} (ht : 0 < t) (htπ : t < Real.pi)
    (U : L2 →L[ℂ] L2)
    (hU : ∀ n : ℕ, U (TauCeti.hermiteFunctionLp ℂ n) =
      Complex.exp (-(Complex.I * (t * (n + 1 / 2) : ℝ))) • TauCeti.hermiteFunctionLp ℂ n)
    (f : L2) (hf1 : Integrable (f : ℝ → ℂ) volume) :
    (∀ x, Integrable (fun y => mehlerPropagatorKernel t x y * f y) volume) ∧
      ∃ hm : MemLp (fun x : ℝ => ∫ y, mehlerPropagatorKernel t x y * f y) 2 volume,
        U f = hm.toLp _ := by
  sorry

/-- 4.2 The exact Heisenberg evolution of position and momentum. For real `t` let `U` be a
bounded operator on `L²(ℝ)` with `U hₙ = e^{-it(n+½)} hₙ` for every `n`. Then `U` maps (the
class of) every Schwartz function `ψ` to (the class of) a Schwartz function `φ`, and with
`Q = x` and `P = -i d/dx` on Schwartz space,
`Q φ = U (cos t · Q ψ + sin t · P ψ)` and `P φ = U (cos t · P ψ - sin t · Q ψ)`; that is,
`U* Q U = Q cos t + P sin t` and `U* P U = P cos t - Q sin t` on Schwartz space. -/
theorem heisenberg_rotation (t : ℝ) (U : L2 →L[ℂ] L2)
    (hU : ∀ n : ℕ, U (TauCeti.hermiteFunctionLp ℂ n) =
      Complex.exp (-(Complex.I * (t * (n + 1 / 2) : ℝ))) • TauCeti.hermiteFunctionLp ℂ n)
    (ψ : SchwartzMap ℝ ℂ) :
    let Q := SchwartzMap.smulLeftCLM ℂ (fun x : ℝ => (x : ℂ))
    let P := (-Complex.I) • SchwartzMap.derivCLM ℂ ℂ
    ∃ φ : SchwartzMap ℝ ℂ, U (ψ.toLp 2) = φ.toLp 2 ∧
      (Q φ).toLp 2 = U ((Real.cos t • Q ψ + Real.sin t • P ψ).toLp 2) ∧
      (P φ).toLp 2 = U ((Real.cos t • P ψ - Real.sin t • Q ψ).toLp 2) := by
  sorry

end TauCetiRoadmap.QuantumHarmonicOscillator
