import Mathlib

/-!
# Automorphic L-functions and local factors: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states the roadmap's headline theorems against the pinned Mathlib, with
only the definitions their statements need.

AL.0 states the finite-jet theorem for point-supported tempered distributions, the half-order
K-Bessel derivative and the Bessel–Laplace Mellin identity. AL.1 states local eigenline
uniqueness and Tate continuation with its local functional equation at every place. AL.2 states
the local Godement–Jacquet theorem at every finite place in every rank (the standard L-factor as
generator of the ideal of zeta integrals, and the local functional equation with its monomial
epsilon factor) and Casselman's full GL₂ fixed-space dimension theorem. AL.3 states local
Whittaker uniqueness in every rank (the `ψ_N`-equivariant functionals on an irreducible smooth
admissible representation of `GLₙ(F)` form a space of rank at most one), the local
Rankin–Selberg theorem at every finite place for every pair of ranks (the pair L-factor as
generator of the ideal of local integrals, and the local functional equation with its monomial
epsilon factor), and the generic newform line in every positive rank. The local-field statements
allow both characteristics. All definitions below have bodies on native carriers.

The two Bessel statements take AnalyticNumberTheoryPartI §2.1a's K-Bessel kernel as an argument
together with its defining integral; that roadmap's `besselK` satisfies the hypothesis by `rfl`.

The following headline theorems are not statable at the pins. The global Godement–Jacquet and
Rankin–Selberg theorems, multiplicity one, converse theorems and rational-period twisting need
smooth automorphic cuspidal representations, restricted tensor Whittaker models and archimedean
globalizations/cohomological rational structures. The Maass functional equation and norm formula
need the normalized Maass eigenform carrier. The arithmetic identification of the local gamma
scalar and the global root number needs the supplied `tateLocalConstant` and standard-vector
comparisons. The archimedean Godement–Jacquet and Rankin–Selberg theorems need Casselman–Wallach
representations of `GLₙ(ℝ)` and `GLₙ(ℂ)` with their continuous contragredient vectors and
Whittaker functionals; only the rank-one case, on Mathlib's Schwartz space, is stated.

AL.3's curve reciprocity and pure realization, intersection-complex purity, shtuka comparison,
cuspidal polynomial degree and Riemann-hypothesis statements need lisse adic sheaves,
intermediate extensions, their weight/cohomology theory and shtuka spaces with Hecke actions.
AL.4's actual Satake/L-group and Weil–Deligne comparisons need those parameter carriers.
AL.5's automorphic period, stabilization and conductor comparisons need the preceding
representations and rational period structures. These headline results are not statable at the
pins. Scalar determinant operations, finite correction identities and scalar division/sign
consequences do not replace them.
-/
noncomputable section
open MeasureTheory
open scoped Topology NNReal ENNReal NumberField

namespace TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

/-! ## Layer AL.0: local and adelic Fourier analysis -/

namespace AL0

/-- Real exponential integral Ei(-r), only r>0 is used. -/
def negativeEi (r : ℝ) : ℝ := -(∫ t : ℝ in Set.Ioi r, Real.exp (-t)/t)

section Bessel

variable (besselK : ℂ → ℝ → ℂ)
  (hbesselK : ∀ ν c, besselK ν c = (1/2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
    Complex.exp (-(c : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹)/2) *
      Complex.exp (ν * (Real.log u : ℂ)) / (u : ℂ))
include hbesselK

/-- The order derivative at one half is expressed by the negative exponential integral. -/
theorem BesselHalfOrderDerivative {c : ℝ} (hc : 0 < c) :
    deriv (fun ν : ℂ => besselK ν c) (1/2) =
      (-(Real.sqrt (Real.pi/2)*Real.exp c*c^(-1/2 : ℝ)*negativeEi (2*c)) : ℝ) := by sorry

/-- Gross–Zagier's Laplace–Mellin integral, with the same K convention. -/
theorem BesselLaplaceMellin (m t : ℝ) (s : ℂ) (hm : 0 < m) (ht : 0 < t)
    (hs : t < s.re) :
    (∫ y : ℝ in Set.Ioi 0, (y : ℂ)^(s-1/2)*besselK (t+1/2) (2*Real.pi*m*y)*
      Complex.exp (-2*Real.pi*m*y)) =
    (Real.sqrt Real.pi : ℂ)*Complex.Gamma (s+t+1)*Complex.Gamma (s-t)/
      (Complex.Gamma (s+1)*(4*Real.pi*m : ℂ)^(s+1/2)) := by sorry

end Bessel

/-- A point-supported tempered distribution depends on only finitely many derivatives.
The vanishing-jet form applies in every finite real dimension. -/
theorem pointSupported_finiteJet {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] (T : TemperedDistribution E ℂ)
    (hT : Distribution.dsupport (fun f : SchwartzMap E ℂ => T f) ⊆ {0}) :
    ∃ N : ℕ, ∀ f : SchwartzMap E ℂ,
      (∀ k ≤ N, iteratedFDeriv ℝ k f 0 = 0) → T f = 0 := by sorry

end AL0

/-! ## Layer AL.1: local eigendistributions and Hecke L-functions -/

namespace TateZeta

/-- Inverse scalar multiplication on an archimedean field, as a real linear homeomorphism. -/
def inverseScalar {F : Type*} [RCLike F] (a : Fˣ) : F ≃L[ℝ] F :=
  ((LinearEquiv.smulOfUnit (M := F) a⁻¹).restrictScalars ℝ).toContinuousLinearEquiv

/-- The continuous eigendistributions for inverse scalar pullback on an archimedean field.
The pullback is the actual real linear homeomorphism x ↦ a⁻¹x. -/
def archimedeanEigenSpace {F : Type*} [RCLike F]
    (χ : Fˣ →ₜ* ℂˣ) : Submodule ℂ (TemperedDistribution F ℂ) where
  carrier := {T | ∀ a f, T (SchwartzMap.compCLMOfContinuousLinearEquiv ℂ (inverseScalar a) f) =
    (χ a : ℂ) * T f}
  zero_mem' := by simp
  add_mem' := by
    intro T S hT hS a f
    simp only [Set.mem_ofPred_eq] at hT hS ⊢
    simp [hT a f, hS a f, mul_add]
  smul_mem' := by
    intro c T hT a f
    simp only [Set.mem_ofPred_eq] at hT ⊢
    simp [hT a f, mul_left_comm]

/-- AL.1.2.5: every archimedean quasi-character has a one-dimensional continuous
eigendistribution space. -/
theorem archimedeanEigenSpace.finrank {F : Type*} [RCLike F]
    (χ : Fˣ →ₜ* ℂˣ) : Module.finrank ℂ (archimedeanEigenSpace χ) = 1 := by
  sorry

/-- The local Tate integral on the multiplicative group of a local field. With `ν` the
multiplicative measure and `a` the normalized absolute value of a number-field completion, it
is AnalyticNumberTheoryPartII §5.3j's local zeta integral. -/
def localZetaIntegral {F : Type*} [Field F] [TopologicalSpace F] [MeasurableSpace F]
    (ν : Measure Fˣ) (a : F → ℝ) (χ : Fˣ →ₜ* ℂˣ) (f : F → ℂ) (s : ℂ) : ℂ :=
  ∫ x : Fˣ, f x * (χ x : ℂ) * (a x : ℂ)^s ∂ν

/-- Meromorphic continuation and the positive-kernel local functional equation,
with a common gamma factor for every Schwartz–Bruhat test function. -/
theorem localZetaIntegral_functionalEquation {F : Type*} [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] [MeasurableSpace F] [BorelSpace F]
    (μ : Measure F) [μ.IsAddHaarMeasure] (ν : Measure Fˣ) [ν.IsHaarMeasure]
    (ψ : AddChar F Circle) (hψ : Continuous ψ) (hψ1 : ψ ≠ 1)
    (a : F → ℝ) (ha : Continuous a) (hapos : ∀ x ≠ 0, 0 < a x)
    (hmod : ∀ (x : F) (U : Set F), MeasurableSet U →
      μ ((x * ·) '' U) = ENNReal.ofReal (a x) * μ U)
    (χ : Fˣ →ₜ* ℂˣ) (r : ℝ) (hχ : ∀ x : Fˣ, ‖(χ x : ℂ)‖ = (a x)^r) :
    ∃ γ : ℂ → ℂ, MeromorphicOn γ Set.univ ∧
      (∃ s : ℂ, AnalyticAt ℂ γ s ∧ γ s ≠ 0) ∧
      ∀ f : F → ℂ, IsLocallyConstant f → HasCompactSupport f →
        ∃ Z Zhat : ℂ → ℂ, MeromorphicOn Z Set.univ ∧ MeromorphicOn Zhat Set.univ ∧
          (∀ s : ℂ, 0 < s.re + r →
            Integrable (fun x : Fˣ => f x * (χ x : ℂ) * (a x : ℂ)^s) ν ∧
            Z s = localZetaIntegral ν a χ f s) ∧
          (∀ s : ℂ, r < s.re →
            Integrable (fun x : Fˣ =>
              VectorFourier.fourierIntegral ψ μ (LinearMap.mul F F) f (-x) *
                ((χ x)⁻¹ : ℂ) * (a x : ℂ)^s) ν ∧
            Zhat s = localZetaIntegral ν a χ⁻¹
              (fun x => VectorFourier.fourierIntegral ψ μ (LinearMap.mul F F) f (-x)) s) ∧
          ∀ s₀ : ℂ, (fun s => Zhat (1 - s)) =ᶠ[𝓝[≠] s₀] fun s => γ s * Z s := by
  sorry

/-- AL.1.3.2 at the real and complex places: meromorphic continuation and one gamma factor for
every native Schwartz function. -/
theorem archimedeanLocalFunctionalEquation {F : Type*} [RCLike F]
    [MeasurableSpace F] [BorelSpace F]
    (μ : Measure F) [μ.IsAddHaarMeasure] (ν : Measure Fˣ) [ν.IsHaarMeasure]
    (ψ : AddChar F Circle) (hψ : Continuous ψ) (hψ1 : ψ ≠ 1)
    (a : F → ℝ) (ha : Continuous a) (hapos : ∀ x ≠ 0, 0 < a x)
    (hmod : ∀ (x : F) (U : Set F), MeasurableSet U →
      μ ((x * ·) '' U) = ENNReal.ofReal (a x) * μ U)
    (χ : Fˣ →ₜ* ℂˣ) (r : ℝ) (hχ : ∀ x : Fˣ, ‖(χ x : ℂ)‖ = (a x)^r) :
    ∃ γ : ℂ → ℂ, MeromorphicOn γ Set.univ ∧
      (∃ s : ℂ, AnalyticAt ℂ γ s ∧ γ s ≠ 0) ∧
      ∀ f : SchwartzMap F ℂ,
        ∃ Z Zhat : ℂ → ℂ, MeromorphicOn Z Set.univ ∧ MeromorphicOn Zhat Set.univ ∧
          (∀ s : ℂ, 0 < s.re + r →
            Integrable (fun x : Fˣ => f x * (χ x : ℂ) * (a x : ℂ)^s) ν ∧
            Z s = localZetaIntegral ν a χ f s) ∧
          (∀ s : ℂ, r < s.re →
            Integrable (fun x : Fˣ =>
              VectorFourier.fourierIntegral ψ μ (LinearMap.mul F F) f (-x) *
                ((χ x)⁻¹ : ℂ) * (a x : ℂ)^s) ν ∧
            Zhat s = localZetaIntegral ν a χ⁻¹
              (fun x => VectorFourier.fourierIntegral ψ μ (LinearMap.mul F F) f (-x)) s) ∧
          ∀ s₀ : ℂ, (fun s => Zhat (1 - s)) =ᶠ[𝓝[≠] s₀] fun s => γ s * Z s := by
  sorry

/-- Nonarchimedean Schwartz functions on native locally constant functions. -/
def finiteSchwartzSpace (F : Type*) [TopologicalSpace F] : Submodule ℂ (LocallyConstant F ℂ) where
  carrier := {f | HasCompactSupport f}
  zero_mem' := HasCompactSupport.zero
  add_mem' := by intro f g hf hg; exact hf.add hg
  smul_mem' := by
    intro c f hf
    change HasCompactSupport (fun x => c * f x)
    exact HasCompactSupport.mul_left hf

/-- Inverse scalar pullback preserves compactly supported locally constant functions. -/
def finitePullback {F : Type*} [Field F] [TopologicalSpace F] [IsTopologicalRing F]
    (a : Fˣ) (f : finiteSchwartzSpace F) : finiteSchwartzSpace F :=
  ⟨LocallyConstant.comap
      ⟨Homeomorph.mulLeft₀ (a⁻¹ : Fˣ).val (Units.ne_zero _),
        (Homeomorph.mulLeft₀ (a⁻¹ : Fˣ).val (Units.ne_zero _)).continuous⟩ f.val,
    f.property.comp_homeomorph (Homeomorph.mulLeft₀ (a⁻¹ : Fˣ).val (Units.ne_zero _))⟩

/-- The scalar eigenspace in the algebraic dual of the finite-place Schwartz space. -/
def finiteEigenSpace {F : Type*} [Field F] [TopologicalSpace F] [IsTopologicalRing F]
    (χ : Fˣ →ₜ* ℂˣ) : Submodule ℂ (Module.Dual ℂ (finiteSchwartzSpace F)) where
  carrier := {T | ∀ a f, T (finitePullback a f) = (χ a : ℂ) * T f}
  zero_mem' := by simp
  add_mem' := by
    intro T S hT hS a f
    change T (finitePullback a f) + S (finitePullback a f) = (χ a : ℂ) * (T f + S f)
    rw [hT a f, hS a f, mul_add]
  smul_mem' := by
    intro c T hT a f
    change c * T (finitePullback a f) = _
    rw [hT a f]
    simp [mul_left_comm]

/-- Finite-place local uniqueness for every continuous quasi-character. -/
theorem finiteEigenSpace_finrank {F : Type*} [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] (χ : Fˣ →ₜ* ℂˣ) :
    Module.finrank ℂ (finiteEigenSpace χ) = 1 := by
  sorry

end TateZeta

/-! ## Layer AL.2: Godement–Jacquet standard functions -/

namespace AL2

open Matrix
open scoped ValuativeRel

/-- Matrices whose last row is the last standard basis row; with `newformK1` and `newformLocalK1`
it gives the last-row level subgroups of the `GL₂` newvector theorem (AL.2.2) and of the generic
newform theorem `AL3.genericNewform` (AL.3.3.5). -/
def lastRowStabilizer {R : Type*} [CommRing R] (n : ℕ) :
    Subgroup (GeneralLinearGroup (Fin (n+1)) R) where
  carrier := {g | ∀ j, g (Fin.last n) j = if Fin.last n = j then 1 else 0}
  one_mem' := by intro j; simp [Matrix.one_apply]
  mul_mem' := by
    intro g h hg hh j
    change ∀ j, g (Fin.last n) j = if Fin.last n = j then 1 else 0 at hg
    change ∀ j, h (Fin.last n) j = if Fin.last n = j then 1 else 0 at hh
    change (g.val * h.val) (Fin.last n) j = _
    simp [Matrix.mul_apply, hg, hh]
  inv_mem' := by
    intro g hg j
    change ∀ j, g (Fin.last n) j = if Fin.last n = j then 1 else 0 at hg
    have h := congrArg (fun M : Matrix (Fin (n+1)) (Fin (n+1)) R => M (Fin.last n) j) g.val_inv
    simpa [Matrix.mul_apply, hg, Matrix.one_apply] using h

/-- The last-row congruence subgroup, defined by reduction modulo the ideal. -/
def newformK1 {R : Type*} [CommRing R] (n : ℕ) (I : Ideal R) :
    Subgroup (GeneralLinearGroup (Fin (n+1)) R) :=
  (lastRowStabilizer n).comap (GeneralLinearGroup.map (Ideal.Quotient.mk I))

/-- Integral last-row level embedded in the local general linear group. -/
def newformLocalK1 (F : Type*) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] (n c : ℕ) :
    Subgroup (GeneralLinearGroup (Fin (n+1)) F) :=
  (newformK1 n (𝓂[F] ^ c)).map (GeneralLinearGroup.map (algebraMap 𝒪[F] F))

/-- The trace pairing `(X, Y) ↦ tr(XY)` on square matrices, as an `F`-bilinear map; the Fourier
transform of AL.2.1.5 is taken against it. -/
def tracePairing (F : Type*) [Field F] (n : ℕ) :
    Matrix (Fin n) (Fin n) F →ₗ[F] Matrix (Fin n) (Fin n) F →ₗ[F] F :=
  LinearMap.mk₂ F (fun X Y => (X * Y).trace)
    (fun X X' Y => by simp [Matrix.add_mul, Matrix.trace_add])
    (fun c X Y => by simp [Matrix.trace_smul])
    (fun X Y Y' => by simp [Matrix.mul_add, Matrix.trace_add])
    (fun c X Y => by simp [Matrix.trace_smul])

/-- AL.2.1.2: the Godement–Jacquet zeta integral `Z(s, β, Φ)` of a coefficient function `β` on
`GL_{n+1}(F)` and a test function `Φ` on `(n+1) × (n+1)` matrices, against a Haar measure `ν`,
with the modulus `a` of `F` and the determinant exponent `s + n/2` of rank `n + 1`. -/
def gjZetaIntegral {F : Type*} [Field F] [MeasurableSpace F] (n : ℕ)
    (ν : Measure (GeneralLinearGroup (Fin (n+1)) F)) (a : F → ℝ)
    (β : GeneralLinearGroup (Fin (n+1)) F → ℂ)
    (Φ : Matrix (Fin (n+1)) (Fin (n+1)) F → ℂ) (s : ℂ) : ℂ :=
  ∫ g, β g * Φ g.val * (a g.val.det : ℂ) ^ (s + (n : ℂ) / 2) ∂ν

/-- AL.2.1.4–AL.2.1.5, the local Godement–Jacquet theorem at a finite place in every rank
(Godement–Jacquet, Theorem 3.3): for an irreducible smooth admissible `π` of `GL_{n+1}(F)` there
are polynomials `P_π`, `P_{π∨}` with constant term 1, an abscissa `c` and a nonzero monomial
`ε q^{-ks}` such that for every smooth matrix coefficient `β(g) = ℓ(π(g)v)` and every locally
constant compactly supported `Φ` the integral converges for `Re s > c`, continues meromorphically,
`Z(s,β,Φ) P_π(q^{-s})` is a Laurent polynomial in `q^{-s}`, and the functional equation
`Z(1−s, β̌, Φ̂) P_{π∨}(q^{s−1}) = ε q^{-ks} Z(s,β,Φ) P_π(q^{-s})` holds with `β̌(g) = β(g⁻¹)` and
`Φ̂(Y) = ∫ Φ(X) ψ(tr(XY)) dX`, the positive-kernel transform obtained from the negative-kernel
`fourierIntegral` at `−Y`; and at every `s₀` some `Z P_π(q^{-s})` is nonzero, so the
`ℂ[q^s, q^{-s}]`-span of the continued integrals is the fractional ideal generated by
`L(s,π) = P_π(q^{-s})^{-1}`. The modulus `a` is pinned by the scaling of an additive Haar
measure of `F`, as in the rank-one theorem; `ε` depends on `ψ` and on the additive Haar measure
`μ` of the transform, and is the README's `ε(s,π,ψ)` when `μ` is self-dual for `ψ ∘ tr`. The
rank-one theorem `TateZeta.localZetaIntegral_functionalEquation` is the case `n = 0`. -/
theorem godementJacquetLocal {F V : Type*} [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] [MeasurableSpace F] [BorelSpace F]
    [AddCommGroup V] [Module ℂ V] (n : ℕ)
    (π : Representation ℂ (GeneralLinearGroup (Fin (n+1)) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin (n+1)) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin (n+1)) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin (n+1)) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (μF : Measure F) [μF.IsAddHaarMeasure]
    (μ : Measure (Matrix (Fin (n+1)) (Fin (n+1)) F)) [μ.IsAddHaarMeasure]
    (ν : Measure (GeneralLinearGroup (Fin (n+1)) F)) [ν.IsHaarMeasure]
    (ψ : AddChar F Circle) (hψ : Continuous ψ) (hψ1 : ψ ≠ 1)
    (a : F → ℝ) (ha : Continuous a) (hapos : ∀ x ≠ 0, 0 < a x)
    (hmod : ∀ (x : F) (U : Set F), MeasurableSet U →
      μF ((x * ·) '' U) = ENNReal.ofReal (a x) * μF U) :
    ∃ (P Pd : Polynomial ℂ) (c : ℝ) (ε : ℂ) (k : ℤ),
      P.eval 0 = 1 ∧ Pd.eval 0 = 1 ∧ ε ≠ 0 ∧
      (∀ (v : V) (ℓ : Module.Dual ℂ V), IsOpen {g | ∀ w, ℓ (π g w) = ℓ w} →
        ∀ Φ : Matrix (Fin (n+1)) (Fin (n+1)) F → ℂ, IsLocallyConstant Φ → HasCompactSupport Φ →
        ∃ Z Zd : ℂ → ℂ, MeromorphicOn Z Set.univ ∧ MeromorphicOn Zd Set.univ ∧
          (∀ s : ℂ, c < s.re →
            Integrable (fun g : GeneralLinearGroup (Fin (n+1)) F =>
              ℓ (π g v) * Φ g.val * (a g.val.det : ℂ) ^ (s + (n : ℂ) / 2)) ν ∧
            Z s = gjZetaIntegral n ν a (fun g => ℓ (π g v)) Φ s) ∧
          (∀ s : ℂ, c < s.re →
            Integrable (fun g : GeneralLinearGroup (Fin (n+1)) F =>
              ℓ (π g⁻¹ v) *
                VectorFourier.fourierIntegral ψ μ (tracePairing F (n+1)) Φ (-g.val) *
                (a g.val.det : ℂ) ^ (s + (n : ℂ) / 2)) ν ∧
            Zd s = gjZetaIntegral n ν a (fun g => ℓ (π g⁻¹ v))
              (fun X => VectorFourier.fourierIntegral ψ μ (tracePairing F (n+1)) Φ (-X)) s) ∧
          (∃ (Q : Polynomial ℂ) (m : ℕ), ∀ s : ℂ, c < s.re →
            Z s * P.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s)) * ((Nat.card 𝓀[F] : ℂ) ^ (-s)) ^ m =
              Q.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s))) ∧
          ∀ s₀ : ℂ, (fun s => Zd (1 - s) * Pd.eval ((Nat.card 𝓀[F] : ℂ) ^ (s - 1)))
            =ᶠ[𝓝[≠] s₀] fun s => ε * ((Nat.card 𝓀[F] : ℂ) ^ (-s)) ^ k *
              Z s * P.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s))) ∧
      ∀ s₀ : ℂ, ∃ (v : V) (ℓ : Module.Dual ℂ V) (Φ : Matrix (Fin (n+1)) (Fin (n+1)) F → ℂ)
        (Q : Polynomial ℂ) (m : ℕ),
        IsOpen {g | ∀ w, ℓ (π g w) = ℓ w} ∧ IsLocallyConstant Φ ∧ HasCompactSupport Φ ∧
        (∀ s : ℂ, c < s.re →
          gjZetaIntegral n ν a (fun g => ℓ (π g v)) Φ s * P.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s)) *
            ((Nat.card 𝓀[F] : ℂ) ^ (-s)) ^ m = Q.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s))) ∧
        Q.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s₀)) ≠ 0 := by
  sorry

end AL2

/-! ### Layer AL.2: GL₂ newvectors -/

namespace GL2Blueprint
open _root_.Matrix
open scoped ValuativeRel
variable {F : Type*} [Field F] [ValuativeRel F]
  [TopologicalSpace F] [IsNonarchimedeanLocalField F]
variable {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]

/-- Rank two of the last-row level used by the all-rank generic newform theorem. -/
abbrev localK1 (F : Type*) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] (c : ℕ) :
    Subgroup (GeneralLinearGroup (Fin 2) F) :=
  AL2.newformLocalK1 F 1 c

/-- The least nonzero fixed level of a representation with an explicitly nonempty level set. -/
def conductorExponent (ρ : Representation ℂ G V) (K : ℕ → Subgroup G)
    (hex : ∃ n, ∃ v ∈ (Representation.invariants (ρ.comp (K n).subtype)), v ≠ 0) : ℕ := by
  classical
  exact Nat.find hex

/-- Casselman, Theorem 1 and its proof, pp. 302–306, in the last-row
convention of the README. Infinite dimensionality excludes determinant
characters. No conductor or nonempty-level hypothesis is assumed. -/
theorem newvectorLevelExists
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V) :
    ∃ n, ∃ v ∈ Representation.invariants (π.comp (localK1 F n).subtype),
      v ≠ 0 := by sorry

/-- The complete dimension formula, not an assumption that a fixed line exists.
Natural subtraction expresses max(0, n-c+1). Casselman, Corollary to the
Proof, p. 306; apply his top-left convention to the contragredient and twist
back to obtain the lower-last-row subgroup used here. -/
theorem casselmanNewvector
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V) (n : ℕ) :
    Module.finrank ℂ (Representation.invariants (π.comp (localK1 F n).subtype)) =
      n + 1 - conductorExponent π (localK1 F)
        (newvectorLevelExists π hsm hadm hinf) := by sorry

end GL2Blueprint

/-! ## Layer AL.3: Whittaker functionals, local Rankin–Selberg theory and newforms -/

namespace AL3
open _root_.Matrix
open scoped ValuativeRel

/-- The `ψ_N`-Whittaker functionals on a representation `π` of `GL_{n+1}(F)`: the linear
functionals `ℓ` with `ℓ(π(u)v) = ψ(Σᵢ u_{i,i+1}) ℓ(v)` for every upper unitriangular `u`, the
character `ψ_N` of the upper unipotent subgroup being the sum of the superdiagonal entries
composed with `ψ`. For `n = 0` the unipotent subgroup is trivial and this is the whole dual. -/
def whittakerFunctionals {F V : Type*} [Field F] [AddCommGroup V] [Module ℂ V] (n : ℕ)
    (π : Representation ℂ (GeneralLinearGroup (Fin (n+1)) F) V) (ψ : AddChar F Circle) :
    Submodule ℂ (Module.Dual ℂ V) where
  carrier := {ell | ∀ (u : GeneralLinearGroup (Fin (n+1)) F),
      (∀ i j, j < i → u i j = 0) → (∀ i, u i i = 1) →
      ∀ v : V, ell (π u v) = (ψ (∑ i : Fin n, u i.castSucc i.succ) : ℂ) * ell v}
  zero_mem' := by intro u _ _ v; simp
  add_mem' := by
    intro a b ha hb u hu1 hu2 v
    simp only [Set.mem_ofPred_eq] at ha hb
    simp [ha u hu1 hu2 v, hb u hu1 hu2 v, mul_add]
  smul_mem' := by
    intro c a ha u hu1 hu2 v
    simp only [Set.mem_ofPred_eq] at ha
    simp [ha u hu1 hu2 v, mul_left_comm]

/-- AL.3.1.1, local Whittaker uniqueness (Bernstein–Zelevinsky, Theorem 5.16; Gelfand–Kazhdan):
for every irreducible smooth admissible representation of `GL_{n+1}(F)` over a nonarchimedean
local field and every nontrivial continuous additive character `ψ`, the space of
`ψ_N`-Whittaker functionals has rank at most one. The rank, not the finite rank, is bounded,
since the finite rank of an infinite-dimensional space is zero. -/
theorem whittakerUniqueness {F V : Type*} [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [AddCommGroup V] [Module ℂ V] (n : ℕ)
    (π : Representation ℂ (GeneralLinearGroup (Fin (n+1)) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin (n+1)) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin (n+1)) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin (n+1)) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (ψ : AddChar F Circle) (hψ : Continuous ψ) (hψ1 : ψ ≠ 1) :
    Module.rank ℂ (whittakerFunctionals n π ψ) ≤ 1 := by
  sorry

/-- The upper unitriangular subgroup `N_n(F)` of `GL_n(F)`, the subgroup of the Whittaker
character `ψ_N`. The local Rankin–Selberg integrals are taken over `N_n(F)\GL_n(F)`. -/
def upperUnitriangular (F : Type*) [Field F] (n : ℕ) :
    Subgroup (GeneralLinearGroup (Fin n) F) where
  carrier := {u | (∀ i j, j < i → u i j = 0) ∧ ∀ i, u i i = 1}
  one_mem' := ⟨fun i j h => by simp [h.ne'], fun i => by simp⟩
  mul_mem' := by
    rintro u v ⟨hu, hu1⟩ ⟨hv, hv1⟩
    refine ⟨fun i j hji => ?_, fun i => ?_⟩
    · change (u.val * v.val) i j = 0
      rw [Matrix.mul_apply]
      refine Finset.sum_eq_zero fun l _ => ?_
      rcases lt_or_ge l i with h | h
      · simp [hu i l h]
      · simp [hv l j (lt_of_lt_of_le hji h)]
    · change (u.val * v.val) i i = 1
      rw [Matrix.mul_apply, Finset.sum_eq_single i]
      · simp [hu1 i, hv1 i]
      · intro l _ hl
        rcases lt_or_gt_of_ne hl with h | h
        · simp [hu i l h]
        · simp [hv l i h]
      · simp
  inv_mem' := by
    rintro u ⟨hu, hu1⟩
    have htri : (u.val).BlockTriangular id := fun i j h => hu i j h
    have hinv : ((u⁻¹ : GeneralLinearGroup (Fin n) F).val).BlockTriangular id := by
      rw [Matrix.coe_units_inv]
      have : Invertible u.val := Units.invertible u
      exact Matrix.blockTriangular_inv_of_blockTriangular htri
    refine ⟨fun i j h => hinv h, fun i => ?_⟩
    have h1 : (u.val * (u⁻¹ : GeneralLinearGroup (Fin n) F).val) i i = 1 := by simp
    rw [Matrix.mul_apply, Finset.sum_eq_single i] at h1
    · simpa [hu1 i] using h1
    · intro l _ hl
      rcases lt_or_gt_of_ne hl with h | h
      · simp [hu i l h]
      · simp [hinv h]
    · simp

/-- The block matrix `[[h, 0, 0], [x, I_j, 0], [0, 0, I_{k+1−j}]]` of `GL_{m+k+2}(F)`, for
`h ∈ GL_{m+1}(F)` and a `j × (m+1)` matrix `x` (`j ≤ k+1`): the argument of the first Whittaker
function in the local Rankin–Selberg integral `Ψ_j` of `GL_{m+k+2} × GL_{m+1}`. At `j = 0` it is
`diag(h, I_{k+1})`. -/
def rsEmbedding {F : Type*} [Field F] (m k j : ℕ) (h : GeneralLinearGroup (Fin (m+1)) F)
    (x : Matrix (Fin j) (Fin (m+1)) F) : GeneralLinearGroup (Fin (m+k+1+1)) F :=
  let e : Fin (m+1) ⊕ Fin (k+1) ≃ Fin (m+k+1+1) := finSumFinEquiv.trans (finCongr (by omega))
  let X : Matrix (Fin (k+1)) (Fin (m+1)) F :=
    fun i l => if hi : (i : ℕ) < j then x ⟨i, hi⟩ l else 0
  { val := reindexAlgEquiv F F e (fromBlocks h.val 0 X 1)
    inv := reindexAlgEquiv F F e (fromBlocks (h⁻¹ : GeneralLinearGroup _ F).val 0
      (-(X * (h⁻¹ : GeneralLinearGroup _ F).val)) 1)
    val_inv := by
      rw [← map_mul, fromBlocks_multiply]
      simp
    inv_val := by
      rw [← map_mul, fromBlocks_multiply]
      simp [Matrix.mul_assoc] }

/-- The long Weyl element `w_n` of `GL_n(F)`, the antidiagonal permutation matrix. -/
def longWeyl (F : Type*) [Field F] (n : ℕ) : GeneralLinearGroup (Fin n) F :=
  (Matrix.permMatrixHom (R := F)).toHomUnits Fin.revPerm

/-- The Weyl element `w_{n,m} = diag(I_{m+1}, w_{k+1})` of `GL_{m+k+2}(F)`, `n = m+k+2`, by which
the dual Whittaker function is translated in the unequal-rank local functional equation. -/
def rsWeyl (F : Type*) [Field F] (m k : ℕ) : GeneralLinearGroup (Fin (m+k+1+1)) F :=
  let e : Fin (m+1) ⊕ Fin (k+1) ≃ Fin (m+k+1+1) := finSumFinEquiv.trans (finCongr (by omega))
  { val := reindexAlgEquiv F F e (fromBlocks 1 0 0 (longWeyl F (k+1)).val)
    inv := reindexAlgEquiv F F e
      (fromBlocks 1 0 0 ((longWeyl F (k+1))⁻¹ : GeneralLinearGroup _ F).val)
    val_inv := by
      rw [← map_mul, fromBlocks_multiply]
      simp
    inv_val := by
      rw [← map_mul, fromBlocks_multiply]
      simp }

/-- AL.3.2.1, the integrand of the unequal-rank local Rankin–Selberg integral
`Ψ_j(s; W, W′) = ∫_{N_{m+1}\GL_{m+1}} ∫_{Mat_{j×(m+1)}} W([[h,0,0],[x,I_j,0],[0,0,I]]) W′(h)
|det h|^(s−(k+1)/2) dx dh` of `GL_{m+k+2} × GL_{m+1}`, with `a` the modulus of `F`. The quotient
`N\GL` is realized on the left coset space `GL ⧸ N` through `h = y⁻¹` for a representative `y`;
for Whittaker functions `W`, `W′` with opposite characters the integrand is left `N`-invariant in
`h`, so it does not depend on the representative. -/
def rsIntegrand {F : Type*} [Field F] (m k j : ℕ) (a : F → ℝ)
    (W : GeneralLinearGroup (Fin (m+k+1+1)) F → ℂ) (W' : GeneralLinearGroup (Fin (m+1)) F → ℂ)
    (s : ℂ)
    (p : (GeneralLinearGroup (Fin (m+1)) F ⧸ upperUnitriangular F (m+1)) ×
      Matrix (Fin j) (Fin (m+1)) F) : ℂ :=
  W (rsEmbedding m k j (p.1.out)⁻¹ p.2) * W' (p.1.out)⁻¹ *
    (a ((p.1.out)⁻¹ : GeneralLinearGroup (Fin (m+1)) F).val.det : ℂ) ^ (s - ((k : ℂ) + 1) / 2)

/-- AL.3.2.1, the integrand of the equal-rank local Rankin–Selberg integral
`Ψ(s; W, W′, Φ) = ∫_{N_{m+1}\GL_{m+1}} W(h) W′(h) Φ(e_{m+1} h) |det h|^s dh`, where
`e_{m+1} h` is the last row of `h`, with the quotient realized as in `rsIntegrand`. -/
def rsIntegrandEqualRank {F : Type*} [Field F] (m : ℕ) (a : F → ℝ)
    (W W' : GeneralLinearGroup (Fin (m+1)) F → ℂ) (Φ : (Fin (m+1) → F) → ℂ) (s : ℂ)
    (y : GeneralLinearGroup (Fin (m+1)) F ⧸ upperUnitriangular F (m+1)) : ℂ :=
  W (y.out)⁻¹ * W' (y.out)⁻¹ *
    Φ (fun l => ((y.out)⁻¹ : GeneralLinearGroup (Fin (m+1)) F) (Fin.last m) l) *
    (a ((y.out)⁻¹ : GeneralLinearGroup (Fin (m+1)) F).val.det : ℂ) ^ s

/-- AL.3.2.3 and AL.3.3.2 at a finite place for unequal ranks, the local Rankin–Selberg theorem
of Jacquet–Piatetski-Shapiro–Shalika for `GL_{m+k+2} × GL_{m+1}` (Cogdell, Fields lectures,
Lecture 6, Proposition 6.2, Theorem 6.1, Corollary 6.3.1, Theorem 6.2 and Proposition 6.5,
pp.47–49). Let `π`, `π′` be irreducible smooth admissible with nonzero Whittaker functionals `ℓ`
for `ψ` and `ℓ′` for `ψ⁻¹`, so that `W(g) = ℓ(π(g)v)` and `W′(h) = ℓ′(π′(h)v′)` run over the
Whittaker models `W(π, ψ)` and `W(π′, ψ⁻¹)`. Then there are polynomials `P = L(s, π×π′)⁻¹` and
`Pd = L(s, π∨×π′∨)⁻¹` in `q^(−s)` with constant term 1, an abscissa `c` and a nonzero monomial
`ε q^(−es)` such that: for every `0 ≤ j ≤ k` each integral `Ψ_j` converges absolutely for
`Re s > c` and continues meromorphically, `Ψ_j · P(q^(−s))` is a Laurent polynomial in `q^(−s)`,
and at every `s₀` one of these products is nonzero, so that the span of the `Ψ_j` is the
fractional ideal generated by `L(s, π×π′)`, for every `j`; and
`Ψ_k(1−s; R(w_{n,m})W̃, W̃′) Pd(q^(s−1)) = ε q^(−es) Ψ_0(s; W, W′) P(q^(−s))` as germs, with
`W̃(g) = W(w_n ᵗg⁻¹)` and `R` right translation. The quotient measure `μ` on `GL_{m+1} ⧸ N` is
any nonzero invariant measure finite on compacts and `μx j` any additive Haar measure on
`j × (m+1)` matrices; the scalar `ε` absorbs the sign `ω_{π′}(−1)^(n−1)` of the source and
depends on `ψ` and on these measures. -/
theorem rankinSelbergLocal {F V V' : Type*} [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] [MeasurableSpace F] [BorelSpace F]
    [AddCommGroup V] [Module ℂ V] [AddCommGroup V'] [Module ℂ V'] (m k : ℕ)
    (π : Representation ℂ (GeneralLinearGroup (Fin (m+k+1+1)) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin (m+k+1+1)) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin (m+k+1+1)) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin (m+k+1+1)) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (π' : Representation ℂ (GeneralLinearGroup (Fin (m+1)) F) V')
    [Representation.IsIrreducible π']
    (hsm' : ∀ v : V', IsOpen {g | π' g v = v})
    (hadm' : ∀ K : Subgroup (GeneralLinearGroup (Fin (m+1)) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin (m+1)) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin (m+1)) F)) →
      FiniteDimensional ℂ (Representation.invariants (π'.comp K.subtype)))
    (ψ : AddChar F Circle) (hψ : Continuous ψ) (hψ1 : ψ ≠ 1)
    (ell : Module.Dual ℂ V) (hell : ell ∈ whittakerFunctionals (m+k+1) π ψ) (hell0 : ell ≠ 0)
    (ell' : Module.Dual ℂ V') (hell' : ell' ∈ whittakerFunctionals m π' ψ⁻¹)
    (hell'0 : ell' ≠ 0)
    (μF : Measure F) [μF.IsAddHaarMeasure]
    (μ : Measure (GeneralLinearGroup (Fin (m+1)) F ⧸ upperUnitriangular F (m+1)))
    [SMulInvariantMeasure (GeneralLinearGroup (Fin (m+1)) F)
      (GeneralLinearGroup (Fin (m+1)) F ⧸ upperUnitriangular F (m+1)) μ]
    [IsFiniteMeasureOnCompacts μ] (hμ : μ ≠ 0)
    (μx : ∀ j : ℕ, Measure (Matrix (Fin j) (Fin (m+1)) F)) [∀ j, (μx j).IsAddHaarMeasure]
    (a : F → ℝ) (ha : Continuous a) (hapos : ∀ x ≠ 0, 0 < a x)
    (hmod : ∀ (x : F) (U : Set F), MeasurableSet U →
      μF ((x * ·) '' U) = ENNReal.ofReal (a x) * μF U) :
    ∃ (P Pd : Polynomial ℂ) (c : ℝ) (ε : ℂ) (e : ℤ),
      P.eval 0 = 1 ∧ Pd.eval 0 = 1 ∧ ε ≠ 0 ∧
      (∀ j ≤ k, ∀ (v : V) (v' : V'), ∃ Z : ℂ → ℂ, MeromorphicOn Z Set.univ ∧
        (∀ s : ℂ, c < s.re →
          Integrable (rsIntegrand m k j a (fun g => ell (π g v)) (fun h => ell' (π' h v')) s)
            (μ.prod (μx j)) ∧
          Z s = ∫ p, rsIntegrand m k j a (fun g => ell (π g v)) (fun h => ell' (π' h v')) s p
            ∂(μ.prod (μx j))) ∧
        ∃ (Q : Polynomial ℂ) (N : ℕ), ∀ s : ℂ, c < s.re →
          Z s * P.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s)) * ((Nat.card 𝓀[F] : ℂ) ^ (-s)) ^ N =
            Q.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s))) ∧
      (∀ j ≤ k, ∀ s₀ : ℂ, ∃ (v : V) (v' : V') (Q : Polynomial ℂ) (N : ℕ),
        (∀ s : ℂ, c < s.re →
          (∫ p, rsIntegrand m k j a (fun g => ell (π g v)) (fun h => ell' (π' h v')) s p
            ∂(μ.prod (μx j))) * P.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s)) *
            ((Nat.card 𝓀[F] : ℂ) ^ (-s)) ^ N = Q.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s))) ∧
        Q.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s₀)) ≠ 0) ∧
      ∀ (v : V) (v' : V'), ∃ Z Zd : ℂ → ℂ,
        MeromorphicOn Z Set.univ ∧ MeromorphicOn Zd Set.univ ∧
        (∀ s : ℂ, c < s.re →
          Z s = ∫ p, rsIntegrand m k 0 a (fun g => ell (π g v)) (fun h => ell' (π' h v')) s p
            ∂(μ.prod (μx 0))) ∧
        (∀ s : ℂ, c < s.re →
          Integrable (rsIntegrand m k k a
              (fun g => ell (π (longWeyl F (m+k+1+1) *
                ((GeneralLinearGroup.transposeMulEquiv _ (g * rsWeyl F m k)).unop)⁻¹) v))
              (fun h => ell' (π' (longWeyl F (m+1) *
                ((GeneralLinearGroup.transposeMulEquiv _ h).unop)⁻¹) v')) s)
            (μ.prod (μx k)) ∧
          Zd s = ∫ p, rsIntegrand m k k a
              (fun g => ell (π (longWeyl F (m+k+1+1) *
                ((GeneralLinearGroup.transposeMulEquiv _ (g * rsWeyl F m k)).unop)⁻¹) v))
              (fun h => ell' (π' (longWeyl F (m+1) *
                ((GeneralLinearGroup.transposeMulEquiv _ h).unop)⁻¹) v')) s p
            ∂(μ.prod (μx k))) ∧
        ∀ s₀ : ℂ, (fun s => Zd (1 - s) * Pd.eval ((Nat.card 𝓀[F] : ℂ) ^ (s - 1)))
          =ᶠ[𝓝[≠] s₀] fun s => ε * ((Nat.card 𝓀[F] : ℂ) ^ (-s)) ^ e *
            Z s * P.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s)) := by
  sorry

/-- AL.3.2.3 and AL.3.3.2 at a finite place for equal ranks, the local Rankin–Selberg theorem
for `GL_{m+1} × GL_{m+1}` (Cogdell, Columbia lectures, §1.3, facts 1–4, pp.7–8). With `π`, `π′`,
`ℓ`, `ℓ′` as in `rankinSelbergLocal`, there are polynomials `P = L(s, π×π′)⁻¹` and
`Pd = L(s, π∨×π′∨)⁻¹` in `q^(−s)` with constant term 1, an abscissa `c` and a nonzero monomial
`ε q^(−es)` such that for every locally constant compactly supported `Φ` on `F^{m+1}` the integral
`Ψ(s; W, W′, Φ)` converges absolutely for `Re s > c`, continues meromorphically,
`Ψ · P(q^(−s))` is a Laurent polynomial in `q^(−s)`, one such product is nonzero at every `s₀`,
and `Ψ(1−s; W̃, W̃′, Φ̂) Pd(q^(s−1)) = ε q^(−es) Ψ(s; W, W′, Φ) P(q^(−s))` as germs, with
`W̃(g) = W(w_{m+1} ᵗg⁻¹)` and `Φ̂(y) = ∫ Φ(x) ψ(x·y) dx`, the positive-kernel transform obtained
from the negative-kernel `fourierIntegral` at `−y`. The scalar `ε` absorbs the sign
`ω_{π′}(−1)^m` of the source and depends on `ψ` and on the measures `μ` and `μv`. -/
theorem rankinSelbergLocalEqualRank {F V V' : Type*} [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] [MeasurableSpace F] [BorelSpace F]
    [AddCommGroup V] [Module ℂ V] [AddCommGroup V'] [Module ℂ V'] (m : ℕ)
    (π : Representation ℂ (GeneralLinearGroup (Fin (m+1)) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin (m+1)) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin (m+1)) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin (m+1)) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (π' : Representation ℂ (GeneralLinearGroup (Fin (m+1)) F) V')
    [Representation.IsIrreducible π']
    (hsm' : ∀ v : V', IsOpen {g | π' g v = v})
    (hadm' : ∀ K : Subgroup (GeneralLinearGroup (Fin (m+1)) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin (m+1)) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin (m+1)) F)) →
      FiniteDimensional ℂ (Representation.invariants (π'.comp K.subtype)))
    (ψ : AddChar F Circle) (hψ : Continuous ψ) (hψ1 : ψ ≠ 1)
    (ell : Module.Dual ℂ V) (hell : ell ∈ whittakerFunctionals m π ψ) (hell0 : ell ≠ 0)
    (ell' : Module.Dual ℂ V') (hell' : ell' ∈ whittakerFunctionals m π' ψ⁻¹)
    (hell'0 : ell' ≠ 0)
    (μF : Measure F) [μF.IsAddHaarMeasure]
    (μv : Measure (Fin (m+1) → F)) [μv.IsAddHaarMeasure]
    (μ : Measure (GeneralLinearGroup (Fin (m+1)) F ⧸ upperUnitriangular F (m+1)))
    [SMulInvariantMeasure (GeneralLinearGroup (Fin (m+1)) F)
      (GeneralLinearGroup (Fin (m+1)) F ⧸ upperUnitriangular F (m+1)) μ]
    [IsFiniteMeasureOnCompacts μ] (hμ : μ ≠ 0)
    (a : F → ℝ) (ha : Continuous a) (hapos : ∀ x ≠ 0, 0 < a x)
    (hmod : ∀ (x : F) (U : Set F), MeasurableSet U →
      μF ((x * ·) '' U) = ENNReal.ofReal (a x) * μF U) :
    ∃ (P Pd : Polynomial ℂ) (c : ℝ) (ε : ℂ) (e : ℤ),
      P.eval 0 = 1 ∧ Pd.eval 0 = 1 ∧ ε ≠ 0 ∧
      (∀ (v : V) (v' : V') (Φ : (Fin (m+1) → F) → ℂ), IsLocallyConstant Φ →
        HasCompactSupport Φ →
        ∃ Z Zd : ℂ → ℂ, MeromorphicOn Z Set.univ ∧ MeromorphicOn Zd Set.univ ∧
          (∀ s : ℂ, c < s.re →
            Integrable (rsIntegrandEqualRank m a (fun g => ell (π g v))
              (fun h => ell' (π' h v')) Φ s) μ ∧
            Z s = ∫ y, rsIntegrandEqualRank m a (fun g => ell (π g v))
              (fun h => ell' (π' h v')) Φ s y ∂μ) ∧
          (∀ s : ℂ, c < s.re →
            Integrable (rsIntegrandEqualRank m a
              (fun g => ell (π (longWeyl F (m+1) *
                ((GeneralLinearGroup.transposeMulEquiv _ g).unop)⁻¹) v))
              (fun h => ell' (π' (longWeyl F (m+1) *
                ((GeneralLinearGroup.transposeMulEquiv _ h).unop)⁻¹) v'))
              (fun y => VectorFourier.fourierIntegral ψ μv (dotProductBilin F F) Φ (-y))
              s) μ ∧
            Zd s = ∫ y, rsIntegrandEqualRank m a
              (fun g => ell (π (longWeyl F (m+1) *
                ((GeneralLinearGroup.transposeMulEquiv _ g).unop)⁻¹) v))
              (fun h => ell' (π' (longWeyl F (m+1) *
                ((GeneralLinearGroup.transposeMulEquiv _ h).unop)⁻¹) v'))
              (fun y => VectorFourier.fourierIntegral ψ μv (dotProductBilin F F) Φ (-y))
              s y ∂μ) ∧
          (∃ (Q : Polynomial ℂ) (N : ℕ), ∀ s : ℂ, c < s.re →
            Z s * P.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s)) * ((Nat.card 𝓀[F] : ℂ) ^ (-s)) ^ N =
              Q.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s))) ∧
          ∀ s₀ : ℂ, (fun s => Zd (1 - s) * Pd.eval ((Nat.card 𝓀[F] : ℂ) ^ (s - 1)))
            =ᶠ[𝓝[≠] s₀] fun s => ε * ((Nat.card 𝓀[F] : ℂ) ^ (-s)) ^ e *
              Z s * P.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s))) ∧
      ∀ s₀ : ℂ, ∃ (v : V) (v' : V') (Φ : (Fin (m+1) → F) → ℂ) (Q : Polynomial ℂ) (N : ℕ),
        IsLocallyConstant Φ ∧ HasCompactSupport Φ ∧
        (∀ s : ℂ, c < s.re →
          (∫ y, rsIntegrandEqualRank m a (fun g => ell (π g v))
              (fun h => ell' (π' h v')) Φ s y ∂μ) * P.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s)) *
            ((Nat.card 𝓀[F] : ℂ) ^ (-s)) ^ N = Q.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s))) ∧
        Q.eval ((Nat.card 𝓀[F] : ℂ) ^ (-s₀)) ≠ 0 := by
  sorry

/-- AL.3.3.5, the generic newform line in every positive rank, on native representations: for an
irreducible smooth admissible `π` of `GL_{n+1}(F)` with a nonzero `ψ_N`-Whittaker functional, for
`ψ` trivial on `O` but not on `P⁻¹`, there is a least depth `c` with nonzero fixed vectors under
the last-row level `K₁(P^c)`, the fixed space there is a line, and the Whittaker functional is
nonzero on it (Jacquet–Piatetski-Shapiro–Shalika, *Conducteur*, Théorèmes (4)–(5), as recorded in
Humphries, Godement–Jacquet tests, Theorems 3.2 and 3.7). -/
theorem genericNewform {F V : Type*} [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [AddCommGroup V] [Module ℂ V] (n : ℕ)
    (π : Representation ℂ (GeneralLinearGroup (Fin (n+1)) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin (n+1)) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin (n+1)) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin (n+1)) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (ψ : AddChar F Circle) (hψ : Continuous ψ)
    (hψO : ∀ a : 𝒪[F], ψ (a : F) = 1)
    (hψp : ∃ x : F, (∀ a : 𝒪[F], a ∈ 𝓂[F] →
      x * (a : F) ∈ (𝒪[F] : Set F)) ∧ ψ x ≠ 1)
    (ell : Module.Dual ℂ V) (hell : ell ≠ 0) (hwhit : ell ∈ whittakerFunctionals n π ψ) :
    ∃ c : ℕ,
      (∀ m < c, Representation.invariants (π.comp (AL2.newformLocalK1 F n m).subtype) = ⊥) ∧
      Module.finrank ℂ
        (Representation.invariants (π.comp (AL2.newformLocalK1 F n c).subtype)) = 1 ∧
      ∃ v : Representation.invariants (π.comp (AL2.newformLocalK1 F n c).subtype),
        ell v.val ≠ 0 := by
  sorry

end AL3

end TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors
