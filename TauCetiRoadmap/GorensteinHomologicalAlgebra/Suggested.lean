import Mathlib

/-!
# Gorenstein homological algebra: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The declarations below fix the exactness, universe, and test-object conventions that several
layers depend on; proving all of them would finish neither a layer nor the roadmap. `sorry` is
allowed in this human-owned roadmap library -- these are goals, not proofs.

The periodic presentation below is the one the strongly Gorenstein classes use, and is what
"strongly" names. The general Gorenstein classes of Layer 1 use exact `CochainComplex
(ModuleCat R) ℤ` with projective, injective, or flat terms, and Layer 1 states the comparison
between the two presentations. `Module.Flat` requires `CommSemiring` on the base, which is why
every flat signature below carries `CommRing` where the projective and injective ones carry
`Ring`.
-/

namespace TauCetiRoadmap.GorensteinHomologicalAlgebra

universe u v

/-! ## Layer 0: totally acyclic complexes and the homotopy criterion -/

section Layer0

variable {R : Type u} [Ring R] {M : Type v} [AddCommGroup M] [Module R M]

/-- A contraction of the periodic complex `⋯ → M -f→ M -f→ M → ⋯` makes it exact. The converse
fails; the roadmap asks for a counterexample alongside this lemma. -/
theorem exact_of_homotopy (f s : M →ₗ[R] M) (hff : f ∘ₗ f = 0)
    (hs : f ∘ₗ s + s ∘ₗ f = LinearMap.id) : Function.Exact f f := sorry

/-- Exactness of the periodic complex already gives `f ∘ₗ f = 0`, so no separate field carries it.
-/
theorem comp_self_eq_zero_of_exact (f : M →ₗ[R] M) (hf : Function.Exact f f) : f ∘ₗ f = 0 := sorry

/-- Transport of a contraction along `Hom(-,Q)`. The induced differential is precomposition by
`f` and the induced contraction is precomposition by `s`; note that composition order reverses. -/
theorem homotopy_hom_right (f s : M →ₗ[R] M) (hs : f ∘ₗ s + s ∘ₗ f = LinearMap.id)
    (Q : Type v) [AddCommGroup Q] [Module R Q] :
    ∀ g : M →ₗ[R] Q, (g ∘ₗ s) ∘ₗ f + (g ∘ₗ f) ∘ₗ s = g := sorry

/-- Transport of a contraction along `Hom(E,-)`. -/
theorem homotopy_hom_left (f s : M →ₗ[R] M) (hs : f ∘ₗ s + s ∘ₗ f = LinearMap.id)
    (E : Type v) [AddCommGroup E] [Module R E] :
    ∀ g : E →ₗ[R] M, f ∘ₗ (s ∘ₗ g) + s ∘ₗ (f ∘ₗ g) = g := sorry

end Layer0

/-! ## Layer 2: the periodic presentation -/

/-- Bennis--Mahdou Definition 1.1(1). The test object `Q` is quantified in a single universe,
following `Module.Injective`, whose own field reads `∀ ⦃X Y : Type v⦄`; the roadmap asks for the
lemma moving this across universes alongside the definition. -/
structure StronglyCompleteProjectiveResolution (R : Type u) [Ring R] where
  /-- The projective module repeated in `⋯ → P → P → ⋯`. -/
  P : Type v
  [addGroup : AddCommGroup P]
  [moduleInst : Module R P]
  [projective : Module.Projective R P]
  /-- The differential. -/
  f : P →ₗ[R] P
  /-- The complex is exact; this also gives `f ∘ₗ f = 0`. -/
  exact : Function.Exact f f
  /-- Completeness: `Hom(-,Q)` leaves the complex exact for every projective `Q`. -/
  homExact : ∀ (Q : Type v) [AddCommGroup Q] [Module R Q] [Module.Projective R Q],
    Function.Exact (fun g : P →ₗ[R] Q => g ∘ₗ f) (fun g : P →ₗ[R] Q => g ∘ₗ f)

/-- Bennis--Mahdou Definition 1.1(2), dual. -/
structure StronglyCompleteInjectiveResolution (R : Type u) [Ring R] where
  I : Type v
  [addGroup : AddCommGroup I]
  [moduleInst : Module R I]
  [injective : Module.Injective R I]
  f : I →ₗ[R] I
  exact : Function.Exact f f
  homExact : ∀ (E : Type v) [AddCommGroup E] [Module R E] [Module.Injective R E],
    Function.Exact (fun g : E →ₗ[R] I => f ∘ₗ g) (fun g : E →ₗ[R] I => f ∘ₗ g)

/-- Bennis--Mahdou Definition 1.1(3), dual. `CommRing` is forced by `Module.Flat`. -/
structure StronglyCompleteFlatResolution (R : Type u) [CommRing R] where
  F : Type v
  [addGroup : AddCommGroup F]
  [moduleInst : Module R F]
  [flat : Module.Flat R F]
  f : F →ₗ[R] F
  exact : Function.Exact f f
  tensorExact : ∀ (I : Type v) [AddCommGroup I] [Module R I] [Module.Injective R I],
    Function.Exact (TensorProduct.map (LinearMap.id (R := R) (M := I)) f)
      (TensorProduct.map (LinearMap.id (R := R) (M := I)) f)

variable (R : Type u) [Ring R] (M : Type v) [AddCommGroup M] [Module R M]

/-- Definition 1.1(1): the cocycle of a strongly complete projective resolution. -/
def IsStronglyGorensteinProjective : Prop :=
  ∃ S : StronglyCompleteProjectiveResolution.{u, v} R,
    letI := S.addGroup; letI := S.moduleInst
    Nonempty (LinearMap.range S.f ≃ₗ[R] M)

/-- Definition 1.1(2), dual. -/
def IsStronglyGorensteinInjective : Prop :=
  ∃ S : StronglyCompleteInjectiveResolution.{u, v} R,
    letI := S.addGroup; letI := S.moduleInst
    Nonempty (LinearMap.range S.f ≃ₗ[R] M)

/-- Definition 1.1(3), dual. -/
def IsStronglyGorensteinFlat (R : Type u) [CommRing R] (M : Type v) [AddCommGroup M]
    [Module R M] : Prop :=
  ∃ S : StronglyCompleteFlatResolution.{u, v} R,
    letI := S.addGroup; letI := S.moduleInst
    Nonempty (LinearMap.range S.f ≃ₗ[R] M)

/-! ## Layer 2: acceptance criteria for the definitions -/

/-- Every projective module is strongly Gorenstein projective, witnessed by `P × P` with
`f (x, y) = (y, 0)` and contraction `s (x, y) = (0, x)`. A definition that cannot prove this is
wrong. -/
theorem isStronglyGorensteinProjective_of_projective [Module.Projective R M] :
    IsStronglyGorensteinProjective R M := sorry

/-- A strongly Gorenstein projective module embeds in a projective module. With the `ℤ` example
below this is what shows the predicate is not satisfied by every module. -/
theorem exists_injective_to_projective_of_isStronglyGorensteinProjective
    (h : IsStronglyGorensteinProjective R M) :
    ∃ (P : Type v) (_ : AddCommGroup P) (_ : Module R P) (_ : Module.Projective R P)
      (i : M →ₗ[R] P), Function.Injective i := sorry

/-! ## Layer 1 and Layer 3: the general classes and the summand theorem -/

/-- The general class, defined through an exact `CochainComplex (ModuleCat R) ℤ` with projective
terms that stays exact under `Hom(-,Q)`. -/
def IsGorensteinProjective (R : Type u) [Ring R] (M : Type v) [AddCommGroup M] [Module R M] :
    Prop := sorry

theorem isGorensteinProjective_of_isStronglyGorensteinProjective
    (h : IsStronglyGorensteinProjective R M) : IsGorensteinProjective R M := sorry

/-- Bennis--Mahdou Theorem 2.7, the theorem that makes the general class computable from the
periodic one. -/
theorem isGorensteinProjective_iff_directSummand_isStronglyGorensteinProjective :
    IsGorensteinProjective R M ↔
      ∃ (N : Type v) (_ : AddCommGroup N) (_ : Module R N),
        IsStronglyGorensteinProjective R N ∧
          ∃ (i : M →ₗ[R] N) (p : N →ₗ[R] M), p ∘ₗ i = LinearMap.id := sorry

/-! ## Layer 5: dimensions -/

/-- Gorenstein projective dimension, valued in `ℕ∞`, zero exactly on the Gorenstein projective
modules. -/
noncomputable def gorensteinProjectiveDimension (R : Type u) [Ring R] (M : Type v)
    [AddCommGroup M] [Module R M] : ℕ∞ := sorry

theorem gorensteinProjectiveDimension_eq_zero_iff :
    gorensteinProjectiveDimension R M = 0 ↔ IsGorensteinProjective R M := sorry

/-! ## Layer 6: the flat theory

`Module.Flat` is stated over a `CommSemiring`, so these carry `CommRing`. In the literature the
Gorenstein flat notion is one-sided; see the standing conventions in `README.md` for why the
commutative specialization is what appears here.
-/

/-- The general Gorenstein flat class, defined through an exact complex of flat modules that stays
exact under `− ⊗ I` for every injective `I`. -/
def IsGorensteinFlat (R : Type u) [CommRing R] (M : Type v) [AddCommGroup M] [Module R M] :
    Prop := sorry

/-- Projectively coresolved Gorenstein flat: a syzygy of an acyclic complex of *projectives* that
stays exact under `− ⊗ I` for every injective `I`. Šaroch--Šťovíček introduced this class; it is
distinct from both `IsGorensteinProjective` and `IsGorensteinFlat`, and Layer 6's general
statements are what it is for. -/
def IsProjectivelyCoresolvedGorensteinFlat (R : Type u) [CommRing R] (M : Type v)
    [AddCommGroup M] [Module R M] : Prop := sorry

/-- Šaroch--Šťovíček Theorem 3.4. The converse is open; see the open-problems section of
`README.md`. No milestone asserts it. -/
theorem isGorensteinProjective_of_isProjectivelyCoresolvedGorensteinFlat
    (R : Type u) [CommRing R] (M : Type v) [AddCommGroup M] [Module R M]
    (h : IsProjectivelyCoresolvedGorensteinFlat R M) : IsGorensteinProjective R M := sorry

/-- Šaroch--Šťovíček Theorem 3.11, the reason Layer 6 does not need coherence: closure under
extensions holds over an arbitrary ring. -/
theorem isGorensteinFlat_of_extension (R : Type u) [CommRing R]
    (A B C : Type v) [AddCommGroup A] [Module R A] [AddCommGroup B] [Module R B]
    [AddCommGroup C] [Module R C] (i : A →ₗ[R] B) (p : B →ₗ[R] C)
    (hi : Function.Injective i) (hp : Function.Surjective p) (hex : Function.Exact i p)
    (hA : IsGorensteinFlat R A) (hC : IsGorensteinFlat R C) :
    IsGorensteinFlat R B := sorry

/-- Bennis--Mahdou Theorem 3.5 is stated in ONE direction only: a Gorenstein flat module is a
summand of a strongly Gorenstein flat one. The converse is available over a coherent ring
(Mahdou--Tamekkante Proposition 1.3), not in general. Compare
`isGorensteinProjective_iff_directSummand_isStronglyGorensteinProjective`, which is an `↔`. -/
theorem exists_isStronglyGorensteinFlat_directSummand (R : Type u) [CommRing R] (M : Type v)
    [AddCommGroup M] [Module R M] (h : IsGorensteinFlat R M) :
    ∃ (N : Type v) (_ : AddCommGroup N) (_ : Module R N),
      IsStronglyGorensteinFlat R N ∧
        ∃ (i : M →ₗ[R] N) (q : N →ₗ[R] M), q ∘ₗ i = LinearMap.id := sorry

/-! ## Named examples -/

/-- The ideal `(2)` of `ZMod 4`, which as a `ZMod 4`-module is a copy of `ZMod 2`, is strongly
Gorenstein projective, witnessed by multiplication by `2`, and is not projective. This separates
the Gorenstein classes from the classical ones. It is stated for the ideal rather than for
`ZMod 2` itself because Mathlib carries no `Module (ZMod 4) (ZMod 2)` instance, while a submodule
of `ZMod 4` is a `ZMod 4`-module on the nose. -/
theorem isStronglyGorensteinProjective_span_two :
    IsStronglyGorensteinProjective (ZMod 4) ↥(Ideal.span {(2 : ZMod 4)}) ∧
      ¬ Module.Projective (ZMod 4) ↥(Ideal.span {(2 : ZMod 4)}) := sorry

/-- `ZMod 2` is not Gorenstein projective over `ℤ`. This is the non-degeneracy criterion. -/
theorem not_isGorensteinProjective_zmod_two_over_int :
    ¬ IsGorensteinProjective ℤ (ZMod 2) := sorry

end TauCetiRoadmap.GorensteinHomologicalAlgebra
