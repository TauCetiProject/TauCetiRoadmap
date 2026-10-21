import Mathlib
import TauCetiRoadmap.LocalFieldsRamification.Suggested

/-!
# Totally ramified extensions of a local field: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (the standing conventions, the consumed contract, the layer-by-layer build
plan Layers 0–4, the worked examples, and the references) is in `README.md`. Mathlib has the local
field itself — `IsNonarchimedeanLocalField` (`Mathlib/NumberTheory/LocalField/Basic.lean`), with
`𝒪[K]` a complete discrete valuation ring, `𝓀[K]` finite, and `IsAdicComplete 𝓂[K] 𝒪[K]` all
available by `inferInstance` — together with Eisenstein polynomials, `Algebra.discr`,
`differentIdeal`, `Ideal.ramificationIdx'`, `HenselianLocalRing`, the quantitative Hensel
`hensels_lemma` over `ℤ_[p]` (`Mathlib/NumberTheory/Padics/Hensel.lean`), and Haar measure on a
locally compact group. It has **no** quantitative Newton estimate over a general complete discrete
valuation ring, **no** non-archimedean analogue of `Measure.addHaar_image_linearMap`, and — the
ultimate target — **no** mass formula counting the totally ramified extensions of given degree
([Serre 1978]).

⚠ **The ramification-theoretic substrate is consumed, not built here.** Total ramification,
Eisenstein generators, monogenicity, the different and the discriminant, the exponent `d`, and
the tame criterion are targets of the *local fields and ramification* roadmap
(`../LocalFieldsRamification/README.md`), imported above and used by exact name:
`LocalFieldsRamification.IsTotallyRamified` (with `isTotallyRamified_iff_inertiaDegree_eq_one`
and `isTotallyRamified_iff_exists_eisenstein_generator`), `exists_integerRing_adjoin_eq_top`,
`differentExponent` and `discriminantExponent` with their invariance theorems
`differentExponent_eq_of_algEquiv` and `discriminantExponent_eq_of_algEquiv`,
`addVal_sum_eisenstein_powerBasis`, and the intermediate-field structure adapters
`finiteIntermediateFieldNormedField` / `finiteIntermediateFieldValuativeRel` /
`finiteIntermediateFieldTopology` with the three compatibility theorems beside them. The
junk-tolerant wrappers below install those adapters and reduce to those declarations through
comparison theorems, as that roadmap's consumer contract prescribes; no ramification-theoretic
notion is defined independently here.

This file pins the roadmap's load-bearing **definitions** (the consumed-substrate wrappers
`intermediateFieldIsTotallyRamified` and `intermediateFieldDiscriminantExponent`,
`totallyRamifiedOfDegree`, `wildExponent`, `IsRepresentativeSet`, and the coefficient-space
objects `toPoly`, `eisensteinSet`, `integerBox`) and its **named milestones** as `sorry`-targets
(`sorry` is allowed in this human-owned roadmap library — these are goals, not proofs).

⚠ The definitions are **junk-tolerant on purpose**: for `L` infinite over `K`, or for `n = 0`,
they take junk values. That is why every milestone carries `0 < n` and membership in
`totallyRamifiedOfDegree K n`. Do not repair the junk by adding finiteness hypotheses to the
definitions.

Three statements are made over an arbitrary discrete valuation ring rather than over a local
field, because that is the generality their proofs have: `exists_isRoot` and
`eq_of_isRoot_of_addVal_lt` (Layer 1, `TauCeti/RingTheory/DiscreteValuationRing/`; only the former
needs completeness) and `card_quotient_range` (Layer 2, `TauCeti/LinearAlgebra/FreeModule/`,
beside Mathlib's `AddSubgroup.index_eq_natAbs_det`). Everything else, including Layer 1's
`card_aroots_eq`, which quantifies over Layer 0's `totallyRamifiedOfDegree K n`, belongs in
`TauCeti/NumberTheory/LocalField/MassFormula/`.
-/

open ValuativeRel
open scoped ENNReal

namespace TauCetiRoadmap.MassFormula

variable (K : Type*) [Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K]
  [IsNonarchimedeanLocalField K]

/-! ## Layer 0: the counting invariants

The ramification-theoretic substrate is imported (see the header): total ramification and the
discriminant exponent are `LocalFieldsRamification.IsTotallyRamified` and
`LocalFieldsRamification.discriminantExponent`. The wrappers
`intermediateFieldIsTotallyRamified` and `intermediateFieldDiscriminantExponent` totalize them
over arbitrary subextensions by installing the consumed `finiteIntermediateField*` adapters, and
each carries the comparison theorem the consumer contract requires. `totallyRamifiedOfDegree`,
`wildExponent` and `IsRepresentativeSet` are this roadmap's own. -/

variable {K}

/-- Total ramification for a subextension `L` of `SeparableClosure K` / `K`: the consumed
`LocalFieldsRamification.IsTotallyRamified`, totalized over an arbitrary `L` by existentially
quantifying finiteness and installing the consumed `finiteIntermediateField*` structures. For `L`
infinite over `K` this is `False` — junk in the direction the count tolerates. No independent
total-ramification predicate is defined here; the residue-degree and Eisenstein characterizations
are the consumed `isTotallyRamified_iff_inertiaDegree_eq_one` and
`isTotallyRamified_iff_exists_eisenstein_generator`. -/
def intermediateFieldIsTotallyRamified (L : IntermediateField K (SeparableClosure K)) : Prop :=
  ∃ hfin : Module.Finite K ↥L,
    haveI := hfin
    letI : ValuativeRel ↥L :=
      LocalFieldsRamification.finiteIntermediateFieldValuativeRel K (SeparableClosure K) L
    letI : TopologicalSpace ↥L :=
      LocalFieldsRamification.finiteIntermediateFieldTopology K (SeparableClosure K) L
    haveI : IsNonarchimedeanLocalField ↥L :=
      LocalFieldsRamification.finiteIntermediateField_isNonarchimedeanLocalField K
        (SeparableClosure K) L
    haveI : ValuativeExtension K ↥L :=
      LocalFieldsRamification.finiteIntermediateField_valuativeExtension K (SeparableClosure K) L
    LocalFieldsRamification.IsTotallyRamified K ↥L

omit [IsUniformAddGroup K] in
/-- The comparison theorem the consumer contract requires: on a finite subextension the wrapper
is exactly the consumed predicate at the consumed adapter structures. -/
theorem intermediateFieldIsTotallyRamified_iff (L : IntermediateField K (SeparableClosure K))
    [hfin : Module.Finite K ↥L] :
    intermediateFieldIsTotallyRamified L ↔
      (letI : ValuativeRel ↥L :=
        LocalFieldsRamification.finiteIntermediateFieldValuativeRel K (SeparableClosure K) L
      letI : TopologicalSpace ↥L :=
        LocalFieldsRamification.finiteIntermediateFieldTopology K (SeparableClosure K) L
      haveI : IsNonarchimedeanLocalField ↥L :=
        LocalFieldsRamification.finiteIntermediateField_isNonarchimedeanLocalField K
          (SeparableClosure K) L
      haveI : ValuativeExtension K ↥L :=
        LocalFieldsRamification.finiteIntermediateField_valuativeExtension K
          (SeparableClosure K) L
      LocalFieldsRamification.IsTotallyRamified K ↥L) :=
  ⟨fun ⟨_, h⟩ => h, fun h => ⟨hfin, h⟩⟩

variable (K)

/-- Serre's `σ_K(n)`: the subextensions of `SeparableClosure K` that are totally ramified of
degree `n` over `K`. -/
def totallyRamifiedOfDegree (n : ℕ) : Set (IntermediateField K (SeparableClosure K)) :=
  {L | Module.finrank K ↥L = n ∧ intermediateFieldIsTotallyRamified L}

variable {K}

open scoped Classical in
/-- The discriminant exponent `d L` of a subextension: the consumed
`LocalFieldsRamification.discriminantExponent`, totalized over an arbitrary `L` by installing the
consumed `finiteIntermediateField*` structures on the finite branch, with junk value `0` for `L`
infinite over `K`. No independent different, discriminant ideal, or exponent is defined here; the
consumed `localDiscriminantIdeal`, `differentExponent` and
`discriminantExponent_eq_inertiaDegree_mul_differentExponent` relate this exponent to the
different. -/
noncomputable def intermediateFieldDiscriminantExponent
    (L : IntermediateField K (SeparableClosure K)) : ℕ :=
  if hfin : Module.Finite K ↥L then
    haveI := hfin
    letI : ValuativeRel ↥L :=
      LocalFieldsRamification.finiteIntermediateFieldValuativeRel K (SeparableClosure K) L
    letI : TopologicalSpace ↥L :=
      LocalFieldsRamification.finiteIntermediateFieldTopology K (SeparableClosure K) L
    haveI : IsNonarchimedeanLocalField ↥L :=
      LocalFieldsRamification.finiteIntermediateField_isNonarchimedeanLocalField K
        (SeparableClosure K) L
    haveI : ValuativeExtension K ↥L :=
      LocalFieldsRamification.finiteIntermediateField_valuativeExtension K (SeparableClosure K) L
    LocalFieldsRamification.discriminantExponent K ↥L
  else 0

omit [IsUniformAddGroup K] in
/-- The comparison theorem the consumer contract requires: on a finite subextension the wrapper
is exactly the consumed exponent at the consumed adapter structures. -/
theorem intermediateFieldDiscriminantExponent_eq (L : IntermediateField K (SeparableClosure K))
    [hfin : Module.Finite K ↥L] :
    intermediateFieldDiscriminantExponent L =
      (letI : ValuativeRel ↥L :=
        LocalFieldsRamification.finiteIntermediateFieldValuativeRel K (SeparableClosure K) L
      letI : TopologicalSpace ↥L :=
        LocalFieldsRamification.finiteIntermediateFieldTopology K (SeparableClosure K) L
      haveI : IsNonarchimedeanLocalField ↥L :=
        LocalFieldsRamification.finiteIntermediateField_isNonarchimedeanLocalField K
          (SeparableClosure K) L
      haveI : ValuativeExtension K ↥L :=
        LocalFieldsRamification.finiteIntermediateField_valuativeExtension K
          (SeparableClosure K) L
      LocalFieldsRamification.discriminantExponent K ↥L) :=
  dite_eq_left hfin

/-- The wild exponent `c L = d L − n + 1`, in the truncation-safe form `d L + 1 − n`, over the
consumed discriminant exponent through its wrapper. The bound `n − 1 ≤ d L` that makes the
truncated subtraction faithful is `sub_one_le_intermediateFieldDiscriminantExponent`. -/
noncomputable def wildExponent (L : IntermediateField K (SeparableClosure K)) : ℕ :=
  intermediateFieldDiscriminantExponent L + 1 - Module.finrank K ↥L

/-- Serre's "set of representatives of the isomorphism classes", as a predicate rather than a
quotient: `R` consists of members of `totallyRamifiedOfDegree K n`, and every member is
`K`-isomorphic to exactly one element of `R`. -/
def IsRepresentativeSet (n : ℕ) (R : Set (IntermediateField K (SeparableClosure K))) : Prop :=
  R ⊆ totallyRamifiedOfDegree K n ∧
    ∀ L ∈ totallyRamifiedOfDegree K n, ∃! M, M ∈ R ∧ Nonempty (↥L ≃ₐ[K] ↥M)

/- Eisenstein monogenicity ([Serre 1979, Chap. I, §6, Prop. 17]) — an Eisenstein polynomial
generates a totally ramified extension in which its root is a uniformizer and generates the ring
of integers — is consumed as the local fields and ramification roadmap's README item *Layer 3:
totally ramified is equivalent to Eisenstein*, which has no declaration in that roadmap's
`Suggested.lean`; it is deliberately not restated here. Neither `exists_integerRing_adjoin_eq_top`
(which produces some generator, not the Eisenstein root) nor the `←` direction of
`isTotallyRamified_iff_exists_eisenstein_generator` (which takes `Algebra.adjoin 𝒪[K] {ξ} = ⊤` as
an input) states it. -/

/-- The **bridge**, and the target that turns a statement about `totallyRamifiedOfDegree K n` into
a computation: the consumed equivalence `isTotallyRamified_iff_exists_eisenstein_generator`,
transported into `IntermediateField K (SeparableClosure K)` and packaged with the degree, which is
the form every later layer applies. -/
theorem exists_eisenstein_generator (n : ℕ) (hn : 0 < n)
    (L : IntermediateField K (SeparableClosure K)) (hL : L ∈ totallyRamifiedOfDegree K n) :
    ∃ x : SeparableClosure K, IsIntegral 𝒪[K] x ∧ (minpoly 𝒪[K] x).IsEisensteinAt 𝓂[K] ∧
      IntermediateField.adjoin K {x} = L ∧ (minpoly 𝒪[K] x).natDegree = n :=
  sorry

/-- The converse of `exists_eisenstein_generator`, and the direction every later layer applies
(`tsum_rootCount`, the orbit count, and the Layer 0 lemma that a `K`-embedding preserves
membership): a root in `SeparableClosure K` of a degree-`n` Eisenstein polynomial over `𝒪[K]`
generates a member of `totallyRamifiedOfDegree K n`. This transports the consumed statement that
an Eisenstein polynomial generates a totally ramified extension in which its root is a
uniformizer ([Serre 1979, Chap. I, §6, Prop. 17]; see the comment above). -/
theorem adjoin_mem_totallyRamifiedOfDegree (n : ℕ) (hn : 0 < n) {f : Polynomial ↥𝒪[K]}
    (hf : f.IsEisensteinAt 𝓂[K]) (hfn : f.natDegree = n) {x : SeparableClosure K}
    (hx : Polynomial.aeval x f = 0) :
    IntermediateField.adjoin K {x} ∈ totallyRamifiedOfDegree K n :=
  sorry

variable (K)

/-- `c L` is a nonnegative integer ([Serre 1978, p.1031, footnote 1]): in the `ℕ`-model, the bound
`n − 1 ≤ d L`, which is what makes the truncated subtraction defining `wildExponent` faithful.
This is a **corollary of Mathlib and the consumed contract** — `pow_sub_one_dvd_differentIdeal`
(`Mathlib/RingTheory/DedekindDomain/Different.lean`) gives `𝓂[L] ^ (e − 1) ∣ differentIdeal`
for every finite separable extension, hence `e − 1 ≤ differentExponent` by its definition, and
`discriminantExponent_eq_inertiaDegree_mul_differentExponent` with `e = n`, `f = 1` turns that
into `n − 1 ≤ d L` — restated here in the form the count applies, not a fresh development. The
consumed `differentExponent_bounds_of_wild` does not supply it: its hypothesis
`(ramificationIndex K L : L) ≠ 0` fails in equal characteristic `p` with `p ∣ n`. -/
theorem sub_one_le_intermediateFieldDiscriminantExponent (n : ℕ) (hn : 0 < n)
    (L : IntermediateField K (SeparableClosure K)) (hL : L ∈ totallyRamifiedOfDegree K n) :
    n - 1 ≤ intermediateFieldDiscriminantExponent L :=
  sorry

/-- **The tame criterion, as the count uses it** ([Serre 1978, p.1031]): `c L = 0` exactly when `n`
is prime to the residue characteristic. A corollary of the consumed
`differentExponent_eq_ramificationIndex_sub_one_iff` (with `e = n`) together with
`sub_one_le_intermediateFieldDiscriminantExponent`, which the `→` direction needs to pass from
`d L + 1 − n = 0` to `d L = n − 1`; rephrased in terms of `c`, the ramification-theoretic content
belongs to that roadmap. -/
theorem wildExponent_eq_zero_iff (n : ℕ) (hn : 0 < n)
    (L : IntermediateField K (SeparableClosure K)) (hL : L ∈ totallyRamifiedOfDegree K n) :
    wildExponent L = 0 ↔ ¬ ringChar 𝓀[K] ∣ n :=
  sorry

variable {K}

/-- `d`, hence `c`, is an invariant of the `K`-isomorphism class — the fact along which Theorem 1
is regrouped into Theorem 2. The arithmetic invariance is the consumed
`discriminantExponent_eq_of_algEquiv` (with `differentExponent_eq_of_algEquiv` beside it); the
target here is only its transport through the wrapper, junk case included. -/
theorem intermediateFieldDiscriminantExponent_eq_of_algEquiv
    {L M : IntermediateField K (SeparableClosure K)} (e : ↥L ≃ₐ[K] ↥M) :
    intermediateFieldDiscriminantExponent L = intermediateFieldDiscriminantExponent M :=
  sorry

/- **The comparison with the different** ([Serre 1979, Chap. III, §3]) — the discriminant ideal is
the relative norm of Mathlib's `differentIdeal` — is the consumed `localDiscriminantIdeal` with
`discriminantExponent_eq_inertiaDegree_mul_differentExponent`, owned by the *local fields and
ramification* roadmap, which owns the different and the discriminant alike; it is not a target
here. -/

/-- **The box corollary of the power-basis orthogonality**, the workhorse of Layers 2 and 3: at an
Eisenstein generator `ξ` of a finite subextension, the ball `addVal ≥ r` of its ring of integers
is, in power-basis coordinates, the box whose `i`-th factor is `𝓂[K] ^ ((r − i) ⌈/⌉ n)`, with
`⌈/⌉` the `ℕ`-truncated ceiling division, so the factor is all of `𝒪[K]` when `r ≤ i`; at
`r = n · ρ` every factor is `𝓂[K] ^ ρ`, the cube. This is the consumed
`addVal_sum_eisenstein_powerBasis` read as a membership statement, at the consumed adapter
structures. -/
theorem le_addVal_sum_eisenstein_powerBasis_iff (L : IntermediateField K (SeparableClosure K))
    [Module.Finite K ↥L] :
    letI : ValuativeRel ↥L :=
      LocalFieldsRamification.finiteIntermediateFieldValuativeRel K (SeparableClosure K) L
    letI : TopologicalSpace ↥L :=
      LocalFieldsRamification.finiteIntermediateFieldTopology K (SeparableClosure K) L
    haveI : IsNonarchimedeanLocalField ↥L :=
      LocalFieldsRamification.finiteIntermediateField_isNonarchimedeanLocalField K
        (SeparableClosure K) L
    haveI : ValuativeExtension K ↥L :=
      LocalFieldsRamification.finiteIntermediateField_valuativeExtension K (SeparableClosure K) L
    ∀ (f : Polynomial ↥𝒪[K]), f.IsEisensteinAt 𝓂[K] → ∀ ξ : ↥𝒪[↥L],
      (f.map (algebraMap ↥𝒪[K] ↥𝒪[↥L])).IsRoot ξ → Algebra.adjoin ↥𝒪[K] {ξ} = ⊤ →
      ∀ (c : Fin f.natDegree → ↥𝒪[K]) (r : ℕ),
        (r : ℕ∞) ≤ IsDiscreteValuationRing.addVal ↥𝒪[↥L]
            (∑ i, algebraMap ↥𝒪[K] ↥𝒪[↥L] (c i) * ξ ^ (i : ℕ)) ↔
          ∀ i : Fin f.natDegree, c i ∈ 𝓂[K] ^ ((r - (i : ℕ)) ⌈/⌉ f.natDegree) :=
  sorry

/-! ## Layer 1: quantitative Newton lifting over a complete discrete valuation ring

The Newton estimate `exists_isRoot` is stated for an arbitrary complete discrete valuation ring;
the local-field case is an instance. It is Mathlib's `hensels_lemma`
(`Mathlib/NumberTheory/Padics/Hensel.lean`), stated there over `ℤ_[p]` in norm spelling, over an
arbitrary complete discrete valuation ring in `addVal` spelling; `HenselianLocalRing` lifts a
simple root modulo the maximal ideal and gives no distance bound. The root-count statement
`card_aroots_eq` is over the local field `K` and quantifies over Layer 0's
`totallyRamifiedOfDegree K n`. -/

/-- **Newton iteration with an estimate.** If the order of `F` at `y₀` exceeds twice that of its
derivative, the iteration converges to a root `z` whose distance to `y₀` has order at least the
difference. This is Mathlib's `hensels_lemma` over a complete discrete valuation ring in `addVal`
spelling; uniqueness of the root in that ball is `eq_of_isRoot_of_addVal_lt`. -/
theorem exists_isRoot {A : Type*} [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] (F : Polynomial A) (y₀ : A)
    (hlt : IsDiscreteValuationRing.addVal A (Polynomial.eval y₀ (Polynomial.derivative F)) +
        IsDiscreteValuationRing.addVal A (Polynomial.eval y₀ (Polynomial.derivative F)) <
      IsDiscreteValuationRing.addVal A (Polynomial.eval y₀ F)) :
    ∃ z : A, F.IsRoot z ∧
      IsDiscreteValuationRing.addVal A (Polynomial.eval y₀ F) ≤
        IsDiscreteValuationRing.addVal A (Polynomial.eval y₀ (Polynomial.derivative F)) +
          IsDiscreteValuationRing.addVal A (z - y₀) :=
  sorry

/-- **Uniqueness of the lifted root**, the form the local fibre count of Layer 3 applies: a root
`z'` of `F` closer to a root `z` than the order of `F'` at `z` is `z`; equivalently, distinct roots
`z ≠ z'` satisfy `addVal (z − z') ≤ addVal (F' z)`. This is the Taylor expansion of `F` at `z` and
uses no completeness; it is the uniqueness clause of Mathlib's `hensels_lemma` in `addVal`
spelling, and with `exists_isRoot` it makes `z` the unique root in the ball of that theorem. -/
theorem eq_of_isRoot_of_addVal_lt {A : Type*} [CommRing A] [IsDomain A]
    [IsDiscreteValuationRing A] (F : Polynomial A) {z z' : A} (hz : F.IsRoot z)
    (hz' : F.IsRoot z')
    (hlt : IsDiscreteValuationRing.addVal A (Polynomial.eval z (Polynomial.derivative F)) <
      IsDiscreteValuationRing.addVal A (z' - z)) :
    z' = z :=
  sorry

/-- **Local constancy of the root count**, the form Layer 3 consumes: for a monic `f` over `𝒪[K]`,
separable over `K`, one threshold `T`, depending on `f` and `n` only, makes coefficientwise
closeness force equality of root counts in every member of `totallyRamifiedOfDegree K n` at
once. -/
theorem card_aroots_eq (n : ℕ) (hn : 0 < n) {f : Polynomial ↥𝒪[K]} (hfm : f.Monic)
    (hfsep : (f.map (algebraMap ↥𝒪[K] K)).Separable) :
    ∃ T : ℕ, 0 < T ∧ ∀ L ∈ totallyRamifiedOfDegree K n, ∀ g : Polynomial ↥𝒪[K], g.Monic →
      (∀ i, g.coeff i - f.coeff i ∈ 𝓂[K] ^ T) →
      ((g.map (algebraMap ↥𝒪[K] K)).aroots ↥L).card =
        ((f.map (algebraMap ↥𝒪[K] K)).aroots ↥L).card :=
  sorry

/-! ## Layer 2: the lattice index and the Haar scaling law

The index is stated over an arbitrary discrete valuation ring with finite residue field; it uses
no completeness. The scaling law is over `K`. -/

/-- **The index of an image lattice.** For an integral matrix whose determinant is associated to
`π ^ k`, the integer box modulo its image has exactly `q ^ k` elements — Smith normal form over the
principal ideal ring `A`. This is the arithmetic half of the scaling law; the measure-theoretic
half (`μ (M '' S) = q ^ (−k) · μ S` for every measurable `S`, the non-archimedean analogue of
`Measure.addHaar_image_linearMap`) is the other Layer-2 target. Mathlib's
`AddSubgroup.index_eq_natAbs_det` (`Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean`)
is the `ℤ` analogue. -/
theorem card_quotient_range {A : Type*} [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [Finite (IsLocalRing.ResidueField A)] {n : ℕ} (M : Matrix (Fin n) (Fin n) A)
    {π : A} (hπ : Irreducible π) {k : ℕ} (hk : Associated M.det (π ^ k)) :
    Nat.card ((Fin n → A) ⧸ LinearMap.range (Matrix.mulVecLin M)) =
      Nat.card (IsLocalRing.ResidueField A) ^ k :=
  sorry

/-! ## Layer 3: the coefficient space, the Eisenstein region, and its measure -/

variable (K)

/-- A monic polynomial of degree `n` *is* its coefficient vector, with `a i` the coefficient of
`X ^ i`. -/
noncomputable def toPoly {n : ℕ} (a : Fin n → K) : Polynomial K :=
  Polynomial.X ^ n + ∑ i : Fin n, Polynomial.C (a i) * Polynomial.X ^ (i : ℕ)

/-- The Eisenstein region ([Serre 1978, eq. (1)]): every coefficient in the open unit ball, with
the constant term of the largest valuation below `1` — that of a uniformizer. -/
def eisensteinSet (n : ℕ) : Set (Fin n → K) :=
  {a | (∀ i, valuation K (a i) < 1) ∧
    ∀ y : K, valuation K y < 1 → valuation K y ≤ valuation K ((toPoly K a).coeff 0)}

/-- **The Eisenstein region is the Eisenstein polynomials**, the bridge Layer 3 runs on: `a` lies
in `eisensteinSet K n` exactly when its coefficients are integral and the polynomial over `𝒪[K]`
they define is `Polynomial.IsEisensteinAt 𝓂[K]`. -/
theorem mem_eisensteinSet_iff (n : ℕ) (hn : 0 < n) (a : Fin n → K) :
    a ∈ eisensteinSet K n ↔
      ∃ f : Polynomial ↥𝒪[K], f.map (algebraMap ↥𝒪[K] K) = toPoly K a ∧ f.IsEisensteinAt 𝓂[K] :=
  sorry

/-- The integer box of the coefficient space: the set on which the measure is normalized. It is
compact with nonempty interior, so `Measure.addHaarMeasure` on it is the paper's measure; the
statements below take the normalization as a hypothesis instead, which keeps them free of a
bespoke measure definition. -/
def integerBox (n : ℕ) : Set (Fin n → K) :=
  Set.univ.pi fun _ => (𝒪[K] : Set K)

/-- **The measure of the Eisenstein region** is `q ^ (−n) · (1 − q ^ (−1))` — the normalization
check that catches a misnormalized Haar measure long before the summit. -/
theorem measure_eisensteinSet (n : ℕ) (hn : 0 < n)
    [MeasurableSpace (Fin n → K)] [BorelSpace (Fin n → K)]
    (μ : MeasureTheory.Measure (Fin n → K)) [μ.IsAddHaarMeasure] (hμ : μ (integerBox K n) = 1) :
    μ (eisensteinSet K n) =
      1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ n * (1 - 1 / (Nat.card 𝓀[K] : ℝ≥0∞)) :=
  sorry

variable {K}

/-- The root count of Lemma 1: the number of roots of `toPoly a` lying in `L`, with multiplicity.
On the full-measure separable locus every multiplicity is `1`. -/
noncomputable def rootCount (L : IntermediateField K (SeparableClosure K)) {n : ℕ}
    (a : Fin n → K) : ℕ :=
  ((toPoly K a).aroots ↥L).card

variable (K)

/-- **Almost-everywhere measurability of the root count on the Eisenstein region.** Layer 1
makes the root count locally constant on the separable Eisenstein locus, whose complement in the
region is null. This supplies the summand hypothesis for `MeasureTheory.lintegral_tsum`. -/
theorem aemeasurable_rootCount (n : ℕ) (hn : 0 < n)
    [MeasurableSpace (Fin n → K)] [BorelSpace (Fin n → K)]
    (μ : MeasureTheory.Measure (Fin n → K)) [μ.IsAddHaarMeasure]
    (L : IntermediateField K (SeparableClosure K)) (hL : L ∈ totallyRamifiedOfDegree K n) :
    AEMeasurable (fun a : Fin n → K => (rootCount L a : ℝ≥0∞))
      (μ.restrict (eisensteinSet K n)) :=
  sorry

/-- Almost everywhere on the Eisenstein region, the root counts over
`totallyRamifiedOfDegree K n` sum to `n`: an Eisenstein polynomial is irreducible, and each of its
`n` roots generates exactly one member. -/
theorem tsum_rootCount (n : ℕ) (hn : 0 < n)
    [MeasurableSpace (Fin n → K)] [BorelSpace (Fin n → K)]
    (μ : MeasureTheory.Measure (Fin n → K)) [μ.IsAddHaarMeasure] (hμ : μ (integerBox K n) = 1) :
    ∀ᵐ a ∂μ.restrict (eisensteinSet K n),
      ∑' L : totallyRamifiedOfDegree K n, (rootCount L.1 a : ℝ≥0∞) = n :=
  sorry

/-- **Countability of the family.** Local constancy at an Eisenstein generator gives each member
a positive root-count integral. The almost-everywhere root-count identity bounds the sum of these
integrals over every finite subfamily by `n * μ (eisensteinSet K n)`, a finite value. Thus only
countably many members occur. This supplies the countable index type for
`MeasureTheory.lintegral_tsum` without using the mass formula. -/
theorem countable_totallyRamifiedOfDegree (n : ℕ) (hn : 0 < n) :
    (totallyRamifiedOfDegree K n).Countable :=
  sorry

/-- **The integral of the root count** ([Serre 1978, Lemmas 2 and 3, eqs. (5)–(13)]): the change of
variables in power-basis coordinates, with Layer 2 supplying the factor `q ^ (−d L)`. Summing this
over `L` against `tsum_rootCount` is Theorem 1. -/
theorem lintegral_rootCount (n : ℕ) (hn : 0 < n)
    [MeasurableSpace (Fin n → K)] [BorelSpace (Fin n → K)]
    (μ : MeasureTheory.Measure (Fin n → K)) [μ.IsAddHaarMeasure] (hμ : μ (integerBox K n) = 1)
    (L : IntermediateField K (SeparableClosure K)) (hL : L ∈ totallyRamifiedOfDegree K n) :
    ∫⁻ a in eisensteinSet K n, (rootCount L a : ℝ≥0∞) ∂μ =
      1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ (intermediateFieldDiscriminantExponent L + 1) *
        (1 - 1 / (Nat.card 𝓀[K] : ℝ≥0∞)) :=
  sorry

/-! ## Layer 4: the mass formulas -/

/-- **Theorem 1, the first mass formula** ([Serre 1978, Thm. 1]). -/
theorem tsum_one_div_natCard_residueField_pow_wildExponent (n : ℕ) (hn : 0 < n) :
    ∑' L : totallyRamifiedOfDegree K n, 1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ wildExponent L.1 = n :=
  sorry

/-- **The finiteness dichotomy** ([Serre 1978, Rmk. 1°]): infinite exactly in equal characteristic
`p` with `p ∣ n`. -/
theorem totallyRamifiedOfDegree_infinite_iff (n : ℕ) (hn : 0 < n) :
    (totallyRamifiedOfDegree K n).Infinite ↔ ringChar K = ringChar 𝓀[K] ∧ ringChar 𝓀[K] ∣ n :=
  sorry

/-- **Convergence** ([Serre 1978, Rmk. 1°]): the real-valued restatement, a corollary of Theorem 1
through `ENNReal.summable_toReal`, since the `ℝ≥0∞` sum equals the finite value `n`; it carries
information only in the infinite case. -/
theorem summable_one_div_natCard_residueField_pow_wildExponent (n : ℕ) (hn : 0 < n) :
    Summable fun L : totallyRamifiedOfDegree K n => 1 / (Nat.card 𝓀[K] : ℝ) ^ wildExponent L.1 :=
  sorry

/-- **The orbit count** ([Serre 1978, Rmk. 3°]): the isomorphism class of `L` inside
`totallyRamifiedOfDegree K n` has `n / #Aut_K(L)` members, in multiplied form. -/
theorem ncard_isomorphic_mul_natCard_algEquiv (n : ℕ) (hn : 0 < n)
    (L : IntermediateField K (SeparableClosure K)) (hL : L ∈ totallyRamifiedOfDegree K n) :
    {M ∈ totallyRamifiedOfDegree K n | Nonempty (↥L ≃ₐ[K] ↥M)}.ncard *
      Nat.card (↥L ≃ₐ[K] ↥L) = n :=
  sorry

/-- **Theorem 2, the mass formula proper** ([Serre 1978, Thm. 2]): Theorem 1 regrouped along
isomorphism classes, over any set of representatives. -/
theorem tsum_one_div_natCard_algEquiv_mul_natCard_residueField_pow_wildExponent (n : ℕ)
    (hn : 0 < n) (R : Set (IntermediateField K (SeparableClosure K)))
    (hR : IsRepresentativeSet n R) :
    ∑' M : R, 1 / ((Nat.card (↥M.1 ≃ₐ[K] ↥M.1) : ℝ≥0∞) *
      (Nat.card 𝓀[K] : ℝ≥0∞) ^ wildExponent M.1) = 1 :=
  sorry

/-- **The tame count**, the corollary that makes the formula concrete: away from the residue
characteristic every `c L` vanishes, so there are exactly `n` totally ramified extensions of
degree `n`. -/
theorem ncard_totallyRamifiedOfDegree_of_not_dvd (n : ℕ) (hn : 0 < n)
    (hp : ¬ ringChar 𝓀[K] ∣ n) : (totallyRamifiedOfDegree K n).ncard = n :=
  sorry

end TauCetiRoadmap.MassFormula
