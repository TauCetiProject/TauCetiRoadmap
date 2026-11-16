module

import Mathlib
import TauCeti.Geometry.Manifold.Complex.LeviForm
import TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure
import TauCeti.Geometry.Symplectic.Manifold.TwoForm
import TauCeti.Geometry.Manifold.DifferentialForm.Closed
import TauCeti.Geometry.Manifold.DifferentialForm.Wedge.Basic
import TauCeti.Geometry.Manifold.DifferentialForm.Integration.TopForm

/-!
# Complex Hessian equations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions needed to state them.

Stated here:

* Layer 1: Lewis's theorem on the derivative of spectral functions of Hermitian matrices over
  `RCLike 𝕜` (differentiability, the gradient formula and the `C¹` criterion) and the concavity
  of spectral functions on their convex spectral domains (§§1.3–1.4).
* Layer 2: Gårding's theorem on hyperbolic polynomials and their cones, the identification of the
  Gårding cone of `σ_k` with `Γ_k`, the concavity of Hessian quotients, and the Hessian pair
  `(σ_k^{1/k}, Γ_k)` as a concave admissible pair with its sharp structural constant
  (§§2.2–2.5).
* Layer 4: uniqueness for every admissible pair with a convex cone on a compact connected
  Hermitian manifold (§4.2).
* Layer 6: Yau's theorem on a compact connected Kähler manifold (§6.6).
* Layer 7: the local and the global uniform exponential integrability of (quasi-)
  plurisubharmonic functions (§§7.1–7.2).
* Layer 8: the Guo–Phong–Tong `L^∞` estimates on degenerating backgrounds (§8.2), for the
  Monge–Ampère equation on degenerating backgrounds (§8.3), on a fixed background (§8.5), and for
  Hessian equations on degenerating backgrounds (§8.6).

Every headline theorem of the roadmap is statable at the pins and is stated. The real
(1,1)-forms of the roadmap are Tau Ceti's rough two-forms on the underlying real manifold, with
continuity given by the pinned `TauCeti.IsSmoothForm` at order `0`, `J`-invariance stated
pointwise, and Hermitian metrics and Kähler forms given by the pinned compatibility and
closedness predicates for the almost complex structure
`TauCeti.SmoothAlmostComplexStructure.ofComplexManifold`. The form `i∂∂̄φ` enters through its
Hermitian form `2·L_φ`, where `L_φ` is the pinned Levi form `TauCeti.manifoldLeviForm`, and
top-degree integrals are taken against the wedge power `ω^n` with the pinned
`TauCeti.integralTopForm` and the canonical orientation
`TauCeti.complexManifoldOrientation`. Spectral functions are stated on the real vector space of
Hermitian `n × n` matrices, which is the space of self-adjoint operators of the README read in an
orthonormal basis.
-/

namespace TauCetiRoadmap.ComplexHessianEquations

open scoped Manifold ContDiff TauCeti.ComplexManifold
open TauCeti TauCeti.SmoothAlmostComplexStructure Module MvPolynomial

/-! ## Layer 1: Eigenvalues and spectral functions -/

section Spectral

open scoped Matrix.Norms.Frobenius

variable {𝕜 : Type*} [RCLike 𝕜] {n : ℕ}

/-- The real vector space `Sym(𝕜ⁿ)` of Hermitian `n × n` matrices over `𝕜`, normed by the
Frobenius norm, which comes from the trace inner product `⟨S, T⟩ = Re tr(ST)`. -/
noncomputable abbrev hermitianMatrices (𝕜 : Type*) [RCLike 𝕜] (n : ℕ) :
    Submodule ℝ (Matrix (Fin n) (Fin n) 𝕜) :=
  selfAdjoint.submodule ℝ (Matrix (Fin n) (Fin n) 𝕜)

/-- The eigenvalue vector `λ(A) ∈ ℝⁿ` of a Hermitian matrix, sorted decreasingly (Mathlib's
eigenvalues of the associated symmetric operator on `EuclideanSpace 𝕜 (Fin n)`). -/
noncomputable def eigenvalueVector (A : hermitianMatrices 𝕜 n) : Fin n → ℝ :=
  (Matrix.isSymmetric_toEuclideanLin_iff.mpr A.2).eigenvalues finrank_euclideanSpace_fin

/-- **Lewis's theorem**, differentiability (Lewis 1996, Theorem 1.1). For a symmetric function
`f` on `ℝⁿ`, the spectral function `A ↦ f(λ(A))` on Hermitian matrices is differentiable at `A`
if and only if `f` is differentiable at `λ(A)`. -/
theorem differentiableAt_spectralFunction_iff {f : (Fin n → ℝ) → ℝ}
    (hf : ∀ (σ : Equiv.Perm (Fin n)) (μ : Fin n → ℝ), f (μ ∘ σ) = f μ)
    (A : hermitianMatrices 𝕜 n) :
    DifferentiableAt ℝ (fun B : hermitianMatrices 𝕜 n ↦ f (eigenvalueVector B)) A ↔
      DifferentiableAt ℝ f (eigenvalueVector A) := by
  sorry

/-- **Lewis's theorem**, the gradient (Lewis 1996, Theorem 1.1). If `f` is symmetric and
differentiable at `λ(A)`, and `A = U diag(λ(A)) U*` with `U` unitary, then the derivative of the
spectral function at `A` in the direction `H` is `Σ_i ∂_i f(λ(A)) · Re (U* H U)_ii`, that is,
the gradient is `U diag(∇f(λ(A))) U*`. -/
theorem fderiv_spectralFunction_apply {f : (Fin n → ℝ) → ℝ}
    (hf : ∀ (σ : Equiv.Perm (Fin n)) (μ : Fin n → ℝ), f (μ ∘ σ) = f μ)
    (A : hermitianMatrices 𝕜 n) (hfA : DifferentiableAt ℝ f (eigenvalueVector A))
    {U : Matrix (Fin n) (Fin n) 𝕜} (hU : U ∈ Matrix.unitaryGroup (Fin n) 𝕜)
    (hAU : (A : Matrix (Fin n) (Fin n) 𝕜) =
      U * Matrix.diagonal (fun i ↦ (eigenvalueVector A i : 𝕜)) * star U)
    (H : hermitianMatrices 𝕜 n) :
    fderiv ℝ (fun B : hermitianMatrices 𝕜 n ↦ f (eigenvalueVector B)) A H =
      ∑ i, fderiv ℝ f (eigenvalueVector A) (Pi.single i 1) *
        RCLike.re ((star U * (H : Matrix (Fin n) (Fin n) 𝕜) * U) i i) := by
  sorry

/-- **Lewis's theorem**, `C¹` form (Lewis 1996, the remark after Corollary 3.15). For an
open set `Ω ⊆ ℝⁿ` invariant under coordinate permutations and a symmetric `f`, the spectral
function is `C¹` on the spectral domain `{A | λ(A) ∈ Ω}` if and only if `f` is `C¹` on `Ω`. -/
theorem contDiffOn_spectralFunction_iff {Ω : Set (Fin n → ℝ)} (hΩ : IsOpen Ω)
    (hΩs : ∀ (σ : Equiv.Perm (Fin n)), ∀ μ ∈ Ω, μ ∘ σ ∈ Ω) {f : (Fin n → ℝ) → ℝ}
    (hf : ∀ (σ : Equiv.Perm (Fin n)) (μ : Fin n → ℝ), f (μ ∘ σ) = f μ) :
    ContDiffOn ℝ 1 (fun B : hermitianMatrices 𝕜 n ↦ f (eigenvalueVector B))
        {B | eigenvalueVector B ∈ Ω} ↔ ContDiffOn ℝ 1 f Ω := by
  sorry

/-- **Concavity of spectral functions** (Spruck 2005, Theorem 1.4 and its proof, for a smooth `f`
on an open convex cone; README §1.4 gives a route through Ky Fan's inequality and majorization
that needs neither differentiability nor openness). For a convex set `Γ ⊆ ℝⁿ` invariant under
coordinate permutations and a symmetric function `f` concave on `Γ`, the spectral function
`A ↦ f(λ(A))` is concave on the spectral domain `{A | λ(A) ∈ Γ}`; in particular (at `f = 0`)
the spectral domain is convex. -/
theorem concaveOn_spectralFunction {Γ : Set (Fin n → ℝ)}
    (hΓs : ∀ (σ : Equiv.Perm (Fin n)), ∀ μ ∈ Γ, μ ∘ σ ∈ Γ) {f : (Fin n → ℝ) → ℝ}
    (hfs : ∀ (σ : Equiv.Perm (Fin n)), ∀ μ ∈ Γ, f (μ ∘ σ) = f μ) (hf : ConcaveOn ℝ Γ f) :
    ConcaveOn ℝ {A : hermitianMatrices 𝕜 n | eigenvalueVector A ∈ Γ}
      (fun A ↦ f (eigenvalueVector A)) := by
  sorry

end Spectral

/-! ## Layer 2: Gårding cones and admissible pairs -/

section Garding

/-- The restriction `t ↦ p(x + t·a)` of a real polynomial in `N` variables to the line through
`x` in the direction `a`, as a polynomial in one variable. -/
noncomputable def lineRestriction {N : ℕ} (p : MvPolynomial (Fin N) ℝ) (x a : Fin N → ℝ) :
    Polynomial ℝ :=
  aeval (fun i ↦ Polynomial.C (x i) + Polynomial.C (a i) * Polynomial.X) p

/-- A real polynomial `p` is **hyperbolic of degree `m` in the direction `a`** if it is
homogeneous of degree `m`, `p(a) > 0`, and `t ↦ p(x + t·a)` has only real roots for every `x`
(Spruck 2005, Definition 2.1). -/
def IsHyperbolic {N : ℕ} (p : MvPolynomial (Fin N) ℝ) (m : ℕ) (a : Fin N → ℝ) : Prop :=
  p.IsHomogeneous m ∧ 0 < eval a p ∧ ∀ x, (lineRestriction p x a).Splits

/-- The **Gårding cone** `Γ(p, a) = {x | p(x + t·a) ≠ 0 for all t ≥ 0}`. -/
def gardingCone {N : ℕ} (p : MvPolynomial (Fin N) ℝ) (a : Fin N → ℝ) : Set (Fin N → ℝ) :=
  {x | ∀ t : ℝ, 0 ≤ t → eval (x + t • a) p ≠ 0}

/-- The cone `Γ_k = {λ | σ_1(λ) > 0, …, σ_k(λ) > 0}` of `ℝⁿ`. -/
def hessianCone (n k : ℕ) : Set (Fin n → ℝ) :=
  {μ | ∀ j ∈ Finset.Icc 1 k, 0 < eval μ (esymm (Fin n) ℝ j)}

/-- **Gårding's theorem** (Spruck 2005, Theorem 2.2 and Proposition 2.3). For `p`
hyperbolic of degree `m ≥ 1` in the direction `a`, the Gårding cone is open and convex, `p > 0`
on it, `p^{1/m}` is concave on it, and the derivative of `p` at any point of the cone in any
direction of the cone is positive. -/
theorem garding {N m : ℕ} {p : MvPolynomial (Fin N) ℝ} {a : Fin N → ℝ}
    (hp : IsHyperbolic p m a) (hm : 1 ≤ m) :
    IsOpen (gardingCone p a) ∧ Convex ℝ (gardingCone p a) ∧
      (∀ x ∈ gardingCone p a, 0 < eval x p) ∧
      ConcaveOn ℝ (gardingCone p a) (fun x ↦ eval x p ^ (1 / (m : ℝ))) ∧
      ∀ b ∈ gardingCone p a, ∀ x ∈ gardingCone p a,
        0 < fderiv ℝ (fun y ↦ eval y p) x b := by
  sorry

/-- **Gårding's theorem**, independence of the direction (Spruck 2005, Theorem 2.2). A
hyperbolic polynomial is hyperbolic in every direction `b` of its Gårding cone, with the same
cone. At degree `m = 0` the polynomial is a positive constant and every cone is `ℝ^N`. -/
theorem isHyperbolic_and_gardingCone_eq_of_mem {N m : ℕ} {p : MvPolynomial (Fin N) ℝ}
    {a b : Fin N → ℝ} (hp : IsHyperbolic p m a) (hb : b ∈ gardingCone p a) :
    IsHyperbolic p m b ∧ gardingCone p b = gardingCone p a := by
  sorry

/-- The elementary symmetric polynomial `σ_k`, `k ≤ n`, is hyperbolic of degree `k` in the
direction `e = (1, …, 1)`, and its Gårding cone is `Γ_k` (Spruck 2005, §2;
Dinew–Kołodziej 2014, §1). At `k = 0`, `σ_0 = 1` and both cones are `ℝⁿ`. -/
theorem isHyperbolic_esymm_and_gardingCone_eq {n k : ℕ} (hkn : k ≤ n) :
    IsHyperbolic (esymm (Fin n) ℝ k) k 1 ∧
      gardingCone (esymm (Fin n) ℝ k) 1 = hessianCone n k := by
  sorry

/-- **Concavity of Hessian quotients** (Spruck 2005, Theorems 2.11 and 2.16). For
`0 ≤ l < k ≤ n`, the quotient `(σ_k/σ_l)^{1/(k−l)}` is concave on `Γ_k`, with positive partial
derivatives there. -/
theorem concaveOn_hessianQuotient {n k l : ℕ} (hlk : l < k) (hkn : k ≤ n) :
    ConcaveOn ℝ (hessianCone n k)
        (fun μ ↦ (eval μ (esymm (Fin n) ℝ k) / eval μ (esymm (Fin n) ℝ l)) ^
          (1 / ((k : ℝ) - l))) ∧
      ∀ μ ∈ hessianCone n k, ∀ j : Fin n,
        0 < fderiv ℝ (fun ν ↦ (eval ν (esymm (Fin n) ℝ k) / eval ν (esymm (Fin n) ℝ l)) ^
          (1 / ((k : ℝ) - l))) μ (Pi.single j 1) := by
  sorry

/-- An **admissible pair** `(f, Γ)` (Guo–Phong 2024, conditions (1)–(3); Guo–Phong–Tong 2023,
§1): an open cone `Γ ⊆ ℝⁿ`, invariant under coordinate permutations and positive dilations, with
`Γ_n ⊆ Γ ⊆ Γ_1`, and a `C¹` function `f` on `Γ` that is symmetric, positively homogeneous of
degree one and elliptic, `∂_j f > 0` on `Γ`. -/
structure AdmissiblePair (n : ℕ) where
  /-- The admissible cone `Γ`. -/
  cone : Set (Fin n → ℝ)
  /-- The function `f`, meaningful on `Γ`. -/
  f : (Fin n → ℝ) → ℝ
  isOpen_cone : IsOpen cone
  perm_mem_cone : ∀ (σ : Equiv.Perm (Fin n)), ∀ μ ∈ cone, μ ∘ σ ∈ cone
  smul_mem_cone : ∀ t : ℝ, 0 < t → ∀ μ ∈ cone, t • μ ∈ cone
  pos_mem_cone : ∀ μ : Fin n → ℝ, (∀ i, 0 < μ i) → μ ∈ cone
  sum_pos_of_mem_cone : ∀ μ ∈ cone, 0 < ∑ i, μ i
  contDiffOn_f : ContDiffOn ℝ 1 f cone
  f_perm : ∀ (σ : Equiv.Perm (Fin n)), ∀ μ ∈ cone, f (μ ∘ σ) = f μ
  f_smul : ∀ t : ℝ, 0 < t → ∀ μ ∈ cone, f (t • μ) = t * f μ
  elliptic : ∀ μ ∈ cone, ∀ j : Fin n, 0 < fderiv ℝ f μ (Pi.single j 1)

/-- The **structural condition** with constant `γ`: `∏_j ∂_j f ≥ γ` on `Γ`
(Guo–Phong–Tong 2023, (1.4); Guo–Phong 2024, (1.2)). -/
def AdmissiblePair.IsStructural {n : ℕ} (P : AdmissiblePair n) (γ : ℝ) : Prop :=
  ∀ μ ∈ P.cone, γ ≤ ∏ j, fderiv ℝ P.f μ (Pi.single j 1)

/-- **The Hessian pair** (Guo–Phong–Tong 2023, §1 and Lemma 4). For `1 ≤ k ≤ n`,
`(σ_k^{1/k}, Γ_k)` is a concave admissible pair with a convex cone, and it satisfies the
structural condition with the constant `(binom(n, k)^{1/k}/n)^n`. The constant is sharp: the
product `∏_j ∂_j f` equals it at `λ = (1, …, 1)`, where each `∂_j f` is `binom(n, k)^{1/k}/n`. -/
theorem exists_hessianPair {n k : ℕ} (hk : 1 ≤ k) (hkn : k ≤ n) :
    ∃ P : AdmissiblePair n, P.cone = hessianCone n k ∧
      P.f = (fun μ ↦ eval μ (esymm (Fin n) ℝ k) ^ (1 / (k : ℝ))) ∧
      Convex ℝ P.cone ∧ ConcaveOn ℝ P.cone P.f ∧
      P.IsStructural (((n.choose k : ℝ) ^ (1 / (k : ℝ)) / n) ^ n) ∧
      ∏ j, fderiv ℝ P.f 1 (Pi.single j 1) = ((n.choose k : ℝ) ^ (1 / (k : ℝ)) / n) ^ n := by
  sorry

end Garding

/-! ## Layer 3: The equation on a compact Hermitian manifold -/

section Equation

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {X : Type*} [TopologicalSpace X] [ChartedSpace E X] [IsManifold 𝓘(ℂ, E) ∞ X]

variable (E) in
/-- The Hermitian form `H_α(u, v) = α(u, Jv) + i·α(u, v)` on `T_xX` of a real two-form `α`,
where `J` is multiplication by `i` on the tangent space `E`. It is sesquilinear, conjugate-linear
in the first slot, and Hermitian when `α` is `J`-invariant; for a Hermitian metric `ω` it is the
Hermitian inner product `h`. -/
def hermitianForm (α : RoughForm 𝓘(ℝ, E) X ℝ 2) (x : X) (u v : E) : ℂ :=
  ⟨α x ![u, Complex.I • v], α x ![u, v]⟩

variable (E) in
/-- The Hermitian form `H_{α + i∂∂̄φ} = H_α + 2·L_φ` of the real (1,1)-form `α + i∂∂̄φ` at `x`,
where `L_φ` is the Levi form of `φ` (`TauCeti.manifoldLeviForm`). -/
noncomputable def ddbarHermitianForm (α : RoughForm 𝓘(ℝ, E) X ℝ 2) (φ : X → ℝ) (x : X)
    (u v : E) : ℂ :=
  hermitianForm E α x u v + 2 * manifoldLeviForm E φ x u v

/-- `μ` is an eigenvalue vector of the Hermitian form `a` relative to the Hermitian inner
product `h`: there is an `h`-orthonormal basis in which `a` is diagonal with entries `μ`. For a
positive definite `h` and a Hermitian `a` this determines `μ` up to the order of its entries. -/
def IsRelEigenvalueVector (h a : E → E → ℂ) (μ : Fin (finrank ℂ E) → ℝ) : Prop :=
  ∃ b : Fin (finrank ℂ E) → E, ∀ i j,
    h (b i) (b j) = (if i = j then 1 else 0) ∧ a (b i) (b j) = (if i = j then (μ i : ℂ) else 0)

/-- The wedge power `α^m` of a smooth two-form, a rough form of degree `2m`. -/
noncomputable def formPow (α : SmoothTwoForm 𝓘(ℝ, E) X) :
    (m : ℕ) → RoughForm 𝓘(ℝ, E) X ℝ (2 * m)
  | 0 => RoughForm.ofFunction 𝓘(ℝ, E) (fun _ ↦ (1 : ℝ))
  | m + 1 => (formPow α m).wedge (α : RoughForm 𝓘(ℝ, E) X ℝ 2)

/-- The integral `∫_X g·α^n` over `X`, `n = dim_ℂ X`, for the canonical orientation of the
complex manifold `X`. -/
noncomputable def formPowIntegral (α : SmoothTwoForm 𝓘(ℝ, E) X) (g : X → ℝ) : ℝ :=
  integralTopForm (complexManifoldOrientation E X) (fun x ↦ g x • formPow α (finrank ℂ E) x)

/-- `(c, φ)` is a **normalized solution** of `f(λ_κ[α + i∂∂̄φ]) = c·e^F` with `λ ∈ Γ`: `c > 0`,
at every point the eigenvalue vector of `α + i∂∂̄φ` relative to the metric `κ` lies in the cone
of the admissible pair and satisfies the equation, and `sup φ = 0`. -/
def IsNormalizedSolution (P : AdmissiblePair (finrank ℂ E)) (κ α : RoughForm 𝓘(ℝ, E) X ℝ 2)
    (F : X → ℝ) (c : ℝ) (φ : X → ℝ) : Prop :=
  0 < c ∧
    (∀ x, ∃ μ, IsRelEigenvalueVector (hermitianForm E κ x) (ddbarHermitianForm E α φ x) μ ∧
      μ ∈ P.cone ∧ P.f μ = c * Real.exp (F x)) ∧
    (∀ x, φ x ≤ 0) ∧ ∃ x, φ x = 0

end Equation

/-! ## Layer 4: The comparison principle and uniqueness -/

section Uniqueness

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {X : Type*} [TopologicalSpace X] [ChartedSpace E X] [IsManifold 𝓘(ℂ, E) ∞ X]

/-- **Uniqueness** (§4.2; Tosatti–Weinkove 2010, Corollary 1, for the Monge–Ampère pair). On a
compact connected complex manifold with a Hermitian metric `κ`, for an admissible pair with a
convex cone, a continuous real (1,1)-form `χ` and a continuous `F`, two normalized `C²` solutions
`(c, φ)` and `(c', ψ)` of `f(λ_κ[χ + i∂∂̄φ]) = c·e^F` coincide. -/
theorem eq_of_isNormalizedSolution [T2Space X] [CompactSpace X] [ConnectedSpace X]
    (P : AdmissiblePair (finrank ℂ E)) (hΓ : Convex ℝ P.cone)
    (κ : SmoothTwoForm 𝓘(ℝ, E) X) (hκ : κ.Compatible (ofComplexManifold E X))
    (χ : RoughForm 𝓘(ℝ, E) X ℝ 2) (hχ : IsSmoothForm 𝓘(ℝ, E) 0 χ)
    (hχJ : ∀ (x : X) (u v : E), χ x ![Complex.I • u, Complex.I • v] = χ x ![u, v])
    {F : X → ℝ} (hF : Continuous F) {c c' : ℝ} {φ ψ : X → ℝ}
    (hφ : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) 2 φ) (hψ : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) 2 ψ)
    (hφs : IsNormalizedSolution P κ χ F c φ) (hψs : IsNormalizedSolution P κ χ F c' ψ) :
    c = c' ∧ φ = ψ := by
  sorry

end Uniqueness

/-! ## Layer 6: Yau's theorem -/

section Yau

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {X : Type*} [TopologicalSpace X] [ChartedSpace E X] [IsManifold 𝓘(ℂ, E) ∞ X]

/-- **Yau's theorem** (Yau 1978; Phong–Song–Sturm 2012, Theorem 1). On a compact connected Kähler
manifold `(X, κ)` and for a smooth `F`, there is exactly one pair of a constant `b` and a smooth
function `φ` with `κ + i∂∂̄φ > 0`, `(κ + i∂∂̄φ)^n = e^{F+b}·κ^n` and `sup φ = 0`. Here
`κ + i∂∂̄φ > 0` says that all eigenvalues of `κ + i∂∂̄φ` relative to `κ` are positive, and the
equation says that their product, the ratio `(κ + i∂∂̄φ)^n/κ^n`, is `e^{F+b}`. -/
theorem existsUnique_yau [T2Space X] [CompactSpace X] [ConnectedSpace X]
    (κ : SmoothTwoForm 𝓘(ℝ, E) X) (hκ : κ.Compatible (ofComplexManifold E X))
    (hκc : κ.IsClosed) {F : X → ℝ} (hF : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ F) :
    ∃! bφ : ℝ × (X → ℝ), ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ bφ.2 ∧
      (∀ x, ∃ μ, IsRelEigenvalueVector (hermitianForm E κ x) (ddbarHermitianForm E κ bφ.2 x) μ ∧
        (∀ i, 0 < μ i) ∧ ∏ i, μ i = Real.exp (F x + bφ.1)) ∧
      (∀ x, bφ.2 x ≤ 0) ∧ ∃ x, bφ.2 x = 0 := by
  sorry

end Yau

/-! ## Layer 7: Exponential integrability of quasi-plurisubharmonic functions -/

section ExponentialIntegrability

/-- **The local estimate** (§7.1; Hörmander 1990, Chapter IV). For every `n` there is `C`, and for
every `A > 0` an `α > 0`, such that every plurisubharmonic `C²` function `u ≤ 0` on the ball
`B(0, 2) ⊂ ℂⁿ` with `∫_{B(0,2)} (−u) ≤ A` satisfies `∫_{B(0,1)} e^{−αu} ≤ C`. -/
theorem exists_lintegral_exp_le_of_plurisubharmonic (n : ℕ) :
    ∃ C : ℝ, ∀ A : ℝ, 0 < A → ∃ α : ℝ, 0 < α ∧ ∀ u : EuclideanSpace ℂ (Fin n) → ℝ,
      ContDiffOn ℝ 2 u (Metric.ball 0 2) →
      (∀ z ∈ Metric.ball (0 : EuclideanSpace ℂ (Fin n)) 2, ∀ v, 0 ≤ (leviForm u z v v).re) →
      (∀ z ∈ Metric.ball (0 : EuclideanSpace ℂ (Fin n)) 2, u z ≤ 0) →
      ∫⁻ z in Metric.ball (0 : EuclideanSpace ℂ (Fin n)) 2, ENNReal.ofReal (-u z) ≤
        ENNReal.ofReal A →
      ∫⁻ z in Metric.ball (0 : EuclideanSpace ℂ (Fin n)) 1, ENNReal.ofReal (Real.exp (-α * u z)) ≤
        ENNReal.ofReal C := by
  sorry

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {X : Type*} [TopologicalSpace X] [ChartedSpace E X] [IsManifold 𝓘(ℂ, E) ∞ X]

/-- **Uniform exponential integrability** (§7.2; Tian 1987; Phong–Song–Sturm 2012, Theorem 31).
On a compact connected complex manifold with a Hermitian metric `κ` and a continuous real
(1,1)-form `θ`, there are `α > 0` and `C` such that every `C²` function `ψ` with
`θ + i∂∂̄ψ ≥ 0` satisfies `∫_X e^{−α(ψ − sup ψ)} κ^n ≤ C`. -/
theorem exists_formPowIntegral_exp_le [T2Space X] [CompactSpace X] [ConnectedSpace X]
    (κ : SmoothTwoForm 𝓘(ℝ, E) X) (hκ : κ.Compatible (ofComplexManifold E X))
    (θ : RoughForm 𝓘(ℝ, E) X ℝ 2) (hθ : IsSmoothForm 𝓘(ℝ, E) 0 θ)
    (hθJ : ∀ (x : X) (u v : E), θ x ![Complex.I • u, Complex.I • v] = θ x ![u, v]) :
    ∃ α : ℝ, 0 < α ∧ ∃ C : ℝ, ∀ ψ : X → ℝ, ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) 2 ψ →
      (∀ (x : X) (v : E), 0 ≤ (ddbarHermitianForm E θ ψ x v v).re) →
      formPowIntegral κ (fun x ↦ Real.exp (-α * (ψ x - ⨆ y, ψ y))) ≤ C := by
  sorry

end ExponentialIntegrability

/-! ## Layer 8: Sharp `L^∞` estimates -/

section LInfinity

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {X : Type*} [TopologicalSpace X] [ChartedSpace E X] [IsManifold 𝓘(ℂ, E) ∞ X]

/-- **The Guo–Phong–Tong estimate on degenerating backgrounds** (§8.2; Guo–Phong–Tong 2023,
Theorem 2). Let `(X, κ)` be compact connected Kähler, `χ ≥ 0` a smooth closed real (1,1)-form,
`ω_t = χ + t·κ` for `t ∈ (0, 1]`, `V_t = ∫ ω_t^n` and `V = ∫ κ^n`, and fix `γ > 0` and `p > n`.
There is `C`, depending only on these data and on upper bounds `K₁`, `K₂`, `K₃`, such that for
every admissible pair with structural constant `γ`, every normalized solution `φ ∈ C²` of
`f(λ_κ[ω_t + i∂∂̄φ]) = c·e^F` with smooth `F`, `∫ e^{nF} κ^n = V`, relative volume
`c^n/V_t ≤ K₁`, energy `V_t⁻¹ ∫ (−φ) c^n e^{nF} κ^n ≤ K₂` and entropy
`V⁻¹ ∫ e^{nF} |F|^p κ^n ≤ K₃` satisfies `|φ| ≤ C`. -/
theorem exists_abs_le_of_degenerating [T2Space X] [CompactSpace X] [ConnectedSpace X]
    (κ : SmoothTwoForm 𝓘(ℝ, E) X) (hκ : κ.Compatible (ofComplexManifold E X))
    (hκc : κ.IsClosed) (χ : SmoothTwoForm 𝓘(ℝ, E) X) (hχJ : χ.Invariant (ofComplexManifold E X))
    (hχc : χ.IsClosed) (hχ : ∀ (x : X) (v : E), 0 ≤ (hermitianForm E χ x v v).re)
    {γ p : ℝ} (hγ : 0 < γ) (hp : (finrank ℂ E : ℝ) < p) (K₁ K₂ K₃ : ℝ) :
    ∃ C : ℝ, ∀ P : AdmissiblePair (finrank ℂ E), P.IsStructural γ →
      ∀ t ∈ Set.Ioc (0 : ℝ) 1, ∀ (c : ℝ) (F φ : X → ℝ),
      ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ F → ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) 2 φ →
      formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x)) = formPowIntegral κ (fun _ ↦ 1) →
      IsNormalizedSolution P κ (χ + t • κ) F c φ →
      c ^ finrank ℂ E / formPowIntegral (χ + t • κ) (fun _ ↦ 1) ≤ K₁ →
      (formPowIntegral (χ + t • κ) (fun _ ↦ 1))⁻¹ *
          formPowIntegral κ (fun x ↦ -φ x * (c * Real.exp (F x)) ^ finrank ℂ E) ≤ K₂ →
      (formPowIntegral κ (fun _ ↦ 1))⁻¹ *
          formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x) * |F x| ^ p) ≤ K₃ →
      ∀ x, |φ x| ≤ C := by
  sorry

/-- **The Monge–Ampère equation on degenerating backgrounds** (§8.3; Guo–Phong–Tong 2023,
Theorem 4). In the setting of §8.2, fix `q > n` and `K`. There is `C` such that for every
`t ∈ (0, 1]`, every smooth normalized `F` with entropy `V⁻¹ ∫ e^{nF} |F|^q κ^n ≤ K`, and every
`C²` solution `φ` of `(ω_t + i∂∂̄φ)^n = c^n e^{nF} κ^n` with `ω_t + i∂∂̄φ > 0` and `sup φ = 0`,
`|φ| ≤ C`. At `χ = 0`, `t = 1` this is Kołodziej's bound. -/
theorem exists_abs_le_mongeAmpere_degenerating [T2Space X] [CompactSpace X] [ConnectedSpace X]
    (κ : SmoothTwoForm 𝓘(ℝ, E) X) (hκ : κ.Compatible (ofComplexManifold E X))
    (hκc : κ.IsClosed) (χ : SmoothTwoForm 𝓘(ℝ, E) X) (hχJ : χ.Invariant (ofComplexManifold E X))
    (hχc : χ.IsClosed) (hχ : ∀ (x : X) (v : E), 0 ≤ (hermitianForm E χ x v v).re)
    {q : ℝ} (hq : (finrank ℂ E : ℝ) < q) (K : ℝ) :
    ∃ C : ℝ, ∀ t ∈ Set.Ioc (0 : ℝ) 1, ∀ (c : ℝ) (F φ : X → ℝ),
      ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ F → ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) 2 φ →
      formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x)) = formPowIntegral κ (fun _ ↦ 1) →
      0 < c →
      (∀ x, ∃ μ, IsRelEigenvalueVector (hermitianForm E κ x)
          (ddbarHermitianForm E (χ + t • κ) φ x) μ ∧
        (∀ i, 0 < μ i) ∧ ∏ i, μ i = (c * Real.exp (F x)) ^ finrank ℂ E) →
      (∀ x, φ x ≤ 0) → (∃ x, φ x = 0) →
      (formPowIntegral κ (fun _ ↦ 1))⁻¹ *
          formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x) * |F x| ^ q) ≤ K →
      ∀ x, |φ x| ≤ C := by
  sorry

/-- **The Guo–Phong–Tong estimate on a fixed background** (§8.5; Guo–Phong–Tong 2023,
Theorem 1, in the form its proof establishes). Let `(X, κ)` be compact connected Kähler, and fix
`γ > 0`, `p > n` and bounds `K₁`, `K₂`. There is `C` such that for every admissible pair with
structural constant `γ`, every smooth `F` with `∫ e^{nF} κ^n = V` and entropy
`V⁻¹ ∫ e^{nF} |F|^p κ^n ≤ K₂`, and every normalized `C²` solution `(c, φ)` of
`f(λ_κ[κ + i∂∂̄φ]) = c·e^F` with `c^n ≤ K₁`, `|φ| ≤ C`. The constant `c` is not fixed to `1`:
for the Hessian pairs `(σ_k^{1/k}, Γ_k)` with `k < n` no normalized `F` has a solution with
`c = 1`. -/
theorem exists_abs_le_of_entropy_le [T2Space X] [CompactSpace X] [ConnectedSpace X]
    (κ : SmoothTwoForm 𝓘(ℝ, E) X) (hκ : κ.Compatible (ofComplexManifold E X))
    (hκc : κ.IsClosed) {γ p : ℝ} (hγ : 0 < γ) (hp : (finrank ℂ E : ℝ) < p) (K₁ K₂ : ℝ) :
    ∃ C : ℝ, ∀ P : AdmissiblePair (finrank ℂ E), P.IsStructural γ → ∀ (c : ℝ) (F φ : X → ℝ),
      ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ F → ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) 2 φ →
      formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x)) = formPowIntegral κ (fun _ ↦ 1) →
      IsNormalizedSolution P κ κ F c φ →
      c ^ finrank ℂ E ≤ K₁ →
      (formPowIntegral κ (fun _ ↦ 1))⁻¹ *
          formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x) * |F x| ^ p) ≤ K₂ →
      ∀ x, |φ x| ≤ C := by
  sorry

/-- **Hessian equations on degenerating backgrounds** (§8.6; Guo–Phong–Tong 2023, Theorem 5). In
the setting of §8.2, fix `γ > 0`, `1 ≤ k ≤ n`, `q > n/k` and bounds `K₁`, `K₂`. There is `C` such
that for every admissible pair with structural constant `γ`, every `t ∈ (0, 1]`, and every
normalized `C²` solution `φ` of `f(λ_κ[ω_t + i∂∂̄φ]) = c·e^F` with smooth normalized `F`, whose
eigenvalue vector lies in `Γ_k`, with `∫ e^{nqF} κ^n ≤ K₁` (the `q`-th power of the `L^q` norm
of `e^{nF}`) and `c^n/V_t ≤ K₂`, `|φ| ≤ C`. -/
theorem exists_abs_le_hessian_degenerating [T2Space X] [CompactSpace X] [ConnectedSpace X]
    (κ : SmoothTwoForm 𝓘(ℝ, E) X) (hκ : κ.Compatible (ofComplexManifold E X))
    (hκc : κ.IsClosed) (χ : SmoothTwoForm 𝓘(ℝ, E) X) (hχJ : χ.Invariant (ofComplexManifold E X))
    (hχc : χ.IsClosed) (hχ : ∀ (x : X) (v : E), 0 ≤ (hermitianForm E χ x v v).re)
    {γ : ℝ} (hγ : 0 < γ) {k : ℕ} (hk : 1 ≤ k) (hkn : k ≤ finrank ℂ E) {q : ℝ}
    (hq : (finrank ℂ E : ℝ) / k < q) (K₁ K₂ : ℝ) :
    ∃ C : ℝ, ∀ P : AdmissiblePair (finrank ℂ E), P.IsStructural γ →
      ∀ t ∈ Set.Ioc (0 : ℝ) 1, ∀ (c : ℝ) (F φ : X → ℝ),
      ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ F → ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) 2 φ →
      formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x)) = formPowIntegral κ (fun _ ↦ 1) →
      IsNormalizedSolution P κ (χ + t • κ) F c φ →
      (∀ x μ, IsRelEigenvalueVector (hermitianForm E κ x) (ddbarHermitianForm E (χ + t • κ) φ x) μ →
        μ ∈ hessianCone (finrank ℂ E) k) →
      formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x) ^ q) ≤ K₁ →
      c ^ finrank ℂ E / formPowIntegral (χ + t • κ) (fun _ ↦ 1) ≤ K₂ →
      ∀ x, |φ x| ≤ C := by
  sorry

end LInfinity

end TauCetiRoadmap.ComplexHessianEquations
