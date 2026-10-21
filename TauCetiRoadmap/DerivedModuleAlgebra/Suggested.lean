import Mathlib
import TauCeti.RingTheory.Ideal.ArtinRees
import TauCeti.Algebra.Module.Injective.Envelope.Basic

/-!
# DerivedModuleAlgebra: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
These are suggested definitions and theorem signatures against the pinned Mathlib and Tau Ceti;
discharging them finishes neither a section nor the roadmap. `sorry` is expected: these are goals,
not results. Module-derived constructions use Mathlib's categories, complexes and localizations.
Signatures requiring the full cotangent, power or completion constructions are specified in the
README; the catalogue at the end records their names without introducing placeholder carriers.
-/

namespace TauCetiRoadmap.DerivedModuleAlgebra

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated
open TensorProduct Polynomial
open scoped TensorProduct

noncomputable section
universe u uFlat uRing v

/-! ## Polynomial laws: 0.DP.1 -/

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

-- Homogeneity is tested after scalar extension: the identity of `ℤ` is not of degree two.
example : ¬ IsHomogeneousOfDegree 2 (PolynomialLaw.id : ℤ →ₚₗ[ℤ] ℤ) := sorry

-- The zero law on `ℤ` preserves products but not `1`.
example : ¬ IsMultiplicative (0 : ℤ →ₚₗ[ℤ] ℤ) := sorry

-- Doubling the identity fails multiplicativity over `ℤ`.
example : ¬ IsMultiplicative (2 • (PolynomialLaw.id : ℤ →ₚₗ[ℤ] ℤ)) := sorry

-- The zero law is homogeneous in every degree, after every scalar extension.
example {M N : Type*} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N]
    (n : ℕ) : IsHomogeneousOfDegree n (0 : M →ₚₗ[A] N) := sorry

-- The identity preserves the tensor-product ring operations.
example {R : Type*} [Ring R] [Algebra A R] :
    IsMultiplicative (PolynomialLaw.id : R →ₚₗ[A] R) := sorry

-- Ground values do not determine a law over a finite field.
example {k : Type} [Field k] (p : ℕ) [Fact p.Prime] (e : k ≃+* ZMod p) :
    ∃ f : (Fin 2 → k) →ₚₗ[k] k,
      IsHomogeneousOfDegree (A := k) (p + 1) f ∧
      (∀ (S : Type) [CommRing S] [Algebra k S] (x y : S),
        f.toFun' S (x ⊗ₜ[k] ![1, 0] + y ⊗ₜ[k] ![0, 1]) =
          (x ^ p * y - x * y ^ p) ⊗ₜ[k] (1 : k)) ∧
      (∀ x, f.ground x = 0) ∧ f ≠ 0 ∧
      Algebra.TensorProduct.rid k k k[X]
        (f.toFun' k[X]
          (X ⊗ₜ[k] ![1, 0] + 1 ⊗ₜ[k] ![0, 1])) = X ^ p - X ∧
      (X ^ p - X : k[X]) ≠ 0 := sorry

end PolynomialLaw

/-! ## Integral divided-power computations: 0.DP.2 -/

example : DividedPowerAlgebra.dp ℤ 1 (1 : ℤ) ^ 2 =
    2 * DividedPowerAlgebra.dp ℤ 2 (1 : ℤ) := sorry

example : DividedPowerAlgebra.dp (ZMod 2) 1 (1 : ZMod 2) ^ 2 = 0 := sorry

example : DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2) ≠ 0 := sorry

example : DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2) ^ 2 = 0 := sorry

example : DividedPowerAlgebra.dp ℤ 2 (1 : ℤ) ^ 2 =
    6 * DividedPowerAlgebra.dp ℤ 4 (1 : ℤ) := sorry

/-! ## Augmentation of divided powers: 0.DP.3 -/

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

/-- The augmentation sends `dp₀(m)` to `1` and `dp_n(m)` to `0` for `n > 0`. -/
example (m : M) : augmentation R M (DividedPowerAlgebra.dp R 0 m) = 1 := by
  sorry

example (n : ℕ) (hn : n ≠ 0) (m : M) : DividedPowerAlgebra.dp R n m ∈ augmentationIdeal R M := by
  sorry

/-- A scalar lies in the augmentation ideal only if it is zero. -/
example (r : R) (hr : algebraMap R (DividedPowerAlgebra R M) r ∈ augmentationIdeal R M) :
    r = 0 := by
  sorry


/-- Degree one does not generate the augmentation ideal in characteristic two: for
`R = ZMod 2` and `M = R`, `dp₂(1)` is not in the ideal generated by the `dp₁(m)`. -/
theorem dp_two_not_mem_span_dp_one :
    DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2) ∉
      Ideal.span (Set.range fun m : ZMod 2 ↦ DividedPowerAlgebra.dp (ZMod 2) 1 m) := by
  sorry

open scoped Classical in
/-- Rational evaluation on `dp₂(1)` is distinct from augmentation
(augmentation_test_not_evaluation). -/
example :
    DividedPowerAlgebra.lift
      (DividedPowers.RatAlgebra.dividedPowers (⊤ : Ideal ℚ))
      (LinearMap.id : ℚ →ₗ[ℚ] ℚ) (fun _ ↦ by simp)
      (DividedPowerAlgebra.dp ℚ 2 (1 : ℚ)) = 1 / 2 ∧
    augmentation ℚ ℚ (DividedPowerAlgebra.dp ℚ 2 (1 : ℚ)) = 0 := by
  sorry


/-- The scalar and positive divided-generator calculation of README 0.DP.3. -/
theorem augmentation_test_positive_with_scalar (m : M) :
    augmentation R M (3 + DividedPowerAlgebra.dp R 2 m) = 3 := by
  sorry

/-- Augmentation kills the embedded degree-one module. -/
theorem augmentation_test_degree_one (m : M) :
    augmentation R M (DividedPowerAlgebra.dp R 1 m) = 0 := by
  sorry

/-- The second divided generator belongs to the augmentation ideal. -/
theorem augmentationIdeal_test_positive (m : M) :
    DividedPowerAlgebra.dp R 2 m ∈ augmentationIdeal R M := by
  sorry

/-- The integral augmentation ideal is proper. -/
theorem augmentationIdeal_test_unit :
    (1 : DividedPowerAlgebra ℤ ℤ) ∉ augmentationIdeal ℤ ℤ := by
  sorry

-- A scalar has zero positive-degree remainder.
example (r : R) :
    algebraMap R (DividedPowerAlgebra R M) r -
      algebraMap R (DividedPowerAlgebra R M)
        (augmentation R M (algebraMap R (DividedPowerAlgebra R M) r)) = 0 := sorry

-- For the zero module every element has zero positive-degree remainder.
example (z : DividedPowerAlgebra R (Fin 0 → R)) :
    z - algebraMap R (DividedPowerAlgebra R (Fin 0 → R))
      (augmentation R (Fin 0 → R) z) = 0 := sorry

-- The zero module has zero augmentation ideal.
example : augmentationIdeal R (Fin 0 → R) = ⊥ := sorry

-- The mixed remainder is a multiple of a positive divided-power generator.
example (m m' : M) :
    let z := (3 : DividedPowerAlgebra R M) +
      DividedPowerAlgebra.dp R 2 m * DividedPowerAlgebra.dp R 1 m'
    augmentation R M z = 3 ∧
      z - algebraMap R (DividedPowerAlgebra R M) (augmentation R M z) =
        DividedPowerAlgebra.dp R 2 m * DividedPowerAlgebra.dp R 1 m' ∧
      z - algebraMap R (DividedPowerAlgebra R M) (augmentation R M z) ∈
        Ideal.span {x | ∃ (n : ℕ) (v : M), 0 < n ∧ x = DividedPowerAlgebra.dp R n v} := sorry

-- The scalar, ideal and addition formulas characterize the augmentation splitting.
example : ∃ e : DividedPowerAlgebra R M ≃ₗ[R] R × augmentationIdeal R M,
    (∀ r : R, e (algebraMap R (DividedPowerAlgebra R M) r) = (r, 0)) ∧
    (∀ v : augmentationIdeal R M, e v = (0, v)) ∧
    (∀ (r : R) (v : augmentationIdeal R M),
      e (algebraMap R (DividedPowerAlgebra R M) r + v) = (r, v)) := sorry

-- The extended ideal `(2)` contributes a positive remainder with its factor `2` retained.
example :
    let z := (2 : DividedPowerAlgebra ℤ ℤ) * (1 + DividedPowerAlgebra.dp ℤ 1 (1 : ℤ))
    augmentation ℤ ℤ z = 2 ∧ z - 2 = 2 * DividedPowerAlgebra.dp ℤ 1 (1 : ℤ) ∧
      z - 2 ∈ (Ideal.span {(2 : ℤ)}).map (algebraMap ℤ (DividedPowerAlgebra ℤ ℤ)) *
        augmentationIdeal ℤ ℤ := sorry

-- Extending the zero ideal gives zero on both sides of the intersection equality.
example :
    let J := (⊥ : Ideal R).map (algebraMap R (DividedPowerAlgebra R M))
    J ⊓ augmentationIdeal R M = ⊥ ∧ J * augmentationIdeal R M = ⊥ := sorry

-- Extending the unit ideal gives the augmentation ideal on both sides.
example :
    let J := (⊤ : Ideal R).map (algebraMap R (DividedPowerAlgebra R M))
    J ⊓ augmentationIdeal R M = augmentationIdeal R M ∧
      J * augmentationIdeal R M = augmentationIdeal R M := sorry

-- The scalar `2` is excluded from the intersection, while its degree-one multiple lies in it.
example :
    let J := (Ideal.span {(2 : ℤ)}).map (algebraMap ℤ (DividedPowerAlgebra ℤ ℤ))
    (2 : DividedPowerAlgebra ℤ ℤ) ∈ J ∧
      (2 : DividedPowerAlgebra ℤ ℤ) ∉ augmentationIdeal ℤ ℤ ∧
      2 * DividedPowerAlgebra.dp ℤ 1 (1 : ℤ) ∈ J ⊓ augmentationIdeal ℤ ℤ ∧
      2 * DividedPowerAlgebra.dp ℤ 1 (1 : ℤ) ∈ J * augmentationIdeal ℤ ℤ := sorry

end Augmentation

-- The characteristic-two detector kills degree one and detects the square-zero degree-two class.
example : ∃ f : DividedPowerAlgebra (ZMod 2) (ZMod 2) →ₐ[ZMod 2]
    TrivSqZeroExt (ZMod 2) (ZMod 2),
    (∀ a : ZMod 2, f (DividedPowerAlgebra.dp (ZMod 2) 1 a) = 0) ∧
    f (DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2)) = TrivSqZeroExt.inr (1 : ZMod 2) ∧
    f (DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2)) ≠ 0 ∧
    f (DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2)) ^ 2 = 0 ∧
    f (DividedPowerAlgebra.dp (ZMod 2) 4 (1 : ZMod 2)) = 0 := sorry

/-- The positive-degree ideal needs more than its degree-one generators in characteristic two. -/
theorem augmentationIdeal_test_degree_one_insufficient :
    DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2) ∉
      Ideal.span (Set.range fun m : ZMod 2 ↦ DividedPowerAlgebra.dp (ZMod 2) 1 m) := by
  exact dp_two_not_mem_span_dp_one

end PD

/-! ## Module K-injective replacement: 0.I.1 -/

/-- Every unbounded complex of modules admits a K-injective replacement (README 0.I.1). -/
theorem moduleKInjectiveReplacement (R : Type u) [Ring R]
    (K : CochainComplex (ModuleCat.{u} R) ℤ) :
    ∃ (L : CochainComplex (ModuleCat.{u} R) ℤ) (i : K ⟶ L),
      L.IsKInjective ∧ QuasiIso i := by
  sorry

/-! ## Flat modules as filtered colimits: 0.2.1 -/

namespace DerivedDeRham

/-- Every flat module is the colimit of a small filtered diagram of finite free modules, with a
colimiting cocone and an identification of its vertex (README 0.2.1; Stacks, Theorem 10.81.4,
Tag 058G). -/
theorem flatModuleFilteredFree (R : Type uFlat) [CommRing R] (M : Type uFlat) [AddCommGroup M]
    [Module R M] [Module.Flat R M] :
    ∃ (J : Type uFlat) (inst : SmallCategory J),
      letI := inst
      ∃ (_ : IsFiltered J) (P : J ⥤ ModuleCat.{uFlat} R) (c : Cocone P),
        Nonempty (IsColimit c) ∧ Nonempty (c.pt ≅ ModuleCat.of R M) ∧
          ∀ j, Module.Free R (P.obj j) ∧ Module.Finite R (P.obj j) := by
  sorry

end DerivedDeRham

/-! ## Non-additive functors: 0.3 -/

-- Algebraic biduality identifies the double-dual functor with the identity in finite rank.
example (n : ℕ) :
    Function.Bijective (Module.Dual.eval (ZMod 2) (Fin n → ZMod 2)) := sorry

-- At countably infinite rank the evaluation map into the algebraic double dual is not onto.
example : ¬ Function.Surjective (Module.Dual.eval (ZMod 2) (ℕ →₀ ZMod 2)) := sorry

/-! ## Towers, lim and lim¹: 1.T.1 -/

/-! `ModuleTower` provides the native module-tower interface of §§1.T.1/1.1 for
singular-cochain and relative-chain applications. `CompactCoefficients.Tower` is its
integral-module adapter; its comparisons preserve projections, six-term boundaries and
Milnor maps. The generic module constructions use no topological input. -/

namespace ModuleTower

variable {R : Type uRing} [Ring R]

/-- The product of a native module tower's terms. -/
abbrev Product (F : ℕᵒᵖ ⥤ ModuleCat.{u} R) := ∀ n : ℕ, F.obj (Opposite.op n)

/-- The linear map `1−shift` on the product of a native module tower. -/
def shift (F : ℕᵒᵖ ⥤ ModuleCat.{u} R) : Product F →ₗ[R] Product F := sorry

/-- The shift uses the transition from level `n+1` to level `n`. -/
theorem shift_apply (F : ℕᵒᵖ ⥤ ModuleCat.{u} R) (x : Product F) (n : ℕ) :
    shift F x n = x n - F.map (homOfLE (Nat.le_succ n)).op (x (n + 1)) := sorry

/-- The module of compatible families, with its canonical projections. -/
def lim (F : ℕᵒᵖ ⥤ ModuleCat.{u} R) : Submodule R (Product F) := (shift F).ker

/-- The first derived limit of a countable module tower. -/
abbrev limOne (F : ℕᵒᵖ ⥤ ModuleCat.{u} R) := Product F ⧸ (shift F).range

/-- A natural transformation acts levelwise on the tower products. -/
def productMap {F G : ℕᵒᵖ ⥤ ModuleCat.{u} R} (f : F ⟶ G) :
    Product F →ₗ[R] Product G := sorry

/-- The product map evaluates by the indicated component of the natural transformation. -/
theorem productMap_apply {F G : ℕᵒᵖ ⥤ ModuleCat.{u} R} (f : F ⟶ G)
    (x : Product F) (n : ℕ) : productMap f x n = f.app (Opposite.op n) (x n) := sorry

/-- Product maps commute with `1−shift`, inducing maps on its kernel and cokernel. -/
theorem shift_natural {F G : ℕᵒᵖ ⥤ ModuleCat.{u} R} (f : F ⟶ G) :
    (shift G).comp (productMap f) = (productMap f).comp (shift F) := sorry

/-- The induced linear map on limits. -/
def limMap {F G : ℕᵒᵖ ⥤ ModuleCat.{u} R} (f : F ⟶ G) : lim F →ₗ[R] lim G := sorry

/-- The induced linear map on first derived limits. -/
def limOneMap {F G : ℕᵒᵖ ⥤ ModuleCat.{u} R} (f : F ⟶ G) :
    limOne F →ₗ[R] limOne G := sorry

end ModuleTower

namespace CompactCoefficients

/-- The abelian-group presentation of an `ℕ`-indexed integral-module tower
`⋯ → A₂ → A₁ → A₀`, compared with the native interface by `toModuleFunctor`. -/
structure Tower where
  /-- The terms. -/
  obj : ℕ → Type u
  [inst : ∀ n, AddCommGroup (obj n)]
  /-- The transition maps `A_{n+1} → A_n`. -/
  map : ∀ n, obj (n + 1) →+ obj n

attribute [instance] Tower.inst

namespace Tower

variable (A : Tower.{u})

/-- The composite transition `A_{n+k} → A_n`. -/
def mapIter : ∀ (n k : ℕ), A.obj (n + k) →+ A.obj n
  | _, 0 => AddMonoidHom.id _
  | n, k + 1 => (mapIter n k).comp (A.map (n + k))

/-- The shift map `∏ A_n → ∏ A_n`, `(a_n) ↦ (a_n - φ_n(a_{n+1}))`. -/
def shift : (∀ n, A.obj n) →+ (∀ n, A.obj n) where
  toFun a n := a n - A.map n (a (n + 1))
  map_zero' := by ext n; simp
  map_add' a b := by ext n; simp only [Pi.add_apply, map_add]; abel

/-- `lim A`: the kernel of the shift, the compatible families. -/
def lim : AddSubgroup (∀ n, A.obj n) := A.shift.ker

/-- `lim¹ A`: the cokernel of the shift. For an `ℕ`-indexed tower this is `R¹lim`, and
`Rⁱlim = 0` for `i ≥ 2` (Stacks, Tag 07KW). -/
abbrev limOne : Type u := (∀ n, A.obj n) ⧸ A.shift.range

/-- The tower as a functor `ℕᵒᵖ ⥤ AddCommGrpCat`. -/
def toFunctor : ℕᵒᵖ ⥤ AddCommGrpCat.{u} :=
  Functor.ofOpSequence (X := fun n => AddCommGrpCat.of (A.obj n))
    (fun n => AddCommGrpCat.ofHom (A.map n))

/-- The abelian-group presentation as a native tower of integral modules. -/
def toModuleFunctor : ℕᵒᵖ ⥤ ModuleCat.{u} ℤ :=
  Functor.ofOpSequence (X := fun n => ModuleCat.of ℤ (A.obj n))
    (fun n => ModuleCat.ofHom (A.map n).toIntLinearMap)

/-- The abelian-group limit is the integral-module limit, naturally with its projections. -/
def limComparison : A.lim ≃+ ModuleTower.lim A.toModuleFunctor := sorry

/-- The abelian-group first derived limit agrees with the native integral-module cokernel. -/
def limOneComparison : A.limOne ≃+ ModuleTower.limOne A.toModuleFunctor := sorry

/-- The Mittag-Leffler condition: Mathlib's condition on the underlying functor to types. -/
abbrev IsMittagLeffler : Prop :=
  (A.toFunctor ⋙ CategoryTheory.forget AddCommGrpCat).IsMittagLeffler

theorem mem_lim (a : ∀ n, A.obj n) : a ∈ A.lim ↔ ∀ n, A.map n (a (n + 1)) = a n := by
  simp only [lim, AddMonoidHom.mem_ker, shift, AddMonoidHom.coe_mk, ZeroHom.coe_mk]
  constructor
  · intro h n
    have := congrFun h n
    simp only [Pi.zero_apply] at this
    exact (sub_eq_zero.mp this).symm
  · intro h
    ext n
    simp [h n]

/-- The images of the iterated transitions stabilise. -/
theorem isMittagLeffler_iff_ranges : A.IsMittagLeffler ↔
    ∀ n, ∃ m, ∀ k ≥ m, (A.mapIter n k).range = (A.mapIter n m).range := sorry

theorem isMittagLeffler_of_surjective (h : ∀ n, Function.Surjective (A.map n)) :
    A.IsMittagLeffler := sorry

theorem isMittagLeffler_of_finite [∀ n, Finite (A.obj n)] : A.IsMittagLeffler := sorry

theorem limOne_subsingleton_of_surjective (h : ∀ n, Function.Surjective (A.map n)) :
    Subsingleton A.limOne := sorry

/-- **Mittag-Leffler towers have vanishing `lim¹`** (Stacks, Lemma 15.88.1, Tag 07KW). -/
theorem limOne_subsingleton_of_isMittagLeffler (h : A.IsMittagLeffler) :
    Subsingleton A.limOne := sorry

/-- A morphism of towers: levelwise homomorphisms commuting with the transitions. -/
structure Hom (A B : Tower.{u}) where
  /-- The levelwise maps. -/
  app : ∀ n, A.obj n →+ B.obj n
  comm : ∀ n, (app n).comp (A.map n) = (B.map n).comp (app (n + 1))

variable {A} {B : Tower.{u}}

/-- The identity morphism of a tower. -/
def Hom.id (A : Tower.{u}) : Hom A A where
  app _ := AddMonoidHom.id _
  comm _ := rfl

/-- Composition of tower morphisms, in the order `g ∘ f`. -/
def Hom.comp {C : Tower.{u}} (g : Hom B C) (f : Hom A B) : Hom A C where
  app n := (g.app n).comp (f.app n)
  comm n := by
    ext x
    exact (congrArg (g.app n) (DFunLike.congr_fun (f.comm n) x)).trans
      (DFunLike.congr_fun (g.comm n) (f.app (n + 1) x))

/-- The zero morphism between two towers. -/
def Hom.zero (A B : Tower.{u}) : Hom A B where
  app _ := 0
  comm _ := by ext; simp

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

/-- The identity tower morphism acts identically on the product. -/
theorem Hom.onProduct_id (A : Tower.{u}) :
    (Hom.id A).onProduct = AddMonoidHom.id (∀ n, A.obj n) := rfl

/-- Product maps respect composition of tower morphisms. -/
theorem Hom.onProduct_comp {C : Tower.{u}} (g : Hom B C) (f : Hom A B) :
    (g.comp f).onProduct = g.onProduct.comp f.onProduct := rfl

/-- The zero tower morphism induces the zero map on products. -/
theorem Hom.onProduct_zero (A B : Tower.{u}) : (Hom.zero A B).onProduct = 0 := rfl

/-- The identity tower morphism acts identically on `lim¹`. -/
theorem Hom.limOneMap_id (A : Tower.{u}) :
    (Hom.id A).limOneMap = AddMonoidHom.id A.limOne := sorry

/-- The induced maps on `lim¹` respect composition. -/
theorem Hom.limOneMap_comp {C : Tower.{u}} (g : Hom B C) (f : Hom A B) :
    (g.comp f).limOneMap = g.limOneMap.comp f.limOneMap := sorry

/-- The zero tower morphism induces the zero map on `lim¹`. -/
theorem Hom.limOneMap_zero (A B : Tower.{u}) : (Hom.zero A B).limOneMap = 0 := sorry

/-- **The six-term sequence of `lim` and `lim¹`**: for a levelwise short exact sequence of
towers `0 → A → B → C → 0`, the maps `lim¹ A → lim¹ B → lim¹ C → 0` are exact (the left half of
the sequence, `0 → lim A → lim B → lim C → lim¹ A`, is the companion statement). -/
theorem limOne_exact {C : Tower.{u}} (f : Hom A B) (g : Hom B C)
    (hexact : ∀ n, Function.Exact (f.app n) (g.app n))
    (hinj : ∀ n, Function.Injective (f.app n)) (hsurj : ∀ n, Function.Surjective (g.app n)) :
    Function.Exact f.limOneMap g.limOneMap ∧ Function.Surjective g.limOneMap := sorry

end Tower

/-- The constant tower with identity transitions. -/
def constantTower (A : Type u) [AddCommGroup A] : Tower.{u} where
  obj _ := A
  map _ := AddMonoidHom.id A

/-- Check `lim_constant`: evaluation at level zero identifies the limit with `A`, with
inverse the diagonal family. -/
example (A : Type u) [AddCommGroup A] :
    ∃ e : (constantTower A).lim ≃+ A,
      (∀ x, e x = x.1 0) ∧ (∀ a n, (e.symm a).1 n = a) := sorry

/-- Check `lim_constant`: the constant identity tower has vanishing `lim¹`. -/
example (A : Type u) [AddCommGroup A] : Subsingleton (constantTower A).limOne := sorry

/-- The reduction tower `ℤ/p^{n+1} → ℤ/p^n`. -/
def reductionTower (p : ℕ) : Tower.{0} where
  obj n := ZMod (p ^ n)
  map n := (ZMod.castHom (pow_dvd_pow p (Nat.le_succ n)) (ZMod (p ^ n))).toAddMonoidHom

/-- Check `limOne_surjective_tower`: reduction modulo `pⁿ` identifies the limit with `ℤ_p`. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ e : (reductionTower p).lim ≃+ ℤ_[p],
      ∀ x n, PadicInt.toZModPow n (e x) = x.1 n := sorry

/-- Check `limOne_surjective_tower`: reduction transitions give vanishing `lim¹`. -/
example (p : ℕ) (hp : p.Prime) : Subsingleton (reductionTower p).limOne := sorry

/-- Check `ml_finite`: identity transitions have full stable image. -/
example : (constantTower (ZMod 2)).IsMittagLeffler := sorry

/-- Check `ml_surjective`: zero transitions have zero stable image. -/
example : (show Tower from
    { obj := fun _ => ZMod 2, map := fun _ => (0 : ZMod 2 →+ ZMod 2) }).IsMittagLeffler := sorry

/-- The tower `⋯ → ℤ → ℤ` with every transition multiplication by `p`. -/
def mulTower (p : ℕ) : Tower.{0} where
  obj _ := ℤ
  map _ := (p : ℤ) • AddMonoidHom.id ℤ

/-- Check `ml_mul_p_fails`: the tower `ℤ ←p ℤ ←p ⋯` is not Mittag-Leffler, since the images `pᵏℤ`
never stabilise. -/
example (p : ℕ) (hp : p.Prime) : ¬ (mulTower p).IsMittagLeffler := sorry

/-- Check `limOne_mul_p`: a compatible integer family is divisible by every power of `p`. -/
example (p : ℕ) (hp : p.Prime) : (mulTower p).lim = ⊥ := sorry

/-- Check `limOne_mul_p`: summing `pⁿ a_n` identifies the cokernel with `ℤ_p/ℤ`. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ e : (mulTower p).limOne ≃+ (ℤ_[p] ⧸ (Int.castAddHom ℤ_[p]).range),
      ∀ a : ℕ → ℤ, e (QuotientAddGroup.mk a) =
        QuotientAddGroup.mk (∑' n : ℕ, (p : ℤ_[p]) ^ n * (a n : ℤ_[p])) := sorry

/-- Check `limOne_mul_p`: the cokernel is nonzero. -/
example (p : ℕ) (hp : p.Prime) : Nontrivial (mulTower p).limOne := sorry

-- Multiplication by `p` on `ℤ_p` models the inclusions `pⁿℤ_p`: vanishing `lim¹` need not imply ML.
example (p : ℕ) [Fact p.Prime] :
    let A : Tower.{0} := {
      obj := fun _ => ℤ_[p]
      map := fun _ => p • AddMonoidHom.id ℤ_[p] }
    ¬ A.IsMittagLeffler ∧ Subsingleton A.limOne := sorry

-- The identity fixes a nonzero class of `lim¹(ℤ ←3 ℤ ←3 ⋯)`.
example : ∃ c : (mulTower 3).limOne,
    c ≠ 0 ∧ (Tower.Hom.id (mulTower 3)).limOneMap c = c := sorry

-- The zero endomorphism kills every class of the same nonzero group.
example : (Tower.Hom.zero (mulTower 3) (mulTower 3)).limOneMap = 0 := sorry

-- Multiplication by two kills the nonzero class represented by a 3-adic half.
example : ∃ f : Tower.Hom (mulTower 3) (mulTower 3),
    (∀ n, f.app n = (2 : ℕ) • AddMonoidHom.id ℤ) ∧
    ∃ e : (mulTower 3).limOne ≃+ (ℤ_[3] ⧸ (Int.castAddHom ℤ_[3]).range),
      (∀ a : ℕ → ℤ, e (QuotientAddGroup.mk a) =
        QuotientAddGroup.mk (∑' n : ℕ, (3 : ℤ_[3]) ^ n * (a n : ℤ_[3]))) ∧
      ∃ (c : (mulTower 3).limOne) (a : ℤ_[3]),
        2 * a = 1 ∧ e c = QuotientAddGroup.mk a ∧ c ≠ 0 ∧ f.limOneMap c = 0 := sorry

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

/-! ## Simplicial module comparisons: 0.2.2 -/

open scoped MonoidalCategory

/-- The alternating-face complex, reindexed from degree `n` to cochain degree `−n`. -/
abbrev simplicialCochains (R : Type u) [CommRing R] :
    SimplicialObject (ModuleCat.{u} R) ⥤ CochainComplex (ModuleCat.{u} R) ℤ :=
  AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R) ⋙
    ComplexShape.embeddingDownNat.extendFunctor (ModuleCat R)

/-- Shuffle and Alexander–Whitney give inverse homotopy equivalences for simplicial modules
(Stacks 08QD; Dold–Puppe, Theorems 2.9, 2.15). Tensor on complexes uses direct-sum totalization. -/
def simplicialTensorComparison (R : Type u) [CommRing R]
    (X Y : SimplicialObject (ModuleCat.{u} R)) :
    HomotopyEquiv
      ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).obj X ⊗
        (AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).obj Y)
      ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).obj (X ⊗ Y)) := sorry

/-- The shuffle comparison commutes with maps in both simplicial module variables. -/
theorem simplicialTensorComparison_natural (R : Type u) [CommRing R]
    {X Y X' Y' : SimplicialObject (ModuleCat.{u} R)} (f : X ⟶ X') (g : Y ⟶ Y') :
    (simplicialTensorComparison R X Y).hom ≫
        (AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).map (f ⊗ₘ g) =
      ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).map f ⊗ₘ
        (AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).map g) ≫
        (simplicialTensorComparison R X' Y').hom := sorry

/-- The unbounded module derived tensor bifunctor of README 0.2. -/
def derivedTensor (R : Type u) [CommRing R] : D R ⥤ D R ⥤ D R := sorry

/-- A bounded-above flat model computes the shared unbounded derived tensor. In particular this
identifies Khovanov K5's bounded-projective model through its augmentation comparisons. -/
def derivedTensor_flatModel (R : Type u) [CommRing R]
    (P L : CochainComplex (ModuleCat.{u} R) ℤ) (b : ℤ)
    (hP : ∀ i, Module.Flat R (P.X i) ∧ (b < i → IsZero (P.X i))) :
    ((derivedTensor R).obj ((DerivedCategory.Q (C := ModuleCat R)).obj P)).obj
        ((DerivedCategory.Q (C := ModuleCat R)).obj L) ≅
      (DerivedCategory.Q (C := ModuleCat R)).obj (P ⊗ L) := sorry

/-- For degreewise-flat simplicial modules the shuffle identifies realization of their
levelwise tensor with the derived tensor of their cochain realizations. -/
def simplicialTensorDerived (R : Type u) [CommRing R]
    (X Y : SimplicialObject (ModuleCat.{u} R))
    (hX : ∀ n : SimplexCategoryᵒᵖ, Module.Flat R (X.obj n))
    (hY : ∀ n : SimplexCategoryᵒᵖ, Module.Flat R (Y.obj n)) :
    ((derivedTensor R).obj
      ((DerivedCategory.Q (C := ModuleCat R)).obj ((simplicialCochains R).obj X))).obj
      ((DerivedCategory.Q (C := ModuleCat R)).obj ((simplicialCochains R).obj Y)) ≅
      (DerivedCategory.Q (C := ModuleCat R)).obj ((simplicialCochains R).obj (X ⊗ Y)) := sorry

/-- The diagonal of a bisimplicial module applies the same simplicial operator in both directions. -/
def bisimplicialDiagonal (R : Type u) [CommRing R]
    (Z : SimplicialObject (SimplicialObject (ModuleCat.{u} R))) :
    SimplicialObject (ModuleCat.{u} R) := sorry

/-- The direct-sum total of the two alternating-face complexes, with differential
`d_h + (−1)^p d_v` on horizontal degree `p`. -/
abbrev bisimplicialTotal (R : Type u) [CommRing R]
    (Z : SimplicialObject (SimplicialObject (ModuleCat.{u} R))) :
    ChainComplex (ModuleCat.{u} R) ℕ :=
  HomologicalComplex₂.total
    (((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).mapHomologicalComplex
      (ComplexShape.down ℕ)).obj
      ((AlgebraicTopology.alternatingFaceMapComplex
        (SimplicialObject (ModuleCat R))).obj Z)) (ComplexShape.down ℕ)

/-- Bisimplicial module total and diagonal complexes are naturally homotopy equivalent,
without flatness hypotheses (Dold–Puppe, Theorems 2.9, 2.15). -/
def bisimplicialDiagonalComparison (R : Type u) [CommRing R]
    (Z : SimplicialObject (SimplicialObject (ModuleCat.{u} R))) :
    HomotopyEquiv (bisimplicialTotal R Z)
      ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat R)).obj
        (bisimplicialDiagonal R Z)) := sorry

/-! ## Perfect complexes and compatible finite models: 1.E.0 -/

/-- Derived scalar extension along a homomorphism of commutative rings. -/
def derivedBaseChange {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) :
    D R ⥤ D S := sorry

/-- Exact restriction of scalars on module derived categories. -/
def derivedRestriction {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) :
    D S ⥤ D R := sorry

/-- Derived extension and restriction of scalars are adjoint. -/
def derivedBaseChangeAdjunction {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) :
    derivedBaseChange f ⊣ derivedRestriction f := sorry

/-- Ordinary scalar extension applied to every term and differential of a complex. -/
abbrev complexBaseChange {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) :
    CochainComplex (ModuleCat.{u} R) ℤ ⥤ CochainComplex (ModuleCat.{u} S) ℤ :=
  (ModuleCat.extendScalars f).mapHomologicalComplex (ComplexShape.up ℤ)

/-- A finite-free complex with a specified upper bound, allowing an infinite left tail. -/
def IsFiniteFreeModel (R : Type u) [Ring R]
    (P : CochainComplex (ModuleCat.{u} R) ℤ) (b : ℤ) : Prop :=
  ∀ i, Module.Free R (P.X i) ∧ Module.Finite R (P.X i) ∧ (b < i → IsZero (P.X i))

/-- Perfection over a unital ring means a bounded finite-projective left-module representative
(README 1.E.0; Stacks 0657 for commutative rings). -/
def IsPerfect (R : Type u) [Ring R] (K : D R) : Prop :=
  ∃ (P : CochainComplex (ModuleCat.{u} R) ℤ) (a b : ℤ),
    (∀ i, Module.Projective R (P.X i) ∧ Module.Finite R (P.X i) ∧
      (i < a ∨ b < i → IsZero (P.X i))) ∧
    Nonempty ((DerivedCategory.Q (C := ModuleCat R)).obj P ≅ K)

/-- An isomorphism preserves and reflects perfection over a unital ring. -/
theorem isPerfect_iso (R : Type u) [Ring R] {K L : D R} (e : K ≅ L) :
    IsPerfect R K ↔ IsPerfect R L := sorry

/-- A retract of a perfect derived left-module object is perfect. -/
theorem isPerfect_retract (R : Type u) [Ring R] {K L : D R}
    (i : K ⟶ L) (r : L ⟶ K) (h : i ≫ r = 𝟙 K) (hL : IsPerfect R L) :
    IsPerfect R K := sorry

/-- Pseudo-coherence over a ring means a bounded-above finite-free representative. -/
def IsPseudoCoherent (R : Type u) [Ring R] (K : D R) : Prop :=
  ∃ (P : CochainComplex (ModuleCat.{u} R) ℤ) (b : ℤ), IsFiniteFreeModel R P b ∧
    Nonempty ((DerivedCategory.Q (C := ModuleCat R)).obj P ≅ K)

/-- A Tor interval controls tensor with every discrete module, without requiring its flatness. -/
def HasTorAmplitude (R : Type u) [CommRing R] (a b : ℤ) (K : D R) : Prop :=
  ∀ (N : ModuleCat.{u} R) (i : ℤ), i < a ∨ b < i →
    IsZero (H R i (((derivedTensor R).obj K).obj (mod0 R N)))

/-- Perfect complexes are closed under cohomological shifts. -/
theorem isPerfect_shift (R : Type u) [Ring R] (K : D R) (hK : IsPerfect R K) (n : ℤ) :
    IsPerfect R (K⟦n⟧) := sorry

/-- The third vertex of a distinguished triangle of perfect complexes is perfect. -/
theorem isPerfect_triangle (R : Type u) [Ring R] (T : Triangle (D R))
    (hT : T ∈ distTriang (D R)) (h₁ : IsPerfect R T.obj₁) (h₂ : IsPerfect R T.obj₂) :
    IsPerfect R T.obj₃ := sorry

/-- Arbitrary derived scalar extension preserves perfection. -/
theorem isPerfect_baseChange {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S)
    (K : D R) (hK : IsPerfect R K) : IsPerfect S ((derivedBaseChange f).obj K) := sorry

/-- Every perfect complex has a uniform finite Tor interval. -/
theorem isPerfect_finiteTorAmplitude (R : Type u) [CommRing R] (K : D R)
    (hK : IsPerfect R K) : ∃ a b : ℤ, HasTorAmplitude R a b K := sorry

/-- Perfect complexes admit bounded-above finite-free representatives. -/
theorem isPerfect_isPseudoCoherent (R : Type u) [Ring R] (K : D R)
    (hK : IsPerfect R K) : IsPseudoCoherent R K := sorry

/-- Termwise scalar extension of a bounded-above finite-free model computes derived extension. -/
def finiteFreeBaseChangeModel {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S)
    (P : CochainComplex (ModuleCat.{u} R) ℤ) (b : ℤ) (hP : IsFiniteFreeModel R P b) :
    (derivedBaseChange f).obj ((DerivedCategory.Q (C := ModuleCat R)).obj P) ≅
      (DerivedCategory.Q (C := ModuleCat S)).obj ((complexBaseChange f).obj P) := sorry

/-- Perfect input lifts a specified bounded-above finite-free reduction model, including its
specified derived identification, across a surjection with locally nilpotent kernel (0BCB). -/
theorem finiteFreeModelLift {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S)
    (hf : Function.Surjective f) (hnil : ∀ x, f x = 0 → IsNilpotent x)
    (K : D R) (hK : IsPerfect R K) (E : CochainComplex (ModuleCat.{u} S) ℤ)
    (b : ℤ) (hE : IsFiniteFreeModel S E b)
    (e : (derivedBaseChange f).obj K ≅ (DerivedCategory.Q (C := ModuleCat S)).obj E) :
    ∃ (P : CochainComplex (ModuleCat.{u} R) ℤ) (hP : IsFiniteFreeModel R P b)
      (eP : (DerivedCategory.Q (C := ModuleCat R)).obj P ≅ K)
      (r : (complexBaseChange f).obj P ≅ E),
      (finiteFreeBaseChangeModel f P b hP).hom ≫
          (DerivedCategory.Q (C := ModuleCat S)).map r.hom =
        (derivedBaseChange f).map eP.hom ≫ e.hom := sorry

/-- Perfect objects over a ring tower, with the specified derived reduction isomorphisms. -/
structure PerfectSystem (A : ℕ → Type u) [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) where
  term : ∀ n, D (A n)
  perfect : ∀ n, IsPerfect (A n) (term n)
  reduction : ∀ n, (derivedBaseChange (τ n)).obj (term (n + 1)) ≅ term n

/-- The transition map of a perfect system is the adjoint of its specified reduction. -/
def PerfectSystem.transition {A : ℕ → Type u} [∀ n, CommRing (A n)]
    {τ : ∀ n, A (n + 1) →+* A n} (M : PerfectSystem A τ) (n : ℕ) :
    M.term (n + 1) ⟶ (derivedRestriction (τ n)).obj (M.term n) :=
  (derivedBaseChangeAdjunction (τ n)).homEquiv _ _ (M.reduction n).hom

/-- Compatible finite-free models retain the specified reductions, hence their adjoint transitions. -/
structure FiniteFreeSystemModel {A : ℕ → Type u} [∀ n, CommRing (A n)]
    {τ : ∀ n, A (n + 1) →+* A n} (M : PerfectSystem A τ) where
  complex : ∀ n, CochainComplex (ModuleCat.{u} (A n)) ℤ
  bound : ℤ
  finiteFree : ∀ n, IsFiniteFreeModel (A n) (complex n) bound
  comparison : ∀ n, (DerivedCategory.Q (C := ModuleCat (A n))).obj (complex n) ≅ M.term n
  reduction : ∀ n, (complexBaseChange (τ n)).obj (complex (n + 1)) ≅ complex n
  reduction_comm : ∀ n,
    (finiteFreeBaseChangeModel (τ n) (complex (n + 1)) bound (finiteFree (n + 1))).hom ≫
        (DerivedCategory.Q (C := ModuleCat (A n))).map (reduction n).hom ≫ (comparison n).hom =
      (derivedBaseChange (τ n)).map (comparison (n + 1)).hom ≫ (M.reduction n).hom

/-- Surjective transitions with locally nilpotent kernels admit compatible bounded-above
finite-free models for every perfect system (all-perfect case of 0CQF). -/
theorem compatibleFiniteFreeModels {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (hsurj : ∀ n, Function.Surjective (τ n))
    (hnil : ∀ n x, τ n x = 0 → IsNilpotent x) (M : PerfectSystem A τ) :
    Nonempty (FiniteFreeSystemModel M) := sorry

/-- Compatible ring projections exhibit `R` as the inverse limit of the ring tower. -/
def IsRingTowerLimit {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) : Prop :=
  (∀ n, (τ n).comp (π (n + 1)) = π n) ∧
    ∀ x : ∀ n, A n, (∀ n, τ n (x (n + 1)) = x n) → ∃! r : R, ∀ n, π n r = x n

/-- The standard derived category of strict module towers. -/
local instance (R : Type u) [Ring R] :
    HasDerivedCategory.{u+1} (ℕᵒᵖ ⥤ ModuleCat.{u} R) := HasDerivedCategory.standard _

/-- The shared module derived-limit functor on strict derived towers, with the shifted-cone
comparison, projections and connecting maps of README 1.1. -/
def derivedLimit (R : Type u) [Ring R] :
    DerivedCategory (ℕᵒᵖ ⥤ ModuleCat.{u} R) ⥤ D R := sorry

/-- The product-cone comparison gives derived limit coherent commutation with integer shifts. -/
instance derivedLimit_commShift (R : Type u) [Ring R] :
    (derivedLimit R).CommShift ℤ := sorry

/-- Derived limit preserves distinguished triangles in the derived category of strict towers,
including their global connecting morphisms composed with the shift comparison (Stacks 091D). -/
theorem derivedLimit_triangle (R : Type u) [Ring R]
    (T : Triangle (DerivedCategory (ℕᵒᵖ ⥤ ModuleCat.{u} R)))
    (hT : T ∈ distTriang (DerivedCategory (ℕᵒᵖ ⥤ ModuleCat.{u} R))) :
    (derivedLimit R).mapTriangle.obj T ∈ distTriang (D R) := sorry

/-- The strict tower obtained by restricting the semilinear chain maps adjoint to the model
reductions. Its evaluation comparisons retain `PerfectSystem.transition`. -/
def finiteFreeSystemDiagram {A : ℕ → Type u} [∀ n, CommRing (A n)]
    {τ : ∀ n, A (n + 1) →+* A n} {M : PerfectSystem A τ}
    (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) (hlim : IsRingTowerLimit τ R π)
    (F : FiniteFreeSystemModel M) : DerivedCategory (ℕᵒᵖ ⥤ ModuleCat.{u} R) := sorry

/-- The termwise inverse limit of the compatible finite-free model complexes. -/
def finiteFreeSystemLimit {A : ℕ → Type u} [∀ n, CommRing (A n)]
    {τ : ∀ n, A (n + 1) →+* A n} {M : PerfectSystem A τ}
    (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) (hlim : IsRingTowerLimit τ R π)
    (F : FiniteFreeSystemModel M) : CochainComplex (ModuleCat.{u} R) ℤ := sorry

/-- The termwise limit has finite-free terms and the common upper bound. -/
theorem finiteFreeSystemLimit_model {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (hsurj : ∀ n, Function.Surjective (τ n))
    (hnil : ∀ n x, τ n x = 0 → IsNilpotent x) {M : PerfectSystem A τ}
    (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) (hlim : IsRingTowerLimit τ R π)
    (F : FiniteFreeSystemModel M) :
    IsFiniteFreeModel R (finiteFreeSystemLimit R π hlim F) F.bound := sorry

/-- The termwise limit represents the derived limit of the chosen strict diagram, with
its projections and the fibre triangle of `1−shift` (README 1.E.0). -/
def finiteFreeSystemLimit_comparison {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (hsurj : ∀ n, Function.Surjective (τ n))
    (hnil : ∀ n x, τ n x = 0 → IsNilpotent x) {M : PerfectSystem A τ}
    (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) (hlim : IsRingTowerLimit τ R π)
    (F : FiniteFreeSystemModel M) :
    (DerivedCategory.Q (C := ModuleCat R)).obj (finiteFreeSystemLimit R π hlim F) ≅
      (derivedLimit R).obj (finiteFreeSystemDiagram R π hlim F) := sorry

/-- Reduction of the limit complex recovers each model as a complex, along its quotient projection. -/
def finiteFreeSystemLimit_reduction {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (hsurj : ∀ n, Function.Surjective (τ n))
    (hnil : ∀ n x, τ n x = 0 → IsNilpotent x) {M : PerfectSystem A τ}
    (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) (hlim : IsRingTowerLimit τ R π)
    (F : FiniteFreeSystemModel M) (n : ℕ) :
    (complexBaseChange (π n)).obj (finiteFreeSystemLimit R π hlim F) ≅ F.complex n := sorry

/-- Unit reflection from the first stage puts the limit kernel in the Jacobson radical. -/
theorem ringTowerLimit_jacobson {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (hsurj : ∀ n, Function.Surjective (τ n))
    (hnil : ∀ n x, τ n x = 0 → IsNilpotent x)
    (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) (hlim : IsRingTowerLimit τ R π) :
    ∀ r : R, IsUnit (π 0 r) → IsUnit r := sorry

/-- A uniform residue-field Tor bound on a pseudo-coherent complex gives a finite-projective
representative supported in that interval (Stacks 068V, 0658). -/
theorem pseudoCoherent_residueCriterion (R : Type u) [CommRing R] (K : D R)
    (hK : IsPseudoCoherent R K) (a b : ℤ)
    (hfib : ∀ (k : Type u) [Field k] (f : R →+* k), Function.Surjective f →
      ∀ i : ℤ, i < a ∨ b < i → IsZero (H k i ((derivedBaseChange f).obj K))) :
    ∃ P : CochainComplex (ModuleCat.{u} R) ℤ,
      (∀ i, Module.Projective R (P.X i) ∧ Module.Finite R (P.X i) ∧
        (i < a ∨ b < i → IsZero (P.X i))) ∧
      Nonempty ((DerivedCategory.Q (C := ModuleCat R)).obj P ≅ K) := sorry

/-- The derived limit of every chosen compatible finite-free lift of a perfect system is
perfect and has the specified derived reductions, for locally nilpotent transition kernels (0CQG). -/
theorem perfectInverseSystemEffectivity {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (hsurj : ∀ n, Function.Surjective (τ n))
    (hnil : ∀ n x, τ n x = 0 → IsNilpotent x) (M : PerfectSystem A τ)
    (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) (hlim : IsRingTowerLimit τ R π)
    (F : FiniteFreeSystemModel M) :
    IsPerfect R ((derivedLimit R).obj (finiteFreeSystemDiagram R π hlim F)) ∧
      ∀ n, Nonempty ((derivedBaseChange (π n)).obj
        ((derivedLimit R).obj (finiteFreeSystemDiagram R π hlim F)) ≅ M.term n) := sorry

/-! ## A nontrivial-differential effectivity check: 1.E.1 -/

/-- The two-term complex `[R --x→ R]` in degrees `[-1,0]`, as the cone of multiplication. -/
def multiplicationComplex (R : Type u) [CommRing R] (x : R) :
    CochainComplex (ModuleCat.{u} R) ℤ :=
  CochainComplex.mappingCone
    ((HomologicalComplex.single (ModuleCat R) (ComplexShape.up ℤ) 0).map
      (x • 𝟙 (ModuleCat.of R R)))

/-- The derived reductions of `[k[[t]] --t→ k[[t]]]` have nonzero negative cohomology,
although the limit complex has zero negative cohomology. -/
theorem PerfectLimitChecks.differential (k : Type u) [Field k] (n : ℕ) (hn : 0 < n) :
    let I : Ideal (PowerSeries k) := Ideal.span {(PowerSeries.X : PowerSeries k) ^ n}
    let q := Ideal.Quotient.mk I
    let K := (DerivedCategory.Q (C := ModuleCat (PowerSeries k))).obj
      (multiplicationComplex (PowerSeries k) PowerSeries.X)
    let Kₙ := (DerivedCategory.Q (C := ModuleCat (PowerSeries k ⧸ I))).obj
      (multiplicationComplex (PowerSeries k ⧸ I) (q PowerSeries.X))
    Nonempty ((derivedBaseChange q).obj K ≅ Kₙ) ∧
      IsZero (H (PowerSeries k) (-1) K) ∧ ¬ IsZero (H (PowerSeries k ⧸ I) (-1) Kₙ) := sorry

/-! ## Derived completeness and complete flatness: 1.2, 1.7 -/

/-- **Derived `I`-completeness** of `M ∈ D(A)`: every morphism from a shifted localization
`A[1/f][n]`, `f ∈ I`, to `M` is zero (Stacks, Tags 091P, 091S). This is a homotopical condition, not
classical separatedness. -/
def derivedCompleteness (A : Type u) [CommRing A] (I : Ideal A) (M : D A) : Prop :=
  ∀ f ∈ I, ∀ n : ℤ,
    Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away f)))⟦n⟧ ⟶ M)

/-- Derived completion at a finitely generated ideal, as an endofunctor of module-derived objects. -/
def derivedCompletion (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) : D A ⥤ D A := sorry

/-- The natural universal map from an object to its derived completion. -/
def completionUnit (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    𝟭 (D A) ⟶ derivedCompletion A I hI := sorry

/-- Every derived completion is complete for the given finitely generated ideal. -/
theorem completionComplete (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) (M : D A) :
    derivedCompleteness A I ((derivedCompletion A I hI).obj M) := sorry

/-- If an ordinary diagram of complete objects has a categorical colimit in the ambient derived
category, reflecting that colimit gives its colimit in the complete category, with the unit cocone. -/
theorem completedColimit (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG)
    {J : Type v} [SmallCategory J] (F : J ⥤ ObjectProperty.FullSubcategory (derivedCompleteness A I))
    [HasColimit (F ⋙ ObjectProperty.ι (derivedCompleteness A I))] :
    ∃ c : Cocone F, Nonempty (IsColimit c) ∧
      ∃ e : (ObjectProperty.ι (derivedCompleteness A I)).obj c.pt ≅
          (derivedCompletion A I hI).obj
            (colimit (F ⋙ ObjectProperty.ι (derivedCompleteness A I))),
        ∀ j, (ObjectProperty.ι (derivedCompleteness A I)).map (c.ι.app j) ≫ e.hom =
          colimit.ι (F ⋙ ObjectProperty.ι (derivedCompleteness A I)) j ≫
            (completionUnit A I hI).app
              (colimit (F ⋙ ObjectProperty.ι (derivedCompleteness A I))) := sorry

/-- The condition can be tested on any finite generating set of `I` (Stacks, Lemma 15.93.1). -/
theorem isDerivedCompleteGenerators (A : Type u) [CommRing A] (I : Ideal A) (M : D A)
    (s : Finset A) (hs : Ideal.span (s : Set A) = I) :
    derivedCompleteness A I M ↔ ∀ f ∈ s, ∀ n : ℤ,
      Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away f)))⟦n⟧ ⟶ M) := by
  sorry

/-- Derived completeness depends only on the radical (Stacks, Lemma 15.93.2). -/
theorem isDerivedCompleteRadical (A : Type u) [CommRing A] (I J : Ideal A)
    (hI : I.FG) (hJ : J.FG) (h : I.radical = J.radical) (M : D A) :
    derivedCompleteness A I M ↔ derivedCompleteness A J M := by
  sorry

/-- `M` is derived complete iff every cohomology module is (Stacks, Lemmas 15.93.1–15.93.2, Tags 091P–091Q). -/
theorem isDerivedCompleteCohomology (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) (M : D A) :
    derivedCompleteness A I M ↔ ∀ j : ℤ, derivedCompleteness A I (mod0 A (H A j M)) := by
  sorry

/-- Derived complete objects are closed under shifts and under the third vertex of a distinguished
triangle: the triangulated part of `isDerivedCompleteLimits` (README 1.2), which also asks for
products and derived limits. -/
theorem isDerivedComplete_triangle (A : Type u) [CommRing A] (I : Ideal A)
    (T : Pretriangulated.Triangle (D A)) (hT : T ∈ distTriang (D A))
    (h₁ : derivedCompleteness A I T.obj₁) (h₂ : derivedCompleteness A I T.obj₂) :
    derivedCompleteness A I T.obj₃ ∧ ∀ n : ℤ, derivedCompleteness A I (T.obj₁⟦n⟧) := by
  sorry

-- For `I = 0` every complex is derived complete.
example (A : Type u) [CommRing A] (M : D A) : derivedCompleteness A ⊥ M := by
  sorry

-- With zero ideal every object is complete, but this categorical cokernel does not exist.
example : ¬ HasCokernel ((2 : ℤ) • 𝟙 (mod0 ℤ (ModuleCat.of ℤ ℤ))) := sorry

-- For `I = A` only the zero object is derived complete.
example (A : Type u) [CommRing A] (M : D A) : derivedCompleteness A ⊤ M ↔ IsZero M := by
  sorry

-- `ℤ_p` is derived p-complete over `ℤ`, while `ℚ_p` is not.
-- The map `ℤ[1/p] → ℚ_p` sending `1` to `1` gives a nonzero degree-zero class over `ℤ`.
example (p : ℕ) [Fact p.Prime] :
    derivedCompleteness ℤ (Ideal.span {(p : ℤ)}) (mod0 ℤ (ModuleCat.of ℤ (PadicInt p))) ∧
      ¬ derivedCompleteness ℤ (Ideal.span {(p : ℤ)}) (mod0 ℤ (ModuleCat.of ℤ (Padic p))) := by
  sorry

/-- **Complete flatness of a module.** A module `M` is `I`-completely flat when its derived reduction
`M ⊗^L_A A/I` is a flat `A/I`-module in degree zero: the higher `Tor_n^A(M, A/I)` vanish and
`A/I ⊗_A M` is flat over `A/I`. This is the discrete case of `completeFlatness` (README 1.7); the
predicate does not require `M` to be complete. -/
def IsCompletelyFlatModule (A : Type u) [CommRing A] (I : Ideal A) (M : ModuleCat.{u} A) : Prop :=
  (∀ n : ℕ, 0 < n →
      IsZero (((CategoryTheory.Tor (ModuleCat.{u} A) n).obj M).obj (ModuleCat.of A (A ⧸ I)))) ∧
    Module.Flat (A ⧸ I) ((A ⧸ I) ⊗[A] M)

/-- A flat module is `I`-completely flat (the discrete part of `completeFlatCompletion`). -/
theorem isCompletelyFlatModule_of_flat (A : Type u) [CommRing A] (I : Ideal A) (M : ModuleCat.{u} A)
    [Module.Flat A M] : IsCompletelyFlatModule A I M := by
  sorry

-- `ℤ` is p-completely flat over itself but not derived p-complete.
example (p : ℕ) [Fact p.Prime] :
    IsCompletelyFlatModule ℤ (Ideal.span {(p : ℤ)}) (ModuleCat.of ℤ ℤ) ∧
      ¬ derivedCompleteness ℤ (Ideal.span {(p : ℤ)}) (mod0 ℤ (ModuleCat.of ℤ ℤ)) := by
  sorry

-- `ℤ_p` is p-completely faithfully flat over `ℤ`.
example (p : ℕ) [Fact p.Prime] :
    IsCompletelyFlatModule ℤ (Ideal.span {(p : ℤ)}) (ModuleCat.of ℤ (PadicInt p)) ∧
      Module.FaithfullyFlat (ℤ ⧸ Ideal.span {(p : ℤ)})
        ((ℤ ⧸ Ideal.span {(p : ℤ)}) ⊗[ℤ] PadicInt p) := by
  sorry

-- `F_p` is not p-completely flat over `ℤ`: `Tor₁^ℤ(F_p, F_p) = F_p` is nonzero.
example (p : ℕ) [Fact p.Prime] :
    ¬ IsCompletelyFlatModule ℤ (Ideal.span {(p : ℤ)}) (ModuleCat.of ℤ (ZMod p)) := by
  sorry

/-! ## Simplicial algebra completion: 1.6 -/

/-- Strict simplicial commutative `A`-algebras and their algebra maps. -/
abbrev SimplicialAlgebra (A : Type u) [CommRing A] :=
  SimplicialObject (CommAlgCat.{u} A)

/-- The underlying alternating-face module complex, in nonpositive cochain degrees. -/
def simplicialAlgebraCochains (A : Type u) [CommRing A] :
    SimplicialAlgebra A ⥤ CochainComplex (ModuleCat.{u} A) ℤ :=
  (Functor.whiskeringRight _ _ _).obj
    (forget₂ (CommAlgCat.{u} A) (AlgCat.{u} A) ⋙
      forget₂ (AlgCat.{u} A) (ModuleCat.{u} A)) ⋙ simplicialCochains A

/-- Algebra maps that induce quasi-isomorphisms of underlying module complexes. -/
def simplicialAlgebraWeakEquivalences (A : Type u) [CommRing A] :
    MorphismProperty (SimplicialAlgebra A) :=
  fun _ _ f => QuasiIso ((simplicialAlgebraCochains A).map f)

/-- The category `H_A` obtained by inverting underlying-module weak equivalences. -/
abbrev SimplicialAlgebraHomotopy (A : Type u) [CommRing A] :=
  (simplicialAlgebraWeakEquivalences A).Localization

/-- Localization of strict simplicial algebras at underlying-module quasi-isomorphisms. -/
abbrev simplicialAlgebraLocalization (A : Type u) [CommRing A] :
    SimplicialAlgebra A ⥤ SimplicialAlgebraHomotopy A :=
  (simplicialAlgebraWeakEquivalences A).Q

/-- The underlying derived module of a localized simplicial algebra. -/
def simplicialAlgebraUnderlying (A : Type u) [CommRing A] :
    SimplicialAlgebraHomotopy A ⥤ D A := sorry

/-- The descended underlying-module functor agrees naturally with the strict module complex. -/
def simplicialAlgebraUnderlyingComparison (A : Type u) [CommRing A] :
    simplicialAlgebraLocalization A ⋙ simplicialAlgebraUnderlying A ≅
      simplicialAlgebraCochains A ⋙ DerivedCategory.Q (C := ModuleCat A) := sorry

/-- Underlying derived modules of localized simplicial algebras have no positive cohomology. -/
theorem simplicialAlgebra_connective (A : Type u) [CommRing A]
    (B : SimplicialAlgebraHomotopy A) (i : ℤ) (hi : 0 < i) :
    IsZero (H A i ((simplicialAlgebraUnderlying A).obj B)) := sorry

/-- The strict levelwise-limit model of the finite-ideal simplicial Koszul quotient tower. -/
def simplicialRingCompletionModel (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    SimplicialAlgebra A ⥤ SimplicialAlgebra A := sorry

/-- The strict simplicial algebra map into the chosen completion model, natural in its input. -/
def ringCompletionModelUnit (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    𝟭 (SimplicialAlgebra A) ⟶ simplicialRingCompletionModel A I hI := sorry

/-- Strict completion models preserve underlying-module weak equivalences. -/
theorem ringCompletionModel_weakEquivalences (A : Type u) [CommRing A]
    (I : Ideal A) (hI : I.FG) {B C : SimplicialAlgebra A} (f : B ⟶ C)
    (hf : simplicialAlgebraWeakEquivalences A f) :
    simplicialAlgebraWeakEquivalences A ((simplicialRingCompletionModel A I hI).map f) := sorry

/-- Derived finite-ideal completion as an endofunctor of the localized algebra category `H_A`. -/
def simplicialRingCompletion (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    SimplicialAlgebraHomotopy A ⥤ SimplicialAlgebraHomotopy A := sorry

/-- Localized strict models agree naturally with the descended algebra completion. -/
def ringCompletionDescent (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    simplicialRingCompletionModel A I hI ⋙ simplicialAlgebraLocalization A ≅
      simplicialAlgebraLocalization A ⋙ simplicialRingCompletion A I hI := sorry

/-- The natural algebra completion unit in `H_A`. -/
def ringCompletionUnit (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    𝟭 (SimplicialAlgebraHomotopy A) ⟶ simplicialRingCompletion A I hI := sorry

/-- The descent comparison carries the localized strict unit to the algebra completion unit. -/
theorem ringCompletionDescent_unit (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG)
    (B : SimplicialAlgebra A) :
    (simplicialAlgebraLocalization A).map ((ringCompletionModelUnit A I hI).app B) ≫
        (ringCompletionDescent A I hI).hom.app B =
      (ringCompletionUnit A I hI).app ((simplicialAlgebraLocalization A).obj B) := sorry

/-- Underlying derived modules of algebra completions are naturally module completions. -/
def ringCompletionUnderlying (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    simplicialRingCompletion A I hI ⋙ simplicialAlgebraUnderlying A ≅
      simplicialAlgebraUnderlying A ⋙ derivedCompletion A I hI := sorry

/-- The underlying-module comparison identifies the algebra and module completion units. -/
theorem ringCompletionUnderlying_unit (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG)
    (B : SimplicialAlgebraHomotopy A) :
    (simplicialAlgebraUnderlying A).map ((ringCompletionUnit A I hI).app B) ≫
        (ringCompletionUnderlying A I hI).hom.app B =
      (completionUnit A I hI).app ((simplicialAlgebraUnderlying A).obj B) := sorry

/-- Algebra completion maps commute with the unit for every morphism in `H_A`. -/
theorem ringCompletionMap (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG)
    {B C : SimplicialAlgebraHomotopy A} (f : B ⟶ C) :
    f ≫ (ringCompletionUnit A I hI).app C =
      (ringCompletionUnit A I hI).app B ≫ (simplicialRingCompletion A I hI).map f := sorry

/-- Algebra completions are complete for the underlying derived-module notion. -/
theorem ringCompletionComplete (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG)
    (B : SimplicialAlgebraHomotopy A) :
    derivedCompleteness A I ((simplicialAlgebraUnderlying A).obj
      ((simplicialRingCompletion A I hI).obj B)) := sorry

/-- Algebra maps from the completion to a complete algebra correspond to maps from the input. -/
def ringCompletionAdjunction (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG)
    (B C : SimplicialAlgebraHomotopy A)
    (hC : derivedCompleteness A I ((simplicialAlgebraUnderlying A).obj C)) :
    ((simplicialRingCompletion A I hI).obj B ⟶ C) ≃ (B ⟶ C) := sorry

/-- The algebra adjunction bijection is precomposition with the completion unit. -/
theorem ringCompletionAdjunction_apply (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG)
    (B C : SimplicialAlgebraHomotopy A)
    (hC : derivedCompleteness A I ((simplicialAlgebraUnderlying A).obj C))
    (g : (simplicialRingCompletion A I hI).obj B ⟶ C) :
    ringCompletionAdjunction A I hI B C hC g = (ringCompletionUnit A I hI).app B ≫ g := sorry

/-- The completion unit of a complete algebra is an isomorphism in `H_A`. -/
theorem ringCompletionIdempotent (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG)
    (C : SimplicialAlgebraHomotopy A)
    (hC : derivedCompleteness A I ((simplicialAlgebraUnderlying A).obj C)) :
    IsIso ((ringCompletionUnit A I hI).app C) := sorry

end DerivedDeRham

namespace PerfectComplex

/-- The shared ordinary-module perfectness predicate, also used by arithmetic and trace consumers. -/
abbrev IsPerfect (R : Type u) [Ring R] (K : DerivedDeRham.D R) : Prop :=
  DerivedDeRham.IsPerfect R K

end PerfectComplex

/-! ## The degree-zero edge boundary: S.1 -/

-- For the double complex supported at `(0,0)` with value `ℤ`, both degree-zero edges are identities.
example : ¬ Function.Exact (AddMonoidHom.id ℤ) (AddMonoidHom.id ℤ) := sorry

/-!
## API of the full constructions

The README specifies the following constructions and laws. Their general signatures require the
cotangent model, derived powers, tensor and Hom, completion reflector, Matlis equivalences or spectral
sequence abutment to have been constructed. This catalogue identifies the contracts without assuming
private stand-in carriers. All hypotheses and computation Checks are in the indicated sections.

0.DP.1:
PolynomialLaw.IsHomogeneousOfDegree, PolynomialLaw.IsMultiplicative.

0.DP.3:
Crystalline.Augmentation.augmentation_eq_lift, Crystalline.Augmentation.augmentation_dp,
Crystalline.Augmentation.augmentation_scalar, Crystalline.Augmentation.augmentation_natural,
Crystalline.Augmentation.augmentation_unique, Crystalline.Augmentation.augmentation_map,
Crystalline.Augmentation.augmentationIdeal_eq_ker, Crystalline.Augmentation.mem_augmentationIdeal,
Crystalline.Augmentation.dp_mem_augmentationIdeal,
Crystalline.Augmentation.scalar_mem_augmentationIdeal,
Crystalline.Augmentation.map_mem_augmentationIdeal,
Crystalline.Augmentation.augmentationSplitting_fst,
Crystalline.Augmentation.augmentationSplitting_snd,
Crystalline.Augmentation.augmentationSplitting_symm.

0.K.1:
koszulComplex, koszulComplex.map.

0.I.1:
moduleKInjectiveReplacement.

0.1:
Algebra.CotangentComplex.PolynomialResolution, Algebra.CotangentComplex.standardResolution,
Algebra.CotangentComplex.PolynomialResolution.comparison,
Algebra.CotangentComplex.PolynomialResolution.toQuasiIso.
PolynomialResolution.comparison identifies the totalized functor models in the derived category
through Lπ_!F (Stacks 08PS–08PU, 08QI).

0.2:
DerivedDeRham.derivedTensor, derivedTensor_flatModel, derivedTensor_triangulated, derivedTensor,
derivedTensor_kFlatColimit, derivedTensor_kFlatRealization.

0.2.1:
DerivedDeRham.flatModuleFilteredFree.

0.3:
leftDerivedNonadditive, leftDerivedNonadditive_additive, leftDerivedNonadditive_projective.
The sifted-colimit extension characterization requires F to be the filtered-colimit extension
of its restriction to finite projectives; the simplicial construction also applies to arbitrary
functors on all projectives, including the algebraic double-dual functor.

0.4:
Algebra.CotangentComplex, termIso, face_tmul, resolutionRings, resolutionRingMap,
Algebra.CotangentComplex.arrowModel, Algebra.CotangentComplex.arrowModelMap,
Algebra.CotangentComplex.differentials, Algebra.CotangentComplex.complex,
Algebra.CotangentComplex.model, Algebra.CotangentComplex.map, Algebra.CotangentComplex.arrowFunctor,
Algebra.CotangentComplex.resolutionIso, Algebra.CotangentComplex.homologyZeroIso,
Algebra.CotangentComplex.arrowResolution, Algebra.CotangentComplex.arrowModelMap_tmul.

0.5:
Algebra.CotangentComplex.SquareZeroExtension, extensionSetoid,
Algebra.CotangentComplex.extensionClass, morphismObstruction, derivationDiscrete, derivationZero,
morphismObstruction_cocycle, Algebra.CotangentComplex.squareZero,
Algebra.CotangentComplex.derivationSection, Algebra.CotangentComplex.derivationPostcompose,
Algebra.CotangentComplex.extensionClass_mk, Algebra.CotangentComplex.extensionCategory,
Algebra.CotangentComplex.exal_add_representative.

0.7:
Algebra.CotangentComplex.homologyOneIso, Algebra.CotangentComplex.lichtenbaumSchlessinger.

0.6:
Algebra.CotangentComplex.extZero, Algebra.CotangentComplex.extOne,
Algebra.CotangentComplex.extensionClass_add, Algebra.CotangentComplex.conormalComparison,
Algebra.CotangentComplex.conormalComparison_extensionClass.

0.8:
Algebra.CotangentComplex.transitivitySecond, Algebra.CotangentComplex.transitivityFirst,
Algebra.CotangentComplex.transitivityTriangle, Algebra.CotangentComplex.transitivityFirst_tmul,
Algebra.CotangentComplex.transitivitySecond_apply.

0.9:
Algebra.CotangentComplex.diagonalModel, Algebra.CotangentComplex.diagonalComparison.

0.10:
Algebra.CotangentComplex.baseChange.

0.11:
Algebra.CotangentComplex.localization, Algebra.CotangentComplex.filteredColimit.

0.12:
Algebra.CotangentComplex.smooth.

0.13:
Algebra.CotangentComplex.regularQuotient.

0.14:
DerivedDeRham.derivedExteriorPower, exteriorPowerZero, exteriorPowerOne, exteriorPowerBaseChange,
exteriorPowerFlat.

0.15:
DerivedDeRham.derivedSymmetricPower, symmetricPowerZero, symmetricPowerOne,
symmetricPowerBaseChange, symmetricPowerFlat.

0.16:
DerivedDeRham.derivedDividedPower, dividedPowerZero, dividedPowerOne, dividedPowerBaseChange,
dividedPowerFlat.

0.17:
DerivedDeRham.powerTriangleFiltration, DerivedDeRham.decalage.

0.25:
Algebra.CotangentComplex.extensionObstruction, Algebra.CotangentComplex.flatDeformation,
Algebra.CotangentComplex.liftMorphism, Algebra.CotangentComplex.transitivityConnecting,
Algebra.CotangentComplex.transitivityConnecting_triangle,
Algebra.CotangentComplex.kernelExtensionClass, Algebra.CotangentComplex.deformationObstruction,
Algebra.CotangentComplex.derivationEvaluation,
Algebra.CotangentComplex.derivationEvaluation_differential,
Algebra.CotangentComplex.polynomialLift_sign, transitivityConnecting_identity_source,
transitivityConnecting_identity_target, derivationEvaluation_base.
flatDeformation uses flat B over A, N = J ⊗_A B and the canonical kernel map; for the identity
base extension this gives J = N = 0. For smooth B/A, algebra deformations have one isomorphism
class, while liftMorphism gives a torsor of morphism lifts under Der_A(B,J).

1.T.1:
CompactCoefficients.Tower, CompactCoefficients.Tower.lim, CompactCoefficients.Tower.limOne,
CompactCoefficients.Tower.mem_lim, CompactCoefficients.Tower.limOne_subsingleton_of_surjective,
CompactCoefficients.reductionTower, limOne_surjective_tower, limOne_mul_p, lim_constant,
CompactCoefficients.constantTower, CompactCoefficients.Tower.IsMittagLeffler,
CompactCoefficients.Tower.isMittagLeffler_of_surjective,
CompactCoefficients.Tower.isMittagLeffler_of_finite,
CompactCoefficients.Tower.isMittagLeffler_iff_ranges, ml_finite, ml_surjective, ml_mul_p_fails.

1.1:
DerivedDeRham.derivedLimit, derivedLimit_surjective, derivedLimit_milnor, derivedLimit_commShift,
derivedLimit_triangle,
derivedLimit_cofinal, derivedLimit_homotopySquare.

1.1.1:
DerivedDeRham.moduleDerivedHom.

1.2:
DerivedDeRham.derivedCompleteness, isDerivedCompleteGenerators, isDerivedCompleteRadical,
isDerivedCompleteCohomology, isDerivedCompleteLimits.

1.3:
DerivedDeRham.derivedCompletion, DerivedDeRham.completionUnit, completionUnit, completionAdjunction,
completionIdempotent, completeNakayama, completionComplete, completedColimit.
For completedColimit the ordinary diagram F of complete objects must satisfy
HasColimit (F ⋙ inclusion) in D(A); the reflector yields its colimit in the complete category
with the reflected cocone. It does not assert arbitrary categorical colimits in D(A).

1.4:
DerivedDeRham.koszulCompletionTower.

1.5:
DerivedDeRham.ordinaryQuotientCompletion.
For test_ordinary_tower_unbounded_torsion, let R = ℤ_p, T = ℚ_p/R, A = R ⋉ T and
C = Λ_(p)(A[0]) in D(A), with the completion unit in D(A). Its cohomology is R in degrees
−1 and 0, with A acting through A → R, and zero otherwise. The decomposition
Res^A_R C ≅ R[1] ⊕ R[0] belongs to D(R). In D(A), Hom(C, R[1]) = 0 by completeness
of R[1] and the completion adjunction, so the truncation triangle is nonsplit.

1.6:
DerivedDeRham.ringCompletionModelComparison supplies natural zigzags of stagewise algebra weak
equivalences between compatible polynomial-resolution towers for the same generating tuple,
under the base and over the quotient tower, through towers with degreewise surjective transitions,
with unit-compatible weak equivalences on strict limits.
The declarations above pin H_A, its underlying-module functor, strict models, descent, and the
algebra-map completion adjunction. ringCompletionAdjunction is natural in the input and the
complete target. Idempotence and the unit-ideal output are isomorphisms in H_A.

1.7:
DerivedDeRham.completeFlatness, DerivedDeRham.IsCompletelyFlatModule, completeFlatReduction,
completeFlatCompletion, completeFlatBaseChange, completeTorAmplitude.

1.8:
DerivedDeRham.boundedTorsionCriterion.

1.9:
DerivedDeRham.completeFlatDescent.

1.E.1:
PerfectLimitChecks.constant, PerfectLimitChecks.adic, PerfectLimitChecks.differential,
PerfectLimitChecks.locallyNilpotent,
perfectInverseSystemEffectivity.

S.1:
DoubleComplex.spectralSequence, DoubleComplex.e2Iso, DoubleComplex.abutmentFiltration,
DoubleComplex.eInftyIsoGr, DoubleComplex.page_eq_eInfty, DoubleComplex.edgeBottom,
DoubleComplex.edgeLeft, DoubleComplex.fiveTerm_exact, DoubleComplex.exact_of_rows_vanish,
DoubleComplex.totalCohomology_of_exact_rows, DoubleComplex.spectralSequence_map.
The contract of DoubleComplex.exact_of_rows_vanish carries `(n : ℤ) (hn : 1 ≤ n)` and
vanishing of `E₂^{pq}` for every `p ≥ 0` and `0 < q < n`.

-/

end

end TauCetiRoadmap.DerivedModuleAlgebra
