import Mathlib
import TauCetiRoadmap.GlobalNumberFields.Suggested
import TauCetiRoadmap.NumberFieldArithmetic.Suggested
import TauCetiRoadmap.ClassFieldTheory.Suggested
import TauCetiRoadmap.QuadraticFormInvariants.Suggested

/-!
# Global quadratic forms over number fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These declarations suggest carriers and signatures for the milestones whose shape is
load-bearing. Discharging every statement in this file does not finish the roadmap.

The four imported roadmap files are genuine suppliers. Nothing below replaces weak approximation,
the completion dictionary, the Hasse norm theorem, Hilbert reciprocity, or local quadratic-form
classification by an arbitrary interface. In particular every localization is an actual
`QuadraticForm.baseChange`.

This consumer uses four frozen supplier names:

* `GlobalNumberFields.weakApproximation_denseRange`;
* `NumberFieldArithmetic.isNonarchimedeanLocalField_adicCompletion`;
* `ClassFieldTheory.cyclicHasseNorm` and its local-norm spelling
  `ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere`;
* `ClassFieldTheory.hilbertProductFormula`.

The supplier roadmaps own the declarations and this file consumes them. The local quadratic-form
side is `QuadraticFormInvariants.localHasse`, `exists_of_realization`, and the exact Layer 6D
classification contract recorded in `README.md`.

Statements use `sorry`, which is allowed in this human-owned roadmap library. There is no
`Prop := sorry` placeholder and no free family of purported localizations.
-/

namespace TauCetiRoadmap.GlobalQuadraticForms

open IsDedekindDomain NumberField QuadraticMap
open scoped TensorProduct

universe u v

/-! ## Supplier-name checks

These checks intentionally make a supplier rename visible to this roadmap. The mathematical
signature checks belong beside the supplier declarations once all four prerequisite roadmaps are
on the same branch. -/

#check TauCetiRoadmap.GlobalNumberFields.weakApproximation_denseRange
#check TauCetiRoadmap.NumberFieldArithmetic.isNonarchimedeanLocalField_adicCompletion
#check TauCetiRoadmap.ClassFieldTheory.cyclicHasseNorm
#check TauCetiRoadmap.ClassFieldTheory.IsFiniteLocalNorm
#check TauCetiRoadmap.ClassFieldTheory.IsInfiniteLocalNorm
#check TauCetiRoadmap.ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere
#check TauCetiRoadmap.ClassFieldTheory.hilbertProductFormula

example {K L : Type} [Field K] [NumberField K] [Field L] [NumberField L]
    [Algebra K L] [Module.Finite K L] [IsGalois K L] [IsCyclic (L ≃ₐ[K] L)]
    (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      TauCetiRoadmap.ClassFieldTheory.IsLocalNormEverywhere K L x :=
  TauCetiRoadmap.ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere K L x

/-- Closed consumer check for the completion-level Hasse norm contract. In particular this starts
from one norm hypothesis at every finite and infinite completion, not from an idelic range
hypothesis. -/
example {K L : Type} [Field K] [NumberField K] [Field L] [NumberField L]
    [Algebra K L] [Module.Finite K L] [IsGalois K L] [IsCyclic (L ≃ₐ[K] L)]
    (x : Kˣ)
    (hfinite : ∀ v : HeightOneSpectrum (𝓞 K),
      TauCetiRoadmap.ClassFieldTheory.IsFiniteLocalNorm K L v x)
    (hinfinite : ∀ w : InfinitePlace K,
      TauCetiRoadmap.ClassFieldTheory.IsInfiniteLocalNorm K L w x) :
    ∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x := by
  apply
    (TauCetiRoadmap.ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere K L x).2
  exact ⟨hfinite, hinfinite⟩

/-! ## Layer 0: canonical localization -/

section Localization

variable {K : Type u} [Field K] [NumberField K]
  {V : Type v} [AddCommGroup V] [Module K V]

/-- **0.1, localization at a finite place.** This is the actual base change to Mathlib's
completion and not a field of an interface structure. -/
noncomputable def atFinitePlace (Q : QuadraticForm K V)
    (v : HeightOneSpectrum (𝓞 K)) :
    QuadraticForm (v.adicCompletion K) (v.adicCompletion K ⊗[K] V) :=
  Q.baseChange (v.adicCompletion K)

/-- **0.1, localization at a real place.** The real algebra structure is the one induced by the
chosen representative attached to `w`. -/
noncomputable def atRealPlace (Q : QuadraticForm K V)
    (w : {w : InfinitePlace K // w.IsReal}) :
    letI := (InfinitePlace.embedding_of_isReal w.2).toAlgebra
    QuadraticForm ℝ (ℝ ⊗[K] V) :=
  letI := (InfinitePlace.embedding_of_isReal w.2).toAlgebra
  Q.baseChange ℝ

/-- **0.2, local isotropy.** Complex places are omitted only because
`not_anisotropic_complex` proves their clause automatic in rank at least two. -/
def IsLocallyIsotropic (Q : QuadraticForm K V) : Prop :=
  (∀ v : HeightOneSpectrum (𝓞 K), ¬ (atFinitePlace Q v).Anisotropic) ∧
    ∀ w : {w : InfinitePlace K // w.IsReal}, ¬ (atRealPlace Q w).Anisotropic

/-- **0.2, local equivalence.** Both finite and real places are load-bearing. -/
def LocallyEquivalent {W : Type v} [AddCommGroup W] [Module K W]
    (Q : QuadraticForm K V) (R : QuadraticForm K W) : Prop :=
  (∀ v : HeightOneSpectrum (𝓞 K),
      (atFinitePlace Q v).Equivalent (atFinitePlace R v)) ∧
    ∀ w : {w : InfinitePlace K // w.IsReal},
      (atRealPlace Q w).Equivalent (atRealPlace R w)

/-- **0.2, scalar representation at every finite and real place.** The scalar is nonzero in the
headline theorem; zero representation is a separate trivial statement. -/
def LocallyRepresentsScalar (Q : QuadraticForm K V) (a : K) : Prop :=
  (∀ v : HeightOneSpectrum (𝓞 K),
      ∃ x, atFinitePlace Q v x = algebraMap K (v.adicCompletion K) a) ∧
    ∀ w : {w : InfinitePlace K // w.IsReal},
      ∃ x, atRealPlace Q w x = InfinitePlace.embedding_of_isReal w.2 a

/-- **0.3, complex-place automaticity for isotropy.** Rank one is deliberately excluded. -/
theorem not_anisotropic_complex {W : Type v} [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (Q : QuadraticForm ℂ W) (hQ : Q.Nondegenerate)
    (h : 2 ≤ Module.finrank ℂ W) : ¬ Q.Anisotropic :=
  sorry

/-- **0.3, complex-place classification.** Rank is the only invariant over `ℂ`. -/
theorem equivalent_of_finrank_eq_complex {W₁ W₂ : Type v}
    [AddCommGroup W₁] [Module ℂ W₁] [FiniteDimensional ℂ W₁]
    [AddCommGroup W₂] [Module ℂ W₂] [FiniteDimensional ℂ W₂]
    (Q : QuadraticForm ℂ W₁) (R : QuadraticForm ℂ W₂)
    (hQ : Q.Nondegenerate) (hR : R.Nondegenerate)
    (h : Module.finrank ℂ W₁ = Module.finrank ℂ W₂) :
    Q.Equivalent R :=
  sorry

end Localization

/-! ## Layers 1–3: the global invariant carrier

The square-class quotient is the supplier's existing carrier. A global discriminant is stored
once in `Kˣ/(Kˣ)²`; it is not an arbitrary discriminant at every completion. -/

section Invariants

variable (K : Type u) [Field K] [NumberField K]

abbrev SquareClass := Kˣ ⧸ Subgroup.square Kˣ

/-- Base change of a global square class to a finite completion. The implementation is induced by
the algebra map on units. -/
noncomputable def localizeSquareClass (v : HeightOneSpectrum (𝓞 K)) :
    SquareClass K → SquareClass (v.adicCompletion K) :=
  sorry

/-- The sign of a square class at a real place. Multiplying a representative by a square does not
change its sign. -/
noncomputable def realSquareClassSign
    (w : {w : InfinitePlace K // w.IsReal}) : SquareClass K → ℤˣ :=
  sorry

/-- The Hasse sign of a real signature with positive index `p` and rank `n`, in the
`∏_{i<j}` convention. -/
def realHasseSign (n p : ℕ) : ℤˣ :=
  (-1) ^ ((n - p) * (n - p - 1) / 2)

/-- **3.1, the global invariant carrier.** `finiteHasse` is required to have finite support by
`IsAdmissible`; it is not stored as a finitely supported function because consumers evaluate it
at arbitrary places. -/
structure GlobalFormInvariants where
  rank : ℕ
  discr : SquareClass K
  finiteHasse : HeightOneSpectrum (𝓞 K) → ℤˣ
  realPositiveIndex : {w : InfinitePlace K // w.IsReal} → ℕ

/-- **3.2, the finite product relation.** The existential support makes the definition
proof-independent. Enlarging `S` by places with sign `1` leaves the displayed product unchanged. -/
def GlobalFormInvariants.HasseProductCompatible (I : GlobalFormInvariants K) : Prop :=
  letI : Fintype {w : InfinitePlace K // w.IsReal} := Fintype.ofFinite _
  ∃ S : Finset (HeightOneSpectrum (𝓞 K)),
    (∀ v, v ∉ S → I.finiteHasse v = 1) ∧
      (∏ v ∈ S, I.finiteHasse v) *
        ∏ w : {w : InfinitePlace K // w.IsReal},
          realHasseSign I.rank (I.realPositiveIndex w) = 1

/-- **3.2, admissibility.** The two small-rank fields are exactly the exceptions in
`QuadraticFormInvariants.exists_of_realization`; finite support and product one alone are not
enough. -/
structure GlobalFormInvariants.IsAdmissible (I : GlobalFormInvariants K) : Prop where
  rank_pos : 1 ≤ I.rank
  real_index_le : ∀ w, I.realPositiveIndex w ≤ I.rank
  real_discr_sign : ∀ w,
    realSquareClassSign K w I.discr =
      if Even (I.rank - I.realPositiveIndex w) then 1 else -1
  finiteSupport : {v | I.finiteHasse v ≠ 1}.Finite
  rank_one : I.rank = 1 → ∀ v, I.finiteHasse v = 1
  rank_two : I.rank = 2 → ∀ v,
    localizeSquareClass K v I.discr =
        QuotientGroup.mk (-1 : (v.adicCompletion K)ˣ) →
      I.finiteHasse v = 1
  productCompatibility : I.HasseProductCompatible

variable {K}

/-- **3.3, invariants of a global form.** The implementation computes from one diagonalization,
and proves independence from it using the supplier's descent lemmas. -/
noncomputable def globalInvariants {V : Type v} [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    GlobalFormInvariants K :=
  sorry

/-- **3.3, necessity of every admissibility condition.** In particular the proof of
`productCompatibility` is coefficientwise Hilbert reciprocity. -/
theorem globalInvariants_isAdmissible {V : Type v} [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (hrank : 1 ≤ Module.finrank K V) :
    (globalInvariants Q hQ).IsAdmissible :=
  sorry

end Invariants

/-! ## Layers 5–6: Hasse–Minkowski, representation, and isometry -/

section HasseMinkowski

variable {K : Type u} [Field K] [NumberField K]
  {V : Type v} [AddCommGroup V] [Module K V]

/-- **5.5, Hasse–Minkowski isotropy** (O'Meara 66:1), over an arbitrary number field.

The proof is split into binary, ternary, quaternary, and rank-at-least-five cases. In the final
case weak approximation chooses a vector in a binary summand and its scalar value is defined
afterward. -/
theorem hasseMinkowski_isotropic [FiniteDimensional K V]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    ¬ Q.Anisotropic ↔ IsLocallyIsotropic Q :=
  sorry

/-- **6.1, scalar representation.** -/
theorem represents_iff_locallyRepresents [FiniteDimensional K V]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) (a : K) (ha : a ≠ 0) :
    (∃ x : V, Q x = a) ↔ LocallyRepresentsScalar Q a :=
  sorry

/-- **6.2, representation of forms** (O'Meara 66:3). -/
theorem represented_iff_locallyRepresented [FiniteDimensional K V]
    {W : Type v} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate) :
    (∃ f : V →ₗ[K] W, Function.Injective f ∧ ∀ x, R (f x) = Q x) ↔
      ((∀ v : HeightOneSpectrum (𝓞 K),
          ∃ f : _ →ₗ[v.adicCompletion K] _, Function.Injective f ∧
            ∀ x, atFinitePlace R v (f x) = atFinitePlace Q v x) ∧
        ∀ w : {w : InfinitePlace K // w.IsReal},
          letI := (InfinitePlace.embedding_of_isReal w.2).toAlgebra
          ∃ f : _ →ₗ[ℝ] _, Function.Injective f ∧
            ∀ x, atRealPlace R w (f x) = atRealPlace Q w x) :=
  sorry

/-- **6.3, Hasse–Minkowski isometry** (O'Meara 66:4). Suggested implementation name:
`TauCeti.NumberField.QuadraticForm.hasseMinkowski_equivalent`. -/
theorem hasseMinkowski_equivalent [FiniteDimensional K V]
    {W : Type v} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate) :
    Q.Equivalent R ↔ LocallyEquivalent Q R :=
  sorry

end HasseMinkowski

/-! ## Layers 7–8: global existence and classification -/

section Existence

variable {K : Type u} [Field K] [NumberField K]

/-- **7.3, existence from an admissible invariant system** (O'Meara 72:1). The form is placed on
the canonical coordinate space of its prescribed rank; the theorem also returns regularity and
equality of the complete invariant records. -/
theorem exists_globalForm_of_isAdmissible (I : GlobalFormInvariants K)
    (hI : I.IsAdmissible) :
    ∃ Q : QuadraticForm K (Fin I.rank → K),
      ∃ hQ : Q.Nondegenerate, globalInvariants Q hQ = I :=
  sorry

/-- **7.4, uniqueness of a global realization.** -/
theorem equivalent_of_globalInvariants_eq
    {V W : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate)
    (h : globalInvariants Q hQ = globalInvariants R hR) :
    Q.Equivalent R :=
  sorry

/-- **8.1, complete global classification.** Equality of dimension, global discriminant, every
real signature, and every finite Hasse invariant is both necessary and sufficient. -/
theorem equivalent_iff_globalInvariants_eq
    {V W : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate) :
    Q.Equivalent R ↔ globalInvariants Q hQ = globalInvariants R hR :=
  sorry

/-- **8.4, the form-theoretic consequence consumed by Orthogonal and Spin Groups.** That roadmap
owns the translation from twists to `H¹(K,SO(Q))`; no nonabelian cohomology is defined here. -/
theorem equivalent_of_locallyEquivalent
    {V W : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate)
    (h : LocallyEquivalent Q R) :
    Q.Equivalent R :=
  (hasseMinkowski_equivalent Q hQ R hR).2 h

end Existence

/-! ## Closed consumer shape at `K = ℚ` -/

section RationalConsumer

/-- Orthogonal and Spin Groups consumes exactly this specialization. -/
example {V W : Type} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
    [AddCommGroup W] [Module ℚ W] [FiniteDimensional ℚ W]
    (Q : QuadraticForm ℚ V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm ℚ W) (hR : R.Nondegenerate)
    (h : LocallyEquivalent Q R) :
    Q.Equivalent R :=
  equivalent_of_locallyEquivalent Q hQ R hR h

end RationalConsumer

end TauCetiRoadmap.GlobalQuadraticForms
