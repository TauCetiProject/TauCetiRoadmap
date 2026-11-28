import Mathlib

/-!
# Hartree–Fock theory in a finite-dimensional one-particle space: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
results against the pinned Mathlib, with the few definitions they need, every theorem with `sorry`
and every definition with a real body. Every headline theorem of the README is statable
at the pins and is stated here.

The one-particle space is `ι → ℂ` for a finite type `ι`, with the inner product
`star x ⬝ᵥ y` (conjugate-linear in the first argument); one-particle operators and density
matrices are matrices `Matrix ι ι ℂ`; a two-body operator is a matrix `V` on `ι × ι` with
`V (p, q) (r, s) = ⟨pq|V|rs⟩`. The `N`-fermion space is the space of antisymmetric functions
on `Fin N → ι`, with the inner product `star ψ ⬝ᵥ φ` (a sum over all `N`-tuples).
-/

open Matrix
open scoped ComplexOrder

noncomputable section

namespace TauCetiRoadmap.HartreeFockTheory

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-! ## Conventions -/

/-- Conventions. A family of one-particle vectors is orthonormal for `star x ⬝ᵥ y`. -/
def IsOrthonormal {κ : Type*} [DecidableEq κ] (φ : κ → ι → ℂ) : Prop :=
  ∀ i j, star (φ i) ⬝ᵥ φ j = if i = j then 1 else 0

/-- Conventions. The density `∑ᵢ |φᵢ⟩⟨φᵢ|` of a family of orbitals; for an orthonormal family
it is the orthogonal projection onto its span. -/
def orbitalDensity {N : ℕ} (φ : Fin N → ι → ℂ) : Matrix ι ι ℂ :=
  ∑ i, vecMulVec (φ i) (star (φ i))

/-- Conventions. One-particle density matrices of `N` fermions: `0 ≤ γ ≤ 1` and `tr γ = N`. -/
def IsAdmissible (N : ℕ) (γ : Matrix ι ι ℂ) : Prop :=
  γ.PosSemidef ∧ (1 - γ).PosSemidef ∧ γ.trace = N

/-- Conventions. Orthogonal projections of rank `N`. -/
def IsRankProjection (N : ℕ) (γ : Matrix ι ι ℂ) : Prop :=
  γ.IsHermitian ∧ γ * γ = γ ∧ γ.trace = N

/-- Conventions. The antisymmetric two-particle vector `x ⊗ y − y ⊗ x`. -/
def antisymmProduct (x y : ι → ℂ) : ι × ι → ℂ :=
  fun p ↦ x p.1 * y p.2 - y p.1 * x p.2

/-- Conventions. `V` is nonnegative on antisymmetric two-particle vectors. -/
def IsNonnegOnAntisymm (V : Matrix (ι × ι) (ι × ι) ℂ) : Prop :=
  ∀ ψ : ι × ι → ℂ, (∀ p q, ψ (q, p) = -ψ (p, q)) → 0 ≤ (star ψ ⬝ᵥ (V *ᵥ ψ)).re

/-- Conventions. `V` is positive on nonzero antisymmetric two-particle vectors. -/
def IsPosOnAntisymm (V : Matrix (ι × ι) (ι × ι) ℂ) : Prop :=
  ∀ ψ : ι × ι → ℂ, (∀ p q, ψ (q, p) = -ψ (p, q)) → ψ ≠ 0 → 0 < (star ψ ⬝ᵥ (V *ᵥ ψ)).re

/-! ## Layer 1: the Hartree–Fock functional on one-particle density matrices -/

/-- 1.0. The direct (Hartree) term `J(γ) p r = ∑ q, ∑ s, V (p, q) (r, s) * γ s q`. -/
def direct (V : Matrix (ι × ι) (ι × ι) ℂ) (γ : Matrix ι ι ℂ) : Matrix ι ι ℂ :=
  Matrix.of fun p r ↦ ∑ q, ∑ s, V (p, q) (r, s) * γ s q

/-- 1.0. The exchange term `K(γ) p r = ∑ q, ∑ s, V (p, q) (s, r) * γ s q`. -/
def exchangeTerm (V : Matrix (ι × ι) (ι × ι) ℂ) (γ : Matrix ι ι ℂ) : Matrix ι ι ℂ :=
  Matrix.of fun p r ↦ ∑ q, ∑ s, V (p, q) (s, r) * γ s q

/-- 1.0. The Fock operator `F(γ) = T + J(γ) − K(γ)`. -/
def fockOperator (T : Matrix ι ι ℂ) (V : Matrix (ι × ι) (ι × ι) ℂ) (γ : Matrix ι ι ℂ) :
    Matrix ι ι ℂ :=
  T + direct V γ - exchangeTerm V γ

/-- 1.0. The Hartree–Fock functional `re tr(T γ) + ½ re tr((J(γ) − K(γ)) γ)`, defined for every
matrix `γ`. -/
def hfEnergy (T : Matrix ι ι ℂ) (V : Matrix (ι × ι) (ι × ι) ℂ) (γ : Matrix ι ι ℂ) : ℝ :=
  (trace (T * γ)).re + (1 / 2 : ℝ) * (trace ((direct V γ - exchangeTerm V γ) * γ)).re

/-- 1.0. The pair term `W(x, y) = ½ re ⟨x ⊗ y − y ⊗ x, V (x ⊗ y − y ⊗ x)⟩`. -/
def pairInteraction (V : Matrix (ι × ι) (ι × ι) ℂ) (x y : ι → ℂ) : ℝ :=
  (1 / 2 : ℝ) * (star (antisymmProduct x y) ⬝ᵥ (V *ᵥ antisymmProduct x y)).re

/-- 1.1. The replacement formula, with Koopmans' identities as the cases `x = 0` and
`y = 0`: replacing `|x⟩⟨x|` by `|y⟩⟨y|` changes the energy by
`⟨y, F y⟩ − ⟨x, F x⟩ − W(x, y)`. -/
theorem hfEnergy_sub_add_vecMulVec (T : Matrix ι ι ℂ) {V : Matrix (ι × ι) (ι × ι) ℂ}
    (hV : V.submatrix Prod.swap Prod.swap = V) (γ : Matrix ι ι ℂ) (x y : ι → ℂ) :
    hfEnergy T V (γ - vecMulVec x (star x) + vecMulVec y (star y)) =
      hfEnergy T V γ + (star y ⬝ᵥ (fockOperator T V γ *ᵥ y)).re -
        (star x ⬝ᵥ (fockOperator T V γ *ᵥ x)).re - pairInteraction V x y := by
  sorry

/-- 1.2(a). Critical points: for a Hermitian idempotent `γ`, `F(γ)` commutes with `γ` exactly
when the first-order change `re tr(F(γ) δ)` vanishes on every tangent direction `δ`
(Hermitian, `γδ + δγ = δ`). -/
theorem commute_fockOperator_iff {T : Matrix ι ι ℂ} {V : Matrix (ι × ι) (ι × ι) ℂ}
    (hT : T.IsHermitian) (hVh : V.IsHermitian) (hVx : V.submatrix Prod.swap Prod.swap = V)
    {γ : Matrix ι ι ℂ} (hγ : γ.IsHermitian) (hγγ : γ * γ = γ) :
    Commute (fockOperator T V γ) γ ↔
      ∀ δ : Matrix ι ι ℂ, δ.IsHermitian → γ * δ + δ * γ = δ →
        (trace (fockOperator T V γ * δ)).re = 0 := by
  sorry

/-- 1.2(b). **The Hartree–Fock equations**: at a local minimiser of the functional on the
rank-`N` projections, `F(γ)` commutes with `γ`. -/
theorem commute_fockOperator_of_isLocalMinOn {N : ℕ} {T : Matrix ι ι ℂ}
    {V : Matrix (ι × ι) (ι × ι) ℂ} (hT : T.IsHermitian) (hVh : V.IsHermitian)
    (hVx : V.submatrix Prod.swap Prod.swap = V) {γ : Matrix ι ι ℂ} (hγ : IsRankProjection N γ)
    (hmin : IsLocalMinOn (hfEnergy T V) {P | IsRankProjection N P} γ) :
    Commute (fockOperator T V γ) γ := by
  sorry

/-- 1.3(a). **Lieb's variational principle**: if `V` is nonnegative on antisymmetric
two-particle vectors, every admissible `γ` has a rank-`N` projection of no larger energy. -/
theorem exists_isRankProjection_hfEnergy_le {N : ℕ} (T : Matrix ι ι ℂ)
    {V : Matrix (ι × ι) (ι × ι) ℂ} (hV : IsNonnegOnAntisymm V) {γ : Matrix ι ι ℂ}
    (hγ : IsAdmissible N γ) :
    ∃ P, IsRankProjection N P ∧ hfEnergy T V P ≤ hfEnergy T V γ := by
  sorry

/-- 1.3(b). If `V` is positive on nonzero antisymmetric two-particle vectors, every minimiser
of the functional on the admissible set is a projection. -/
theorem isRankProjection_of_isMinOn {N : ℕ} (T : Matrix ι ι ℂ)
    {V : Matrix (ι × ι) (ι × ι) ℂ} (hV : IsPosOnAntisymm V) {γ : Matrix ι ι ℂ}
    (hγ : IsAdmissible N γ) (hmin : IsMinOn (hfEnergy T V) {P | IsAdmissible N P} γ) :
    IsRankProjection N γ := by
  sorry

/-- 1.4(a). At a minimiser over the rank-`N` projections, an occupied and an empty unit
vector are separated by the pair term: `⟨x, F x⟩ + W(x, y) ≤ ⟨y, F y⟩`. -/
theorem pairInteraction_le_of_isMinOn {N : ℕ} (T : Matrix ι ι ℂ)
    {V : Matrix (ι × ι) (ι × ι) ℂ} (hV : V.submatrix Prod.swap Prod.swap = V)
    {γ : Matrix ι ι ℂ} (hγ : IsRankProjection N γ)
    (hmin : IsMinOn (hfEnergy T V) {P | IsRankProjection N P} γ) {x y : ι → ℂ}
    (hx : γ *ᵥ x = x) (hy : γ *ᵥ y = 0) (hx1 : star x ⬝ᵥ x = 1) (hy1 : star y ⬝ᵥ y = 1) :
    (star x ⬝ᵥ (fockOperator T V γ *ᵥ x)).re + pairInteraction V x y ≤
      (star y ⬝ᵥ (fockOperator T V γ *ᵥ y)).re := by
  sorry

/-- 1.4(b). **There are no unfilled shells** (Bach–Lieb–Loss–Solovej): for `V` positive on
antisymmetric two-particle vectors, at a minimiser over the rank-`N` projections every occupied
unit vector has a smaller Fock energy than every empty one, and every eigenvector of `F(γ)` is
occupied or empty. -/
theorem no_unfilled_shells {N : ℕ} {T : Matrix ι ι ℂ} {V : Matrix (ι × ι) (ι × ι) ℂ}
    (hT : T.IsHermitian) (hVh : V.IsHermitian) (hVx : V.submatrix Prod.swap Prod.swap = V)
    (hVpos : IsPosOnAntisymm V) {γ : Matrix ι ι ℂ} (hγ : IsRankProjection N γ)
    (hmin : IsMinOn (hfEnergy T V) {P | IsRankProjection N P} γ) :
    (∀ x y : ι → ℂ, γ *ᵥ x = x → γ *ᵥ y = 0 → star x ⬝ᵥ x = 1 → star y ⬝ᵥ y = 1 →
      (star x ⬝ᵥ (fockOperator T V γ *ᵥ x)).re < (star y ⬝ᵥ (fockOperator T V γ *ᵥ y)).re) ∧
    ∀ (v : ι → ℂ) (μ : ℂ), fockOperator T V γ *ᵥ v = μ • v → γ *ᵥ v = v ∨ γ *ᵥ v = 0 := by
  sorry

/-! ## Layer 2: the `N`-fermion space -/

/-- 2.0. Antisymmetric functions of `N` particles: `ψ (x ∘ σ) = sign σ • ψ x`. -/
def antisymmSubmodule (N : ℕ) (ι : Type*) : Submodule ℂ ((Fin N → ι) → ℂ) where
  carrier := {ψ | ∀ (σ : Equiv.Perm (Fin N)) (x : Fin N → ι),
    ψ (x ∘ σ) = (Equiv.Perm.sign σ : ℤ) • ψ x}
  add_mem' := by
    intro a b ha hb σ x
    simp [ha σ x, hb σ x, smul_add]
  zero_mem' := by
    intro σ x
    simp
  smul_mem' := by
    intro c a ha σ x
    simp [ha σ x]
    ring

/-- 2.0. The Slater determinant `(N!)^(-1/2) det [φ j (x i)]` of `N` orbitals (rows are
particles, columns are orbitals). -/
def slater {N : ℕ} (φ : Fin N → ι → ℂ) : (Fin N → ι) → ℂ :=
  fun x ↦ ((Real.sqrt (N.factorial : ℝ))⁻¹ : ℂ) * (Matrix.of fun i j ↦ φ j (x i)).det

/-- 2.0. The one-particle density matrix of a matrix `ρ` on `N`-particle functions:
`oneRDM ρ p q = ∑ₖ ∑ ρ x y` over the pairs `x, y` that agree off particle `k` and have
`x k = p`, `y k = q`. Its trace is `N tr ρ`. -/
def oneRDM {N : ℕ} (ρ : Matrix (Fin N → ι) (Fin N → ι) ℂ) : Matrix ι ι ℂ :=
  Matrix.of fun p q ↦ ∑ k : Fin N, ∑ x : Fin N → ι, ∑ y : Fin N → ι,
    if x k = p ∧ y k = q ∧ ∀ j, j ≠ k → x j = y j then ρ x y else 0

/-- 2.0. The `N`-particle Hamiltonian `∑ₖ T_k + ∑_{k<l} V_{kl}` as a matrix on `Fin N → ι`. -/
def manyBodyHamiltonian (N : ℕ) (T : Matrix ι ι ℂ) (V : Matrix (ι × ι) (ι × ι) ℂ) :
    Matrix (Fin N → ι) (Fin N → ι) ℂ :=
  Matrix.of fun x y ↦
    (∑ k : Fin N, if ∀ j, j ≠ k → x j = y j then T (x k) (y k) else 0) +
    ∑ k : Fin N, ∑ l : Fin N, if k < l ∧ ∀ j, j ≠ k → j ≠ l → x j = y j
      then V (x k, x l) (y k, y l) else 0

/-- 2.0. Fermionic `N`-particle states: positive semidefinite, trace one, antisymmetric columns. -/
def IsFermionicState (N : ℕ) (ρ : Matrix (Fin N → ι) (Fin N → ι) ℂ) : Prop :=
  ρ.PosSemidef ∧ ρ.trace = 1 ∧ ∀ y, (fun x ↦ ρ x y) ∈ antisymmSubmodule N ι

/-- 2.1(a). The overlap of two Slater determinants is the determinant of the overlap matrix of
the orbitals, for arbitrary (not necessarily orthonormal) families. -/
theorem inner_slater {N : ℕ} (φ χ : Fin N → ι → ℂ) :
    star (slater φ) ⬝ᵥ slater χ = (Matrix.of fun i j ↦ star (φ i) ⬝ᵥ χ j).det := by
  sorry

/-- 2.1(b). The Slater determinants of standard basis vectors span the antisymmetric
functions. -/
theorem span_slater_eq_antisymmSubmodule (N : ℕ) :
    Submodule.span ℂ (Set.range fun x : Fin N → ι ↦ slater fun i ↦ Pi.single (x i) (1 : ℂ)) =
      antisymmSubmodule N ι := by
  sorry

/-- 2.1(c). The antisymmetric functions are Mathlib's exterior power: a linear equivalence
sends `ιMulti φ` to `√N! • slater φ`. -/
theorem exists_linearEquiv_exteriorPower (N : ℕ) :
    ∃ e : ⋀[ℂ]^N (ι → ℂ) ≃ₗ[ℂ] antisymmSubmodule N ι, ∀ φ : Fin N → ι → ℂ,
      (e (exteriorPower.ιMulti ℂ N φ) : (Fin N → ι) → ℂ) =
        ((Real.sqrt (N.factorial : ℝ) : ℝ) : ℂ) • slater φ := by
  sorry

/-- 2.2(a). **The Pauli principle**: the one-particle density matrix of a fermionic `N`-particle
state satisfies `0 ≤ γ ≤ 1` and `tr γ = N`. -/
theorem isAdmissible_oneRDM {N : ℕ} {ρ : Matrix (Fin N → ι) (Fin N → ι) ℂ}
    (hρ : IsFermionicState N ρ) : IsAdmissible N (oneRDM ρ) := by
  sorry

/-- 2.2(b). The one-particle density matrix of the Slater determinant of an orthonormal family
is the projection `∑ᵢ |φᵢ⟩⟨φᵢ|` onto its span. -/
theorem oneRDM_slater {N : ℕ} {φ : Fin N → ι → ℂ} (hφ : IsOrthonormal φ) :
    oneRDM (vecMulVec (slater φ) (star (slater φ))) = orbitalDensity φ := by
  sorry

/-- 2.3(a). **Coleman's theorem**: a matrix is the one-particle density matrix of a fermionic
`N`-particle state exactly when `0 ≤ γ ≤ 1` and `tr γ = N`. -/
theorem exists_isFermionicState_oneRDM_eq_iff {N : ℕ} {γ : Matrix ι ι ℂ} :
    (∃ ρ, IsFermionicState N ρ ∧ oneRDM ρ = γ) ↔ IsAdmissible N γ := by
  sorry

/-- 2.3(b). The extreme points of the admissible set are the rank-`N` projections. -/
theorem extremePoints_isAdmissible (N : ℕ) :
    Set.extremePoints ℝ {γ : Matrix ι ι ℂ | IsAdmissible N γ} = {P | IsRankProjection N P} := by
  sorry

/-- 2.4(a). The energy of a Slater determinant is the Hartree–Fock functional of its density. -/
theorem slater_energy {N : ℕ} (T : Matrix ι ι ℂ) (V : Matrix (ι × ι) (ι × ι) ℂ)
    {φ : Fin N → ι → ℂ} (hφ : IsOrthonormal φ) :
    (star (slater φ) ⬝ᵥ (manyBodyHamiltonian N T V *ᵥ slater φ)).re =
      hfEnergy T V (orbitalDensity φ) := by
  sorry

/-- 2.4(b). Slater–Condon rule for one replaced orbital: `⟨Φ, H Φᵢᵃ⟩ = ⟨φᵢ, F(γ) a⟩` for `a`
orthogonal to every `φⱼ`. -/
theorem slaterCondon_single {N : ℕ} (T : Matrix ι ι ℂ) {V : Matrix (ι × ι) (ι × ι) ℂ}
    (hV : V.submatrix Prod.swap Prod.swap = V) {φ : Fin N → ι → ℂ} (hφ : IsOrthonormal φ)
    (i : Fin N) {a : ι → ℂ} (ha : ∀ j, star (φ j) ⬝ᵥ a = 0) :
    star (slater φ) ⬝ᵥ (manyBodyHamiltonian N T V *ᵥ slater (Function.update φ i a)) =
      star (φ i) ⬝ᵥ (fockOperator T V (orbitalDensity φ) *ᵥ a) := by
  sorry

/-- 2.4(c). Slater–Condon rule for two replaced orbitals:
`⟨Φ, H Φᵢⱼᵃᵇ⟩ = ⟨φᵢ φⱼ|V|a b⟩ − ⟨φᵢ φⱼ|V|b a⟩`. -/
theorem slaterCondon_double {N : ℕ} (T : Matrix ι ι ℂ) {V : Matrix (ι × ι) (ι × ι) ℂ}
    (hV : V.submatrix Prod.swap Prod.swap = V) {φ : Fin N → ι → ℂ} (hφ : IsOrthonormal φ)
    {i j : Fin N} (hij : i ≠ j) {a b : ι → ℂ} (ha : ∀ k, star (φ k) ⬝ᵥ a = 0)
    (hb : ∀ k, star (φ k) ⬝ᵥ b = 0) :
    star (slater φ) ⬝ᵥ
        (manyBodyHamiltonian N T V *ᵥ slater (Function.update (Function.update φ i a) j b)) =
      star (fun p : ι × ι ↦ φ i p.1 * φ j p.2) ⬝ᵥ (V *ᵥ antisymmProduct a b) := by
  sorry

/-- 2.4(d). Slater–Condon rule for three or more replaced orbitals: the matrix element is zero. -/
theorem slaterCondon_of_three_le {N : ℕ} (T : Matrix ι ι ℂ) (V : Matrix (ι × ι) (ι × ι) ℂ)
    {φ χ : Fin N → ι → ℂ} (hφ : IsOrthonormal φ)
    (hχ : ∀ i, χ i = φ i ∨ ∀ j, star (φ j) ⬝ᵥ χ i = 0)
    (h3 : 3 ≤ (Finset.univ.filter fun i ↦ χ i ≠ φ i).card) :
    star (slater φ) ⬝ᵥ (manyBodyHamiltonian N T V *ᵥ slater χ) = 0 := by
  sorry

/-- 2.5. **Brillouin's theorem**: the density of an orthonormal family satisfies the
Hartree–Fock equation exactly when the Hamiltonian has no matrix element between its Slater
determinant and any singly replaced determinant. -/
theorem brillouin {N : ℕ} {T : Matrix ι ι ℂ} {V : Matrix (ι × ι) (ι × ι) ℂ}
    (hT : T.IsHermitian) (hVh : V.IsHermitian) (hVx : V.submatrix Prod.swap Prod.swap = V)
    {φ : Fin N → ι → ℂ} (hφ : IsOrthonormal φ) :
    Commute (fockOperator T V (orbitalDensity φ)) (orbitalDensity φ) ↔
      ∀ (i : Fin N) (a : ι → ℂ), (∀ j, star (φ j) ⬝ᵥ a = 0) →
        star (slater φ) ⬝ᵥ (manyBodyHamiltonian N T V *ᵥ slater (Function.update φ i a)) = 0 := by
  sorry

/-- 2.6. **Thouless' theorem**: a Slater determinant not orthogonal to `slater φ` is a multiple
of `slater (φ + X φ)` for exactly one `X` with `(1 − γ) X γ = X`, `γ` the density of `φ`. -/
theorem thouless {N : ℕ} {φ ψ : Fin N → ι → ℂ} (hφ : IsOrthonormal φ)
    (hne : star (slater φ) ⬝ᵥ slater ψ ≠ 0) :
    ∃! X : Matrix ι ι ℂ, (1 - orbitalDensity φ) * X * orbitalDensity φ = X ∧
      slater ψ = (star (slater φ) ⬝ᵥ slater ψ) • slater (fun i ↦ φ i + X *ᵥ φ i) := by
  sorry

end TauCetiRoadmap.HartreeFockTheory
