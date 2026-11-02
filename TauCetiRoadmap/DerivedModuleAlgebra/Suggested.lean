module

public import Mathlib
public import TauCeti.Algebra.Module.Injective.Envelope.Basic

/-!
# DerivedModuleAlgebra: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few real-bodied
definitions those statements need. The README carries every target, API list and Check.

Headline theorems that are not statable at the pins, and the carrier each lacks:

* the unbounded module derived tensor `⊗^L` on `D(R)` with its K-flat models (§0.2) and the
  derived scalar extension and restriction functors with their adjunction (§1.E.0): no derived
  tensor bifunctor or derived extension of scalars on `DerivedCategory (ModuleCat R)` exists at
  the pin, and the module K-flat replacement is itself a target of §0.I.1;
* the shuffle and Alexander–Whitney homotopy equivalences and the bisimplicial diagonal comparison
  (§0.2.2): the shuffle map and the diagonal of a bisimplicial object are not constructed at the
  pin;
* the cotangent complex, its powers and the deformation classes (§§0.1–0.25): the simplicial
  polynomial resolution and the full complex `L_(B/A)` are targets of §§0.1 and 0.4;
* the derived limit functor `Rlim` on strict towers, its shift compatibility, exactness and
  cofinal comparisons (§1.1), and the unbounded derived Hom (§1.1.1): no derived limit or
  derived Hom functor on `DerivedCategory (ℕᵒᵖ ⥤ ModuleCat R)` or `D(R)` exists at the pin;
* the completion reflector with its unit, adjunction and derived Nakayama (§1.3), the Koszul
  completion tower (§1.4) and the ordinary-quotient comparison (§1.5): all are built from the
  derived limit and derived tensor above;
* completion of simplicial commutative algebras (§1.6): built from the completion reflector;
* complete faithful-flat descent and complete Tor-amplitude (§§1.8–1.9): built from `⊗^L`;
* compatible finite-free models, strict-tower limits and perfect inverse-system effectivity
  (§§1.E.0–1.E.1): their statements mention derived scalar extension and the derived limit;
* the spectral sequence of a first-quadrant double complex with its abutment (§S.1): Mathlib's
  spectral object records the pages, and the abutment filtration and edge maps are targets.

Derived categories of modules are `DerivedCategory (ModuleCat.{u} R)` with the standard instance
`HasDerivedCategory.{u+1}`; towers are indexed by `ℕ` with transitions from `n + 1` to `n`.
-/

@[expose] public section

namespace TauCetiRoadmap.DerivedModuleAlgebra

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated
open TensorProduct Polynomial
open scoped TensorProduct

noncomputable section
universe u uFlat v

/-! ## 0.DP.1: homogeneous and multiplicative polynomial laws -/

namespace PolynomialLaw

variable {A : Type u} [CommRing A]

/-- `f` is homogeneous of degree `n`: `f_S(s • x) = s ^ n • f_S(x)` for every commutative
`A`-algebra `S`, `s ∈ S` and `x ∈ S ⊗ M` ([Chenevier], §1.1, pp. 6–7). -/
def IsHomogeneousOfDegree {M N : Type*} [AddCommGroup M] [Module A M] [AddCommGroup N]
    [Module A N] (n : ℕ) (f : M →ₚₗ[A] N) : Prop :=
  ∀ (S : Type u) [CommRing S] [Algebra A S] (s : S) (x : S ⊗[A] M),
    f.toFun' S (s • x) = s ^ n • f.toFun' S x

/-- `f` preserves `1` and products after every scalar extension to a commutative `A`-algebra
([Chenevier], §1.1, p. 8). -/
def IsMultiplicative {R B : Type*} [Ring R] [Algebra A R] [Ring B] [Algebra A B]
    (f : R →ₚₗ[A] B) : Prop :=
  ∀ (S : Type u) [CommRing S] [Algebra A S],
    f.toFun' S 1 = 1 ∧ ∀ x y : S ⊗[A] R, f.toFun' S (x * y) = f.toFun' S x * f.toFun' S y

-- The identity law is homogeneous of degree one.
example {M : Type*} [AddCommGroup M] [Module A M] :
    IsHomogeneousOfDegree 1 (PolynomialLaw.id : M →ₚₗ[A] M) := by
  intro S _ _ s x
  rw [PolynomialLaw.id_apply', pow_one]
  rfl

/-- **Ground values do not determine a polynomial law** (README 0.DP.1): over a field `k` with
`p` elements there is a nonzero homogeneous law `k² → k` of degree `p + 1`, given after every
scalar extension by `(x, y) ↦ x ^ p y − x y ^ p`, whose ground map vanishes identically although its
value on the generic point of `k[X]` is `X ^ p − X ≠ 0`. -/
theorem exists_homogeneous_ground_zero_ne_zero {k : Type} [Field k] (p : ℕ) [Fact p.Prime]
    (e : k ≃+* ZMod p) :
    ∃ f : (Fin 2 → k) →ₚₗ[k] k,
      IsHomogeneousOfDegree (A := k) (p + 1) f ∧
      (∀ (S : Type) [CommRing S] [Algebra k S] (x y : S),
        f.toFun' S (x ⊗ₜ[k] ![1, 0] + y ⊗ₜ[k] ![0, 1]) =
          (x ^ p * y - x * y ^ p) ⊗ₜ[k] (1 : k)) ∧
      (∀ x, f.ground x = 0) ∧ f ≠ 0 ∧
      Algebra.TensorProduct.rid k k k[X]
        (f.toFun' k[X]
          (X ⊗ₜ[k] ![1, 0] + 1 ⊗ₜ[k] ![0, 1])) = X ^ p - X ∧
      (X ^ p - X : k[X]) ≠ 0 := by
  sorry

end PolynomialLaw

/-! ## 0.DP.3: the augmentation of the divided power algebra -/

namespace PD
section Augmentation

variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

/-- The augmentation `ε : Γ_R(M) → R`, `dp₀(m) ↦ 1`, `dp_n(m) ↦ 0` for `n > 0`: the lift into the
zero ideal of `R` along the zero map. -/
noncomputable def augmentation : DividedPowerAlgebra R M →ₐ[R] R :=
  DividedPowerAlgebra.lift (dividedPowersBot R) (0 : M →ₗ[R] R) (fun _ ↦ by simp)

/-- The augmentation ideal `Γ_R(M)₊ = ker ε`. -/
noncomputable def augmentationIdeal : Ideal (DividedPowerAlgebra R M) :=
  RingHom.ker (augmentation R M)

/-- **Positive-degree generators of the augmentation ideal** (README 0.DP.3): `Γ_R(M)₊` is the
ideal generated by the `dp_n(m)` with `n > 0`, for every commutative ring `R` and `R`-module `M`
(Stacks, Lemma 23.5.1, Tag 07H5, for free modules; Roby, III §§1–2, pp. 248–250, in general). -/
theorem augmentationIdeal_eq_span_dp :
    augmentationIdeal R M =
      Ideal.span {x | ∃ (n : ℕ) (m : M), 0 < n ∧ x = DividedPowerAlgebra.dp R n m} := by
  sorry

/-- **Base ideal and augmentation intersection** (README 0.DP.3): for every ideal `I` of `R`, the
extended ideal `IΓ_R(M)` meets `Γ_R(M)₊` in the product `IΓ_R(M) · Γ_R(M)₊`, with no flatness or
freeness hypothesis on `M`. -/
theorem map_inf_augmentationIdeal (I : Ideal R) :
    I.map (algebraMap R (DividedPowerAlgebra R M)) ⊓ augmentationIdeal R M =
      I.map (algebraMap R (DividedPowerAlgebra R M)) * augmentationIdeal R M := by
  sorry

end Augmentation

/-- **Degree one does not generate the augmentation ideal in characteristic two** (README 0.DP.3):
for `R = M = ZMod 2`, `dp₂(1)` is not in the ideal generated by the `dp₁(m)`. -/
theorem dp_two_not_mem_span_dp_one :
    DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2) ∉
      Ideal.span (Set.range fun m : ZMod 2 ↦ DividedPowerAlgebra.dp (ZMod 2) 1 m) := by
  sorry

end PD

/-! ## 0.I.1: module K-injective replacement -/

/-- **Every unbounded complex of modules admits a K-injective replacement** (README 0.I.1;
Stacks, Tag 070G for module categories). -/
theorem moduleKInjectiveReplacement (R : Type u) [Ring R]
    (K : CochainComplex (ModuleCat.{u} R) ℤ) :
    ∃ (L : CochainComplex (ModuleCat.{u} R) ℤ) (i : K ⟶ L),
      L.IsKInjective ∧ QuasiIso i := by
  sorry

/-! ## 0.2.1: flat modules as filtered colimits -/

namespace DerivedDeRham

/-- **Lazard's theorem** (README 0.2.1; Stacks, Theorem 10.81.4, Tag 058G): every flat module is
the colimit of a small filtered diagram of finite free modules, with a colimiting cocone and an
identification of its vertex. -/
theorem flatModuleFilteredFree (R : Type uFlat) [CommRing R] (M : Type uFlat) [AddCommGroup M]
    [Module R M] [Module.Flat R M] :
    ∃ (J : Type uFlat) (inst : SmallCategory J),
      letI := inst
      ∃ (_ : IsFiltered J) (P : J ⥤ ModuleCat.{uFlat} R) (c : Cocone P),
        Nonempty (IsColimit c) ∧ Nonempty (c.pt ≅ ModuleCat.of R M) ∧
          ∀ j, Module.Free R (P.obj j) ∧ Module.Finite R (P.obj j) := by
  sorry

end DerivedDeRham

/-! ## 1.T.1: towers, `lim¹` and the Mittag-Leffler condition -/

namespace CompactCoefficients

/-- An `ℕ`-indexed tower of abelian groups `⋯ → A₂ → A₁ → A₀` (README 1.T.1). -/
structure Tower where
  /-- The terms. -/
  obj : ℕ → Type u
  [inst : ∀ n, AddCommGroup (obj n)]
  /-- The transition maps `A_{n+1} → A_n`. -/
  map : ∀ n, obj (n + 1) →+ obj n

attribute [instance] Tower.inst

namespace Tower

variable (A : Tower.{u})

/-- The shift map `∏ A_n → ∏ A_n`, `(a_n) ↦ (a_n - φ_n(a_{n+1}))`. -/
def shift : (∀ n, A.obj n) →+ (∀ n, A.obj n) where
  toFun a n := a n - A.map n (a (n + 1))
  map_zero' := by ext n; simp
  map_add' a b := by ext n; simp only [Pi.add_apply, map_add]; abel

/-- `lim¹ A`: the cokernel of the shift. For an `ℕ`-indexed tower this is `R¹lim`, and
`Rⁱlim = 0` for `i ≥ 2` (Stacks, Tag 07KW). -/
abbrev limOne : Type u := (∀ n, A.obj n) ⧸ A.shift.range

/-- The tower as a functor `ℕᵒᵖ ⥤ AddCommGrpCat`. -/
def toFunctor : ℕᵒᵖ ⥤ AddCommGrpCat.{u} :=
  Functor.ofOpSequence (X := fun n => AddCommGrpCat.of (A.obj n))
    (fun n => AddCommGrpCat.ofHom (A.map n))

/-- The Mittag-Leffler condition: Mathlib's condition on the underlying functor to types. -/
abbrev IsMittagLeffler : Prop :=
  (A.toFunctor ⋙ CategoryTheory.forget AddCommGrpCat).IsMittagLeffler

/-- **Mittag-Leffler towers have vanishing `lim¹`** (README 1.T.1; Stacks, Lemma 15.88.1,
Tag 07KW). -/
theorem limOne_subsingleton_of_isMittagLeffler (h : A.IsMittagLeffler) :
    Subsingleton A.limOne := by
  sorry

/-- A morphism of towers: levelwise homomorphisms commuting with the transitions. -/
structure Hom (A B : Tower.{u}) where
  /-- The levelwise maps. -/
  app : ∀ n, A.obj n →+ B.obj n
  comm : ∀ n, (app n).comp (A.map n) = (B.map n).comp (app (n + 1))

variable {A} {B : Tower.{u}}

/-- The map on `∏ A_n` induced by a morphism of towers. -/
def Hom.onProduct (f : Hom A B) : (∀ n, A.obj n) →+ (∀ n, B.obj n) where
  toFun a n := f.app n (a n)
  map_zero' := by ext; simp
  map_add' a b := by ext; simp

/-- The induced map on `lim¹`. -/
def Hom.limOneMap (f : Hom A B) : A.limOne →+ B.limOne :=
  QuotientAddGroup.map _ _ f.onProduct (by
    rintro _ ⟨a, rfl⟩
    refine ⟨f.onProduct a, ?_⟩
    ext n
    have h := congrArg (fun φ => φ (a (n + 1))) (f.comm n)
    simp only [AddMonoidHom.coe_comp, Function.comp_apply] at h
    simp only [shift, Hom.onProduct, AddMonoidHom.coe_mk, ZeroHom.coe_mk, map_sub]
    rw [h])

/-- **The six-term sequence of `lim` and `lim¹`, right half** (README 1.T.1; Stacks, Lemma 15.88.1,
Tag 07KW): for a levelwise short exact sequence of towers `0 → A → B → C → 0`, the sequence
`lim¹ A → lim¹ B → lim¹ C → 0` is exact. The left half `0 → lim A → lim B → lim C → lim¹ A` is
the companion statement of the README. -/
theorem limOne_exact {C : Tower.{u}} (f : Hom A B) (g : Hom B C)
    (hexact : ∀ n, Function.Exact (f.app n) (g.app n))
    (hinj : ∀ n, Function.Injective (f.app n)) (hsurj : ∀ n, Function.Surjective (g.app n)) :
    Function.Exact f.limOneMap g.limOneMap ∧ Function.Surjective g.limOneMap := by
  sorry

end Tower

end CompactCoefficients

namespace DerivedDeRham

/-- The standard derived-category instance for modules over `R`, local to these signatures. -/
local instance moduleDerived (R : Type u) [Ring R] :
    HasDerivedCategory.{u+1} (ModuleCat.{u} R) :=
  HasDerivedCategory.standard _

/-- The derived category `D(R)` of `R`-modules. -/
abbrev D (R : Type u) [Ring R] := DerivedCategory (ModuleCat.{u} R)

/-- A module placed in cohomological degree zero. -/
abbrev mod0 (R : Type u) [Ring R] (M : ModuleCat.{u} R) : D R :=
  (DerivedCategory.singleFunctor (ModuleCat R) 0).obj M

/-- Cohomology in the indicated cohomological degree. -/
abbrev H (R : Type u) [Ring R] (n : ℤ) (M : D R) : ModuleCat.{u} R :=
  (DerivedCategory.homologyFunctor (ModuleCat R) n).obj M

/-! ## 1.E.0: perfect complexes and finite models -/

/-- Ordinary scalar extension applied to every term and differential of a complex. -/
abbrev complexBaseChange {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) :
    CochainComplex (ModuleCat.{u} R) ℤ ⥤ CochainComplex (ModuleCat.{u} S) ℤ :=
  (ModuleCat.extendScalars f).mapHomologicalComplex (ComplexShape.up ℤ)

/-- A finite-free complex with a specified upper bound, allowing an infinite left tail. -/
def IsFiniteFreeModel (R : Type u) [Ring R]
    (P : CochainComplex (ModuleCat.{u} R) ℤ) (b : ℤ) : Prop :=
  ∀ i, Module.Free R (P.X i) ∧ Module.Finite R (P.X i) ∧ (b < i → IsZero (P.X i))

/-- Perfection over a unital ring means a bounded finite-projective left-module representative
(README 1.E.0; Stacks, Definition 15.76.1, Tag 0657, for commutative rings). -/
def IsPerfect (R : Type u) [Ring R] (K : D R) : Prop :=
  ∃ (P : CochainComplex (ModuleCat.{u} R) ℤ) (a b : ℤ),
    (∀ i, Module.Projective R (P.X i) ∧ Module.Finite R (P.X i) ∧
      (i < a ∨ b < i → IsZero (P.X i))) ∧
    Nonempty ((DerivedCategory.Q (C := ModuleCat R)).obj P ≅ K)

/-- Pseudo-coherence over a ring means a bounded-above finite-free representative
(README 1.E.0; Stacks, Definition 15.64.1, Tag 064Q). -/
def IsPseudoCoherent (R : Type u) [Ring R] (K : D R) : Prop :=
  ∃ (P : CochainComplex (ModuleCat.{u} R) ℤ) (b : ℤ), IsFiniteFreeModel R P b ∧
    Nonempty ((DerivedCategory.Q (C := ModuleCat R)).obj P ≅ K)

/-- **Retracts of perfect complexes are perfect** (README 1.E.0; Stacks, Lemma 15.76.5, Tag 066S,
for commutative rings), over every unital ring. -/
theorem isPerfect_retract (R : Type u) [Ring R] {K L : D R}
    (i : K ⟶ L) (r : L ⟶ K) (h : i ≫ r = 𝟙 K) (hL : IsPerfect R L) :
    IsPerfect R K := by
  sorry

/-- Perfect complexes are closed under cohomological shifts (README 1.E.0). -/
theorem isPerfect_shift (R : Type u) [Ring R] (K : D R) (hK : IsPerfect R K) (n : ℤ) :
    IsPerfect R (K⟦n⟧) := by
  sorry

/-- **The third vertex of a distinguished triangle of perfect complexes is perfect**
(README 1.E.0; Stacks, Lemma 15.76.4, Tag 066R, for commutative rings), over every unital ring. -/
theorem isPerfect_triangle (R : Type u) [Ring R] (T : Triangle (D R))
    (hT : T ∈ distTriang (D R)) (h₁ : IsPerfect R T.obj₁) (h₂ : IsPerfect R T.obj₂) :
    IsPerfect R T.obj₃ := by
  sorry

/-- **Perfect complexes are pseudo-coherent** (README 1.E.0; Stacks, Lemma 15.76.2, Tag 0658):
a bounded finite-projective complex has a bounded-above finite-free representative. -/
theorem isPerfect_isPseudoCoherent (R : Type u) [Ring R] (K : D R)
    (hK : IsPerfect R K) : IsPseudoCoherent R K := by
  sorry

/-- Compatible ring projections exhibit `R` as the inverse limit of the ring tower. -/
def IsRingTowerLimit {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) : Prop :=
  (∀ n, (τ n).comp (π (n + 1)) = π n) ∧
    ∀ x : ∀ n, A n, (∀ n, τ n (x (n + 1)) = x n) → ∃! r : R, ∀ n, π n r = x n

/-- **Unit reflection from the first stage** (README 1.E.0): in a surjective ring tower with
locally nilpotent transition kernels, an element of the limit whose image in `A₀` is a unit is a
unit, so `ker(R → A₀)` lies in the Jacobson radical. -/
theorem ringTowerLimit_jacobson {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (hsurj : ∀ n, Function.Surjective (τ n))
    (hnil : ∀ n x, τ n x = 0 → IsNilpotent x)
    (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) (hlim : IsRingTowerLimit τ R π) :
    ∀ r : R, IsUnit (π 0 r) → IsUnit r := by
  sorry

/-- **Residue-field Tor criterion** (README 1.E.0; Stacks, Lemma 15.79.2, Tag 068V, with
Lemma 15.76.2, Tag 0658). Let `P` be a bounded-above finite-free complex over `R`. If for every
surjection `f : R → k` onto a field (so `k` is a residue field at a maximal ideal) the termwise
reduction `P ⊗_R k`, which computes `P ⊗^L_R k` because `P` is termwise free, has cohomology only
in degrees `[a, b]`, then `P` is quasi-isomorphic to a complex of finite projective `R`-modules
supported in `[a, b]`. -/
theorem pseudoCoherent_residueCriterion (R : Type u) [CommRing R]
    (P : CochainComplex (ModuleCat.{u} R) ℤ) (c : ℤ) (hP : IsFiniteFreeModel R P c) (a b : ℤ)
    (hfib : ∀ (k : Type u) [Field k] (f : R →+* k), Function.Surjective f →
      ∀ i : ℤ, i < a ∨ b < i →
        IsZero (H k i ((DerivedCategory.Q (C := ModuleCat k)).obj
          ((complexBaseChange f).obj P)))) :
    ∃ E : CochainComplex (ModuleCat.{u} R) ℤ,
      (∀ i, Module.Projective R (E.X i) ∧ Module.Finite R (E.X i) ∧
        (i < a ∨ b < i → IsZero (E.X i))) ∧
      Nonempty ((DerivedCategory.Q (C := ModuleCat R)).obj E ≅
        (DerivedCategory.Q (C := ModuleCat R)).obj P) := by
  sorry

/-! ## 1.2 and 1.7: derived completeness and complete flatness -/

/-- **Derived `I`-completeness** of `M ∈ D(A)`: every morphism from a shifted localization
`A[1/f][n]`, `f ∈ I`, to `M` is zero (Stacks, Lemma 15.93.1, Tag 091P, and Definition 15.93.4,
Tag 091S). This is a homotopical condition, not classical separatedness. -/
def derivedCompleteness (A : Type u) [CommRing A] (I : Ideal A) (M : D A) : Prop :=
  ∀ f ∈ I, ∀ n : ℤ,
    Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away f)))⟦n⟧ ⟶ M)

/-- **Completeness is tested on a finite generating set** (README 1.2; Stacks, Lemma 15.93.1,
Tag 091P, with Lemma 15.93.2, Tag 091Q). -/
theorem isDerivedCompleteGenerators (A : Type u) [CommRing A] (I : Ideal A) (M : D A)
    (s : Finset A) (hs : Ideal.span (s : Set A) = I) :
    derivedCompleteness A I M ↔ ∀ f ∈ s, ∀ n : ℤ,
      Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away f)))⟦n⟧ ⟶ M) := by
  sorry

/-- **Completeness depends only on the radical** (README 1.2; Stacks, Lemma 15.93.2, Tag 091Q):
the elements `f` with all `Hom(A[1/f][n], M) = 0` form a radical ideal, so ideals with the same
radical have the same complete objects. No finite generation is needed. -/
theorem isDerivedCompleteRadical (A : Type u) [CommRing A] (I J : Ideal A)
    (h : I.radical = J.radical) (M : D A) :
    derivedCompleteness A I M ↔ derivedCompleteness A J M := by
  sorry

/-- **`M` is derived complete iff every cohomology module is** (README 1.2; Stacks, Lemma 15.93.1,
Tag 091P, parts (3) and (4), and Lemma 15.93.6, Tag 091U), for an arbitrary ideal. -/
theorem isDerivedCompleteCohomology (A : Type u) [CommRing A] (I : Ideal A) (M : D A) :
    derivedCompleteness A I M ↔ ∀ j : ℤ, derivedCompleteness A I (mod0 A (H A j M)) := by
  sorry

/-- **Derived complete objects are closed under shifts and triangles** (README 1.2; Stacks,
Lemma 15.93.6, Tag 091U): the triangulated part of `isDerivedCompleteLimits`, which also asks for
products and derived limits. -/
theorem isDerivedComplete_triangle (A : Type u) [CommRing A] (I : Ideal A)
    (T : Pretriangulated.Triangle (D A)) (hT : T ∈ distTriang (D A))
    (h₁ : derivedCompleteness A I T.obj₁) (h₂ : derivedCompleteness A I T.obj₂) :
    derivedCompleteness A I T.obj₃ ∧ ∀ n : ℤ, derivedCompleteness A I (T.obj₁⟦n⟧) := by
  sorry

/-- **Complete flatness of a module** (README 1.7). A module `M` is `I`-completely flat when its
derived reduction `M ⊗^L_A A/I` is a flat `A/I`-module in degree zero: the higher `Tor_n^A(M, A/I)`
vanish and `A/I ⊗_A M` is flat over `A/I`. The predicate does not require `M` to be complete
([BMS19], Definition 4.1, p. 220). -/
def IsCompletelyFlatModule (A : Type u) [CommRing A] (I : Ideal A) (M : ModuleCat.{u} A) : Prop :=
  (∀ n : ℕ, 0 < n →
      IsZero (((CategoryTheory.Tor (ModuleCat.{u} A) n).obj M).obj (ModuleCat.of A (A ⧸ I)))) ∧
    Module.Flat (A ⧸ I) ((A ⧸ I) ⊗[A] M)

/-- **A flat module is `I`-completely flat** (README 1.7; [BMS19], Lemma 4.3, p. 221): its higher
`Tor` against `A/I` vanishes and its reduction is flat over `A/I`. -/
theorem isCompletelyFlatModule_of_flat (A : Type u) [CommRing A] (I : Ideal A)
    (M : ModuleCat.{u} A) [Module.Flat A M] : IsCompletelyFlatModule A I M := by
  sorry

end DerivedDeRham

namespace PerfectComplex

/-- The shared ordinary-module perfectness predicate, cited by the arithmetic and trace consumers
under this name (README 1.E.0). -/
abbrev IsPerfect (R : Type u) [Ring R] (K : DerivedDeRham.D R) : Prop :=
  DerivedDeRham.IsPerfect R K

end PerfectComplex

/-! ## 1.M: Matlis duality -/

namespace Matlis

/-- **Matlis duality, finite side** (README 1.M.1–1.M.2; Stacks, Proposition 47.7.8, Tag 08Z9).
Let `R` be a Noetherian local ring complete for its maximal ideal and `e : κ → E` an injective
envelope of its residue field. For a finite `R`-module `M`, the Matlis dual `Hom_R(M, E)` is
Artinian and the evaluation map `M → Hom_R(Hom_R(M, E), E)` is bijective. No finiteness of the
residue field is assumed. -/
theorem biduality_of_finite (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    (E : Type u) [AddCommGroup E] [Module R E] (e : IsLocalRing.ResidueField R →ₗ[R] E)
    (he : TauCeti.IsInjectiveEnvelope e)
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] :
    IsArtinian R (M →ₗ[R] E) ∧
      Function.Bijective (LinearMap.applyₗ : M →ₗ[R] (M →ₗ[R] E) →ₗ[R] E) := by
  sorry

/-- **Matlis duality, Artinian side** (README 1.M.1–1.M.2; Stacks, Proposition 47.7.8, Tag 08Z9).
Under the same hypotheses, for an Artinian `R`-module `M` the Matlis dual `Hom_R(M, E)` is a finite
`R`-module and the evaluation map `M → Hom_R(Hom_R(M, E), E)` is bijective. Completeness of `R` is
needed: for a non-complete discrete valuation ring the dual of `E` is the completion. -/
theorem biduality_of_artinian (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    (E : Type u) [AddCommGroup E] [Module R E] (e : IsLocalRing.ResidueField R →ₗ[R] E)
    (he : TauCeti.IsInjectiveEnvelope e)
    (M : Type u) [AddCommGroup M] [Module R M] [IsArtinian R M] :
    Module.Finite R (M →ₗ[R] E) ∧
      Function.Bijective (LinearMap.applyₗ : M →ₗ[R] (M →ₗ[R] E) →ₗ[R] E) := by
  sorry

end Matlis

end

end TauCetiRoadmap.DerivedModuleAlgebra
