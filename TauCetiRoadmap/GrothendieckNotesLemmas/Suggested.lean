module

public import Mathlib
public import TauCeti.RingTheory.Flat.Pi

/-!
# General lemmas in commutative algebra, topology and linear algebra: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the one definition their statements need (`Polynomial.intValued`,
with a real body). The API around each target, the special cases and the Checks stay in the
README.

Headline theorems stated here (README target, Lean name):

* 1.1, `Nat.pow_dvd_iff_forall_dvd_choose`; 1.2, `Nat.choose_pow_sub_one_modEq_neg_one_pow`;
  1.3, `Polynomial.forall_hasseDeriv_eq_zero_iff_exists_expand`; 1.4,
  `Polynomial.hasseDeriv_expand_mul`; 1.5, `Polynomial.isCoprime_X_sub_C_iff`; 1.6,
  `Matrix.det_pascal`; 1.7, `mul_pow_of_commute_commutatorElement` and
  `mul_pow_prime_of_commute_commutatorElement`; 1.8, `Subgroup.isPerfect_normalClosure`; 1.9,
  `Polynomial.resultant_prod_X_sub_C_left`, `Polynomial.resultant_prod_X_sub_C_right` and
  `Polynomial.resultant_prod_X_sub_C_prod_X_sub_C`.
* 2.1, `Module.Flat.pi_iff` and `Module.Flat.prod_iff`; 2.2,
  `Module.FinitePresentation.piRightHom_bijective`; 2.3,
  `isNoetherianRing_iff_forall_finitePresentation`; 2.4,
  `TensorProduct.mem_range_rTensor_iff_equivFinsuppOfBasisRight`; 2.5,
  `Ideal.injective_primaryComponent`; 2.6, `IsAdicComplete.of_isNilpotent`; 2.7,
  `KaehlerDifferential.exists_retraction_mapBaseChange`; 2.8, `AddSubgroup.rat_smul_mem_iff`; 2.9,
  `Module.Baer.of_isPrincipalIdealRing`,
  `Module.injective_iff_forall_smul_surjective` and `Module.Injective.quotient`; 2.10,
  `Module.Flat.isSMulRegular_quotient_smul_top` and `Submodule.IsAssociatedPrime.comap_eq_of_flat`;
  2.11, `IsFractionRing.baer_quotient_range` and `IsFractionRing.nonempty_torsionBy_linearEquiv`;
  2.12, `Module.IsTorsion.isFiniteLength`.
* 3.1, `Derivation.leibniz_prod` and `Derivation.leibniz_zpow_units`; 3.2,
  `Derivation.lie_mulLeft` and `Derivation.mulLeft_mul_mul_mulLeft_inv`.
* 4.1, `ContinuousMap.continuous_curry_of_locallyCompactSpace`,
  `ContinuousMap.continuous_curry_of_r1Space` and `ContinuousMap.continuous_uncurry_of_r1Space`;
  4.2, `NoetherianSpace.isOpen_of_stableUnderGeneralization`.
* 5.1, `Monoid.exists_forall_mul_eq_self_iff_of_finite`; 5.2, `Matrix.det_submatrix_mul`; 5.3,
  `Finset.sum_sum_mul_sub_mul_mul_mul_sub_mul` and `RCLike.sum_sum_norm_mul_sub_mul_sq`; 5.4,
  `Polynomial.mem_intValued_iff_forall_natCast` and `Polynomial.exists_basis_intValued`; 5.5,
  `Matrix.trace_sub_pow_odd_of_isIdempotentElem`; 5.6,
  `GrothendieckGroup.exists_eq_div_of_and_eq_div_of`; 5.7,
  `IsSimpleModule.nonempty_linearEquiv_of_trace_eq`.

Every headline of the README is statable at the pins and stated. The homeomorphism of README 4.1
is the bundling of its two continuity theorems and is not restated; the basis of README 5.4 is
stated as an existence theorem, so that no definition rests on a `sorry`'d proof.
-/

public section

namespace TauCetiRoadmap.GrothendieckNotesLemmas

open Polynomial
open scoped TensorProduct KaehlerDifferential

/-! ## Layer 1: binomial coefficients, Hasse derivatives, a determinant, commutators, resultants -/

/-- For a prime `p`, `p ^ e` divides `n` if and only if `p` divides `n.choose k` for every
`0 < k < p ^ e` (a consequence of Lucas's theorem). -/
theorem Nat.pow_dvd_iff_forall_dvd_choose {p e n : ℕ} [Fact p.Prime] :
    p ^ e ∣ n ↔ ∀ k, 0 < k → k < p ^ e → p ∣ n.choose k := by
  sorry

/-- For a prime `p` and `k ≤ p ^ a - 1`, `(p ^ a - 1).choose k ≡ (-1) ^ k` modulo `p`. -/
theorem Nat.choose_pow_sub_one_modEq_neg_one_pow {p a k : ℕ} [Fact p.Prime]
    (hk : k ≤ p ^ a - 1) : ((p ^ a - 1).choose k : ℤ) ≡ (-1) ^ k [ZMOD p] := by
  sorry

/-- In characteristic `p`, the Hasse derivatives of `f` of orders `0 < k < p ^ e` all vanish if
and only if `f` is a polynomial in `X ^ (p ^ e)`. -/
theorem Polynomial.forall_hasseDeriv_eq_zero_iff_exists_expand {R : Type*} [CommRing R]
    (p : ℕ) [Fact p.Prime] [CharP R p] {e : ℕ} {f : R[X]} :
    (∀ k, 0 < k → k < p ^ e → hasseDeriv k f = 0) ↔ ∃ g, expand R (p ^ e) g = f := by
  sorry

/-- In characteristic `p`, for `k < p ^ e` the Hasse derivative `hasseDeriv k` is linear over the
polynomials in `X ^ (p ^ e)` (from the Leibniz rule `Polynomial.hasseDeriv_mul`). -/
theorem Polynomial.hasseDeriv_expand_mul {R : Type*} [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] {e k : ℕ} (hk : k < p ^ e) (f g : R[X]) :
    hasseDeriv k (expand R (p ^ e) f * g) = expand R (p ^ e) f * hasseDeriv k g := by
  sorry

/-- Over a commutative ring, `X - C a` and `q` are coprime if and only if `q.eval a` is a unit.
This completes Mathlib's `Polynomial.isCoprime_X_sub_C_of_isUnit_sub`. -/
theorem Polynomial.isCoprime_X_sub_C_iff {R : Type*} [CommRing R] {a : R} {q : R[X]} :
    IsCoprime (X - C a) q ↔ IsUnit (q.eval a) := by
  sorry

/-- The symmetric Pascal matrix `((i + j).choose i)`, indexed from `0`, has determinant `1`
(Vandermonde's identity `Nat.add_choose_eq` factors it as `L * Lᵀ`, `L` unitriangular). -/
theorem Matrix.det_pascal (R : Type*) [CommRing R] (n : ℕ) :
    (Matrix.of fun i j : Fin n ↦ (((i : ℕ) + j).choose i : R)).det = 1 := by
  sorry

open scoped commutatorElement in
/-- If the commutator `⁅v, u⁆ = v * u * v⁻¹ * u⁻¹` commutes with `u` and with `v`, then
`(u * v) ^ n = u ^ n * v ^ n * ⁅v, u⁆ ^ n.choose 2` for every `n : ℕ`. -/
theorem mul_pow_of_commute_commutatorElement {G : Type*} [Group G] {u v : G}
    (hu : Commute u ⁅v, u⁆) (hv : Commute v ⁅v, u⁆) (n : ℕ) :
    (u * v) ^ n = u ^ n * v ^ n * ⁅v, u⁆ ^ n.choose 2 := by
  sorry

open scoped commutatorElement in
/-- For an odd prime `p`, if `⁅v, u⁆` commutes with `u` and `v` and `⁅v, u⁆ ^ p = 1`, then
`(u * v) ^ p = u ^ p * v ^ p`. -/
theorem mul_pow_prime_of_commute_commutatorElement {G : Type*} [Group G] {p : ℕ}
    (hp : p.Prime) (hp2 : p ≠ 2) {u v : G} (hu : Commute u ⁅v, u⁆) (hv : Commute v ⁅v, u⁆)
    (hd : ⁅v, u⁆ ^ p = 1) : (u * v) ^ p = u ^ p * v ^ p := by
  sorry

/-- The normal closure of a perfect subgroup is perfect (`Subgroup.isPerfect_iff`, and
`Subgroup.normalClosure_le_normal` applied to the normal subgroup `⁅N, N⁆`). -/
theorem Subgroup.isPerfect_normalClosure {G : Type*} [Group G] (H : Subgroup G)
    [Group.IsPerfect H] : Group.IsPerfect (Subgroup.normalClosure (H : Set G)) := by
  sorry

/-- Over any commutative ring, the resultant of `∏ i ∈ s, (X - C (α i))` and `Q`, read with a
formal degree `n ≥ Q.natDegree`, is `∏ i ∈ s, Q.eval (α i)`, by `Polynomial.resultant_prod_left`
and `Polynomial.resultant_X_sub_C_left`; Mathlib's `Polynomial.resultant_eq_prod_eval` is stated
over a domain. -/
theorem Polynomial.resultant_prod_X_sub_C_left {R ι : Type*} [CommRing R] (s : Finset ι)
    (α : ι → R) (Q : R[X]) {n : ℕ} (hn : Q.natDegree ≤ n) :
    (∏ i ∈ s, (X - C (α i))).resultant Q (∏ i ∈ s, (X - C (α i))).natDegree n =
      ∏ i ∈ s, Q.eval (α i) := by
  sorry

/-- The same in the reversed order: for `Q.natDegree ≤ m`, the resultant of `Q` and
`∏ i ∈ s, (X - C (α i))` is `(-1) ^ (m * s.card) * ∏ i ∈ s, Q.eval (α i)`
(by `Polynomial.resultant_comm`). -/
theorem Polynomial.resultant_prod_X_sub_C_right {R ι : Type*} [CommRing R] (s : Finset ι)
    (α : ι → R) (Q : R[X]) {m : ℕ} (hm : Q.natDegree ≤ m) :
    Q.resultant (∏ i ∈ s, (X - C (α i))) m (∏ i ∈ s, (X - C (α i))).natDegree =
      (-1) ^ (m * s.card) * ∏ i ∈ s, Q.eval (α i) := by
  sorry

/-- The resultant of two products of linear factors, with the default degrees, is
`∏ i ∈ s, ∏ j ∈ t, (α i - β j)` (by `Polynomial.eval_prod`). -/
theorem Polynomial.resultant_prod_X_sub_C_prod_X_sub_C {R ι κ : Type*} [CommRing R]
    (s : Finset ι) (t : Finset κ) (α : ι → R) (β : κ → R) :
    (∏ i ∈ s, (X - C (α i))).resultant (∏ j ∈ t, (X - C (β j))) =
      ∏ i ∈ s, ∏ j ∈ t, (α i - β j) := by
  sorry

/-! ## Layer 2: modules, flatness, finite presentation, injective modules -/

/-- A finite product of modules is flat if and only if every factor is (Tau Ceti's instance
`Module.Flat.pi` for one direction; `Module.Flat.of_linearEquiv` and
`Module.Flat.directSum_iff` for the other). -/
theorem Module.Flat.pi_iff {R ι : Type*} {M : ι → Type*} [CommSemiring R]
    [∀ i, AddCommMonoid (M i)] [∀ i, Module R (M i)] [Finite ι] :
    Module.Flat R (∀ i, M i) ↔ ∀ i, Module.Flat R (M i) := by
  sorry

/-- A product of two modules is flat if and only if both factors are. -/
theorem Module.Flat.prod_iff {R M N : Type*} [CommSemiring R] [AddCommMonoid M] [Module R M]
    [AddCommMonoid N] [Module R N] :
    Module.Flat R (M × N) ↔ Module.Flat R M ∧ Module.Flat R N := by
  sorry

/-- For a finitely presented module `M`, the canonical map `M ⊗ (Π i, P i) → Π i, M ⊗ P i` is
bijective for every family `P` (Stacks, Tag 059K, (1) ⇒ (2)). -/
theorem Module.FinitePresentation.piRightHom_bijective {R M ι : Type*} [CommRing R]
    [AddCommGroup M] [Module R M] [Module.FinitePresentation R M] (P : ι → Type*)
    [∀ i, AddCommGroup (P i)] [∀ i, Module R (P i)] :
    Function.Bijective (TensorProduct.piRightHom R R M P) := by
  sorry

universe v in
/-- A ring `R` is Noetherian if and only if every finitely generated `R`-module, in a universe in
which `R` is small, is finitely presented. -/
theorem isNoetherianRing_iff_forall_finitePresentation (R : Type*) [Ring R] [Small.{v} R] :
    IsNoetherianRing R ↔ ∀ (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M],
      Module.FinitePresentation R M := by
  sorry

/-- For a basis `𝒞` of `N`, an element of `P ⊗ N` lies in the range of `f.rTensor N` if and only
if each of its coordinates in `P` with respect to `𝒞` lies in the range of `f`. -/
theorem TensorProduct.mem_range_rTensor_iff_equivFinsuppOfBasisRight {R M N P κ : Type*}
    [CommSemiring R] [AddCommMonoid M] [Module R M] [AddCommMonoid N] [Module R N]
    [AddCommMonoid P] [Module R P] [DecidableEq κ] (𝒞 : Module.Basis κ R N) (f : M →ₗ[R] P)
    (x : P ⊗[R] N) :
    x ∈ LinearMap.range (f.rTensor N) ↔
      ∀ i, TensorProduct.equivFinsuppOfBasisRight 𝒞 x i ∈ LinearMap.range f := by
  sorry

universe v in
/-- Over a Noetherian ring, the `I`-primary component (the `I`-power torsion) of an injective
module is injective (Stacks, Tag 08XW, (2)). The universe hypothesis is that of
`Module.Baer.of_injective`. -/
theorem Ideal.injective_primaryComponent {A : Type*} [CommRing A] [IsNoetherianRing A]
    [Small.{v} A] (I : Ideal A) {Q : Type v} [AddCommGroup Q] [Module A Q]
    [Module.Injective A Q] : Module.Injective A (I.primaryComponent Q) := by
  sorry

/-- A module is `I`-adically complete when the ideal `I` is nilpotent. -/
theorem IsAdicComplete.of_isNilpotent {R : Type*} [CommRing R] {I : Ideal R} (M : Type*)
    [AddCommGroup M] [Module R M] (hI : IsNilpotent I) : IsAdicComplete I M := by
  sorry

/-- For `R → S → T`, if `H¹` of the cotangent complex of `T` over `S` vanishes and `Ω[T⁄S]` is
projective (for instance if `T` is formally smooth over `S`), the first fundamental sequence map
`T ⊗[S] Ω[S⁄R] → Ω[T⁄R]` has a `T`-linear retraction (Stacks, Tag 031K). Its cokernel is
`Ω[T⁄S]` by `KaehlerDifferential.exact_mapBaseChange_map`. -/
theorem KaehlerDifferential.exists_retraction_mapBaseChange (R S T : Type*) [CommRing R]
    [CommRing S] [CommRing T] [Algebra R S] [Algebra R T] [Algebra S T] [IsScalarTower R S T]
    [Subsingleton (Algebra.H1Cotangent S T)] [Module.Projective T Ω[T⁄S]] :
    ∃ l : Ω[T⁄R] →ₗ[T] T ⊗[S] Ω[S⁄R],
      l ∘ₗ KaehlerDifferential.mapBaseChange R S T = LinearMap.id := by
  sorry

/-- Let `x` be an element of an additive subgroup `P` of a `ℚ`-vector space that is divisible in
`P` only by units of `ℤ`. Then `q • x ∈ P` exactly when `q` is an integer. -/
theorem AddSubgroup.rat_smul_mem_iff {V : Type*} [AddCommGroup V] [Module ℚ V]
    {P : AddSubgroup V} {x : V} (hx : x ∈ P)
    (hx' : ∀ y ∈ P, ∀ m : ℤ, x = m • y → IsUnit m) {q : ℚ} :
    q • x ∈ P ↔ ∃ n : ℤ, q = n := by
  sorry

/-- Over a commutative principal ideal ring, a module on which every nonzero `r` acts surjectively
satisfies Baer's criterion; Mathlib's `Module.Baer.of_divisible` is the case of `ℤ`. -/
theorem Module.Baer.of_isPrincipalIdealRing {R Q : Type*} [CommRing R] [IsPrincipalIdealRing R]
    [AddCommGroup Q] [Module R Q]
    (hQ : ∀ r : R, r ≠ 0 → Function.Surjective (r • · : Q → Q)) : Module.Baer R Q := by
  sorry

universe u v in
/-- Over a principal ideal domain, a module is injective if and only if it is divisible. -/
theorem Module.injective_iff_forall_smul_surjective {R : Type u} [CommRing R] [IsDomain R]
    [IsPrincipalIdealRing R] [Small.{v} R] {Q : Type v} [AddCommGroup Q] [Module R Q] :
    Module.Injective R Q ↔ ∀ r : R, r ≠ 0 → Function.Surjective (r • · : Q → Q) := by
  sorry

universe u v in
/-- Over a principal ideal domain, every quotient of an injective module is injective. -/
theorem Module.Injective.quotient {R : Type u} [CommRing R] [IsDomain R] [IsPrincipalIdealRing R]
    [Small.{v} R] {Q : Type v} [AddCommGroup Q] [Module R Q] [Module.Injective R Q]
    (N : Submodule R Q) : Module.Injective R (Q ⧸ N) := by
  sorry

/-- If `F` is flat over `A`, `p` is a prime of `A` and `a ∉ p`, then `a` is a nonzerodivisor on
`F ⧸ p • F`. -/
theorem Module.Flat.isSMulRegular_quotient_smul_top {A F : Type*} [CommRing A] [AddCommGroup F]
    [Module A F] [Module.Flat A F] {p : Ideal A} [p.IsPrime] {a : A} (ha : a ∉ p) :
    IsSMulRegular (F ⧸ p • (⊤ : Submodule A F)) a := by
  sorry

/-- For `A → B` and a `B`-module `F` flat over `A`, every associated prime `P` of the `B`-module
`F ⧸ (p B) • F` (in Mathlib's sense, with the radical of the colon) satisfies `P ∩ A = p`. -/
theorem Submodule.IsAssociatedPrime.comap_eq_of_flat {A B F : Type*} [CommRing A] [CommRing B]
    [Algebra A B] [AddCommGroup F] [Module A F] [Module B F] [IsScalarTower A B F]
    [Module.Flat A F] {p : Ideal A} [p.IsPrime] {P : Ideal B}
    (hP : ((p.map (algebraMap A B)) • (⊤ : Submodule B F)).IsAssociatedPrime P) :
    P.comap (algebraMap A B) = p := by
  sorry

/-- Over a principal ideal domain `A` with fraction field `K`, the module `K ⧸ A` satisfies
Baer's criterion (it is divisible, and README 2.9 applies). -/
theorem IsFractionRing.baer_quotient_range (A K : Type*) [CommRing A] [IsPrincipalIdealRing A]
    [Field K] [Algebra A K] [IsFractionRing A K] :
    Module.Baer A (K ⧸ LinearMap.range (Algebra.linearMap A K)) := by
  sorry

/-- For a domain `A` with fraction field `K` and `t ≠ 0`, the elements of `K ⧸ A` killed by `t`
form a module isomorphic to `A ⧸ (t)`, through `a ↦ a / t mod A`. -/
theorem IsFractionRing.nonempty_torsionBy_linearEquiv {A K : Type*} [CommRing A] [Field K]
    [Algebra A K] [IsFractionRing A K] {t : A} (ht : t ≠ 0) :
    Nonempty (Submodule.torsionBy A (K ⧸ LinearMap.range (Algebra.linearMap A K)) t ≃ₗ[A]
      A ⧸ Ideal.span {t}) := by
  sorry

/-- Over a Noetherian ring of Krull dimension at most one, a finitely generated torsion module has
finite length (Mathlib's `isFiniteLength_quotient_span_singleton` is the cyclic case; over a
principal ideal domain, `isFiniteLength_iff_isNoetherian_isArtinian` makes it Artinian). -/
theorem Module.IsTorsion.isFiniteLength {R M : Type*} [CommRing R] [IsNoetherianRing R]
    [Ring.KrullDimLE 1 R] [AddCommGroup M] [Module R M] [Module.Finite R M]
    (hM : Module.IsTorsion R M) : IsFiniteLength R M := by
  sorry

/-! ## Layer 3: derivations -/

/-- The Leibniz rule for a finite product. -/
theorem Derivation.leibniz_prod {R A M ι : Type*} [CommSemiring R] [CommSemiring A]
    [AddCommMonoid M] [Algebra R A] [Module A M] [Module R M] (D : Derivation R A M)
    [DecidableEq ι] (s : Finset ι) (f : ι → A) :
    D (∏ i ∈ s, f i) = ∑ i ∈ s, (∏ j ∈ s.erase i, f j) • D (f i) := by
  sorry

/-- The Leibniz rule for integer powers of a unit of a commutative ring, extending
`Derivation.leibniz_pow` and the statement `Derivation.leibniz_zpow` over fields. -/
theorem Derivation.leibniz_zpow_units {R A M : Type*} [CommRing R] [CommRing A] [Algebra R A]
    [AddCommGroup M] [Module A M] [Module R M] (D : Derivation R A M) (u : Aˣ) (n : ℤ) :
    D ↑(u ^ n) = n • ((u ^ (n - 1) : Aˣ) : A) • D ↑u := by
  sorry

/-- The commutator of a derivation `D` with left multiplication by `a` is left multiplication by
`D a`. -/
theorem Derivation.lie_mulLeft {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]
    (D : Derivation R A A) (a : A) :
    ⁅(D : Module.End R A), LinearMap.mulLeft R a⁆ = LinearMap.mulLeft R (D a) := by
  sorry

/-- Conjugating a derivation by multiplication by a unit `u` subtracts multiplication by the
logarithmic derivative `u⁻¹ * D u`. -/
theorem Derivation.mulLeft_mul_mul_mulLeft_inv {R A : Type*} [CommRing R] [CommRing A]
    [Algebra R A] (D : Derivation R A A) (u : Aˣ) :
    LinearMap.mulLeft R (u : A) * (D : Module.End R A) * LinearMap.mulLeft R ((u⁻¹ : Aˣ) : A) =
      (D : Module.End R A) - LinearMap.mulLeft R (((u⁻¹ : Aˣ) : A) * D u) := by
  sorry

/-! ## Layer 4: topology -/

/-- Currying `C(X × Y, Z) → C(X, C(Y, Z))` is continuous for the compact-open topologies when `X`
is locally compact, with no hypothesis on `Y` (Mathlib's `ContinuousMap.continuous_curry` asks
for `LocallyCompactSpace (X × Y)`). -/
theorem ContinuousMap.continuous_curry_of_locallyCompactSpace {X Y Z : Type*}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z] [LocallyCompactSpace X] :
    Continuous (ContinuousMap.curry : C(X × Y, Z) → C(X, C(Y, Z))) := by
  sorry

/-- Currying `C(X × Y, Z) → C(X, C(Y, Z))` is continuous for the compact-open topologies when `X`
is an `R1Space` (preregular), with no hypothesis on `Y`. -/
theorem ContinuousMap.continuous_curry_of_r1Space {X Y Z : Type*} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] [R1Space X] :
    Continuous (ContinuousMap.curry : C(X × Y, Z) → C(X, C(Y, Z))) := by
  sorry

/-- Uncurrying `C(X, C(Y, Z)) → C(X × Y, Z)` is continuous for the compact-open topologies when
`X` is an `R1Space` and `Y` is locally compact. -/
theorem ContinuousMap.continuous_uncurry_of_r1Space {X Y Z : Type*} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] [R1Space X] [LocallyCompactSpace Y] :
    Continuous (ContinuousMap.uncurry : C(X, C(Y, Z)) → C(X × Y, Z)) := by
  sorry

/-- In a Noetherian quasi-sober space, a set `E` stable under generalization is open as soon as
every `x ∈ E` has an open neighbourhood `W` with `W ∩ closure {x} ⊆ E`. -/
theorem NoetherianSpace.isOpen_of_stableUnderGeneralization {α : Type*} [TopologicalSpace α]
    [TopologicalSpace.NoetherianSpace α] [QuasiSober α] {E : Set α}
    (hE : StableUnderGeneralization E)
    (hE' : ∀ x ∈ E, ∃ W : Set α, IsOpen W ∧ x ∈ W ∧ W ∩ closure {x} ⊆ E) : IsOpen E := by
  sorry

/-! ## Layer 5: finite monoids, determinants, identities, integer-valued polynomials, traces -/

universe u in
/-- A finite monoid has a right zero (an element `p` with `u * p = p` for every `u`) if and only
if any two of its principal right ideals meet and every morphism from it to a group is trivial. -/
theorem Monoid.exists_forall_mul_eq_self_iff_of_finite {M : Type u} [Monoid M] [Finite M] :
    (∃ p : M, ∀ u : M, u * p = p) ↔
      (∀ u v : M, ∃ u' v' : M, u * u' = v * v') ∧
        ∀ (G : Type u) [Group G] (f : M →* G), f = 1 := by
  sorry

/-- The **Cauchy–Binet formula** for minors: the minor of `A * B` on rows `I` and columns `K` is
the sum, over the `n`-element subsets `s` of `ι`, of the products of the minor of `A` on rows `I`
and columns `s` and the minor of `B` on rows `s` and columns `K`. -/
theorem Matrix.det_submatrix_mul {R l o ι : Type*} [CommRing R] [Fintype ι] [LinearOrder ι]
    {n : ℕ} (A : Matrix l ι R) (B : Matrix ι o R) (I : Fin n → l) (K : Fin n → o) :
    ((A * B).submatrix I K).det = ∑ s : Set.powersetCard ι n,
      (A.submatrix I (Set.powersetCard.ofFinEmbEquiv.symm s)).det *
        (B.submatrix (Set.powersetCard.ofFinEmbEquiv.symm s) K).det := by
  sorry

/-- The **Binet–Cauchy identity**, with the sum over ordered pairs `(i, j)`:
`∑ (a i * b j - a j * b i) * (c i * d j - c j * d i)` is
`2 * ((∑ a i * c i) * (∑ b i * d i) - (∑ a i * d i) * (∑ b i * c i))`. -/
theorem Finset.sum_sum_mul_sub_mul_mul_mul_sub_mul {ι R : Type*} [CommRing R] (s : Finset ι)
    (a b c d : ι → R) :
    ∑ i ∈ s, ∑ j ∈ s, (a i * b j - a j * b i) * (c i * d j - c j * d i) =
      2 * ((∑ i ∈ s, a i * c i) * (∑ i ∈ s, b i * d i) -
        (∑ i ∈ s, a i * d i) * ∑ i ∈ s, b i * c i) := by
  sorry

open scoped ComplexConjugate in
/-- **Lagrange's identity** over `ℝ` or `ℂ`, with the sum over ordered pairs `(i, j)`: the sum
of `‖a i * b j - a j * b i‖ ^ 2` is
`2 * ((∑ ‖a i‖ ^ 2) * (∑ ‖b i‖ ^ 2) - ‖∑ conj (a i) * b i‖ ^ 2)`; it refines
`Finset.sum_mul_sq_le_sq_mul_sq`. -/
theorem RCLike.sum_sum_norm_mul_sub_mul_sq {K ι : Type*} [RCLike K] (s : Finset ι)
    (a b : ι → K) :
    ∑ i ∈ s, ∑ j ∈ s, ‖a i * b j - a j * b i‖ ^ 2 =
      2 * ((∑ i ∈ s, ‖a i‖ ^ 2) * ∑ i ∈ s, ‖b i‖ ^ 2 - ‖∑ i ∈ s, conj (a i) * b i‖ ^ 2) := by
  sorry

/-- The integer-valued polynomials: the `ℤ`-subalgebra of `ℚ[X]` of the polynomials taking
integer values at all integers. -/
noncomputable def Polynomial.intValued : Subalgebra ℤ ℚ[X] where
  carrier := {P | ∀ n : ℤ, P.eval (n : ℚ) ∈ Set.range ((↑) : ℤ → ℚ)}
  mul_mem' {P Q} hP hQ n := by
    obtain ⟨a, ha⟩ := hP n
    obtain ⟨b, hb⟩ := hQ n
    exact ⟨a * b, by simp [ha, hb]⟩
  add_mem' {P Q} hP hQ n := by
    obtain ⟨a, ha⟩ := hP n
    obtain ⟨b, hb⟩ := hQ n
    exact ⟨a + b, by simp [ha, hb]⟩
  algebraMap_mem' c _ := ⟨c, by simp⟩

/-- A rational polynomial is integer-valued as soon as it takes integer values at all natural
numbers. -/
theorem Polynomial.mem_intValued_iff_forall_natCast {P : ℚ[X]} :
    P ∈ Polynomial.intValued ↔ ∀ m : ℕ, P.eval (m : ℚ) ∈ Set.range ((↑) : ℤ → ℚ) := by
  sorry

/-- **Pólya's basis**: the binomial polynomials `Ring.choose X n` form a `ℤ`-basis of the
integer-valued polynomials. -/
theorem Polynomial.exists_basis_intValued :
    ∃ b : Module.Basis ℕ ℤ Polynomial.intValued,
      ∀ n, (b n : ℚ[X]) = Ring.choose (X : ℚ[X]) n := by
  sorry

/-- For idempotent square matrices `P`, `Q` over a commutative ring, every odd power of `P - Q`
has trace `P.trace - Q.trace` (with no hypothesis on `2`; the route uses `Matrix.trace_mul_comm`).
-/
theorem Matrix.trace_sub_pow_odd_of_isIdempotentElem {n R : Type*} [Fintype n] [DecidableEq n]
    [CommRing R] {P Q : Matrix n n R} (hP : IsIdempotentElem P) (hQ : IsIdempotentElem Q)
    (k : ℕ) : ((P - Q) ^ (2 * k + 1)).trace = P.trace - Q.trace := by
  sorry

/-- Any two elements of the Grothendieck group of a commutative monoid `M` are fractions of
elements of `M` with a common denominator. -/
theorem GrothendieckGroup.exists_eq_div_of_and_eq_div_of {M : Type*} [CommMonoid M]
    (x y : Algebra.GrothendieckGroup M) :
    ∃ a b c : M, x = Algebra.GrothendieckGroup.of a / Algebra.GrothendieckGroup.of c ∧
      y = Algebra.GrothendieckGroup.of b / Algebra.GrothendieckGroup.of c := by
  sorry

/-- Over an algebraically closed field `k`, in any characteristic, two simple modules over a
`k`-algebra `A` that are finite-dimensional over `k` and have the same trace function
`a ↦ LinearMap.trace k _ (Module.toModuleEnd k _ a)` are isomorphic (Schur's lemma
`IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed` and Jacobson density). -/
theorem IsSimpleModule.nonempty_linearEquiv_of_trace_eq {k A S T : Type*} [Field k]
    [IsAlgClosed k] [Ring A] [Algebra k A]
    [AddCommGroup S] [Module A S] [Module k S] [IsScalarTower k A S] [IsSimpleModule A S]
    [FiniteDimensional k S]
    [AddCommGroup T] [Module A T] [Module k T] [IsScalarTower k A T] [IsSimpleModule A T]
    [FiniteDimensional k T]
    (h : ∀ a : A, LinearMap.trace k S (Module.toModuleEnd k S a) =
      LinearMap.trace k T (Module.toModuleEnd k T a)) :
    Nonempty (S ≃ₗ[A] T) := by
  sorry

end TauCetiRoadmap.GrothendieckNotesLemmas
