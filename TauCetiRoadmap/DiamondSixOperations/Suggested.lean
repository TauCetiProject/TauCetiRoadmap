import Mathlib
import TauCeti.Topology.Algebra.Group.Profinite.Order
import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicInt.Basic

/-!
# DiamondSixOperations: representative target signatures

The roadmap is `README.md`. This file records the definitions and theorem signatures of the
roadmap that can be stated against the pinned Mathlib and Tau Ceti. These are suggested forms,
not an exhaustive checklist.
Small v-stacks, diamonds and their étale derived categories are not available at the pins, so
the exceptional operations `Rf_!` and `Rf^!`, compactifiable and eligible maps, cohomological
smoothness and the duality theorems over `Spa(C, O_C)` are targets of the README only. What is
stated here are their algebraic, topological and formal inputs, with the conventions they pin:

* the formal duality lemma and the exceptional base change, as conjugates of adjunctions;
* the twisted-pullback transformation of an adjunction with a projection formula;
* the finite-set model of the trace of a finite étale map and of the normalised averaging trace;
* uniqueness of the shift of the unit complex over a nonzero ring, and its failure over the
  zero ring;
* freeness of locally constant functions on a profinite set;
* invertibility, in an `ℓ`-power-torsion ring, of the orders of the finite quotients of a
  profinite group of pro-order prime to `ℓ`;
* detection of vanishing at closed points on a Jacobson space, and the closed points of
  Zariski–Riemann spaces over an algebraically closed field, applied in S6.3 to the compactified
  affinoid perfectoid space with its compactified plus rings.
-/

namespace TauCetiRoadmap.DiamondSixOperations

open CategoryTheory MonoidalCategory

universe u v₁ v₂ v₃ v₄ u₁ u₂ u₃ u₄

/-! Layers S0–S2 are specified in README.md: their statements require the v-stack and diamond
carriers supplied by DiamondsAndVStacks and DiamondEtaleCohomology. Properness is the single
predicate of DiamondsAndVStacks D4.11, re-exported by DiamondEtaleCohomology C4.1; partial
properness and canonical compactification are supplied by C4. The generic qcqs topos vocabulary
is supplied by AdicSpacesPartII R0.19.10, and the generic ringed-site enhancements and derived
functor calculus by EnhancedDerivedSheaves Sections 0.1–0.4. ClassicalAdicEtaleCohomology
supplies the analytic hypotheses and comparisons. -/

/-! ## Layer S3: The exceptional inverse image -/

namespace Formal

variable {𝒞 : Type u₁} [Category.{v₁} 𝒞] [MonoidalCategory 𝒞] [MonoidalClosed 𝒞]
variable {𝒟 : Type u₂} [Category.{v₂} 𝒟] [MonoidalCategory 𝒟] [MonoidalClosed 𝒟]

/-- **The formal duality lemma** (Section S3.2). Given adjunctions `f^* ⊣ f_*` and
`f_! ⊣ f^!` and a projection formula `f_!(B ⊗ f^* A) ≅ f_! B ⊗ A`, natural in `A`, the internal
Hom out of `f_! B` is `f_* ∘ ihom B ∘ f^!`. It is the conjugate of the projection formula for the
composite adjunctions; Verdier duality `RHom(Rf_! B, A') ≅ Rf_* RHom(B, Rf^! A')` (ECD 23.3(i))
is its instance for the enhanced étale categories. -/
theorem formalVerdierDuality {fUpper : 𝒟 ⥤ 𝒞} {fLower : 𝒞 ⥤ 𝒟} {fShriek : 𝒞 ⥤ 𝒟}
    {fUpperShriek : 𝒟 ⥤ 𝒞} (adj : fUpper ⊣ fLower) (adjShriek : fShriek ⊣ fUpperShriek)
    (B : 𝒞) (proj : fUpper ⋙ tensorLeft B ⋙ fShriek ≅ tensorLeft (fShriek.obj B)) :
    Nonempty (ihom (fShriek.obj B) ≅ fUpperShriek ⋙ ihom B ⋙ fLower) := by
  sorry

/-- **The second form of the formal duality lemma** (Section S3.2). A projection formula
`A ⊗ f_! C ≅ f_!(f^* A ⊗ C)`, natural in `C`, gives `f^! (ihom A A') ≅ ihom (f^* A) (f^! A')`,
naturally in `A'`. Its instance is `Rf^! RHom(A, B) ≅ RHom(f^* A, Rf^! B)` (ECD 23.3(ii)). -/
theorem formalUpperShriekInternalHom {fUpper : 𝒟 ⥤ 𝒞} {fShriek : 𝒞 ⥤ 𝒟}
    {fUpperShriek : 𝒟 ⥤ 𝒞} (adjShriek : fShriek ⊣ fUpperShriek) (A : 𝒟)
    (proj : fShriek ⋙ tensorLeft A ≅ tensorLeft (fUpper.obj A) ⋙ fShriek) :
    Nonempty (ihom A ⋙ fUpperShriek ≅ fUpperShriek ⋙ ihom (fUpper.obj A)) := by
  sorry

/-- For the identity adjunctions and the identity projection formula, the formal duality lemma
returns an isomorphism of `ihom B` with itself. -/
example (B : 𝒞) :
    Nonempty (ihom ((𝟭 𝒞).obj B) ≅ 𝟭 𝒞 ⋙ ihom B ⋙ 𝟭 𝒞) :=
  formalVerdierDuality (Adjunction.id) (Adjunction.id) B (Iso.refl _)

/-- For `ℤ → ℤ/5`, coinduction of `ℤ` is zero. -/
example : Subsingleton (Module.Dual ℤ (ZMod 5)) := by
  sorry

/-- Extension of scalars along the same map sends `ℤ` to a nonzero module. -/
example : Nontrivial (TensorProduct ℤ (ZMod 5) ℤ) := by
  sorry

end Formal

namespace ExceptionalBaseChange

variable {DX : Type u₁} [Category.{v₁} DX] {DX' : Type u₂} [Category.{v₂} DX']
variable {DY : Type u₃} [Category.{v₃} DY] {DY' : Type u₄} [Category.{v₄} DY']

/-- **Exceptional base change from base change** (Section S3.3, ECD 23.16(i)). For a cartesian
square with `g : X' → X` eligible, `f : Y → X` arbitrary and pullbacks `g̃ : Y' → Y`,
`f' : Y' → X'`, base change `f^* ∘ Rg_! ≅ Rg̃_! ∘ f'^*` gives
`Rg^! ∘ Rf_* ≅ Rf'_* ∘ Rg̃^!` by passing to right adjoints. Here the four categories stand for
the étale derived categories of `X`, `X'`, `Y`, `Y'`. -/
theorem exceptionalBaseChange_of_baseChange
    {gShriek : DX' ⥤ DX} {gUpperShriek : DX ⥤ DX'} (adjg : gShriek ⊣ gUpperShriek)
    {fUpper : DX ⥤ DY} {fLower : DY ⥤ DX} (adjf : fUpper ⊣ fLower)
    {gtShriek : DY' ⥤ DY} {gtUpperShriek : DY ⥤ DY'} (adjgt : gtShriek ⊣ gtUpperShriek)
    {f'Upper : DX' ⥤ DY'} {f'Lower : DY' ⥤ DX'} (adjf' : f'Upper ⊣ f'Lower)
    (bc : gShriek ⋙ fUpper ≅ f'Upper ⋙ gtShriek) :
    Nonempty (fLower ⋙ gUpperShriek ≅ gtUpperShriek ⋙ f'Lower) := by
  sorry

end ExceptionalBaseChange

namespace Twist

variable {𝒞 : Type u₁} [Category.{v₁} 𝒞] [MonoidalCategory 𝒞]
variable {𝒟 : Type u₂} [Category.{v₂} 𝒟] [MonoidalCategory 𝒟]

/-- **The twisted-pullback transformation** `τ_f : f^! 𝟙 ⊗ f^* (-) ⟶ f^!(-)` of an adjunction
`f_! ⊣ f^!` with a projection formula for `f^! 𝟙` (Section S3.4, ECD 23.4(i)). It is adjoint to
`f_!(f^! 𝟙 ⊗ f^* A) ≅ f_! f^! 𝟙 ⊗ A ⟶ 𝟙 ⊗ A ≅ A`, the composite of the projection formula, the
counit (the trace `tr_f`) and the left unitor. Cohomological smoothness asks that it be an
isomorphism with `f^! 𝟙` invertible. -/
noncomputable def twistedPullbackTransformation {fUpper : 𝒟 ⥤ 𝒞} {fShriek : 𝒞 ⥤ 𝒟}
    {fUpperShriek : 𝒟 ⥤ 𝒞} (adjShriek : fShriek ⊣ fUpperShriek)
    (proj : fUpper ⋙ tensorLeft (fUpperShriek.obj (𝟙_ 𝒟)) ⋙ fShriek ≅
      tensorLeft (fShriek.obj (fUpperShriek.obj (𝟙_ 𝒟)))) :
    fUpper ⋙ tensorLeft (fUpperShriek.obj (𝟙_ 𝒟)) ⟶ fUpperShriek :=
  (Functor.rightUnitor _).inv ≫
    Functor.whiskerLeft (fUpper ⋙ tensorLeft (fUpperShriek.obj (𝟙_ 𝒟))) adjShriek.unit ≫
    (Functor.associator _ fShriek fUpperShriek).inv ≫
    Functor.whiskerRight
      ((Functor.associator fUpper _ fShriek).hom ≫ proj.hom ≫
        (tensoringLeft 𝒟).map (adjShriek.counit.app (𝟙_ 𝒟)) ≫ (leftUnitorNatIso 𝒟).hom)
      fUpperShriek ≫
    (Functor.leftUnitor fUpperShriek).hom

/-- For the identity, with the identity projection formula, the twisted pullback is an
isomorphism: the identity map is cohomologically smooth with dualizing object `𝟙`. -/
example : IsIso (twistedPullbackTransformation (fUpper := 𝟭 𝒟) Adjunction.id (Iso.refl _)) := by
  sorry

end Twist

namespace FiniteModel

variable (Λ : Type*) [CommRing Λ] (I : Type*) [Fintype I]

/-- The trace of the finite étale map `I × X → X` on global sections of the constant sheaf:
summation over the fibre, `Λ^I → Λ` (Section S3.4). -/
def finiteTrace : (I → Λ) →ₗ[Λ] Λ :=
  ∑ i : I, LinearMap.proj i

/-- The unit `Λ → Λ^I` of the same finite étale map: the diagonal. -/
def finiteUnit : Λ →ₗ[Λ] (I → Λ) :=
  LinearMap.pi fun _ => LinearMap.id

/-- The normalised trace `|I|⁻¹ · Σ` used for the averaging transformation of a free action of a
finite group of order prime to `ℓ` (Section S5.3). -/
noncomputable def normalizedTrace (h : IsUnit (Fintype.card I : Λ)) : (I → Λ) →ₗ[Λ] Λ :=
  (h.unit⁻¹ : Λˣ) • finiteTrace Λ I

/-- Trace after unit is multiplication by the degree. -/
example : finiteTrace Λ I ∘ₗ finiteUnit Λ I = (Fintype.card I : Λ) • LinearMap.id := by
  sorry

/-- The normalised trace splits the unit. -/
example (h : IsUnit (Fintype.card I : Λ)) :
    normalizedTrace Λ I h ∘ₗ finiteUnit Λ I = LinearMap.id := by
  sorry

/-- Over `𝔽₅` with two points the normalised trace is not the plain trace: the averaging
transformation is multiplication by `2⁻¹`, not the identification `Rq^! = q^*`. -/
example (h : IsUnit (Fintype.card (Fin 2) : ZMod 5)) :
    normalizedTrace (ZMod 5) (Fin 2) h ≠ finiteTrace (ZMod 5) (Fin 2) := by
  sorry

/-- The empty finite fibre has zero trace. -/
example : finiteTrace Λ (Fin 0) = 0 := by
  simp [finiteTrace]

/-- The diagonal on a one-point fibre returns the coefficient itself. -/
example (a : Λ) : finiteUnit Λ (Fin 1) a 0 = a := by
  rfl

/-- An empty fibre cannot be normalised over a nonzero ring: its degree is zero. -/
example [Nontrivial Λ] : ¬ IsUnit (Fintype.card (Fin 0) : Λ) := by
  simp

/-- On a two-point fibre over `𝔽₅`, averaging a single basis vector gives `2⁻¹ = 3`. -/
example (h : IsUnit (Fintype.card (Fin 2) : ZMod 5)) :
    normalizedTrace (ZMod 5) (Fin 2) h (Pi.single 0 1) = 3 := by
  sorry

/-- The plain two-point trace sends a basis vector to one. -/
example : finiteTrace (ZMod 5) (Fin 2) (Pi.single 0 1) = 1 := by
  sorry

/-- The two-point unit is the diagonal, before any trace normalisation. -/
example : finiteUnit (ZMod 5) (Fin 2) 1 = fun _ => 1 := by
  sorry

/-- On a one-point fibre the normalised trace returns the input scalar. -/
example (h : IsUnit (Fintype.card (Fin 1) : Λ)) (a : Λ) :
    normalizedTrace Λ (Fin 1) h (fun _ => a) = a := by
  sorry

end FiniteModel

/-! ## Layer S4: Cohomologically smooth morphisms -/

namespace PointCoefficients

open CategoryTheory.Limits

attribute [local instance] HasDerivedCategory.standard

variable (Λ : Type u) [CommRing Λ]

/-- The coefficient ring `Λ` in degree `0`, the unit object of the derived category of
`Λ`-modules: the stalk of the constant sheaf at a geometric point. -/
noncomputable def unitComplex : DerivedCategory (ModuleCat.{u} Λ) :=
  (DerivedCategory.singleFunctor (ModuleCat.{u} Λ) 0).obj (ModuleCat.of Λ Λ)

/-- Over a nonzero ring the shift of an invertible object is determined: `Λ[m] ≅ Λ[n]` forces
`m = n`, so the degree `-n` of an object locally isomorphic to `Λ[n]` is well defined
(Section S4.2). -/
theorem shift_unitComplex_injective [Nontrivial Λ] {m n : ℤ}
    (e : (unitComplex Λ)⟦m⟧ ≅ (unitComplex Λ)⟦n⟧) : m = n := by
  sorry

/-- The positive shift places the unit in cohomological degree minus one. -/
example : Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{u} Λ) (-1)).obj
    ((unitComplex Λ)⟦(1 : ℤ)⟧) ≅ ModuleCat.of Λ Λ) := by
  sorry

/-- Over the zero ring every shift of the unit complex is zero, so no degree is defined. -/
example : Nonempty ((unitComplex (ZMod 1))⟦(0 : ℤ)⟧ ≅ (unitComplex (ZMod 1))⟦(1 : ℤ)⟧) := by
  sorry

/-- The unshifted integral unit has degree-zero cohomology `ℤ`. -/
example : Nonempty ((DerivedCategory.homologyFunctor (ModuleCat ℤ) 0).obj
    (unitComplex ℤ) ≅ ModuleCat.of ℤ ℤ) := by
  sorry

/-- The unshifted integral unit has no degree-one cohomology. -/
example : IsZero ((DerivedCategory.homologyFunctor (ModuleCat ℤ) 1).obj
    (unitComplex ℤ)) := by
  sorry

/-- The positive shift has zero degree-zero cohomology. -/
example : IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} Λ) 0).obj
    ((unitComplex Λ)⟦(1 : ℤ)⟧)) := by
  sorry

end PointCoefficients

namespace ProfiniteSets

/-- **Locally constant functions on a profinite set are free** (Section S4.1). For a profinite
`S`, `C⁰(S, Λ)` is a free `Λ`-module; for `Λ = ℤ` this is Nöbeling's theorem
`LocallyConstant.freeOfProfinite`. It makes `C⁰(S, Λ) ⊗ -` exact in the profinite-projection
formula `Rh_* h^* C ≅ C⁰(S, Λ) ⊗ C`. -/
theorem LocallyConstant.free_of_profinite (S : Profinite.{u}) (Λ : Type*) [CommRing Λ] :
    Module.Free Λ (LocallyConstant S Λ) := by
  sorry

/-- For an infinite profinite set the module of locally constant functions is not finitely
generated, which is why `Rq^!` of a profinite projection does not commute with sums. -/
example (S : Profinite.{u}) [Infinite S] (Λ : Type*) [CommRing Λ] [Nontrivial Λ] :
    ¬ Module.Finite Λ (LocallyConstant S Λ) := by
  sorry

/-- Distributions are not locally constant functions: for `S = ℤ_[r]` and `Λ = 𝔽_ℓ` the dual of
`C⁰(S, Λ)` (countable dimension) has uncountable dimension, so the distribution sheaf `Rq^! Λ`
of Section S5.4 is not `q^* Λ`. -/
example (ℓ r : ℕ) [Fact ℓ.Prime] [Fact r.Prime] :
    ¬ Nonempty (Module.Dual (ZMod ℓ) (LocallyConstant ℤ_[r] (ZMod ℓ)) ≃ₗ[ZMod ℓ]
      LocallyConstant ℤ_[r] (ZMod ℓ)) := by
  sorry

/-- Over the zero ring the locally constant function module is zero for every profinite set. -/
example (S : Profinite.{u}) : Subsingleton (LocallyConstant S (ZMod 1)) := by
  refine ⟨fun f g => LocallyConstant.ext fun _ => ?_⟩
  exact Subsingleton.elim _ _

/-- On a finite discrete space every function is locally constant. -/
example (I : Type*) [Fintype I] [TopologicalSpace I] [DiscreteTopology I]
    (Λ : Type*) [CommRing Λ] :
    Nonempty (LocallyConstant I Λ ≃ₗ[Λ] (I → Λ)) := by
  sorry

/-- A one-point space gives the coefficient module itself. -/
example (I : Type*) [Unique I] [TopologicalSpace I] (Λ : Type*) [CommRing Λ] :
    Nonempty (LocallyConstant I Λ ≃ₗ[Λ] Λ) := by
  sorry

end ProfiniteSets

/-! ## Layer S5: Examples of cohomologically smooth morphisms -/

namespace Haar

open TauCeti

/-- **Finite quotients of a group of pro-order prime to `ℓ` have unit order** (Section S5.3).
If the supernatural order of the profinite group `K` has exponent `0` at `ℓ` and `ℓ^m = 0` in
`Λ`, every finite continuous quotient of `K` has order a unit of `Λ`. This is the hypothesis
`HasUnitProOrder Λ (⊤ : Subgroup K)` of `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups`,
under which the normalised `Λ`-valued Haar measure with total volume `1` exists. Compactness is needed: for a
noncompact group an open subgroup can have infinite index. -/
theorem isUnit_card_quotient_of_profiniteOrder {K : Type u} [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] [CompactSpace K] [TotallyDisconnectedSpace K]
    {Λ : Type*} [CommRing Λ] (ℓ : Nat.Primes) (hK : profiniteOrder K ℓ = 0) {m : ℕ}
    (hΛ : ((ℓ : ℕ) : Λ) ^ m = 0) (U : OpenNormalSubgroup K) :
    IsUnit ((Nat.card (K ⧸ U.toSubgroup) : ℕ) : Λ) := by
  sorry

/-- `ℤ_p` has pro-order prime to every `ℓ ≠ p`. -/
example (p : ℕ) [Fact p.Prime] (ℓ : Nat.Primes) (hℓ : (ℓ : ℕ) ≠ p) :
    profiniteOrder (Multiplicative ℤ_[p]) ℓ = 0 := by
  rw [profiniteOrder_multiplicative_padicInt]
  exact Supernatural.primePower_apply_of_ne (fun e => hℓ (congrArg Subtype.val e)) _

/-- For `K = ℤ_ℓ` the index of `ℓ ℤ_ℓ` is `ℓ`, which is zero in `𝔽_ℓ`: no normalised
`𝔽_ℓ`-valued Haar measure exists. -/
example (ℓ : ℕ) [hℓ : Fact ℓ.Prime] :
    profiniteOrder (Multiplicative ℤ_[ℓ]) (⟨ℓ, hℓ.out⟩ : Nat.Primes) ≠ 0 := by
  have h := congrArg (fun a : Supernatural => a (⟨ℓ, hℓ.out⟩ : Nat.Primes))
    (profiniteOrder_multiplicative_padicInt ℓ)
  exact fun hzero => ENat.top_ne_zero <|
    (Supernatural.primePower_apply_self (⟨ℓ, hℓ.out⟩ : Nat.Primes) ⊤).symm.trans
      (h.symm.trans hzero)

/-- Every quotient of the trivial group has order one, a unit even in the zero ring. -/
example (K : Type*) [Group K] [Subsingleton K] (U : Subgroup K)
    (Λ : Type*) [CommRing Λ] :
    Nat.card (K ⧸ U) = 1 ∧ IsUnit ((Nat.card (K ⧸ U) : ℕ) : Λ) := by
  sorry

/-- The orders of quotients of a finite cyclic group prime to `ℓ` are units in
an `ℓ`-power-torsion ring. -/
example (m ℓ : ℕ) [NeZero m] [Fact ℓ.Prime] (hm : ¬ ℓ ∣ m)
    (Λ : Type*) [CommRing Λ] {n : ℕ} (hΛ : (ℓ : Λ) ^ n = 0)
    (U : Subgroup (Multiplicative (ZMod m))) :
    IsUnit ((Nat.card (Multiplicative (ZMod m) ⧸ U) : ℕ) : Λ) := by
  sorry

/-- The order of the two-element cyclic group has inverse three in `𝔽₅`. -/
example : (Nat.card (Multiplicative (ZMod 2)) : ZMod 5) * 3 = 1 := by
  sorry

end Haar

/-! ## Layer S6: Biduality, finiteness and conservativity over a geometric point -/

section

local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

/-- The canonical bidual map of a finite-dimensional `𝔽₅`-vector space is bijective, the
coefficient case of Verdier biduality over a geometric point (Section S6.1). -/
example (V : Type u) [AddCommGroup V] [Module (ZMod 5) V]
    [FiniteDimensional (ZMod 5) V] : Function.Bijective (Module.Dual.eval (ZMod 5) V) :=
  Module.bijective_dual_eval (ZMod 5) V

end

namespace ClosedPoints

open CategoryTheory.Limits

/-- **Closed points detect vanishing on a Jacobson space** (Section S6.3). A sheaf of modules on
a Jacobson space whose stalks vanish at every closed point is zero: the support of a nonzero
section is nonempty and locally closed, so it contains a closed point. -/
theorem isZero_of_isZero_stalk_closedPoints {X : TopCat.{u}} [JacobsonSpace X]
    {Λ : Type u} [CommRing Λ] (F : TopCat.Sheaf (ModuleCat.{u} Λ) X)
    (hF : ∀ x ∈ closedPoints X, IsZero (F.presheaf.stalk x)) : IsZero F := by
  sorry

/-- The Sierpiński space is not Jacobson: its open point is a nonempty locally closed set with
no closed point, and the extension by zero from that point is a nonzero sheaf whose stalk at
the closed point vanishes. -/
example : ¬ JacobsonSpace Prop := by
  sorry

/-- On a finite discrete space, vanishing at every stalk forces a module sheaf to vanish. -/
example (X : Type u) [Fintype X] [TopologicalSpace X] [DiscreteTopology X]
    (Λ : Type u) [CommRing Λ] (F : TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of X))
    (hF : ∀ x : X, IsZero (F.presheaf.stalk x)) : IsZero F := by
  sorry

/-- On `Spec ℤ`, vanishing of a sheaf of `𝔽₅`-modules at every maximal ideal forces the
whole sheaf, including its generic stalk, to vanish (Section S6.3). -/
example (F : TopCat.Sheaf (ModuleCat (ZMod 5)) (TopCat.of (PrimeSpectrum ℤ)))
    (hF : ∀ x : PrimeSpectrum ℤ, x.asIdeal.IsMaximal → IsZero (F.presheaf.stalk x)) :
    IsZero F := by
  sorry

end ClosedPoints

namespace ZariskiRiemann

variable (k K : Type u) [Field k] [IsAlgClosed k] [Field K] [Algebra k K]

/-- **Closed points of a Zariski–Riemann space** (Section S6.3). Below every valuation subring
`V₀` containing a finitely generated `k`-subalgebra `A` there is a valuation subring `W ⊇ A`
whose residue field is `k`. With `valuationSubring_eq_of_le` this shows that every nonempty
locally closed subset of `ZR(K/k)` contains a closed point. `k` must be algebraically closed. -/
theorem exists_closed_valuationSubring_le (A : Subalgebra k K) (hA : A.FG)
    (V₀ : ValuationSubring K) (hAV : ∀ a ∈ A, a ∈ V₀) :
    ∃ W : ValuationSubring K, W ≤ V₀ ∧ (∀ a ∈ A, a ∈ W) ∧
      ∀ w ∈ W, ∃ c : k, w - algebraMap k K c ∈ W.nonunits := by
  sorry

/-- A valuation subring with residue field `k` is a closed point of `ZR(K/k)`: every smaller
valuation subring containing `k` is equal to it. -/
theorem valuationSubring_eq_of_le (W V : ValuationSubring K)
    (hW : ∀ w ∈ W, ∃ c : k, w - algebraMap k K c ∈ W.nonunits)
    (hk : ∀ c : k, algebraMap k K c ∈ V) (hVW : V ≤ W) : V = W := by
  sorry

/-- For `K = k` the only valuation subring is `K` itself, whose residue field is `k`. -/
example : ∀ w ∈ (⊤ : ValuationSubring k), ∃ c : k, w - algebraMap k k c ∈
    (⊤ : ValuationSubring k).nonunits := by
  sorry

/-- The valuation ring of `k(t)` at `t = 0` contains the constants, has uniformiser `t`
and residue field `k`, and is minimal among valuation subrings containing `k`. -/
example : ∃ V : ValuationSubring (RatFunc k),
    (∀ c : k, RatFunc.C c ∈ V) ∧ RatFunc.X ∈ V.nonunits ∧
    Nonempty (IsLocalRing.ResidueField V ≃+* k) ∧
    ∀ W : ValuationSubring (RatFunc k),
      (∀ c : k, RatFunc.C c ∈ W) → W ≤ V → W = V := by
  sorry

/-- The trivial valuation of `k(t)` has residue field `k(t)`, whose parameter is not
represented by a constant. -/
example : Nonempty (IsLocalRing.ResidueField (⊤ : ValuationSubring (RatFunc k)) ≃+*
    RatFunc k) ∧ ¬ ∃ c : k, RatFunc.X = RatFunc.C c := by
  sorry

/-- The real quadratic point has residue field `ℂ` and is minimal over `ℝ`, despite
its residue field being strictly larger than the constants. -/
example : ∃ V : ValuationSubring (RatFunc ℝ),
    (∀ c : ℝ, RatFunc.C c ∈ V) ∧
    (RatFunc.X ^ 2 + 1 : RatFunc ℝ) ∈ V.nonunits ∧
    Nonempty (IsLocalRing.ResidueField V ≃+* ℂ) ∧
    (¬ ∀ w ∈ V, ∃ c : ℝ, w - RatFunc.C c ∈ V.nonunits) ∧
    ∀ W : ValuationSubring (RatFunc ℝ),
      (∀ c : ℝ, RatFunc.C c ∈ W) → W ≤ V → W = V := by
  sorry

end ZariskiRiemann

/-!
Further definitions and theorems specified in README.md, by layer (those stated above are
omitted):
The proper-diamond classification and topological comparison in S1 use `dim.trg ≤ 0` in
`WithBot ENat`, including the empty source of dimension `⊥`. The S5 cyclotomic-limit torsor
identifies the tilted completion, its self-fibre product and its quotient after removing finite
torsion, using compatible Galois levels. The S6 biduality counterexample uses the proper rational
open `{|a| ≤ 1}` for `a ∈ O_C ∖ C⁺` at arbitrary valuation rank; the norm-point inclusion is a
fixture only when it is open. Conditional conservativity retains the hypothesis that linear
duality detects every object of `D(Λ)`: the Hahn valuation ring of characteristic `ℓ ≠ p` is an
admissible coefficient ring failing that hypothesis.
The S6 target `closedPoints_detect_zero` applies after relative compactification over
`S = Spa(C, O_C)`: an affinoid `Spa(R, R⁺)` becomes `Spa(R, R⁺_S)`, with the same ring and
compactified plus ring. For an affinoid strictly totally disconnected `T → X` and compactifiable
`X → S`, the intermediate space `X₀ = T̄^{/X}` is open in `W = T̄^{/S}`. The components of `W`
are `Spa(C_t, O_C + C_t°°)`, with underlying Zariski–Riemann spaces, so `W` satisfies the helper's
hypotheses. The proof of `verdierDual_conservative` applies detection to `j_! A₀` on `W` and
then restricts to `X₀`. The nonproper rational-open example in S6.3 has a nonvaluation plus ring;
its compactification includes the valuations at infinity.
Invertibility in S4 is defined for any small v-stack, by étale-local shifts of the unit, and
descends from v-covers by locally spatial diamonds. The S5 relative-ball approximation constructs
an inverse system for each affinoid perfectoid morphism in characteristic `p`; the dimensions of
its affinoid open ball stages need not be bounded.
Layer S0: IsCompactifiable, isCompactifiable_iff_isSeparated_and_isOpenImmersion,
IsCompactifiable.baseChange, IsCompactifiable.of_baseChange_of_surjective,
IsCompactifiable.comp, IsCompactifiable.of_openCover,
IsCompactifiable.of_isSeparated_of_isEtale, IsCompactifiable.of_comp, IsLocallySplit,
IsCompactifiable.of_comp_of_isLocallySplit, IsEligible, IsSpatialEligible, IsEligible.of_comp.
Layer S1: fibreDimension_le_dimTrg, dimTrg_canonicalCompactification, lowerShriekQC,
lowerShriekQC_factorisation, properDimTrgZero_equiv_compHaus, qcqsDiamond_cohomology_continuous,
properDimTrgZero_topological_equiv, lowerShriekQC_cd_le_two_mul_of_spatial,
lowerShriekQC_cd_le_three_mul, lowerShriekQC_baseChange, lowerShriekQC_comp,
lowerShriekQC_eq_etaleLowerShriek, lowerShriekQC_preservesCoproducts, lowerShriekQC_projection.
Layer S2: exists_hypercover_strictlyTotallyDisconnected, hypercover_commonRefinement,
properSupportSubcategory, lowerShriekLocSpatial, lowerShriekLocSpatial_colim,
lowerShriekLocSpatial_preservesColimits, lowerShriekLocSpatial_baseChange,
hypercoverSupportDiagram, lowerShriekHypercover, lowerShriekHypercover_fibre,
lowerShriekHypercover_cocartesian, lowerShriek, lowerShriek_hypercover_indep,
lowerShriek_baseChange, lowerShriek_preservesColimits, lowerShriek_comp,
lowerShriek_eq_etaleLowerShriek, lowerShriek_projection, lowerShriek_baseChange_comp,
lowerShriek_comp_assoc.
Layer S3: upperShriek, lowerShriekUpperShriekAdj, upperShriek_restrictScalars, verdierDuality,
upperShriek_internalHom, upperShriek_comp, upperShriek_etale, upperShriek_pushforward_exchange,
shriekTrace, upperShriekBaseChangeTransformation, twistedPullbackTransformation_baseChange,
twistedPullbackTransformation_etale, twistedPullbackTransformation_openImmersion.
Finite models in Section S3.4: finiteTrace_apply, finiteTrace_comp_finiteUnit, finiteUnit_apply,
finiteUnit_reindex, normalizedTrace_apply, normalizedTrace_comp_finiteUnit, normalizedTrace_reindex.
Layer S4: profiniteProjection_pushforward_pullback, upperShriek_twist_tfae,
upperShriek_twist_of_ellTorsion, upperShriek_preservesCoproducts_iff, IsInvertibleObject,
IsCohomologicallySmooth, isCohomologicallySmooth_iff_practical,
IsCohomologicallySmooth.of_separated_etale, IsCohomologicallySmooth.upperShriek_baseChange,
IsCohomologicallySmooth.upperShriek_twist, dualizingComplex,
IsCohomologicallySmooth.lowerShriek_perfectConstructible,
IsCohomologicallySmooth.isUniversallyOpen, IsCohomologicallySmooth.baseChange,
IsCohomologicallySmooth.of_baseChange_of_surjective, IsCohomologicallySmooth.comp,
IsCohomologicallySmooth.of_comp_of_surjective,
representableInLocallySpatial_of_universallyOpen_cover,
IsCohomologicallySmooth.of_comp_of_isLocallySplit,
IsCohomologicallySmooth.pushforward_baseChange, IsCohomologicallySmooth.upperShriek_exchange,
IsCohomologicallySmooth.pullback_internalHom.
Point coefficients in Section S4.2: unitComplex_homology, unitComplex_shift_homology,
unitComplex_zero_ring.
Layer S5: Ball, tateTwist, Ball.isCohomologicallySmooth, Ball.dualizingComplex_iso,
quotientByProfiniteAction, averagingTransformation, IsCohomologicallySmooth.quotient_free,
profiniteProjection_upperShriek_distributions, IsCohomologicallySmooth.quotient_nonfree,
IsCohomologicallySmooth.of_adic_smooth, cyclotomicLimit_torsor, SpdQp.isCohomologicallySmooth,
affinoidPerfectoid_relativeBallApproximation, isCohomologicallySmooth_iff_geometricBase.
Layer S6: verdierDual, naiveDual, biduality, finite_cohomology_of_smooth, biduality_ellTorsion,
perfect_globalSections, not_biduality_valuedPlus, closedPoints_detect_zero,
verdierDual_conservative, not_verdierDual_conservative_valuedPlus,
verdierDual_conservative_of_ring.
-/

end TauCetiRoadmap.DiamondSixOperations
