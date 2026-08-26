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

This consumer uses five frozen supplier names:

* `GlobalNumberFields.weakApproximation_denseRange`;
* `NumberFieldArithmetic.isNonarchimedeanLocalField_adicCompletion`;
* `ClassFieldTheory.cyclicHasseNorm` and its local-norm spelling
  `ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere`;
* `ClassFieldTheory.hilbertProductFormula`;
* `ClassFieldTheory.card_ideleClassNormQuotient`, the idele-class norm index, which is the single
  global input of the global square theorem and of Hilbert sign prescription.

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
#check TauCetiRoadmap.GlobalNumberFields.IdeleGroup
#check TauCetiRoadmap.GlobalNumberFields.IdeleClassGroup
#check TauCetiRoadmap.NumberFieldArithmetic.isNonarchimedeanLocalField_adicCompletion
#check TauCetiRoadmap.NumberFieldArithmetic.completionAlgHom
#check TauCetiRoadmap.ClassFieldTheory.cyclicHasseNorm
#check TauCetiRoadmap.ClassFieldTheory.IsFiniteLocalNorm
#check TauCetiRoadmap.ClassFieldTheory.IsInfiniteLocalNorm
#check TauCetiRoadmap.ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere
#check TauCetiRoadmap.ClassFieldTheory.hilbertProductFormula
#check TauCetiRoadmap.ClassFieldTheory.principalIdele
#check TauCetiRoadmap.ClassFieldTheory.ideleNormMap
#check TauCetiRoadmap.ClassFieldTheory.ideleClassNorm
#check TauCetiRoadmap.QuadraticFormInvariants.hilbertSymbol
#check TauCetiRoadmap.QuadraticFormInvariants.hilbertSymbol_neg_self
#check TauCetiRoadmap.QuadraticFormInvariants.hilbertSymbol_mul
#check TauCetiRoadmap.QuadraticFormInvariants.exists_hilbertSymbol_eq_neg_one

-- The global input of Layers 4.2 and 4.4, cited by name: for a finite abelian extension the
-- idele-class norm subgroup has index `[L:K]`. Neither Hilbert reciprocity nor the global
-- existence theorem replaces it.
#check @TauCetiRoadmap.ClassFieldTheory.card_ideleClassNormQuotient

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

/-- The image of a global unit in the completion at a finite place, along Mathlib's own algebra
map. No tower map is involved: `completionAlgHom` is a map of a genuine tower `K_v → L_w`, and a
place of `K` is not a tower. -/
noncomputable def unitAtFinitePlace (v : HeightOneSpectrum (𝓞 K)) (a : Kˣ) :
    (v.adicCompletion K)ˣ :=
  Units.map (algebraMap K (v.adicCompletion K)).toMonoidHom a

/-- The image of a global unit in the real completion at a real place. -/
noncomputable def unitAtRealPlace (w : {w : InfinitePlace K // w.IsReal}) (a : Kˣ) : ℝˣ :=
  Units.map (InfinitePlace.embedding_of_isReal w.2).toMonoidHom a

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

/-! ## Layer 4: the global square theorem and Hilbert sign prescription

Both theorems below have exactly one global input, `ClassFieldTheory.card_ideleClassNormQuotient`,
applied to the quadratic extension `K(√·)`. Hilbert reciprocity supplies the necessary parity
condition and nothing more; global existence and global reciprocity do not produce a place with
prescribed splitting behaviour, and neither theorem below asks for one. -/

section GlobalArithmetic

open TauCetiRoadmap.QuadraticFormInvariants (hilbertSymbol)

variable {K : Type u} [Field K] [NumberField K]

/-- **4.2, the global square theorem** (O'Meara 65:15). A unit that is a square in all but
finitely many finite completions is a square in `K`. There is no archimedean hypothesis: the
archimedean places are finite in number, so they are already covered by `S`.

The pinned proof is the norm-index argument: if `a` is a nonsquare then every idele is, after
weak approximation on `S` and the archimedean places, a principal idele times an idele norm from
`K(√a)`, so `C_K = N C_{K(√a)}`, contradicting
`ClassFieldTheory.card_ideleClassNormQuotient`. -/
theorem isSquare_of_isSquare_unitAtFinitePlace_of_notMem
    (a : Kˣ) (S : Finset (HeightOneSpectrum (𝓞 K)))
    (h : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S → IsSquare (unitAtFinitePlace v a)) :
    IsSquare a :=
  sorry

/-- **4.2, the all-place corollary**, which is the form the binary case of 5.1 consumes. It is a
corollary and not a second theorem: the exceptional set is empty. -/
theorem isSquare_of_isSquare_unitAtFinitePlace
    (a : Kˣ) (h : ∀ v : HeightOneSpectrum (𝓞 K), IsSquare (unitAtFinitePlace v a)) :
    IsSquare a :=
  isSquare_of_isSquare_unitAtFinitePlace_of_notMem a ∅ fun v _ => h v

/-- **4.4, the symbol at a real place.** Quadratic Form Invariants is nonarchimedean, so the
archimedean values of its norm-equation symbol are computed here. Symmetry and bimultiplicativity
at a real place follow from this formula; they are not instances of
`QuadraticFormInvariants.hilbertSymbol_comm` or `hilbertSymbol_mul`, both of which carry
`IsNonarchimedeanLocalField`. -/
theorem hilbertSymbol_real (a b : ℝˣ) :
    hilbertSymbol a b = if (a : ℝ) < 0 ∧ (b : ℝ) < 0 then -1 else 1 :=
  sorry

/-- **4.4, the symbol at a complex place.** -/
theorem hilbertSymbol_complex (a b : ℂˣ) : hilbertSymbol a b = 1 :=
  sorry

/-- **4.4, finite support of the localized symbol**, proved from `hilbertSymbol_unramified`
outside the dyadic places and the places where `a` or `b` fails to be a unit. -/
theorem finite_hilbertSymbol_ne_one (a b : Kˣ) :
    {v : HeightOneSpectrum (𝓞 K) |
      hilbertSymbol (unitAtFinitePlace v a) (unitAtFinitePlace v b) ≠ 1}.Finite :=
  sorry

/-- **4.4, the localized product formula.** The multiplicative form of Hilbert reciprocity,
written with the norm-equation symbol read over each completion rather than with Class Field
Theory's cohomological invariants; the translation is
`QuadraticFormInvariants.hilbertSymbol_eq_cohomological` at the finite places and
`hilbertSymbol_real`, `hilbertSymbol_complex` at the archimedean ones. Complex places contribute
`1`, so only the real ones appear. -/
theorem hilbertSymbol_localized_productFormula (a b : Kˣ)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hS : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      hilbertSymbol (unitAtFinitePlace v a) (unitAtFinitePlace v b) = 1) :
    letI : Fintype {w : InfinitePlace K // w.IsReal} := Fintype.ofFinite _
    (∏ v ∈ S, hilbertSymbol (unitAtFinitePlace v a) (unitAtFinitePlace v b)) *
        ∏ w : {w : InfinitePlace K // w.IsReal},
          hilbertSymbol (unitAtRealPlace w a) (unitAtRealPlace w b) = 1 :=
  sorry

/-- **4.4, Hilbert sign prescription with a prescribed second argument** (O'Meara 71:19a). The
prescribed set is a finite set of finite and real places of even total cardinality, and `b` is
required to be a nonsquare at each of them; complex places carry no sign and are excluded by the
statement rather than by a hypothesis.

⚠ This is an existence theorem, and `ClassFieldTheory.hilbertProductFormula` does not prove it.
The product formula says that the sign family of a *given* pair has even support. The proof here
computes the kernel of `i ↦ ∏_v (i_v, b_v)_v` on the idele group: reciprocity puts `Kˣ` in that
kernel, the placewise description of `ideleNormMap` puts the idele norms in it, and
`card_ideleClassNormQuotient` says that the resulting subgroup already has index two, so the
inclusion is an equality. -/
theorem exists_hilbertSymbol_eq_neg_one_iff
    (b : Kˣ)
    (Tf : Finset (HeightOneSpectrum (𝓞 K)))
    (Tr : Finset {w : InfinitePlace K // w.IsReal})
    (hpar : Even (Tf.card + Tr.card))
    (hbf : ∀ v ∈ Tf, ¬ IsSquare (unitAtFinitePlace v b))
    (hbr : ∀ w ∈ Tr, ¬ IsSquare (unitAtRealPlace w b)) :
    ∃ a : Kˣ,
      (∀ v : HeightOneSpectrum (𝓞 K),
          hilbertSymbol (unitAtFinitePlace v a) (unitAtFinitePlace v b) = -1 ↔ v ∈ Tf) ∧
        ∀ w : {w : InfinitePlace K // w.IsReal},
          hilbertSymbol (unitAtRealPlace w a) (unitAtRealPlace w b) = -1 ↔ w ∈ Tr :=
  sorry

/-- **4.4, Hilbert sign prescription without a prescribed second argument** (O'Meara 71:19). The
second argument is produced by weak approximation: an element that is a uniformizer at each finite
place of the set and negative at each real place of it is a nonsquare there. -/
theorem exists_hilbertSymbol_eq_neg_one_iff_pair
    (Tf : Finset (HeightOneSpectrum (𝓞 K)))
    (Tr : Finset {w : InfinitePlace K // w.IsReal})
    (hpar : Even (Tf.card + Tr.card)) :
    ∃ a b : Kˣ,
      (∀ v : HeightOneSpectrum (𝓞 K),
          hilbertSymbol (unitAtFinitePlace v a) (unitAtFinitePlace v b) = -1 ↔ v ∈ Tf) ∧
        ∀ w : {w : InfinitePlace K // w.IsReal},
          hilbertSymbol (unitAtRealPlace w a) (unitAtRealPlace w b) = -1 ↔ w ∈ Tr :=
  sorry

end GlobalArithmetic

/-! ## Layers 5–6: Hasse–Minkowski, representation, and isometry -/

section QuaternaryDescent

open TauCetiRoadmap.QuadraticFormInvariants (formClass discr)

/-- **5.1, quaternary descent** (O'Meara 58:7). This is the field-generic lemma the quaternary
case of Hasse–Minkowski descends along, and it is not an instance of any scalar-extension
formalism: the conclusion is isotropy over the base field.

Every hypothesis is load-bearing.

* `hQ` — regularity, which is what makes the residual plane of the proof regular, so that
  discriminant `[-1]` forces it to be hyperbolic;
* `hdim` — dimension **exactly four**, used in the discriminant computation. Binary witness that
  it cannot be weakened: over `F = ℚ(i)` the form `⟨1,2⟩` is anisotropic, since `-2` is not a
  square in `ℚ(i)`, and it becomes isotropic over `F(√2)`, since `-2 = (i√2)²`;
* `hd` — `d` represents the **plain** discriminant of the conventions, not the signed one, which
  differs by `-1` in dimension four;
* `hdsq`, `hdeg`, `hs`, `hgen` — `E` is the quadratic **field** `F(√d)`, pinned by its degree and
  by a named generating square root. The bare hypothesis that some square root of `d` lies in `E`
  does not pin `E`: it also holds for `E = F(√d, √e)`, of degree four. When `d` is a square the
  statement is the trivial one with `E = F` and is not covered here. -/
theorem not_anisotropic_of_not_anisotropic_baseChange_quaternary
    {F : Type u} [Field F] [Invertible (2 : F)]
    {V : Type v} [AddCommGroup V] [Module F V] [FiniteDimensional F V]
    (Q : QuadraticForm F V) (hQ : Q.Nondegenerate)
    (hdim : Module.finrank F V = 4)
    (d : Fˣ) (hd : discr (formClass Q hQ) = QuotientGroup.mk d) (hdsq : ¬ IsSquare d)
    (E : Type u) [Field E] [Algebra F E] (hdeg : Module.finrank F E = 2)
    (s : E) (hs : s * s = algebraMap F E (d : F))
    (hgen : IntermediateField.adjoin F ({s} : Set E) = ⊤)
    (h : ¬ (Q.baseChange E).Anisotropic) :
    ¬ Q.Anisotropic :=
  sorry

end QuaternaryDescent

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

/-! ### 7.2, the correction planes

The existence proof replaces the binary plane `P = ⟨1, -β⟩` by `P' = ⟨α, -αβ⟩`, where `β` is a
square at every archimedean place and a nonsquare on the finite even set `R`, and `α` is the
output of `exists_hilbertSymbol_eq_neg_one_iff` for that `β` and that `R`. The statements below
are the invariant calculation that makes the substitution work: same dimension, same
discriminant, and a Hasse sign that flips exactly on `R`. -/

section CorrectionPlanes

open TauCetiRoadmap.QuadraticFormInvariants (hilbertSymbol localHasse)

/-- The Hasse invariant of a binary tuple is a single Hilbert symbol. -/
theorem localHasse_pair {F : Type u} [Field F] (a b : Fˣ) :
    localHasse ![a, b] = hilbertSymbol a b := by
  have hfilter :
      (Finset.univ.filter fun ij : Fin 2 × Fin 2 => ij.1 < ij.2) =
        {((0 : Fin 2), (1 : Fin 2))} := by decide
  unfold TauCetiRoadmap.QuadraticFormInvariants.localHasse
  rw [hfilter, Finset.prod_singleton]
  simp

/-- `d(P) = [-β] = d(P')`: the two correction planes have the same discriminant, exhibited as an
equation between products of diagonal entries with an explicit square. -/
theorem discr_correctionPlanes {F : Type u} [Field F] (α β : Fˣ) :
    ((1 : Fˣ) * -β) * (α * -(α * β)) = (α * β) * (α * β) := by
  simp [mul_comm, mul_left_comm]

/-- `s_v(P) = 1`: the Hasse sign of `⟨1, -β⟩` is trivial at every place, over any field with `2`
invertible, because the norm equation `b = x² − 1·y²` always has the solution
`x = (b+1)/2`, `y = (b−1)/2`. -/
theorem hilbertSymbol_one {F : Type u} [Field F] [Invertible (2 : F)] (b : Fˣ) :
    hilbertSymbol (1 : Fˣ) b = 1 := by
  have h2 : (2 : F) ≠ 0 := (isUnit_of_invertible (2 : F)).ne_zero
  have hex : ∃ x y : F, (b : F) = x ^ 2 - y ^ 2 := by
    refine ⟨((b : F) + 1) / 2, ((b : F) - 1) / 2, ?_⟩
    field_simp
    ring
  simp [TauCetiRoadmap.QuadraticFormInvariants.hilbertSymbol, hex]

/-- `s_v(P') = (α, β)_v`: the Hasse sign of `⟨α, -αβ⟩` at a nonarchimedean place is the symbol
`(α, β)`, by bimultiplicativity and `(α, -α) = 1`. This is the identity that makes the
substitution flip the sign exactly on `R`, and it is a closed consequence of Quadratic Form
Invariants' frozen Layer 6C lemmas. -/
theorem hilbertSymbol_neg_mul {F : Type u} [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Invertible (2 : F)] (α β : Fˣ) :
    hilbertSymbol α (-(α * β)) = hilbertSymbol α β := by
  rw [show -(α * β) = -α * β from (neg_mul α β).symm,
    TauCetiRoadmap.QuadraticFormInvariants.hilbertSymbol_mul,
    TauCetiRoadmap.QuadraticFormInvariants.hilbertSymbol_neg_self, one_mul]

/-- The same identity at a real place, where it follows from `hilbertSymbol_real` rather than from
the nonarchimedean bimultiplicativity lemma. -/
theorem hilbertSymbol_neg_mul_real (α β : ℝˣ) :
    hilbertSymbol α (-(α * β)) = hilbertSymbol α β :=
  sorry

end CorrectionPlanes

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
