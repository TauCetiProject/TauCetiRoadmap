import Mathlib
import TauCeti.Algebra.GroupAction.AlgHom
import TauCeti.Algebra.GroupAction.PermutationRepresentation
import TauCeti.FieldTheory.Galois.SubfieldDictionary
import TauCeti.FieldTheory.Normal.Embeddings
import TauCeti.GroupTheory.DoubleCoset.Finite
import TauCeti.NumberTheory.EffectiveBounds.WorkedExamples
import TauCeti.NumberTheory.LocalField.RamificationGroup
import TauCeti.NumberTheory.Multiquadratic.Quadratic.Ramification
import TauCeti.NumberTheory.NumberField.ArtinSymbol
import TauCeti.NumberTheory.NumberField.ComplexConjugation.Basic
import TauCeti.NumberTheory.NumberField.ComplexConjugation.CMField
import TauCeti.NumberTheory.NumberField.Cyclotomic.FiveSplitting
import TauCeti.NumberTheory.NumberField.Cyclotomic.Frobenius
import TauCeti.NumberTheory.NumberField.Cyclotomic.SqrtFive
import TauCeti.NumberTheory.NumberField.Cyclotomic.Subfields
import TauCeti.NumberTheory.NumberField.Discriminant.ArtinMap
import TauCeti.NumberTheory.NumberField.Discriminant.FixedField
import TauCeti.NumberTheory.NumberField.Discriminant.Ramification
import TauCeti.NumberTheory.NumberField.Discriminant.RamifiedSupport.Basic
import TauCeti.NumberTheory.NumberField.Discriminant.RamifiedSupport.Tower
import TauCeti.NumberTheory.NumberField.Discriminant.Relative
import TauCeti.NumberTheory.NumberField.Discriminant.Stickelberger
import TauCeti.NumberTheory.NumberField.Frobenius
import TauCeti.NumberTheory.NumberField.Frobenius.CycleType
import TauCeti.NumberTheory.NumberField.Frobenius.DecompositionGroup
import TauCeti.NumberTheory.NumberField.Frobenius.Restriction
import TauCeti.NumberTheory.NumberField.Frobenius.Tower
import TauCeti.NumberTheory.NumberField.Global.Places.Basic
import TauCeti.NumberTheory.NumberField.Ideal.ArtinMap
import TauCeti.NumberTheory.NumberField.Ideal.Away
import TauCeti.NumberTheory.NumberField.Ideal.UnramifiedArtinMap
import TauCeti.NumberTheory.NumberField.Index.Basic
import TauCeti.NumberTheory.NumberField.Index.CommonIndexDivisor
import TauCeti.NumberTheory.NumberField.Index.DedekindCriterion
import TauCeti.NumberTheory.NumberField.Index.DedekindCubic.Basic
import TauCeti.NumberTheory.NumberField.Index.DedekindCubic.Index
import TauCeti.NumberTheory.NumberField.Index.DedekindCubic.Order
import TauCeti.NumberTheory.NumberField.Index.DedekindCubic.RingOfIntegers
import TauCeti.NumberTheory.NumberField.Index.Discriminant
import TauCeti.NumberTheory.NumberField.Index.Exponent
import TauCeti.NumberTheory.NumberField.Index.PowerBasis
import TauCeti.NumberTheory.NumberField.IntrinsicLabel
import TauCeti.NumberTheory.NumberField.LocalGlobal.Completion
import TauCeti.NumberTheory.NumberField.LocalGlobal.DecompositionGroup
import TauCeti.NumberTheory.NumberField.LocalGlobal.Different.Basic
import TauCeti.NumberTheory.NumberField.LocalGlobal.Different.Exponent
import TauCeti.NumberTheory.NumberField.LocalGlobal.Different.Permutation
import TauCeti.NumberTheory.NumberField.LocalGlobal.Different.Tame
import TauCeti.NumberTheory.NumberField.LocalGlobal.Different.Wild
import TauCeti.NumberTheory.NumberField.LocalGlobal.Frobenius
import TauCeti.NumberTheory.NumberField.LocalGlobal.RamificationGroup
import TauCeti.NumberTheory.NumberField.LocalGlobal.Semilocal.Basic
import TauCeti.NumberTheory.NumberField.LocalGlobal.Semilocal.Factorization
import TauCeti.NumberTheory.NumberField.LocalGlobal.Semilocal.Integers
import TauCeti.NumberTheory.NumberField.LocalGlobal.Semilocal.NormTrace
import TauCeti.NumberTheory.NumberField.Monogenic
import TauCeti.NumberTheory.NumberField.NormalClosure
import TauCeti.NumberTheory.NumberField.Quadratic.Frobenius
import TauCeti.NumberTheory.NumberField.Quadratic.Splitting
import TauCeti.NumberTheory.NumberField.SplitsCompletely.Basic
import TauCeti.NumberTheory.NumberField.SplitsCompletely.GaloisClosure
import TauCeti.NumberTheory.NumberField.SplittingField
import TauCeti.NumberTheory.NumberField.Units.Bounded
import TauCeti.NumberTheory.NumberField.Units.Candidates
import TauCeti.NumberTheory.NumberField.Units.Elimination.Basic
import TauCeti.NumberTheory.NumberField.Units.Elimination.GoldenRatio
import TauCeti.NumberTheory.NumberField.Units.GeneratorCriterion
import TauCeti.NumberTheory.NumberField.Units.Normalization
import TauCeti.NumberTheory.NumberField.Units.Regulator
import TauCeti.NumberTheory.NumberField.UnramifiedTower
import TauCeti.NumberTheory.NumberField.WorkedExamples.Cubic23.Invariants
import TauCeti.NumberTheory.NumberField.WorkedExamples.Cubic23.Ramification
import TauCeti.NumberTheory.NumberField.WorkedExamples.Cubic23.Splitting
import TauCeti.NumberTheory.NumberField.WorkedExamples.Cubic23.Units
import TauCeti.NumberTheory.NumberField.WorkedExamples.DedekindCubic.Invariants
import TauCeti.NumberTheory.NumberField.WorkedExamples.DedekindCubic.PrimesOverTwo
import TauCeti.NumberTheory.NumberField.WorkedExamples.FifthCyclotomic.Invariants
import TauCeti.NumberTheory.NumberField.WorkedExamples.GaussianRationals.Invariants
import TauCeti.NumberTheory.NumberField.WorkedExamples.GaussianRationals.Ramification.Basic
import TauCeti.NumberTheory.NumberField.WorkedExamples.GaussianRationals.Ramification.Group
import TauCeti.NumberTheory.NumberField.WorkedExamples.GaussianRationals.Units
import TauCeti.NumberTheory.NumberField.WorkedExamples.Sqrt2.Ramification
import TauCeti.NumberTheory.NumberField.WorkedExamples.Sqrt5.DedekindZeta
import TauCeti.NumberTheory.NumberField.WorkedExamples.Sqrt5.Invariants
import TauCeti.NumberTheory.NumberField.WorkedExamples.Sqrt5.RealPlace
import TauCeti.NumberTheory.NumberField.WorkedExamples.Sqrt5.Splitting
import TauCeti.NumberTheory.NumberField.WorkedExamples.Sqrt5.Units
import TauCeti.NumberTheory.RamificationInertia.DoubleCoset.Basic
import TauCeti.NumberTheory.RamificationInertia.DoubleCoset.Invariants
import TauCeti.NumberTheory.RamificationInertia.DoubleCoset.Naturality
import TauCeti.NumberTheory.RamificationInertia.DoubleCoset.SpecialCases
import TauCeti.NumberTheory.RamificationInertia.Galois
import TauCeti.NumberTheory.RamificationInertia.HilbertTheory.Basic
import TauCeti.NumberTheory.RamificationInertia.HilbertTheory.ResidueDegree
import TauCeti.NumberTheory.RamificationInertia.Splitting
import TauCeti.RingTheory.DedekindDomain.AdicCompletionExtension
import TauCeti.RingTheory.DedekindDomain.AdicValuation.Completion
import TauCeti.RingTheory.DedekindDomain.AdicValuation.InertiaDegree
import TauCeti.RingTheory.DedekindDomain.AdicValuation.IntegersExtension
import TauCeti.RingTheory.DedekindDomain.AdicValuation.IntegralClosure
import TauCeti.RingTheory.DedekindDomain.AdicValuation.LocalDegree
import TauCeti.RingTheory.DedekindDomain.AdicValuation.Localization
import TauCeti.RingTheory.DedekindDomain.AdicValuation.Monogenic
import TauCeti.RingTheory.DedekindDomain.AdicValuation.NatCastValuation
import TauCeti.RingTheory.DedekindDomain.AdicValuation.RamificationIndex
import TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeExtension
import TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel
import TauCeti.RingTheory.DedekindDomain.Discriminant.Basic
import TauCeti.RingTheory.DedekindDomain.Discriminant.Localization
import TauCeti.RingTheory.DedekindDomain.Discriminant.Ramification
import TauCeti.RingTheory.DedekindDomain.Discriminant.Separable
import TauCeti.RingTheory.DedekindDomain.Discriminant.Valuation
import TauCeti.RingTheory.DedekindDomain.KummerDedekind
import TauCeti.RingTheory.Discriminant.Tower
import TauCeti.RingTheory.Ideal.PrimesOver
import TauCeti.RingTheory.Ideal.RamificationGroup
import TauCeti.RingTheory.NormTrace.BaseChange
import TauCeti.NumberTheory.LocalField.Different.Hilbert
import TauCeti.NumberTheory.LocalField.Different.Basic
import TauCeti.NumberTheory.LocalField.Different.Wild

/-!
# Number fields: ramification, Frobenius, and the LMFDB invariants: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`,
which numbers the milestones as Layer `n.m`. The statements here suggest Lean forms for the
milestones, so that contributors and reviewers converge on names and signatures; discharging all
of them finishes neither a layer nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed by
the Tau Ceti (or Mathlib) declaration that realizes it, so the correspondence is checked by the
Lean kernel rather than asserted in prose. No statement is left unproved. That is evidence for
completion, not its criterion: completion is judged by a milestone-by-milestone audit against
`README.md`, which a fully discharged file of suggested forms cannot replace.

The earlier version of this file proposed its own carriers (`idealsAway`, `artinHomAway`,
`relDiscr`, `ramifiedSupport`, `IntegralPrimitiveElement`, `ramificationGroup`,
`NormalClosureData`, the Layer 5 comparison maps, the unit certificate) and imported the Local
Fields and Ramification roadmap's prototypes. All of these now live in Tau Ceti, so the statements
below are about the Tau Ceti objects, and the local objects are Tau Ceti's `ramificationIndex`,
`inertiaDegree`, `differentExponent` and `LocalFieldsRamification.lowerRamificationGroup`. The
names other roadmaps import from this file are kept, at the end, as abbreviations of the Tau Ceti
objects or as theorems closed by them.

Differences from the README's requested forms:

* Renamed: `powerBasisOfIntegralPrimitiveElement` is `IntegralPrimitiveElement.powerBasis` (3.2);
  `artinHomAway_ramifiedSupport` is `artinHomAwayRamifiedSupport` (4.3); `completionIntegersAlgHom`
  is the ring map `adicCompletionIntegersExtension`, with its algebra structure a scoped instance,
  and `residueFieldEquivCompletion` is `residueFieldEquivAdicCompletionIntegers` (5.7);
  `IsMonogenic` is `TauCeti.NumberField.IsMonogenic`, not in the `NumberField` namespace (7.3).
* The README's named proof-route lemmas exist under other names. For 4.2, `trace_localization` is
  Mathlib's `Algebra.trace_localization`, `traceDual_localization` is
  `span_traceDual_one_eq_traceDual_one`, `fractionalIdealDual_localization` is
  `extended_dual_one_eq_dual_one`, `differentIdeal_localization` is
  `map_differentIdeal_eq_differentIdeal`, and `relNorm_localization` is Mathlib's
  `Ideal.spanIntNorm_localization`. For 5.9 the steps are the `_adicCompletionIntegers` versions of
  the trace-dual and fractional-dual lemmas; there is no `differentIdeal_integralSemilocal`, and the
  proof runs componentwise through `sum_trace_mul_smul_algebraMap_eq`, as the README allows. The
  6.2 engine is `denseRange_algebraMap_adicCompletionIntegers`,
  `denseRange_localizationToCompletionIntegers`, `isOpen_maximalIdeal_pow_adicCompletionIntegers`,
  `mem_asIdeal_pow_iff_valued_algebraMap_le` and `continuous_decompositionHom`.
* Layer 3.10's five reduction lemmas do not exist: the proof of
  `exists_gal_fullCycleType_eq_factorizationType` reduces roots modulo a prime directly and holds
  for every monic `f` with `p ∤ disc f`, reducible or not.
* `exists_isArithFrobAt_pow_inertiaDeg` (2.4) takes `[Q.IsPrime]`, since the README states the
  tower formula at one prime `Q` of `L`; the earlier signature allowed an arbitrary ideal.
* `NormalClosureData` (7.1) records Mathlib's `IsNormalClosure ℚ K M` rather than `[IsGalois ℚ M]`
  and an orbit-generation field; the embedding action is the `MulAction` of `Gal(M/ℚ)` on
  `K →ₐ[ℚ] M`, and the coordinates in `S_n` are the generic `Equiv.permutationEmbedding`.
* `complexConjugationAt` (2.7) takes the single hypothesis `w.IsRamified K`; the global
  ramification groups are the generic `Ideal.ramificationGroup` (6.2); `unitCandidates K B` and
  `UnitCandidateEliminationCertificate K B` (7.4) take no real place, and soundness concludes
  generation modulo torsion directly.
* The base-`ℚ` Artin symbol (2.3) is the symbol over `𝓞 ℚ`, with Frobenius elements over `ℤ`.
* Stronger than asked: Dedekind's theorem (3.9) assumes only that `f mod p` is squarefree; the
  relative Dedekind–Kummer theorem (3.6) holds over any integrally closed base; `discr_smulTower`
  (4.4) holds over commutative rings; unramifiedness in a compositum (1.5) is an `iff`.

Layer 8.2 is an accounting table with no statement of its own. No class number is claimed for
Dedekind's field. The README's explicit scope exclusions (Frobenius in an absolute Galois group,
Artin conductors, densities, local ramification theory, Hensel's converse, Steinitz classes,
power integral bases, Gassmann triples, the LMFDB ordering, and unit certification above rank one
or at rank one in composite degree) have no statement here.
-/

namespace TauCetiRoadmap.NumberFieldArithmetic

open scoped NumberField Pointwise nonZeroDivisors TensorProduct
open Polynomial IsDedekindDomain

/-! ## Layer 1: the splitting dictionary -/

section Layer1_1

open Ideal

/-- **Layer 1.1, maximal prime count is `e = f = 1` everywhere above `p`.** Over any domain, for
a finite flat extension, and with no Galois or residue-separability hypothesis. -/
example {R S : Type*} [CommRing R] [IsDomain R] [CommRing S] [Algebra R S] [Module.Finite R S]
    [Module.Flat R S] (p : Ideal R) [p.IsPrime] :
    (p.primesOver S).ncard = Module.finrank R S ↔
      ∀ Q ∈ p.primesOver S, Q.ramificationIdx R = 1 ∧ Q.inertiaDeg R = 1 :=
  ncard_primesOver_eq_finrank_iff_forall_ramificationIdx_eq_one_and_inertiaDeg_eq_one p

/-- **Layer 1.1, maximal prime count is trivial decomposition groups.** For a finite group acting
with invariants `R`; orbit–stabilizer, with no hypothesis on the residue extensions. -/
example {R S : Type*} [CommRing R] [CommRing S] [Algebra R S] [FaithfulSMul R S]
    (G : Type*) [Group G] [Finite G] [MulSemiringAction G S] [SMulCommClass G R S]
    [Algebra.IsInvariant R S G] (p : Ideal R) [p.IsPrime] :
    (p.primesOver S).ncard = Nat.card G ↔
      ∀ Q ∈ p.primesOver S, MulAction.stabilizer G Q = ⊥ :=
  ncard_primesOver_eq_natCard_iff_forall_stabilizer_eq_bot G p

/-- **Layer 1.1, a trivial decomposition group is `e = f = 1`**, in a Galois extension. -/
example {A B : Type*} [CommRing A] [IsDomain A] [CommRing B] [IsDomain B] [Algebra A B]
    [Module.Finite A B] [Module.Flat A B] (G : Type*) [Group G] [Finite G]
    [MulSemiringAction G B] [IsGaloisGroup G A B] (p : Ideal A) [p.IsPrime] (Q : Ideal B)
    [Q.IsPrime] [Q.LiesOver p] :
    MulAction.stabilizer G Q = ⊥ ↔ p.ramificationIdxIn B = 1 ∧ p.inertiaDegIn B = 1 :=
  stabilizer_eq_bot_iff_ramificationIdxIn_eq_one_and_inertiaDegIn_eq_one G p Q

/-- **Layer 1.1, the Galois number-field form over an arbitrary Dedekind base `A`.** -/
example (K L : Type*) [Field K] [Field L] [NumberField K] [NumberField L] [Algebra K L]
    [IsGalois K L] {A : Type*} [CommRing A] [IsDedekindDomain A] [Algebra A (𝓞 L)]
    [Module.Finite A (𝓞 L)] [Module.IsTorsionFree A (𝓞 L)]
    [IsGaloisGroup (L ≃ₐ[K] L) A (𝓞 L)] (p : Ideal A) [p.IsMaximal] :
    (p.primesOver (𝓞 L)).ncard = Module.finrank K L ↔
      p.ramificationIdxIn (𝓞 L) = 1 ∧ p.inertiaDegIn (𝓞 L) = 1 :=
  NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois K L p

/-- **Layer 1.2, unramified sets of primes, quantified with Mathlib's `Algebra.IsUnramifiedIn`.**
No wrapper predicate: being unramified in `A` at `p` is the explicit quantification over the
primes above `p`. -/
example {R : Type*} [CommRing R] (A : Type*) [CommRing A] [Algebra R A] (p : Ideal R) :
    Algebra.IsUnramifiedIn A p ↔
      ∀ (P : Ideal A) (_ : P.IsPrime), P.LiesOver p → Algebra.IsUnramifiedAt R P :=
  Iff.rfl

end Layer1_1

section Layer1_3

open Ideal

attribute [local instance] Ideal.Quotient.field

section Degrees

variable (A K L : Type*) {B : Type*} [CommRing A] [CommRing B] [Field K] [Field L]
  [Algebra A B] [Algebra K L] [FiniteDimensional K L] [MulSemiringAction (L ≃ₐ[K] L) B]
  [IsGaloisGroup (L ≃ₐ[K] L) A B] (P : Ideal B)

/-- **Layer 1.3, `[Z : K] = g`**, for `Z` the decomposition field of `P`. -/
example (D : Type*) [Field D] [Algebra D L] [IsDecompositionField K L P D] [IsGalois K L]
    [P.IsPrime] [Algebra K D] [IsScalarTower K D L] :
    Module.finrank K D = ((P.under A).primesOver B).ncard :=
  TauCeti.IsDecompositionField.finrank_eq_ncard_primesOver A K L P D

/-- **Layer 1.3, `[T : Z] = f_sep`**, the separable residue degree, for `T` the inertia field. No
residue separability is assumed. -/
example (D E : Type*) [Field D] [Algebra D L] [IsDecompositionField K L P D] [Field E]
    [Algebra E L] [IsInertiaField K L P E] [Algebra.IsIntegral A B] [P.IsMaximal] [Algebra D E]
    [IsScalarTower D E L] :
    Module.finrank D E = Field.finSepDegree (A ⧸ P.under A) (B ⧸ P) :=
  TauCeti.IsInertiaField.finrank_eq_finSepDegree A K L P D E

/-- **Layer 1.3, `[L : T] = e · f_ins`.** Without residue separability the inertia index is
`e f_ins`, not `e`. -/
example (E : Type*) [Field E] [Algebra E L] [IsInertiaField K L P E] [IsDomain A] [IsDomain B]
    [Module.Finite A B] [Module.Flat A B] [P.IsMaximal] :
    Module.finrank E L =
      P.ramificationIdx A * Field.finInsepDegree (A ⧸ P.under A) (B ⧸ P) :=
  TauCeti.IsInertiaField.finrank_eq_ramificationIdx_mul_finInsepDegree A K L P E

end Degrees

/-- **Layer 1.3, the full degree identity `[L : K] = g · e · f`.** -/
example {A B : Type*} [CommRing A] [IsDomain A] [CommRing B] [IsDomain B] [Algebra A B]
    [Module.Finite A B] [Module.Flat A B] (G : Type*) [Group G] [Finite G]
    [MulSemiringAction G B] [IsGaloisGroup G A B] (p : Ideal A) [p.IsPrime] :
    (p.primesOver B).ncard * (p.ramificationIdxIn B * p.inertiaDegIn B) = Nat.card G :=
  ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn p B G

section Decomposition

variable (A K L : Type*) {B : Type*} [Field K] [Field L] [Algebra K L]
  [CommRing A] [CommRing B] [Algebra A B] (P : Ideal B)
  [Algebra A K] [IsFractionRing A K] [Algebra A L] [IsScalarTower A K L] [Algebra B L]
  [IsScalarTower A B L] [IsFractionRing B L] [MulSemiringAction (L ≃ₐ[K] L) B]
  [SMulDistribClass (L ≃ₐ[K] L) B L]
  (D 𝓞D : Type*) [Field D] [Algebra D L] [IsDecompositionField K L P D] [CommRing 𝓞D]
  [Algebra 𝓞D D] [IsFractionRing 𝓞D D] [Algebra 𝓞D B] [Algebra 𝓞D L]
  [IsScalarTower 𝓞D D L] [IsScalarTower 𝓞D B L]

/-- **Layer 1.3, `P` is the only prime above `P ∩ Z`.** -/
example (𝓟D : Ideal 𝓞D) [P.LiesOver 𝓟D] [P.IsPrime] [Finite (MulAction.stabilizer (L ≃ₐ[K] L) P)]
    [IsIntegrallyClosed 𝓞D] [Algebra.IsIntegral 𝓞D B] :
    primesOver 𝓟D B = {P} :=
  IsDecompositionField.primesOver_eq_singleton (K := K) (L := L) (P := P) (D := D) (𝓞D := 𝓞D)
    (𝓟D := 𝓟D)

variable [IsGalois K L] [FiniteDimensional K L] [IsDedekindDomain A] [IsDomain B]
  [Module.Finite A B] [Module.IsTorsionFree A B] [Algebra A 𝓞D] [Module.Finite A 𝓞D]
  [IsScalarTower A 𝓞D B] [IsDedekindDomain 𝓞D] [P.IsMaximal]

/-- **Layer 1.3, `e(P ∩ Z / p) = 1` and `f(P ∩ Z / p) = 1`**, with no residue separability. -/
example :
    (P.under 𝓞D).ramificationIdx A = 1 ∧ (P.under 𝓞D).inertiaDeg A = 1 :=
  ⟨TauCeti.IsDecompositionField.ramificationIdx_under_eq_one A K L P D 𝓞D,
    TauCeti.IsDecompositionField.inertiaDeg_under_eq_one A K L P D 𝓞D⟩

end Decomposition

section Inertia

variable (A K L : Type*) {B : Type*} [Field K] [Field L] [Algebra K L] [CommRing A] [CommRing B]
  [Algebra A B] {p : Ideal A} (P : Ideal B) [P.LiesOver p]
  [Algebra A K] [IsFractionRing A K] [Algebra A L] [IsScalarTower A K L] [Algebra B L]
  [IsScalarTower A B L] [IsFractionRing B L] [MulSemiringAction (L ≃ₐ[K] L) B]
  [SMulDistribClass (L ≃ₐ[K] L) B L]
  (E 𝓞E : Type*) [Field E] [Algebra E L] [IsInertiaField K L P E] [CommRing 𝓞E]
  [Algebra 𝓞E E] [IsFractionRing 𝓞E E] [Algebra 𝓞E B] [Algebra 𝓞E L] [IsScalarTower 𝓞E E L]
  [IsScalarTower 𝓞E B L]

/-- **Layer 1.3, `P` is the only prime above `P ∩ T`.** -/
example [P.IsPrime] [Finite (Ideal.inertia (L ≃ₐ[K] L) P)] [IsIntegrallyClosed 𝓞E]
    [Algebra.IsIntegral 𝓞E B] :
    primesOver (P.under 𝓞E) B = {P} :=
  TauCeti.IsInertiaField.primesOver_eq_singleton (K := K) (L := L) (P := P) (E := E) (𝓞E := 𝓞E)

variable [IsGalois K L] [IsDedekindDomain A] [IsDedekindDomain B] [Module.Finite A B]
  [Module.IsTorsionFree A B] [Algebra A 𝓞E] [Module.Finite A 𝓞E] [IsScalarTower A 𝓞E B]
  [IsDedekindDomain 𝓞E] [FiniteDimensional K L] [P.IsMaximal]

/-- **Layer 1.3, `f(P / P ∩ T) = f_ins`**, with no residue separability. -/
example : P.inertiaDeg 𝓞E = Field.finInsepDegree (A ⧸ P.under A) (B ⧸ P) :=
  TauCeti.IsInertiaField.inertiaDeg_eq_finInsepDegree A K L P E 𝓞E

/-- **Layer 1.3, the residue-separable corollary `f(P ∩ T / p) = f`.** The separability
hypothesis is kept on this statement. -/
example [Algebra.IsSeparable (A ⧸ P.under A) (B ⧸ P)] :
    (P.under 𝓞E).inertiaDeg A = p.inertiaDegIn B :=
  TauCeti.IsInertiaField.inertiaDeg_eq_inertiaDegIn A K L P E 𝓞E

end Inertia

end Layer1_3

section Layer1_4

open Ideal IntermediateField

variable {K M : Type*} [Field K] [NumberField K] [Field M] [NumberField M] [Algebra K M]
  [IsGalois K M] (p : Ideal (𝓞 K)) (Q : Ideal (𝓞 M)) [Q.IsPrime] [Q.LiesOver p]
  (H : Subgroup (M ≃ₐ[K] M))

/-- **Layer 1.4, the double-coset law.** `H \ G / D` is in bijection with the primes of the fixed
field `M ^ H` above `p`, for `D` the decomposition group of `Q`. -/
noncomputable example :
    DoubleCoset.Quotient (H : Set (M ≃ₐ[K] M))
        (MulAction.stabilizer (M ≃ₐ[K] M) Q : Set (M ≃ₐ[K] M)) ≃
      p.primesOver (𝓞 (fixedField H)) :=
  doubleCosetQuotientEquivPrimesOver p Q H

/-- **Layer 1.4, the bijection sends `HσD` to `σQ ∩ M ^ H`.** -/
example (σ : M ≃ₐ[K] M) :
    (doubleCosetQuotientEquivPrimesOver p Q H (DoubleCoset.mk H _ σ) :
        Ideal (𝓞 (fixedField H))) = (σ • Q).under (𝓞 (fixedField H)) :=
  doubleCosetQuotientEquivPrimesOver_mk p Q H σ

/-- **Layer 1.4, compatibility with the `G`-action on `primesOver`.** -/
example (τ σ : M ≃ₐ[K] M) :
    doubleCosetQuotientEquivPrimesOver p (τ • Q) H (DoubleCoset.mk H _ σ) =
      doubleCosetQuotientEquivPrimesOver p Q H (DoubleCoset.mk H _ (σ * τ)) :=
  doubleCosetQuotientEquivPrimesOver_smul_mk p Q H τ σ

/-- **Layer 1.4, `e · f = [σDσ⁻¹ : H ∩ σDσ⁻¹]`**, with no separability hypothesis. -/
example (σ : M ≃ₐ[K] M) :
    ((σ • Q).under (𝓞 (fixedField H))).ramificationIdx (𝓞 K) *
        ((σ • Q).under (𝓞 (fixedField H))).inertiaDeg (𝓞 K) =
      H.relIndex (MulAut.conj σ • MulAction.stabilizer (M ≃ₐ[K] M) Q) :=
  ramificationIdx_mul_inertiaDeg_under_fixedField_smul_eq_relIndex Q H σ

/-- **Layer 1.4, `e · f = |HσD| / |H|`**, read along the bijection. -/
example (q : DoubleCoset.Quotient (H : Set (M ≃ₐ[K] M))
      (MulAction.stabilizer (M ≃ₐ[K] M) Q : Set (M ≃ₐ[K] M))) :
    (doubleCosetQuotientEquivPrimesOver p Q H q : Ideal (𝓞 (fixedField H))).ramificationIdx
          (𝓞 K) *
        (doubleCosetQuotientEquivPrimesOver p Q H q : Ideal (𝓞 (fixedField H))).inertiaDeg
          (𝓞 K) =
      Nat.card (DoubleCoset.quotToDoubleCoset H (MulAction.stabilizer (M ≃ₐ[K] M) Q) q) /
        Nat.card H :=
  ramificationIdx_mul_inertiaDeg_doubleCosetQuotientEquivPrimesOver_eq_card_div p Q H q

/-- **Layer 1.4, `e = [σIσ⁻¹ : H ∩ σIσ⁻¹]`.** Residue fields of number fields are finite, so the
residue-separability hypothesis this formula needs is automatic here. -/
example (σ : M ≃ₐ[K] M) :
    ((σ • Q).under (𝓞 (fixedField H))).ramificationIdx (𝓞 K) =
      H.relIndex (MulAut.conj σ • Q.inertia (M ≃ₐ[K] M)) :=
  ramificationIdx_under_fixedField_smul_eq_relIndex Q H σ

omit [Q.IsPrime] in
/-- **Layer 1.4, `Σ_σ |HσD| / |H| = [M ^ H : K]`**, which recovers the fundamental identity: the
double-coset sum is the subgroup index, and the index of `H` is the degree of its fixed field. -/
theorem sum_card_doubleCoset_div_card_eq_finrank
    [Fintype (DoubleCoset.Quotient (H : Set (M ≃ₐ[K] M))
      (MulAction.stabilizer (M ≃ₐ[K] M) Q : Set (M ≃ₐ[K] M)))] :
    ∑ q, Nat.card (DoubleCoset.quotToDoubleCoset H (MulAction.stabilizer (M ≃ₐ[K] M) Q) q) /
        Nat.card H =
      Module.finrank K (fixedField H) := by
  rw [Subgroup.sum_card_quotToDoubleCoset_div_card_eq_index]
  have hpos : 0 < Nat.card H := Nat.card_pos
  have h₁ := H.index_mul_card
  rw [IsGalois.card_aut_eq_finrank, ← Module.finrank_mul_finrank K (fixedField H) M,
    IntermediateField.finrank_fixedField_eq_card] at h₁
  exact Nat.eq_of_mul_eq_mul_right hpos h₁

/-- **Layer 1.4, functoriality in `H`.** For `H ≤ H'`, the quotient map of double cosets and
contraction of primes from `M ^ H` to `M ^ H'` commute with the two bijections. -/
example {H H' : Subgroup (M ≃ₐ[K] M)} (h : H ≤ H') :
    doubleCosetQuotientEquivPrimesOver p Q H' ∘
        DoubleCoset.quotientMapOfLELeft h (MulAction.stabilizer (M ≃ₐ[K] M) Q) =
      primesOverFixedFieldMap p h ∘ doubleCosetQuotientEquivPrimesOver p Q H :=
  doubleCosetQuotientEquivPrimesOver_natural p Q h

/-- **Layer 1.4, the case `H = G`**, where `M ^ H = K` and there is one prime. -/
example [p.IsPrime] :
    Nat.card (p.primesOver (𝓞 (fixedField (⊤ : Subgroup (M ≃ₐ[K] M))))) = 1 :=
  card_primesOver_fixedField_top_eq_one p

/-- **Layer 1.4, the case `H = 1`**, the Galois case: the primes above `p` are `G / D`. -/
example : Nat.card (p.primesOver (𝓞 M)) = (MulAction.stabilizer (M ≃ₐ[K] M) Q).index :=
  card_primesOver_eq_index_stabilizer p Q

/-- **Layer 1.4, the case `H = D`, at the identity double coset only.** The prime it names has
`e = f = 1` over `p` and `Q` is the only prime of `M` above it. `D \ G / D` is not a singleton in
general, so this is not a statement that there is one prime. -/
example :
    (doubleCosetQuotientEquivPrimesOver p Q (MulAction.stabilizer (M ≃ₐ[K] M) Q)
          (DoubleCoset.mk _ _ 1) :
        Ideal (𝓞 (fixedField (MulAction.stabilizer (M ≃ₐ[K] M) Q)))).ramificationIdx (𝓞 K) = 1 ∧
      (doubleCosetQuotientEquivPrimesOver p Q (MulAction.stabilizer (M ≃ₐ[K] M) Q)
          (DoubleCoset.mk _ _ 1) :
        Ideal (𝓞 (fixedField (MulAction.stabilizer (M ≃ₐ[K] M) Q)))).inertiaDeg (𝓞 K) = 1 ∧
      (doubleCosetQuotientEquivPrimesOver p Q (MulAction.stabilizer (M ≃ₐ[K] M) Q)
          (DoubleCoset.mk _ _ 1) :
        Ideal (𝓞 (fixedField (MulAction.stabilizer (M ≃ₐ[K] M) Q)))).primesOver (𝓞 M) = {Q} :=
  ⟨ramificationIdx_doubleCosetQuotientEquivPrimesOver_stabilizer_mk_one_eq_one p Q,
    inertiaDeg_doubleCosetQuotientEquivPrimesOver_stabilizer_mk_one_eq_one p Q,
    primesOver_doubleCosetQuotientEquivPrimesOver_stabilizer_mk_one_eq_singleton p Q⟩

end Layer1_4

section Layer1_5

open Ideal IntermediateField

variable {K M : Type*} [Field K] [NumberField K] [Field M] [NumberField M] [Algebra K M]
  [IsGalois K M] (p : Ideal (𝓞 K)) [p.IsPrime]

/-- **Layer 1.5, totally split in `E` iff totally split in its Galois closure.** `M` is the
Galois closure of `E` when `normalClosure K E M = ⊤`. -/
example {E : IntermediateField K M} (hE : normalClosure K E M = ⊤) :
    (p.primesOver (𝓞 E)).ncard = Module.finrank K E ↔
      (p.primesOver (𝓞 M)).ncard = Module.finrank K M :=
  ncard_primesOver_eq_finrank_iff_of_normalClosure_eq_top p hE

/-- **Layer 1.5, the same with the closure named inside an ambient Galois extension.** -/
example (E : IntermediateField K M) :
    (p.primesOver (𝓞 (normalClosure K E M))).ncard = Module.finrank K (normalClosure K E M) ↔
      (p.primesOver (𝓞 E)).ncard = Module.finrank K E :=
  ncard_primesOver_normalClosure_eq_finrank_iff p E

/-- **Layer 1.5, composita: totally split in `E₁` and `E₂` iff totally split in `E₁ E₂`.** -/
example (E₁ E₂ : IntermediateField K M) :
    (p.primesOver (𝓞 ↥(E₁ ⊔ E₂))).ncard = Module.finrank K ↥(E₁ ⊔ E₂) ↔
      (p.primesOver (𝓞 E₁)).ncard = Module.finrank K E₁ ∧
        (p.primesOver (𝓞 E₂)).ncard = Module.finrank K E₂ :=
  ncard_primesOver_sup_eq_finrank_iff p E₁ E₂

/-- **Layer 1.5, composita: unramified in `E₁` and `E₂` iff unramified in `E₁ E₂`**, stronger than
the one implication the README asks for. -/
example (E₁ E₂ : IntermediateField K M) :
    Algebra.IsUnramifiedIn (𝓞 ↥(E₁ ⊔ E₂)) p ↔
      Algebra.IsUnramifiedIn (𝓞 E₁) p ∧ Algebra.IsUnramifiedIn (𝓞 E₂) p :=
  isUnramifiedIn_sup_iff p E₁ E₂

end Layer1_5

/-! ## Layer 2: Frobenius elements and the Artin symbol, at finite level -/

section Layer2_1

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]

/-- **The Frobenius convention.** `IsArithFrobAt (𝓞 K) σ Q` is the congruence
`σ x ≡ x ^ #(𝓞 K ⧸ Q ∩ 𝓞 K) (mod Q)`: the exponent is the residue cardinality of the **base**. -/
example (σ : L ≃ₐ[K] L) (Q : Ideal (𝓞 L)) :
    IsArithFrobAt (𝓞 K) σ Q ↔
      ∀ x : 𝓞 L, σ • x - x ^ Nat.card (𝓞 K ⧸ Q.under (𝓞 K)) ∈ Q :=
  Iff.rfl

variable [IsGalois K L]

/-- **Layer 2.1, existence of the relative Frobenius**, for `L/K` finite Galois and `Q` a nonzero
prime of `𝓞 L`. -/
example (Q : Ideal (𝓞 L)) [Q.IsPrime] (hQ : Q ≠ ⊥) :
    ∃ σ : L ≃ₐ[K] L, IsArithFrobAt (𝓞 K) σ Q :=
  NumberField.exists_isArithFrobAt K Q hQ

/-- **Layer 2.2, uniqueness at an unramified prime, in the Galois group.** -/
example {σ τ : L ≃ₐ[K] L} {Q : Ideal (𝓞 L)} [Q.IsPrime] [Algebra.IsUnramifiedAt (𝓞 K) Q]
    (hσ : IsArithFrobAt (𝓞 K) σ Q) (hτ : IsArithFrobAt (𝓞 K) τ Q) : σ = τ :=
  NumberField.isArithFrobAt_eq_of_isUnramifiedAt hσ hτ

/-- **Layer 2.2, the `Subsingleton` form**, at an unramified prime. -/
example {Q : Ideal (𝓞 L)} [Q.IsPrime] [Algebra.IsUnramifiedAt (𝓞 K) Q] :
    Subsingleton {σ : L ≃ₐ[K] L // IsArithFrobAt (𝓞 K) σ Q} :=
  inferInstance

end Layer2_1

section Layer2_3

attribute [local instance] Ideal.Quotient.field

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [IsGalois K L]

/-- **Layer 2.3, the Artin symbol** at a prime ideal `𝔭` of `𝓞 K` unramified in `L`, as a
conjugacy class of `Gal(L/K)`. -/
noncomputable example (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ConjClasses (L ≃ₐ[K] L) :=
  NumberField.artinSymbol 𝔭 hur

/-- **Layer 2.3, well-definedness:** every Frobenius at every prime above `𝔭` represents the
symbol. -/
example (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q)
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭] (σ : L ≃ₐ[K] L)
    (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    NumberField.artinSymbol 𝔭 hur = ConjClasses.mk σ :=
  NumberField.artinSymbol_eq_mk_of_isArithFrobAt 𝔭 hur Q σ hσ

/-- **Layer 2.3, the base-`ℚ` specialization.** The familiar symbol of a rational prime is the
symbol over `𝓞 ℚ`, and a Frobenius over `𝓞 ℚ` is the same thing as a Frobenius over `ℤ`. -/
example {F : Type*} [Field F] [NumberField F] [IsGalois ℚ F] (𝔭 : Ideal (𝓞 ℚ)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 F)) [Q.IsPrime] [Q.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 ℚ) Q)
    (Q : Ideal (𝓞 F)) [Q.IsPrime] [Q.LiesOver 𝔭] (σ : F ≃ₐ[ℚ] F) (hσ : IsArithFrobAt ℤ σ Q) :
    NumberField.artinSymbol 𝔭 hur = ConjClasses.mk σ :=
  NumberField.artinSymbol_eq_mk_of_isArithFrobAt 𝔭 hur Q σ
    ((Ideal.isArithFrobAt_ringOfIntegers_rat_iff σ Q).mpr hσ)

/-- **Layer 2.3, conjugation:** `Frob (τ • Q) = τ (Frob Q) τ⁻¹`, at an unramified `Q`. -/
example (Q : Ideal (𝓞 L)) [Q.IsPrime] [Algebra.IsUnramifiedAt (𝓞 K) Q] {σ : L ≃ₐ[K] L}
    (hσ : IsArithFrobAt (𝓞 K) σ Q) (τ ρ : L ≃ₐ[K] L) :
    IsArithFrobAt (𝓞 K) ρ (τ • Q) ↔ ρ = τ * σ * τ⁻¹ :=
  Ideal.isArithFrobAt_pointwise_smul_iff_eq_conj Q hσ τ ρ

/-- **Layer 2.3, `orderOf (Frob Q) = f(Q/𝔭)`**, at an unramified `Q`. -/
example (Q : Ideal (𝓞 L)) [Q.IsPrime] (hQ : Q ≠ ⊥) [Algebra.IsUnramifiedAt (𝓞 K) Q]
    {σ : L ≃ₐ[K] L} (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    orderOf σ = Q.inertiaDeg (𝓞 K) :=
  Ideal.orderOf_eq_inertiaDeg_of_isArithFrobAt Q hQ hσ

/-- **Layer 2.3, `zpowers (Frob Q)` is the decomposition group**, at an unramified `Q`. -/
example (Q : Ideal (𝓞 L)) [Q.IsPrime] (hQ : Q ≠ ⊥) [Algebra.IsUnramifiedAt (𝓞 K) Q]
    {σ : L ≃ₐ[K] L} (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    Subgroup.zpowers σ = MulAction.stabilizer (L ≃ₐ[K] L) Q :=
  Ideal.zpowers_eq_stabilizer_of_isArithFrobAt Q hQ hσ

/-- **Layer 2.3, the image of `Frob Q` in the residue Galois group is the residue Frobenius.** -/
example (Q : Ideal (𝓞 L)) [Q.IsPrime] (hQ : Q ≠ ⊥) {σ : L ≃ₐ[K] L}
    (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    let _ : Q.IsMaximal := (inferInstance : Q.IsPrime).isMaximal hQ
    letI := Fintype.ofFinite (𝓞 K ⧸ Q.under (𝓞 K))
    Ideal.Quotient.stabilizerHom Q (Q.under (𝓞 K)) (L ≃ₐ[K] L) ⟨σ, hσ.mem_stabilizer⟩ =
      FiniteField.frobeniusAlgEquivOfAlgebraic (𝓞 K ⧸ Q.under (𝓞 K)) (𝓞 L ⧸ Q) :=
  Ideal.stabilizerHom_eq_frobeniusAlgEquivOfAlgebraic Q hQ hσ

end Layer2_3

section Layer2_4

/-- **Layer 2.4, a Frobenius restricts to a Frobenius** along a normal subextension, with no
power. -/
example {K M L : Type*} [Field K] [Field M] [Field L] [Algebra K M] [Algebra M L] [Algebra K L]
    [IsScalarTower K M L] [Normal K M] {Q : Ideal (𝓞 L)} {σ : L ≃ₐ[K] L}
    (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    IsArithFrobAt (𝓞 K) (σ.restrictNormal M) (Q.under (𝓞 M)) :=
  hσ.restrictNormal

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [IsGalois K L]

/-- **Layer 2.4, functoriality of the Artin symbol along restriction**, at the level of the
conjugacy class. The unramified hypothesis for `M/K` is derived from the one for `L/K`. -/
theorem artinSymbol_map_restrictNormalHom {M : Type*} [Field M] [NumberField M] [Algebra K M]
    [Algebra M L] [IsScalarTower K M L] [IsGalois K M] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ConjClasses.map (AlgEquiv.restrictNormalHom (F := K) (K₁ := L) M)
        (NumberField.artinSymbol 𝔭 hur) =
      NumberField.artinSymbol 𝔭 (fun P _ _ ↦
        TauCeti.RamificationInertia.isUnramifiedAt_of_isUnramifiedIn (S := 𝓞 L)
          (fun Q hQ hQ' ↦ @hur Q hQ hQ') P) :=
  NumberField.artinSymbol_map_restrictNormalHom 𝔭 hur

/-- **Layer 2.4, the tower formula** `Frob_{L/M}(Q) = Frob_{L/K}(Q) ^ f(Q ∩ M / 𝔭)`, relative to one
prime `Q` of `L` above an unramified `𝔭`. -/
theorem exists_isArithFrobAt_pow_inertiaDeg (M : Type*) [Field M] [NumberField M]
    [Algebra K M] [Algebra M L] [IsScalarTower K M L] [IsGalois M L]
    (Q : Ideal (𝓞 L)) [Q.IsPrime] (𝔓 : Ideal (𝓞 M)) (𝔭 : Ideal (𝓞 K))
    (hQM : Q.under (𝓞 M) = 𝔓) (hQK : Q.under (𝓞 K) = 𝔭)
    (hur : ∀ (Q' : Ideal (𝓞 L)) [Q'.IsPrime] [Q'.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q')
    (σ : L ≃ₐ[K] L) (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    ∃ τ : L ≃ₐ[M] L, IsArithFrobAt (𝓞 M) τ Q ∧
      AlgEquiv.restrictScalars K τ = σ ^ 𝔓.inertiaDeg (𝓞 K) :=
  NumberField.exists_isArithFrobAt_pow_inertiaDeg M Q 𝔓 𝔭 hQM hQK hur σ hσ

end Layer2_4

section Layer2_5

open TauCeti.NumberFieldArithmetic

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 2.5, the carrier `J^S`**: invertible fractional ideals with multiplicity zero at every
prime of `S`. -/
example (S : Finset (HeightOneSpectrum (𝓞 K))) (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    I ∈ idealsAway S ↔
      ∀ v ∈ S, FractionalIdeal.count K v (I : FractionalIdeal (𝓞 K)⁰ K) = 0 :=
  mem_idealsAway_iff

/-- **Layer 2.5, `J^S` is generated by the primes outside `S`.** -/
example (S : Finset (HeightOneSpectrum (𝓞 K))) :
    idealsAway S = Subgroup.closure {I : (FractionalIdeal (𝓞 K)⁰ K)ˣ |
      ∃ v : HeightOneSpectrum (𝓞 K), v ∉ S ∧
        ((I : FractionalIdeal (𝓞 K)⁰ K) = (v.asIdeal : FractionalIdeal (𝓞 K)⁰ K))} :=
  idealsAway_eq_closure_primes S

/-- **Layer 2.5, the inclusion homomorphism** for `S ⊆ S'`, which does not change the underlying
fractional ideal. -/
example {S S' : Finset (HeightOneSpectrum (𝓞 K))} (h : S ⊆ S') (I : idealsAway (K := K) S') :
    ((idealsAwayInclusion h I : idealsAway (K := K) S) : (FractionalIdeal (𝓞 K)⁰ K)ˣ) = I :=
  coe_idealsAwayInclusion h I

/-- **Layer 2.5, the integral carrier**: nonzero integral ideals divisible by no prime of `S`. -/
example (S : Finset (HeightOneSpectrum (𝓞 K))) (I : Ideal (𝓞 K)) :
    I ∈ integralIdealsAway S ↔ I ≠ ⊥ ∧ ∀ v ∈ S, ¬ v.asIdeal ∣ I :=
  mem_integralIdealsAway_iff

/-- **Layer 2.5, the integral-to-fractional homomorphism** does not change the ideal. -/
example (S : Finset (HeightOneSpectrum (𝓞 K))) (I : integralIdealsAway (K := K) S) :
    (((integralIdealsAwayHom S I : idealsAway (K := K) S) : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
      FractionalIdeal (𝓞 K)⁰ K) = I :=
  coe_integralIdealsAwayHom S I

/-- **Layer 2.5, the unramified hypothesis descends to an intermediate field.** One hypothesis
about the top field gives the hypothesis for every subextension, so the functoriality equation
below takes no second unramified hypothesis. -/
theorem isUnramifiedAway_of_intermediateField (M : Type*) [Field M] [NumberField M]
    {L : Type*} [Field L] [NumberField L] [Algebra K M] [Algebra M L] [Algebra K L]
    [IsScalarTower K M L] (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 M)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q :=
  NumberField.isUnramifiedAway_of_intermediateField M S hur

section ArtinHomAway

variable {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
  (hab : ∀ σ τ : L ≃ₐ[K] L, Commute σ τ)
  (S : Finset (HeightOneSpectrum (𝓞 K)))
  (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
    ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q)

/-- **Layer 2.5, the ideal-theoretic Artin map** `artinHomAway S hur : J^S →* Gal(L/K)`, for an
abelian `L/K`, with the excluded set a parameter. -/
noncomputable example : idealsAway (K := K) S →* (L ≃ₐ[K] L) :=
  artinHomAway (L := L) hab S hur

/-- **Layer 2.5, the value at a prime outside `S` is the Frobenius there.** -/
theorem artinHomAway_apply_prime (I : idealsAway (K := K) S) (v : HeightOneSpectrum (𝓞 K))
    (hv : v ∉ S)
    (hI : ((I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K) =
      (v.asIdeal : FractionalIdeal (𝓞 K)⁰ K))
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal] (σ : L ≃ₐ[K] L)
    (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    artinHomAway (L := L) hab S hur I = σ :=
  TauCeti.NumberFieldArithmetic.artinHomAway_apply_prime hab S hur I v hv hI Q σ hσ

/-- **Layer 2.5, the values on primes determine the map.** -/
theorem artinHomAway_eq_of_apply_prime (φ : idealsAway (K := K) S →* (L ≃ₐ[K] L))
    (hφ : ∀ (I : idealsAway (K := K) S) (v : HeightOneSpectrum (𝓞 K)), v ∉ S →
      ((I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K) =
        (v.asIdeal : FractionalIdeal (𝓞 K)⁰ K) →
      ∀ (Q : Ideal (𝓞 L)) (_ : Q.IsPrime) (_ : Q.LiesOver v.asIdeal) (σ : L ≃ₐ[K] L),
        IsArithFrobAt (𝓞 K) σ Q → φ I = σ) :
    φ = artinHomAway (L := L) hab S hur :=
  TauCeti.NumberFieldArithmetic.artinHomAway_eq_of_apply_prime hab S hur φ hφ

/-- **Layer 2.5, `S`-monotonicity of the map**, as an equation of homomorphisms on
`idealsAway S'`. -/
theorem artinHomAway_mono (S' : Finset (HeightOneSpectrum (𝓞 K))) (h : S ⊆ S')
    (hur' : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S' →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    artinHomAway (L := L) hab S' hur' =
      (artinHomAway (L := L) hab S hur).comp (idealsAwayInclusion h) :=
  TauCeti.NumberFieldArithmetic.artinHomAway_mono hab S hur S' h hur'

/-- **Layer 2.5, functoriality in `L`, as an equation.** Restriction to a normal intermediate field
`M` carries the Artin map of `L/K` to that of `M/K`, on the same carrier; the commutativity and the
unramified hypothesis for `M/K` are both derived from those for `L/K`. -/
theorem artinHomAway_restrict (M : Type*) [Field M] [NumberField M] [Algebra K M] [Algebra M L]
    [IsScalarTower K M L] [IsGalois K M] :
    (AlgEquiv.restrictNormalHom (F := K) (K₁ := L) M).comp (artinHomAway (L := L) hab S hur) =
      artinHomAway (L := M) (TauCeti.commute_of_tower (K := K) (L := L) (M := M) hab) S
        (NumberField.isUnramifiedAway_of_intermediateField M S hur) :=
  TauCeti.NumberFieldArithmetic.artinHomAway_restrict hab S hur M

/-- **Layer 2.5, the integral Artin homomorphism** is the Artin map read through the integral
carrier. -/
example (I : integralIdealsAway (K := K) S) :
    artinHomAwayIntegral (L := L) hab S hur I =
      artinHomAway (L := L) hab S hur (integralIdealsAwayHom S I) :=
  artinHomAwayIntegral_apply hab S hur I

/-- **Layer 2.5, the value of the integral Artin homomorphism at a prime outside `S`.** -/
theorem artinHomAwayIntegral_apply_prime (v : HeightOneSpectrum (𝓞 K)) (hv : v ∉ S)
    (hmem : v.asIdeal ∈ integralIdealsAway (K := K) S)
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal] (σ : L ≃ₐ[K] L)
    (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    artinHomAwayIntegral (L := L) hab S hur ⟨v.asIdeal, hmem⟩ = σ :=
  TauCeti.NumberFieldArithmetic.artinHomAwayIntegral_apply_prime hab S hur v hv hmem Q σ hσ

end ArtinHomAway

/-- **Layer 2.5, the edge case `S = ∅`**, allowed when `L/K` is unramified everywhere: the Artin map
on all invertible fractional ideals, sending each prime to its Frobenius. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (hab : ∀ σ τ : L ≃ₐ[K] L, Commute σ τ)
    (hur : ∀ (v : HeightOneSpectrum (𝓞 K)) (Q : Ideal (𝓞 L)) [Q.IsPrime]
      [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q)
    (v : HeightOneSpectrum (𝓞 K)) (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal]
    (σ : L ≃ₐ[K] L) (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    unramifiedArtinHom (L := L) hab hur (v.unitOfPrime K) = σ :=
  unramifiedArtinHom_apply_prime hab hur v Q σ hσ

end Layer2_5

section Layer2_6

/-- **Layer 2.6, the cyclotomic Frobenius is `p mod n`**, as an `iff`: an automorphism is a
Frobenius above `p ∤ n` exactly when `galEquivZMod` sends it to the unit `p`. -/
example {n : ℕ} [NeZero n] {F : Type*} [Field F] [NumberField F] [IsCyclotomicExtension {n} ℚ F]
    {p : ℕ} [Fact p.Prime] (hp : p.Coprime n) (Q : Ideal (𝓞 F)) [Q.IsPrime]
    [Q.LiesOver (Ideal.span {(p : ℤ)})] (σ : F ≃ₐ[ℚ] F) :
    IsArithFrobAt ℤ σ Q ↔ IsCyclotomicExtension.Rat.galEquivZMod n F σ = ZMod.unitOfCoprime p hp :=
  TauCeti.NumberField.isArithFrobAt_iff_galEquivZMod_eq_unitOfCoprime hp Q σ

/-- **Layer 2.6, the quadratic Frobenius**, for this roadmap's chosen Frobenius element, with all
four hypotheses written out: `θ` an integral generator with `minpoly ℤ θ = X² − d`, `p` odd and
prime to `d`. -/
example {K : Type*} [Field K] [NumberField K] [IsGalois ℚ K] {θ : 𝓞 K} {d : ℤ}
    (hmin : minpoly ℤ θ = X ^ 2 - C d) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    {p : ℕ} [Fact p.Prime] (hodd : p ≠ 2) (hd : ¬ (p : ℤ) ∣ d)
    (Q : Ideal (𝓞 K)) [Q.IsPrime] [Q.LiesOver (Ideal.span {(p : ℤ)})] [Finite (𝓞 K ⧸ Q)] :
    arithFrobAt ℤ (K ≃ₐ[ℚ] K) Q = 1 ↔ legendreSym p d = 1 :=
  TauCeti.NumberField.arithFrobAt_eq_one_iff_legendreSym_eq_one hmin hgen hodd hd Q

end Layer2_6

section Layer2_7

open NumberField NumberField.InfinitePlace TauCeti.NumberField

variable (K : Type*) [Field K] {L : Type*} [Field L] [Algebra K L] [IsGalois K L]

/-- **Layer 2.7, the selection hypothesis.** `w.IsRamified K` is Mathlib's: `w` is a complex place
of `L` above a real place of `K`. -/
example (w : InfinitePlace L) :
    w.IsRamified K ↔ w.IsComplex ∧ (w.comap (algebraMap K L)).IsReal :=
  isRamified_iff

/-- **Layer 2.7, `complexConjugationAt K w hw` conjugates the embedding of `w`**, and is the unique
automorphism that does. -/
example (w : InfinitePlace L) (hw : w.IsRamified K) :
    ComplexEmbedding.IsConj w.embedding (complexConjugationAt K w hw) ∧
      ∀ σ : L ≃ₐ[K] L, ComplexEmbedding.IsConj w.embedding σ →
        σ = complexConjugationAt K w hw :=
  ⟨isConj_complexConjugationAt K w hw, fun _ hσ ↦ eq_complexConjugationAt K hw hσ⟩

/-- **Layer 2.7, stabilizer membership, nontriviality and order two.** -/
example (w : InfinitePlace L) (hw : w.IsRamified K) :
    complexConjugationAt K w hw ∈ MulAction.stabilizer (L ≃ₐ[K] L) w ∧
      complexConjugationAt K w hw ≠ 1 ∧ orderOf (complexConjugationAt K w hw) = 2 :=
  ⟨complexConjugationAt_mem_stabilizer K w hw, complexConjugationAt_ne_one K w hw,
    orderOf_complexConjugationAt K w hw⟩

/-- **Layer 2.7, uniqueness among the nonidentity elements of the stabilizer.** -/
example (w : InfinitePlace L) (hw : w.IsRamified K) {σ : L ≃ₐ[K] L}
    (hmem : σ ∈ MulAction.stabilizer (L ≃ₐ[K] L) w) (hne : σ ≠ 1) :
    σ = complexConjugationAt K w hw :=
  eq_complexConjugationAt_of_mem_stabilizer_of_ne_one K w hw hmem hne

/-- **Layer 2.7, conjugacy covariance.** -/
example (w : InfinitePlace L) (hw : w.IsRamified K) (σ : L ≃ₐ[K] L) :
    complexConjugationAt K (σ • w) ((not_congr isUnramified_smul_iff).mpr hw) =
      σ * complexConjugationAt K w hw * σ⁻¹ :=
  complexConjugationAt_smul K w hw σ

/-- **Layer 2.7, restriction in a normal tower, the real branch.** -/
example {F : Type*} [Field F] [Algebra K F] [Algebra F L] [IsScalarTower K F L] [Normal K F]
    (w : InfinitePlace L) (hw : w.IsRamified K) (hv : (w.comap (algebraMap F L)).IsReal) :
    (complexConjugationAt K w hw).restrictNormal F = 1 :=
  complexConjugationAt_restrictNormal_eq_one_of_isReal K w hw hv

/-- **Layer 2.7, restriction in a normal tower, the complex branch.** -/
example {F : Type*} [Field F] [Algebra K F] [Algebra F L] [IsScalarTower K F L] [Normal K F]
    (w : InfinitePlace L) (hw : w.IsRamified K) (hv : (w.comap (algebraMap F L)).IsComplex) :
    letI : Algebra.IsSeparable K F := Algebra.isSeparable_tower_bot_of_isSeparable K F L
    letI : IsGalois K F := ⟨⟩
    (complexConjugationAt K w hw).restrictNormal F =
      complexConjugationAt K (w.comap (algebraMap F L))
        (isRamified_comap_of_isComplex K hw.isReal hv) :=
  complexConjugationAt_restrictNormal_of_isComplex K w hw hv

/-- **Layer 2.7, the CM specialization**: every place-dependent element is `IsCMField.complexConj`. -/
example (F : Type*) [Field F] [NumberField F] [NumberField.IsCMField F] (w : InfinitePlace F) :
    NumberField.IsCMField.complexConj F =
      complexConjugationAt (NumberField.maximalRealSubfield F) w
        (isRamified_maximalRealSubfield F w) :=
  complexConj_eq_complexConjugationAt F w

end Layer2_7

/-! ## Layer 3: the index, Dedekind–Kummer, and Dedekind's theorem -/

section Layer3_1

open TauCeti.NumberField

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 3.1, the junk-free carrier**: integral elements generating `K` over `ℚ`. -/
example : IntegralPrimitiveElement K = {θ : 𝓞 K // Algebra.adjoin ℚ {(θ : K)} = ⊤} :=
  rfl

/-- **Layer 3.1, the index** `[𝓞 K : ℤ[θ]]` on that carrier. -/
example (θ : IntegralPrimitiveElement K) :
    θ.index = Nat.card (𝓞 K ⧸ (Algebra.adjoin ℤ {θ.1}).toSubmodule) :=
  θ.index_def

/-- **Layer 3.1, positivity of the index.** -/
example (θ : IntegralPrimitiveElement K) : 0 < θ.index :=
  θ.index_pos

/-- **Layer 3.1, translation invariance**, at the level of the order: `ℤ[θ + n] = ℤ[θ]`, hence
equal indices. -/
example (θ : IntegralPrimitiveElement K) (n : ℤ) :
    ((θ.addIntCast n : 𝓞 K) = θ.1 + algebraMap ℤ (𝓞 K) n) ∧
      (θ.addIntCast n).adjoin = θ.adjoin ∧ (θ.addIntCast n).index = θ.index :=
  ⟨θ.coe_addIntCast n, θ.adjoin_addIntCast n, θ.index_addIntCast n⟩

/-- **Layer 3.1, negation invariance**: `ℤ[−θ] = ℤ[θ]`, hence equal indices. -/
example (θ : IntegralPrimitiveElement K) :
    ((-θ : IntegralPrimitiveElement K) : 𝓞 K) = -θ.1 ∧ (-θ).adjoin = θ.adjoin ∧
      (-θ).index = θ.index :=
  ⟨θ.coe_neg, θ.adjoin_neg, θ.index_neg⟩

/-- **Layer 3.1, the edge case `K = ℚ`**: every integral generator has index `1`, since
`𝓞 ℚ = ℤ` is already contained in `ℤ[θ]`. -/
theorem index_eq_one_of_rat (θ : IntegralPrimitiveElement ℚ) : θ.index = 1 := by
  refine θ.index_eq_one_iff.mpr (eq_top_iff.mpr fun x _ ↦ ?_)
  obtain ⟨n, rfl⟩ := Rat.ringOfIntegersEquiv.symm.surjective x
  have hn : Rat.ringOfIntegersEquiv.symm n = algebraMap ℤ (𝓞 ℚ) n := by
    apply NumberField.RingOfIntegers.ext
    rw [Rat.ringOfIntegersEquiv_symm_apply_coe]
    simp
  rw [hn]
  exact Subalgebra.algebraMap_mem _ n

/-- **Layer 3.2, the power basis of an integral generator**, with generator `θ`. -/
example (θ : IntegralPrimitiveElement K) : θ.powerBasis.gen = (θ.1 : K) :=
  θ.powerBasis_gen

/-- **Layer 3.2, the minimal polynomials agree after the cast.** -/
example (θ : IntegralPrimitiveElement K) :
    minpoly ℚ (θ.1 : K) = (minpoly ℤ θ.1).map (algebraMap ℤ ℚ) := by
  rw [minpoly.isIntegrallyClosed_eq_field_fractions' ℚ
    (NumberField.RingOfIntegers.isIntegral_coe θ.1), NumberField.RingOfIntegers.minpoly_coe]

/-- **Layer 3.2, the discriminant comparison, with the cast written out.** -/
example (θ : IntegralPrimitiveElement K) :
    Algebra.discr ℚ θ.powerBasis.basis = algebraMap ℤ ℚ (minpoly ℤ θ.1).discr :=
  θ.discr_powerBasis_eq_minpoly_discr

/-- **Layer 3.3, the index formula** `disc (minpoly θ) = index(θ)² · disc K`. -/
example (θ : IntegralPrimitiveElement K) :
    (minpoly ℤ θ.1).discr = (θ.index : ℤ) ^ 2 * NumberField.discr K :=
  θ.discr_minpoly_eq_index_sq_mul_discr

/-- **Layer 3.4, index and exponent have the same prime divisors.** -/
example (θ : IntegralPrimitiveElement K) (p : ℕ) [Fact p.Prime] :
    p ∣ θ.index ↔ p ∣ RingOfIntegers.exponent θ.1 :=
  θ.dvd_index_iff_dvd_exponent

/-- **Layer 3.5, the checkable hypothesis**: `p ∤ disc (minpoly θ)` implies `p ∤ exponent θ`. -/
example (θ : IntegralPrimitiveElement K) (p : ℕ)
    (hp : ¬ (p : ℤ) ∣ (minpoly ℤ θ.1).discr) :
    ¬ p ∣ RingOfIntegers.exponent θ.1 :=
  θ.not_dvd_exponent_of_not_dvd_discr_minpoly hp

end Layer3_1

section Layer3_6

open UniqueFactorizationMonoid TauCeti.KummerDedekind
open scoped Classical

attribute [local instance] Ideal.Quotient.field

variable {R S : Type*} [CommRing R] [CommRing S] [Algebra R S] [IsDomain R] [IsIntegrallyClosed R]
  [IsDedekindDomain S] [Module.IsTorsionFree R S] {x : S} {p : Ideal R}
  (hp : p.IsMaximal) (hp0 : p ≠ ⊥) (hx : (conductor R x).comap (algebraMap R S) ⊔ p = ⊤)
  (hx' : IsIntegral R x)

/-- **Layer 3.6, the relative Dedekind–Kummer correspondence**: for `p` coprime to the conductor
of `x`, primes of `S` above `p` correspond to the monic irreducible factors of
`minpoly R x mod p`. -/
noncomputable example :
    p.primesOver S ≃
      {d : (R ⧸ p)[X] | d ∈ normalizedFactors ((minpoly R x).map (Ideal.Quotient.mk p))} :=
  primesOverEquivNormalizedFactorsMinPolyMk hp hp0 hx hx'

/-- **Layer 3.6, the span formula** for the prime attached to a factor `Q mod p`. -/
example {Q : R[X]}
    (hQ : Q.map (Ideal.Quotient.mk p) ∈
      normalizedFactors ((minpoly R x).map (Ideal.Quotient.mk p))) :
    (((primesOverEquivNormalizedFactorsMinPolyMk hp hp0 hx hx').symm
        ⟨Q.map (Ideal.Quotient.mk p), hQ⟩ : p.primesOver S) : Ideal S) =
      Ideal.span (p.map (algebraMap R S) ∪ {aeval x Q}) :=
  primesOverEquivNormalizedFactorsMinPolyMk_symm_apply_coe hp hp0 hx hx' hQ

/-- **Layer 3.6, `f` is the degree of the factor and `e` its multiplicity.** -/
example {d : (R ⧸ p)[X]}
    (hd : d ∈ normalizedFactors ((minpoly R x).map (Ideal.Quotient.mk p))) :
    (((primesOverEquivNormalizedFactorsMinPolyMk hp hp0 hx hx').symm ⟨d, hd⟩ :
        p.primesOver S) : Ideal S).inertiaDeg R = d.natDegree ∧
      (((primesOverEquivNormalizedFactorsMinPolyMk hp hp0 hx hx').symm ⟨d, hd⟩ :
        p.primesOver S) : Ideal S).ramificationIdx R =
        multiplicity d ((minpoly R x).map (Ideal.Quotient.mk p)) :=
  ⟨inertiaDeg_primesOverEquivNormalizedFactorsMinPolyMk_symm_apply hp hp0 hx hx' hd,
    ramificationIdx_primesOverEquivNormalizedFactorsMinPolyMk_symm_apply hp hp0 hx hx' hd⟩

/-- **Layer 3.6, the converse of `irreducible_map_of_irreducible_minpoly`**: `p` stays prime in `S`
exactly when `minpoly R x mod p` is irreducible. -/
example : Irreducible (p.map (algebraMap R S)) ↔
    Irreducible ((minpoly R x).map (Ideal.Quotient.mk p)) :=
  Ideal.irreducible_map_iff_irreducible_minpoly hp hp0 hx hx'

end Layer3_6

section Layer3_7

open TauCeti.NumberField

variable {K : Type*} [Field K] [NumberField K] (θ : IntegralPrimitiveElement K) {p : ℕ}
  {ι : Type*} [Fintype ι] {φ : ι → (ZMod p)[X]} {e : ι → ℕ} {Φ : ι → ℤ[X]} {H : ℤ[X]}

/-- **Layer 3.7, `f − ∏ Φᵢ^{eᵢ}` is divisible by `p` coefficientwise**, so `H` is well defined in
`ℤ[X]`. -/
example (hfact : (minpoly ℤ θ.1).map (Int.castRingHom (ZMod p)) = ∏ i, φ i ^ e i)
    (hΦ : ∀ i, (Φ i).map (Int.castRingHom (ZMod p)) = φ i) :
    ∃ H : ℤ[X], C (p : ℤ) * H = minpoly ℤ θ.1 - ∏ i, Φ i ^ e i :=
  θ.exists_C_mul_eq_minpoly_sub_prod hfact hΦ

variable [Fact p.Prime]

/-- **Layer 3.7, Dedekind's criterion** over `ℤ`: with `φ` the distinct monic irreducible factors
of `f mod p`, each of positive multiplicity, `Φ` monic lifts and `p H = f − ∏ Φᵢ^{eᵢ}`. The
factorization of `f mod p` is recovered from `hH` and `hΦ`, so it is not a separate
hypothesis. -/
example (hφ : ∀ i, Irreducible (φ i)) (hφm : ∀ i, (φ i).Monic) (hinj : Function.Injective φ)
    (he : ∀ i, 0 < e i) (hΦ : ∀ i, (Φ i).map (Int.castRingHom (ZMod p)) = φ i)
    (hH : C (p : ℤ) * H = minpoly ℤ θ.1 - ∏ i, Φ i ^ e i) :
    ¬ p ∣ θ.index ↔ ∀ i, e i = 1 ∨ ¬ φ i ∣ H.map (Int.castRingHom (ZMod p)) :=
  θ.not_dvd_index_iff hφ hφm hinj he hΦ hH

/-- **Layer 3.7, independence of the criterion from the choice of lifts.** -/
example (hφ : ∀ i, Irreducible (φ i)) (hφm : ∀ i, (φ i).Monic) (hinj : Function.Injective φ)
    (he : ∀ i, 0 < e i) {Φ' : ι → ℤ[X]} {H' : ℤ[X]}
    (hΦ : ∀ i, (Φ i).map (Int.castRingHom (ZMod p)) = φ i)
    (hH : C (p : ℤ) * H = minpoly ℤ θ.1 - ∏ i, Φ i ^ e i)
    (hΦ' : ∀ i, (Φ' i).map (Int.castRingHom (ZMod p)) = φ i)
    (hH' : C (p : ℤ) * H' = minpoly ℤ θ.1 - ∏ i, Φ' i ^ e i) :
    (∀ i, e i = 1 ∨ ¬ φ i ∣ H.map (Int.castRingHom (ZMod p))) ↔
      ∀ i, e i = 1 ∨ ¬ φ i ∣ H'.map (Int.castRingHom (ZMod p)) :=
  θ.forall_eq_one_or_not_dvd_map_iff hφ hφm hinj he hΦ hH hΦ' hH'

/-- **Layer 3.7, the squarefree corollary.** -/
example (hsq : Squarefree ((minpoly ℤ θ.1).map (Int.castRingHom (ZMod p)))) : ¬ p ∣ θ.index :=
  θ.not_dvd_index_of_squarefree_map hsq

end Layer3_7

section Layer3_8

/-- **Layer 3.8, splitting fields of rational polynomials are number fields**, and more generally
splitting fields over any number field. -/
example (f : ℚ[X]) : NumberField f.SplittingField :=
  inferInstance

end Layer3_8

section Layer3_9

attribute [local instance] Gal.splits_ℚ_ℂ

open scoped Classical in
/-- **Layer 3.9, Dedekind's theorem.** The degrees of the monic irreducible factors of
`minpoly θ mod p` are the cycle type of a Frobenius at a prime above `p`, acting on the roots in a
number field `M` where the polynomial splits, with the fixed points added back as parts `1`. Only
squarefreeness of `minpoly θ mod p` is assumed; it implies `p ∤ exponent θ`. -/
example {M : Type*} [Field M] [NumberField M] {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K}
    {p : ℕ} [Fact p.Prime] (hsq : Squarefree ((minpoly ℤ θ).map (Int.castRingHom (ZMod p))))
    [Fact (((minpoly ℚ (θ : K)).map (algebraMap ℚ M)).Splits)]
    (Q : Ideal (𝓞 M)) [Q.IsPrime] [Q.LiesOver (Ideal.span {(p : ℤ)})]
    {σ : M ≃ₐ[ℚ] M} (hσ : IsArithFrobAt ℤ σ Q) :
    (RingOfIntegers.monicFactorsMod θ p).val.map natDegree =
      (Gal.galActionHom (minpoly ℚ (θ : K)) M
          (Gal.restrict (minpoly ℚ (θ : K)) M σ)).cycleType +
        Multiset.replicate (Nat.card (Function.fixedPoints
          (Gal.galActionHom (minpoly ℚ (θ : K)) M
            (Gal.restrict (minpoly ℚ (θ : K)) M σ)))) 1 :=
  TauCeti.NumberField.factorizationType_eq_cycleType_isArithFrobAt hsq Q hσ

open scoped Classical in
/-- **Layer 3.10, the polynomial-side corollary, for arbitrary monic `f`**, reducible or not: for
`p ∤ disc f` some element of the Galois group of `f` acts on the complex roots with cycle type,
fixed points restored, equal to the factor-degree multiset of `f mod p`. -/
theorem exists_gal_fullCycleType_eq_factorizationType
    (f : ℤ[X]) (hf : f.Monic) (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr) :
    ∃ σ : (f.map (Int.castRingHom ℚ)).Gal,
      (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ σ).cycleType +
          Multiset.replicate
            (Fintype.card ((f.map (Int.castRingHom ℚ)).rootSet ℂ) -
              (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ σ).support.card) 1 =
        Multiset.map (fun g => g.natDegree)
          (UniqueFactorizationMonoid.normalizedFactors (f.map (Int.castRingHom (ZMod p)))) :=
  TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType f hf p hp

end Layer3_9

section Layer3_11

open TauCeti.NumberField

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 3.11, common index divisors**: `p` divides the index of every integral generator. -/
example (p : ℕ) :
    IsCommonIndexDivisor p K ↔ ∀ θ : IntegralPrimitiveElement K, p ∣ θ.index :=
  isCommonIndexDivisor_iff

/-- **Layer 3.11, the counting obstruction.** If more primes of residue degree `d` lie above `p`
than there are monic irreducibles of degree `d` over `𝔽_p`, then `p` is a common index divisor and
`𝓞 K` is not monogenic. -/
theorem isCommonIndexDivisor_and_not_isMonogenic_of_ncard_lt_ncard (p : ℕ) [Fact p.Prime]
    {d : ℕ} (hlt : (monicIrreduciblesOfDegree (ZMod p) d).ncard <
      (primesOverOfInertiaDeg K p d).ncard) :
    IsCommonIndexDivisor p K ∧ ¬ IsMonogenic K := by
  have h := isCommonIndexDivisor_of_ncard_lt_ncard p hlt
  exact ⟨h, fun hm ↦ h.not_exists_index_eq_one (Fact.out : p.Prime).ne_one
    (isMonogenic_iff_exists_index_eq_one.mp hm)⟩

end Layer3_11

/-! ## Layer 4: the relative discriminant, algebraically -/

section Layer4_1

open TauCeti

variable {A B : Type*} [CommRing A] [IsDedekindDomain A] [CommRing B] [IsDedekindDomain B]
  [Algebra A B] [Module.Finite A B] [Module.IsTorsionFree A B]

/-- **Layer 4.1, the relative discriminant ideal, as a named definition**, with exactly the
hypotheses of `Ideal.relNorm` and `differentIdeal` and no separability. -/
example : relDiscr A B = Ideal.relNorm A (differentIdeal A B) :=
  relDiscr_def

/-- **Layer 4.1, the two facts that hold with no separability hypothesis.** -/
example : (relDiscr A B = ⊥ ↔ differentIdeal A B = ⊥) ∧ relDiscr A A = ⊤ :=
  ⟨relDiscr_eq_bot_iff, relDiscr_self⟩

end Layer4_1

section Layer4_2

open TauCeti

attribute [local instance] FractionRing.liftAlgebra

variable {A B : Type*} [CommRing A] [IsDedekindDomain A] [CommRing B] [IsDedekindDomain B]
  [Algebra A B] [Module.Finite A B] [Module.IsTorsionFree A B]

/-- **Layer 4.2, `relDiscr A B ≠ ⊥`** under separability of the fraction fields. -/
example [Algebra.IsSeparable (FractionRing A) (FractionRing B)] : relDiscr A B ≠ ⊥ :=
  relDiscr_ne_bot

/-- **Layer 4.2, multiplicativity in a tower** `A ⊆ B ⊆ C`, with separability on the top
extension only. -/
example {C : Type*} [CommRing C] [IsDedekindDomain C] [Algebra B C] [Algebra A C]
    [IsScalarTower A B C] [Module.Finite B C] [Module.Finite A C] [Module.IsTorsionFree B C]
    [Module.IsTorsionFree A C] [Algebra.IsSeparable (FractionRing A) (FractionRing C)] :
    relDiscr A C = relDiscr A B ^ Module.finrank B C * Ideal.relNorm A (relDiscr B C) :=
  TauCeti.relDiscr_tower

/-- **Layer 4.2, localization**, for an arbitrary pair `IsLocalization M Aₘ` and
`IsLocalization (algebraMapSubmonoid B M) Bₘ`; at a prime `p` take `M = p.primeCompl`. -/
example (M : Submonoid A) (Aₘ Bₘ : Type*) [CommRing Aₘ] [CommRing Bₘ]
    [Algebra A Aₘ] [Algebra B Bₘ] [Algebra Aₘ Bₘ] [Algebra A Bₘ]
    [IsScalarTower A Aₘ Bₘ] [IsScalarTower A B Bₘ]
    [IsLocalization M Aₘ] [IsLocalization (Algebra.algebraMapSubmonoid B M) Bₘ]
    [IsDedekindDomain Aₘ] [IsDedekindDomain Bₘ] [Module.Finite Aₘ Bₘ]
    [Module.IsTorsionFree Aₘ Bₘ] [Algebra.IsSeparable (FractionRing A) (FractionRing B)] :
    (relDiscr A B).map (algebraMap A Aₘ) = relDiscr Aₘ Bₘ :=
  relDiscr_localization M Aₘ Bₘ

/-- **Layer 4.2, the ramification criterion**: `p` divides `relDiscr A B` exactly when some prime
above `p` fails `Algebra.IsUnramifiedAt`. No residue separability. -/
example [Algebra.IsSeparable (FractionRing A) (FractionRing B)] {p : Ideal A} [p.IsPrime]
    (hp : p ≠ ⊥) :
    p ∣ relDiscr A B ↔ ∃ P : p.primesOver B, ¬ Algebra.IsUnramifiedAt A (P : Ideal B) :=
  dvd_relDiscr_iff_exists_not_isUnramifiedAt hp

variable (K : Type*) [Field K] [NumberField K]

/-- **Layer 4.2, the reconciliation with the signed integer**: `relDiscr ℤ (𝓞 K) = (discr K)`. -/
example : relDiscr ℤ (𝓞 K) = Ideal.span {NumberField.discr K} :=
  TauCeti.NumberField.relDiscr_int_ringOfIntegers K

/-- **Layer 4.2, the number-field tower formula.** -/
example {L M : Type*} [Field L] [NumberField L] [Field M] [NumberField M] [Algebra K L]
    [Algebra L M] [Algebra K M] [IsScalarTower K L M] :
    relDiscr (𝓞 K) (𝓞 M) =
      relDiscr (𝓞 K) (𝓞 L) ^ Module.finrank L M * Ideal.relNorm (𝓞 K) (relDiscr (𝓞 L) (𝓞 M)) :=
  TauCeti.NumberField.relDiscr_tower K

/-- **Layer 4.2, the `e > 1` corollary for number fields**, where residue fields are finite. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] {p : Ideal (𝓞 K)} [p.IsPrime]
    (hp : p ≠ ⊥) :
    p ∣ relDiscr (𝓞 K) (𝓞 L) ↔
      ∃ P : p.primesOver (𝓞 L), 1 < (P : Ideal (𝓞 L)).ramificationIdx (𝓞 K) :=
  TauCeti.NumberField.dvd_relDiscr_iff_exists_one_lt_ramificationIdx hp

end Layer4_2

section Layer4_3

open TauCeti TauCeti.NumberField

variable (K : Type*) [Field K] [NumberField K] (L : Type*) [Field L] [NumberField L] [Algebra K L]

/-- **Layer 4.3, the ramified support**: the primes of `𝓞 K` dividing `relDiscr (𝓞 K) (𝓞 L)`,
equivalently those with a ramified prime above them. -/
example (v : HeightOneSpectrum (𝓞 K)) :
    (v ∈ ramifiedSupport K L ↔ v.asIdeal ∣ relDiscr (𝓞 K) (𝓞 L)) ∧
      (v ∈ ramifiedSupport K L ↔
        ∃ P : (v.asIdeal).primesOver (𝓞 L), 1 < (P : Ideal (𝓞 L)).ramificationIdx (𝓞 K)) :=
  ⟨mem_ramifiedSupport, mem_ramifiedSupport_iff_exists⟩

/-- **Layer 4.3, the case `L = K`.** -/
example : ramifiedSupport K K = ∅ :=
  ramifiedSupport_self K

/-- **Layer 4.3, monotonicity in a tower** `K ⊆ L ⊆ M`. -/
example {M : Type*} [Field M] [NumberField M] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M] :
    ramifiedSupport K L ⊆ ramifiedSupport K M :=
  ramifiedSupport_mono K

/-- **Layer 4.3, primes outside the ramified support are unramified**, which is the hypothesis
`artinHomAway` takes. -/
example :
    ∀ v : HeightOneSpectrum (𝓞 K), v ∉ ramifiedSupport K L →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q :=
  isUnramifiedAway_ramifiedSupport

/-- **Layer 4.3, the Artin map away from the ramified support**, which is the generic
`artinHomAway` at `S = ramifiedSupport K L`. -/
example [IsGalois K L] (hab : ∀ σ τ : L ≃ₐ[K] L, Commute σ τ) :
    TauCeti.NumberFieldArithmetic.artinHomAwayRamifiedSupport (L := L) hab =
      TauCeti.NumberFieldArithmetic.artinHomAway hab (ramifiedSupport K L)
        isUnramifiedAway_ramifiedSupport :=
  TauCeti.NumberFieldArithmetic.artinHomAwayRamifiedSupport_def hab

end Layer4_3

section Layer4_4

/-- **Layer 4.4, discriminants of bases in a tower**, for the product basis `b.smulTower c`. -/
example {K L M : Type*} [CommRing K] [CommRing L] [CommRing M] [Algebra K L] [Algebra L M]
    [Algebra K M] [IsScalarTower K L M] {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ]
    [DecidableEq κ] (b : Module.Basis ι K L) (c : Module.Basis κ L M) :
    Algebra.discr K (b.smulTower c) =
      Algebra.discr K b ^ Fintype.card κ * Algebra.norm K (Algebra.discr L c) :=
  Module.Basis.discr_smulTower b c

/-- **Layer 4.5, Stickelberger's congruence**: `discr K ≡ 0` or `1 mod 4`. -/
example (K : Type*) [Field K] [NumberField K] :
    NumberField.discr K % 4 = 0 ∨ NumberField.discr K % 4 = 1 :=
  TauCeti.NumberField.discr_emod_four_eq_zero_or_one K

end Layer4_4

/-! ## Layer 5: the global–local dictionary at finite places -/

section Layer5_1

open IsDedekindDomain.HeightOneSpectrum ValuativeRel

variable {K : Type*} [Field K] [NumberField K] (v : HeightOneSpectrum (𝓞 K))

/-- **Layer 5.1, the valuative relation on `K_v` is constructed**, from the completion valuation,
not taken as an arbitrary input. -/
example : instValuativeRelAdicCompletion (K := K) v = .ofValuation Valued.v :=
  rfl

/-- **Layer 5.1, the completion topology is the topology of that relation, and the relation is
nontrivial.** -/
example : IsValuativeTopology (v.adicCompletion K) ∧ ValuativeRel.IsNontrivial (v.adicCompletion K) :=
  ⟨inferInstance, inferInstance⟩

/-- **Layer 5.1, completions of number fields are nonarchimedean local fields**, as the full class
and for the canonical relation. -/
theorem isNonarchimedeanLocalField_adicCompletion :
    IsNonarchimedeanLocalField (v.adicCompletion K) :=
  inferInstance

/-- **Layer 5.1, the residue field of `K_v` is `𝓞 K ⧸ v`.** -/
noncomputable example : (𝓞 K ⧸ v.asIdeal) ≃+* 𝓀[v.adicCompletion K] :=
  v.residueFieldEquivAdicCompletion

/-- **Layer 5.1, the residue cardinality is `Ideal.absNorm v`.** -/
example : Nat.card 𝓀[v.adicCompletion K] = Ideal.absNorm v.asIdeal :=
  v.natCard_residueField_adicCompletion_eq_absNorm

/-- **Layer 5.1, the normalization.** The normalized valuation of `K_v` is the inverse of its adic
valuation, and Mathlib's `adicAbv` at a nonzero integer `x` is `q ^ (− v(x))` with
`q = Ideal.absNorm v`. -/
example (x : v.adicCompletion K) :
    TauCeti.normalizedValuationWithZero (v.adicCompletion K) x = (Valued.v x)⁻¹ :=
  normalizedValuationWithZero_adicCompletion v x

example (x : 𝓞 K) (hx : x ≠ 0) :
    NumberField.HeightOneSpectrum.adicAbv K v (algebraMap (𝓞 K) K x) =
      (Ideal.absNorm v.asIdeal : ℝ) ^ (-(multiplicity v.asIdeal (Ideal.span {x}) : ℤ)) := by
  rw [← TauCeti.GlobalNumberFields.normalizedAbsValue_inl]
  exact TauCeti.GlobalNumberFields.normalizedAbsValue_inl_algebraMap_eq_absNorm_zpow v x hx

/-- **Layer 5.1, the product formula as the cross-check on the normalization.** -/
example {x : K} (hx : x ≠ 0) :
    ∏ᶠ w : TauCeti.GlobalNumberFields.Place K,
      TauCeti.GlobalNumberFields.normalizedAbsValue w x = 1 :=
  TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one hx

end Layer5_1

section Layer5_2

open IsDedekindDomain.HeightOneSpectrum ValuativeRel
open scoped AdicCompletionExtension

variable {K : Type*} [Field K] [NumberField K] {L : Type*} [Field L] [NumberField L] [Algebra K L]
  (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L)) [w.asIdeal.LiesOver v.asIdeal]

/-- **Layer 5.2, the canonical completion of an extension** `K_v →ₐ[K] L_w`, continuous, and the
algebra structure it induces. -/
example : Continuous (completionAlgHom v w) ∧
    algebraMap (v.adicCompletion K) (w.adicCompletion L) = (completionAlgHom v w).toRingHom :=
  ⟨continuous_completionAlgHom v w, algebraMap_eq_completionAlgHom v w⟩

/-- **Layer 5.2, uniqueness**: every continuous ring map `K_v → L_w` extending `K → L` is the
canonical one. -/
example (f : v.adicCompletion K →+* w.adicCompletion L) (hf : Continuous f)
    (hcomp : ∀ x : K, f (algebraMap K (v.adicCompletion K) x) =
      algebraMap L (w.adicCompletion L) (algebraMap K L x)) :
    f = (completionAlgHom v w).toRingHom :=
  eq_completionAlgHom_of_continuous v w f hf hcomp

/-- **Layer 5.2, the derived instances for the canonical structure**: scalar tower, continuous
scalar action and finiteness. -/
example : IsScalarTower K (v.adicCompletion K) (w.adicCompletion L) ∧
    ContinuousSMul (v.adicCompletion K) (w.adicCompletion L) ∧
    Module.Finite (v.adicCompletion K) (w.adicCompletion L) :=
  ⟨completionIsScalarTower v w, completionContinuousSMul v w,
    adicCompletion_moduleFinite (K := K) (L := L) v w⟩

/-- **Layer 5.2, valuation-order compatibility and the canonical `ValuativeExtension`.** -/
example (a b : v.adicCompletion K) :
    (completionAlgHom v w a ≤ᵥ completionAlgHom v w b ↔ a ≤ᵥ b) ∧
      ValuativeExtension (v.adicCompletion K) (w.adicCompletion L) :=
  ⟨completionAlgHom_vle_iff_vle v w a b, completionValuativeExtension v w⟩

/-- **Layer 5.2, the tower equation** `completionAlgHom u w ∘ completionAlgHom v u =
completionAlgHom v w`, for `w ∣ u ∣ v`. -/
example {M : Type*} [Field M] [NumberField M] [Algebra K M] [Algebra M L] [IsScalarTower K M L]
    (u : HeightOneSpectrum (𝓞 M)) [u.asIdeal.LiesOver v.asIdeal] [w.asIdeal.LiesOver u.asIdeal] :
    letI : w.asIdeal.LiesOver v.asIdeal := Ideal.LiesOver.trans w.asIdeal u.asIdeal v.asIdeal
    ((completionAlgHom u w).restrictScalars K).comp (completionAlgHom v u) =
      completionAlgHom v w :=
  completionAlgHom_comp v u w

end Layer5_2

section Layer5_3

open IsDedekindDomain.HeightOneSpectrum TauCeti
open scoped AdicCompletionExtension

attribute [local instance] Fintype.ofFinite

variable {K : Type*} [Field K] [NumberField K] (L : Type*) [Field L] [NumberField L] [Algebra K L]
  (v : HeightOneSpectrum (𝓞 K))

/-- **Layer 5.3, the semi-local decomposition** `K_v ⊗[K] L ≃ₐ[K_v] ∏_{w ∣ v} L_w`. -/
noncomputable example :
    v.adicCompletion K ⊗[K] L ≃ₐ[v.adicCompletion K]
      ((w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal}) →
        w.1.adicCompletion L) :=
  semilocalEquiv L v

/-- **Layer 5.3, its value on pure tensors**, which determines it. -/
example (a : v.adicCompletion K) (x : L)
    (w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal}) :
    semilocalEquiv L v (a ⊗ₜ x) w =
      algebraMap (v.adicCompletion K) (w.1.adicCompletion L) a *
        algebraMap L (w.1.adicCompletion L) x :=
  semilocalEquiv_tmul a x w

/-- **Layer 5.3, the two spellings of the index set**, `W v ≃ primesOver v (𝓞 L)`. -/
example (w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal}) :
    (liesOverEquivPrimesOver (𝓞 L) v w : Ideal (𝓞 L)) = w.1.asIdeal :=
  liesOverEquivPrimesOver_apply (𝓞 L) v w

/-- **Layer 5.3, the consequence `Σ_{w ∣ v} [L_w : K_v] = [L : K]`.** -/
example :
    ∑ w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal},
        Module.finrank (v.adicCompletion K) (w.1.adicCompletion L) = Module.finrank K L :=
  sum_finrank_adicCompletion_eq_finrank L v

/-- **Layer 5.3, the named construction steps**: the bijection between the irreducible factors of
the primitive-element polynomial over `K_v` and the places above `v`; the factor-field equivalence
with the completion, compatible with `L → L_w`; and the identification of the Chinese-remainder
assembly with `semilocalEquiv`. -/
example (q : completionFactors L v) (x : L) :
    factorFieldEquivCompletion L v q (factorFieldAlgHom L v q x) =
      algebraMap L ((completionFactorsEquivPlaces L v q).1.adicCompletion L) x :=
  factorFieldEquivCompletion_algebraMap L v q x

example : semilocalEquiv L v = (semilocalCrtEquiv L v).trans (factorFieldsEquivCompletions L v) :=
  semilocalEquiv_eq_crt L v

/-- **Layer 5.4, norm and trace as products and sums of local ones.** -/
example (x : L) :
    algebraMap K (v.adicCompletion K) (Algebra.norm K x) =
        ∏ w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal},
          Algebra.norm (v.adicCompletion K) (algebraMap L (w.1.adicCompletion L) x) ∧
      algebraMap K (v.adicCompletion K) (Algebra.trace K L x) =
        ∑ w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal},
          Algebra.trace (v.adicCompletion K) (w.1.adicCompletion L)
            (algebraMap L (w.1.adicCompletion L) x) :=
  ⟨algebraMap_norm_eq_prod_norm L v x, algebraMap_trace_eq_sum_trace L v x⟩

/-- **Layer 5.4, the base-change package**: norm and trace of `1 ⊗ x` after scalar extension. -/
example {R A B : Type*} [CommRing R] [CommRing A] [Algebra R A] [CommRing B] [Algebra R B]
    [Module.Free R B] [Module.Finite R B] (x : B) :
    Algebra.norm A ((1 : A) ⊗ₜ[R] x) = algebraMap R A (Algebra.norm R x) ∧
      Algebra.trace A (A ⊗[R] B) ((1 : A) ⊗ₜ[R] x) = algebraMap R A (Algebra.trace R B x) :=
  ⟨TauCeti.Algebra.norm_baseChange_tmul x, TauCeti.Algebra.trace_baseChange_tmul x⟩

end Layer5_3

section Layer5_5

open IsDedekindDomain.HeightOneSpectrum ValuativeRel
open scoped AdicCompletionExtension

variable {K : Type*} [Field K] [NumberField K] {L : Type*} [Field L] [NumberField L] [Algebra K L]
  (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L)) [w.asIdeal.LiesOver v.asIdeal]

/-- **Layer 5.5, the local ramification index is the ideal-theoretic one.** -/
example :
    TauCeti.ramificationIndex (v.adicCompletion K) (w.adicCompletion L) =
      w.asIdeal.ramificationIdx (𝓞 K) :=
  ramificationIndex_adicCompletion v w

/-- **Layer 5.5, the local inertia degree is the ideal-theoretic one.** -/
example :
    TauCeti.inertiaDegree (v.adicCompletion K) (w.adicCompletion L) =
      w.asIdeal.inertiaDeg (𝓞 K) :=
  finrank_residueField_adicCompletion v w

/-- **Layer 5.5, the local degree is `e · f`.** -/
example :
    Module.finrank (v.adicCompletion K) (w.adicCompletion L) =
      w.asIdeal.ramificationIdx (𝓞 K) * w.asIdeal.inertiaDeg (𝓞 K) :=
  finrank_adicCompletion v w

end Layer5_5

section Layer5_6

open IsDedekindDomain.HeightOneSpectrum ValuativeRel
open scoped AdicCompletionExtension

variable {K : Type*} [Field K] [NumberField K] {L : Type*} [Field L] [NumberField L] [Algebra K L]
  (v : HeightOneSpectrum (𝓞 K))

/-- **Layer 5.6, the completion isomorphism induced by `σ`**, carrying `w` to `w'`, and what it
does on the dense image of `L`. -/
example (σ : L ≃ₐ[K] L) {w w' : HeightOneSpectrum (𝓞 L)} [w.asIdeal.LiesOver v.asIdeal]
    [w'.asIdeal.LiesOver v.asIdeal] (h : w'.asIdeal = σ • w.asIdeal) (x : L) :
    completionCongr v σ h (algebraMap L (w.adicCompletion L) x) =
      algebraMap L (w'.adicCompletion L) (σ x) :=
  completionCongr_algebraMap σ h x

variable (w : HeightOneSpectrum (𝓞 L)) [w.asIdeal.LiesOver v.asIdeal]

/-- **Layer 5.6, the decomposition-group map**, by continuous extension, and its defining
property. -/
example (σ : MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal) (x : L) :
    decompositionHom v w σ (algebraMap L (w.adicCompletion L) x) =
      algebraMap L (w.adicCompletion L) ((σ : L ≃ₐ[K] L) x) :=
  decompositionHom_algebraMap σ x

/-- **Layer 5.6, the conjugation square**, with `completionCongr σ` in place of any placeholder. -/
example {w' : HeightOneSpectrum (𝓞 L)} [w'.asIdeal.LiesOver v.asIdeal] (σ : L ≃ₐ[K] L)
    (h : w'.asIdeal = σ • w.asIdeal) (τ : MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal)
    (τ' : MulAction.stabilizer (L ≃ₐ[K] L) w'.asIdeal) (hτ : (τ' : L ≃ₐ[K] L) = σ * τ * σ⁻¹) :
    decompositionHom v w' τ' =
      (completionCongr v σ h).symm.trans ((decompositionHom v w τ).trans (completionCongr v σ h)) :=
  decompositionHom_conj σ h τ τ' hτ

/-- **Layer 5.6, injectivity**, from density of `L` in `L_w`. -/
example : Function.Injective (decompositionHom v w) :=
  decompositionHom_injective v w

variable [IsGalois K L]

/-- **Layer 5.6, bijectivity, the resulting isomorphism `D_w ≅ Gal(L_w/K_v)`, and `L_w/K_v`
Galois.** -/
example : Function.Surjective (decompositionHom v w) ∧
    ⇑(decompositionEquiv v w) = decompositionHom v w ∧
    IsGalois (v.adicCompletion K) (w.adicCompletion L) :=
  ⟨decompositionHom_surjective v w, coe_decompositionEquiv v w, isGalois_adicCompletion v w⟩

/-- **Layer 5.6, the example: at an unramified `w` the group is cyclic.** -/
example [Algebra.IsUnramifiedAt (𝓞 K) w.asIdeal] :
    IsCyclic (w.adicCompletion L ≃ₐ[v.adicCompletion K] w.adicCompletion L) :=
  isCyclic_algEquiv_adicCompletion_of_isUnramifiedAt v w

/-- **Layer 5.6, compatibility with the residue maps.** -/
example (σ : MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal) (x : (𝓞 L) ⧸ w.asIdeal) :
    w.residueFieldEquivAdicCompletion (K := L)
        (Ideal.Quotient.stabilizerHom w.asIdeal (w.asIdeal.under (𝓞 K)) (L ≃ₐ[K] L) σ x) =
      MulSemiringAction.toAlgAut
          (w.adicCompletion L ≃ₐ[v.adicCompletion K] w.adicCompletion L)
          𝓀[v.adicCompletion K] 𝓀[w.adicCompletion L] (decompositionHom v w σ)
        (w.residueFieldEquivAdicCompletion (K := L) x) :=
  residueFieldEquivAdicCompletion_stabilizerHom v w σ x

/-- **Layer 5.6, a global Frobenius maps to the local Frobenius.** -/
example [TauCeti.IsUnramified (v.adicCompletion K) (w.adicCompletion L)] {σ : L ≃ₐ[K] L}
    (hσ : IsArithFrobAt (𝓞 K) σ w.asIdeal) :
    decompositionHom v w ⟨σ, hσ.mem_stabilizer⟩ =
      TauCeti.frobeniusAlgEquiv (K := v.adicCompletion K) (L := w.adicCompletion L) :=
  decompositionHom_eq_frobeniusAlgEquiv v w hσ

end Layer5_6

section Layer5_7

open IsDedekindDomain.HeightOneSpectrum
open scoped AdicCompletionExtension

variable {K : Type*} [Field K] [NumberField K] {L : Type*} [Field L] [NumberField L] [Algebra K L]
  (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L)) [w.asIdeal.LiesOver v.asIdeal]

/-- **Layer 5.7, the canonical map on completed integer rings**, the restriction of the completion
map, and the induced algebra structure. -/
example (x : v.adicCompletionIntegers K) :
    (adicCompletionIntegersExtension K L v w x : w.adicCompletion L) =
        completionAlgHom v w (x : v.adicCompletion K) ∧
      algebraMap (v.adicCompletionIntegers K) (w.adicCompletionIntegers L) =
        adicCompletionIntegersExtension K L v w :=
  ⟨coe_adicCompletionIntegersExtension K L v w x,
    algebraMap_adicCompletionIntegersExtensionAlgebra K L v w⟩

/-- **Layer 5.7, the tower `𝓞 K → 𝒪_v → 𝒪_w`**, as the equation of the two composites. -/
example (r : 𝓞 K) :
    adicCompletionIntegersExtension K L v w (algebraMap (𝓞 K) (v.adicCompletionIntegers K) r) =
      algebraMap (𝓞 L) (w.adicCompletionIntegers L) (algebraMap (𝓞 K) (𝓞 L) r) :=
  adicCompletionIntegersExtension_algebraMap K L v w r

/-- **Layer 5.7, torsion-freeness**, without which `differentIdeal` of the local extension cannot
be formed. -/
example : Module.IsTorsionFree (v.adicCompletionIntegers K) (w.adicCompletionIntegers L) :=
  adicCompletionIntegers_isTorsionFree K L v w

/-- **Layer 5.7, the instances the pin already supplies.** -/
example : IsFractionRing (v.adicCompletionIntegers K) (v.adicCompletion K) ∧
    IsIntegrallyClosed (v.adicCompletionIntegers K) ∧
    IsDedekindDomain (w.adicCompletionIntegers L) :=
  ⟨inferInstance, inferInstance, inferInstance⟩

/-- **Layer 5.7, the two scalar towers.** -/
example : IsScalarTower (v.adicCompletionIntegers K) (w.adicCompletionIntegers L)
      (w.adicCompletion L) ∧
    IsScalarTower (v.adicCompletionIntegers K) (v.adicCompletion K) (w.adicCompletion L) :=
  ⟨adicCompletionIntegers_isScalarTower K L v w, inferInstance⟩

/-- **Layer 5.7, `𝒪_w` is the integral closure of `𝒪_v` in `L_w`, and is a finite `𝒪_v`-module.** -/
example : IsIntegralClosure (w.adicCompletionIntegers L) (v.adicCompletionIntegers K)
      (w.adicCompletion L) ∧
    Module.Finite (v.adicCompletionIntegers K) (w.adicCompletionIntegers L) :=
  ⟨adicCompletionIntegers_isIntegralClosure K L v w,
    adicCompletionIntegers_moduleFinite K L v w⟩

/-- **Layer 5.7, separability of the local fraction-field extension**, through the instance
`CharZero (v.adicCompletion K)`. -/
example : CharZero (v.adicCompletion K) ∧
    Algebra.IsSeparable (v.adicCompletion K) (w.adicCompletion L) :=
  ⟨inferInstance, inferInstance⟩

/-- **Layer 5.7, the bridge to Mathlib's `conductor_mul_differentIdeal`**, applied at
`A = 𝒪_v`, `K = K_v`, `B = 𝒪_w`, `L = L_w`, so that every instance it takes is discharged here. -/
example (x : w.adicCompletionIntegers L)
    (hx : Algebra.adjoin (v.adicCompletion K)
      {algebraMap (w.adicCompletionIntegers L) (w.adicCompletion L) x} = ⊤) :
    conductor (v.adicCompletionIntegers K) x *
        differentIdeal (v.adicCompletionIntegers K) (w.adicCompletionIntegers L) =
      Ideal.span {aeval x (derivative (minpoly (v.adicCompletionIntegers K) x))} :=
  conductor_mul_differentIdeal (v.adicCompletionIntegers K) (v.adicCompletion K)
    (w.adicCompletion L) x hx

/-- **Layer 5.7, the integral semilocal equivalence** and its pure-tensor formula. -/
example (a : v.adicCompletionIntegers K) (x : 𝓞 L)
    (u : {u : HeightOneSpectrum (𝓞 L) // u.asIdeal.LiesOver v.asIdeal}) :
    TauCeti.integralSemilocalEquiv L v (a ⊗ₜ x) u =
      algebraMap (v.adicCompletionIntegers K) (u.1.adicCompletionIntegers L) a *
        algebraMap (𝓞 L) (u.1.adicCompletionIntegers L) x :=
  TauCeti.integralSemilocalEquiv_tmul a x u

/-- **Layer 5.7, compatibility of the integral and field semilocal equivalences.** -/
example (z : v.adicCompletionIntegers K ⊗[𝓞 K] 𝓞 L) :
    TauCeti.semilocalEquiv L v (TauCeti.integralSemilocalToField L v z) =
      fun u ↦ (TauCeti.integralSemilocalEquiv L v z u : u.1.adicCompletion L) :=
  TauCeti.integralSemilocalEquiv_fieldCompatibility z

/-- **Layer 5.7, the localization-to-completion map**: dense, and carrying every power of the
maximal ideal of `(𝓞 K)_v` to the corresponding power for `𝒪_v`. -/
example (n : ℕ) :
    DenseRange (v.localizationToCompletionIntegers (K := K)) ∧
      Ideal.map (v.localizationToCompletionIntegers (K := K))
          (IsLocalRing.maximalIdeal (Localization.AtPrime v.asIdeal) ^ n) =
        IsLocalRing.maximalIdeal (v.adicCompletionIntegers K) ^ n :=
  ⟨v.denseRange_localizationToCompletionIntegers, v.maximalIdeal_pow_map_completion n⟩

/-- **Layer 5.7, the residue-field equivalence at the level of integer rings.** -/
noncomputable example :
    (𝓞 K ⧸ v.asIdeal) ≃+*
      (v.adicCompletionIntegers K ⧸ IsLocalRing.maximalIdeal (v.adicCompletionIntegers K)) :=
  v.residueFieldEquivAdicCompletionIntegers

/-- **Layer 5.8, local monogenicity at the completion**, with the two companion adapters: the
generator is integral, and it generates `L_w` over `K_v`. -/
example : ∃ x : w.adicCompletionIntegers L,
    Algebra.adjoin (v.adicCompletionIntegers K) {x} = ⊤ ∧
      IsIntegral (v.adicCompletionIntegers K) x ∧
      Algebra.adjoin (v.adicCompletion K) {(x : w.adicCompletion L)} = ⊤ :=
  exists_adjoin_adicCompletionIntegers_eq_top_and_isIntegral_and_adjoin_adicCompletion_eq_top v w

/-- **Layer 5.8, the ring-level generator gives the field-level one.** -/
example (x : w.adicCompletionIntegers L)
    (hx : Algebra.adjoin (v.adicCompletionIntegers K) {x} = ⊤) :
    Algebra.adjoin (v.adicCompletion K) {(x : w.adicCompletion L)} = ⊤ :=
  adjoin_adicCompletion_eq_top_of_adjoin_adicCompletionIntegers_eq_top v w x hx

/-- **Layer 5.9, the different localizes**, with the ideal map into `𝒪_w`. -/
example :
    (differentIdeal (𝓞 K) (𝓞 L)).map (algebraMap (𝓞 L) (w.adicCompletionIntegers L)) =
      differentIdeal (v.adicCompletionIntegers K) (w.adicCompletionIntegers L) :=
  map_differentIdeal_eq_differentIdeal_adicCompletionIntegers v w

/-- **Layer 5.9, the trace-dual step of the localization chain.** -/
example :
    Submodule.span (w.adicCompletionIntegers L)
        (algebraMap L (w.adicCompletion L) ''
          Submodule.traceDual (𝓞 K) K (1 : Submodule (𝓞 L) L)) =
      Submodule.traceDual (v.adicCompletionIntegers K) (v.adicCompletion K)
        (1 : Submodule (w.adicCompletionIntegers L) (w.adicCompletion L)) :=
  span_traceDual_one_eq_traceDual_one_adicCompletionIntegers v w

end Layer5_7

section Layer5_10

/-- **Layer 5.10, the valuation of the relative discriminant**,
`v_𝔭 (relDiscr) = Σ_{P ∣ 𝔭} f(P/𝔭) · v_P (𝔡)`. -/
example {A B : Type*} [CommRing A] [IsDedekindDomain A] [CommRing B] [IsDedekindDomain B]
    [Algebra A B] [Module.Finite A B] [Module.IsTorsionFree A B] [PerfectField (FractionRing A)]
    (p : Ideal A) [p.IsMaximal] (hp : p ≠ ⊥) (hd : differentIdeal A B ≠ ⊥) :
    multiplicity p (TauCeti.relDiscr A B) =
      ∑ P ∈ (p.primesOver B).toFinset, P.inertiaDeg A * multiplicity P (differentIdeal A B) :=
  TauCeti.multiplicity_relDiscr B p hp hd

/-- **Layer 5.10, for number fields**, where the different is nonzero. -/
example {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
    (p : Ideal (𝓞 K)) [p.IsMaximal] (hp : p ≠ ⊥) :
    multiplicity p (TauCeti.relDiscr (𝓞 K) (𝓞 L)) =
      ∑ P ∈ (p.primesOver (𝓞 L)).toFinset,
        P.inertiaDeg (𝓞 K) * multiplicity P (differentIdeal (𝓞 K) (𝓞 L)) :=
  TauCeti.multiplicity_relDiscr (𝓞 L) p hp differentIdeal_ne_bot

end Layer5_10

/-! ## Layer 6: global ramification consequences -/

section Layer6_1

open IsDedekindDomain.HeightOneSpectrum TauCeti.LocalFieldsRamification ValuativeRel
open scoped AdicCompletionExtension

variable {K : Type*} [Field K] [NumberField K] {L : Type*} [Field L] [NumberField L] [Algebra K L]
  (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L)) [w.asIdeal.LiesOver v.asIdeal]

/-- **Layer 6.1, the imported lower filtration at the canonical completion**, `ℤ`-indexed, with
its convention `G_i = G` for `i ≤ −1` and `G_0` the inertia subgroup. The canonical completions
of Layer 5 discharge every instance it takes. -/
example :
    lowerRamificationGroup (v.adicCompletion K) (w.adicCompletion L) (-1) = ⊤ ∧
      lowerRamificationGroup (v.adicCompletion K) (w.adicCompletion L) 0 =
        Ideal.inertia (w.adicCompletion L ≃ₐ[v.adicCompletion K] w.adicCompletion L)
          (IsLocalRing.maximalIdeal 𝒪[w.adicCompletion L]) :=
  ⟨lowerRamificationGroup_eq_top_of_le_neg_one _ _ le_rfl, lowerRamificationGroup_zero _ _⟩

/-- **Layer 6.1, the imported Hilbert different formula**, applied at the canonical completion. -/
example [IsGalois K L] :
    TauCeti.differentExponent (v.adicCompletion K) (w.adicCompletion L) =
      ∑ᶠ i : ℕ, (Nat.card (lowerRamificationGroup (v.adicCompletion K) (w.adicCompletion L) i) - 1) :=
  TauCeti.differentExponent_eq_finsum_lowerRamificationGroup _ _

/-- **Layer 6.1, the imported tame equality criterion and wild bounds**, applied at the canonical
completion. -/
example :
    (TauCeti.differentExponent (v.adicCompletion K) (w.adicCompletion L) =
        TauCeti.ramificationIndex (v.adicCompletion K) (w.adicCompletion L) - 1 ↔
      TauCeti.IsTamelyRamified (v.adicCompletion K) (w.adicCompletion L)) :=
  TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff _ _

example (hwild : TauCeti.IsWildlyRamified (v.adicCompletion K) (w.adicCompletion L))
    (he : (TauCeti.ramificationIndex (v.adicCompletion K) (w.adicCompletion L) :
      w.adicCompletion L) ≠ 0) :
    TauCeti.ramificationIndex (v.adicCompletion K) (w.adicCompletion L) ≤
        TauCeti.differentExponent (v.adicCompletion K) (w.adicCompletion L) ∧
      TauCeti.differentExponent (v.adicCompletion K) (w.adicCompletion L) ≤
        TauCeti.ramificationIndex (v.adicCompletion K) (w.adicCompletion L) - 1 +
          TauCeti.natCastValuation (w.adicCompletion L)
            (TauCeti.ramificationIndex (v.adicCompletion K) (w.adicCompletion L)) he :=
  TauCeti.differentExponent_bounds_of_wild hwild he

end Layer6_1

section Layer6_2

open Ideal

variable {G B : Type*} [Group G] [CommRing B] [MulSemiringAction G B]

/-- **Layer 6.2, the global lower filtration**, indexed by `ℕ`:
`σ ∈ G_i ↔ ∀ x, σ x − x ∈ Q ^ (i + 1)`, inside the decomposition group. -/
example (Q : Ideal B) (i : ℕ) (σ : G) :
    σ ∈ Q.ramificationGroup G i ↔ ∀ x : B, σ • x - x ∈ Q ^ (i + 1) :=
  mem_ramificationGroup_iff

example (Q : Ideal B) (i : ℕ) : Q.ramificationGroup G i ≤ MulAction.stabilizer G Q :=
  ramificationGroup_le_stabilizer Q i

/-- **Layer 6.2, `G_0` is the inertia group, and each `G_i` is normal in the decomposition
group.** -/
example (Q : Ideal B) (i : ℕ) :
    Q.ramificationGroup G 0 = Q.inertia G ∧
      (Q.ramificationGroup (MulAction.stabilizer G Q) i).Normal :=
  ⟨ramificationGroup_zero Q, inferInstance⟩

/-- **Layer 6.2, conjugation**: `G_i(σ • Q) = σ G_i(Q) σ⁻¹`. -/
example (σ : G) (Q : Ideal B) (i : ℕ) :
    (σ • Q).ramificationGroup G i = (Q.ramificationGroup G i).map (MulAut.conj σ) :=
  ramificationGroup_smul σ Q i

/-- **Layer 6.2, eventual triviality.** -/
example [IsNoetherianRing B] [IsDomain B] [FaithfulSMul G B] {Q : Ideal B} (hQ : Q ≠ ⊤)
    [Finite (Q.inertia G)] : ∃ N : ℕ, ∀ i, N ≤ i → Q.ramificationGroup G i = ⊥ :=
  exists_forall_ramificationGroup_eq_bot hQ

variable {K : Type*} [Field K] [NumberField K] {L : Type*} [Field L] [NumberField L] [Algebra K L]

/-- **Layer 6.2, the example of an unramified `Q`**, where every `G_i` is trivial. -/
example [IsGalois K L] (Q : Ideal (𝓞 L)) [Q.IsPrime] [Algebra.IsUnramifiedAt (𝓞 K) Q] (i : ℕ) :
    Q.ramificationGroup (L ≃ₐ[K] L) i = ⊥ :=
  ramificationGroup_eq_bot_of_isUnramifiedAt Q i

open IsDedekindDomain.HeightOneSpectrum
open scoped AdicCompletionExtension

variable (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L)) [w.asIdeal.LiesOver v.asIdeal]

/-- **Layer 6.2, the comparison theorem**: an element of the decomposition group lies in the global
`G_i` exactly when its continuous extension lies in the imported local
`lowerRamificationGroup K_v L_w i`. -/
example (i : ℕ) (σ : MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal) :
    (σ : L ≃ₐ[K] L) ∈ w.asIdeal.ramificationGroup (L ≃ₐ[K] L) i ↔
      decompositionHom v w σ ∈ TauCeti.LocalFieldsRamification.lowerRamificationGroup
        (v.adicCompletion K) (w.adicCompletion L) i :=
  mem_ramificationGroup_iff_decompositionHom_mem v i σ

/-- **Layer 6.2, the tame edge case**: `G_1 = 1` exactly when `L_w/K_v` is tamely ramified. -/
example [IsGalois K L] :
    w.asIdeal.ramificationGroup (L ≃ₐ[K] L) 1 = ⊥ ↔
      TauCeti.IsTamelyRamified (v.adicCompletion K) (w.adicCompletion L) :=
  ramificationGroup_one_eq_bot_iff_isTamelyRamified v w

/-- **Layer 6.2, the topological engine**: density of the global integers in `𝒪_v`; openness,
hence closedness, of every power of its maximal ideal; membership in `v ^ n` read off after
completion; continuity of every extended automorphism. -/
example (n : ℕ) (r : 𝓞 K) (σ : MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal) :
    DenseRange (algebraMap (𝓞 K) (v.adicCompletionIntegers K)) ∧
      IsOpen ((IsLocalRing.maximalIdeal (v.adicCompletionIntegers K) ^ n :
        Ideal (v.adicCompletionIntegers K)) : Set (v.adicCompletionIntegers K)) ∧
      (r ∈ v.asIdeal ^ n ↔
        Valued.v (algebraMap (𝓞 K) (v.adicCompletion K) r) ≤ WithZero.exp (-(n : ℤ))) ∧
      Continuous (decompositionHom v w σ) :=
  ⟨v.denseRange_algebraMap_adicCompletionIntegers, v.isOpen_maximalIdeal_pow_adicCompletionIntegers n,
    v.mem_asIdeal_pow_iff_valued_algebraMap_le, continuous_decompositionHom v σ⟩

/-- **Layer 6.3, Hilbert's different formula** `v_Q (𝔡) = Σ_{i ≥ 0} (#G_i − 1)`. -/
example [IsGalois K L] :
    multiplicity w.asIdeal (differentIdeal (𝓞 K) (𝓞 L)) =
      ∑ᶠ i : ℕ, (Nat.card (w.asIdeal.ramificationGroup (L ≃ₐ[K] L) i) - 1) :=
  multiplicity_differentIdeal_eq_finsum_card_ramificationGroup_sub_one w

/-- **Layer 6.4, the exact tame exponent**: `v_P (𝔡) = e − 1` exactly when `L_w/K_v` is tamely
ramified. -/
example :
    multiplicity w.asIdeal (differentIdeal (𝓞 K) (𝓞 L)) = w.asIdeal.ramificationIdx (𝓞 K) - 1 ↔
      TauCeti.IsTamelyRamified (v.adicCompletion K) (w.adicCompletion L) :=
  multiplicity_differentIdeal_eq_ramificationIdx_sub_one_iff_isTamelyRamified v w

/-- **Layer 6.4, the wild bounds** `e ≤ v_P (𝔡) ≤ e − 1 + v_P (e)`: the lower bound characterizes
wild ramification, and the upper bound holds unconditionally. -/
example :
    (w.asIdeal.ramificationIdx (𝓞 K) ≤ multiplicity w.asIdeal (differentIdeal (𝓞 K) (𝓞 L)) ↔
        TauCeti.IsWildlyRamified (v.adicCompletion K) (w.adicCompletion L)) ∧
      multiplicity w.asIdeal (differentIdeal (𝓞 K) (𝓞 L)) ≤
        w.asIdeal.ramificationIdx (𝓞 K) - 1 +
          multiplicity w.asIdeal (Ideal.span {((w.asIdeal.ramificationIdx (𝓞 K) : ℕ) : 𝓞 L)}) :=
  ⟨ramificationIdx_le_multiplicity_differentIdeal_iff_isWildlyRamified v w,
    multiplicity_differentIdeal_le_ramificationIdx_sub_one_add_multiplicity_span v w⟩

/-- **Layer 6.4, the exponent bridge**: the normalized valuation of `n` in `L_w` is the
multiplicity of `w` in `(n)`. -/
example (n : ℕ) (hn : (n : w.adicCompletion L) ≠ 0) :
    TauCeti.natCastValuation (w.adicCompletion L) n hn =
      multiplicity w.asIdeal (Ideal.span {(n : 𝓞 L)}) :=
  natCastValuation_completion_eq_multiplicity_span w n hn

/-- **Layer 6.5, the permutation-action exponent formula**:
`e(Q/𝔮) · v_𝔮 (𝔡_{M/K}) = Σ_{i ≥ 0} (#G_i − #(G_i ⊓ H))` for `M = L ^ H`. -/
example [IsGalois K L] (H : Subgroup (L ≃ₐ[K] L)) :
    w.asIdeal.ramificationIdx (𝓞 (IntermediateField.fixedField H)) *
        multiplicity (w.under (𝓞 (IntermediateField.fixedField H))).asIdeal
          (differentIdeal (𝓞 K) (𝓞 (IntermediateField.fixedField H))) =
      ∑ᶠ i : ℕ, (Nat.card (w.asIdeal.ramificationGroup (L ≃ₐ[K] L) i) -
        Nat.card (w.asIdeal.ramificationGroup (L ≃ₐ[K] L) i ⊓ H : Subgroup (L ≃ₐ[K] L))) :=
  ramificationIdx_mul_multiplicity_differentIdeal_fixedField w H

/-- **Layer 6.5, with Layers 5.10 and 1.4: the relative discriminant exponent of `L ^ H`**, summed
over the double cosets `H \ G / D` through any choice of representatives. -/
example [IsGalois K L] (H : Subgroup (L ≃ₐ[K] L))
    (r : DoubleCoset.Quotient (H : Set (L ≃ₐ[K] L))
      (MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal : Set (L ≃ₐ[K] L)) → (L ≃ₐ[K] L))
    (hr : ∀ q, DoubleCoset.mk H (MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal) (r q) = q) :
    multiplicity v.asIdeal (TauCeti.relDiscr (𝓞 K) (𝓞 (IntermediateField.fixedField H))) =
      ∑ᶠ q, (H.relIndex (MulAut.conj (r q) • MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal) /
        H.relIndex (MulAut.conj (r q) • w.asIdeal.inertia (L ≃ₐ[K] L))) *
        ((∑ᶠ i : ℕ, (Nat.card (w.asIdeal.ramificationGroup (L ≃ₐ[K] L) i) -
          Nat.card (MulAut.conj (r q) • w.asIdeal.ramificationGroup (L ≃ₐ[K] L) i ⊓ H :
            Subgroup (L ≃ₐ[K] L)))) /
            Nat.card (MulAut.conj (r q) • w.asIdeal.inertia (L ≃ₐ[K] L) ⊓ H :
              Subgroup (L ≃ₐ[K] L))) :=
  TauCeti.NumberField.multiplicity_relDiscr_fixedField_eq_sum K L v w H r hr

end Layer6_2

/-! ## Layer 7: subfields, integral bases, monogenicity, and explicit units -/

section Layer7_1

open TauCeti.NumberField

variable {K M : Type*} [Field K] [NumberField K] [Field M] [NumberField M]

/-- **Layer 7.1, the normal-closure carrier**: a chosen embedding `K →ₐ[ℚ] M` together with
Mathlib's `IsNormalClosure ℚ K M`, whose generation half says that the conjugates of the embedded
copy of `K` generate `M`. Such an `M` is Galois over `ℚ`. -/
example (d : NormalClosureData K M) :
    IntermediateField.normalClosure ℚ K M = ⊤ ∧ IsGalois ℚ M :=
  ⟨(Algebra.IsAlgebraic.isNormalClosure_iff.mp d.isNormalClosure).2, d.isGalois⟩

/-- **Layer 7.1, the action on the intrinsic finite set `K →ₐ[ℚ] M`**, by postcomposition. -/
example (σ : M ≃ₐ[ℚ] M) (φ : K →ₐ[ℚ] M) : σ • φ = σ.toAlgHom.comp φ :=
  AlgEquiv.smul_algHom_def σ φ

/-- **Layer 7.1, the action is faithful and transitive, and the carrier has `[K : ℚ]` elements.** -/
example (d : NormalClosureData K M) :
    FaithfulSMul (M ≃ₐ[ℚ] M) (K →ₐ[ℚ] M) ∧ MulAction.IsPretransitive (M ≃ₐ[ℚ] M) (K →ₐ[ℚ] M) ∧
      Fintype.card (K →ₐ[ℚ] M) = Module.finrank ℚ K := by
  have := d.isGalois
  have : Nonempty (K →ₐ[ℚ] M) := ⟨d.embedding⟩
  exact ⟨TauCeti.FieldTheory.faithfulSMul_of_normalClosure_eq_top
      (Algebra.IsAlgebraic.isNormalClosure_iff.mp d.isNormalClosure).2,
    inferInstance, AlgHom.card_of_normal⟩

/-- **Layer 7.1, the subgroup `Gal(M/K)` fixing the chosen copy of `K`**: the automorphisms with
`σ ∘ embedding = embedding` are the stabilizer of the embedding, which is the fixing subgroup of
its image. -/
example (φ : K →ₐ[ℚ] M) (σ : M ≃ₐ[ℚ] M) :
    (σ ∈ MulAction.stabilizer (M ≃ₐ[ℚ] M) φ ↔ σ.toAlgHom.comp φ = φ) ∧
      MulAction.stabilizer (M ≃ₐ[ℚ] M) φ = φ.fieldRange.fixingSubgroup :=
  ⟨by rw [MulAction.mem_stabilizer_iff, AlgEquiv.smul_algHom_def],
    TauCeti.FieldTheory.stabilizer_algHom_eq_fixingSubgroup φ⟩

/-- **Layer 7.1, the subfield dictionary**: intermediate fields of `K / ℚ` correspond, reversing
order, to the subgroups of `Gal(M/ℚ)` containing `Gal(M/K)`, with index the degree. -/
example (d : NormalClosureData K M) (E : IntermediateField ℚ K) :
    haveI := d.isGalois
    (OrderDual.ofDual (d.embedding.intermediateFieldEquivSubgroup E)).1 =
        (E.map d.embedding).fixingSubgroup ∧
      (OrderDual.ofDual (d.embedding.intermediateFieldEquivSubgroup E)).1.index =
        Module.finrank ℚ E := by
  have := d.isGalois
  exact ⟨d.embedding.coe_intermediateFieldEquivSubgroup_apply E,
    d.embedding.index_intermediateFieldEquivSubgroup_apply E⟩

/-- **Layer 7.1, coordinates in `S_n`**: a chosen `e : (K →ₐ[ℚ] M) ≃ Fin n` gives an embedding of
`Gal(M/ℚ)` into `S_n`, and changing `e` conjugates the representation. -/
noncomputable example (d : NormalClosureData K M)
    (e : (K →ₐ[ℚ] M) ≃ Fin (Module.finrank ℚ K)) :
    (M ≃ₐ[ℚ] M) ↪ Equiv.Perm (Fin (Module.finrank ℚ K)) :=
  haveI := TauCeti.FieldTheory.faithfulSMul_of_normalClosure_eq_top (F := ℚ) (L := K) (M := M)
    (Algebra.IsAlgebraic.isNormalClosure_iff.mp d.isNormalClosure).2
  Equiv.permutationEmbedding e

example (e e' : (K →ₐ[ℚ] M) ≃ Fin (Module.finrank ℚ K)) (σ : M ≃ₐ[ℚ] M) :
    Equiv.permutationRepresentation e' σ =
      (e.symm.trans e') * Equiv.permutationRepresentation e σ * (e.symm.trans e')⁻¹ :=
  Equiv.permutationRepresentation_eq_conj e e' σ

/-- **Layer 7.1, worked target: `ℚ(ζ₅)` has exactly three subfields.** -/
example (F : Type*) [Field F] [NumberField F] [IsCyclotomicExtension {5} ℚ F] :
    Nat.card (IntermediateField ℚ F) = 3 :=
  card_intermediateField_fifthCyclotomic

/-- **Layer 7.1, worked target: the cubic field of discriminant `−23` has no proper subfield.** -/
example {θ : 𝓞 K} (hmin : minpoly ℤ θ = X ^ 3 - X ^ 2 + 1)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (E : IntermediateField ℚ K) : E = ⊥ ∨ E = ⊤ :=
  Cubic23.intermediateField_eq_bot_or_eq_top hmin hgen E

end Layer7_1

section Layer7_2

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 7.2, the dyadic splitting law** in the `ω`-presentation: for `d ≡ 1 mod 4` and
`ω = (1 + √d)/2`, the prime `2` splits completely exactly when `d ≡ 1 mod 8`, and is inert exactly
when `d ≡ 5 mod 8`. No squarefreeness or oddness hypothesis is needed. -/
example {ω : 𝓞 K} {d : ℤ} (hmin : minpoly ℤ ω = X ^ 2 - X + C ((1 - d) / 4))
    (hgen : Algebra.adjoin ℚ {(ω : K)} = ⊤) (hd4 : d % 4 = 1) :
    ((Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)).ncard = Module.finrank ℚ K ↔ d % 8 = 1) ∧
      ((Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)).ncard = 1 ↔ d % 8 = 5) :=
  ⟨NumberField.ncard_primesOver_two_eq_finrank_iff_of_minpoly_eq_X_sq_sub_X_add hmin hgen hd4,
    NumberField.ncard_primesOver_two_eq_one_iff_of_minpoly_eq_X_sq_sub_X_add hmin hgen hd4⟩

/-- **Layer 7.2, the same law in the `X² − d` presentation**, where the exponent of `θ` is even. -/
example {θ : 𝓞 K} {d : ℤ} (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hd4 : d % 4 = 1) :
    (Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)).ncard = if d % 8 = 1 then 2 else 1 :=
  NumberField.ncard_primesOver_two_of_mod_four_eq_one hmin hgen hd4

/-- **Layer 7.2, `2` is unramified in `ℚ(√d)` exactly when `d ≡ 1 mod 4`**, for squarefree `d`. -/
example {θ : 𝓞 K} {d : ℤ} (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) :
    Algebra.IsUnramifiedIn (𝓞 K) (Ideal.span {(2 : ℤ)}) ↔ d % 4 = 1 :=
  TauCeti.Multiquadratic.isUnramifiedIn_two_iff_mod_four_eq_one hmin hgen hsf

end Layer7_2

section Layer7_3

open TauCeti.NumberField

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 7.3, monogenicity**, a property of the field in the `TauCeti.NumberField` namespace. -/
example : IsMonogenic K ↔ ∃ θ : 𝓞 K, Algebra.adjoin ℤ {θ} = ⊤ :=
  isMonogenic_def

/-- **Layer 7.3, the two criteria**: exponent one, and index one. -/
example : (IsMonogenic K ↔ ∃ θ : 𝓞 K, RingOfIntegers.exponent θ = 1) ∧
    (IsMonogenic K ↔ ∃ θ : IntegralPrimitiveElement K, θ.index = 1) :=
  ⟨isMonogenic_iff_exists_exponent_eq_one, isMonogenic_iff_exists_index_eq_one⟩

/-- **Layer 7.3, the examples**: quadratic fields, cyclotomic fields, `ℚ(i)` and `ℚ`. -/
example {θ : 𝓞 K} {d : ℤ} (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) : IsMonogenic K :=
  isMonogenic_of_quadratic hmin hgen hsf

example (n : ℕ) [NeZero n] [IsCyclotomicExtension {n} ℚ K] : IsMonogenic K :=
  isMonogenic_of_isCyclotomicExtension n

example : IsMonogenic (CyclotomicField 4 ℚ) ∧ IsMonogenic ℚ :=
  ⟨isMonogenic_cyclotomicField_four, isMonogenic_rat⟩

end Layer7_3

section Layer7_4

open NumberField.InfinitePlace NumberField.Units TauCeti.NumberField TauCeti.NumberField.Units
open scoped Classical

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 7.4, the criterion**, at rank one, for a non-torsion `u`: `u` generates modulo torsion
exactly when no unit has strictly smaller nonzero log-embedding norm. -/
example (hr : rank K = 1) (u : (𝓞 K)ˣ) (hu : u ∉ torsion K) :
    Subgroup.closure {u} ⊔ torsion K = ⊤ ↔
      ¬ ∃ v : (𝓞 K)ˣ, 0 < ‖logEmbedding K (Additive.ofMul v)‖ ∧
        ‖logEmbedding K (Additive.ofMul v)‖ < ‖logEmbedding K (Additive.ofMul u)‖ :=
  generates_mod_torsion_iff_no_smaller_logEmbedding hr u hu

/-- **Layer 7.4, the bridge to a chosen place**: with `1 < w u`, comparing log-embedding norms is
comparing `|log (w v)|` with `log (w u)`. -/
theorem logEmbedding_norm_lt_iff_at_place (hr : rank K = 1) (u v : (𝓞 K)ˣ)
    (w : NumberField.InfinitePlace K) (hw : 1 < w u) :
    ‖logEmbedding K (Additive.ofMul v)‖ < ‖logEmbedding K (Additive.ofMul u)‖ ↔
      |Real.log (w v)| < Real.log (w u) :=
  TauCeti.NumberField.Units.logEmbedding_norm_lt_iff_at_place hr u v w hw

/-- **Layer 7.4, the finiteness that makes the criterion checkable.** -/
example (r : ℝ) :
    {u : (𝓞 K)ˣ | ‖logEmbedding K (Additive.ofMul u)‖ ≤ r}.Finite :=
  finite_setOf_norm_logEmbedding_le r

/-- **Layer 7.4, torsion-and-inversion normalization at a real place.** -/
example (B : ℝ) (v : (𝓞 K)ˣ) (w : NumberField.InfinitePlace K) (hw : w.IsReal) (hBpos : 0 < B)
    (hv : w v ≠ 1) (hvbound : |Real.log (w v)| < Real.log B) :
    ∃ (ε : torsion K) (δ : (𝓞 K)ˣ), (δ = v ∨ δ = v⁻¹) ∧
      1 < embedding_of_isReal hw ((ε.1 * δ : (𝓞 K)ˣ) : K) ∧
      embedding_of_isReal hw ((ε.1 * δ : (𝓞 K)ˣ) : K) < B :=
  exists_normalized_unit_between B v w hw hBpos hv hvbound

/-- **Layer 7.4, the candidate set** `unitCandidates K B`: monic integer polynomials of degree
`[K : ℚ]` with constant term `±1` and the coefficient bounds forced by a normalized unit below
`B`. -/
example (f : ℤ[X]) (B : ℝ) :
    f ∈ unitCandidates K B ↔
      f.Monic ∧ f.natDegree = Module.finrank ℚ K ∧ (f.coeff 0 = 1 ∨ f.coeff 0 = -1) ∧
        ∀ k, 0 < k → k < Module.finrank ℚ K →
          |(f.coeff (Module.finrank ℚ K - k) : ℝ)| ≤
            (Module.finrank ℚ K - 1).choose (k - 1) * B + (Module.finrank ℚ K - 1).choose k :=
  mem_unitCandidates_iff f B

/-- **Layer 7.4, completeness of the candidate set**, under both scope hypotheses: rank one and
prime degree. -/
example (hr : rank K = 1) (hp : Nat.Prime (Module.finrank ℚ K))
    {w : NumberField.InfinitePlace K} (hw : w.IsReal) (v : (𝓞 K)ˣ) {B : ℝ}
    (hlo : 1 < w.embedding_of_isReal hw (v : K)) (hhi : w.embedding_of_isReal hw (v : K) ≤ B) :
    minpoly ℤ (v : 𝓞 K) ∈ unitCandidates K B :=
  minpoly_mem_unitCandidates hr hp hw v hlo hhi

/-- **Layer 7.4, the proof-carrying elimination certificate**: every candidate carries either a
root test (no real root in `(1, B)`) or a field test (it is not the minimal polynomial of an
integral generator of `K`). -/
example (B : ℝ) :
    UnitCandidateEliminationCertificate K B ↔
      ∀ f ∈ unitCandidates K B,
        (∀ x ∈ Set.Ioo (1 : ℝ) B, aeval x f ≠ 0) ∨
          ∀ θ : IntegralPrimitiveElement K, minpoly ℤ θ.1 ≠ f :=
  unitCandidateEliminationCertificate_iff B

/-- **Layer 7.4, the field test in discriminant form**, from Layer 3.3: a candidate whose
discriminant is not `discr K` times a nonzero square is eliminated. -/
example {B : ℝ}
    (h : ∀ f ∈ unitCandidates K B,
      (∀ x ∈ Set.Ioo (1 : ℝ) B, aeval x f ≠ 0) ∨
        ∀ n : ℕ, 0 < n → f.discr ≠ (n : ℤ) ^ 2 * NumberField.discr K) :
    UnitCandidateEliminationCertificate K B :=
  UnitCandidateEliminationCertificate.of_discr h

/-- **Layer 7.4, soundness**: a certificate at `B = w u` proves that `u` generates modulo
torsion. -/
example {u : (𝓞 K)ˣ} {w : NumberField.InfinitePlace K}
    (h : UnitCandidateEliminationCertificate K (w u)) (hr : rank K = 1)
    (hp : Nat.Prime (Module.finrank ℚ K)) (hw : w.IsReal) (hu : 1 < w u) :
    Subgroup.closure {u} ⊔ torsion K = ⊤ :=
  h.sound hr hp hw hu

/-- **Layer 7.4, the evaluation** `regulator K = w.mult · log (w u)`, with `w.mult` kept. -/
example (hr : rank K = 1) (u : (𝓞 K)ˣ) (hu : Subgroup.closure {u} ⊔ torsion K = ⊤)
    (w : NumberField.InfinitePlace K) (hw : 1 < w u) :
    regulator K = w.mult * Real.log (w u) :=
  regulator_eq_mult_log_of_rank_eq_one hr u hu w hw

end Layer7_4

/-! ## Layer 8: the intrinsic LMFDB label prefix and the worked suite

Layer 8.2 is an accounting table of the LMFDB page data with no statement of its own; its rows
point at the statements of the other layers and at Mathlib. Each field of Layer 8.3 has a section
below, presented as in Tau Ceti by a generator `θ : 𝓞 K` with its integral minimal polynomial and
`Algebra.adjoin ℚ {(θ : K)} = ⊤`. -/

section Layer8_1

open TauCeti.NumberField NumberField.InfinitePlace

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 8.1, the intrinsic prefix `d.r.|D|`.** The `.i` coordinate is deliberately absent. -/
example {d r D : ℕ} :
    HasLMFDBIntrinsicLabel K d r D ↔
      Module.finrank ℚ K = d ∧ nrRealPlaces K = r ∧ (NumberField.discr K).natAbs = D :=
  hasLMFDBIntrinsicLabel_iff

/-- **Layer 8.1, sign recovery** from the signature. -/
example {d r D : ℕ} (h : HasLMFDBIntrinsicLabel K d r D) :
    NumberField.discr K = (-1) ^ ((d - r) / 2) * D :=
  h.discr_eq

end Layer8_1

section Worked_2_2_5_1

/-! **LMFDB `2.2.5.1` = ℚ(√5)**, presented by `θ` with `minpoly ℤ θ = X² − X − 1`. -/

open TauCeti.NumberField NumberField.InfinitePlace NumberField.Units

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K} (hmin : minpoly ℤ θ = X ^ 2 - X - 1)
  (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)

include hmin hgen

/-- Discriminant `5`, signature `(2, 0)`, and the label prefix `2.2.5`. -/
example : NumberField.discr K = 5 ∧ nrRealPlaces K = 2 ∧ nrComplexPlaces K = 0 ∧
    HasLMFDBIntrinsicLabel K 2 2 5 :=
  ⟨Sqrt5.discr_eq_five hmin hgen, Sqrt5.nrRealPlaces_eq_two hmin hgen,
    Sqrt5.nrComplexPlaces_eq_zero hmin hgen, Sqrt5.hasLMFDBIntrinsicLabel hmin hgen⟩

/-- Torsion order `2` and unit rank `1`. -/
example : torsionOrder K = 2 ∧ rank K = 1 :=
  ⟨Sqrt5.torsionOrder_eq_two hmin hgen, Sqrt5.units_rank_eq_one hmin hgen⟩

/-- The degree-two certificate of Layer 7.4 at `B = φ`, the two interval computations. -/
example : TauCeti.NumberField.Units.UnitCandidateEliminationCertificate K Real.goldenRatio :=
  TauCeti.NumberField.Units.unitCandidateEliminationCertificate_goldenRatio
    (Sqrt5.finrank_eq_two hmin hgen)

/-- The certification by Layer 7.4: the golden ratio generates the units modulo torsion. -/
example (u : (𝓞 K)ˣ) (hu : (u : 𝓞 K) = θ) : Subgroup.closure {u} ⊔ torsion K = ⊤ :=
  Sqrt5.closure_sup_torsion_eq_top hmin hgen hu

/-- Hence `regulator K = log ((1 + √5) / 2)`. -/
example : regulator K = Real.log ((1 + Real.sqrt 5) / 2) :=
  Sqrt5.regulator_eq_log_goldenRatio hmin hgen

/-- The splitting law: an odd prime `p` splits exactly when `(p/5) = 1`, that is `p ≡ ±1 mod 5`. -/
example {p : ℕ} [Fact p.Prime] (hodd : p ≠ 2) :
    ((Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 K)).ncard = 2 ↔ legendreSym p 5 = 1) ∧
      ((Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 K)).ncard = 2 ↔ p % 5 = 1 ∨ p % 5 = 4) :=
  ⟨Sqrt5.ncard_primesOver_eq_two_iff_legendreSym hmin hgen hodd,
    Sqrt5.ncard_primesOver_eq_two_iff_mod_five hmin hgen hodd⟩

/-- `2` is inert: one prime above it, of residue degree `2`. -/
example {Q : Ideal (𝓞 K)} (hQ : Q ∈ Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)) :
    (Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)).ncard = 1 ∧ Q.inertiaDeg ℤ = 2 :=
  ⟨Sqrt5.ncard_primesOver_two_eq_one hmin hgen,
    Sqrt5.inertiaDeg_eq_two_of_mem_primesOver_two hmin hgen hQ⟩

/-- Class number `1`, and the class number formula check
`Res_{s=1} ζ_K = 2 · log ((1 + √5) / 2) / √5`. -/
example : NumberField.classNumber K = 1 ∧
    NumberField.dedekindZeta_residue K = 2 * Real.log ((1 + Real.sqrt 5) / 2) / Real.sqrt 5 :=
  ⟨Sqrt5.classNumber_eq_one hmin hgen, Sqrt5.dedekindZeta_residue_eq hmin hgen⟩

end Worked_2_2_5_1

section Worked_2_0_4_1

/-! **LMFDB `2.0.4.1` = ℚ(i)**, presented by `θ` with `minpoly ℤ θ = X² + 1`: the dyadic example,
where the wild lower bound of Layer 6.4 is attained and the upper bound is strict. -/

open TauCeti.NumberField NumberField.InfinitePlace NumberField.Units

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K} (hmin : minpoly ℤ θ = X ^ 2 + 1)
  (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)

include hmin hgen

/-- Discriminant `−4` (the sign is Brill's theorem, `r₂ = 1`), the label prefix `2.0.4`, and
`ℤ[i] = 𝓞 K`: monogenic, with index `1`. -/
example : NumberField.discr K = -4 ∧ HasLMFDBIntrinsicLabel K 2 0 4 ∧
    Algebra.adjoin ℤ {θ} = ⊤ ∧
    IntegralPrimitiveElement.index (⟨θ, hgen⟩ : IntegralPrimitiveElement K) = 1 ∧
    IsMonogenic K :=
  ⟨GaussianRationals.discr_eq_neg_four hmin hgen, GaussianRationals.hasLMFDBIntrinsicLabel hmin hgen,
    GaussianRationals.adjoin_eq_top hmin hgen, GaussianRationals.index_eq_one hmin hgen,
    GaussianRationals.isMonogenic hmin hgen⟩

/-- Class number `1` and torsion order `4`, with the second check on the discriminant. -/
example : NumberField.classNumber K = 1 ∧ torsionOrder K = 4 ∧
    NumberField.discr (CyclotomicField 4 ℚ) = -4 :=
  ⟨GaussianRationals.classNumber_eq_one hmin hgen, GaussianRationals.torsionOrder_eq_four hmin hgen,
    NumberField.WorkedExamples.discr_cyclotomicField_four⟩

variable (𝔭 : Ideal (𝓞 K)) [𝔭.IsPrime] [𝔭.LiesOver (Ideal.span {(2 : ℤ)})]

/-- `(2) = 𝔭²` with `𝔭 = (1 + i)`, so `e = 2`; `v_𝔭 (𝔡) = 2 = e`, the wild lower bound, while
`e − 1 + v_𝔭 (e) = 3` is strictly larger. -/
example : 𝔭 = Ideal.span {1 + θ} ∧
    (Ideal.span {(2 : ℤ)}).map (algebraMap ℤ (𝓞 K)) = 𝔭 ^ 2 ∧ 𝔭.ramificationIdx ℤ = 2 ∧
    multiplicity 𝔭 (differentIdeal ℤ (𝓞 K)) = 2 ∧
    multiplicity 𝔭 (differentIdeal ℤ (𝓞 K)) <
      𝔭.ramificationIdx ℤ - 1 + multiplicity 𝔭 (Ideal.span {((𝔭.ramificationIdx ℤ : ℕ) : 𝓞 K)}) :=
  ⟨GaussianRationals.eq_span_one_add hmin hgen 𝔭, GaussianRationals.map_span_two_eq_sq hmin hgen 𝔭,
    GaussianRationals.ramificationIdx_eq_two hmin hgen 𝔭,
    GaussianRationals.multiplicity_differentIdeal_eq_two hmin hgen 𝔭,
    GaussianRationals.multiplicity_differentIdeal_lt_ramificationIdx_sub_one_add hmin hgen 𝔭⟩

/-- The lower filtration at `𝔭`: `G_0 = G_1 = Gal(K/ℚ)` and `G_2 = 1`, so `Σ (#G_i − 1) = 2`. -/
example : 𝔭.ramificationGroup (K ≃ₐ[ℚ] K) 0 = ⊤ ∧ 𝔭.ramificationGroup (K ≃ₐ[ℚ] K) 1 = ⊤ ∧
    𝔭.ramificationGroup (K ≃ₐ[ℚ] K) 2 = ⊥ ∧
    ∑ᶠ i : ℕ, (Nat.card (𝔭.ramificationGroup (K ≃ₐ[ℚ] K) i) - 1) = 2 :=
  ⟨GaussianRationals.ramificationGroup_eq_top hmin hgen 𝔭 (Nat.zero_le 1),
    GaussianRationals.ramificationGroup_eq_top hmin hgen 𝔭 le_rfl,
    GaussianRationals.ramificationGroup_eq_bot hmin hgen 𝔭 le_rfl,
    GaussianRationals.finsum_card_ramificationGroup_sub_one_eq_two hmin hgen 𝔭⟩

end Worked_2_0_4_1

section Worked_Sqrt2

open TauCeti.NumberField

/-- **The other dyadic sharpness case, `ℚ(√2)`**: there `v_𝔭 (𝔡) = 3 = e − 1 + v_𝔭 (e)`, so the
upper wild bound of Layer 6.4 is attained, while the lower bound `e = 2` is strict. -/
example {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K} (hmin : minpoly ℤ θ = X ^ 2 - 2)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (𝔭 : Ideal (𝓞 K)) [𝔭.IsPrime]
    [𝔭.LiesOver (Ideal.span {(2 : ℤ)})] :
    multiplicity 𝔭 (differentIdeal ℤ (𝓞 K)) =
        𝔭.ramificationIdx ℤ - 1 + multiplicity 𝔭 (Ideal.span {((𝔭.ramificationIdx ℤ : ℕ) : 𝓞 K)}) ∧
      𝔭.ramificationIdx ℤ < multiplicity 𝔭 (differentIdeal ℤ (𝓞 K)) :=
  ⟨Sqrt2.multiplicity_differentIdeal_eq_ramificationIdx_sub_one_add hmin hgen 𝔭,
    Sqrt2.ramificationIdx_lt_multiplicity_differentIdeal hmin hgen 𝔭⟩

end Worked_Sqrt2

section Worked_4_0_125_1

/-! **LMFDB `4.0.125.1` = ℚ(ζ₅)**, for any `K` with `IsCyclotomicExtension {5} ℚ K`. The
conductor–discriminant identity `∏_χ cond(χ) = 125` belongs to class field theory and is not
stated. -/

open Ideal TauCeti.NumberField NumberField.InfinitePlace NumberField.Units

variable (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {5} ℚ K]

/-- Discriminant `125`, signature `(0, 2)`, the label prefix, class number `1`, torsion order `10`,
and monogenicity. -/
example : NumberField.discr K = 125 ∧ nrRealPlaces K = 0 ∧ nrComplexPlaces K = 2 ∧
    HasLMFDBIntrinsicLabel K 4 0 125 ∧ NumberField.classNumber K = 1 ∧ torsionOrder K = 10 ∧
    IsMonogenic K :=
  ⟨FifthCyclotomic.discr_eq_one_hundred_twenty_five K, FifthCyclotomic.nrRealPlaces_eq_zero K,
    FifthCyclotomic.nrComplexPlaces_eq_two K, FifthCyclotomic.hasLMFDBIntrinsicLabel K,
    FifthCyclotomic.classNumber_eq_one K, FifthCyclotomic.torsionOrder_eq_ten K,
    FifthCyclotomic.isMonogenic K⟩

/-- The Frobenius data `f(p) = orderOf (p mod 5)`: `2`, `3`, `7` inert with `f = 4`. -/
example : (primesOver (span {(2 : ℤ)}) (𝓞 K)).ncard = 1 ∧
    (span {(2 : ℤ)}).inertiaDegIn (𝓞 K) = 4 ∧
    (primesOver (span {(3 : ℤ)}) (𝓞 K)).ncard = 1 ∧
    (span {(3 : ℤ)}).inertiaDegIn (𝓞 K) = 4 ∧
    (primesOver (span {(7 : ℤ)}) (𝓞 K)).ncard = 1 ∧
    (span {(7 : ℤ)}).inertiaDegIn (𝓞 K) = 4 :=
  ⟨ncard_primesOver_two_fifthCyclotomic, inertiaDegIn_two_fifthCyclotomic,
    ncard_primesOver_three_fifthCyclotomic, inertiaDegIn_three_fifthCyclotomic,
    ncard_primesOver_seven_fifthCyclotomic, inertiaDegIn_seven_fifthCyclotomic⟩

/-- `19` has `f = 2`, `g = 2`; `11` splits completely. -/
example : (primesOver (span {(19 : ℤ)}) (𝓞 K)).ncard = 2 ∧
    (span {(19 : ℤ)}).inertiaDegIn (𝓞 K) = 2 ∧
    (primesOver (span {(11 : ℤ)}) (𝓞 K)).ncard = 4 ∧
    (span {(11 : ℤ)}).inertiaDegIn (𝓞 K) = 1 :=
  ⟨ncard_primesOver_nineteen_fifthCyclotomic, inertiaDegIn_nineteen_fifthCyclotomic,
    ncard_primesOver_eleven_fifthCyclotomic, inertiaDegIn_eleven_fifthCyclotomic⟩

/-- `5` is totally ramified, through `(1 − ζ) ^ 4`. -/
example (𝔭 : Ideal (𝓞 K)) [𝔭.IsPrime] [𝔭.LiesOver (span {(5 : ℤ)})] {ζ : K}
    (hζ : IsPrimitiveRoot ζ 5) :
    𝔭 = span {hζ.toInteger - 1} ∧ (span {(5 : ℤ)}).map (algebraMap ℤ (𝓞 K)) = 𝔭 ^ 4 :=
  ⟨FifthCyclotomic.eq_span_zeta_sub_one 𝔭 hζ, FifthCyclotomic.map_span_five_eq_pow_four 𝔭⟩

/-- The subfield lattice `{ℚ, ℚ(√5), ℚ(ζ₅)}`, of cardinality `3`, with `ℚ(√5)` the unique
quadratic subfield. -/
example (F : IntermediateField ℚ K) {x : K} (hx : x ^ 2 = 5) :
    Nat.card (IntermediateField ℚ K) = 3 ∧
      (F = ⊥ ∨ F = fifthCyclotomicQuadraticSubfield ∨ F = ⊤) ∧
      IntermediateField.adjoin ℚ {x} = fifthCyclotomicQuadraticSubfield :=
  ⟨card_intermediateField_fifthCyclotomic,
    IntermediateField.eq_bot_or_eq_fifthCyclotomicQuadraticSubfield_or_eq_top F,
    adjoin_sqrt_five_eq_fifthCyclotomicQuadraticSubfield hx⟩

end Worked_4_0_125_1

section Worked_3_1_23_1

/-! **LMFDB `3.1.23.1`**: the non-Galois cubic with `minpoly ℤ θ = X³ − X² + 1`. The Galois group
of its closure is not identified anywhere. -/

open Ideal TauCeti.NumberField NumberField.InfinitePlace NumberField.Units

local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
local instance : Fact (Nat.Prime 7) := ⟨by decide⟩
local instance : (span {(3 : ℤ)} : Ideal ℤ).IsMaximal := Int.ideal_span_isMaximal_of_prime 3
local instance : (span {(5 : ℤ)} : Ideal ℤ).IsMaximal := Int.ideal_span_isMaximal_of_prime 5
local instance : (span {(7 : ℤ)} : Ideal ℤ).IsMaximal := Int.ideal_span_isMaximal_of_prime 7

/-- `disc (X³ − X² + 1) = −23`, squarefree. -/
example : (X ^ 3 - X ^ 2 + 1 : ℤ[X]).discr = -23 :=
  Cubic23.discr_polynomial

/-- **The two candidates that survive the root test**, `X³ + X² − 2X − 1` and
`X³ + 2X² − 3X − 1`, have positive discriminants `49` and `257`, so the field test eliminates
them: an integral generator of `K` has `disc (minpoly) = index² · (−23) < 0`. -/
example : (X ^ 3 + X ^ 2 - 2 * X - 1 : ℤ[X]).discr = 49 ∧
    (X ^ 3 + 2 * X ^ 2 - 3 * X - 1 : ℤ[X]).discr = 257 := by
  constructor
  · rw [Polynomial.discr_of_degree_eq_three (by compute_degree <;> norm_num)]
    norm_num [coeff_add, coeff_sub, coeff_X_pow, coeff_one, coeff_X, coeff_C_mul]
  · rw [Polynomial.discr_of_degree_eq_three (by compute_degree <;> norm_num)]
    norm_num [coeff_add, coeff_sub, coeff_X_pow, coeff_one, coeff_X, coeff_C_mul]

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K}
  (hmin : minpoly ℤ θ = X ^ 3 - X ^ 2 + 1) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)

include hmin hgen

/-- Index `1`, discriminant `−23`, signature `(1, 1)`, the label prefix, not Galois, unit rank
`1`, class number `1`. -/
example : IntegralPrimitiveElement.index (⟨θ, hgen⟩ : IntegralPrimitiveElement K) = 1 ∧
    NumberField.discr K = -23 ∧ nrRealPlaces K = 1 ∧ nrComplexPlaces K = 1 ∧
    HasLMFDBIntrinsicLabel K 3 1 23 ∧ ¬ IsGalois ℚ K ∧ rank K = 1 ∧
    NumberField.classNumber K = 1 :=
  ⟨Cubic23.index_eq_one hmin hgen, Cubic23.discr_eq_neg_twenty_three hmin hgen,
    Cubic23.nrRealPlaces_eq_one hmin hgen, Cubic23.nrComplexPlaces_eq_one hmin hgen,
    Cubic23.hasLMFDBIntrinsicLabel hmin hgen, Cubic23.not_isGalois hmin hgen,
    Cubic23.units_rank_eq_one hmin hgen, Cubic23.classNumber_eq_one hmin hgen⟩

/-- No proper subfield. -/
example (E : IntermediateField ℚ K) : E = ⊥ ∨ E = ⊤ :=
  Cubic23.intermediateField_eq_bot_or_eq_top hmin hgen E

/-- The explicit unit `u = θ² − θ`, with `u θ = −1`, and `w u ∈ (5/4, 4/3)` at the real place. -/
example {w : NumberField.InfinitePlace K} (hw : w.IsReal) {u : (𝓞 K)ˣ}
    (hu : (u : 𝓞 K) = θ ^ 2 - θ) :
    (θ ^ 2 - θ) * θ = -1 ∧ w u ∈ Set.Ioo (5 / 4 : ℝ) (4 / 3 : ℝ) :=
  ⟨Cubic23.sq_sub_mul_eq_neg_one hmin, Cubic23.unit_value_mem_Ioo hmin hw hu⟩

/-- The concrete `98`-candidate elimination certificate at `B = w u`, its soundness, and the exact
regulator `regulator K = log (w u)` at the real place. -/
example {w : NumberField.InfinitePlace K} (hw : w.IsReal) {u : (𝓞 K)ˣ}
    (hu : (u : 𝓞 K) = θ ^ 2 - θ) :
    TauCeti.NumberField.Units.UnitCandidateEliminationCertificate K (w u) ∧
      Subgroup.closure {u} ⊔ torsion K = ⊤ ∧ regulator K = Real.log (w u) :=
  ⟨Cubic23.cubicUnitEliminationCertificate hmin hgen hw hu,
    Cubic23.cubicUnitEliminationCertificate_sound hmin hgen hw hu,
    Cubic23.regulator_eq_log hmin hgen hw hu⟩

open scoped Classical in
/-- Splitting at `2, 3, 5, 7, 59`, as instances of Layer 3.9: the full cycle type of a Frobenius
above `p`, acting on the roots in any number field `M` where the cubic splits. -/
example {M : Type*} [Field M] [NumberField M]
    [Fact (((minpoly ℚ (θ : K)).map (algebraMap ℚ M)).Splits)] {σ : M ≃ₐ[ℚ] M}
    (Q₂ Q₃ Q₅ Q₇ Q₅₉ : Ideal (𝓞 M)) [Q₂.IsPrime] [Q₂.LiesOver (span {(2 : ℤ)})] [Q₃.IsPrime]
    [Q₃.LiesOver (span {(3 : ℤ)})] [Q₅.IsPrime] [Q₅.LiesOver (span {(5 : ℤ)})] [Q₇.IsPrime]
    [Q₇.LiesOver (span {(7 : ℤ)})] [Q₅₉.IsPrime] [Q₅₉.LiesOver (span {(59 : ℤ)})] :
    (IsArithFrobAt ℤ σ Q₂ → (Gal.galActionHom (minpoly ℚ (θ : K)) M
        (Gal.restrict (minpoly ℚ (θ : K)) M σ)).fullCycleType = {3}) ∧
      (IsArithFrobAt ℤ σ Q₃ → (Gal.galActionHom (minpoly ℚ (θ : K)) M
        (Gal.restrict (minpoly ℚ (θ : K)) M σ)).fullCycleType = {3}) ∧
      (IsArithFrobAt ℤ σ Q₅ → (Gal.galActionHom (minpoly ℚ (θ : K)) M
        (Gal.restrict (minpoly ℚ (θ : K)) M σ)).fullCycleType = {1, 2}) ∧
      (IsArithFrobAt ℤ σ Q₇ → (Gal.galActionHom (minpoly ℚ (θ : K)) M
        (Gal.restrict (minpoly ℚ (θ : K)) M σ)).fullCycleType = {1, 2}) ∧
      (IsArithFrobAt ℤ σ Q₅₉ → Gal.restrict (minpoly ℚ (θ : K)) M σ = 1) :=
  ⟨Cubic23.fullCycleType_galActionHom_restrict_two_of_isArithFrobAt hmin Q₂,
    Cubic23.fullCycleType_galActionHom_restrict_three_of_isArithFrobAt hmin Q₃,
    Cubic23.fullCycleType_galActionHom_restrict_five_of_isArithFrobAt hmin Q₅,
    Cubic23.fullCycleType_galActionHom_restrict_seven_of_isArithFrobAt hmin Q₇,
    Cubic23.restrict_eq_one_fifty_nine_of_isArithFrobAt hmin Q₅₉⟩

/-- The same splitting read on `K`: residue degrees `(3)` at `2` and `3`, `(1, 2)` at `5` and `7`,
and `(1, 1, 1)` at `59`, which splits completely. That `59` is the least totally split prime is
not claimed. -/
example :
    (Finset.univ : Finset ((span {(2 : ℤ)}).primesOver (𝓞 K))).val.map
        (fun Q => Q.1.inertiaDeg ℤ) = {3} ∧
      (Finset.univ : Finset ((span {(3 : ℤ)}).primesOver (𝓞 K))).val.map
        (fun Q => Q.1.inertiaDeg ℤ) = {3} ∧
      (Finset.univ : Finset ((span {(5 : ℤ)}).primesOver (𝓞 K))).val.map
        (fun Q => Q.1.inertiaDeg ℤ) = {1, 2} ∧
      (Finset.univ : Finset ((span {(7 : ℤ)}).primesOver (𝓞 K))).val.map
        (fun Q => Q.1.inertiaDeg ℤ) = {1, 2} ∧
      (primesOver (span {(59 : ℤ)}) (𝓞 K)).ncard = Module.finrank ℚ K :=
  ⟨Cubic23.map_inertiaDeg_primesOver_two hmin hgen, Cubic23.map_inertiaDeg_primesOver_three hmin hgen,
    Cubic23.map_inertiaDeg_primesOver_five hmin hgen, Cubic23.map_inertiaDeg_primesOver_seven hmin hgen,
    Cubic23.ncard_primesOver_fifty_nine_eq_finrank hmin hgen⟩

/-- `23` is ramified and is listed separately: `minpoly ≡ (X − 16)² (X − 15) mod 23`, and
`(23) = 𝔭² 𝔮` with `𝔭 = (23, θ − 16)`, `𝔮 = (23, θ − 15)`; there is no Frobenius at `23`. -/
example :
    (minpoly ℤ θ).map (Int.castRingHom (ZMod 23)) = (X - C 16) ^ 2 * (X - C 15) ∧
      (span {(23 : ℤ)}).map (algebraMap ℤ (𝓞 K)) =
        Cubic23.primeSixteen (θ := θ) ^ 2 * Cubic23.primeFifteen (θ := θ) ∧
      ((span {(23 : ℤ)}).primesOver (𝓞 K)).ncard = 2 ∧
      (Cubic23.primeSixteen (θ := θ)).ramificationIdx ℤ = 2 ∧
      (Cubic23.primeFifteen (θ := θ)).ramificationIdx ℤ = 1 :=
  ⟨Cubic23.minpoly_mod_twenty_three hmin, Cubic23.map_span_twenty_three_eq hmin hgen,
    Cubic23.ncard_primesOver_twenty_three hmin hgen, Cubic23.primeSixteen_ramificationIdx hmin hgen,
    Cubic23.primeFifteen_ramificationIdx hmin hgen⟩

end Worked_3_1_23_1

section Worked_3_1_503_1

/-! **LMFDB `3.1.503.1` = Dedekind's field** `ℚ[x]/(x³ − x² − 2x − 8)`. No class number is
claimed. -/

open Ideal TauCeti.NumberField NumberField.InfinitePlace

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K}

/-- `β = (θ² − θ) / 2` is integral, with `β³ − 2β² + 3β − 10 = 0`, and the multiplication
relations `θ² = θ + 2β`, `θβ = θ + 4`, `β² = β + 2θ − 2`. -/
example (hθ : θ ^ 3 - θ ^ 2 - 2 * θ - 8 = 0) :
    (dedekindBeta hθ : K) = ((θ : K) ^ 2 - θ) / 2 ∧
      dedekindBeta hθ ^ 3 - 2 * dedekindBeta hθ ^ 2 + 3 * dedekindBeta hθ - 10 = 0 ∧
      θ ^ 2 = θ + 2 * dedekindBeta hθ ∧ θ * dedekindBeta hθ = θ + 4 ∧
      dedekindBeta hθ ^ 2 = dedekindBeta hθ + 2 * θ - 2 :=
  ⟨coe_dedekindBeta hθ, dedekindBeta_relation hθ, dedekindCubic_theta_sq hθ,
    dedekindCubic_theta_mul_beta hθ, dedekindCubic_beta_sq hθ⟩

/-- The intermediate order `ℤ[θ, β] = ℤ·1 ⊕ ℤ·θ ⊕ ℤ·β`, and its index. -/
example (hθ : θ ^ 3 - θ ^ 2 - 2 * θ - 8 = 0) :
    (dedekindOrder hθ).toSubmodule = Submodule.span ℤ (Set.range ![1, θ, dedekindBeta hθ]) ∧
      dedekindOrderIndex hθ = Nat.card (𝓞 K ⧸ (dedekindOrder hθ).toSubmodule) :=
  ⟨dedekindOrder_eq_span hθ, dedekindOrderIndex_def hθ⟩

variable (hmin : minpoly ℤ θ = X ^ 3 - X ^ 2 - C 2 * X - C 8)
  (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)

include hmin

/-- The noncircular discriminant chain: the basis `(1, θ, β)` of the order has discriminant
`−503`; the index–discriminant formula and squarefreeness of `503` force index one, so the order
is `𝓞 K`. -/
example : Algebra.discr ℤ (dedekindOrderBasis hmin) = -503 :=
  discr_dedekindOrder hmin

include hgen

example : (-503 : ℤ) = (dedekindOrderIndex (dedekindCubic_relation hmin) : ℤ) ^ 2 *
      NumberField.discr K ∧ dedekindOrder (dedekindCubic_relation hmin) = ⊤ ∧
    ∀ i, dedekindIntegralBasis hmin hgen i = ![1, θ, dedekindBeta (dedekindCubic_relation hmin)] i :=
  ⟨index_dedekindOrder_sq_mul_discr hmin hgen, dedekindOrder_eq_ringOfIntegers hmin hgen,
    dedekindIntegralBasis_apply hmin hgen⟩

/-- Only then, as outputs: `discr K = −503`, `index θ = 2`, and the label prefix. -/
example : NumberField.discr K = -503 ∧
    IntegralPrimitiveElement.index (⟨θ, hgen⟩ : IntegralPrimitiveElement K) = 2 ∧
    HasLMFDBIntrinsicLabel K 3 1 503 :=
  ⟨dedekindCubic_discr_eq_neg_five_hundred_three hmin hgen, dedekindCubic_index_eq_two hmin hgen,
    dedekindCubic_hasLMFDBIntrinsicLabel hmin hgen⟩

/-- The three factors `(2, θ, β)`, `(2, θ, β − 1)`, `(2, θ − 1, β − 1)` of `(2)`: each has quotient
`ZMod 2`, is maximal, nonzero, lies over `2` and has norm `2`; they are pairwise distinct. -/
example :
    Nonempty (𝓞 K ⧸ dedekindPrimeOne (dedekindCubic_relation hmin) ≃+* ZMod 2) ∧
      Nonempty (𝓞 K ⧸ dedekindPrimeTwo (dedekindCubic_relation hmin) ≃+* ZMod 2) ∧
      Nonempty (𝓞 K ⧸ dedekindPrimeThree (dedekindCubic_relation hmin) ≃+* ZMod 2) ∧
      (dedekindPrimeOne (dedekindCubic_relation hmin)).IsMaximal ∧
      (dedekindPrimeTwo (dedekindCubic_relation hmin)).IsMaximal ∧
      (dedekindPrimeThree (dedekindCubic_relation hmin)).IsMaximal ∧
      (dedekindPrimeOne (dedekindCubic_relation hmin)).LiesOver (span {(2 : ℤ)}) ∧
      (dedekindPrimeTwo (dedekindCubic_relation hmin)).LiesOver (span {(2 : ℤ)}) ∧
      (dedekindPrimeThree (dedekindCubic_relation hmin)).LiesOver (span {(2 : ℤ)}) ∧
      absNorm (dedekindPrimeOne (dedekindCubic_relation hmin)) = 2 ∧
      absNorm (dedekindPrimeTwo (dedekindCubic_relation hmin)) = 2 ∧
      absNorm (dedekindPrimeThree (dedekindCubic_relation hmin)) = 2 ∧
      dedekindPrimeOne (dedekindCubic_relation hmin) ≠ ⊥ ∧
      dedekindPrimeTwo (dedekindCubic_relation hmin) ≠ ⊥ ∧
      dedekindPrimeThree (dedekindCubic_relation hmin) ≠ ⊥ ∧
      dedekindPrimeOne (dedekindCubic_relation hmin) ≠
        dedekindPrimeTwo (dedekindCubic_relation hmin) ∧
      dedekindPrimeOne (dedekindCubic_relation hmin) ≠
        dedekindPrimeThree (dedekindCubic_relation hmin) ∧
      dedekindPrimeTwo (dedekindCubic_relation hmin) ≠
        dedekindPrimeThree (dedekindCubic_relation hmin) :=
  ⟨⟨dedekindPrimeOneQuotEquiv hmin hgen⟩, ⟨dedekindPrimeTwoQuotEquiv hmin hgen⟩,
    ⟨dedekindPrimeThreeQuotEquiv hmin hgen⟩, isMaximal_dedekindPrimeOne hmin hgen,
    isMaximal_dedekindPrimeTwo hmin hgen, isMaximal_dedekindPrimeThree hmin hgen,
    liesOver_dedekindPrimeOne hmin hgen, liesOver_dedekindPrimeTwo hmin hgen,
    liesOver_dedekindPrimeThree hmin hgen, absNorm_dedekindPrimeOne hmin hgen,
    absNorm_dedekindPrimeTwo hmin hgen, absNorm_dedekindPrimeThree hmin hgen,
    dedekindPrimeOne_ne_bot hmin hgen, dedekindPrimeTwo_ne_bot hmin hgen,
    dedekindPrimeThree_ne_bot hmin hgen, dedekindPrimeOne_ne_dedekindPrimeTwo hmin hgen,
    dedekindPrimeOne_ne_dedekindPrimeThree hmin hgen,
    dedekindPrimeTwo_ne_dedekindPrimeThree hmin hgen⟩

/-- `(2) = (2, θ, β)(2, θ, β − 1)(2, θ − 1, β − 1)`, these are all the primes above `2`, and `2`
splits completely, although `minpoly mod 2 = x²(x + 1)`. -/
example :
    (span {(2 : ℤ)}).map (algebraMap ℤ (𝓞 K)) =
        dedekindPrimeOne (dedekindCubic_relation hmin) *
          dedekindPrimeTwo (dedekindCubic_relation hmin) *
          dedekindPrimeThree (dedekindCubic_relation hmin) ∧
      (span {(2 : ℤ)}).primesOver (𝓞 K) =
        {dedekindPrimeOne (dedekindCubic_relation hmin),
          dedekindPrimeTwo (dedekindCubic_relation hmin),
          dedekindPrimeThree (dedekindCubic_relation hmin)} ∧
      ((span {(2 : ℤ)}).primesOver (𝓞 K)).ncard = Module.finrank ℚ K :=
  ⟨dedekindCubic_map_span_two_eq hmin hgen, dedekindCubic_primesOver_two_eq hmin hgen,
    dedekindCubic_ncard_primesOver_two_eq_finrank hmin hgen⟩

/-- `2` is a common index divisor, so `𝓞 K` is not monogenic. -/
example : IsCommonIndexDivisor 2 K ∧ ¬ IsMonogenic K :=
  ⟨dedekindCubic_isCommonIndexDivisor_two hmin hgen, dedekindCubic_not_isMonogenic hmin hgen⟩

end Worked_3_1_503_1

/-! **The dyadic quadratic law** (`d ≡ 1 mod 4`, `θ = (1 + √d)/2`: `2` splits iff `d ≡ 1 mod 8`)
is the first statement of the Layer 7.2 section above; it needs no squarefreeness hypothesis. -/

/-! ## Names imported by other roadmaps

`GlobalNumberFields`, `Chebotarev`, `ClassFieldTheory`, `GlobalQuadraticForms` and
`PolynomialGaloisGroups` import this file and use the names below, besides the theorems
`artinSymbol_map_restrictNormalHom`, `exists_isArithFrobAt_pow_inertiaDeg`, `artinHomAway_*`,
`exists_gal_fullCycleType_eq_factorizationType` and `isNonarchimedeanLocalField_adicCompletion`
stated above. Each is an abbreviation of the Tau Ceti object, so the consumers' statements are
about Tau Ceti's carriers and maps. -/

section Consumers

variable {K : Type*} [Field K] [NumberField K]

/-- Tau Ceti's carrier `J^S` of Layer 2.5. -/
abbrev idealsAway (S : Finset (HeightOneSpectrum (𝓞 K))) : Subgroup (FractionalIdeal (𝓞 K)⁰ K)ˣ :=
  TauCeti.NumberFieldArithmetic.idealsAway S

/-- Tau Ceti's monoid of nonzero integral ideals prime to `S`, of Layer 2.5. -/
abbrev integralIdealsAway (S : Finset (HeightOneSpectrum (𝓞 K))) : Submonoid (Ideal (𝓞 K)) :=
  TauCeti.NumberFieldArithmetic.integralIdealsAway S

/-- Tau Ceti's ideal-theoretic Artin map of Layer 2.5. -/
noncomputable abbrev artinHomAway {L : Type*} [Field L] [NumberField L] [Algebra K L]
    [IsGalois K L] (hab : ∀ σ τ : L ≃ₐ[K] L, Commute σ τ) (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    idealsAway (K := K) S →* (L ≃ₐ[K] L) :=
  TauCeti.NumberFieldArithmetic.artinHomAway hab S hur

/-- Tau Ceti's Artin symbol of Layer 2.3. -/
noncomputable abbrev artinSymbol {L : Type*} [Field L] [NumberField L] [Algebra K L]
    [IsGalois K L] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ConjClasses (L ≃ₐ[K] L) :=
  NumberField.artinSymbol 𝔭 hur

/-- Tau Ceti's canonical completion map of Layer 5.2. -/
noncomputable abbrev completionAlgHom {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L)) [w.asIdeal.LiesOver v.asIdeal] :
    v.adicCompletion K →ₐ[K] w.adicCompletion L :=
  IsDedekindDomain.HeightOneSpectrum.completionAlgHom v w

end Consumers

end TauCetiRoadmap.NumberFieldArithmetic
