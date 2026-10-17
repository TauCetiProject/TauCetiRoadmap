import Mathlib.Topology.Compactification.OnePoint.ProjectiveLine
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.ModularForms.LFunction
import Mathlib.RepresentationTheory.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.Polynomial.Cyclotomic.Eval
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Tactic.LinearCombination
import TauCeti.NumberTheory.ModularForms.ModularSymbols.Basic

/-!
# ModularSymbolsPadicLFunctions: representative target signatures

This file is not the roadmap: the roadmap is `README.md`, which is definitive. The file records the
light definitions whose carriers exist in Mathlib and Tau Ceti at the pinned commits, and the
signatures of milestone theorems that can be stated against them, with explicit coefficient and action conventions. It is not exhaustive. Milestone proofs use `sorry`;
definitions have real bodies.

Design choices made explicit here:

* Divisors on the cusps are `MonoidAlgebra ℤ (OnePoint ℚ)` with Mathlib's permutation
  representation of `GL₂(ℚ)`, and `Δ₀` is Tau Ceti's augmentation subrepresentation. This is
  definitionally the divisor module `TauCeti.ModularSymbols.degreeZero ℤ` of pinned Tau Ceti, imported directly.
* A right action `v ↦ v ∣ γ` of `Γ` on the coefficients is recorded as the left representation
  `ρ γ = (· ∣ γ⁻¹)`, so a modular symbol satisfies `φ (γ • D) = ρ γ (φ D)`.
* `V_k` is the module of homogeneous polynomials of degree `k` in `X 0 = X`, `X 1 = Y`, with the
  row-adjugate right action `P ↦ P(dX - cY, -bX + aY)`; Tau Ceti's `binaryFormRep` uses
  `P ↦ P(aX + bY, cX + dY)` and the two agree after `γ ↦ (adj γ)ᵀ`.
* Group cohomology in degree one is used through explicit cocycles and coboundaries, so that the
  boundary exact sequence of Layer 0 is stated without choosing a model of `H¹`.
* Heavy objects (the period symbol, parabolic cohomology as a quotient, distribution modules and
  their topologies, overconvergent symbols, the p-adic L-function, half-logarithms as functions
  on the open disc) are README targets and do not appear here.
-/

namespace TauCetiRoadmap.ModularSymbolsPadicLFunctions

open Matrix MvPolynomial TauCeti.ModularSymbols
open scoped MatrixGroups OnePoint

noncomputable section

/-! ## Layer 0: Hom-side modular symbols, Hecke operators and the Eichler–Shimura isomorphism -/

section Divisors

/-- The divisor `{b} - {a}`, the path from `a` to `b`. -/
def divisor (a b : OnePoint ℚ) : (degreeZero ℤ) :=
  ⟨MonoidAlgebra.single b 1 - MonoidAlgebra.single a 1,
    TauCeti.ModularSymbols.single_sub_single_mem_degreeZero b a⟩

/-- The path from `0` to `∞` has coefficient `-1` at `0` and `1` at `∞`. -/
example : (divisor ((0 : ℚ) : OnePoint ℚ) ∞ : MonoidAlgebra ℤ (OnePoint ℚ)).coeff
      ((0 : ℚ) : OnePoint ℚ) = -1 ∧
    (divisor ((0 : ℚ) : OnePoint ℚ) ∞ : MonoidAlgebra ℤ (OnePoint ℚ)).coeff ∞ = 1 := sorry

/-- A constant path is zero. -/
example (a : OnePoint ℚ) : divisor a a = 0 := by
  ext; simp [divisor]

/-- The intermediate cusp cancels when paths are concatenated. -/
example : divisor ((0 : ℚ) : OnePoint ℚ) ((1 : ℚ) : OnePoint ℚ) +
    divisor ((1 : ℚ) : OnePoint ℚ) ∞ = divisor ((0 : ℚ) : OnePoint ℚ) ∞ := sorry

end Divisors

section Symbols

variable {R V : Type*} [CommRing R] [AddCommGroup V] [Module R V]

/-- **Modular symbols** `Symb_Γ(V) = Hom_{ℤ[Γ]}(Δ₀, V)`: the additive maps `φ : Δ₀ → V` with
`φ(γ D) = ρ(γ) φ(D)` for `γ ∈ Γ`, as an `R`-submodule under pointwise scalars
(Pollack–Stevens §2.1). Belongs to Layer 0, §0.2. -/
def symbols (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) :
    Submodule R ((degreeZero ℤ) →ₗ[ℤ] V) where
  carrier := {φ | ∀ (γ : Γ) (D : degreeZero ℤ),
    φ (degreeZeroRep ℤ (γ : SL(2, ℤ)) D) = ρ γ (φ D)}
  add_mem' {a b} ha hb γ D := by
    simp only [LinearMap.add_apply, map_add, ha γ D, hb γ D]
  zero_mem' γ D := by simp
  smul_mem' a φ hφ γ D := by
    simp only [LinearMap.smul_apply, hφ γ D, map_smul]

theorem mem_symbols_iff (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V)
    (φ : (degreeZero ℤ) →ₗ[ℤ] V) :
    φ ∈ symbols Γ ρ ↔ ∀ (γ : Γ) (D : degreeZero ℤ),
      φ (degreeZeroRep ℤ (γ : SL(2, ℤ)) D) = ρ γ (φ D) :=
  Iff.rfl

/-- A modular symbol is determined by its values on the unimodular divisors `{g 0} - {g ∞}`
(Manin's theorem, `TauCeti.ModularSymbols.degreeZero_eq_span_unimodular`). -/
theorem symbols_ext (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V)
    {φ ψ : (degreeZero ℤ) →ₗ[ℤ] V} (hφ : φ ∈ symbols Γ ρ) (hψ : ψ ∈ symbols Γ ρ)
    (h : ∀ g : SL(2, ℤ), φ (divisor (Matrix.SpecialLinearGroup.mapGL ℚ g • (∞ : OnePoint ℚ)) (Matrix.SpecialLinearGroup.mapGL ℚ g • ((0 : ℚ) : OnePoint ℚ))) =
      ψ (divisor (Matrix.SpecialLinearGroup.mapGL ℚ g • (∞ : OnePoint ℚ)) (Matrix.SpecialLinearGroup.mapGL ℚ g • ((0 : ℚ) : OnePoint ℚ)))) :
    φ = ψ := sorry

/-- The zero map is a modular symbol for every `Γ` and `V`. -/
example (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) : (0 : (degreeZero ℤ) →ₗ[ℤ] V) ∈ symbols Γ ρ :=
  (symbols Γ ρ).zero_mem

/-- Scalar multiples of symbols remain symbols and evaluate by pointwise scalar multiplication. -/
example (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) (a : R)
    {φ : (degreeZero ℤ) →ₗ[ℤ] V} (hφ : φ ∈ symbols Γ ρ) :
    a • φ ∈ symbols Γ ρ ∧ ∀ D, (a • φ) D = a • φ D :=
  ⟨(symbols Γ ρ).smul_mem a hφ, fun _ ↦ rfl⟩

/-- Level one, trivial coefficients: `Symb_{SL₂(ℤ)}(ℤ) = 0` (the Manin relations give `2v = 0` and
`3v = 0`). A definition on all of `ℤ[P¹(ℚ)]` would contain the constant functions instead. -/
theorem symbols_SL2Z_trivial :
    symbols (⊤ : Subgroup SL(2, ℤ)) (Representation.trivial ℤ (⊤ : Subgroup SL(2, ℤ)) ℤ) = ⊥ :=
  sorry

end Symbols

section Coefficients

variable (R : Type*) [CommRing R]

/-- The row-adjugate right action `(P ∣ γ)(X, Y) = P(dX - cY, -bX + aY)` of an integral matrix
`γ = !![a, b; c, d]`, as a substitution of variables. -/
def slashPoly (γ : Matrix (Fin 2) (Fin 2) ℤ) :
    MvPolynomial (Fin 2) R →ₐ[R] MvPolynomial (Fin 2) R :=
  MvPolynomial.aeval ![C (γ 1 1 : R) * X 0 - C (γ 1 0 : R) * X 1,
    -(C (γ 0 1 : R) * X 0) + C (γ 0 0 : R) * X 1]

/-- The action is a right action: `P ∣ (γ δ) = (P ∣ γ) ∣ δ`, because `(γ δ)* = δ* γ*`. -/
theorem slashPoly_mul (γ δ : Matrix (Fin 2) (Fin 2) ℤ) :
    slashPoly R (γ * δ) = (slashPoly R δ).comp (slashPoly R γ) := sorry

/-- The action preserves the degree. -/
theorem slashPoly_mem_Vk {k : ℕ} (γ : Matrix (Fin 2) (Fin 2) ℤ) {P : MvPolynomial (Fin 2) R}
    (hP : P ∈ MvPolynomial.homogeneousSubmodule (Fin 2) R k) : slashPoly R γ P ∈ MvPolynomial.homogeneousSubmodule (Fin 2) R k := sorry

/-- A scalar matrix `c • 1` acts on `V_k` by `c ^ k`. -/
theorem slashPoly_scalar {k : ℕ} (c : ℤ) {P : MvPolynomial (Fin 2) R} (hP : P ∈ MvPolynomial.homogeneousSubmodule (Fin 2) R k) :
    slashPoly R (c • (1 : Matrix (Fin 2) (Fin 2) ℤ)) P = (c : R) ^ k • P := sorry

/-- Degree-zero coefficients are fixed by every matrix substitution. -/
example (γ : Matrix (Fin 2) (Fin 2) ℤ) : slashPoly R γ (1 : MvPolynomial (Fin 2) R) = 1 :=
  map_one _

/-- A nonunit scalar acts by its degree power, rather than an inverse power. -/
example : slashPoly ℤ (2 • (1 : Matrix (Fin 2) (Fin 2) ℤ)) (X 0 ^ 2) =
    4 * X 0 ^ 2 := sorry

/-- Convention witness: `T = !![1, 1; 0, 1]` fixes `X` and sends `Y` to `Y - X`. The unadjugated
substitution `P ↦ P((X, Y) T)` would send `Y` to `X + Y`, and the substitution
`P ↦ P(aX + bY, cX + dY)` of `binaryFormRep` would send `X` to `X + Y`. -/
example : slashPoly ℤ !![1, 1; 0, 1] (X 0) = X 0 ∧
    slashPoly ℤ !![1, 1; 0, 1] (X 1) = -X 0 + X 1 := by
  simp [slashPoly]

end Coefficients

section HeckeMonoid

/-- **The Hecke monoid** `Σ₀(N)`: integral matrices `!![a, b; c, d]` with `det ≠ 0`, `N ∣ c` and
`gcd(a, N) = 1`. Belongs to Layer 0, §0.1. -/
def Sigma0 (N : ℕ) : Submonoid (Matrix (Fin 2) (Fin 2) ℤ) where
  carrier := {γ | γ.det ≠ 0 ∧ (N : ℤ) ∣ γ 1 0 ∧ IsCoprime (γ 0 0) (N : ℤ)}
  mul_mem' {γ δ} hγ hδ := by
    obtain ⟨hγ1, hγ2, hγ3⟩ := hγ
    obtain ⟨hδ1, ⟨m, hm⟩, hδ3⟩ := hδ
    refine ⟨by rw [det_mul]; exact mul_ne_zero hγ1 hδ1, ?_, ?_⟩
    · rw [mul_apply, Fin.sum_univ_two]
      exact dvd_add (dvd_mul_of_dvd_left hγ2 _) (dvd_mul_of_dvd_right (Dvd.intro m hm.symm) _)
    · rw [mul_apply, Fin.sum_univ_two, hm,
        show γ 0 1 * ((N : ℤ) * m) = (N : ℤ) * (γ 0 1 * m) by ring]
      exact (hγ3.mul_left hδ3).add_mul_left_left (γ 0 1 * m)
  one_mem' := by simp [isCoprime_one_left]

/-- `Γ₀(N) ⊆ Σ₀(N)`. -/
theorem Gamma0_le_Sigma0 (N : ℕ) {γ : SL(2, ℤ)} (hγ : γ ∈ CongruenceSubgroup.Gamma0 N) :
    (γ : Matrix (Fin 2) (Fin 2) ℤ) ∈ Sigma0 N := sorry

/-- Upper triangular Hecke representatives lie in `Σ₀(N)`. -/
example (N : ℕ) (a : ℤ) (ℓ : ℕ) (hℓ : ℓ ≠ 0) : !![1, a; 0, (ℓ : ℤ)] ∈ Sigma0 N := by
  refine ⟨?_, ?_, ?_⟩ <;> simp [Matrix.det_fin_two, hℓ, isCoprime_one_left]

/-- `diag(2, 1) ∉ Σ₀(4)`: the condition is on the upper-left entry. -/
example : ¬ (!![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) ∈ Sigma0 4 := by
  rintro ⟨-, -, h⟩
  rw [Int.isCoprime_iff_gcd_eq_one] at h
  simp at h
  norm_num at h

/-- The same diagonal matrix is admitted at level three. -/
example : (!![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) ∈ Sigma0 3 := sorry

/-- Lower-left divisibility and nonsingularity are independent requirements. -/
example (N : ℕ) :
    (!![1, 0; 1, 1] : Matrix (Fin 2) (Fin 2) ℤ) ∉ Sigma0 2 ∧
    (!![1, 0; 0, 0] : Matrix (Fin 2) (Fin 2) ℤ) ∉ Sigma0 N := sorry

/-- An integral matrix of nonzero determinant as an element of `GL₂(ℚ)` (the identity otherwise). -/
def intMatrixToGL (δ : Matrix (Fin 2) (Fin 2) ℤ) : GL (Fin 2) ℚ :=
  if h : δ.det ≠ 0 then
    Matrix.GeneralLinearGroup.mkOfDetNeZero ((Int.castRingHom ℚ).mapMatrix δ)
      (by rw [← RingHom.map_det]; simpa using h)
  else 1

/-- The rational inclusion preserves the identity. -/
example : intMatrixToGL 1 = 1 := sorry

/-- On nonsingular matrices the rational inclusion preserves multiplication. -/
example (γ δ : Matrix (Fin 2) (Fin 2) ℤ) (hγ : γ.det ≠ 0) (hδ : δ.det ≠ 0) :
    intMatrixToGL (γ * δ) = intMatrixToGL γ * intMatrixToGL δ := sorry

variable {R V : Type*} [CommRing R] [AddCommGroup V] [Module R V]

/-- The slash `(φ ∣ δ)(D) = φ(δ D) ∣ δ` of a map `φ : Δ₀ → V`, for a right action `act` of integral
matrices on `V` (`act δ v = v ∣ δ`). -/
def slashSymbol (act : Matrix (Fin 2) (Fin 2) ℤ → V →ₗ[R] V) (δ : Matrix (Fin 2) (Fin 2) ℤ)
    (φ : (degreeZero ℤ) →ₗ[ℤ] V) : (degreeZero ℤ) →ₗ[ℤ] V :=
  (act δ).toAddMonoidHom.toIntLinearMap ∘ₗ φ ∘ₗ (degreeZeroGLRep ℤ) (intMatrixToGL δ)

/-- **The Hecke operator** `T_ℓ = ∣ diag(ℓ, 1) + Σ_{a < ℓ} ∣ !![1, a; 0, ℓ]` (Pollack–Stevens §2.1),
for a prime `ℓ ∤ N`. Belongs to Layer 0, §0.3. -/
def heckeT (act : Matrix (Fin 2) (Fin 2) ℤ → V →ₗ[R] V) (ℓ : ℕ) (φ : (degreeZero ℤ) →ₗ[ℤ] V) :
    (degreeZero ℤ) →ₗ[ℤ] V :=
  slashSymbol act !![(ℓ : ℤ), 0; 0, 1] φ +
    ∑ a ∈ Finset.range ℓ, slashSymbol act !![1, (a : ℤ); 0, (ℓ : ℤ)] φ

/-- **The Hecke operator** `U_q = Σ_{a < q} ∣ !![1, a; 0, q]` for `q ∣ N`. -/
def heckeU (act : Matrix (Fin 2) (Fin 2) ℤ → V →ₗ[R] V) (q : ℕ) (φ : (degreeZero ℤ) →ₗ[ℤ] V) :
    (degreeZero ℤ) →ₗ[ℤ] V :=
  ∑ a ∈ Finset.range q, slashSymbol act !![1, (a : ℤ); 0, (q : ℤ)] φ

/-- The hypothesis that `act` is a right action of `Σ₀(N)` restricting to `ρ` on `Γ₀(N)`. -/
def IsSigma0Action (N : ℕ) (act : Matrix (Fin 2) (Fin 2) ℤ → V →ₗ[R] V)
    (ρ : Representation R (CongruenceSubgroup.Gamma0 N) V) : Prop :=
  (∀ γ ∈ Sigma0 N, ∀ δ ∈ Sigma0 N, act (γ * δ) = act δ ∘ₗ act γ) ∧ act 1 = LinearMap.id ∧
    ∀ γ : CongruenceSubgroup.Gamma0 N, act ((γ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ) = ρ γ⁻¹

/-- `T_ℓ` and `U_q` preserve `Γ₀(N)`-modular symbols. -/
theorem heckeT_mem_symbols (N : ℕ) (act : Matrix (Fin 2) (Fin 2) ℤ → V →ₗ[R] V)
    (ρ : Representation R (CongruenceSubgroup.Gamma0 N) V) (hact : IsSigma0Action N act ρ)
    {ℓ : ℕ} (hℓ : ℓ.Prime) (hℓN : ¬ ℓ ∣ N) {φ : (degreeZero ℤ) →ₗ[ℤ] V}
    (hφ : φ ∈ symbols (CongruenceSubgroup.Gamma0 N) ρ) :
    heckeT act ℓ φ ∈ symbols (CongruenceSubgroup.Gamma0 N) ρ := sorry

theorem heckeU_mem_symbols (N : ℕ) (act : Matrix (Fin 2) (Fin 2) ℤ → V →ₗ[R] V)
    (ρ : Representation R (CongruenceSubgroup.Gamma0 N) V) (hact : IsSigma0Action N act ρ)
    {q : ℕ} (hq : q.Prime) (hqN : q ∣ N) {φ : (degreeZero ℤ) →ₗ[ℤ] V}
    (hφ : φ ∈ symbols (CongruenceSubgroup.Gamma0 N) ρ) :
    heckeU act q φ ∈ symbols (CongruenceSubgroup.Gamma0 N) ρ := sorry

/-- Good-prime Hecke operators commute on equivariant symbols (Layer 0 milestone). -/
theorem heckeT_comm (N : ℕ) (act : Matrix (Fin 2) (Fin 2) ℤ → V →ₗ[R] V)
    (ρ : Representation R (CongruenceSubgroup.Gamma0 N) V) (hact : IsSigma0Action N act ρ)
    {ℓ m : ℕ} (hℓ : ℓ.Prime) (hm : m.Prime) (hℓN : ¬ ℓ ∣ N) (hmN : ¬ m ∣ N)
    {φ : (degreeZero ℤ) →ₗ[ℤ] V} (hφ : φ ∈ symbols (CongruenceSubgroup.Gamma0 N) ρ) :
    heckeT act ℓ (heckeT act m φ) = heckeT act m (heckeT act ℓ φ) := sorry

/-- A singular matrix uses the specified identity extension; a nonzero determinant uses
its actual rational matrix. -/
example : intMatrixToGL 0 = 1 ∧
    (intMatrixToGL !![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) = !![2, 0; 0, 1] := sorry

/-- Slashing by the identity with the trivial coefficient action fixes a map. -/
example (φ : degreeZero ℤ →ₗ[ℤ] V) :
    slashSymbol (fun _ ↦ (LinearMap.id : V →ₗ[R] V)) 1 φ = φ := sorry

/-- For the cusp-coordinate functional at infinity and trivial coefficients, the three
terms of `T₂` give `3`, while the two terms of `U₂` give `2`. -/
example :
    let φ : degreeZero ℤ →ₗ[ℤ] ℤ :=
      Finsupp.lapply ∞ ∘ₗ (MonoidAlgebra.coeffLinearEquiv ℤ).toLinearMap ∘ₗ
        (degreeZero ℤ).subtype
    heckeT (fun _ ↦ (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) 2 φ (divisor ((0 : ℚ) : OnePoint ℚ) ∞) = 3 ∧
      heckeU (fun _ ↦ (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) 2 φ (divisor ((0 : ℚ) : OnePoint ℚ) ∞) = 2 := sorry

/-- The trivial action satisfies the action contract; the zero assignment fails its unit law. -/
example (N : ℕ) :
    IsSigma0Action N (fun _ ↦ LinearMap.id)
      (Representation.trivial ℤ (CongruenceSubgroup.Gamma0 N) ℤ) ∧
    ¬ IsSigma0Action N (fun _ ↦ 0)
      (Representation.trivial ℤ (CongruenceSubgroup.Gamma0 N) ℤ) := sorry

end HeckeMonoid

section Involution

/-- **The involution at infinity** `ι = !![-1, 0; 0, 1]`. -/
def iotaMatrix : Matrix (Fin 2) (Fin 2) ℤ := !![-1, 0; 0, 1]

theorem iotaMatrix_mul_self : iotaMatrix * iotaMatrix = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [iotaMatrix]

/-- `ι ∉ SL₂(ℤ)`: its determinant is `-1`. -/
theorem det_iotaMatrix : iotaMatrix.det = -1 := by
  simp [iotaMatrix, Matrix.det_fin_two]

/-- The involution is an algebraic Hecke-monoid element with negative determinant;
its ordinary fractional-linear transformation sends `i` outside the upper half-plane. -/
example (N : ℕ) : iotaMatrix ∈ Sigma0 N ∧ ¬ 0 < iotaMatrix.det ∧
    (((-1 : ℂ) * Complex.I + 0) / (0 * Complex.I + 1)).im = -1 := by
  refine ⟨?_, ?_, ?_⟩
  · change iotaMatrix.det ≠ 0 ∧ (N : ℤ) ∣ iotaMatrix 1 0 ∧
      IsCoprime (iotaMatrix 0 0) (N : ℤ)
    simp [iotaMatrix, Matrix.det_fin_two, IsCoprime.neg_left_iff, isCoprime_one_left]
  · simp [det_iotaMatrix]
  · norm_num

/-- The triangular Hecke representatives have positive determinant at every prime. -/
example (a : ℤ) (ℓ : ℕ) (hℓ : ℓ.Prime) :
    0 < (!![1, a; 0, (ℓ : ℤ)] : Matrix (Fin 2) (Fin 2) ℤ).det := by
  simpa [Matrix.det_fin_two] using (Int.natCast_pos.mpr hℓ.pos)

/-- The cusp action fixes zero and infinity and negates the finite coordinate. -/
example : intMatrixToGL iotaMatrix • (((0 : ℚ) : OnePoint ℚ)) = ((0 : ℚ) : OnePoint ℚ) ∧
    intMatrixToGL iotaMatrix • (∞ : OnePoint ℚ) = ∞ ∧
    intMatrixToGL iotaMatrix • (((1 / 2 : ℚ) : OnePoint ℚ)) =
      OnePoint.some (-(1 / 2 : ℚ)) := sorry

/-- On `V_k` the involution acts by `P(X, Y) ↦ P(X, -Y)`. -/
example : slashPoly ℤ iotaMatrix (X 0) = X 0 ∧ slashPoly ℤ iotaMatrix (X 1) = -X 1 := by
  simp [slashPoly, iotaMatrix]

end Involution

section Boundary

variable {R V : Type*} [CommRing R] [AddCommGroup V] [Module R V]

/-- **Boundary symbols** `BSymb_Γ(V) = Hom_{ℤ[Γ]}(ℤ[P¹(ℚ)], V)`, as an `R`-submodule
under pointwise scalars. Belongs to Layer 0, §0.4. -/
def boundarySymbols (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) :
    Submodule R (MonoidAlgebra ℤ (OnePoint ℚ) →ₗ[ℤ] V) where
  carrier := {ψ | ∀ (γ : Γ) (D : MonoidAlgebra ℤ (OnePoint ℚ)),
    ψ (Representation.ofMulAction ℤ (GL (Fin 2) ℚ) (OnePoint ℚ) (Matrix.SpecialLinearGroup.mapGL ℚ (γ : SL(2, ℤ))) D) = ρ γ (ψ D)}
  add_mem' {a b} ha hb γ D := by simp [ha γ D, hb γ D]
  zero_mem' γ D := by simp
  smul_mem' a ψ hψ γ D := by
    simp only [LinearMap.smul_apply, hψ γ D, map_smul]

/-- Coefficient-linear restriction of boundary symbols along `Δ₀ ⊆ ℤ[P¹(ℚ)]`,
landing in the module of equivariant symbols. -/
def restrictBoundary (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) :
    boundarySymbols Γ ρ →ₗ[R] symbols Γ ρ where
  toFun ψ := ⟨ψ.val ∘ₗ (degreeZero ℤ).subtype, fun γ D ↦ ψ.property γ D.val⟩
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- **Eisenstein symbols** `Eis_Γ(V)`, the `R`-submodule of equivariant symbols given by
the range of boundary restriction. -/
def eisSymbols (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) :
    Submodule R (symbols Γ ρ) :=
  LinearMap.range (restrictBoundary Γ ρ)

/-- Boundary restriction takes values in equivariant symbols. -/
theorem restrictBoundary_mem_symbols (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V)
    (ψ : boundarySymbols Γ ρ) :
    (restrictBoundary Γ ρ ψ : (degreeZero ℤ) →ₗ[ℤ] V) ∈ symbols Γ ρ :=
  (restrictBoundary Γ ρ ψ).property

/-- Pointwise scalars preserve boundary symbols, restriction commutes with scalars,
and scalar multiples of its values remain Eisenstein. -/
example (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) (a : R)
    (ψ : boundarySymbols Γ ρ) :
    a • (ψ : MonoidAlgebra ℤ (OnePoint ℚ) →ₗ[ℤ] V) ∈ boundarySymbols Γ ρ ∧
      restrictBoundary Γ ρ (a • ψ) = a • restrictBoundary Γ ρ ψ ∧
      a • restrictBoundary Γ ρ ψ ∈ eisSymbols Γ ρ :=
  ⟨(boundarySymbols Γ ρ).smul_mem a ψ.property, map_smul _ _ _,
    (eisSymbols Γ ρ).smul_mem a (LinearMap.mem_range_self _ ψ)⟩

/-- `res` is not injective: the degree map (the constant boundary function `1`) is a nonzero
boundary symbol for the trivial action that restricts to zero on `Δ₀`. -/
example :
    ∃ ψ : boundarySymbols (⊤ : Subgroup SL(2, ℤ))
        (Representation.trivial ℤ (⊤ : Subgroup SL(2, ℤ)) ℤ),
      (ψ : MonoidAlgebra ℤ (OnePoint ℚ) →ₗ[ℤ] ℤ) = degree ℤ ∧
        restrictBoundary _ _ ψ = 0 := sorry

/-- The cocycle `γ ↦ φ({γ x} - {x})` of a modular symbol, for a base cusp `x`. -/
def symbolCocycle (Γ : Subgroup SL(2, ℤ)) (x : OnePoint ℚ) (φ : (degreeZero ℤ) →ₗ[ℤ] V) (γ : Γ) : V :=
  φ (divisor x (Matrix.SpecialLinearGroup.mapGL ℚ (γ : SL(2, ℤ)) • x))

/-- The cocycle identity `c(γ η) = ρ(γ) c(η) + c(γ)`. -/
theorem symbolCocycle_mul (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) (x : OnePoint ℚ)
    {φ : (degreeZero ℤ) →ₗ[ℤ] V} (hφ : φ ∈ symbols Γ ρ) (γ η : Γ) :
    symbolCocycle Γ x φ (γ * η) = ρ γ (symbolCocycle Γ x φ η) + symbolCocycle Γ x φ γ := sorry

/-- The stabiliser `Γ_r` of a cusp `r`. -/
def cuspStabilizer (Γ : Subgroup SL(2, ℤ)) (r : OnePoint ℚ) : Subgroup Γ :=
  (MulAction.stabilizer (GL (Fin 2) ℚ) r).comap ((Matrix.SpecialLinearGroup.mapGL ℚ).comp Γ.subtype)

/-- A function `c : Γ → V` is a coboundary on a subgroup `H` if `c h = ρ h v - v` on `H`. -/
def IsCoboundaryOn (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) (H : Subgroup Γ)
    (c : Γ → V) : Prop :=
  ∃ v : V, ∀ h ∈ H, c h = ρ h v - v

/-- The restriction class vanishes at every cusp: each restricted function is a coboundary
(Wiese, Proposition 4.14). The cocycle identity is a separate hypothesis. -/
def IsParabolic (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) (c : Γ → V) : Prop :=
  ∀ r : OnePoint ℚ, IsCoboundaryOn Γ ρ (cuspStabilizer Γ r) c

/-- Boundary exact sequence, exactness at `Symb_Γ(V)`: the cocycle of a symbol is a coboundary iff
the symbol is Eisenstein (Layer 0 milestone, integrally). -/
theorem symbolCocycle_isCoboundary_iff (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V)
    (x : OnePoint ℚ) {φ : (degreeZero ℤ) →ₗ[ℤ] V} (hφ : φ ∈ symbols Γ ρ) :
    IsCoboundaryOn Γ ρ ⊤ (symbolCocycle Γ x φ) ↔ ⟨φ, hφ⟩ ∈ eisSymbols Γ ρ := sorry

/-- The cocycle of a symbol is parabolic. -/
theorem symbolCocycle_isParabolic (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V)
    (x : OnePoint ℚ) {φ : (degreeZero ℤ) →ₗ[ℤ] V} (hφ : φ ∈ symbols Γ ρ) :
    IsParabolic Γ ρ (symbolCocycle Γ x φ) := sorry

/-- Boundary exact sequence, exactness at `H¹`: every parabolic cocycle is cohomologous to the
cocycle of a symbol. -/
theorem exists_symbol_of_isParabolic (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V)
    (x : OnePoint ℚ) (c : Γ → V) (hc : ∀ γ η : Γ, c (γ * η) = ρ γ (c η) + c γ)
    (hpar : IsParabolic Γ ρ c) :
    ∃ φ ∈ symbols Γ ρ, IsCoboundaryOn Γ ρ ⊤ (fun γ ↦ c γ - symbolCocycle Γ x φ γ) := sorry

/-- The degree is a boundary symbol for trivial coefficients, with value `1` on a cusp. -/
example : degree ℤ ∈ boundarySymbols (⊤ : Subgroup SL(2, ℤ))
      (Representation.trivial ℤ (⊤ : Subgroup SL(2, ℤ)) ℤ) ∧
    degree ℤ (MonoidAlgebra.single ∞ 1) = 1 := sorry

/-- For the trivial group, restricting the cusp-coordinate functional at infinity gives
an Eisenstein symbol whose value on the path from `0` to `∞` is `1`. -/
example :
    ∃ ψ : boundarySymbols (⊥ : Subgroup SL(2, ℤ))
        (Representation.trivial ℤ (⊥ : Subgroup SL(2, ℤ)) ℤ),
      (ψ : MonoidAlgebra ℤ (OnePoint ℚ) →ₗ[ℤ] ℤ) =
          Finsupp.lapply ∞ ∘ₗ (MonoidAlgebra.coeffLinearEquiv ℤ).toLinearMap ∧
        restrictBoundary _ _ ψ ∈ eisSymbols _ _ ∧
          (restrictBoundary _ _ ψ : (degreeZero ℤ) →ₗ[ℤ] ℤ)
            (divisor ((0 : ℚ) : OnePoint ℚ) ∞) = 1 := sorry

/-- The cocycle convention gives `+1` when `S` moves `∞` to `0` and the functional reads
its coefficient at `0`. -/
example :
    let φ : degreeZero ℤ →ₗ[ℤ] ℤ :=
      Finsupp.lapply ((0 : ℚ) : OnePoint ℚ) ∘ₗ
        (MonoidAlgebra.coeffLinearEquiv ℤ).toLinearMap ∘ₗ (degreeZero ℤ).subtype
    symbolCocycle (⊤ : Subgroup SL(2, ℤ)) ∞ φ ⟨ModularGroup.S, by trivial⟩ = 1 := sorry

/-- `T` stabilises infinity, whereas `S` does not. -/
example :
    (⟨ModularGroup.T, by trivial⟩ : (⊤ : Subgroup SL(2, ℤ))) ∈
        cuspStabilizer (⊤ : Subgroup SL(2, ℤ)) ∞ ∧
    (⟨ModularGroup.S, by trivial⟩ : (⊤ : Subgroup SL(2, ℤ))) ∉
        cuspStabilizer (⊤ : Subgroup SL(2, ℤ)) ∞ := sorry

/-- For trivial coefficients the zero function is a coboundary on every cusp stabiliser;
the constant function `1` cannot be one, since every coboundary vanishes at the identity. -/
example (Γ : Subgroup SL(2, ℤ)) :
    IsCoboundaryOn Γ (Representation.trivial ℤ Γ ℤ) ⊤ (fun _ ↦ 0) ∧
    ¬ IsCoboundaryOn Γ (Representation.trivial ℤ Γ ℤ) ⊤ (fun _ ↦ 1) ∧
    IsParabolic Γ (Representation.trivial ℤ Γ ℤ) (fun _ ↦ 0) ∧
    ¬ IsParabolic Γ (Representation.trivial ℤ Γ ℤ) (fun _ ↦ 1) := sorry

end Boundary

section DrinfeldManin

variable {K H : Type*} [Field K] [AddCommGroup H] [Module K H]

/-- The **Bézout projector** `e = b(A) G(A)` attached to an operator `A` and polynomials `b, G`
(the core of the rational Drinfeld–Manin splitting, Layer 0, §0.8). -/
def bezoutProjector (A : Module.End K H) (b G : Polynomial K) : Module.End K H :=
  Polynomial.aeval A b * Polynomial.aeval A G

/-- If `a F + b G = 1`, `F(A)` kills `P` and `G(A)` maps into `P`, then `e` is an idempotent with
image `P` restricting to the identity on `P`. -/
theorem bezoutProjector_idempotent (A : Module.End K H) (P : Submodule K H) (a b F G : Polynomial K)
    (hBez : a * F + b * G = 1) (hF : ∀ x ∈ P, Polynomial.aeval A F x = 0)
    (hG : ∀ x, Polynomial.aeval A G x ∈ P) (hP : ∀ x ∈ P, A x ∈ P) :
    bezoutProjector A b G * bezoutProjector A b G = bezoutProjector A b G ∧
      (∀ x ∈ P, bezoutProjector A b G x = x) ∧ ∀ x, bezoutProjector A b G x ∈ P := sorry

/-- The projector commutes with every operator commuting with `A`. -/
theorem bezoutProjector_comm (A B : Module.End K H) (b G : Polynomial K) (hAB : Commute A B) :
    Commute (bezoutProjector A b G) B := sorry

/-- The rational model of the Drinfeld–Manin tests: `T(x, y) = (y, 2y)` on `ℚ²` with `P = ℚ × 0`,
`F = X`, `G = X - 2`; the projector `1 - T/2` sends `(0, 1)` to `(-1/2, 0)`. -/
example :
    let T : Module.End ℚ (Fin 2 → ℚ) := Matrix.toLin' !![0, 1; 0, 2]
    bezoutProjector T (Polynomial.C (-(1 / 2 : ℚ))) (Polynomial.X - Polynomial.C 2) ![0, 1] =
      ![-(1 / 2 : ℚ), 0] := by
  intro T
  ext i
  fin_cases i <;>
    norm_num [T, bezoutProjector, Matrix.mulVec, dotProduct, Fin.sum_univ_two, Matrix.vecHead,
      Matrix.vecTail]

/-- The rational projector fixes the parabolic generator, kills the image of `T`, is idempotent
and commutes with `T`. -/
example :
    let T : Module.End ℚ (Fin 2 → ℚ) := Matrix.toLin' !![0, 1; 0, 2]
    let e := bezoutProjector T (Polynomial.C (-(1 / 2 : ℚ))) (Polynomial.X - Polynomial.C 2)
    e ![1, 0] = ![1, 0] ∧ e * T = 0 ∧ e * e = e ∧ e * T = T * e := sorry

/-- Projection onto the first coordinate fails the required commutation relation. -/
example :
    let T : Module.End ℚ (Fin 2 → ℚ) := Matrix.toLin' !![0, 1; 0, 2]
    let π : Module.End ℚ (Fin 2 → ℚ) := Matrix.toLin' !![1, 0; 0, 0]
    ¬ Commute π T := sorry

/-- The same integral matrix admits no retraction fixing the first generator and killing its
image: the second generator would give `1 + 2 * s(0, 1) = 0` in `ℤ`. -/
example :
    let T : Module.End ℤ (Fin 2 → ℤ) := Matrix.toLin' !![0, 1; 0, 2]
    ¬ ∃ s : (Fin 2 → ℤ) →ₗ[ℤ] ℤ, s ![1, 0] = 1 ∧ ∀ v, s (T v) = 0 := sorry

end DrinfeldManin

/-! ## Layer 1: periods, critical values and p-stabilisation -/

section Periods

variable {W : Type*} [AddCommGroup W] [Module ℂ W]

/-- **The period coordinate** of `ψ` on the line spanned by `φ`: the scalar `Ω` with `ψ = Ω • φ`
(zero when there is none). A period is a coordinate on a line, never a canonical number. -/
def periodScalar (ψ φ : W) : ℂ :=
  open scoped Classical in
  if h : ∃ c : ℂ, ψ = c • φ then h.choose else 0

/-- Rescaling the basis by `λ` rescales the period by `λ⁻¹`. -/
theorem periodScalar_smul {ψ φ : W} (hφ : φ ≠ 0) (hψ : ∃ c : ℂ, ψ = c • φ) {c : ℂ} (hc : c ≠ 0) :
    periodScalar ψ (c • φ) = c⁻¹ * periodScalar ψ φ := sorry

/-- The coordinate of `6` in the basis `2` is `3`; doubling the basis halves the coordinate. -/
example : periodScalar (6 : ℂ) 2 = 3 ∧ periodScalar (6 : ℂ) 4 = 3 / 2 := sorry

end Periods

section Mellin

open Complex
open scoped Real UpperHalfPlane

/-- **The untwisted Mellin formula** in Mathlib's normalisation of `ModularForm.L`:
`2πi ∫_{i∞}^0 f(z) z^j dz = j! / (-2πi)^j · L(f, j + 1)` for a cusp form of weight `k + 2` and
`0 ≤ j ≤ k`, written through the Mellin transform of `t ↦ f(it)` (the path from `i∞` to `0` gives
the factor `-i^{j+1}`). When the width at `∞` is one, `ModularForm.L` is `Σ aₙ n^{-s}`. -/
theorem mellin_period_eq_L {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] {k j : ℕ} (hj : j ≤ k)
    {F : Type*} [FunLike F ℍ ℂ] [CuspFormClass F Γ (k + 2)] (f : F) :
    2 * π * I * (-(I ^ (j + 1)) *
        mellin (fun t : ℝ ↦ f (UpperHalfPlane.ofComplex (I * t))) ((j : ℂ) + 1)) =
      (j.factorial : ℂ) / (-2 * π * I) ^ j *
        ModularForm.L (k := (k : ℤ) + 2) (by omega) f ((j : ℂ) + 1) := sorry

end Mellin

/-! ## Layer 2: refinements, overconvergent symbols and small-slope p-adic L-functions -/

section Refinements

variable {K : Type*} [Field K]

/-- `α` is a root of the good-prime Hecke polynomial `X² - a_p X + ε(p) p^{k+1}`. -/
def IsGoodRefinementRoot (ap εp : K) (p k : ℕ) (α : K) : Prop :=
  α ^ 2 - ap * α + εp * (p : K) ^ (k + 1) = 0

/-- The two roots multiply to `ε(p) p^{k+1}`; a root is nonzero when both `εp ≠ 0`
and `(p : K) ≠ 0`. -/
theorem goodRoot_mul {ap εp α : K} {p k : ℕ} (hα : IsGoodRefinementRoot ap εp p k α) :
    α * (ap - α) = εp * (p : K) ^ (k + 1) := by
  unfold IsGoodRefinementRoot at hα
  linear_combination (-1 : K) * hα

/-- At `p ∣ N` the refinement eigenvalue is the actual nonzero `a_p`: there is none when `a_p = 0`. -/
def IsBadRefinement (ap α : K) : Prop := α = ap ∧ α ≠ 0

example (α : K) : ¬ IsBadRefinement 0 α := fun h ↦ h.2 h.1

/-- A nonzero bad-prime coefficient is its refinement eigenvalue. -/
example : IsBadRefinement (7 : ℚ) 7 := by norm_num [IsBadRefinement]

/-- A different nonzero scalar is not a refinement of the given bad-prime coefficient. -/
example : ¬ IsBadRefinement (7 : ℚ) 1 := by norm_num [IsBadRefinement]

/-- The polynomial `X² - 3X + 2` has roots `1` and `2`, and does not have root `0`. -/
example : IsGoodRefinementRoot (3 : ℚ) 1 2 0 1 ∧
    IsGoodRefinementRoot (3 : ℚ) 1 2 0 2 ∧
    ¬ IsGoodRefinementRoot (3 : ℚ) 1 2 0 0 := by norm_num [IsGoodRefinementRoot]

/-- In residue characteristic `p`, nonzero nebentypus alone does not exclude the zero root. -/
example : IsGoodRefinementRoot (K := ZMod 2) 0 1 2 0 0 := by
  norm_num [IsGoodRefinementRoot]
  decide

end Refinements

section Moments

variable (K : Type*) [NormedField K]

/-- Moment sequences that are `O(r^j)` for every `r > 1`: the moment model of `D†`. -/
def daggerMoments : Submodule K (ℕ → K) where
  carrier := {c | ∀ r : ℝ, 1 < r → ∃ C : ℝ, ∀ j, ‖c j‖ ≤ C * r ^ j}
  add_mem' := by
    intro a b ha hb r hr
    obtain ⟨A, hA⟩ := ha r hr
    obtain ⟨B, hB⟩ := hb r hr
    exact ⟨A + B, fun j ↦ (norm_add_le _ _).trans (by rw [add_mul]; exact add_le_add (hA j) (hB j))⟩
  zero_mem' := fun r _ ↦ ⟨0, by simp⟩
  smul_mem' := by
    intro c a ha r hr
    obtain ⟨A, hA⟩ := ha r hr
    exact ⟨‖c‖ * A, fun j ↦ by
      simpa [norm_mul, mul_assoc] using mul_le_mul_of_nonneg_left (hA j) (norm_nonneg c)⟩

/-- A bounded moment sequence satisfies every overconvergent growth bound. -/
theorem mem_daggerMoments_of_isBounded_range (c : ℕ → K)
    (hc : Bornology.IsBounded (Set.range c)) : c ∈ daggerMoments K := by
  obtain ⟨C, hC⟩ := isBounded_iff_forall_norm_le.mp hc
  have h : ∀ j, ‖c j‖ ≤ C := fun j ↦ hC _ ⟨j, rfl⟩
  intro r hr
  refine ⟨C, fun j ↦ (h j).trans ?_⟩
  exact le_mul_of_one_le_right ((norm_nonneg _).trans (h 0)) (one_le_pow₀ hr.le)

/-- Dirac moments at zero are bounded and satisfy every dagger growth bound. -/
example : Bornology.IsBounded (Set.range (Pi.single 0 (1 : K) : ℕ → K)) ∧
    (Pi.single 0 (1 : K) : ℕ → K) ∈ daggerMoments K := sorry

/-- Exponential p-adic growth fails the subexponential moment condition. -/
example (p : ℕ) [Fact p.Prime] :
    (fun j : ℕ ↦ ((p : ℚ_[p]) ^ j)⁻¹) ∉ daggerMoments ℚ_[p] := sorry

/-- `1/(j+1)` is a dagger moment sequence that is not bounded in `ℚ_p`. -/
example (p : ℕ) [Fact p.Prime] :
    (fun j : ℕ ↦ ((j : ℚ_[p]) + 1)⁻¹) ∈ daggerMoments ℚ_[p] ∧
      ¬ Bornology.IsBounded (Set.range fun j : ℕ ↦ ((j : ℚ_[p]) + 1)⁻¹) := sorry

end Moments

section Specialisation

variable {K : Type*} [Field K]

/-- The monoid `Σ₀(p)` over `ℤ_p`: `p ∤ a`, `p ∣ c`, `det ≠ 0`. -/
def Sigma0p (p : ℕ) [Fact p.Prime] : Submonoid (Matrix (Fin 2) (Fin 2) ℤ_[p]) where
  carrier := {γ | γ.det ≠ 0 ∧ IsUnit (γ 0 0) ∧ (p : ℤ_[p]) ∣ γ 1 0}
  mul_mem' {γ δ} hγ hδ := by
    obtain ⟨hγ1, hγ2, hγ3⟩ := hγ
    obtain ⟨hδ1, hδ2, ⟨m, hm⟩⟩ := hδ
    refine ⟨by rw [det_mul]; exact mul_ne_zero hγ1 hδ1, ?_, ?_⟩
    · rw [mul_apply, Fin.sum_univ_two, hm]
      have hn : γ 0 1 * ((p : ℤ_[p]) * m) ∈ IsLocalRing.maximalIdeal ℤ_[p] := by
        rw [PadicInt.maximalIdeal_eq_span_p]
        exact Ideal.mul_mem_left _ _ (Ideal.mul_mem_right _ _ (Ideal.subset_span rfl))
      by_contra hc
      have h := Ideal.sub_mem _ (show γ 0 0 * δ 0 0 + γ 0 1 * ((p : ℤ_[p]) * m) ∈
        IsLocalRing.maximalIdeal ℤ_[p] from hc) hn
      rw [add_sub_cancel_right] at h
      exact h (hγ2.mul hδ2)
    · rw [mul_apply, Fin.sum_univ_two]
      exact dvd_add (dvd_mul_of_dvd_left hγ3 _) (dvd_mul_of_dvd_right ⟨m, hm⟩ _)
  one_mem' := by simp

/-- **Specialisation** `ρ_k(μ) = ∫ (Y - zX)^k dμ = Σ_j C(k, j) (-1)^j μ(z^j) X^j Y^{k-j}`, on moment
sequences. Belongs to Layer 2, §2.3. -/
def specialiseMoments (k : ℕ) (c : ℕ → K) : MvPolynomial (Fin 2) K :=
  ∑ j ∈ Finset.range (k + 1),
    C ((k.choose j : K) * (-1) ^ j * c j) * X 0 ^ j * X 1 ^ (k - j)

/-- The `Y^k` coefficient is the total mass `μ(1)`. -/
theorem specialiseMoments_coeff_Yk (k : ℕ) (c : ℕ → K) :
    (specialiseMoments k c).coeff (Finsupp.single 1 k) = c 0 := sorry

/-- At degree zero specialisation is the constant polynomial of total mass. -/
example (c : ℕ → K) : specialiseMoments 0 c = C (c 0) := by
  simp [specialiseMoments]

/-- The Dirac distribution `δ₀` (moments `1, 0, 0, …`) specialises to `Y^k`. -/
example (k : ℕ) : specialiseMoments k (Pi.single 0 (1 : K)) = X 1 ^ k := by
  rw [specialiseMoments, Finset.sum_eq_single 0]
  · simp
  · intro j _ hj; simp [hj]
  · simp

/-- A distribution with only a moment above `k` specialises to zero. -/
example (k : ℕ) : specialiseMoments k (Pi.single (k + 1) (1 : K)) = 0 := by
  rw [specialiseMoments]
  refine Finset.sum_eq_zero fun j hj ↦ ?_
  have : j ≠ k + 1 := by simp at hj; omega
  simp [this]

/-- In characteristic zero, equal specialisations preserve every prescribed moment through `k`. -/
example [CharZero K] (k : ℕ) (c d : ℕ → K) :
    specialiseMoments k c = specialiseMoments k d ↔ ∀ j ≤ k, c j = d j := sorry

/-- Changing the degree-`k` moment adds `(-1)^k a X^k` to the specialisation. -/
example (k : ℕ) (c : ℕ → K) (a : K) :
    specialiseMoments k (c + Pi.single k a) =
      specialiseMoments k c + C ((-1) ^ k * a) * X 0 ^ k := sorry

/-- At degree zero, a change in mass changes the prescribed constant specialisation. -/
example (c : ℕ → K) (a : K) (ha : a ≠ 0) :
    specialiseMoments 0 (c + Pi.single 0 a) ≠ specialiseMoments 0 c := by
  simpa [specialiseMoments] using ha

/-- The upper-left entry must be a p-adic unit, rather than the lower-right entry. -/
example (p : ℕ) [Fact p.Prime] :
    (!![1, 0; 0, (p : ℤ_[p])] : Matrix (Fin 2) (Fin 2) ℤ_[p]) ∈ Sigma0p p ∧
    (!![(p : ℤ_[p]), 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ_[p]) ∉ Sigma0p p := sorry

/-- A unit lower-left entry and a zero determinant each exclude a matrix. -/
example (p : ℕ) [Fact p.Prime] :
    (!![1, 0; 1, 1] : Matrix (Fin 2) (Fin 2) ℤ_[p]) ∉ Sigma0p p ∧
    (!![1, 0; 0, 0] : Matrix (Fin 2) (Fin 2) ℤ_[p]) ∉ Sigma0p p := sorry

end Specialisation

/-! ## Layer 3: critical slope

The critical eigensymbols and local analytic families of README §3.0 assume an odd prime not dividing
the tame level and distinct Hecke roots. -/

/-! ## Layer 4: tame twists, supersingular primes, comparisons and examples -/

section Supersingular

/-- The zero series has bounded coefficients, and the zero function vanishes on the infinite
open unit disc. -/
example (p : ℕ) [Fact p.Prime] :
    Bornology.IsBounded (Set.range fun n ↦ PowerSeries.coeff n (0 : PowerSeries ℚ_[p])) ∧
      Set.Infinite {T : ℚ_[p] | ‖T‖ < 1 ∧ (0 : ℚ_[p] → ℚ_[p]) T = 0} := sorry

-- The cyclotomic factors and their value at one are supplied by Mathlib.
#check Polynomial.cyclotomic_prime_pow_eq_geom_sum
#check Polynomial.eval_one_cyclotomic_prime_pow

/-- The first factor at `p = 2` has root `-1`. -/
example : (Polynomial.cyclotomic 2 ℤ).eval (-1) = 0 := by simp

end Supersingular

section Depletion

variable {K : Type*} [Field K]

/-- The coefficients of the Euler-depleted form `f^[ℓ]`: `a_n` for `ℓ ∤ n` and `0` for `ℓ ∣ n`. -/
def depletedCoeff (a : ℕ → K) (ℓ n : ℕ) : K :=
  if ℓ ∣ n then 0 else a n

/-- The depleted coefficients agree with those of `f - a_ℓ V_ℓ f + ε(ℓ) ℓ^{k+1} V_{ℓ²} f` under the
good-prime recurrence (Layer 4, §4.3). -/
theorem depletedCoeff_eq (a : ℕ → K) {ℓ : ℕ} (hℓ : ℓ.Prime) (e : K)
    (hrec : ∀ m, a (ℓ * m) = a ℓ * a m - e * if ℓ ∣ m then a (m / ℓ) else 0) (n : ℕ) :
    depletedCoeff a ℓ n =
      a n - a ℓ * (if ℓ ∣ n then a (n / ℓ) else 0) +
        e * (if ℓ ^ 2 ∣ n then a (n / ℓ ^ 2) else 0) := sorry

/-- The Euler factor by which `E_ℓ` multiplies the value at `χ(z) z^j` (good prime `ℓ ∤ N`). -/
def eulerDeletionFactor (aℓ εℓ χℓ : K) (ℓ k j : ℕ) : K :=
  1 - aℓ * χℓ⁻¹ * (ℓ : K)⁻¹ ^ (j + 1) + εℓ * χℓ⁻¹ ^ 2 * (ℓ : K) ^ k * (ℓ : K)⁻¹ ^ (2 * j + 1)

/-- Weight two, trivial twist: `1 - a_ℓ/ℓ + ε(ℓ)/ℓ`. -/
example (aℓ εℓ : K) (ℓ : ℕ) :
    eulerDeletionFactor aℓ εℓ 1 ℓ 0 0 = 1 - aℓ / ℓ + εℓ / ℓ := by
  simp [eulerDeletionFactor, div_eq_mul_inv]

/-- Nontrivial inverse twisting and an interior critical exponent give `3/4`. -/
example : eulerDeletionFactor (3 : ℚ) 1 2 2 2 1 = 3 / 4 := by
  norm_num [eulerDeletionFactor]

/-- Omitting the quadratic term gives the bad-prime scalar factor. -/
example : eulerDeletionFactor (3 : ℚ) 0 2 2 2 0 = 1 / 4 := by
  norm_num [eulerDeletionFactor]

/-- The upper critical exponent changes both powers of the prime. -/
example : eulerDeletionFactor (3 : ℚ) 1 2 2 2 2 = 27 / 32 := by
  norm_num [eulerDeletionFactor]

/-- Depletion kills coefficients at multiples of the prime and keeps the others. -/
example (a : ℕ → K) : depletedCoeff a 2 2 = 0 ∧ depletedCoeff a 2 3 = a 3 := by
  norm_num [depletedCoeff]

/-- Depletion keeps the first coefficient and kills the coefficient at the square of the prime. -/
example (a : ℕ → ℚ) : depletedCoeff a 2 1 = a 1 ∧ depletedCoeff a 2 4 = 0 := by
  norm_num [depletedCoeff]

end Depletion

/- README targets with no declaration in this file, because their carriers are not at the pinned
libraries or their construction is a theorem: the free coset presentation, Manin's presentation of
`Δ₀`, the coset and fundamental-domain descriptions, flat base change, the plus/minus decomposition,
the map to `H¹` and parabolic cohomology as a quotient, descent, diamond operators and Γ₁(N) Hecke
operators, symbols with character and their decomposition, the two dualities, the period symbol, the
dimension of parabolic cohomology, Petersson detection, the Eichler–Shimura isomorphism, the
separation of cuspidal from Eisenstein eigensystems, newform eigenspaces, rational Hecke separation;
period lines and integral periods, the twisted Mellin formula, algebraicity of critical values, the
interpolation dictionary; refined eigenlines, the distribution modules with the weight-k action,
lifting, the slope decomposition of the fibre, the control theorem, admissibility, the p-adic
L-function with interpolation, uniqueness and the integral ordinary measure; all critical-slope
targets; tame twists, both supersingular refinements, the half-logarithms as functions on the open
disc, the ± decomposition, coefficient embeddings, the depletion identity of p-adic L-functions, and
the level-11 examples. The README also specifies symbols_mono (§0.2),
heckeU_comm_heckeT (§0.3), eisSymbols_hecke (§0.4), and
divisor_self, divisor_swap and divisor_add (§0.2). -/

end

end TauCetiRoadmap.ModularSymbolsPadicLFunctions
