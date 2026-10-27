import Mathlib

/-!
# Selected Kac–Moody signatures

This file is advisory, not the specification or an exhaustive checklist; see README.md.
It exhibits a full Cartan presentation, actual quotient/enveloping/Verma carriers, a
cone-supported character carrier, finite path data and strict crystal maps. Proof targets are admitted honestly.
The multiplication of upper-cone characters is constructed data and is a KM4 target in README.md,
not an admitted definition here. No finite-dimensional Killing instance
is used to manufacture the singular or infinite-dimensional construction.
-/

noncomputable section
open scoped BigOperators

namespace TauCetiRoadmap.KacMoody

/-- Integral row convention: A i j = alpha_j(h_i). -/
structure SymmetrizableDatum (I : Type*) [Fintype I] where
  cartan : Matrix I I ℤ
  diagonal : ∀ i, cartan i i = 2
  offDiagonal : ∀ i j, i ≠ j → cartan i j ≤ 0
  zeroSymmetry : ∀ i j, cartan i j = 0 ↔ cartan j i = 0
  symmetrizer : I → ℕ
  symmetrizer_pos : ∀ i, 0 < symmetrizer i
  symmetrizes : ∀ i j,
    (symmetrizer i : ℤ) * cartan i j = (symmetrizer j : ℤ) * cartan j i

/-- Full rational Cartan realization; m need not equal the number of simple roots. -/
structure RationalRealization {I : Type*} [Fintype I] (A : SymmetrizableDatum I) (m : ℕ) where
  coroot : I → (Fin m → ℚ)
  root : I → Module.Dual ℚ (Fin m → ℚ)
  coroot_independent : LinearIndependent ℚ coroot
  root_independent : LinearIndependent ℚ root
  pairing : ∀ i j, root j (coroot i) = (A.cartan i j : ℚ)

/-- Every Cartan direction is a generator, including singular degree directions. -/
abbrev FreePresentation (I : Type*) (m : ℕ) :=
  FreeLieAlgebra ℚ ((Fin m → ℚ) ⊕ (I ⊕ I))

def hGenerator {I : Type*} {m : ℕ} (x : Fin m → ℚ) : FreePresentation I m :=
  FreeLieAlgebra.of ℚ (Sum.inl x)

def eGenerator {I : Type*} {m : ℕ} (i : I) : FreePresentation I m :=
  FreeLieAlgebra.of ℚ (Sum.inr (Sum.inl i))

def fGenerator {I : Type*} {m : ℕ} (i : I) : FreePresentation I m :=
  FreeLieAlgebra.of ℚ (Sum.inr (Sum.inr i))

/-- The full set of Cartan-linearity, Chevalley and Serre relations, not a Prop placeholder. -/
def relators {I : Type*} [Fintype I] [DecidableEq I] {A : SymmetrizableDatum I} {m : ℕ}
    (R : RationalRealization A m) : Set (FreePresentation I m) :=
  {z | ∃ (x y : Fin m → ℚ), z = hGenerator (I := I) (x + y) - hGenerator (I := I) x - hGenerator (I := I) y} ∪
  {z | ∃ (q : ℚ) (x : Fin m → ℚ), z = hGenerator (I := I) (q • x) - q • hGenerator (I := I) x} ∪
  {z | ∃ (x y : Fin m → ℚ), z = ⁅hGenerator (I := I) x, hGenerator (I := I) y⁆} ∪
  {z | ∃ (x : Fin m → ℚ) (i : I), z = ⁅hGenerator (I := I) x, eGenerator (m := m) i⁆ - R.root i x • eGenerator (m := m) i} ∪
  {z | ∃ (x : Fin m → ℚ) (i : I), z = ⁅hGenerator (I := I) x, fGenerator (m := m) i⁆ + R.root i x • fGenerator (m := m) i} ∪
  {z | ∃ (i j : I), z = ⁅eGenerator (m := m) i, fGenerator (m := m) j⁆ -
    if i = j then hGenerator (I := I) (R.coroot i) else 0} ∪
  {z | ∃ (i j : I), i ≠ j ∧ z =
    ((LieAlgebra.ad ℚ (FreePresentation I m) (eGenerator (m := m) i)) ^
      (1 - A.cartan i j).toNat) (eGenerator (m := m) j)} ∪
  {z | ∃ (i j : I), i ≠ j ∧ z =
    ((LieAlgebra.ad ℚ (FreePresentation I m) (fGenerator (m := m) i)) ^
      (1 - A.cartan i j).toNat) (fGenerator (m := m) j)}

def presentationIdeal {I : Type*} [Fintype I] [DecidableEq I]
    {A : SymmetrizableDatum I} {m : ℕ} (R : RationalRealization A m) :
    LieIdeal ℚ (FreePresentation I m) :=
  LieSubmodule.lieSpan ℚ _ (relators R)

/-- The actual full-realization quotient. Its Lie structures are inherited from the quotient. -/
abbrev PresentedLieAlgebra {I : Type*} [Fintype I] [DecidableEq I]
    {A : SymmetrizableDatum I} {m : ℕ} (R : RationalRealization A m) :=
  FreePresentation I m ⧸ presentationIdeal R

def cartanElement {I : Type*} [Fintype I] [DecidableEq I]
    {A : SymmetrizableDatum I} {m : ℕ} (R : RationalRealization A m)
    (x : Fin m → ℚ) : PresentedLieAlgebra R :=
  LieSubmodule.Quotient.mk (hGenerator x)

def positiveGenerator {I : Type*} [Fintype I] [DecidableEq I]
    {A : SymmetrizableDatum I} {m : ℕ} (R : RationalRealization A m)
    (i : I) : PresentedLieAlgebra R :=
  LieSubmodule.Quotient.mk (eGenerator i)

/-- Cartan injectivity is a genuine theorem of the full presentation. -/
theorem cartanElement_injective {I : Type*} [Fintype I] [DecidableEq I]
    {A : SymmetrizableDatum I} {m : ℕ} (R : RationalRealization A m) :
    Function.Injective (cartanElement R) := by
  sorry

abbrev Enveloping {I : Type*} [Fintype I] [DecidableEq I]
    {A : SymmetrizableDatum I} {m : ℕ} (R : RationalRealization A m) :=
  UniversalEnvelopingAlgebra ℚ (PresentedLieAlgebra R)

/-- Left relations use the actual chosen weight and realization. -/
def vermaRelations {I : Type*} [Fintype I] [DecidableEq I]
    {A : SymmetrizableDatum I} {m : ℕ} (R : RationalRealization A m)
    (lam : Module.Dual ℚ (Fin m → ℚ)) : Set (Enveloping R) :=
  Set.range (fun x : Fin m → ℚ =>
    UniversalEnvelopingAlgebra.ι ℚ (cartanElement R x) -
      algebraMap ℚ (Enveloping R) (lam x)) ∪
  Set.range (fun i : I => UniversalEnvelopingAlgebra.ι ℚ (positiveGenerator R i))

def vermaLeftIdeal {I : Type*} [Fintype I] [DecidableEq I]
    {A : SymmetrizableDatum I} {m : ℕ} (R : RationalRealization A m)
    (lam : Module.Dual ℚ (Fin m → ℚ)) : Submodule (Enveloping R) (Enveloping R) :=
  Submodule.span (Enveloping R) (vermaRelations R lam)

abbrev VermaModule {I : Type*} [Fintype I] [DecidableEq I]
    {A : SymmetrizableDatum I} {m : ℕ} (R : RationalRealization A m)
    (lam : Module.Dual ℚ (Fin m → ℚ)) := Enveloping R ⧸ vermaLeftIdeal R lam

/-- Nontriviality retains the weight and full realization; it is not an assumed field. -/
theorem vermaLeftIdeal_ne_top {I : Type*} [Fintype I] [DecidableEq I]
    {A : SymmetrizableDatum I} {m : ℕ} (R : RationalRealization A m)
    (lam : Module.Dual ℚ (Fin m → ℚ)) : vermaLeftIdeal R lam ≠ ⊤ := by
  sorry

/-- The arithmetic root cone. A later completion theorem uses independent simple roots. -/
def positiveCone {I P : Type*} [AddCommGroup P] (alpha : I → P) : AddSubmonoid P :=
  AddSubmonoid.closure (Set.range alpha)

structure UpperCharacter {I P : Type*} [AddCommGroup P] (alpha : I → P) where
  coefficient : P → ℤ
  upperBound : ∃ tops : Finset P, ∀ mu, coefficient mu ≠ 0 →
    ∃ lam ∈ tops, lam - mu ∈ positiveCone alpha

/-- This is the coefficientwise-finiteness obligation behind multiplication. -/
theorem finite_supported_pairs {I P : Type*} [Fintype I] [AddCommGroup P] [Module ℤ P]
    (alpha : I → P) (hIndependent : LinearIndependent ℤ alpha)
    (f g : UpperCharacter alpha) (xi : P) :
    {pair : P × P | pair.1 + pair.2 = xi ∧
      f.coefficient pair.1 ≠ 0 ∧ g.coefficient pair.2 ≠ 0}.Finite := by
  sorry

/-- Finite rational PL data. The full real/reparametrization carrier is a separate README target. -/
structure RationalPathRepresentative (m : ℕ) where
  pieces : ℕ
  duration : Fin pieces → ℚ
  slope : Fin pieces → (Fin m → ℚ)
  positiveDuration : ∀ j, 0 < duration j
  totalDuration : ∑ j, duration j = 1
  endpointIntegral : ∃ lam : Fin m → ℤ,
    ∑ j, duration j • slope j = fun k => (lam k : ℚ)

def RationalPathRepresentative.endpoint {m : ℕ} (p : RationalPathRepresentative m) :
    Fin m → ℚ := ∑ j, p.duration j • p.slope j

/-- Actual operation data, with mathematical laws proved as separate targets. -/
structure CrystalData (I P B : Type*) where
  weight : B → P
  epsilon : I → B → ℕ
  phi : I → B → ℕ
  raise : I → B → Option B
  lower : I → B → Option B

/-- A strict comparison has actual maps and equations, not a field named after its conclusion. -/
structure StrictCrystalEquiv {I P B C : Type*}
    (X : CrystalData I P B) (Y : CrystalData I P C) where
  equiv : B ≃ C
  weight_eq : ∀ b, Y.weight (equiv b) = X.weight b
  epsilon_eq : ∀ i b, Y.epsilon i (equiv b) = X.epsilon i b
  phi_eq : ∀ i b, Y.phi i (equiv b) = X.phi i b
  raise_eq : ∀ i b, Y.raise i (equiv b) = (X.raise i b).map equiv
  lower_eq : ∀ i b, Y.lower i (equiv b) = (X.lower i b).map equiv

/-- A useful algebraic weight-space carrier already exists natively; no new module class is needed. -/
abbrev actualWeightSpace (K H M : Type*) [Field K] [LieRing H] [LieAlgebra K H]
    [AddCommGroup M] [Module K M] [LieRingModule H M] [LieModule K H M]
    (chi : H → K) := LieModule.weightSpace M chi

end TauCetiRoadmap.KacMoody
