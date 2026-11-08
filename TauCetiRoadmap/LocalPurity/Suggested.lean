import Mathlib
import TauCeti.RingTheory.RegularLocalRing.Basic

/-!
# Finite étale covers of punctured spectra and local purity: suggested forms

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Every statement is in Mathlib's and Tau Ceti's vocabulary (README, Convention 2). Declarations
with a Stacks Project counterpart carry Mathlib's `@[stacks]` attribute; those without one say
why.

Finite étale schemes over `X` are written as Mathlib's `(@IsFinite ⊓ @Etale).Over ⊤ X`, which is
equivalent to the README's carrier `TauCeti.FiniteEtaleScheme X`. Conditions whose Mathlib API
does not exist at the pinned version (depth, Cohen–Macaulay) are not stated here; their targets
are in the README.
-/

universe u

namespace TauCetiRoadmap.LocalPurity

noncomputable section

open AlgebraicGeometry CategoryTheory IsLocalRing

/-! ## Layer 0: commutative algebra inputs -/

section Layer0

/-- A finite injective local homomorphism from a two-dimensional regular local ring to a normal
local domain is flat. The case of Stacks, Lemma 10.128.1 (00R4) used for 58.21.3 (0BMA) in
dimension two; no tag of its own. -/
theorem flat_of_normal_dim_two (A B : Type u) [CommRing A] [CommRing B] [Algebra A B]
    [IsRegularLocalRing A] [IsLocalRing B] [IsDomain B] [IsIntegrallyClosed B] [Module.Finite A B]
    (hinj : Function.Injective (algebraMap A B)) (hdim : ringKrullDim A = 2) :
    Module.Flat A B := by
  sorry

/-- A finite-dimensional algebra over a field is étale iff its trace form is nondegenerate. The
fibre case in the proof of Stacks, Lemma 49.3.1 (0BJF). -/
@[stacks 0BJF "the case of a field"]
theorem etale_iff_traceForm_nondegenerate (K B : Type u) [Field K] [CommRing B] [Algebra K B]
    [FiniteDimensional K B] :
    Algebra.Etale K B ↔ (Algebra.traceForm K B).Nondegenerate := by
  sorry

/-- **The discriminant criterion.** A finite free algebra over a local ring is étale iff the
discriminant of a basis is a unit. Stacks, Lemma 49.3.1 (0BJF), affine form over a local base. -/
@[stacks 0BJF "affine form over a local base"]
theorem etale_iff_isUnit_discr (A B : Type u) [CommRing A] [IsLocalRing A] [CommRing B]
    [Algebra A B] {ι : Type} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι A B) :
    Algebra.Etale A B ↔ IsUnit (Algebra.discr A b) := by
  sorry

end Layer0

/-! ## Layer 1: finite étale covers of punctured spectra -/

/-- The morphism property "finite and étale". No tag of its own; Stacks, Section 58.5 (0BL6) uses
it to define `FÉt_X`. -/
abbrev finiteEtale : MorphismProperty Scheme.{u} := @IsFinite ⊓ @Etale

/-- Schemes finite étale over `X`: Stacks' `FÉt_X` (Section 58.5 (0BL6)), equivalent to Tau Ceti's
`TauCeti.FiniteEtaleScheme X`. -/
@[stacks 0BL6 "the category FÉt_X"]
abbrev FEt (X : Scheme.{u}) : Type (u + 1) :=
  finiteEtale.Over ⊤ X

/-- Pullback of finite étale schemes along a morphism: the base change functor of Stacks, Lemma
58.5.2 (0BN9). -/
@[stacks 0BN9 "the base change functor"]
def FEt.pullback {X Y : Scheme.{u}} (f : Y ⟶ X) : FEt X ⥤ FEt Y := by
  letI : finiteEtale.IsStableUnderBaseChange :=
    MorphismProperty.IsStableUnderBaseChange.inf
  exact MorphismProperty.Over.pullback finiteEtale ⊤ f

section Layer1

variable (A : Type u) [CommRing A] [IsLocalRing A]

/-- The punctured spectrum of a local ring. Stacks, Section 58.20 (0BM7), first paragraph. -/
@[stacks 0BM7 "the punctured spectrum"]
def puncturedSpectrum : (Spec (.of A)).Opens where
  carrier := {closedPoint A}ᶜ
  is_open' := (isClosed_singleton_closedPoint (R := A)).isOpen_compl

/-- **Purity holds** for `A`: restriction of finite étale schemes to the punctured spectrum is
essentially surjective. Stacks, Section 58.20 (0BM7), the definition in the first paragraph;
Stacks assumes `A` Noetherian, and every statement using the definition does. -/
@[stacks 0BM7 "definition of purity"]
def PurityHolds : Prop :=
  (FEt.pullback (puncturedSpectrum A).ι).EssSurj

end Layer1

/-! ## Layer 2: local purity and extension -/

section Layer2

/-- **Purity for a regular local ring**, clause (1). Stacks, Lemma 58.21.3 (0BMA), (1). -/
@[stacks 0BMA "(1)"]
theorem purityHolds_of_isRegularLocalRing (A : Type u) [CommRing A] [IsRegularLocalRing A]
    (hd : 2 ≤ ringKrullDim A) : PurityHolds A := by
  sorry

/-- **Purity for a regular local ring**, clause (2), corrected and in affine form. Stacks, Lemma
58.21.3 (0BMA), (2), with "`B` torsion free over `A`" added (README, Convention 5): without it
`B = A × A/𝔪` is a counterexample. "Normal" is README Convention 3; "étale over the punctured
spectrum" is étaleness at every prime of `B` not lying over `𝔪`. -/
@[stacks 0BMA "(2), with B torsion free over A added"]
theorem etale_of_finiteNormal_of_isRegularLocalRing (A B : Type u) [CommRing A] [CommRing B]
    [Algebra A B] [IsRegularLocalRing A] (hd : 2 ≤ ringKrullDim A) [Module.Finite A B]
    [Module.IsTorsionFree A B]
    (hnormal : ∀ (p : Ideal B) [p.IsPrime],
      IsDomain (Localization.AtPrime p) ∧ IsIntegrallyClosed (Localization.AtPrime p))
    (hpunct : ∀ (q : Ideal B) [q.IsPrime], q.under A ≠ maximalIdeal A → Algebra.IsEtaleAt A q) :
    Algebra.Etale A B := by
  sorry

/-- The counterexample of README, Convention 5: `A × A/𝔪` is finite, normal and étale over the
punctured spectrum of a regular local ring of dimension `≥ 2`, and not flat over `A`. No tag. -/
theorem not_flat_prod_residueField (A : Type u) [CommRing A] [IsRegularLocalRing A]
    (hd : 2 ≤ ringKrullDim A) : ¬ Module.Flat A (A × ResidueField A) := by
  sorry

/-- **Extension across points where purity holds.** Stacks, Lemma 58.21.6 (0EY7): for an open `U`
of a Noetherian scheme with purity at every stalk off `U`, restriction of finite étale schemes to
`U` is essentially surjective. -/
@[stacks 0EY7]
theorem finiteEtale_extend_of_purity {X : Scheme.{u}} [IsNoetherian X] (U : X.Opens)
    (h : ∀ x : X, x ∉ U → PurityHolds (X.presheaf.stalk x)) :
    (FEt.pullback U.ι).EssSurj := by
  sorry

end Layer2

end

end TauCetiRoadmap.LocalPurity
