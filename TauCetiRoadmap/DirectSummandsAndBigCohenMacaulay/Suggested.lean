module

public import Mathlib
public import TauCeti.RingTheory.RegularLocalRing.Basic

/-!
# Direct summands and big Cohen–Macaulay algebras: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, using native carriers and small
definitions of ring predicates and the geometric derived unit.

The stated headlines are characteristic-p absolute integral closure, balanced
big Cohen–Macaulay existence, the direct summand theorem, flat domination,
complete-local absolute-integral-closure splitting, monomial noncontainment,
weak functoriality, pure-subring Cohen–Macaulayness, the characteristic-p splinter
equivalence and the derived direct summand theorem.

The following headlines are not statable at the pins:
* Perfectoid covers and their almost faithful flatness: integral perfectoid
  algebras and the almost module category are missing.
* Hochster's algebra-modification criterion, including double sequences: the
  algebra modification carrier, its finite sequences and their badness are
  missing.
* Finite covers killing positive relative coherent cohomology: the canonical
  finite-cover comparison between the two derived pushforward functors, with
  its coherent positive-truncation interface, is missing. The bounded-below
  derived pushforward functor and the geometric unit themselves are native.

The derived splitting headlines use the geometric unit in the bounded-below
category of sheaves of modules on Spec R. This is the sheaf form of the affine
R-module statement; the affine comparison belongs to the README's suppliers.

All algebra and module hypotheses below are explicit in declaration signatures.
-/

public section

namespace TauCetiRoadmap.DirectSummandsAndBigCohenMacaulay

open IsLocalRing
open scoped TensorProduct Pointwise

universe u v

/-! ## Layer 0: Splittings and big Cohen–Macaulay modules -/

/-- An algebra splits when its unit admits a linear retraction, without a
multiplicativity requirement on the retraction. -/
def SplitAlgebra (R : Type u) (S : Type v) [CommRing R] [CommRing S]
    [Algebra R S] : Prop :=
  ∃ ρ : S →ₗ[R] R, ρ 1 = 1

/-- A splinter is reduced and Noetherian, and every finite injective algebra
in the base universe admits a linear retraction of its unit. -/
def Splinter (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ IsReduced R ∧
    ∀ (S : Type u) [CommRing S] [Algebra R S] [Module.Finite R S],
      Function.Injective (algebraMap R S) → SplitAlgebra R S

/-- The finite-list form of a system of parameters: dimension-length, membership
in the maximal ideal, and maximal-ideal radical. -/
def ParameterSystem (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (xs : List R) : Prop :=
  ringKrullDim R = xs.length ∧ (∀ x ∈ xs, x ∈ maximalIdeal R) ∧
    (Ideal.ofList xs).radical = maximalIdeal R

/-- Balanced big Cohen–Macaulayness means weak regularity of every parameter
system and a nonzero maximal-ideal quotient, with no module finiteness assumed. -/
def BalancedBigCM (R : Type u) (M : Type v) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [AddCommGroup M] [Module R M] : Prop :=
  maximalIdeal R • (⊤ : Submodule R M) ≠ ⊤ ∧
    ∀ xs : List R, ParameterSystem R xs → RingTheory.Sequence.IsWeaklyRegular M xs

/-- Tensor purity of an algebra, tested on modules in the base universe.
Finite presentations suffice, so this test detects purity in larger universes. -/
def PureAlgebra (R : Type u) (S : Type v) [CommRing R] [CommRing S]
    [Algebra R S] : Prop :=
  ∀ (M : Type u) [AddCommGroup M] [Module R M],
    Function.Injective (fun m : M => m ⊗ₜ[R] (1 : S))

/-! ## Layer 4: Almost Cohen–Macaulay algebras and existence -/

/-- The absolute integral closure of a characteristic-p local domain that is a
quotient of a Gorenstein local ring is balanced big Cohen–Macaulay. Gorensteinness
is expressed by finite self-injective dimension on the native module category
(Huneke–Lyubeznik, Theorem 2.1 and Corollary 2.3). -/
theorem absoluteIntegralClosure_charP (R : Type u) (A : Type v) [CommRing R]
    [IsLocalRing R] [IsNoetherianRing R] [IsDomain R] [CommRing A]
    [IsLocalRing A] [IsNoetherianRing A] (n : ℕ)
    [CategoryTheory.HasInjectiveDimensionLE (ModuleCat.of A A) n]
    (f : A →+* R) (hf : Function.Surjective f)
    (p : ℕ) [Fact p.Prime] [CharP R p] :
    BalancedBigCM R (integralClosure R (AlgebraicClosure (FractionRing R))) := by
  sorry

/-- Every Noetherian local ring has a balanced big Cohen–Macaulay algebra, with
no characteristic, reducedness or p-torsion-freeness restriction (André 0.7.1). -/
theorem exists_balanced (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] :
    ∃ (C : Type u) (_ : CommRing C) (_ : Algebra R C), BalancedBigCM R C := by
  sorry

/-! ## Layer 5: The direct summand theorem and flat domination -/

/-- Every finite injective algebra over a Noetherian regular ring admits a
linear retraction (André 0.2.1; Bhatt 1.1 and 5.4). -/
theorem directSummand (R : Type u) (S : Type v) [CommRing R] [CommRing S]
    [Algebra R S] [IsRegularRing R] [Module.Finite R S]
    (h : Function.Injective (algebraMap R S)) : SplitAlgebra R S := by
  sorry

/-- Every finite cover of a regular ring is dominated by an algebra faithfully
flat over the base (André, Théorème 0.7.2). -/
theorem finiteCover_flatDomination (R : Type u) (S : Type v) [CommRing R]
    [CommRing S] [Algebra R S] [IsRegularRing R] [Module.Finite R S]
    (h : Function.Injective (algebraMap R S)) :
    ∃ (T : Type (max u v)) (_ : CommRing T) (_ : Algebra R T),
      (∃ f : S →ₐ[R] T, Module.FaithfullyFlat R T) := by
  sorry

/-- The inclusion into the absolute integral closure splits for a complete
regular local ring; completeness is essential (André, Annexe A.3, corrected). -/
theorem absoluteIntegralClosure_split (R : Type u) [CommRing R]
    [IsRegularLocalRing R] [IsAdicComplete (maximalIdeal R) R] :
    SplitAlgebra R (integralClosure R (AlgebraicClosure (FractionRing R))) := by
  sorry

/-- The monomial theorem, including the empty parameter list: the product to a
smaller exponent does not belong to the ideal of the larger pure powers. -/
theorem monomial_noncontainment (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (xs : List R) (hx : ParameterSystem R xs)
    (m n : ℕ) (hmn : m < n) : xs.prod ^ m ∉ Ideal.ofList (xs.map (fun x => x ^ n)) := by
  sorry

/-! ## Layer 6: Weak functoriality and pure subrings -/

/-- General separability, including transcendental residue extensions, is tested
on the field map induced by the specified local algebra map. -/
noncomputable def SeparableResidueMap (B : Type u) (B' : Type v) [CommRing B]
    [CommRing B'] [Algebra B B'] [IsLocalRing B] [IsLocalRing B']
    [IsLocalHom (algebraMap B B')] : Prop :=
  letI := (ResidueField.map (algebraMap B B')).toAlgebra
  Algebra.IsTranscendentalSeparable (ResidueField B) (ResidueField B')

/-- Injective complete mixed-characteristic domain maps with regular target and
separable residue extension admit a compatible square of balanced big
Cohen–Macaulay algebras (André, §4.4, pp. 87–88). -/
theorem weakFunctoriality_regularTarget (B : Type u) (B' : Type v)
    [CommRing B] [CommRing B'] [Algebra B B'] [IsLocalRing B]
    [IsNoetherianRing B] [IsDomain B] [IsRegularLocalRing B']
    [IsLocalHom (algebraMap B B')] [CharZero B] [CharZero B']
    [IsAdicComplete (maximalIdeal B) B] [IsAdicComplete (maximalIdeal B') B']
    (p : ℕ) [Fact p.Prime] [CharP (ResidueField B) p] [CharP (ResidueField B') p]
    (hinj : Function.Injective (algebraMap B B')) (hsep : SeparableResidueMap B B') :
    ∃ (C : Type u) (_ : CommRing C) (_ : Algebra B C)
      (C' : Type v) (_ : CommRing C') (_ : Algebra B' C'),
      BalancedBigCM B C ∧ BalancedBigCM B' C' ∧
      ∃ γ : C →+* C', ∀ b : B,
        γ (algebraMap B C b) = algebraMap B' C' (algebraMap B B' b) := by
  sorry

/-- Pure mixed-characteristic local subrings of regular local rings, with
separable residue extension, are Cohen–Macaulay: every parameter list is regular
on the source itself (André, Théorème 4.4.2). -/
theorem pureSubring_cohenMacaulay (B : Type u) (B' : Type v) [CommRing B] [CommRing B']
    [Algebra B B'] [IsLocalRing B] [IsNoetherianRing B] [IsRegularLocalRing B']
    [IsLocalHom (algebraMap B B')] [CharZero B] [CharZero B']
    (p : ℕ) [Fact p.Prime] [CharP (ResidueField B) p] [CharP (ResidueField B') p]
    (hpure : PureAlgebra B B') (hsep : SeparableResidueMap B B') :
    ∀ xs : List B, ParameterSystem B xs → RingTheory.Sequence.IsRegular B xs := by
  sorry

/-! ## Layer 7: The derived direct summand theorem -/

open CategoryTheory AlgebraicGeometry

attribute [local instance] HasDerivedCategory.standard

/-- The structure sheaf as the native bounded-below cochain complex supported
in degree zero. -/
noncomputable def structureComplex (X : Scheme.{u}) : CochainComplex.Plus X.Modules :=
  ⟨(CochainComplex.singleFunctor X.Modules 0).obj (SheafOfModules.unit X.ringCatSheaf),
    ⟨0, by
      rw [CochainComplex.isStrictlyGE_iff]
      intro i hi
      exact HomologicalComplex.isZero_single_obj_X (ComplexShape.up ℤ) 0
        (SheafOfModules.unit X.ringCatSheaf) i (by omega)⟩⟩

/-- The geometric unit O_Y[0] → Rf_*O_X in the native bounded-below derived
category of sheaves of modules, obtained from the ringed-space unit and the
native right-derived-functor unit. -/
noncomputable def derivedUnit {X Y : Scheme.{u}} (f : X ⟶ Y) :
    DerivedCategory.Plus.Q.obj (structureComplex Y) ⟶
      (Scheme.Modules.pushforward f).rightDerivedFunctorPlus.obj
        (DerivedCategory.Plus.Q.obj (structureComplex X)) :=
  DerivedCategory.Plus.Q.map (show structureComplex Y ⟶
      (Scheme.Modules.pushforward f).mapCochainComplexPlus.obj (structureComplex X) from
    ObjectProperty.homMk (by
      change (HomologicalComplex.single Y.Modules (ComplexShape.up ℤ) 0).obj _ ⟶ _
      exact (HomologicalComplex.single Y.Modules (ComplexShape.up ℤ) 0).map
        (SheafOfModules.unitToPushforwardObjUnit f.toRingCatSheafHom) ≫
        (HomologicalComplex.singleMapHomologicalComplex (Scheme.Modules.pushforward f)
          (ComplexShape.up ℤ) 0).inv.app (SheafOfModules.unit X.ringCatSheaf))) ≫
    (Scheme.Modules.pushforward f).rightDerivedFunctorPlusUnit.app (structureComplex X)

/-- A Noetherian ring is a derived splinter when every proper surjective scheme
cover of its spectrum has a retraction of its geometric derived unit. -/
noncomputable def DerivedSplinter (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧
    ∀ (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of R)),
      AlgebraicGeometry.IsProper f → AlgebraicGeometry.Surjective f →
        ∃ ρ, derivedUnit f ≫ ρ = 𝟙 _

/-- In positive characteristic splinters and derived splinters coincide
(Bhatt, Derived splinters, Theorem 0.3). -/
theorem splinter_iff_derivedSplinter_charP (R : Type u) [CommRing R]
    [IsNoetherianRing R] (p : ℕ) [Fact p.Prime] [CharP R p] :
    Splinter R ↔ DerivedSplinter R := by
  sorry

/-- Every Noetherian regular ring is a derived splinter: every proper surjective
cover of its spectrum admits a derived retraction of the geometric unit
(Bhatt, direct summand and its derived variant, Theorems 1.2 and 6.1). -/
theorem derivedDirectSummand (R : Type u) [CommRing R] [IsRegularRing R] :
    DerivedSplinter R := by
  sorry

end TauCetiRoadmap.DirectSummandsAndBigCohenMacaulay

end
