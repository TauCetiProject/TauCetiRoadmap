import Mathlib
import TauCeti.NumberTheory.ModularForms.GeodesicIntegral.BetweenCusps
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
* The boundary sequence in degree one is stated through explicit cocycles and coboundaries, so that the
  boundary exactness assertions do not depend on a choice of model for `H¹`.
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

/-- A constant oriented cusp divisor vanishes (README §0.2, Oriented cusp divisors). -/
theorem divisor_self (a : OnePoint ℚ) : divisor a a = 0 := by
  ext; simp [divisor]

/-- Reversing the path negates its divisor (README §0.2, Oriented cusp divisors). -/
theorem divisor_swap (a b : OnePoint ℚ) : divisor b a = -divisor a b := by
  ext; simp [divisor]

/-- Concatenating paths adds their divisors (README §0.2, Oriented cusp divisors). -/
theorem divisor_add (a b c : OnePoint ℚ) : divisor a b + divisor b c = divisor a c := by
  ext; simp [divisor]

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

/-- Two additive maps on `Δ₀` agreeing on the unimodular divisors `{g 0} - {g ∞}` are equal
(README §0.2): `LinearMap.ext_on_range` for `span_degreeZeroRep_eq_top`, with reversed divisors. -/
theorem ext_unimodular {φ ψ : (degreeZero ℤ) →ₗ[ℤ] V}
    (h : ∀ g : SL(2, ℤ), φ (divisor (Matrix.SpecialLinearGroup.mapGL ℚ g • (∞ : OnePoint ℚ)) (Matrix.SpecialLinearGroup.mapGL ℚ g • ((0 : ℚ) : OnePoint ℚ))) =
      ψ (divisor (Matrix.SpecialLinearGroup.mapGL ℚ g • (∞ : OnePoint ℚ)) (Matrix.SpecialLinearGroup.mapGL ℚ g • ((0 : ℚ) : OnePoint ℚ)))) :
    φ = ψ := by
  apply LinearMap.ext_on_range span_degreeZeroRep_eq_top
  intro g
  have hg := congrArg (fun v : V ↦ -v) (h g)
  rw [← map_neg, ← map_neg] at hg
  simp only [← divisor_swap] at hg
  simpa only [divisor, degreeZeroRep_apply, degreeZeroGLRep_single_sub_single] using hg

/-- Level one, trivial coefficients: `Symb_{SL₂(ℤ)}(ℤ) = 0` (the Manin relations give `2v = 0` and
`3v = 0`). A definition on all of `ℤ[P¹(ℚ)]` would contain the constant functions instead. -/
theorem symbols_SL2Z_trivial :
    symbols (⊤ : Subgroup SL(2, ℤ)) (Representation.trivial ℤ (⊤ : Subgroup SL(2, ℤ)) ℤ) = ⊥ :=
  sorry

end Symbols

section HomologicalDuality

/-- Evaluation identifies Hom-side symbols with the dual of homological symbols
(README §0.6, Hom-side symbols are the dual of homological symbols).
The coefficient action is the contragredient action on `Hom(W, M)`; no torsion is inverted. -/
theorem symbols_dual_homology (Γ : Subgroup SL(2, ℤ))
    (W M : Type*) [AddCommGroup W] [AddCommGroup M] (ρ : Representation ℤ Γ W) :
    ∃ e : symbols Γ (ρ.linHom (Representation.trivial ℤ Γ M)) ≃ₗ[ℤ]
        (Representation.Coinvariants (Representation.tprod ((degreeZeroRep ℤ).comp Γ.subtype) ρ) →ₗ[ℤ] M),
      ∀ (φ : symbols Γ (ρ.linHom (Representation.trivial ℤ Γ M)))
        (D : degreeZero ℤ) (w : W),
        e φ (Representation.Coinvariants.mk _ (D ⊗ₜ[ℤ] w)) = φ.val D w := sorry

end HomologicalDuality

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

/-- An integral matrix of nonzero determinant as an element of `GL₂(ℚ)` (the identity otherwise). -/
def intMatrixToGL (δ : Matrix (Fin 2) (Fin 2) ℤ) : GL (Fin 2) ℚ :=
  if h : δ.det ≠ 0 then
    Matrix.GeneralLinearGroup.mkOfDetNeZero ((Int.castRingHom ℚ).mapMatrix δ)
      (by rw [← RingHom.map_det]; simpa using h)
  else 1

/-- Rational inclusion respects products of nonsingular integral matrices
(README §0.1, The Hecke monoid). -/
theorem intMatrixToGL_mul (γ δ : Matrix (Fin 2) (Fin 2) ℤ)
    (hγ : γ.det ≠ 0) (hδ : δ.det ≠ 0) :
    intMatrixToGL (γ * δ) = intMatrixToGL γ * intMatrixToGL δ := sorry

variable {R V : Type*} [CommRing R] [AddCommGroup V] [Module R V]

/-- The slash `(φ ∣ δ)(D) = φ(δ D) ∣ δ` of a map `φ : Δ₀ → V`, for a right action `act` of integral
matrices on `V` (`act δ v = v ∣ δ`). -/
def slashSymbol (act : Matrix (Fin 2) (Fin 2) ℤ → V →ₗ[R] V) (δ : Matrix (Fin 2) (Fin 2) ℤ)
    (φ : (degreeZero ℤ) →ₗ[ℤ] V) : (degreeZero ℤ) →ₗ[ℤ] V :=
  (act δ).toAddMonoidHom.toIntLinearMap ∘ₗ φ ∘ₗ (degreeZeroGLRep ℤ) (intMatrixToGL δ)

/-- **The Hecke operator** `T_ℓ = ∣ diag(ℓ, 1) + Σ_{a < ℓ} ∣ !![1, a; 0, ℓ]` (Pollack–Stevens §2.1),
for a prime `ℓ ∤ N`. This is the Hom-side Hecke sum with coefficient twist `act δ` and fixed
upper-triangular representatives; on dual coefficients, evaluation identifies it with the transpose
of the pinned `HeckeCoset.heckeSum` on the tensor module (README §0.6). Belongs to Layer 0, §0.3. -/
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

/-- Bad-prime and good-prime Hecke operators commute on equivariant symbols
(README §0.3, Hecke operators on modular symbols). -/
theorem heckeU_comm_heckeT (N : ℕ) (act : Matrix (Fin 2) (Fin 2) ℤ → V →ₗ[R] V)
    (ρ : Representation R (CongruenceSubgroup.Gamma0 N) V) (hact : IsSigma0Action N act ρ)
    {q ℓ : ℕ} (hq : q.Prime) (hqN : q ∣ N) (hℓ : ℓ.Prime) (hℓN : ¬ ℓ ∣ N)
    {φ : (degreeZero ℤ) →ₗ[ℤ] V} (hφ : φ ∈ symbols (CongruenceSubgroup.Gamma0 N) ρ) :
    heckeU act q (heckeT act ℓ φ) = heckeT act ℓ (heckeU act q φ) := sorry

end HeckeMonoid

section Involution

/-- **The involution at infinity** `ι = !![-1, 0; 0, 1]`. -/
def iotaMatrix : Matrix (Fin 2) (Fin 2) ℤ := !![-1, 0; 0, 1]

theorem iotaMatrix_mul_self : iotaMatrix * iotaMatrix = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [iotaMatrix]

/-- `ι ∉ SL₂(ℤ)`: its determinant is `-1`. -/
theorem det_iotaMatrix : iotaMatrix.det = -1 := by
  simp [iotaMatrix, Matrix.det_fin_two]

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

/-- The kernel of boundary restriction consists exactly of invariant constant boundary functions
(README §0.4, The boundary exact sequence for modular symbols), over any coefficient ring. -/
theorem restrictBoundary_eq_zero_iff (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V)
    (ψ : boundarySymbols Γ ρ) :
    restrictBoundary Γ ρ ψ = 0 ↔ ∃ v : V, (∀ γ : Γ, ρ γ v = v) ∧
      ∀ D : MonoidAlgebra ℤ (OnePoint ℚ), ψ.val D = degree ℤ D • v := sorry

/-- The cocycle `γ ↦ φ({γ x} - {x})` of a modular symbol, for a base cusp `x`. -/
def symbolCocycle (Γ : Subgroup SL(2, ℤ)) (x : OnePoint ℚ) (φ : (degreeZero ℤ) →ₗ[ℤ] V) (γ : Γ) : V :=
  φ (divisor x (Matrix.SpecialLinearGroup.mapGL ℚ (γ : SL(2, ℤ)) • x))

/-- The cocycle identity `c(γ η) = ρ(γ) c(η) + c(γ)`. -/
theorem symbolCocycle_mul (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V) (x : OnePoint ℚ)
    {φ : (degreeZero ℤ) →ₗ[ℤ] V} (hφ : φ ∈ symbols Γ ρ) (γ η : Γ) :
    symbolCocycle Γ x φ (γ * η) = ρ γ (symbolCocycle Γ x φ η) + symbolCocycle Γ x φ γ := sorry

/-- Changing the base cusp adds the coboundary of the symbol's value on the joining path
(README §0.4, The map from modular symbols to group cohomology). -/
theorem symbolCocycle_baseCusp (Γ : Subgroup SL(2, ℤ)) (ρ : Representation R Γ V)
    (x y : OnePoint ℚ) {φ : (degreeZero ℤ) →ₗ[ℤ] V} (hφ : φ ∈ symbols Γ ρ) (γ : Γ) :
    symbolCocycle Γ y φ γ = symbolCocycle Γ x φ γ +
      (ρ γ (φ (divisor x y)) - φ (divisor x y)) := sorry

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

end DrinfeldManin

/-! ## Layer 1: periods, critical values and p-stabilisation -/

section Periods

variable {W : Type*} [AddCommGroup W] [Module ℂ W]

/-- **The period coordinate** of `ψ` on the line spanned by `φ`: the scalar `Ω` with `ψ = Ω • φ`
(zero when there is none). A period is a coordinate on a line, never a canonical number. -/
def periodScalar (ψ φ : W) : ℂ :=
  open scoped Classical in
  if h : ∃ c : ℂ, ψ = c • φ then h.choose else 0

/-- The period coordinate reconstructs the vector on its chosen line
(README §1.1, Period lines and periods). -/
theorem periodScalar_spec {ψ φ : W} (hψ : ∃ c : ℂ, ψ = c • φ) :
    ψ = periodScalar ψ φ • φ := sorry

/-- Rescaling the basis by `λ` rescales the period by `λ⁻¹`. -/
theorem periodScalar_smul {ψ φ : W} (hφ : φ ≠ 0) (hψ : ∃ c : ℂ, ψ = c • φ) {c : ℂ} (hc : c ≠ 0) :
    periodScalar ψ (c • φ) = c⁻¹ * periodScalar ψ φ := sorry

end Periods

section CriticalValues

open Complex
open scoped Real UpperHalfPlane

/-- The cusp integral of `f(z) z^j` from `∞` to `0` gives the untwisted critical value
`j! / (-2πi)^j · L(f, j + 1)` after multiplication by `2πi` (README §1.2).
The integral is `TauCeti.cuspIntegral`; the L-function has Mathlib's normalisation, which agrees
with `Σ aₙ n^{-s}` when the width at `∞` is one. -/
theorem cuspIntegral_monomial_eq_L {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic]
    {k j : ℕ} (hj : j ≤ k) {F : Type*} [FunLike F ℍ ℂ]
    [CuspFormClass F Γ (k + 2)] (f : F) :
    2 * π * I * TauCeti.cuspIntegral (fun z : ℍ ↦ f z * (z : ℂ) ^ j)
        (∞ : OnePoint ℚ) ((0 : ℚ) : OnePoint ℚ) =
      (j.factorial : ℂ) / (-2 * π * I) ^ j *
        ModularForm.L (k := (k : ℤ) + 2) (by omega) f ((j : ℂ) + 1) := sorry

end CriticalValues

/-! ## Layer 2: refinements, overconvergent symbols and small-slope p-adic L-functions -/

section Refinements

variable {K : Type*} [Field K]

/-- `α` is a root of the good-prime Hecke polynomial `X² - a_p X + ε(p) p^{k+1}`. -/
def IsGoodRefinementRoot (ap εp : K) (p k : ℕ) (α : K) : Prop :=
  α ^ 2 - ap * α + εp * (p : K) ^ (k + 1) = 0

/-- The two good-prime roots multiply to `ε(p) p^{k+1}` (README §2.1, Refinements and their slopes). -/
theorem goodRoot_mul {ap εp α : K} {p k : ℕ} (hα : IsGoodRefinementRoot ap εp p k α) :
    α * (ap - α) = εp * (p : K) ^ (k + 1) := by
  unfold IsGoodRefinementRoot at hα
  linear_combination (-1 : K) * hα

/-- A good-prime refinement root is nonzero when the constant coefficient is nonzero
(README §2.1, Refinements and their slopes). -/
theorem goodRoot_ne_zero {ap εp α : K} {p k : ℕ}
    (hα : IsGoodRefinementRoot ap εp p k α) (hε : εp ≠ 0) (hp : (p : K) ≠ 0) : α ≠ 0 := by
  intro h
  have hprod := goodRoot_mul hα
  rw [h, zero_mul] at hprod
  exact (mul_ne_zero hε (pow_ne_zero _ hp)) hprod.symm

/-- At `p ∣ N` the refinement eigenvalue is the actual nonzero `a_p`: there is none when `a_p = 0`. -/
def IsBadRefinement (ap α : K) : Prop := α = ap ∧ α ≠ 0

/-- A zero bad-prime eigenvalue admits no refinement
(README §4.1, A zero `U_p`-eigenvalue is outside finite-slope interpolation). -/
theorem not_isBadRefinement_zero (α : K) : ¬ IsBadRefinement 0 α := fun h ↦ h.2 h.1

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

/-- The moment sequence `1/(j+1)` separates dagger distributions from bounded ones
(README §2.2, Distribution modules with the weight-`k` action). -/
theorem daggerMoments_unbounded (p : ℕ) [Fact p.Prime] :
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

/-- Specialisation retains exactly the moments through degree `k` in characteristic zero
(README §2.3, Specialisation to polynomial coefficients). -/
theorem specialiseMoments_eq_iff [CharZero K] (k : ℕ) (c d : ℕ → K) :
    specialiseMoments k c = specialiseMoments k d ↔ ∀ j ≤ k, c j = d j := sorry

end Specialisation

/-! ## Layer 3: critical slope

The critical eigensymbols and local analytic families of README §3.0 assume an odd prime not dividing
the tame level and distinct Hecke roots. -/

/-! ## Layer 4: tame twists, supersingular primes, comparisons and examples -/

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

/-- Euler depletion is idempotent: deleting the same prime twice changes no coefficient. -/
example (a : ℕ → K) (ℓ : ℕ) :
    (fun n ↦ depletedCoeff (depletedCoeff a ℓ) ℓ n) = depletedCoeff a ℓ := by
  funext n
  by_cases h : ℓ ∣ n <;> simp [depletedCoeff, h]

end Depletion

/- README targets with no declaration in this file, because their carriers are not at the pinned
libraries or their interfaces require the preceding constructions: the free coset presentation,
Manin's presentation of `Δ₀`, the coset and fundamental-domain descriptions, flat base change, the plus/minus decomposition,
the map to `H¹` and parabolic cohomology as a quotient, descent, diamond operators and Γ₁(N) Hecke
operators, symbols with character and their decomposition, the polynomial pairing and geometric
comparison, the period symbol, the dimension of parabolic cohomology, Petersson detection, the Eichler–Shimura isomorphism, the
separation of cuspidal from Eisenstein eigensystems, newform eigenspaces, rational Hecke separation;
period lines and integral periods, the twisted Mellin formula, algebraicity of critical values, the
interpolation dictionary; refined eigenlines, the distribution modules with the weight-k action,
lifting, the slope decomposition of the fibre, the control theorem, admissibility, the p-adic
L-function with interpolation, uniqueness and the integral ordinary measure; all critical-slope
targets; tame twists, both supersingular refinements, the half-logarithms as functions on the open
disc, the ± decomposition, coefficient embeddings, the depletion identity of p-adic L-functions, and
the level-11 examples. The README also specifies symbols_mono (§0.2) and eisSymbols_hecke (§0.4). -/

end

end TauCetiRoadmap.ModularSymbolsPadicLFunctions
