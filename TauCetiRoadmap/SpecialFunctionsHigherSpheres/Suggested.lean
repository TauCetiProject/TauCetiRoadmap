module

public import Mathlib
public import TauCeti.RingTheory.MvPolynomial.Harmonic
public import TauCeti.RingTheory.MvPolynomial.Harmonic.Orthogonal
public import TauCeti.Analysis.MvPolynomial.Sphere
public import TauCeti.Topology.Algebra.UnitaryGroup
public import TauCeti.RepresentationTheory.Compact.Haar

/-!
# Spheres in higher dimension, `SO(n)` and `U(n)`: target signatures

This file states, against the pinned Mathlib and Tau Ceti, the targets of `README.md` that
carry a Lean name, each with every conclusion the README attaches to it. It is not an exhaustive
acceptance test: the other targets of the README have the same standing, stated in prose.
Discharging this file finishes neither a layer nor the roadmap.

Bold headlines of the README that are not stated here, and what each lacks:
* the decomposition, irreducibility and inequivalence of the `H^{p,q}` under `U(n)` (README 6.2)
  need an action of `U(n)` on polynomials in `z, z̄`, which neither Mathlib nor Tau Ceti has at
  the pin; the invariance used in 6.4 is stated pointwise;
* the Gel'fand–Tsetlin basis and the associated spherical functions (README 5.2) iterate
  `branchHarmonic` down a chain of dimensions and are stated in prose.

Prose bullets that name results owned elsewhere are not stated: the Fischer decomposition and
the dimension of the harmonic spaces (Tau Ceti), the spectral identification, orthogonality and
completeness of spherical harmonics and their irreducibility under `SO(n)` (RiemannianGeometry
R8), the Gegenbauer orthogonality (LaguerreJacobi §6.2), the small-`|z|` generating function
(SpecialFunctionsBessel §4.3) and Peter–Weyl (RepresentationTheory/CompactGroups §§5.4–5.5).

Local copies, each with a docstring naming its owner: `gegenbauer` (LaguerreJacobi §6.2,
`Polynomial.gegenbauer`) and `jacobi` (LaguerreJacobi §3.2, `Polynomial.jacobi`), verbatim;
`IsBiInvariant`, `conv`, `IsGelfandPair` and `IsSphericalFunction` (SpecialFunctionsGroupModels
§§5.1–5.2) and `SOn` (its §0.3), verbatim. Everything else is owned here.

The actions of `SOn n` on `ℝⁿ` and of `UnitaryMatrixGroup n` on `ℂⁿ`, and the measurable
structures of both groups, are Mathlib's: the action of a submonoid of matrices on
`EuclideanSpace`, for which `g • x = Matrix.toEuclideanLin g.1 x` holds by `rfl` (so it agrees
with `rotE` of SpecialFunctionsGroupModels §0.3), and the subtype Borel structure.

Theorems are stated with `sorry`. Section numbers in docstrings are those of the README.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsHigherSpheres

open MeasureTheory Polynomial Set
open scoped ComplexConjugate InnerProductSpace

/-! ## Local copies -/

/-- Local verbatim copy of `Polynomial.gegenbauer` of LaguerreJacobi §6.2: the Gegenbauer
polynomial `C_n^{(λ)}` by DLMF 18.5.10. -/
noncomputable def gegenbauer {R : Type*} [CommRing R] [Algebra ℚ R] (lam : R) (n : ℕ) : R[X] :=
  ∑ k ∈ Finset.range (n / 2 + 1),
    ((-1 : R) ^ k * (((1 : ℚ) / (k.factorial * (n - 2 * k).factorial)) •
      (ascPochhammer R (n - k)).smeval lam)) • (C 2 * X) ^ (n - 2 * k)

/-- Local verbatim copy of `Polynomial.jacobi` of LaguerreJacobi §3.2: the Jacobi polynomial
`P_n^{(α,β)}` by DLMF 18.5.8. -/
noncomputable def jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) : R[X] :=
  ((1 : ℚ) / 2 ^ n) • ∑ k ∈ Finset.range (n + 1),
    (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      ((ascPochhammer R (n - k)).smeval (β + k + 1) *
        (ascPochhammer R k).smeval (α + (n - k : ℕ) + 1))) • ((X - 1) ^ (n - k) * (X + 1) ^ k)

section Gelfand

variable {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]

/-- Local copy of SpecialFunctionsGroupModels §5.1. `f` is bi-invariant under `K`:
`f(k₁ x k₂) = f(x)`. -/
def IsBiInvariant (K : Subgroup G) (f : G → ℂ) : Prop :=
  ∀ k₁ ∈ K, ∀ k₂ ∈ K, ∀ x, f (k₁ * x * k₂) = f x

/-- Local copy of SpecialFunctionsGroupModels §5.1. The convolution
`(f * h)(x) = ∫ f(y) h(y⁻¹ x) dμ(y)`. -/
def conv (μ : Measure G) (f h : G → ℂ) (x : G) : ℂ := ∫ y, f y * h (y⁻¹ * x) ∂μ

/-- Local copy of SpecialFunctionsGroupModels §5.1. `(G, K)` is a Gel'fand pair for the Haar
measure `μ`: convolution of continuous compactly supported bi-`K`-invariant functions is
commutative. -/
def IsGelfandPair (μ : Measure G) (K : Subgroup G) : Prop :=
  ∀ f h : G → ℂ, Continuous f → HasCompactSupport f → IsBiInvariant K f →
    Continuous h → HasCompactSupport h → IsBiInvariant K h → conv μ f h = conv μ h f

/-- Local copy of SpecialFunctionsGroupModels §5.2. `φ` is a spherical function for `(G, K)`
and the measure `ν` on `K`: continuous, bi-`K`-invariant, `φ(1) = 1`, with
`∫_K φ(x k y) dν(k) = φ(x) φ(y)`. Boundedness is not required. -/
def IsSphericalFunction (K : Subgroup G) (ν : Measure K) (φ : G → ℂ) : Prop :=
  Continuous φ ∧ IsBiInvariant K φ ∧ φ 1 = 1 ∧ ∀ x y, ∫ k : K, φ (x * k * y) ∂ν = φ x * φ y

end Gelfand

open Real
open scoped Nat FourierTransform

/-! ## Layer 1: the sphere and the rotation group -/

section GroupModelsCopy

open Matrix

/-- Local copy of SpecialFunctionsGroupModels §0.3. `SO(n)` as the special orthogonal matrices
of Mathlib. -/
abbrev SOn (n : ℕ) := Matrix.specialOrthogonalGroup (Fin n) ℝ

end GroupModelsCopy

/-- README 1.1. The stabilizer `K_η` of a vector `η` (`MulAction.stabilizer`); for a unit vector
it is a copy of `SO(n - 1)`. -/
abbrev rotationStabilizer {n : ℕ} (η : EuclideanSpace ℝ (Fin n)) : Subgroup (SOn n) :=
  MulAction.stabilizer (SOn n) η

/-- The unit sphere `S^{n-1}` of `ℝⁿ`. -/
abbrev Sphere (n : ℕ) := Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1

/-- README 1.2. The rotation-invariant probability measure on `S^{n-1}`: Mathlib's surface
measure `Measure.toSphere`, normalized. -/
def sphereMeasure (n : ℕ) : Measure (Sphere n) :=
  ((volume : Measure (EuclideanSpace ℝ (Fin n))).toSphere univ)⁻¹ •
    (volume : Measure (EuclideanSpace ℝ (Fin n))).toSphere

/-- README 1.2. The constant `c_n = Γ(n/2) / (√π Γ((n - 1)/2))` of the polar-angle density. -/
def polarConstant (n : ℕ) : ℝ := Gamma ((n : ℝ) / 2) / (√π * Gamma (((n : ℝ) - 1) / 2))

/-- README 1.1. **Transitivity.** For `n ≥ 2`, `SO(n)` acts transitively on the unit sphere. -/
theorem exists_smul_eq {n : ℕ} (hn : 2 ≤ n) {η ξ : EuclideanSpace ℝ (Fin n)} (hη : ‖η‖ = 1)
    (hξ : ‖ξ‖ = 1) : ∃ g : SOn n, g • η = ξ := by
  sorry

/-- README 1.1. **Double cosets.** For `n ≥ 3` and a unit vector `η`, `K_η g K_η = K_η h K_η`
exactly when `⟪η, g η⟫ = ⟪η, h η⟫`. -/
theorem exists_mul_mul_eq_iff_inner {n : ℕ} (hn : 3 ≤ n) {η : EuclideanSpace ℝ (Fin n)}
    (hη : ‖η‖ = 1) (g h : SOn n) :
    (∃ k₁ ∈ rotationStabilizer η, ∃ k₂ ∈ rotationStabilizer η, h = k₁ * g * k₂) ↔
      ⟪η, g • η⟫_ℝ = ⟪η, h • η⟫_ℝ := by
  sorry

/-- README 1.2. **Invariance of the sphere measure.** -/
theorem integral_smul_sphereMeasure {n : ℕ} (g : SOn n) (f : EuclideanSpace ℝ (Fin n) → ℝ)
    (hf : Continuous f) :
    ∫ x : Sphere n, f (g • (x : EuclideanSpace ℝ (Fin n))) ∂sphereMeasure n =
      ∫ x : Sphere n, f x ∂sphereMeasure n := by
  sorry

/-- README 1.2. **Haar measure pushes forward to the sphere measure.** For `n ≥ 2` and a unit
vector `η`, the image of the Haar probability measure of `SO(n)` under `g ↦ g η` is the
normalized sphere measure. -/
theorem integral_haarProb_smul {n : ℕ} (hn : 2 ≤ n) {η : EuclideanSpace ℝ (Fin n)}
    (hη : ‖η‖ = 1) (f : EuclideanSpace ℝ (Fin n) → ℝ) (hf : Continuous f) :
    ∫ g : SOn n, f (g • η) ∂TauCeti.haarProb (SOn n) = ∫ x : Sphere n, f x ∂sphereMeasure n := by
  sorry

/-- README 1.2. **Polar-angle density.** For `n ≥ 2`, a unit vector `η` and continuous `f`,
`∫ f(⟪η, x⟫) dσ(x) = c_n ∫_{-1}^{1} f(t) (1 - t²)^{(n-3)/2} dt`. -/
theorem integral_inner_sphereMeasure {n : ℕ} (hn : 2 ≤ n) {η : EuclideanSpace ℝ (Fin n)}
    (hη : ‖η‖ = 1) (f : ℝ → ℝ) (hf : Continuous f) :
    ∫ x : Sphere n, f ⟪η, (x : EuclideanSpace ℝ (Fin n))⟫_ℝ ∂sphereMeasure n =
      polarConstant n * ∫ t in Ioo (-1 : ℝ) 1, f t * (1 - t ^ 2) ^ (((n : ℝ) - 3) / 2) := by
  sorry

/-- README 1.3. **`(SO(n), K_η)` is a Gel'fand pair.** -/
theorem isGelfandPair_SOn (n : ℕ) (η : EuclideanSpace ℝ (Fin n)) :
    IsGelfandPair (TauCeti.haarProb (SOn n)) (rotationStabilizer η) := by
  sorry

/-! ## Layer 2: spherical harmonics -/

/-- README 2.1. **Closed dimension formula.** For `n ≥ 3`,
`dim H_l(ℝⁿ) = (2l + n - 2) (l + n - 3)! / ((n - 2)! l!)`. -/
theorem finrank_harmonicSubmodule_mul {n : ℕ} (hn : 3 ≤ n) (l : ℕ) :
    Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin n) ℝ l) * ((n - 2)! * l !) =
      (2 * l + n - 2) * (l + n - 3)! := by
  sorry

/-- README 2.2. **Inequivalence.** For `n ≥ 2` and `l ≠ l'`, no linear isomorphism
`H_l ≃ H_{l'}` intertwines the actions of `SO(n)` through Tau Ceti's representation
`MvPolynomial.harmonicRep` of the orthogonal group. -/
theorem not_exists_linearEquiv_harmonicRep {n : ℕ} (hn : 2 ≤ n) {l l' : ℕ} (hll' : l ≠ l') :
    ¬ ∃ e : MvPolynomial.harmonicSubmodule (Fin n) ℝ l ≃ₗ[ℝ]
        MvPolynomial.harmonicSubmodule (Fin n) ℝ l',
      ∀ g : SOn n, ∀ p,
        e (MvPolynomial.harmonicRep (Fin n) ℝ l
            ⟨g.1, Matrix.specialUnitaryGroup_le_unitaryGroup g.2⟩ p) =
          MvPolynomial.harmonicRep (Fin n) ℝ l'
            ⟨g.1, Matrix.specialUnitaryGroup_le_unitaryGroup g.2⟩ (e p) := by
  sorry

/-! ## Layer 3: zonal polynomials and Gegenbauer polynomials -/

/-- README 3.1. The **normalized zonal polynomial** `ω_{n,l}(t) = ₂F₁(-l, l + n - 2; (n - 1)/2;
(1 - t)/2)`, a terminating sum. For `n ≥ 3` it is `C_l^{(n-2)/2}(t) / C_l^{(n-2)/2}(1)`; for
`n = 2` it is the Chebyshev polynomial `T_l`, and for `n = 3` the Legendre polynomial `P_l`.
For `n ≤ 1` the lower parameter is `≤ 0` and the value is junk. -/
def zonalPolynomial (n l : ℕ) : ℝ[X] :=
  ∑ k ∈ Finset.range (l + 1),
    C ((ascPochhammer ℝ k).eval (-(l : ℝ)) * (ascPochhammer ℝ k).eval ((l : ℝ) + n - 2) /
      ((ascPochhammer ℝ k).eval (((n : ℝ) - 1) / 2) * k !)) * (C (1 / 2) * (1 - X)) ^ k

/-- Sanity check of the definition: README 3.1, `ω_{n,l}(1) = 1`. -/
theorem zonalPolynomial_eval_one (n l : ℕ) : (zonalPolynomial n l).eval 1 = 1 := by
  sorry

/-- README 3.1. **Parity.** `ω_{n,l}(-t) = (-1)^l ω_{n,l}(t)` for `n ≥ 2`. -/
theorem zonalPolynomial_comp_neg {n : ℕ} (hn : 2 ≤ n) (l : ℕ) :
    (zonalPolynomial n l).comp (-X) = (-1) ^ l * zonalPolynomial n l := by
  sorry

/-- README 3.1. **Degree.** `ω_{n,l}` has degree `l` for `n ≥ 2`. -/
theorem natDegree_zonalPolynomial {n : ℕ} (hn : 2 ≤ n) (l : ℕ) :
    (zonalPolynomial n l).natDegree = l := by
  sorry

/-- README 3.1. **Gegenbauer form.** For `n ≥ 2` and `λ = (n - 2)/2`,
`C_l^{(λ)} = C_l^{(λ)}(1) ω_{n,l}` with `C_l^{(λ)}(1) = (2λ)_l / l!`, which is nonzero for
`n ≥ 3`; at `n = 2` both sides are `1` for `l = 0` and `0` for `l ≥ 1`. -/
theorem gegenbauer_eq_zonalPolynomial {n : ℕ} (hn : 2 ≤ n) (l : ℕ) :
    gegenbauer (((n : ℝ) - 2) / 2) l =
      C ((ascPochhammer ℝ l).eval ((n : ℝ) - 2) / l !) * zonalPolynomial n l := by
  sorry

/-- README 3.1. **`n = 2`: Chebyshev.** `ω_{2,l} = T_l`. -/
theorem zonalPolynomial_two (l : ℕ) : zonalPolynomial 2 l = Chebyshev.T ℝ l := by
  sorry

/-- README 3.1. **`n = 3`: Legendre.** `ω_{3,l} = P_l = P_l^{(0,0)}`. -/
theorem zonalPolynomial_three (l : ℕ) : zonalPolynomial 3 l = jacobi (0 : ℝ) 0 l := by
  sorry

/-- README 3.1. **`n = 4`: Chebyshev of the second kind.** `(l + 1) ω_{4,l} = U_l`. -/
theorem zonalPolynomial_four (l : ℕ) :
    C ((l : ℝ) + 1) * zonalPolynomial 4 l = Chebyshev.U ℝ l := by
  sorry

/-- README 3.2. **Value at one.** `C_l^{(λ)}(1) = (2λ)_l / l!`. -/
theorem gegenbauer_eval_one (lam : ℝ) (l : ℕ) :
    (gegenbauer lam l).eval 1 = (ascPochhammer ℝ l).eval (2 * lam) / l ! := by
  sorry

/-- README 3.2. **Generating function on the disc.** For `|z| < 1` and `|t| ≤ 1`,
`∑ C_l^{(λ)}(t) zˡ = (1 - 2tz + z²)^{-λ}`; SpecialFunctionsBessel §4.3 owns the case of small
`|z|`. -/
theorem hasSum_gegenbauer (lam : ℝ) {t z : ℝ} (ht : |t| ≤ 1) (hz : |z| < 1) :
    HasSum (fun l : ℕ => (gegenbauer lam l).eval t * z ^ l) ((1 - 2 * t * z + z ^ 2) ^ (-lam)) := by
  sorry

/-- README 3.2. **Derivative.** `d/dt C_{l+1}^{(λ)} = 2λ C_l^{(λ+1)}`. -/
theorem derivative_gegenbauer (lam : ℝ) (l : ℕ) :
    derivative (gegenbauer lam (l + 1)) = C (2 * lam) * gegenbauer (lam + 1) l := by
  sorry

/-- README 3.2. **Derivative of the zonal polynomial.**
`ω_{n,l+1}' = (l + 1)(l + n - 1)/(n - 1) ω_{n+2,l}` for `n ≥ 2`. -/
theorem derivative_zonalPolynomial {n : ℕ} (hn : 2 ≤ n) (l : ℕ) :
    derivative (zonalPolynomial n (l + 1)) =
      C (((l : ℝ) + 1) * ((l : ℝ) + n - 1) / ((n : ℝ) - 1)) * zonalPolynomial (n + 2) l := by
  sorry

/-- README 3.2. **Differential equation.** For `n ≥ 2`,
`(1 - t²) ω'' - (n - 1) t ω' + l(l + n - 2) ω = 0`. -/
theorem zonalPolynomial_ode {n : ℕ} (hn : 2 ≤ n) (l : ℕ) :
    (1 - X ^ 2) * derivative (derivative (zonalPolynomial n l)) -
        C ((n : ℝ) - 1) * X * derivative (zonalPolynomial n l) +
      C ((l : ℝ) * ((l : ℝ) + n - 2)) * zonalPolynomial n l = 0 := by
  sorry

/-- README 3.3. The linear form `x ↦ ⟪η, x⟫` as a polynomial. -/
def linearForm {n : ℕ} (η : EuclideanSpace ℝ (Fin n)) : MvPolynomial (Fin n) ℝ :=
  ∑ i, MvPolynomial.C (η i) * MvPolynomial.X i

/-- README 3.3. The **zonal harmonic** `Z_{l,η}(x) = |x|ˡ ω_{n,l}(⟪η, x⟫ / |x|)`: the
homogenization of `ω_{n,l}` in `⟪η, x⟫` and `|x|²`. Only the coefficients of the parity of `l`
enter, and these are all of them (`zonalPolynomial_comp_neg`). -/
def zonalHarmonic (n l : ℕ) (η : EuclideanSpace ℝ (Fin n)) : MvPolynomial (Fin n) ℝ :=
  ∑ j ∈ Finset.range (l + 1),
    if Even (l - j) then
      MvPolynomial.C ((zonalPolynomial n l).coeff j) * linearForm η ^ j *
        MvPolynomial.normSq (Fin n) ℝ ^ ((l - j) / 2)
    else 0

/-- README 3.3. **The zonal harmonic is harmonic of degree `l`** (`n ≥ 2`, `η` a unit
vector). -/
theorem zonalHarmonic_mem_harmonicSubmodule {n : ℕ} (hn : 2 ≤ n) (l : ℕ)
    {η : EuclideanSpace ℝ (Fin n)} (hη : ‖η‖ = 1) :
    zonalHarmonic n l η ∈ MvPolynomial.harmonicSubmodule (Fin n) ℝ l := by
  sorry

/-- README 3.3. **Values on the sphere.** For unit `η`, `x` with `n ≥ 2`,
`Z_{l,η}(x) = ω_{n,l}(⟪η, x⟫)`. -/
theorem eval_zonalHarmonic {n : ℕ} (hn : 2 ≤ n) (l : ℕ) (η : EuclideanSpace ℝ (Fin n))
    {x : EuclideanSpace ℝ (Fin n)} (hx : ‖x‖ = 1) :
    MvPolynomial.eval (fun i => x i) (zonalHarmonic n l η) =
      (zonalPolynomial n l).eval ⟪η, x⟫_ℝ := by
  sorry

/-- README 3.3. **`K_η`-invariance of the zonal harmonic.** -/
theorem eval_smul_zonalHarmonic {n : ℕ} (l : ℕ) (η : EuclideanSpace ℝ (Fin n)) {k : SOn n}
    (hk : k ∈ rotationStabilizer η) (x : EuclideanSpace ℝ (Fin n)) :
    MvPolynomial.eval (fun i => (k • x) i) (zonalHarmonic n l η) =
      MvPolynomial.eval (fun i => x i) (zonalHarmonic n l η) := by
  sorry

/-- README 2.3. **Class one, uniqueness of the zonal harmonic.** For `n ≥ 3` and unit `η`, a
`K_η`-invariant harmonic polynomial of degree `l` is `p(η) Z_{l,η}`. -/
theorem eq_smul_zonalHarmonic {n : ℕ} (hn : 3 ≤ n) {l : ℕ} {η : EuclideanSpace ℝ (Fin n)}
    (hη : ‖η‖ = 1) {p : MvPolynomial (Fin n) ℝ}
    (hp : p ∈ MvPolynomial.harmonicSubmodule (Fin n) ℝ l)
    (hinv : ∀ k ∈ rotationStabilizer η, ∀ x : EuclideanSpace ℝ (Fin n),
      MvPolynomial.eval (fun i => (k • x) i) p = MvPolynomial.eval (fun i => x i) p) :
    p = MvPolynomial.eval (fun i => η i) p • zonalHarmonic n l η := by
  sorry

/-- README 3.4. **Laplace integral.** For `n ≥ 3`, `ω_{n,l}(cos ϕ) = c'_n ∫_0^π
(cos ϕ + i sin ϕ cos θ)ˡ sin^{n-3} θ dθ` with `c'_n = Γ((n - 1)/2) / (√π Γ((n - 2)/2))`. -/
theorem zonalPolynomial_eval_cos_eq_integral {n : ℕ} (hn : 3 ≤ n) (l : ℕ) (ϕ : ℝ) :
    (((zonalPolynomial n l).eval (cos ϕ) : ℝ) : ℂ) =
      ((Gamma (((n : ℝ) - 1) / 2) / (√π * Gamma (((n : ℝ) - 2) / 2)) : ℝ) : ℂ) *
        ∫ θ in (0 : ℝ)..π, ((cos ϕ : ℂ) + Complex.I * sin ϕ * cos θ) ^ l *
          ((sin θ ^ (n - 3) : ℝ) : ℂ) := by
  sorry

/-! ## Layer 4: addition theorem, Funk–Hecke, spherical functions -/

/-- README 4.1. **Addition theorem.** For `n ≥ 2`, an `L²(σ)`-orthonormal basis `Y` of `H_l`
satisfies `∑ᵢ Yᵢ(x) Yᵢ(y) = dim H_l · ω_{n,l}(⟪x, y⟫)` on the sphere. -/
theorem sum_sphereEval_mul_sphereEval_eq {n : ℕ} (hn : 2 ≤ n) (l : ℕ)
    (Y : Fin (Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin n) ℝ l)) →
      MvPolynomial.harmonicSubmodule (Fin n) ℝ l)
    (hY : ∀ i j, ∫ x : Sphere n, MvPolynomial.sphereEval (Y i : MvPolynomial (Fin n) ℝ) x *
      MvPolynomial.sphereEval (Y j : MvPolynomial (Fin n) ℝ) x ∂sphereMeasure n =
        if i = j then 1 else 0)
    (x y : Sphere n) :
    ∑ i, MvPolynomial.sphereEval (Y i : MvPolynomial (Fin n) ℝ) x *
        MvPolynomial.sphereEval (Y i : MvPolynomial (Fin n) ℝ) y =
      Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin n) ℝ l) *
        (zonalPolynomial n l).eval ⟪(x : EuclideanSpace ℝ (Fin n)), y⟫_ℝ := by
  sorry

/-- README 4.1. **Reproducing property.** For `n ≥ 2`, `p ∈ H_l` and `y` on the sphere,
`∫ p(x) ω_{n,l}(⟪x, y⟫) dσ(x) = p(y) / dim H_l`. -/
theorem integral_sphereEval_mul_zonalPolynomial {n : ℕ} (hn : 2 ≤ n) {l : ℕ}
    {p : MvPolynomial (Fin n) ℝ} (hp : p ∈ MvPolynomial.harmonicSubmodule (Fin n) ℝ l)
    (y : Sphere n) :
    ∫ x : Sphere n, MvPolynomial.sphereEval p x *
        (zonalPolynomial n l).eval ⟪(x : EuclideanSpace ℝ (Fin n)), y⟫_ℝ ∂sphereMeasure n =
      MvPolynomial.sphereEval p y /
        Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin n) ℝ l) := by
  sorry

/-- README 4.1. **Bound.** `|ω_{n,l}(t)| ≤ 1` on `[-1, 1]` for `n ≥ 2`. -/
theorem abs_zonalPolynomial_eval_le_one {n : ℕ} (hn : 2 ≤ n) (l : ℕ) {t : ℝ} (ht : |t| ≤ 1) :
    |(zonalPolynomial n l).eval t| ≤ 1 := by
  sorry

/-- README 4.2. **Orthogonality of zonal polynomials.** For `n ≥ 2`,
`c_n ∫_{-1}^{1} ω_{n,l} ω_{n,l'} (1 - t²)^{(n-3)/2} dt = δ_{ll'} / dim H_l`. -/
theorem integral_zonalPolynomial_mul_zonalPolynomial {n : ℕ} (hn : 2 ≤ n) (l l' : ℕ) :
    polarConstant n * ∫ t in Ioo (-1 : ℝ) 1,
        (zonalPolynomial n l).eval t * (zonalPolynomial n l').eval t *
          (1 - t ^ 2) ^ (((n : ℝ) - 3) / 2) =
      if l = l' then 1 / (Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin n) ℝ l) : ℝ)
      else 0 := by
  sorry

/-- README 4.3. **Funk–Hecke formula.** For `n ≥ 2`, continuous `f`, unit `η` and `p ∈ H_l`,
`∫ f(⟪η, x⟫) p(x) dσ(x) = λ p(η)` with
`λ = c_n ∫_{-1}^{1} f(t) ω_{n,l}(t) (1 - t²)^{(n-3)/2} dt`. -/
theorem integral_comp_inner_mul_sphereEval {n : ℕ} (hn : 2 ≤ n) {l : ℕ} (f : ℝ → ℝ)
    (hf : Continuous f)
    {η : EuclideanSpace ℝ (Fin n)} (hη : ‖η‖ = 1) {p : MvPolynomial (Fin n) ℝ}
    (hp : p ∈ MvPolynomial.harmonicSubmodule (Fin n) ℝ l) :
    ∫ x : Sphere n, f ⟪η, (x : EuclideanSpace ℝ (Fin n))⟫_ℝ * MvPolynomial.sphereEval p x
        ∂sphereMeasure n =
      (polarConstant n * ∫ t in Ioo (-1 : ℝ) 1,
          f t * (zonalPolynomial n l).eval t * (1 - t ^ 2) ^ (((n : ℝ) - 3) / 2)) *
        MvPolynomial.eval (fun i => η i) p := by
  sorry

/-- README 4.4. The zonal spherical function `g ↦ ω_{n,l}(⟪η, g η⟫)` of `(SO(n), K_η)`. -/
def zonalSpherical (n l : ℕ) (η : EuclideanSpace ℝ (Fin n)) (g : SOn n) : ℂ :=
  ((zonalPolynomial n l).eval ⟪η, g • η⟫_ℝ : ℝ)

/-- README 4.4. **Zonal spherical functions.** For `n ≥ 3`, a unit vector `η` and the Haar
probability measure `ν` of `K_η`, `zonalSpherical n l η` is a spherical function. -/
theorem isSphericalFunction_zonalSpherical {n : ℕ} (hn : 3 ≤ n) (l : ℕ)
    {η : EuclideanSpace ℝ (Fin n)} (hη : ‖η‖ = 1) (ν : Measure (rotationStabilizer η))
    [IsProbabilityMeasure ν] [ν.IsMulLeftInvariant] :
    IsSphericalFunction (rotationStabilizer η) ν (zonalSpherical n l η) := by
  sorry

/-- README 4.4. **Classification.** For `n ≥ 3`, every spherical function of `(SO(n), K_η)` is
some `zonalSpherical n l η`. -/
theorem exists_eq_zonalSpherical {n : ℕ} (hn : 3 ≤ n) {η : EuclideanSpace ℝ (Fin n)}
    (hη : ‖η‖ = 1) (ν : Measure (rotationStabilizer η)) [IsProbabilityMeasure ν]
    [ν.IsMulLeftInvariant]
    {ϕ : SOn n → ℂ} (hϕ : IsSphericalFunction (rotationStabilizer η) ν ϕ) :
    ∃ l, ϕ = zonalSpherical n l η := by
  sorry

/-- README 4.4. **Product formula.** For `n ≥ 3`, `ω(cos a) ω(cos b) =
c'_n ∫_0^π ω(cos a cos b + sin a sin b cos ψ) sin^{n-3} ψ dψ`. -/
theorem zonalPolynomial_eval_cos_mul_eval_cos {n : ℕ} (hn : 3 ≤ n) (l : ℕ) (a b : ℝ) :
    (zonalPolynomial n l).eval (cos a) * (zonalPolynomial n l).eval (cos b) =
      Gamma (((n : ℝ) - 1) / 2) / (√π * Gamma (((n : ℝ) - 2) / 2)) *
        ∫ ψ in (0 : ℝ)..π, (zonalPolynomial n l).eval (cos a * cos b + sin a * sin b * cos ψ) *
          sin ψ ^ (n - 3) := by
  sorry

/-- README 4.5. **Gegenbauer addition theorem.** For `λ > 0`, `λ ≠ 1/2`,
`C_l^{(λ)}(cos θ cos ϕ + sin θ sin ϕ cos ψ) = Γ(2λ - 1)/Γ(λ)² ∑_{m ≤ l} 2^{2m} Γ(λ + m)²
(l - m)! (2λ + 2m - 1)/Γ(2λ + l + m) (sin θ sin ϕ)^m C_{l-m}^{(λ+m)}(cos θ)
C_{l-m}^{(λ+m)}(cos ϕ) C_m^{(λ-1/2)}(cos ψ)`. -/
theorem gegenbauer_addition {lam : ℝ} (hlam : 0 < lam) (hlam' : lam ≠ 1 / 2) (l : ℕ)
    (θ ϕ ψ : ℝ) :
    (gegenbauer lam l).eval (cos θ * cos ϕ + sin θ * sin ϕ * cos ψ) =
      Gamma (2 * lam - 1) / Gamma lam ^ 2 *
        ∑ m ∈ Finset.range (l + 1),
          2 ^ (2 * m) * Gamma (lam + m) ^ 2 * (l - m)! * (2 * lam + 2 * m - 1) /
              Gamma (2 * lam + l + m) * (sin θ * sin ϕ) ^ m *
            (gegenbauer (lam + m) (l - m)).eval (cos θ) *
            (gegenbauer (lam + m) (l - m)).eval (cos ϕ) *
            (gegenbauer (lam - 1 / 2) m).eval (cos ψ) := by
  sorry

/-- README 4.6. **Funk–Hecke multiplier of a plane wave.** For `n ≥ 2` and `r > 0`,
`c_n ∫_{-1}^{1} e^{irt} ω_{n,l}(t) (1 - t²)^{(n-3)/2} dt`
`= iˡ Γ(n/2) (2/r)^{n/2-1} J_{l+n/2-1}(r)`. -/
theorem integral_cexp_mul_zonalPolynomial {n : ℕ} (hn : 2 ≤ n) (l : ℕ) {r : ℝ} (hr : 0 < r) :
    ((polarConstant n : ℝ) : ℂ) * ∫ t in Ioo (-1 : ℝ) 1,
        Complex.exp (Complex.I * r * t) * (((zonalPolynomial n l).eval t : ℝ) : ℂ) *
          (((1 - t ^ 2) ^ (((n : ℝ) - 3) / 2) : ℝ) : ℂ) =
      Complex.I ^ l * ((Gamma ((n : ℝ) / 2) * (2 / r) ^ ((n : ℝ) / 2 - 1) : ℝ) : ℂ) *
        Complex.besselJ ((l : ℂ) + (n : ℂ) / 2 - 1) r := by
  sorry

/-- README 4.6. **Plane-wave expansion in `ℝⁿ`, `n ≥ 4`.** For `L²(σ)`-orthonormal bases `Y l` of
the `H_l`, unit `η`, `x` and `r > 0`,
`e^{ir⟪η, x⟫} = ∑_l iˡ Γ(n/2) (2/r)^{n/2-1} J_{l+n/2-1}(r) ∑ᵢ Y_{l,i}(η) Y_{l,i}(x)`.
The bound `n ≥ 4` is an ownership boundary, not a hypothesis the proof needs: the identity also
holds for `n = 2, 3` (README 4.6). -/
theorem hasSum_cexp_inner_sphereEval {n : ℕ} (hn : 4 ≤ n)
    (Y : ∀ l : ℕ, Fin (Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin n) ℝ l)) →
      MvPolynomial.harmonicSubmodule (Fin n) ℝ l)
    (hY : ∀ l i j, ∫ x : Sphere n, MvPolynomial.sphereEval (Y l i : MvPolynomial (Fin n) ℝ) x *
      MvPolynomial.sphereEval (Y l j : MvPolynomial (Fin n) ℝ) x ∂sphereMeasure n =
        if i = j then 1 else 0)
    {r : ℝ} (hr : 0 < r) (η x : Sphere n) :
    HasSum (fun l : ℕ => Complex.I ^ l *
        ((Gamma ((n : ℝ) / 2) * (2 / r) ^ ((n : ℝ) / 2 - 1) : ℝ) : ℂ) *
          Complex.besselJ ((l : ℂ) + (n : ℂ) / 2 - 1) r *
          ((∑ i, MvPolynomial.sphereEval (Y l i : MvPolynomial (Fin n) ℝ) η *
            MvPolynomial.sphereEval (Y l i : MvPolynomial (Fin n) ℝ) x : ℝ) : ℂ))
      (Complex.exp (Complex.I * r *
        ⟪(η : EuclideanSpace ℝ (Fin n)), (x : EuclideanSpace ℝ (Fin n))⟫_ℝ)) := by
  sorry

/-- README 4.6. **Bochner's theorem.** For `n ≥ 2`, `l ≥ 1`, `p ∈ H_l`, `ϕ` with
`∫₀^∞ |ϕ(r)| r^{n-1} dr < ∞` and `ξ ≠ 0`, the Fourier transform of `ϕ(|x|) p(x/|x|)` is
`2π (-i)ˡ |ξ|^{1-n/2} p(ξ/|ξ|) ∫₀^∞ ϕ(r) J_{l+n/2-1}(2π|ξ| r) r^{n/2} dr`.
The bound `l ≥ 1` is an ownership boundary: the formula also holds for `l = 0` (README 4.6). -/
theorem fourier_mul_eval_div_norm {n : ℕ} (hn : 2 ≤ n) {l : ℕ} (hl : 1 ≤ l)
    {p : MvPolynomial (Fin n) ℝ} (hp : p ∈ MvPolynomial.harmonicSubmodule (Fin n) ℝ l)
    (ϕ : ℝ → ℂ) (hϕ : IntegrableOn (fun r => ϕ r * r ^ (n - 1)) (Ioi 0))
    {ξ : EuclideanSpace ℝ (Fin n)} (hξ : ξ ≠ 0) :
    𝓕 (fun x : EuclideanSpace ℝ (Fin n) =>
        ϕ ‖x‖ * ((MvPolynomial.eval (fun i => x i / ‖x‖) p : ℝ) : ℂ)) ξ =
      2 * π * (-Complex.I) ^ l * ((‖ξ‖ ^ (1 - (n : ℝ) / 2) : ℝ) : ℂ) *
        ((MvPolynomial.eval (fun i => ξ i / ‖ξ‖) p : ℝ) : ℂ) *
        ∫ r in Ioi (0 : ℝ), ϕ r * Complex.besselJ ((l : ℂ) + (n : ℂ) / 2 - 1) (2 * π * ‖ξ‖ * r) *
          ((r ^ ((n : ℝ) / 2) : ℝ) : ℂ) := by
  sorry

/-! ## Layer 5: branching `SO(m + 1) ↓ SO(m)` -/

/-- README 5.1. The polynomial `|x|^{l-k} ω_{m+1+2k, l-k}(x_{m+1}/|x|)` on `ℝ^{m+1}`, the
homogenization of `ω_{m+1+2k,l-k}` in the last coordinate and `|x|²`. -/
def branchFactor (m l k : ℕ) : MvPolynomial (Fin (m + 1)) ℝ :=
  ∑ j ∈ Finset.range (l - k + 1),
    if Even (l - k - j) then
      MvPolynomial.C ((zonalPolynomial (m + 1 + 2 * k) (l - k)).coeff j) *
        MvPolynomial.X (Fin.last m) ^ j * MvPolynomial.normSq (Fin (m + 1)) ℝ ^ ((l - k - j) / 2)
    else 0

/-- README 5.1. The branching map `h ↦ |x|^{l-k} ω_{m+1+2k,l-k}(x_{m+1}/|x|) h(x')` from
polynomials on `ℝᵐ` to polynomials on `ℝ^{m+1}`. -/
def branchHarmonic (m l k : ℕ) :
    MvPolynomial (Fin m) ℝ →ₗ[ℝ] MvPolynomial (Fin (m + 1)) ℝ :=
  LinearMap.mulLeft ℝ (branchFactor m l k) ∘ₗ (MvPolynomial.rename Fin.castSucc).toLinearMap

/-- README 5.1. **Branching harmonics are harmonic.** For `m ≥ 1`, `k ≤ l` and `h ∈ H_k(ℝᵐ)`,
`branchHarmonic m l k h ∈ H_l(ℝ^{m+1})`. -/
theorem branchHarmonic_mem_harmonicSubmodule {m l k : ℕ} (hm : 1 ≤ m) (hkl : k ≤ l)
    {h : MvPolynomial (Fin m) ℝ}
    (hh : h ∈ MvPolynomial.harmonicSubmodule (Fin m) ℝ k) :
    branchHarmonic m l k h ∈ MvPolynomial.harmonicSubmodule (Fin (m + 1)) ℝ l := by
  sorry

/-- README 5.1. **Branching decomposition, span.** For `m ≥ 1`, `H_l(ℝ^{m+1})` is the sum over
`k ≤ l` of the images of `H_k(ℝᵐ)`. -/
theorem harmonicSubmodule_eq_iSup_map_branchHarmonic {m : ℕ} (hm : 1 ≤ m) (l : ℕ) :
    MvPolynomial.harmonicSubmodule (Fin (m + 1)) ℝ l =
      ⨆ k : Fin (l + 1),
        (MvPolynomial.harmonicSubmodule (Fin m) ℝ k).map (branchHarmonic m l k) := by
  sorry

/-- README 5.1. **Branching decomposition, independence.** For `m ≥ 1`, the images of the
`H_k(ℝᵐ)`, `k ≤ l`, are independent. -/
theorem iSupIndep_map_branchHarmonic {m : ℕ} (hm : 1 ≤ m) (l : ℕ) :
    iSupIndep fun k : Fin (l + 1) =>
      (MvPolynomial.harmonicSubmodule (Fin m) ℝ k).map (branchHarmonic m l k) := by
  sorry

/-- README 5.1. **Branching dimension.** `dim H_l(ℝ^{m+1}) = ∑_{k ≤ l} dim H_k(ℝᵐ)` for
`m ≥ 1`. -/
theorem finrank_harmonicSubmodule_succ {m : ℕ} (hm : 1 ≤ m) (l : ℕ) :
    Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin (m + 1)) ℝ l) =
      ∑ k ∈ Finset.range (l + 1),
        Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin m) ℝ k) := by
  sorry

/-- README 5.1. **Branching norm.** For `m ≥ 1`, `k ≤ l` and `h ∈ H_k(ℝᵐ)`,
`‖branchHarmonic m l k h‖² = κ ‖h‖²` in `L²` of the normalized sphere measures, with
`κ = c_{m+1} / (c_{m+1+2k} dim H_{l-k}(ℝ^{m+1+2k}))`. -/
theorem integral_sphereEval_branchHarmonic_sq {m l k : ℕ} (hm : 1 ≤ m) (hkl : k ≤ l)
    {h : MvPolynomial (Fin m) ℝ} (hh : h ∈ MvPolynomial.harmonicSubmodule (Fin m) ℝ k) :
    ∫ x : Sphere (m + 1), MvPolynomial.sphereEval (branchHarmonic m l k h) x ^ 2
        ∂sphereMeasure (m + 1) =
      polarConstant (m + 1) / (polarConstant (m + 1 + 2 * k) *
          Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin (m + 1 + 2 * k)) ℝ (l - k))) *
        ∫ y : Sphere m, MvPolynomial.sphereEval h y ^ 2 ∂sphereMeasure m := by
  sorry

/-! ## Layer 6: the complex sphere and `U(n)` -/

/-- README 6.1. `U(n)` as the unitary matrices of Mathlib (`Matrix.unitaryGroup`). -/
abbrev UnitaryMatrixGroup (n : ℕ) := Matrix.unitaryGroup (Fin n) ℂ

/-- README 6.1. The stabilizer `K_η` of `η` in `U(n)`; for a unit vector it is a copy of
`U(n - 1)`. -/
abbrev unitaryStabilizer {n : ℕ} (η : EuclideanSpace ℂ (Fin n)) : Subgroup (UnitaryMatrixGroup n) :=
  MulAction.stabilizer (UnitaryMatrixGroup n) η

/-- The unit sphere `S^{2n-1}` of `ℂⁿ`. -/
abbrev ComplexSphere (n : ℕ) := Metric.sphere (0 : EuclideanSpace ℂ (Fin n)) 1

/-- README 6.1. The normalized surface measure on `S^{2n-1} ⊂ ℂⁿ`. -/
def complexSphereMeasure (n : ℕ) : Measure (ComplexSphere n) :=
  ((volume : Measure (EuclideanSpace ℂ (Fin n))).toSphere univ)⁻¹ •
    (volume : Measure (EuclideanSpace ℂ (Fin n))).toSphere

/-- README 6.1. **Transitivity.** `U(n)` acts transitively on each sphere `‖ξ‖ = r` of `ℂⁿ`. -/
theorem exists_smul_eq_unitary {n : ℕ} {η ξ : EuclideanSpace ℂ (Fin n)} (h : ‖η‖ = ‖ξ‖) :
    ∃ g : UnitaryMatrixGroup n, g • η = ξ := by
  sorry

/-- README 6.1. **Disc density.** For `n ≥ 2` and unit `η`, the image of the sphere measure under
`ξ ↦ ⟪η, ξ⟫` has density `(n - 1)/π (1 - |w|²)^{n-2}` on the unit disc. -/
theorem integral_inner_complexSphereMeasure {n : ℕ} (hn : 2 ≤ n)
    {η : EuclideanSpace ℂ (Fin n)} (hη : ‖η‖ = 1) (f : ℂ → ℂ) (hf : Continuous f) :
    ∫ ξ : ComplexSphere n, f ⟪η, (ξ : EuclideanSpace ℂ (Fin n))⟫_ℂ ∂complexSphereMeasure n =
      ∫ w in Metric.ball (0 : ℂ) 1, (((n : ℝ) - 1) / π * (1 - ‖w‖ ^ 2) ^ (n - 2) : ℝ) * f w := by
  sorry

/-- README 6.1. **`(U(n), K_η)` is a Gel'fand pair.** -/
theorem isGelfandPair_unitaryMatrixGroup (n : ℕ) (η : EuclideanSpace ℂ (Fin n)) :
    IsGelfandPair (TauCeti.haarProb (UnitaryMatrixGroup n)) (unitaryStabilizer η) := by
  sorry

/-- README 6.2. The bidegree weight: `zⱼ` has bidegree `(1, 0)` and `z̄ⱼ` has `(0, 1)`. The
variables `Sum.inl j` stand for `zⱼ` and `Sum.inr j` for `z̄ⱼ`. -/
def bidegreeWeight (n : ℕ) : Fin n ⊕ Fin n → ℕ × ℕ :=
  Sum.elim (fun _ => (1, 0)) (fun _ => (0, 1))

/-- README 6.2. The complex Laplacian `∑ⱼ ∂²/∂zⱼ∂z̄ⱼ`. -/
def complexLaplacian (n : ℕ) :
    MvPolynomial (Fin n ⊕ Fin n) ℂ →ₗ[ℂ] MvPolynomial (Fin n ⊕ Fin n) ℂ :=
  ∑ j, (MvPolynomial.pderiv (R := ℂ) (Sum.inl j)).toLinearMap ∘ₗ
    (MvPolynomial.pderiv (R := ℂ) (Sum.inr j)).toLinearMap

/-- README 6.2. The space `H^{p,q}` of harmonic polynomials of bidegree `(p, q)` in `z, z̄`. -/
def bidegreeHarmonic (n p q : ℕ) : Submodule ℂ (MvPolynomial (Fin n ⊕ Fin n) ℂ) :=
  MvPolynomial.weightedHomogeneousSubmodule ℂ (bidegreeWeight n) (p, q) ⊓
    LinearMap.ker (complexLaplacian n)

/-- README 6.2. Evaluation of a polynomial in `z, z̄` at a point `z ∈ ℂⁿ`. -/
def evalC {n : ℕ} (z : EuclideanSpace ℂ (Fin n)) (f : MvPolynomial (Fin n ⊕ Fin n) ℂ) : ℂ :=
  MvPolynomial.eval (Sum.elim (fun j => z j) (fun j => conj (z j))) f

/-- README 6.2. **Dimension of `H^{p,q}`.** For `n ≥ 2`, `dim H^{p,q} (n-1)! (n-2)! p! q! =
(p + n - 2)! (q + n - 2)! (p + q + n - 1)`. -/
theorem finrank_bidegreeHarmonic_mul {n : ℕ} (hn : 2 ≤ n) (p q : ℕ) :
    Module.finrank ℂ (bidegreeHarmonic n p q) * ((n - 1)! * (n - 2)! * p ! * q !) =
      (p + n - 2)! * (q + n - 2)! * (p + q + n - 1) := by
  sorry

/-- README 6.2. **Real and complex harmonics.** `dim H_m(ℝ^{2n}) = ∑_{p+q=m} dim H^{p,q}(ℂⁿ)`. -/
theorem finrank_harmonicSubmodule_eq_sum_finrank_bidegreeHarmonic (n m : ℕ) :
    Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin (2 * n)) ℝ m) =
      ∑ p ∈ Finset.range (m + 1), Module.finrank ℂ (bidegreeHarmonic n p (m - p)) := by
  sorry

/-- README 6.2. **Branching dimension for `U(n + 1) ↓ U(n)`.** For `n ≥ 1`,
`dim H^{p,q}(ℂ^{n+1}) = ∑_{a ≤ p, b ≤ q} dim H^{a,b}(ℂⁿ)`. -/
theorem finrank_bidegreeHarmonic_succ {n : ℕ} (hn : 1 ≤ n) (p q : ℕ) :
    Module.finrank ℂ (bidegreeHarmonic (n + 1) p q) =
      ∑ a ∈ Finset.range (p + 1), ∑ b ∈ Finset.range (q + 1),
        Module.finrank ℂ (bidegreeHarmonic n a b) := by
  sorry

/-- README 6.3. The **disk polynomial** `R^α_{p,q}(w) = ∑_{i ≤ min(p,q)} (-1)ⁱ C(p,i) C(q,i) i!
/ (α + 1)ᵢ (1 - |w|²)ⁱ w^{p-i} w̄^{q-i}`. For `α ∈ {-1, -2, …}` a denominator vanishes and the
value is junk; the theorems assume `-1 < α`. -/
def diskPolynomial (α : ℝ) (p q : ℕ) (w : ℂ) : ℂ :=
  ∑ i ∈ Finset.range (min p q + 1),
    (((-1) ^ i * (p.choose i * q.choose i * i ! : ℝ) / (ascPochhammer ℝ i).eval (α + 1) : ℝ) : ℂ) *
      ((1 - ‖w‖ ^ 2 : ℝ) : ℂ) ^ i * w ^ (p - i) * conj w ^ (q - i)

/-- Sanity check of the definition: README 6.3, `R^α_{p,q}(1) = 1`. -/
theorem diskPolynomial_one (α : ℝ) (p q : ℕ) : diskPolynomial α p q 1 = 1 := by
  sorry

/-- README 6.3. `R^α_{q,p} = conj R^α_{p,q}`. -/
theorem diskPolynomial_swap (α : ℝ) (p q : ℕ) (w : ℂ) :
    diskPolynomial α q p w = conj (diskPolynomial α p q w) := by
  sorry

/-- README 6.3. **Jacobi form.** For `-1 < α` and `q ≤ p`,
`R^α_{p,q}(w) = q! / (α + 1)_q · P_q^{(α, p-q)}(2|w|² - 1) w^{p-q}`. -/
theorem diskPolynomial_eq_jacobi {α : ℝ} (hα : -1 < α) {p q : ℕ} (hqp : q ≤ p) (w : ℂ) :
    diskPolynomial α p q w =
      (((q ! : ℝ) / (ascPochhammer ℝ q).eval (α + 1) *
        (jacobi α ((p - q : ℕ) : ℝ) q).eval (2 * ‖w‖ ^ 2 - 1) : ℝ) : ℂ) * w ^ (p - q) := by
  sorry

/-- README 6.3. **Orthogonality on the disc.** For `-1 < α`,
`(α + 1)/π ∫_{|w|<1} R^α_{p,q} conj R^α_{p',q'} (1 - |w|²)^α dA = δ h` with
`h = (α + 1)/(p + q + α + 1) · p! q! / ((α + 1)_p (α + 1)_q)`. -/
theorem integral_diskPolynomial_mul_conj {α : ℝ} (hα : -1 < α) (p q p' q' : ℕ) :
    ∫ w in Metric.ball (0 : ℂ) 1, (((α + 1) / π * (1 - ‖w‖ ^ 2) ^ α : ℝ) : ℂ) *
        diskPolynomial α p q w * conj (diskPolynomial α p' q' w) =
      if p = p' ∧ q = q' then
        (((α + 1) / (p + q + α + 1) * (p ! * q !) /
          ((ascPochhammer ℝ p).eval (α + 1) * (ascPochhammer ℝ q).eval (α + 1)) : ℝ) : ℂ)
      else 0 := by
  sorry

/-- README 6.3. **Bound.** `|R^{n-2}_{p,q}(w)| ≤ 1` on the closed unit disc for `n ≥ 2`. -/
theorem norm_diskPolynomial_le_one {n : ℕ} (hn : 2 ≤ n) (p q : ℕ) {w : ℂ} (hw : ‖w‖ ≤ 1) :
    ‖diskPolynomial ((n : ℝ) - 2) p q w‖ ≤ 1 := by
  sorry

/-- README 6.4. The `U(n)`-zonal harmonic of bidegree `(p, q)`: with `w = ⟪η, z⟫`,
`∑ᵢ cᵢ (|z|² - w w̄)ⁱ w^{p-i} w̄^{q-i}`, the coefficients `cᵢ` those of `R^{n-2}_{p,q}`. -/
def diskHarmonic (n p q : ℕ) (η : EuclideanSpace ℂ (Fin n)) : MvPolynomial (Fin n ⊕ Fin n) ℂ :=
  let w : MvPolynomial (Fin n ⊕ Fin n) ℂ :=
    ∑ j, MvPolynomial.C (conj (η j)) * MvPolynomial.X (Sum.inl j)
  let wb : MvPolynomial (Fin n ⊕ Fin n) ℂ := ∑ j, MvPolynomial.C (η j) * MvPolynomial.X (Sum.inr j)
  let r2 : MvPolynomial (Fin n ⊕ Fin n) ℂ :=
    ∑ j, MvPolynomial.X (Sum.inl j) * MvPolynomial.X (Sum.inr j)
  ∑ i ∈ Finset.range (min p q + 1),
    MvPolynomial.C ((((-1) ^ i * (p.choose i * q.choose i * i ! : ℝ) /
      (ascPochhammer ℝ i).eval ((n : ℝ) - 1) : ℝ) : ℂ)) *
      (r2 - w * wb) ^ i * w ^ (p - i) * wb ^ (q - i)

/-- README 6.4. **The `U(n)`-zonal harmonic lies in `H^{p,q}`** (`n ≥ 2`, `η` a unit
vector). -/
theorem diskHarmonic_mem_bidegreeHarmonic {n : ℕ} (hn : 2 ≤ n) (p q : ℕ)
    {η : EuclideanSpace ℂ (Fin n)}
    (hη : ‖η‖ = 1) :
    diskHarmonic n p q η ∈ bidegreeHarmonic n p q := by
  sorry

/-- README 6.4. **Values on the sphere.** For unit `ξ`, `diskHarmonic` takes the value
`R^{n-2}_{p,q}(⟪η, ξ⟫)`. -/
theorem evalC_diskHarmonic {n : ℕ} (p q : ℕ) (η : EuclideanSpace ℂ (Fin n))
    {ξ : EuclideanSpace ℂ (Fin n)} (hξ : ‖ξ‖ = 1) :
    evalC ξ (diskHarmonic n p q η) = diskPolynomial ((n : ℝ) - 2) p q ⟪η, ξ⟫_ℂ := by
  sorry

/-- README 6.4. **Class one for `U(n)`.** For `n ≥ 2` and unit `η`, a `K_η`-invariant element of
`H^{p,q}` is a multiple of `diskHarmonic n p q η`. -/
theorem eq_smul_diskHarmonic {n : ℕ} (hn : 2 ≤ n) {p q : ℕ} {η : EuclideanSpace ℂ (Fin n)}
    (hη : ‖η‖ = 1) {f : MvPolynomial (Fin n ⊕ Fin n) ℂ} (hf : f ∈ bidegreeHarmonic n p q)
    (hinv : ∀ k ∈ unitaryStabilizer η, ∀ z : EuclideanSpace ℂ (Fin n),
      evalC (k • z) f = evalC z f) :
    f = evalC η f • diskHarmonic n p q η := by
  sorry

/-- README 6.5. The spherical function `g ↦ R^{n-2}_{p,q}(⟪g η, η⟫)` of `(U(n), K_η)`, the
normalized matrix coefficient `⟪Z, g · Z⟫ / ⟪Z, Z⟫` of `Z = diskHarmonic n p q η`. -/
def diskSpherical (n p q : ℕ) (η : EuclideanSpace ℂ (Fin n)) (g : UnitaryMatrixGroup n) : ℂ :=
  diskPolynomial ((n : ℝ) - 2) p q ⟪g • η, η⟫_ℂ

/-- README 6.5. **Disk polynomials are spherical functions.** -/
theorem isSphericalFunction_diskSpherical {n : ℕ} (hn : 2 ≤ n) (p q : ℕ)
    {η : EuclideanSpace ℂ (Fin n)} (hη : ‖η‖ = 1) (ν : Measure (unitaryStabilizer η))
    [IsProbabilityMeasure ν] [ν.IsMulLeftInvariant] :
    IsSphericalFunction (unitaryStabilizer η) ν (diskSpherical n p q η) := by
  sorry

/-- README 6.5. **Classification.** For `n ≥ 2`, every spherical function of `(U(n), K_η)` is
some `diskSpherical n p q η`. -/
theorem exists_eq_diskSpherical {n : ℕ} (hn : 2 ≤ n) {η : EuclideanSpace ℂ (Fin n)}
    (hη : ‖η‖ = 1) (ν : Measure (unitaryStabilizer η)) [IsProbabilityMeasure ν]
    [ν.IsMulLeftInvariant]
    {ϕ : UnitaryMatrixGroup n → ℂ} (hϕ : IsSphericalFunction (unitaryStabilizer η) ν ϕ) :
    ∃ p q, ϕ = diskSpherical n p q η := by
  sorry

/-- README 6.5. **Addition theorem for `H^{p,q}`.** For `n ≥ 2`, an `L²`-orthonormal basis `Y`
of `H^{p,q}` satisfies `∑ᵢ Yᵢ(x) conj Yᵢ(y) = dim H^{p,q} · R^{n-2}_{p,q}(⟪y, x⟫)`. -/
theorem sum_evalC_mul_conj_evalC_eq {n : ℕ} (hn : 2 ≤ n) (p q : ℕ)
    (Y : Fin (Module.finrank ℂ (bidegreeHarmonic n p q)) → bidegreeHarmonic n p q)
    (hY : ∀ i j, ∫ ξ : ComplexSphere n, conj (evalC (ξ : EuclideanSpace ℂ (Fin n)) (Y i : _)) *
      evalC (ξ : EuclideanSpace ℂ (Fin n)) (Y j : _) ∂complexSphereMeasure n =
        if i = j then 1 else 0)
    (x y : ComplexSphere n) :
    ∑ i, evalC (x : EuclideanSpace ℂ (Fin n)) (Y i : _) *
        conj (evalC (y : EuclideanSpace ℂ (Fin n)) (Y i : _)) =
      Module.finrank ℂ (bidegreeHarmonic n p q) *
        diskPolynomial ((n : ℝ) - 2) p q
          ⟪(y : EuclideanSpace ℂ (Fin n)), (x : EuclideanSpace ℂ (Fin n))⟫_ℂ := by
  sorry

/-- README 6.6. **Zonal polynomials of `SO(2n)` as sums of disk polynomials.** For `n ≥ 2` and
every `w ∈ ℂ`, `dim H_m(ℝ^{2n}) ω_{2n,m}(Re w) = ∑_{p+q=m} dim H^{p,q}(ℂⁿ) R^{n-2}_{p,q}(w)`. -/
theorem zonalPolynomial_eq_sum_diskPolynomial {n : ℕ} (hn : 2 ≤ n) (m : ℕ) (w : ℂ) :
    ((Module.finrank ℝ (MvPolynomial.harmonicSubmodule (Fin (2 * n)) ℝ m) *
        (zonalPolynomial (2 * n) m).eval w.re : ℝ) : ℂ) =
      ∑ p ∈ Finset.range (m + 1),
        Module.finrank ℂ (bidegreeHarmonic n p (m - p)) *
          diskPolynomial ((n : ℝ) - 2) p (m - p) w := by
  sorry

/-! ## Supplier declarations named in the README -/

#check @MvPolynomial.harmonicSubmodule
#check @MvPolynomial.normSq
#check @MvPolynomial.sphereEval
#check @MvPolynomial.harmonicSphereRestriction_injective
#check @MvPolynomial.harmonicRep
#check @TauCeti.haarProb
#check @MeasureTheory.Measure.toSphere
#check @Matrix.specialOrthogonalGroup
#check @Matrix.unitaryGroup
#check @Matrix.toEuclideanLin
#check @MulAction.stabilizer
#check @MvPolynomial.pderiv
#check @MvPolynomial.weightedHomogeneousSubmodule
#check @ascPochhammer
#check @Polynomial.Chebyshev.T
#check @Polynomial.Chebyshev.U
#check @Complex.besselJ

end TauCetiRoadmap.SpecialFunctionsHigherSpheres
