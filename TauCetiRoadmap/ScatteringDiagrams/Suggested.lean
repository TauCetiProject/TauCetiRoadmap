import Mathlib.Algebra.Category.ModuleCat.Semi
import Mathlib.CategoryTheory.Comma.Final
import Mathlib.CategoryTheory.Filtered.Final
import Mathlib.Algebra.Algebra.Pi
import Mathlib.Algebra.BigOperators.Finprod
import Mathlib.Algebra.Group.Subgroup.Lattice
import Mathlib.Algebra.Lie.Graded
import Mathlib.Algebra.Lie.Nilpotent
import Mathlib.Algebra.Lie.Quotient
import Mathlib.Algebra.Module.Rat
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Analysis.Convex.Exposed
import Mathlib.Analysis.Convex.Intrinsic
import Mathlib.Analysis.Normed.Affine.AddTorsorBases
import Mathlib.Analysis.Normed.Module.FiniteDimension
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.Grothendieck
import Mathlib.CategoryTheory.Limits.Final
import Mathlib.CategoryTheory.NatTrans
import Mathlib.GroupTheory.Index
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.GroupTheory.Subgroup.Saturated
import Mathlib.LinearAlgebra.Alternating.Curry
import Mathlib.LinearAlgebra.Finsupp.Supported
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Ray
import Mathlib.LinearAlgebra.SesquilinearForm.Basic
import Mathlib.RingTheory.FilteredAlgebra.Basic
import Mathlib.RingTheory.GradedAlgebra.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Nilpotent.Exp
import Mathlib.Topology.Baire.CompleteMetrizable
import Mathlib.Topology.Baire.Lemmas
import TauCeti.Algebra.Module.Primitive
import TauCeti.Analysis.Convex.Polyhedron
import TauCeti.Geometry.Toric.Algebraic.Lattice

/-!
# Scattering diagrams: suggested Lean forms

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive.
These are suggested forms for representative interfaces; `sorry` marks proposed proofs.
The completed group and wall groups are abstract here (README §§0.4–0.5).
-/

namespace TauCetiRoadmap.ScatteringDiagrams

/-! ## Layer 0: positive gradings, completions and actions -/

/-- Positive lattice degrees, before choosing a cone presentation (`README §0.1`). -/
structure PositiveDegrees (N : Type*) [AddCommGroup N] where
  monoid : AddSubmonoid N
  degree : N →+ ℤ
  degree_pos : ∀ n ∈ monoid, n ≠ 0 → 0 < degree n
  finite_cutoff : ∀ k : ℕ, {n : N | n ∈ monoid ∧ degree n ≤ (k : ℤ)}.Finite

namespace PositiveDegrees

variable {N : Type*} [AddCommGroup N] (D : PositiveDegrees N)

/-- `N⁺ = P \ {0}` (`README §0.1`). -/
def positive : Set N := {n | n ∈ D.monoid ∧ n ≠ 0}

/-- The degree-`≤ k` part of `P`; it contains `0` (`README §0.1`). -/
def cutoff (k : ℕ) : Set N := {n | n ∈ D.monoid ∧ D.degree n ≤ (k : ℤ)}

/-- A fixed `n` has finitely many decompositions `n = a + b` with `a, b ∈ P` (`README §0.1`). -/
theorem finite_degree_decompositions (n : N) :
    {p : N × N | p.1 ∈ D.monoid ∧ p.2 ∈ D.monoid ∧ p.1 + p.2 = n}.Finite := by
  refine ((D.finite_cutoff (D.degree n).toNat).image fun a => (a, n - a)).subset ?_
  rintro ⟨a, b⟩ ⟨ha, hb, hab⟩
  refine ⟨a, ⟨ha, ?_⟩, ?_⟩
  · have hb0 : 0 ≤ D.degree b := by
      by_cases h0 : b = 0
      · simp [h0]
      · exact (D.degree_pos b hb h0).le
    have : D.degree n = D.degree a + D.degree b := by rw [← hab, map_add]
    omega
  · simp only [Prod.mk.injEq, true_and]
    rw [← hab]; abel

/-- Strict positivity excludes a nonzero line in `P` (`README §0.1`). -/
theorem sharp_of_positive {n : N} (hn : n ∈ D.monoid) (hneg : -n ∈ D.monoid) : n = 0 := by
  by_contra h
  have hp := D.degree_pos n hn h
  have hm := D.degree_pos (-n) hneg (neg_ne_zero.mpr h)
  rw [map_neg] at hm
  omega

/-- Actual positive degrees on the ambient ray through `w` (`README §0.1`). -/
def rayDegrees (w : N) : Set N :=
  {n | n ∈ D.positive ∧ ∃ a : ℤ, 0 < a ∧ n = a • w}

/-- A primitive ambient ray meeting `P`; its generator need not belong to `P`
(`README §0.1`). -/
structure SupportedRay where
  generator : N
  primitive : TauCeti.IsPrimitive generator
  supported : ∃ a : ℤ, 0 < a ∧ a • generator ∈ D.positive

/-- Ray truncation is finite because it retains only actual degrees in `P`. -/
theorem finite_ray_cutoff (w : N) (k : ℕ) :
    {n | n ∈ D.rayDegrees w ∧ D.degree n ≤ (k : ℤ)}.Finite :=
  (D.finite_cutoff k).subset fun _ hn => ⟨hn.1.1.1, hn.2⟩

/-- Primitive normalization uses the ambient lattice, without saturating `P`
(`README §0.1`). -/
theorem exists_supportedRay [Module.Free ℤ N] {n : N} (hn : n ∈ D.positive) :
    ∃ r : D.SupportedRay, n ∈ D.rayDegrees r.generator := by
  obtain ⟨a, w, ha, hw, hnw⟩ := TauCeti.exists_eq_zsmul_isPrimitive hn.2
  refine ⟨⟨w, hw, a, ha, ?_⟩, hn, a, ha, hnw⟩
  simpa only [← hnw] using hn

/-- A nonzero supported degree determines its primitive ray uniquely (`README §0.1`). -/
theorem supportedRay_unique [Module.Free ℤ N] {r s : D.SupportedRay} {n : N}
    (hr : n ∈ D.rayDegrees r.generator) (hs : n ∈ D.rayDegrees s.generator) : r = s := by
  sorry

end PositiveDegrees

/-- A map of positive degree data with an explicit monotone cutoff modulus (`README §0.1`):
high source degrees go to high target degrees. -/
structure PositiveDegreeMap {N N' : Type*} [AddCommGroup N] [AddCommGroup N']
    (D : PositiveDegrees N) (E : PositiveDegrees N') extends N →+ N' where
  map_monoid : ∀ ⦃n⦄, n ∈ D.monoid → toAddMonoidHom n ∈ E.monoid
  map_positive : ∀ ⦃n⦄, n ∈ D.positive → toAddMonoidHom n ∈ E.positive
  cutoff : ℕ → ℕ
  monotone_cutoff : Monotone cutoff
  cutoff_bound : ∀ k ⦃n⦄, n ∈ D.monoid → (cutoff k : ℤ) < D.degree n →
    (k : ℤ) < E.degree (toAddMonoidHom n)

namespace PositiveDegreeMap

variable {N N' N'' : Type*} [AddCommGroup N] [AddCommGroup N'] [AddCommGroup N'']
  {D : PositiveDegrees N} {E : PositiveDegrees N'} {F : PositiveDegrees N''}

/-- The identity, with modulus `k ↦ k`. -/
def id (D : PositiveDegrees N) : PositiveDegreeMap D D where
  toAddMonoidHom := AddMonoidHom.id N
  map_monoid := by
    intro n hn
    exact hn
  map_positive := by
    intro n hn
    exact hn
  cutoff := fun k => k
  monotone_cutoff := monotone_id
  cutoff_bound := by
    intro k n hn hdeg
    exact hdeg

/-- The composite; its modulus is the composite of the moduli. -/
def comp (g : PositiveDegreeMap E F) (f : PositiveDegreeMap D E) : PositiveDegreeMap D F where
  toAddMonoidHom := g.toAddMonoidHom.comp f.toAddMonoidHom
  map_monoid := by
    intro n hn
    exact g.map_monoid (f.map_monoid hn)
  map_positive := by
    intro n hn
    exact g.map_positive (f.map_positive hn)
  cutoff := fun k => f.cutoff (g.cutoff k)
  monotone_cutoff := f.monotone_cutoff.comp g.monotone_cutoff
  cutoff_bound := by
    intro k n hn hdeg
    exact g.cutoff_bound k (f.map_monoid hn) (f.cutoff_bound (g.cutoff k) hn hdeg)

/-- Normalize the image in the target lattice using a supported multiple (`README §0.1`). -/
theorem exists_rayImage [Module.Free ℤ N'] (f : PositiveDegreeMap D E)
    (r : D.SupportedRay) :
    ∃ s : E.SupportedRay, ∃ b : ℤ, 0 < b ∧ f.toAddMonoidHom r.generator = b • s.generator := by
  obtain ⟨a, ha, har⟩ := r.supported
  have hpos := f.map_positive har
  have hne : f.toAddMonoidHom r.generator ≠ 0 := by
    intro hz
    apply hpos.2
    simp only [map_zsmul, hz, smul_zero]
  obtain ⟨b, w, hb, hw, hbw⟩ := TauCeti.exists_eq_zsmul_isPrimitive hne
  refine ⟨⟨w, hw, a * b, mul_pos ha hb, ?_⟩, b, hb, hbw⟩
  simpa only [map_zsmul, hbw, smul_smul] using hpos

/-- The primitive image-ray index (`README §§0.1, 4.1`); the degree map itself
still sends an actual exponent `n` to `f n`. -/
noncomputable def mapRay [Module.Free ℤ N'] (f : PositiveDegreeMap D E)
    (r : D.SupportedRay) : E.SupportedRay :=
  Classical.choose (f.exists_rayImage r)

theorem mapRay_spec [Module.Free ℤ N'] (f : PositiveDegreeMap D E) (r : D.SupportedRay) :
    ∃ b : ℤ, 0 < b ∧ f.toAddMonoidHom r.generator = b • (f.mapRay r).generator :=
  Classical.choose_spec (f.exists_rayImage r)

/-- Supported degrees map into the reindexed target ray (`README §4.1`). -/
theorem mapRay_mem [Module.Free ℤ N'] (f : PositiveDegreeMap D E) (r : D.SupportedRay)
    {n : N} (hn : n ∈ D.rayDegrees r.generator) :
    f.toAddMonoidHom n ∈ E.rayDegrees (f.mapRay r).generator := by
  obtain ⟨a, ha, han⟩ := hn.2
  obtain ⟨b, hb, hbw⟩ := f.mapRay_spec r
  refine ⟨f.map_positive hn.1, a * b, mul_pos ha hb, ?_⟩
  simp only [han, map_zsmul, hbw, smul_smul]

end PositiveDegreeMap

section GradedLie

variable {R : Type*} [CommRing R]
  {N : Type*} [AddCommGroup N] [DecidableEq N] (D : PositiveDegrees N)
  {g : Type*} [LieRing g] [LieAlgebra R g] (ℒ : N → Submodule R g)

/-- Positivity for Mathlib's `GradedLieAlgebra ℒ`, indexed by `N` and zero off `N⁺`
(`README §0.2`). -/
class IsPositiveGrading : Prop where
  eq_bot_of_notMem : ∀ n, n ∉ D.positive → ℒ n = ⊥

/-- The sum of the pieces of degree `> k`. -/
def degreeSubmodule (k : ℕ) : Submodule R g :=
  ⨆ n, ⨆ (_ : (k : ℤ) < D.degree n), ℒ n

/-- `F^{k+1} g` is stable under bracketing with `g` (`README §0.2`). -/
theorem degreeIdeal_isLieIdeal [GradedLieAlgebra ℒ] [IsPositiveGrading D ℒ] (k : ℕ) (x m : g)
    (hm : m ∈ degreeSubmodule D ℒ k) : ⁅x, m⁆ ∈ degreeSubmodule D ℒ k := by
  sorry

variable [GradedLieAlgebra ℒ] [IsPositiveGrading D ℒ]

/-- `F^{k+1} g`, the pieces of degree at least `k + 1` (`README §0.2`, Convention 3). -/
def degreeIdeal (k : ℕ) : LieIdeal R g :=
  { degreeSubmodule D ℒ k with
    lie_mem := fun {x m} hm => degreeIdeal_isLieIdeal D ℒ k x m hm }

/-- The truncation `g≤k = g / F^{k+1} g` (`README §0.2`). -/
abbrev truncatedLie (k : ℕ) : Type _ := g ⧸ degreeIdeal D ℒ k

/-- `README §0.2` `truncatedLie_nilpotent`. -/
instance truncatedLie_nilpotent (k : ℕ) : LieRing.IsNilpotent (truncatedLie D ℒ k) := by
  sorry

end GradedLie

section Completed

variable {G : ℕ → Type*} [∀ k, Group (G k)] (π : ∀ k, G (k + 1) →* G k)

/-- The compatible-family subgroup of a tower `π k : G (k+1) →* G k`; for the BCH tower,
this is `Ĝ` (`README §0.5`). -/
def CompletedGroup : Subgroup (∀ k, G k) where
  carrier := {x | ∀ k, π k (x (k + 1)) = x k}
  mul_mem' := fun hx hy k => by simp only [Pi.mul_apply, map_mul, hx k, hy k]
  one_mem' := fun _ => map_one _
  inv_mem' := fun hx k => by simp only [Pi.inv_apply, map_inv, hx k]

/-- The projection `Ĝ → G≤k` (`README §0.5`). -/
def projection (k : ℕ) : CompletedGroup π →* G k :=
  (Pi.evalMonoidHom G k).comp (CompletedGroup π).subtype

end Completed

/-- The Leibniz rule for a Lie action on a possibly noncommutative algebra (`README §0.6`),
as in `Module.End.exp_mul_of_derivation`. -/
class IsDerivationAction (g A : Type*) [LieRing g] [Ring A] [LieRingModule g A] : Prop where
  lie_mul : ∀ (x : g) (a b : A), ⁅x, a * b⁆ = a * ⁅x, b⁆ + ⁅x, a⁆ * b

/-- A multiplicative decreasing filtration `I^0 A = A ⊇ I^1 A ⊇ ⋯` by two-sided ideals
(`README §0.3`). -/
structure AlgFiltration (A : Type*) [Ring A] where
  ideal : ℕ → Ideal A
  isTwoSided : ∀ k, (ideal k).IsTwoSided
  antitone : Antitone ideal
  zero_eq_top : ideal 0 = ⊤
  mul_mem : ∀ {i j : ℕ} {x y : A}, x ∈ ideal i → y ∈ ideal j → x * y ∈ ideal (i + j)

namespace AlgFiltration

variable {A : Type*} [Ring A] (F : AlgFiltration A)

instance (k : ℕ) : (F.ideal k).IsTwoSided := F.isTwoSided k

/-- The same decreasing ideal family is Mathlib's increasing filtration on `ℕᵒᵈ`
(`README §0.3`); its strict lower step is the next natural-number ideal. -/
instance isRingFiltration :
    IsRingFiltration (fun k : ℕᵒᵈ => F.ideal k.ofDual)
      (fun k : ℕᵒᵈ => F.ideal (k.ofDual + 1)) where
  mono := by
    intro a b hab
    exact F.antitone hab
  is_le := fun hij => F.antitone (Nat.succ_le_of_lt hij)
  is_sup := fun B j hB => hB (OrderDual.toDual (j.ofDual + 1)) (Nat.lt_succ_self _)
  one_mem := by
    change (1 : A) ∈ F.ideal 0
    rw [F.zero_eq_top]
    trivial
  mul_mem := fun {i j} {x y} hx hy => F.mul_mem (i := i.ofDual) (j := j.ofDual) hx hy

/-- The separated completion `Â = lim_k A ⧸ I^(k+1) A` as compatible families; level `k` is the
order-`k` quotient (`README §0.3`, Convention 3). Its carrier and ring structure do not depend
on a choice of scalar ring. -/
noncomputable def completion : Subring (∀ k, A ⧸ F.ideal (k + 1)) where
  carrier := {x | ∀ {i j : ℕ} (hij : i ≤ j),
    Ideal.Quotient.factor (F.antitone (Nat.add_le_add_right hij 1)) (x j) = x i}
  mul_mem' := fun hx hy i j hij => by simp only [Pi.mul_apply, map_mul, hx hij, hy hij]
  one_mem' := fun _ => by simp only [Pi.one_apply, map_one]
  add_mem' := fun hx hy i j hij => by simp only [Pi.add_apply, map_add, hx hij, hy hij]
  zero_mem' := fun _ => by simp only [Pi.zero_apply, map_zero]
  neg_mem' := fun hx i j hij => by simp only [Pi.neg_apply, map_neg, hx hij]

/-- The same compatible-family carrier, retaining any commutative scalar ring `R`
(`README §0.3`). -/
noncomputable def completionSubalgebra (R : Type*) [CommRing R] [Algebra R A] :
    Subalgebra R (∀ k, A ⧸ F.ideal (k + 1)) where
  toSubsemiring := F.completion.toSubsemiring
  algebraMap_mem' r {i j} hij := by
    change (Ideal.Quotient.factorₐ R (F.antitone (Nat.add_le_add_right hij 1)))
      (algebraMap R (A ⧸ F.ideal (j + 1)) r) = algebraMap R (A ⧸ F.ideal (i + 1)) r
    exact AlgHom.commutes _ r

/-- The scalar structure on the scalar-independent completion carrier. -/
noncomputable instance completionAlgebra (R : Type*) [CommRing R] [Algebra R A] :
    Algebra R F.completion :=
  (F.completionSubalgebra R).algebra

/-- The projection `Â → A ⧸ I^(k+1) A`, retaining `R`-linearity. -/
noncomputable def proj (R : Type*) [CommRing R] [Algebra R A] (k : ℕ) :
    F.completion →ₐ[R] A ⧸ F.ideal (k + 1) :=
  (Pi.evalAlgHom R _ k).comp (F.completionSubalgebra R).val

variable {B : Type*} [Ring B]

/-- `README §0.3` filtered maps: `f(I^{c(k)+1} A) ⊆ J^{k+1} B` for a monotone
cutoff modulus `c`, as for `PositiveDegreeMap`; `c = id` is the filtration-preserving case. -/
structure IsFilteredAlong (G : AlgFiltration B) (f : A →+* B) (cutoff : ℕ → ℕ) : Prop where
  monotone : Monotone cutoff
  map_mem : ∀ k {a : A}, a ∈ F.ideal (cutoff k + 1) → f a ∈ G.ideal (k + 1)

variable {F} {G : AlgFiltration B} {f : A →+* B} {c : ℕ → ℕ}

/-- `README §0.3` linear bound: `f(I^{kh}) ⊆ J^k` for a constant `c ≥ 1`
gives the modulus `k ↦ c(k+1) − 1`. -/
theorem IsFilteredAlong.ofLinearBound {c : ℕ} (hc : 0 < c)
    (hf : ∀ k {a : A}, a ∈ F.ideal (c * k) → f a ∈ G.ideal k) :
    F.IsFilteredAlong G f (fun k => c * (k + 1) - 1) where
  monotone _ _ hk := Nat.sub_le_sub_right (Nat.mul_le_mul_left c (Nat.add_le_add_right hk 1)) 1
  map_mem k a ha := hf (k + 1) (by rwa [Nat.sub_add_cancel (Nat.mul_pos hc k.succ_pos)] at ha)

/-- The level map `A ⧸ I^{c(k)+1} A → B ⧸ J^{k+1} B` of a filtered map. -/
noncomputable def IsFilteredAlong.levelMap (hf : F.IsFilteredAlong G f c) (k : ℕ) :
    A ⧸ F.ideal (c k + 1) →+* B ⧸ G.ideal (k + 1) :=
  Ideal.Quotient.lift _ ((Ideal.Quotient.mk _).comp f) fun _ ha =>
    Ideal.Quotient.eq_zero_iff_mem.2 (hf.map_mem k ha)

/-- `README §0.3` completion map: the map of completions whose order-`k`
component is the level map applied to the order-`c(k)` component. -/
noncomputable def IsFilteredAlong.completionMap (hf : F.IsFilteredAlong G f c) :
    F.completion →+* G.completion where
  toFun x := ⟨fun k => hf.levelMap k (x.1 (c k)), fun {i j} hij => by
    dsimp only
    obtain ⟨a, ha⟩ := Ideal.Quotient.mk_surjective (x.1 (c j))
    rw [← x.2 (hf.monotone hij), ← ha]
    rfl⟩
  map_one' := Subtype.ext (funext fun k => map_one (hf.levelMap k))
  map_mul' x y := Subtype.ext (funext fun k => map_mul (hf.levelMap k) _ _)
  map_zero' := Subtype.ext (funext fun k => map_zero (hf.levelMap k))
  map_add' x y := Subtype.ext (funext fun k => map_add (hf.levelMap k) _ _)

end AlgFiltration

section CompletedAction

variable {R : Type*} [CommRing R] {A : Type*} [Ring A] [Algebra R A] (F : AlgFiltration A)
  {G : ℕ → Type*} [∀ k, Group (G k)] (π : ∀ k, G (k + 1) →* G k)

/-- A tower action by algebra automorphisms, compatible with truncation (`README §0.6`). -/
structure LevelwiseAction where
  act : ∀ k, G k →* (A ⧸ F.ideal (k + 1)) ≃ₐ[R] (A ⧸ F.ideal (k + 1))
  compat : ∀ k (g : G (k + 1)) (u : A ⧸ F.ideal (k + 1 + 1)),
    Ideal.Quotient.factorₐ R (F.antitone (Nat.le_succ (k + 1))) (act (k + 1) g u) =
      act k (π k g) (Ideal.Quotient.factorₐ R (F.antitone (Nat.le_succ (k + 1))) u)

/-- The induced action of the completed group on `Â` (`README §0.6`). -/
theorem completedAction_exists (ρ : LevelwiseAction (R := R) F π) :
    ∃ Φ : CompletedGroup π →* (F.completion ≃ₐ[R] F.completion),
      ∀ γ k u, F.proj R k (Φ γ u) = ρ.act k (projection π k γ) (F.proj R k u) := by
  sorry

end CompletedAction

section Action

variable {R : Type*} [CommRing R]
  {N : Type*} [AddCommGroup N] [DecidableEq N] (D : PositiveDegrees N)
  {g : Type*} [LieRing g] [LieAlgebra R g] (ℒ : N → Submodule R g)
  [GradedLieAlgebra ℒ] [IsPositiveGrading D ℒ]
  {A : Type*} [Ring A] [Algebra R A] [LieRingModule g A] [LieModule R g A]

/-- `F^{k+1} g · I^b A ⊆ I^{b+k+1} A`; in particular every element raises the filtration
(`README §0.6`). -/
class IsFiltrationRaising (F : AlgFiltration A) : Prop where
  lie_mem : ∀ {k b : ℕ} {x : g} {a : A}, x ∈ degreeIdeal D ℒ k → a ∈ F.ideal b →
    ⁅x, a⁆ ∈ F.ideal (b + k + 1)

/-- The action of `x` on the order-`k` quotient `A ⧸ I^(k+1) A` exists and is nilpotent
(`README §0.6`); on the order-zero quotient `A ⧸ I^1 A` it is zero. -/
theorem quotientAction_exists (F : AlgFiltration A) [IsFiltrationRaising D ℒ F]
    (x : g) (k : ℕ) :
    ∃ E : Module.End R (A ⧸ F.ideal (k + 1)),
      E ^ (k + 1) = 0 ∧
      ∀ a : A, E (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ ⁅x, a⁆ := by
  sorry

/- Exponentiation uses rational scalars restricted from `R`. -/
variable [Algebra ℚ R] [Algebra ℚ A] [IsScalarTower ℚ R A]

/-- The exponential of `x` acting on `Â`, computed by `IsNilpotent.exp` on each quotient
(`README §0.6`). -/
theorem expDerivation_exists [IsDerivationAction g A] (F : AlgFiltration A)
    [IsFiltrationRaising D ℒ F] (x : g) :
    ∃ Φ : F.completion ≃ₐ[R] F.completion, ∀ (k : ℕ) (E : Module.End R (A ⧸ F.ideal (k + 1))),
      E ^ (k + 1) = 0 →
      (∀ a : A, E (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ ⁅x, a⁆) →
      ∀ u, F.proj R k (Φ u) = IsNilpotent.exp E (F.proj R k u) := by
  sorry

end Action

/-! ### Coefficient diagrams and represented labels (README §0.7) -/

section CoefficientInfrastructure

open CategoryTheory Functor Limits

namespace GrothendieckLimits

variable {D : Type*} [Category D] {C : D ⥤ Cat} {𝒱 : Type*} [Category 𝒱]
  (F : Grothendieck C ⥤ 𝒱)
  [∀ d, HasLimit (Grothendieck.ι C d ⋙ F)]
  [∀ ⦃d e : D⦄ (f : d ⟶ e),
    HasLimit ((C.map f).toFunctor ⋙ Grothendieck.ι C e ⋙ F)]
  [∀ ⦃d e : D⦄ (f : d ⟶ e),
    IsIso (limit.pre (Grothendieck.ι C e ⋙ F) (C.map f).toFunctor)]

/-- Fiberwise limits when restriction along each transition preserves the relevant limit. -/
noncomputable def fiberwiseLimit : D ⥤ 𝒱 where
  obj d := limit (Grothendieck.ι C d ⋙ F)
  map {d e} f :=
    limMap (whiskerRight (Grothendieck.ιNatTrans f) F ≫ (Functor.associator _ _ _).hom) ≫
      inv (limit.pre (Grothendieck.ι C e ⋙ F) (C.map f).toFunctor)
  map_id := by sorry
  map_comp := by sorry

noncomputable def fiberwiseLimitIso [HasLimit F] [HasLimit (fiberwiseLimit F)] :
    limit F ≅ limit (fiberwiseLimit F) := by
  sorry

/-- Initial base reindexing preserves this total limit under the relative restriction condition. -/
theorem pre_limit_isIso {D' : Type*} [Category D'] (G : D' ⥤ D) [G.Initial]
    [HasLimit F] [HasLimit (fiberwiseLimit F)] [HasLimit (Grothendieck.pre C G ⋙ F)] :
    IsIso (limit.pre F (Grothendieck.pre C G)) := by
  sorry

/-- Initial transitions give initiality independently of the coefficient diagram. -/
theorem pre_initial {D' : Type*} [Category D'] (G : D' ⥤ D) [G.Initial]
    [∀ ⦃d e : D⦄ (f : d ⟶ e), (C.map f).toFunctor.Initial] :
    (Grothendieck.pre C G).Initial := by
  sorry

end GrothendieckLimits

section DiagramComparisons

variable {J J' J'' A B 𝒱 : Type*}
  [Category J] [Category J'] [Category J''] [Category A] [Category B] [Category 𝒱]

/-- A comparison through a common index category, with an initial target leg. -/
structure DiagramComparison (F : J ⥤ 𝒱) (F' : J' ⥤ 𝒱) (A : Type*) [Category A] where
  source : A ⥤ J
  target : A ⥤ J'
  app : source ⋙ F ⟶ target ⋙ F'
  initial : target.Initial

attribute [instance] DiagramComparison.initial

variable {F : J ⥤ 𝒱} {F' : J' ⥤ 𝒱} {F'' : J'' ⥤ 𝒱}

noncomputable def DiagramComparison.limitMap (S : DiagramComparison F F' A)
    [HasLimit F] [HasLimit F'] : limit F ⟶ limit F' :=
  limit.lift (S.target ⋙ F')
    ((Cone.postcompose S.app).obj ((limit.cone F).whisker S.source)) ≫
      (Functor.Initial.limitIso S.target F').hom

@[reassoc (attr := simp)]
theorem DiagramComparison.limitMap_π (S : DiagramComparison F F' A)
    [HasLimit F] [HasLimit F'] (a : A) :
    S.limitMap ≫ limit.π F' (S.target.obj a) =
      limit.π F (S.source.obj a) ≫ S.app.app a := by
  simp [DiagramComparison.limitMap, Functor.Initial.limitIso]

theorem DiagramComparison.limitMap_isIso (S : DiagramComparison F F' A)
    [HasLimit F] [HasLimit F'] [HasLimit (S.source ⋙ F)]
    [IsIso (limit.pre F S.source)] [IsIso S.app] : IsIso S.limitMap := by
  have h : S.limitMap = limit.pre F S.source ≫ limMap S.app ≫
      (Functor.Initial.limitIso S.target F').hom := by
    simp only [DiagramComparison.limitMap, limit.pre, ← limit.lift_map, Category.assoc]
  rw [h]
  infer_instance

def DiagramComparison.fromNatTrans {F F' : J ⥤ 𝒱} (β : F ⟶ F') :
    DiagramComparison F F' J where
  source := 𝟭 J
  target := 𝟭 J
  app := β
  initial := inferInstance

@[simp]
theorem DiagramComparison.fromNatTrans_limitMap {F F' : J ⥤ 𝒱} (β : F ⟶ F')
    [HasLimit F] [HasLimit F'] : (DiagramComparison.fromNatTrans β).limitMap = limMap β := by
  apply limit.hom_ext
  intro j
  rw [limMap_π]
  simpa [DiagramComparison.fromNatTrans] using
    (DiagramComparison.limitMap_π (DiagramComparison.fromNatTrans β) j)

def DiagramComparison.restriction (F : J ⥤ 𝒱) (u : J' ⥤ J) :
    DiagramComparison F (u ⋙ F) J' where
  source := u
  target := 𝟭 J'
  app := 𝟙 _
  initial := inferInstance

@[simp]
theorem DiagramComparison.restriction_limitMap (F : J ⥤ 𝒱) (u : J' ⥤ J)
    [HasLimit F] [HasLimit (u ⋙ F)] :
    (DiagramComparison.restriction F u).limitMap = limit.pre F u := by
  apply limit.hom_ext
  intro j
  rw [limit.pre_π]
  simpa [DiagramComparison.restriction] using
    (DiagramComparison.limitMap_π (DiagramComparison.restriction F u) j)

def DiagramComparison.id (F : J ⥤ 𝒱) : DiagramComparison F F J :=
  DiagramComparison.fromNatTrans (𝟙 F)

@[simp]
theorem DiagramComparison.id_limitMap (F : J ⥤ 𝒱) [HasLimit F] :
    (DiagramComparison.id F).limitMap = 𝟙 (limit F) := by
  apply limit.hom_ext
  intro j
  simpa [DiagramComparison.id, DiagramComparison.fromNatTrans] using
    (DiagramComparison.limitMap_π (DiagramComparison.id F) j)

def DiagramComparison.comp (S : DiagramComparison F F' A)
    (T : DiagramComparison F' F'' B) :
    DiagramComparison F F'' (Comma S.target T.source) where
  source := Comma.fst S.target T.source ⋙ S.source
  target := Comma.snd S.target T.source ⋙ T.target
  app :=
    { app := fun x => S.app.app x.left ≫ F'.map x.hom ≫ T.app.app x.right
      naturality := by
        intro x y f
        have hs := S.app.naturality f.left
        have ht := T.app.naturality f.right
        dsimp at hs ht ⊢
        rw [← Category.assoc, hs]
        simp only [Category.assoc]
        rw [← Category.assoc (F'.map (S.target.map f.left)), ← F'.map_comp,
          f.w, F'.map_comp]
        simp only [Category.assoc]
        rw [ht] }
  initial := inferInstance

theorem DiagramComparison.comp_limitMap (S : DiagramComparison F F' A)
    (T : DiagramComparison F' F'' B) [HasLimit F] [HasLimit F'] [HasLimit F''] :
    (S.comp T).limitMap = S.limitMap ≫ T.limitMap := by
  apply (cancel_mono (limit.pre F'' (S.comp T).target)).1
  apply limit.hom_ext
  intro x
  simp only [Category.assoc, limit.pre_π]
  rw [(S.comp T).limitMap_π]
  change limit.π F (S.source.obj x.left) ≫
      (S.app.app x.left ≫ F'.map x.hom ≫ T.app.app x.right) =
    S.limitMap ≫ T.limitMap ≫ limit.π F'' (T.target.obj x.right)
  rw [T.limitMap_π, ← limit.w F' x.hom]
  simp only [← Category.assoc]
  rw [S.limitMap_π]

end DiagramComparisons

section Labels

variable {D : Type*} [Category D] {C : D ⥤ Cat} {𝒱 : Type*} [Category 𝒱]

theorem monotone_op_initial_iff (modulus : ℕ → ℕ) (h : Monotone modulus) :
    h.functor.op.Initial ↔ ∀ n, ∃ k, n ≤ modulus k := by
  rw [← h.final_functor_iff]
  exact ⟨fun _ => Functor.final_of_initial_op _, fun _ => Functor.initial_op_of_final _⟩

/-- A coherent choice of an object in each fiber. -/
structure ObjectSection (C : D ⥤ Cat) where
  functor : D ⥤ Grothendieck C
  over : functor ⋙ Grothendieck.forget C = 𝟭 D

def ObjectSection.map {C' : D ⥤ Cat} (s : ObjectSection C) (j : C ⟶ C') :
    ObjectSection C' where
  functor := s.functor ⋙ Grothendieck.map j
  over := s.over

noncomputable def ObjectSection.pullback {D' : Type*} [Category D']
    (s : ObjectSection C) (G : D' ⥤ D) : ObjectSection (G ⋙ C) := by
  sorry

theorem ObjectSection.pullback_comp_pre {D' : Type*} [Category D']
    (s : ObjectSection C) (G : D' ⥤ D) :
    (s.pullback G).functor ⋙ Grothendieck.pre C G = G ⋙ s.functor := by
  sorry

/-- A natural label family whose image in the base is the identity. -/
structure VerticalLabel (L : D ⥤ Cat) (s t : ObjectSection L) where
  hom : s.functor ⟶ t.functor
  vertical : whiskerRight hom (Grothendieck.forget L) =
    eqToHom s.over ≫ eqToHom t.over.symm

variable {L : D ⥤ Cat} [∀ d, IsGroupoid (L.obj d)] {s t : ObjectSection L}

theorem VerticalLabel.isIso (g : VerticalLabel L s t) : IsIso g.hom := by
  have : IsIso (whiskerRight g.hom (Grothendieck.forget L)) := by
    rw [g.vertical]
    infer_instance
  have (d : D) : IsIso ((g.hom.app d).base) := by
    change IsIso ((whiskerRight g.hom (Grothendieck.forget L)).app d)
    infer_instance
  have (d : D) : IsIso (g.hom.app d) := by
    let e := Grothendieck.isoMk (asIso (g.hom.app d).base) (asIso (g.hom.app d).fiber)
    change IsIso e.hom
    infer_instance
  exact NatIso.isIso_of_isIso_app g.hom

noncomputable def VerticalLabel.coefficientIso (A : Grothendieck L ⥤ 𝒱)
    (g : VerticalLabel L s t) [HasLimit (s.functor ⋙ A)] [HasLimit (t.functor ⋙ A)] :
    limit (s.functor ⋙ A) ≅ limit (t.functor ⋙ A) := by
  letI := g.isIso
  exact HasLimit.isoOfNatIso (isoWhiskerRight (asIso g.hom) A)

end Labels

section ActionIntertwiners

variable {D D' 𝒱 : Type*} [Category D] [Category D'] [Category 𝒱]
  {L : D ⥤ Cat} {L' : D' ⥤ Cat}
  {A : Grothendieck L ⥤ 𝒱} {A' : Grothendieck L' ⥤ 𝒱} {G : D' ⥤ D}

/-- An action intertwiner; its label functor need not be initial. -/
structure ActionIntertwiner (A : Grothendieck L ⥤ 𝒱)
    (A' : Grothendieck L' ⥤ 𝒱) (G : D' ⥤ D) where
  labels : G ⋙ L ⟶ L'
  app : Grothendieck.pre L G ⋙ A ⟶ Grothendieck.map labels ⋙ A'

noncomputable def ActionIntertwiner.section (T : ActionIntertwiner A A' G)
    (s : ObjectSection L) : ObjectSection L' :=
  (s.pullback G).map T.labels

/-- Section coefficient limits use the comparison legs `G` and `𝟭 D'`. -/
noncomputable def ActionIntertwiner.sectionComparison
    (T : ActionIntertwiner A A' G) (s : ObjectSection L) :
    DiagramComparison (s.functor ⋙ A) ((T.section s).functor ⋙ A') D' where
  source := G
  target := 𝟭 D'
  app := eqToHom (congrArg (fun K => K ⋙ A) (s.pullback_comp_pre G).symm) ≫
    whiskerLeft (s.pullback G).functor T.app
  initial := inferInstance

end ActionIntertwiners

end CoefficientInfrastructure

/-! ### Graded correspondences (README §0.8) -/

section HomogeneousComponents

variable {R Γ M : Type*} [Semiring R] [DecidableEq Γ] [AddCommMonoid M] [Module R M]
  (𝒜 : Γ → Submodule R M) [DirectSum.Decomposition 𝒜]

/-- The whole homogeneous component supplied by the direct-sum decomposition. -/
noncomputable def homogeneousComponent (q : Γ) (a : M) : M :=
  ((DirectSum.decompose 𝒜 a) q : M)

/-- Apply a linear map and retain its whole target component. -/
noncomputable def homogeneousImage {N : Type*} [AddCommMonoid N] [Module R N]
    (φ : N →ₗ[R] M) (q : Γ) : N →ₗ[R] M :=
  (𝒜 q).subtype ∘ₗ DirectSum.component R Γ (fun q => 𝒜 q) q ∘ₗ
    (DirectSum.decomposeLinearEquiv 𝒜).toLinearMap ∘ₗ φ

end HomogeneousComponents

section Correspondences

variable {R Γu Γv Mb Mu Mv : Type*} [Semiring R]
  [AddCommMonoid Mb] [AddCommMonoid Mu] [AddCommMonoid Mv]
  [Module R Mb] [Module R Mu] [Module R Mv]
  (𝒜u : Γu → Submodule R Mu) (𝒜v : Γv → Submodule R Mv)

/-- A span with linear lifts on admissible whole homogeneous pieces
(`README §0.8`). In a coefficient diagram it is a structure on a span of the index category. -/
structure GradedCorrespondence (Mb : Type*) [AddCommMonoid Mb] [Module R Mb] where
  left : Mb →ₗ[R] Mu
  right : Mb →ₗ[R] Mv
  admissibleLeft : Set Γu
  liftLeft : ∀ γ ∈ admissibleLeft, 𝒜u γ →ₗ[R] Mb
  left_lift : ∀ γ (h : γ ∈ admissibleLeft) (a : 𝒜u γ), left (liftLeft γ h a) = a
  admissibleRight : Set Γv
  liftRight : ∀ η ∈ admissibleRight, 𝒜v η →ₗ[R] Mb
  right_lift : ∀ η (h : η ∈ admissibleRight) (a : 𝒜v η), right (liftRight η h a) = a

variable {𝒜u 𝒜v}

/-- The transfer from the left module: lift, map to the right module and keep the whole
`η`-component (`README §0.8`). -/
noncomputable def GradedCorrespondence.transferLeft [DecidableEq Γv]
    [DirectSum.Decomposition 𝒜v]
    (S : GradedCorrespondence 𝒜u 𝒜v Mb) (γ : Γu) (h : γ ∈ S.admissibleLeft) (η : Γv) :
    𝒜u γ →ₗ[R] Mv :=
  homogeneousImage 𝒜v (S.right.comp (S.liftLeft γ h)) η

/-- The transfer from the right module. -/
noncomputable def GradedCorrespondence.transferRight [DecidableEq Γu]
    [DirectSum.Decomposition 𝒜u]
    (S : GradedCorrespondence 𝒜u 𝒜v Mb) (η : Γv) (h : η ∈ S.admissibleRight) (γ : Γu) :
    𝒜v η →ₗ[R] Mu :=
  homogeneousImage 𝒜u (S.left.comp (S.liftRight η h)) γ

/-- The image in `Mu × Mv`; joint injectivity identifies it with `Mb` (`README §0.8`). -/
def GradedCorrespondence.toSubmodule (S : GradedCorrespondence 𝒜u 𝒜v Mb) :
    Submodule R (Mu × Mv) :=
  LinearMap.range (S.left.prod S.right)

/-- A common lift of two linear maps, including inhomogeneous sums (`README §0.8`). -/
structure GradedCorrespondence.CommonLift (S : GradedCorrespondence 𝒜u 𝒜v Mb)
    {E : Type*} [AddCommMonoid E] [Module R E]
    (αu : E →ₗ[R] Mu) (αv : E →ₗ[R] Mv) where
  lift : E →ₗ[R] Mb
  left_lift : ∀ a : E, S.left (lift a) = αu a
  right_lift : ∀ a : E, S.right (lift a) = αv a

/-- Joint injectivity is used for uniqueness, not for the definition of transfer. -/
theorem GradedCorrespondence.CommonLift.subsingleton
    (S : GradedCorrespondence 𝒜u 𝒜v Mb) (hS : Function.Injective (S.left.prod S.right))
    {E : Type*} [AddCommMonoid E] [Module R E]
    (αu : E →ₗ[R] Mu) (αv : E →ₗ[R] Mv) : Subsingleton (S.CommonLift αu αv) where
  allEq l m := by
    have h : l.lift = m.lift := by
      ext a
      apply hS
      exact Prod.ext ((l.left_lift a).trans (m.left_lift a).symm)
        ((l.right_lift a).trans (m.right_lift a).symm)
    cases l
    cases m
    cases h
    rfl

variable (𝒜u 𝒜v) in
/-- The graph correspondence of a linear equivalence (`README §0.8`). -/
def GradedCorrespondence.graph (θ : Mu ≃ₗ[R] Mv) : GradedCorrespondence 𝒜u 𝒜v Mu where
  left := LinearMap.id
  right := θ.toLinearMap
  admissibleLeft := Set.univ
  liftLeft γ _ := (𝒜u γ).subtype
  left_lift _ _ _ := rfl
  admissibleRight := Set.univ
  liftRight η _ := θ.symm.toLinearMap.comp (𝒜v η).subtype
  right_lift _ _ a := by simp

theorem GradedCorrespondence.graph_joint_injective (θ : Mu ≃ₗ[R] Mv) :
    Function.Injective ((GradedCorrespondence.graph 𝒜u 𝒜v θ).left.prod
      (GradedCorrespondence.graph 𝒜u 𝒜v θ).right) := fun _ _ h => congrArg Prod.fst h

/-- A change of graded correspondence, preserving admissibility and every lift. -/
structure GradedCorrespondence.Map
    {Γu' Γv' Mb' Mu' Mv' : Type*}
    [AddCommMonoid Mb'] [AddCommMonoid Mu'] [AddCommMonoid Mv']
    [Module R Mb'] [Module R Mu'] [Module R Mv']
    {𝒜u' : Γu' → Submodule R Mu'} {𝒜v' : Γv' → Submodule R Mv'}
    (S : GradedCorrespondence 𝒜u 𝒜v Mb) (S' : GradedCorrespondence 𝒜u' 𝒜v' Mb')
    (T_u : Γu → Γu') (T_v : Γv → Γv') where
  face : Mb →ₗ[R] Mb'
  left : Mu →ₗ[R] Mu'
  right : Mv →ₗ[R] Mv'
  left_square : left.comp S.left = S'.left.comp face
  right_square : right.comp S.right = S'.right.comp face
  left_graded : ∀ γ, (𝒜u γ).map left ≤ 𝒜u' (T_u γ)
  right_graded : ∀ η, (𝒜v η).map right ≤ 𝒜v' (T_v η)
  admissibleLeft : ∀ γ ∈ S.admissibleLeft, T_u γ ∈ S'.admissibleLeft
  admissibleRight : ∀ η ∈ S.admissibleRight, T_v η ∈ S'.admissibleRight
  liftLeft_square : ∀ γ (h : γ ∈ S.admissibleLeft) (a : 𝒜u γ),
    face (S.liftLeft γ h a) = S'.liftLeft (T_u γ) (admissibleLeft γ h)
      ⟨left a, left_graded γ (Submodule.mem_map_of_mem a.2)⟩
  liftRight_square : ∀ η (h : η ∈ S.admissibleRight) (a : 𝒜v η),
    face (S.liftRight η h a) = S'.liftRight (T_v η) (admissibleRight η h)
      ⟨right a, right_graded η (Submodule.mem_map_of_mem a.2)⟩

/-- Truncation is the identity regrading; the lift equations also cover zero target pieces. -/
abbrev GradedCorrespondence.Truncation
    {Mb' Mu' Mv' : Type*} [AddCommMonoid Mb'] [AddCommMonoid Mu'] [AddCommMonoid Mv']
    [Module R Mb'] [Module R Mu'] [Module R Mv']
    {𝒜u' : Γu → Submodule R Mu'} {𝒜v' : Γv → Submodule R Mv'}
    (S : GradedCorrespondence 𝒜u 𝒜v Mb) (S' : GradedCorrespondence 𝒜u' 𝒜v' Mb') :=
  S.Map S' id id

end Correspondences

section DiagramCorrespondences

open CategoryTheory

/-- A span of arbitrary coefficient indices. -/
structure DiagramSpan (J : Type*) [Category J] where
  center : J
  left : J
  right : J
  toLeft : center ⟶ left
  toRight : center ⟶ right

variable {R J Γu Γv : Type*} [Semiring R] [Category J]

/-- A graded correspondence whose maps are exactly those of the coefficient diagram. -/
structure DiagramSpan.GradedCorrespondence (S : DiagramSpan J) (F : J ⥤ SemimoduleCat R)
    (𝒜u : Γu → Submodule R (F.obj S.left)) (𝒜v : Γv → Submodule R (F.obj S.right))
    extends TauCetiRoadmap.ScatteringDiagrams.GradedCorrespondence 𝒜u 𝒜v (F.obj S.center) where
  left_eq : left = (F.map S.toLeft).hom
  right_eq : right = (F.map S.toRight).hom

end DiagramCorrespondences

/-! ## Layer 1: polyhedral geometry -/

section Polyhedra

variable {N V : Type*} [AddCommGroup N] [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- A real functional is rational for the lattice map `i` when it is rational on lattice
vectors (`README §1.1`). -/
def IsRationalFunctional (i : N →+ V) (φ : Module.Dual ℝ V) : Prop :=
  ∀ n : N, ∃ q : ℚ, φ (i n) = q

/-- A presentation `{x | ∀ k, normal k x ≤ offset k}` with rational normals and real offsets
(`README §1.1`). Rationality belongs to the presentation, not to the set. -/
structure RationalAffinePolyhedron (i : N →+ V) where
  numIneq : ℕ
  normal : Fin numIneq → Module.Dual ℝ V
  offset : Fin numIneq → ℝ
  normal_rational : ∀ k, IsRationalFunctional i (normal k)

namespace RationalAffinePolyhedron

variable {i : N →+ V} (P : RationalAffinePolyhedron i)

/-- The solution set. -/
def carrier : Set V := {x | ∀ k, P.normal k x ≤ P.offset k}

/-- The carrier is a Tau Ceti convex polyhedron: a theorem, not a field (`README §1.1`). -/
theorem isConvexPolyhedron [FiniteDimensional ℝ V] : TauCeti.IsConvexPolyhedron P.carrier := by
  convert TauCeti.isConvexPolyhedron_setOf_forall fun k : Fin P.numIneq =>
    (LinearMap.toContinuousLinearMap (P.normal k)).toContinuousAffineMap
      - ContinuousAffineMap.const ℝ V (P.offset k) using 1
  ext x
  simp [carrier]

end RationalAffinePolyhedron

/-- The set `s` has a rational-normal presentation. -/
def IsRationalAffinePolyhedron (i : N →+ V) (s : Set V) : Prop :=
  ∃ P : RationalAffinePolyhedron i, P.carrier = s

/-- Faces of a polyhedron, in the exposed-subset characterization (`README §1.1` defines them
through the homogenization and `PointedCone.IsFaceOf`, and proves that the nonempty faces are
exactly the nonempty exposed subsets). -/
def IsPolyhedralFace (F s : Set V) : Prop := F.Nonempty ∧ IsExposed ℝ s F

/-- Finitely many nonempty rational polyhedra, closed under faces, meeting in common faces
(`README §1.1`). Unbounded cells and lineality are allowed. -/
structure FinitePolyhedralComplex (i : N →+ V) where
  cells : Set (Set V)
  finite_cells : cells.Finite
  rational : ∀ ⦃σ⦄, σ ∈ cells → IsRationalAffinePolyhedron i σ
  nonempty : ∀ ⦃σ⦄, σ ∈ cells → σ.Nonempty
  face_mem : ∀ ⦃σ τ⦄, σ ∈ cells → IsPolyhedralFace τ σ → τ ∈ cells
  inter_isFace : ∀ ⦃σ τ⦄, σ ∈ cells → τ ∈ cells → (σ ∩ τ).Nonempty →
    IsPolyhedralFace (σ ∩ τ) σ

/-- The walls of a complex: its codimension-one cells (`README §1.2`). -/
def FinitePolyhedralComplex.walls {i : N →+ V} (K : FinitePolyhedralComplex i) : Set (Set V) :=
  {σ | σ ∈ K.cells ∧ Module.finrank ℝ (affineSpan ℝ σ).direction + 1 = Module.finrank ℝ V}

end Polyhedra

/-- A finite family of proper affine subspaces (`README §1.3`). -/
structure ExceptionalArrangement (V : Type*) [AddCommGroup V] [Module ℝ V] where
  count : ℕ
  locus : Fin count → AffineSubspace ℝ V
  proper : ∀ k, locus k ≠ ⊤

namespace ExceptionalArrangement

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V] (E : ExceptionalArrangement V)

/-- Avoiding every exceptional locus (`README §1.3`). -/
def IsGeneric (q : V) : Prop := ∀ k, q ∉ E.locus k

/-- `README §1.2` density of the common complement of an arrangement; not a uniform
all-degree neighborhood. -/
theorem generic_dense [FiniteDimensional ℝ V] : Dense {q | E.IsGeneric q} := by
  have := FiniteDimensional.complete ℝ V
  have hset : {q | E.IsGeneric q} = ⋂ k, ((E.locus k : Set V))ᶜ := by
    ext q; simp [IsGeneric]
  have hint : ∀ k, interior (E.locus k : Set V) = ∅ := fun k => by
    by_contra h'
    have htop := isOpen_interior.affineSpan_eq_top (Set.nonempty_iff_ne_empty.2 h')
    apply E.proper k
    rw [eq_top_iff, ← htop]
    exact (affineSpan_mono ℝ interior_subset).trans (AffineSubspace.affineSpan_coe _).le
  rw [hset]
  exact dense_iInter_of_isOpen (fun k => (E.locus k).closed_of_finiteDimensional.isOpen_compl)
    fun k => interior_eq_empty_iff_dense_compl.mp (hint k)

end ExceptionalArrangement

/-! ### Polyhedral cochains and sweeps (README §1.4) -/

noncomputable section Cochains

variable {N V : Type*} [AddCommGroup N] [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- Alternating real `k`-forms on `V`. -/
abbrev AltForm (V : Type*) [NormedAddCommGroup V] [NormedSpace ℝ V] (k : ℕ) :=
  V [⋀^Fin k]→ₗ[ℝ] ℝ

/-- The direction of the affine span of a set. -/
def affineDir (P : Set V) : Submodule ℝ V := (affineSpan ℝ P).direction

/-- Alternating `k`-forms vanishing when one argument lies in `W`: for `codim W = k` this is
the conormal determinant line `Λ^k Ann(W) ≅ Λ^k (V/W)^*` (`README §1.4`). -/
def conormalForms (W : Submodule ℝ V) (k : ℕ) : Submodule ℝ (AltForm V k) where
  carrier := {α | ∀ (v : Fin k → V) (j : Fin k), v j ∈ W → α v = 0}
  add_mem' {a b} ha hb v j hv := by simp [ha v j hv, hb v j hv]
  zero_mem' _ _ _ := rfl
  smul_mem' c a ha v j hv := by simp [ha v j hv]

/-- A ray of `k`-forms is an orientation of `V/W` when one (equivalently every) representative
is a conormal form (`README §1.4`). -/
def IsConormalRay (W : Submodule ℝ V) {k : ℕ} (o : Module.Ray ℝ (AltForm V k)) : Prop :=
  ∃ α ∈ conormalForms W k, ∃ hα : α ≠ 0, rayOfNeZero ℝ α hα = o

/-- The sign of an orientation on a `k`-tuple of vectors; well defined on rays. -/
noncomputable def orientationSign {k : ℕ} (o : Module.Ray ℝ (AltForm V k)) (w : Fin k → V) :
    SignType :=
  SignType.sign (o.someVector w)

/-- A generator `(P, o)` of codimension `k` (`README §1.4`): `P` a nonempty closed
rational-normal polyhedron of codimension `k`, `o` an orientation of `V/dir(P)` recorded as a
conormal ray. -/
structure OrientedCell (i : N →+ V) (k : ℕ) where
  carrier : Set V
  rational : IsRationalAffinePolyhedron i carrier
  nonempty : carrier.Nonempty
  codim : Module.finrank ℝ (affineDir carrier) + k = Module.finrank ℝ V
  orientation : Module.Ray ℝ (AltForm V k)
  conormal : IsConormalRay (affineDir carrier) orientation

namespace OrientedCell

variable {i : N →+ V} {k : ℕ}

/-- Reversal of the orientation. -/
def reverse (σ : OrientedCell i k) : OrientedCell i k :=
  { σ with
    orientation := -σ.orientation
    conormal := by
      obtain ⟨α, hα, h0, he⟩ := σ.conormal
      exact ⟨-α, neg_mem hα, neg_ne_zero.2 h0, by rw [← he]; exact (neg_rayOfNeZero ℝ α h0).symm⟩ }

end OrientedCell

variable {i : N →+ V} {E : Type*} [AddCommGroup E] {k : ℕ}

/-- A subdivision of the support of an oriented cell into cells of the same codimension and
the same (induced) orientation: they cover `P` and have pairwise disjoint relative interiors
(`README §1.4`). A full-dimensional subcell has the same direction, so the induced conormal
orientation is the same ray. -/
structure IsOrientedSubdivision (σ : OrientedCell i k) {m : ℕ} (Q : Fin m → OrientedCell i k) :
    Prop where
  cover : ⋃ j, (Q j).carrier = σ.carrier
  disjoint : ∀ j l, j ≠ l →
    Disjoint (intrinsicInterior ℝ (Q j).carrier) (intrinsicInterior ℝ (Q l).carrier)
  orientation : ∀ j, (Q j).orientation = σ.orientation

variable (i E k) in
/-- The submodule generated by the reversal relations `(P, -o, c) + (P, o, c)` and the
subdivision relations `(P, o, c) - Σ_j (Q_j, o, c)` (`README §1.4`). Additivity in `c` and zero
coefficients already hold in `OrientedCell i k →₀ E`. -/
def cochainRelations : Submodule ℤ (OrientedCell i k →₀ E) :=
  Submodule.span ℤ
    ({x | ∃ (σ : OrientedCell i k) (c : E),
        x = Finsupp.single σ.reverse c + Finsupp.single σ c} ∪
      {x | ∃ (σ : OrientedCell i k) (m : ℕ) (Q : Fin m → OrientedCell i k) (c : E),
        IsOrientedSubdivision σ Q ∧ x = Finsupp.single σ c - ∑ j, Finsupp.single (Q j) c})

variable (i E k) in
/-- `README §1.4` *PolyhedralCochain* of codimension `k` with values in `E`: the explicit
quotient of the direct sum of copies of the abelian group `E` by the cochain relations. -/
abbrev PolyhedralCochain := (OrientedCell i k →₀ E) ⧸ cochainRelations i E k

namespace PolyhedralCochain

/-- The class of a generator `(P, o, c)`. -/
def mk (σ : OrientedCell i k) (c : E) : PolyhedralCochain i E k :=
  Submodule.Quotient.mk (Finsupp.single σ c)

end PolyhedralCochain

/-- `u` points from the facet `F` into the cell `P`: `u ∈ dir(P)`, `u ∉ dir(F)`, and some point
of `F` is moved into `P` by `u`. -/
def IsInwardVector (F P : Set V) (u : V) : Prop :=
  u ∈ affineDir P ∧ u ∉ affineDir F ∧ ∃ x ∈ F, x + u ∈ P

/-- `τ` is a facet of `σ` with the induced orientation (`README §1.4`): contracting a facet
form `β` with an inward vector `u` gives a positive multiple of the cell form `α`. By Laplace
expansion this is the README's rule "append an outward conormal of `F` within `dir(P)` to an
oriented conormal frame of `P` and multiply by `(−1)^{k+1}`", and it is independent of positive
rescaling of the conormals. Codimensions force `dim τ + 1 = dim σ`. -/
def IsInducedOrientation (σ : OrientedCell i k) (τ : OrientedCell i (k + 1)) : Prop :=
  IsPolyhedralFace τ.carrier σ.carrier ∧
    ∃ (α : AltForm V k) (hα : α ≠ 0) (β : AltForm V (k + 1)) (hβ : β ≠ 0) (u : V) (t : ℝ),
      rayOfNeZero ℝ α hα = σ.orientation ∧ rayOfNeZero ℝ β hβ = τ.orientation ∧
      IsInwardVector τ.carrier σ.carrier u ∧ 0 < t ∧ β.curryLeft u = t • α

/-- Finite support of the coboundary of a generator (`README §1.4`). -/
theorem finite_inducedOrientation [FiniteDimensional ℝ V] (σ : OrientedCell i k) :
    {τ : OrientedCell i (k + 1) | IsInducedOrientation σ τ}.Finite := by
  sorry

open scoped Classical in
/-- The coboundary on the direct sum of coefficient groups: a generator goes to the sum over its
facets with the induced orientation (`0` if that set were infinite, which
`finite_inducedOrientation` excludes). -/
def coboundaryFree : (OrientedCell i k →₀ E) →ₗ[ℤ] (OrientedCell i (k + 1) →₀ E) :=
  Finsupp.lsum ℤ fun σ =>
    if h : {τ : OrientedCell i (k + 1) | IsInducedOrientation σ τ}.Finite then
      ∑ τ ∈ h.toFinset, Finsupp.lsingle τ
    else 0

/-- The coboundary respects reversal and subdivision (`README §1.4`: new
interior facets cancel in pairs by reversal). -/
theorem coboundaryFree_relations :
    cochainRelations i E k ≤ (cochainRelations i E (k + 1)).comap coboundaryFree := by
  sorry

/-- `README §1.4` *coboundary* `d : C^k → C^{k+1}`. -/
def coboundary : PolyhedralCochain i E k →ₗ[ℤ] PolyhedralCochain i E (k + 1) :=
  (cochainRelations i E k).mapQ (cochainRelations i E (k + 1)) coboundaryFree
    coboundaryFree_relations

/-- `README §1.4` `coboundary_sq_zero`: the two incidence signs at a codimension-two face
cancel, proved in the two-dimensional normal quotient, lineality allowed. -/
theorem coboundary_sq_zero :
    (coboundary : PolyhedralCochain i E (k + 1) →ₗ[ℤ] PolyhedralCochain i E (k + 2)) ∘ₗ
      (coboundary : PolyhedralCochain i E k →ₗ[ℤ] PolyhedralCochain i E (k + 1)) = 0 := by
  sorry

/-- The standard `m`-simplex in barycentric coordinates. -/
def paramSimplex (m : ℕ) : Set (Fin (m + 1) → ℝ) := {t | (∀ j, 0 ≤ t j) ∧ ∑ j, t j = 1}

/-- The affine map of the standard simplex with vertices `v`, `t ↦ Σ t_j v_j`; it need not be
an embedding. -/
def simplexMap {m : ℕ} (v : Fin (m + 1) → V) (t : Fin (m + 1) → ℝ) : V := ∑ j, t j • v j

/-- The edge vectors `v_{j+1} - v_0`; their order orients the simplex. -/
def edgeVectors {m : ℕ} (v : Fin (m + 1) → V) : Fin m → V := fun j => v j.succ - v 0

/-- Stratified general position of a `k`-simplex against a cell of codimension `k`
(`README §1.4`): at an intersection the edges surject onto `V/dir(σ)`; proper parameter
faces miss `σ`, and the simplex misses its relative boundary. Disjoint tests may be degenerate. -/
structure IsTransverseSimplex (v : Fin (k + 1) → V) (σ : OrientedCell i k) : Prop where
  span_eq_top : (∃ t ∈ paramSimplex k, simplexMap v t ∈ σ.carrier) →
    affineDir σ.carrier ⊔ Submodule.span ℝ (Set.range (edgeVectors v)) = ⊤
  faces_avoid : ∀ t ∈ paramSimplex k, (∃ j, t j = 0) → simplexMap v t ∉ σ.carrier
  frontier_avoid : ∀ t ∈ paramSimplex k, simplexMap v t ∉ intrinsicFrontier ℝ σ.carrier

/-- `README §1.4` *TransverseAffineTest* for a representative `x`: an affine map of the
oriented standard `k`-simplex, transverse to every cell in the support of `x`. -/
structure TransverseAffineTest (x : OrientedCell i k →₀ E) where
  vertex : Fin (k + 1) → V
  transverse : ∀ σ ∈ x.support, IsTransverseSimplex vertex σ

/-- The pairing of a test simplex with a representative: for each generator, the orientation
sign of the normal-quotient map times the number of zero-dimensional preimages (at most one,
by transversality). No determinant magnitude enters. -/
noncomputable def intersectionPairingFree (v : Fin (k + 1) → V) :
    (OrientedCell i k →₀ E) →ₗ[ℤ] E :=
  Finsupp.lsum ℤ fun σ =>
    ((orientationSign σ.orientation (edgeVectors v) : ℤ) *
      (Nat.card {t | t ∈ paramSimplex k ∧ simplexMap v t ∈ σ.carrier} : ℤ)) • LinearMap.id

/-- `README §1.4` *intersectionPairing*. Its invariance under the cochain relations and under
subdivision of the parameter simplex are README targets. -/
noncomputable def intersectionPairing {x : OrientedCell i k →₀ E} (S : TransverseAffineTest x) :
    E :=
  intersectionPairingFree S.vertex x

/-- `README §1.4` `cochain_eq_zero_of_tests` (local detection). No coplanarity hypothesis is
needed: coincident coplanar contributions are summed by the pairing itself. -/
theorem cochain_eq_zero_of_tests [FiniteDimensional ℝ V] (x : OrientedCell i k →₀ E)
    (h : ∃ ε > 0, ∀ v : Fin (k + 1) → V, (∀ σ ∈ x.support, IsTransverseSimplex v σ) →
      (∀ j l, dist (v j) (v l) < ε) → intersectionPairingFree v x = 0) :
    (Submodule.Quotient.mk x : PolyhedralCochain i E k) = 0 := by
  sorry

/-- The `j`-th simplex `[a_0, …, a_j, b_j, …, b_m]` of the standard triangulation of the prism
`[0, T] × Δ^m` over the simplex `w`, with `b_l = a_l + T n`; it carries the sign `(−1)^j`. -/
def prismSimplex {m : ℕ} (w : Fin (m + 1) → V) (n : V) (T : ℝ) (j : Fin (m + 1)) :
    Fin (m + 2) → V :=
  fun l => if h : l.val ≤ j.val then w ⟨l.val, by omega⟩ else w ⟨l.val - 1, by omega⟩ + T • n

/-- The pairing with the curtain `H(t, s) = S(s) + t n` on `[0, T] × Δ^m`, computed on the
triangulated parameter prism; the prism is not an embedded simplex in `V`. -/
noncomputable def prismPairing {m : ℕ} (x : OrientedCell i (m + 1) →₀ E) (w : Fin (m + 1) → V)
    (n : V) (T : ℝ) : E :=
  ∑ j : Fin (m + 1), ((-1 : ℤ) ^ (j : ℕ)) • intersectionPairingFree (prismSimplex w n T j) x

/-- General position of the curtain for `C` and `dC`: the top, bottom, side and prism simplices
are transverse. -/
structure IsGenericCurtain (x : OrientedCell i (k + 1) →₀ E) (v : Fin (k + 2) → V) (n : V)
    (T : ℝ) : Prop where
  top : ∀ σ ∈ x.support, IsTransverseSimplex (fun j => v j + T • n) σ
  bottom : ∀ σ ∈ x.support, IsTransverseSimplex v σ
  prism : ∀ j, ∀ τ ∈ (coboundaryFree x).support, IsTransverseSimplex (prismSimplex v n T j) τ
  side : ∀ (l : Fin (k + 2)) (j : Fin (k + 1)), ∀ σ ∈ x.support,
    IsTransverseSimplex (prismSimplex (v ∘ l.succAbove) n T j) σ

/-- `README §1.4` `intersection_stokes`, summed over the triangulated parameter prism:
`⟨dC, [0,T] × S⟩ = ⟨C, S_T⟩ − ⟨C, S_0⟩ − ⟨C, [0,T] × ∂S⟩` with `∂S = Σ_l (−1)^l S ∘ δ_l`. -/
theorem intersection_stokes [FiniteDimensional ℝ V] (x : OrientedCell i (k + 1) →₀ E)
    (v : Fin (k + 2) → V) (n : V) (T : ℝ) (hT : 0 ≤ T) (hgen : IsGenericCurtain x v n T) :
    prismPairing (coboundaryFree x) v n T =
      intersectionPairingFree (fun j => v j + T • n) x - intersectionPairingFree v x -
        ∑ l : Fin (k + 2), ((-1 : ℤ) ^ (l : ℕ)) • prismPairing x (v ∘ l.succAbove) n T := by
  sorry

/-- The swept support `P − ℝ_{≥0} n` (`README §1.4`). -/
def sweepSupport (P : Set V) (n : V) : Set V :=
  {y | ∃ x ∈ P, ∃ t : ℝ, 0 ≤ t ∧ y = x - t • n}

/-- `README §1.4`: for `n ∉ dir(P)` the swept support of a nonempty rational polyhedron along a
lattice vector is a nonempty closed rational-normal polyhedron of codimension `k − 1`
(Fourier–Motzkin for the presentation), with direction `dir(P) + ℝn`. -/
theorem sweepSupport_isCell [FiniteDimensional ℝ V] {P : Set V}
    (hP : IsRationalAffinePolyhedron i P) (hne : P.Nonempty) (n₀ : N)
    (hn : i n₀ ∉ affineDir P) :
    IsRationalAffinePolyhedron i (sweepSupport P (i n₀)) ∧
      affineDir (sweepSupport P (i n₀)) = affineDir P ⊔ Submodule.span ℝ {i n₀} ∧
      Module.finrank ℝ (affineDir (sweepSupport P (i n₀))) =
        Module.finrank ℝ (affineDir P) + 1 := by
  sorry

/-- `ι_n α` is a nonzero conormal form of `W + ℝn` when `α` is a nonzero conormal form of `W`,
`codim W = k + 1` and `n ∉ W` (`README §1.4`). -/
theorem curryLeft_conormal [FiniteDimensional ℝ V] {W : Submodule ℝ V}
    {α : AltForm V (k + 1)} (hα : α ∈ conormalForms W (k + 1)) (h0 : α ≠ 0)
    (hk : Module.finrank ℝ W + (k + 1) = Module.finrank ℝ V) {n : V} (hn : n ∉ W) :
    α.curryLeft n ∈ conormalForms (W ⊔ Submodule.span ℝ {n}) k ∧ α.curryLeft n ≠ 0 := by
  sorry

theorem someVector_mem_conormalForms (σ : OrientedCell i k) :
    σ.orientation.someVector ∈ conormalForms (affineDir σ.carrier) k := by
  obtain ⟨α, hα, h0, he⟩ := σ.conormal
  have h := σ.orientation.someVector_ray
  rw [← he, ray_eq_iff] at h
  rw [← he]
  obtain ⟨r₁, r₂, hr₁, -, hr⟩ := h.exists_pos (Module.Ray.someVector_ne_zero _) h0
  have : (rayOfNeZero ℝ α h0).someVector = (r₁⁻¹ * r₂) • α := by
    rw [mul_smul, ← hr, smul_smul, inv_mul_cancel₀ hr₁.ne', one_smul]
  rw [this]
  exact Submodule.smul_mem _ _ hα

/-- The swept generator `S_n(P, α) = (P − ℝ_{≥0} n, ι_n α)` for `n ∉ dir(P)`
(`README §1.4`), with `α` the alternating form representing the conormal orientation. -/
noncomputable def sweepCell [FiniteDimensional ℝ V] (n₀ : N) (σ : OrientedCell i (k + 1))
    (hn : i n₀ ∉ affineDir σ.carrier) : OrientedCell i k where
  carrier := sweepSupport σ.carrier (i n₀)
  rational := (sweepSupport_isCell σ.rational σ.nonempty n₀ hn).1
  nonempty := σ.nonempty.mono fun x hx => ⟨x, hx, 0, le_rfl, by simp⟩
  codim := by
    have := σ.codim
    rw [(sweepSupport_isCell σ.rational σ.nonempty n₀ hn).2.2]
    omega
  orientation := rayOfNeZero ℝ _
    (curryLeft_conormal (someVector_mem_conormalForms σ) (Module.Ray.someVector_ne_zero _)
      σ.codim hn).2
  conormal := ⟨_, by
    rw [(sweepSupport_isCell σ.rational σ.nonempty n₀ hn).2.1]
    exact (curryLeft_conormal (someVector_mem_conormalForms σ) (Module.Ray.someVector_ne_zero _)
      σ.codim hn).1, _, rfl⟩

open scoped Classical in
/-- The sweep on the direct sum of coefficient groups; `0` on generators with `n ∈ dir(P)`, where
the sweep is not defined. -/
noncomputable def sweepFree [FiniteDimensional ℝ V] (n₀ : N) :
    (OrientedCell i (k + 1) →₀ E) →ₗ[ℤ] (OrientedCell i k →₀ E) :=
  Finsupp.lsum ℤ fun σ =>
    if h : i n₀ ∉ affineDir σ.carrier then Finsupp.lsingle (sweepCell n₀ σ h) else 0

variable (i E) in
/-- Representatives all of whose cells satisfy `n ∉ dir(P)`. -/
def transverseSupported (n : V) (k : ℕ) : Submodule ℤ (OrientedCell i k →₀ E) :=
  Finsupp.supported E ℤ {σ | n ∉ affineDir σ.carrier}

variable (i E) in
/-- Cochains with a representative transverse to `n`, modulo the relations among such
representatives (the domain of the sweep, `README §1.4`). -/
abbrev TransverseCochain (n : V) (k : ℕ) :=
  transverseSupported i E n k ⧸
    (cochainRelations i E k).comap (transverseSupported i E n k).subtype

/-- The class of a transverse representative. -/
def TransverseCochain.mk {n : V} (x : OrientedCell i k →₀ E)
    (hx : x ∈ transverseSupported i E n k) : TransverseCochain i E n k :=
  Submodule.Quotient.mk ⟨x, hx⟩

/-- The comparison map to all cochains. Its injectivity (every relation is homogeneous for the
direction of its cells) is a README target. -/
def TransverseCochain.toCochain {n : V} :
    TransverseCochain i E n k →ₗ[ℤ] PolyhedralCochain i E k :=
  Submodule.liftQ _ ((cochainRelations i E k).mkQ ∘ₗ (transverseSupported i E n k).subtype)
    (fun x hx => by simpa [Submodule.Quotient.mk_eq_zero] using hx)

/-- Facets of a cell transverse to `n` are transverse to `n`. -/
theorem coboundaryFree_transverse {n : V} {x : OrientedCell i k →₀ E}
    (hx : x ∈ transverseSupported i E n k) :
    coboundaryFree x ∈ transverseSupported i E n (k + 1) := by
  sorry

/-- The coboundary of transverse cochains. -/
def TransverseCochain.coboundary {n : V} :
    TransverseCochain i E n k →ₗ[ℤ] TransverseCochain i E n (k + 1) :=
  Submodule.mapQ _ _ (coboundaryFree.restrict fun _ hx => coboundaryFree_transverse hx)
    (fun _ hx => coboundaryFree_relations hx)

/-- Well-definedness of the sweep on transverse classes (`README §1.4`: the
swept pieces subdivide the swept support; reversal is compatible with `ι_n`). -/
theorem sweepFree_relations [FiniteDimensional ℝ V] (n₀ : N) :
    (cochainRelations i E (k + 1)).comap (transverseSupported i E (i n₀) (k + 1)).subtype ≤
      LinearMap.ker ((cochainRelations i E k).mkQ ∘ₗ sweepFree n₀ ∘ₗ
        (transverseSupported i E (i n₀) (k + 1)).subtype) := by
  sorry

/-- `README §1.4` *sweep* `S_n` on cochains with a representative whose cells have
`n ∉ dir(P)`. -/
noncomputable def sweep [FiniteDimensional ℝ V] (n₀ : N) :
    TransverseCochain i E (i n₀) (k + 1) →ₗ[ℤ] PolyhedralCochain i E k :=
  Submodule.liftQ _ ((cochainRelations i E k).mkQ ∘ₗ sweepFree n₀ ∘ₗ
    (transverseSupported i E (i n₀) (k + 1)).subtype) (sweepFree_relations n₀)

/-- `README §1.4` `sweep_homotopy` `d S_n C + S_n d C = −C`: apply `intersection_stokes` with
`T` beyond every hitting time, retaining every side face, then `cochain_eq_zero_of_tests`. -/
theorem sweep_homotopy [FiniteDimensional ℝ V] (n₀ : N)
    (C : TransverseCochain i E (i n₀) (k + 1)) :
    coboundary (sweep n₀ C) + sweep n₀ (TransverseCochain.coboundary C) =
      -TransverseCochain.toCochain C := by
  sorry

/-- `README §1.4` *sweep_strictlyOutgoing*: `n ∉ rec(P − ℝ_{≥0} n)`, since `n ∈ rec(P − ℝ_{≥0} n)`
would give `(1 + t) n ∈ dir(P)`. -/
theorem sweep_strictlyOutgoing [FiniteDimensional ℝ V] (n₀ : N) (σ : OrientedCell i (k + 1))
    (hn : i n₀ ∉ affineDir σ.carrier) :
    ¬ ∀ x ∈ (sweepCell n₀ σ hn).carrier, ∀ t : ℝ, 0 ≤ t →
      x + t • i n₀ ∈ (sweepCell n₀ σ hn).carrier := by
  intro h
  obtain ⟨x, hx⟩ := σ.nonempty
  obtain ⟨y, hy, t, ht, he⟩ := h x ⟨x, hx, 0, le_rfl, by simp⟩ 1 zero_le_one
  have hmem : y -ᵥ x ∈ affineDir σ.carrier := by
    rw [affineDir, direction_affineSpan]
    exact vsub_mem_vectorSpan ℝ hy hx
  have hyx : y -ᵥ x = (1 + t) • i n₀ := by
    rw [vsub_eq_sub, add_smul, one_smul]
    rw [one_smul] at he
    rw [eq_sub_iff_add_eq] at he
    rw [← he]
    abel
  rw [hyx] at hmem
  have h1t : (1 + t) ≠ 0 := by linarith
  apply hn
  simpa [h1t] using Submodule.smul_mem _ (1 + t)⁻¹ hmem

end Cochains

/-! ## Layer 2: path products and finite wall diagrams -/

/-- A finite complex, a coorientation of each wall, and exactly one label per wall
(`README §2.1`). The normal vanishes on the wall's direction, so reversing the coorientation
inverts the label. -/
structure FiniteWallDiagram {N V : Type*} [AddCommGroup N] [NormedAddCommGroup V]
    [NormedSpace ℝ V] (i : N →+ V) (H : Type*) [Group H] where
  complex : FinitePolyhedralComplex i
  normal : complex.walls → Module.Dual ℝ V
  normal_ne_zero : ∀ 𝔡, normal 𝔡 ≠ 0
  normal_direction : ∀ 𝔡 : complex.walls, ∀ v ∈ (affineSpan ℝ (𝔡 : Set V)).direction,
    normal 𝔡 v = 0
  label : complex.walls → H

/-! ## Layer 3: directed walls -/

section WallSpaces

variable {R : Type*} [CommRing R]
  {L Λ : Type*} [AddCommGroup L] [AddCommGroup Λ] {g : Type*} [LieRing g] [LieAlgebra R g]

/-- `μ((n,m),(n',m')) = m(ρ n') m' - m'(ρ n) m`, the normal of a bracket (`README §3.1`). -/
def wallBracketNormal (ρ : L →+ Λ) (n n' : L) (m m' : Λ →+ ℤ) : Λ →+ ℤ :=
  m (ρ n') • m' - m' (ρ n) • m

/-- Homogeneous wall spaces `h_{n,m} ⊆ g_n` with bracket-normal compatibility (`README §3.1`). -/
structure DirectedWallSpaces (ρ : L →+ Λ) (ℒ : L → Submodule R g) where
  wall : L → (Λ →+ ℤ) → Submodule R g
  wall_le_piece : ∀ n m, wall n m ≤ ℒ n
  zero_normal : ∀ n, wall n 0 = ⊥
  nontangent : ∀ n m, m (ρ n) ≠ 0 → wall n m = ⊥
  rescale : ∀ n m (c : ℤ), c ≠ 0 → wall n (c • m) = wall n m
  bracket_mem : ∀ n n' m m' (x y : g),
    x ∈ wall n m → y ∈ wall n' m' → ⁅x, y⁆ ∈ wall (n + n') (wallBracketNormal ρ n n' m m')

/-- The ray submodule sums exactly the supported positive multiples (`README §3.1`). -/
def DirectedWallSpaces.raySubmodule {ℒ : L → Submodule R g} {ρ : L →+ Λ}
    (W : DirectedWallSpaces ρ ℒ) {D : PositiveDegrees L} (r : D.SupportedRay)
    (m : Λ →+ ℤ) : Submodule R g :=
  ⨆ n, ⨆ (_ : n ∈ D.rayDegrees r.generator), W.wall n m

/-- Each actual homogeneous wall space embeds in its supported ray submodule. -/
theorem DirectedWallSpaces.wall_le_raySubmodule {ℒ : L → Submodule R g} {ρ : L →+ Λ}
    (W : DirectedWallSpaces ρ ℒ) {D : PositiveDegrees L} (r : D.SupportedRay)
    (m : Λ →+ ℤ) {n : L} (hn : n ∈ D.rayDegrees r.generator) :
    W.wall n m ≤ W.raySubmodule r m :=
  le_iSup_of_le n (le_iSup_of_le hn le_rfl)

/-- Wall spaces with the same normal commute (`README §3.1`). No tangency hypothesis is
needed: a nontangent wall space is zero. -/
theorem DirectedWallSpaces.sameNormal_lie_eq_zero {ℒ : L → Submodule R g}
    {ρ : L →+ Λ} (W : DirectedWallSpaces ρ ℒ) (n n' : L) (m : Λ →+ ℤ) (x y : g)
    (hx : x ∈ W.wall n m) (hy : y ∈ W.wall n' m) : ⁅x, y⁆ = 0 := by
  by_cases hn : m (ρ n) = 0
  · by_cases hn' : m (ρ n') = 0
    · have h := W.bracket_mem n n' m m x y hx hy
      simpa [wallBracketNormal, hn, hn', W.zero_normal] using h
    · rw [W.nontangent n' m hn', Submodule.mem_bot] at hy
      simp [hy]
  · rw [W.nontangent n m hn, Submodule.mem_bot] at hx
    simp [hx]

/-- Wall spaces with rationally proportional normals commute (`README §3.1`): a common nonzero
rescaling reduces this to `sameNormal_lie_eq_zero`. -/
theorem DirectedWallSpaces.parallelWallSpaces_commute {ℒ : L → Submodule R g}
    {ρ : L →+ Λ} (W : DirectedWallSpaces ρ ℒ) (n n' : L) (m m' : Λ →+ ℤ) (c d : ℤ)
    (hc : c ≠ 0) (hd : d ≠ 0) (hparallel : c • m = d • m') (x y : g)
    (hx : x ∈ W.wall n m) (hy : y ∈ W.wall n' m') : ⁅x, y⁆ = 0 := by
  apply W.sameNormal_lie_eq_zero n n' (c • m) x y
  · simpa only [W.rescale n m c hc] using hx
  · rw [hparallel, W.rescale n' m' d hd]
    exact hy

/-- Wall elements whose degrees project to zero commute (`README §3.1`). -/
theorem DirectedWallSpaces.kernel_lie_eq_zero {ℒ : L → Submodule R g}
    {ρ : L →+ Λ} (W : DirectedWallSpaces ρ ℒ) (n n' : L) (m m' : Λ →+ ℤ)
    (hn : ρ n = 0) (hn' : ρ n' = 0) (x y : g)
    (hx : x ∈ W.wall n m) (hy : y ∈ W.wall n' m') : ⁅x, y⁆ = 0 := by
  have h := W.bracket_mem n n' m m' x y hx hy
  simpa [wallBracketNormal, hn, hn', W.zero_normal] using h

/-- A bracket with total projected degree zero vanishes (`README §3.1`). -/
theorem DirectedWallSpaces.total_projection_zero_lie_eq_zero {ℒ : L → Submodule R g}
    {ρ : L →+ Λ} (W : DirectedWallSpaces ρ ℒ) (n n' : L) (m m' : Λ →+ ℤ)
    (hzero : ρ (n + n') = 0) (x y : g)
    (hx : x ∈ W.wall n m) (hy : y ∈ W.wall n' m') : ⁅x, y⁆ = 0 := by
  by_cases hn : m (ρ n) = 0
  · by_cases hn' : m' (ρ n') = 0
    · have hm : m (ρ n') = 0 := by
        simpa only [map_add, map_zero, hn, zero_add] using congrArg m hzero
      have hm' : m' (ρ n) = 0 := by
        simpa only [map_add, map_zero, hn', add_zero] using congrArg m' hzero
      have h := W.bracket_mem n n' m m' x y hx hy
      simpa [wallBracketNormal, hm, hm', W.zero_normal] using h
    · rw [W.nontangent n' m' hn', Submodule.mem_bot] at hy
      simp [hy]
  · rw [W.nontangent n m hn, Submodule.mem_bot] at hx
    simp [hx]

end WallSpaces

/-- A directed affine wall with physical direction `-ρ w` and support direction `ker m_ℝ`.
`wallGroup w m` is the completed supported-ray subgroup (`README §§3.1–3.2`). -/
structure DirectedWall {L Λ V : Type*} [AddCommGroup L] [AddCommGroup Λ] [NormedAddCommGroup V] [NormedSpace ℝ V]
    {i : Λ →+ V} (hi : TauCeti.Toric.IsIntegralLattice i) (ρ : L →+ Λ) (D : PositiveDegrees L)
    {G : Type*} [Group G] (wallGroup : L → (Λ →+ ℤ) → Subgroup G) where
  normal : Λ →+ ℤ
  normal_ne_zero : normal ≠ 0
  ray : D.SupportedRay
  normal_apply_ray : normal (ρ ray.generator) = 0
  support : Set V
  support_rational : IsRationalAffinePolyhedron i support
  support_nonempty : support.Nonempty
  support_direction : (affineSpan ℝ support).direction = LinearMap.ker (hi.realCharacter normal)
  label : wallGroup ray.generator normal

namespace DirectedWall

variable {L Λ V : Type*} [AddCommGroup L] [AddCommGroup Λ] [NormedAddCommGroup V] [NormedSpace ℝ V]
  {i : Λ →+ V} {hi : TauCeti.Toric.IsIntegralLattice i} {ρ : L →+ Λ} {D : PositiveDegrees L}
  {G : Type*} [Group G] {wallGroup : L → (Λ →+ ℤ) → Subgroup G}
  (𝔡 : DirectedWall hi ρ D wallGroup)

/-- `𝔡 + ℝ≥0 ρ(w) ⊆ 𝔡` for the primitive ray generator (`README §3.2`). -/
def Incoming : Prop :=
  ∀ x ∈ 𝔡.support, ∀ t : ℝ, 0 ≤ t → x + t • i (ρ 𝔡.ray.generator) ∈ 𝔡.support

/-- The negation of incoming (`README §3.2`). -/
def Outgoing : Prop := ¬ 𝔡.Incoming

/-- A coefficient-only degree is incoming for every support (`README §§1.5, 3.3`). -/
theorem incoming_of_projection_zero (h : ρ 𝔡.ray.generator = 0) : 𝔡.Incoming := by
  intro x hx t ht
  simpa [h] using hx

end DirectedWall

/-! ### Local scattering and existence of completion (README §3.3) -/

/-- The order filtration of the abstract completed group `Ĝ` (`README §0.5`): `ker k` is the
kernel of `Ĝ → G≤k`, so `ker 0 = ⊤` for the BCH tower. -/
structure OrderFiltration (G : Type*) [Group G] where
  ker : ℕ → Subgroup G
  normal : ∀ k, (ker k).Normal
  antitone : Antitone ker

namespace OrderFiltration

variable {G : Type*} [Group G] (K : OrderFiltration G)

instance (k : ℕ) : (K.ker k).Normal := K.normal k

/-- The projection `Ĝ → G≤k = Ĝ / ker k`. -/
def proj (k : ℕ) : G →* G ⧸ K.ker k := QuotientGroup.mk' _

/-- The tower map `G≤k+1 → G≤k`. -/
def step (k : ℕ) : G ⧸ K.ker (k + 1) →* G ⧸ K.ker k :=
  QuotientGroup.map _ _ (MonoidHom.id G) (K.antitone (Nat.le_succ k))

end OrderFiltration

section Diagrams

variable {L Λ V : Type*} [AddCommGroup L] [AddCommGroup Λ] [NormedAddCommGroup V] [NormedSpace ℝ V]
  {i : Λ →+ V} {hi : TauCeti.Toric.IsIntegralLattice i} {ρ : L →+ Λ} {D : PositiveDegrees L}
  {G : Type*} [Group G] {wallGroup : L → (Λ →+ ℤ) → Subgroup G}

/-- The real normal `m_ℝ` of a directed wall. -/
noncomputable def DirectedWall.realNormal (𝔡 : DirectedWall hi ρ D wallGroup) : Module.Dual ℝ V :=
  hi.realCharacter 𝔡.normal

/-- A full affine hyperplane `{m_ℝ = c}` (`README §3.3`); it is incoming. -/
def DirectedWall.IsFullHyperplane (𝔡 : DirectedWall hi ρ D wallGroup) : Prop :=
  ∃ c : ℝ, 𝔡.support = {x | 𝔡.realNormal x = c}

/-- The signed factor of a wall crossed with velocity `v` (Convention 3): the label when
crossing against the coorientation, its inverse when crossing along it. -/
noncomputable def DirectedWall.signedFactor (𝔡 : DirectedWall hi ρ D wallGroup) (v : V) : G :=
  if 𝔡.realNormal v < 0 then 𝔡.label.val else if 0 < 𝔡.realNormal v then 𝔡.label.val⁻¹ else 1

/-- The crossing parameter of a transverse segment `[a, b]` with a wall: `m_ℝ` is constant on
the support, so any of its points serves. -/
noncomputable def DirectedWall.crossTime (𝔡 : DirectedWall hi ρ D wallGroup) (a b : V) : ℝ :=
  (𝔡.realNormal 𝔡.support_nonempty.some - 𝔡.realNormal a) / 𝔡.realNormal (b - a)

variable (hi ρ D wallGroup) in
/-- A family of directed walls, finite at each order, with commuting parallel wall groups
(`README §§2.2, 3.2`). Indexing retains multiplicities. -/
structure DirectedDiagram (K : OrderFiltration G) (ι : Type*) where
  wall : ι → DirectedWall hi ρ D wallGroup
  finite_at_order : ∀ k, {d | (wall d).label.val ∉ K.ker k}.Finite
  parallel_commute : ∀ (n n' : L) (m m' : Λ →+ ℤ), m ≠ 0 → m' ≠ 0 →
    ∀ (a b : ℤ), a ≠ 0 → b ≠ 0 → a • m = b • m' →
      ∀ x ∈ wallGroup n m, ∀ y ∈ wallGroup n' m', Commute x y

namespace DirectedDiagram

variable {K : OrderFiltration G} {ι : Type*} (𝔇 : DirectedDiagram hi ρ D wallGroup K ι)

/-- The walls nontrivial at order `k`, as a finite family (the chosen indexing is immaterial
for the derived notions). -/
noncomputable def activeFamily (k : ℕ) :
    Fin (𝔇.finite_at_order k).toFinset.card → DirectedWall hi ρ D wallGroup :=
  fun j => 𝔇.wall ((𝔇.finite_at_order k).toFinset.equivFin.symm j).val

/-- The supports of the walls nontrivial at order `k`. -/
def activeSupport (k : ℕ) : Set V :=
  {x | ∃ d, (𝔇.wall d).label.val ∉ K.ker k ∧ x ∈ (𝔇.wall d).support}

open scoped Classical in
/-- The signed product of the walls active at order `k` through `x`, for velocity `v`
(Convention 3); off the singular support the incident labels commute (`README §3.1`). -/
noncomputable def wallProductAt (k : ℕ) (x v : V) : G :=
  ((𝔇.finite_at_order k).toFinset.toList.map fun d =>
    if x ∈ (𝔇.wall d).support then (𝔇.wall d).signedFactor v else 1).prod

open scoped Classical in
/-- The product over one segment `[a, b]` at order `k`: the active walls met by the segment,
sorted by crossing time, first crossing rightmost. Ties (coplanar walls) commute. -/
noncomputable def segmentProduct (k : ℕ) (a b : V) : G :=
  let l := ((𝔇.finite_at_order k).toFinset.filter fun d =>
    (segment ℝ a b ∩ (𝔇.wall d).support).Nonempty).toList.mergeSort fun d d' =>
      decide ((𝔇.wall d).crossTime a b ≤ (𝔇.wall d').crossTime a b)
  (l.map fun d => (𝔇.wall d).signedFactor (b - a)).reverse.prod

/-- The order-`k` path product along the polygon with vertices `v` (the local form of
`README §2.1`'s path product): first segment rightmost. -/
noncomputable def polygonProduct (k : ℕ) {m : ℕ} (v : Fin (m + 1) → V) : G :=
  ((List.finRange m).map fun j => 𝔇.segmentProduct k (v j.castSucc) (v j.succ)).reverse.prod

/-- A polygon admissible at order `k` (`README §1.2`): vertices off the active support, each
segment transverse to every active wall it meets, and each segment avoiding the relative
boundaries and nonparallel intersections of the active walls. -/
structure IsAdmissiblePolygon (k : ℕ) {m : ℕ} (v : Fin (m + 1) → V) : Prop where
  vertex_off : ∀ j, v j ∉ 𝔇.activeSupport k
  transverse : ∀ (j : Fin m) d, (𝔇.wall d).label.val ∉ K.ker k →
    (segment ℝ (v j.castSucc) (v j.succ) ∩ (𝔇.wall d).support).Nonempty →
    (𝔇.wall d).realNormal (v j.succ - v j.castSucc) ≠ 0
  avoids_frontier : ∀ (j : Fin m) d, (𝔇.wall d).label.val ∉ K.ker k →
    Disjoint (segment ℝ (v j.castSucc) (v j.succ)) (intrinsicFrontier ℝ (𝔇.wall d).support)
  avoids_joints : ∀ (j : Fin m) d d', (𝔇.wall d).label.val ∉ K.ker k →
    (𝔇.wall d').label.val ∉ K.ker k →
    affineDir (𝔇.wall d).support ≠ affineDir (𝔇.wall d').support →
    Disjoint (segment ℝ (v j.castSucc) (v j.succ)) ((𝔇.wall d).support ∩ (𝔇.wall d').support)

/-- Both product constructions give the same combined label for a single regular crossing
(`README §3.2`), using `parallel_commute` for all incident wall groups. -/
theorem segmentProduct_eq_wallProductAt [FiniteDimensional ℝ V] (k : ℕ) (a b x : V)
    (hx : x ∈ segment ℝ a b) (hadm : 𝔇.IsAdmissiblePolygon k ![a, b])
    (hcross : ∀ d, (𝔇.wall d).label.val ∉ K.ker k →
      ∀ y ∈ segment ℝ a b, y ∈ (𝔇.wall d).support → y = x) :
    𝔇.segmentProduct k a b = 𝔇.wallProductAt k x (b - a) := by
  sorry

/-- Consistency to order `k` (`README §2.2`): admissible closed polygons have trivial product
in `G≤k`. -/
def ConsistentToOrder (k : ℕ) : Prop :=
  ∀ {m : ℕ} (v : Fin (m + 1) → V), 𝔇.IsAdmissiblePolygon k v → v (Fin.last m) = v 0 →
    𝔇.polygonProduct k v ∈ K.ker k

/-- Consistency at every order. -/
def Consistent : Prop := ∀ k, 𝔇.ConsistentToOrder k

end DirectedDiagram

variable (K : OrderFiltration G)

/-- `𝔇` is an outgoing completion of `Din` (`README §3.3`): it contains the initial walls,
every added wall is outgoing, and it is consistent. `𝔇.finite_at_order` supplies the
orderwise finiteness, also for the initial family. -/
def IsOutgoingCompletion {ιin : Type*} (Din : ιin → DirectedWall hi ρ D wallGroup) {κ : Type*}
    (𝔇 : DirectedDiagram hi ρ D wallGroup K (ιin ⊕ κ)) : Prop :=
  (∀ j, 𝔇.wall (Sum.inl j) = Din j) ∧ (∀ c, (𝔇.wall (Sum.inr c)).Outgoing) ∧ 𝔇.Consistent

/-- The central kernel of `G≤k+1 → G≤k`, modeled by `E`; for BCH this is
`F^{k+1} g / F^{k+2} g` (`README §3.3`). -/
structure CentralKernel (k : ℕ) (E : Type*) [AddCommGroup E] where
  ι : Multiplicative E →* G ⧸ K.ker (k + 1)
  ι_injective : Function.Injective ι
  range_ι : ι.range = (K.step k).ker
  central : ∀ e x, ι e * x = x * ι e

variable {K}

/-- The inverse central exponential on the kernel of the tower map (`README §3.3`). -/
noncomputable def CentralKernel.log {k : ℕ} {E : Type*} [AddCommGroup E]
    (κ : CentralKernel K k E) (u : (K.step k).ker) : E := by
  classical
  have hu : (u : G ⧸ K.ker (k + 1)) ∈ κ.ι.range := by
    rw [κ.range_ι]
    exact u.property
  exact Multiplicative.toAdd (MonoidHom.mem_range.1 hu).choose

/-- The central logarithm returns a preimage of its argument. -/
theorem CentralKernel.ι_log {k : ℕ} {E : Type*} [AddCommGroup E]
    (κ : CentralKernel K k E) (u : (K.step k).ker) :
    κ.ι (Multiplicative.ofAdd (κ.log u)) = (u : G ⧸ K.ker (k + 1)) := by
  classical
  exact (MonoidHom.mem_range.1 (show (u : G ⧸ K.ker (k + 1)) ∈ κ.ι.range by
    rw [κ.range_ι]
    exact u.property)).choose_spec

/-- Trivialization data at order `k + 1`: an adapted complex, lifts of order-`k` chamber
transport, oriented wall crossings and triangular joint meridians (`README §3.3`). -/
structure ChamberTrivialization [FiniteDimensional ℝ V] {ι : Type*}
    (𝔇 : DirectedDiagram hi ρ D wallGroup K ι) (k : ℕ) where
  complex : FinitePolyhedralComplex i
  walls : Finset (OrientedCell i 1)
  joints : Finset (OrientedCell i 2)
  walls_cells : ∀ 𝔡 ∈ walls, 𝔡.carrier ∈ complex.cells
  walls_cover : ∀ σ ∈ complex.cells,
    Module.finrank ℝ (affineDir σ) + 1 = Module.finrank ℝ V → ∃! 𝔡, 𝔡 ∈ walls ∧ 𝔡.carrier = σ
  joints_cells : ∀ j ∈ joints, j.carrier ∈ complex.cells
  joints_cover : ∀ σ ∈ complex.cells,
    Module.finrank ℝ (affineDir σ) + 2 = Module.finrank ℝ V → ∃! j, j ∈ joints ∧ j.carrier = σ
  adapted : ∀ d, (𝔇.wall d).label.val ∉ K.ker (k + 1) →
    ∃ T ⊆ walls, ⋃ 𝔡 ∈ T, 𝔡.carrier = (𝔇.wall d).support
  basePoint : V
  basePoint_off : basePoint ∉ ⋃ 𝔡 ∈ walls, 𝔡.carrier
  lift : V → G ⧸ K.ker (k + 1)
  lift_const : ∀ x y, Disjoint (segment ℝ x y) (⋃ 𝔡 ∈ walls, 𝔡.carrier) → lift x = lift y
  lift_spec : ∀ x, x ∉ ⋃ 𝔡 ∈ walls, 𝔡.carrier →
    ∀ {m : ℕ} (v : Fin (m + 1) → V), 𝔇.IsAdmissiblePolygon k v → v 0 = basePoint →
      v (Fin.last m) = x → K.step k (lift x) = K.proj k (𝔇.polygonProduct k v)
  crossPoint : OrientedCell i 1 → V
  crossVector : OrientedCell i 1 → V
  cross_spec : ∀ 𝔡 ∈ walls, crossPoint 𝔡 ∈ intrinsicInterior ℝ 𝔡.carrier ∧
    orientationSign 𝔡.orientation ![crossVector 𝔡] = 1 ∧
    ∀ x ∈ segment ℝ (crossPoint 𝔡 - crossVector 𝔡) (crossPoint 𝔡 + crossVector 𝔡),
      x ∈ ⋃ 𝔡' ∈ walls, 𝔡'.carrier → x = crossPoint 𝔡
  meridian : OrientedCell i 2 → Fin 3 → V
  meridian_spec : ∀ j ∈ joints, IsTransverseSimplex (meridian j) j ∧
    (∃ t ∈ paramSimplex 2, simplexMap (meridian j) t ∈ j.carrier) ∧
    orientationSign j.orientation (edgeVectors (meridian j)) = 1 ∧
    (∀ l, meridian j l ∉ ⋃ 𝔡 ∈ walls, 𝔡.carrier) ∧
    𝔇.IsAdmissiblePolygon (k + 1) ![meridian j 0, meridian j 1, meridian j 2, meridian j 0] ∧
    ∀ 𝔡 ∈ walls, (convexHull ℝ (Set.range (meridian j)) ∩ 𝔡.carrier).Nonempty →
      j.carrier ⊆ 𝔡.carrier
  /-- The filled meridian isolates its joint. Incidence only with walls containing the joint
  does not exclude enclosing a second endpoint of the same wall. -/
  meridian_isolates : ∀ j ∈ joints, ∀ j' ∈ joints,
    (convexHull ℝ (Set.range (meridian j)) ∩ j'.carrier).Nonempty → j' = j

namespace ChamberTrivialization

variable [FiniteDimensional ℝ V] {ι : Type*} {𝔇 : DirectedDiagram hi ρ D wallGroup K ι} {k : ℕ}
  (T : ChamberTrivialization 𝔇 k) {E : Type*} [AddCommGroup E]
  (κ : CentralKernel K k E)

/-- The lifted crossing element `X̃_w`: the order-`(k + 1)` wall product at the crossing point
of `𝔡`, for its crossing velocity. -/
noncomputable def crossing (𝔡 : OrientedCell i 1) : G ⧸ K.ker (k + 1) :=
  K.proj (k + 1) (𝔇.wallProductAt (k + 1) (T.crossPoint 𝔡) (T.crossVector 𝔡))

/-- The discrepancy `θ̃₊⁻¹ X̃_w θ̃₋` across an oriented wall cell. -/
noncomputable def crossingDiscrepancy (𝔡 : OrientedCell i 1) : G ⧸ K.ker (k + 1) :=
  (T.lift (T.crossPoint 𝔡 + T.crossVector 𝔡))⁻¹ * T.crossing 𝔡 *
    T.lift (T.crossPoint 𝔡 - T.crossVector 𝔡)

/-- The lifted transport condition places every wall-cell discrepancy in the central kernel. -/
theorem crossingDiscrepancy_mem (𝔡 : OrientedCell i 1) (h𝔡 : 𝔡 ∈ T.walls) :
    T.crossingDiscrepancy 𝔡 ∈ (K.step k).ker := by
  sorry

/-- The central logarithm of a wall-cell discrepancy, with its kernel membership explicit. -/
noncomputable def defectValue (𝔡 : OrientedCell i 1) (h𝔡 : 𝔡 ∈ T.walls) : E :=
  κ.log ⟨T.crossingDiscrepancy 𝔡, T.crossingDiscrepancy_mem 𝔡 h𝔡⟩

/-- `README §3.3` `centralDefect` `A_k`: the codimension-one cochain with values in `E`. It
depends on the lifts. -/
noncomputable def centralDefect : PolyhedralCochain i E 1 :=
  ∑ 𝔡 : T.walls, PolyhedralCochain.mk 𝔡.val (T.defectValue κ 𝔡.val 𝔡.property)

/-- The order-`(k + 1)` product along the chosen meridian of a joint cell. -/
noncomputable def meridianProduct (j : OrientedCell i 2) : G ⧸ K.ker (k + 1) :=
  K.proj (k + 1) (𝔇.polygonProduct (k + 1)
    ![T.meridian j 0, T.meridian j 1, T.meridian j 2, T.meridian j 0])

/-- Order-`k` consistency places the meridian product in the central kernel. -/
theorem meridianProduct_mem (hc : 𝔇.ConsistentToOrder k) (j : OrientedCell i 2)
    (hj : j ∈ T.joints) : T.meridianProduct j ∈ (K.step k).ker := by
  sorry

/-- The central logarithm of the meridian product, independent of the chamber lifts. -/
noncomputable def meridianValue (hc : 𝔇.ConsistentToOrder k) (j : OrientedCell i 2)
    (hj : j ∈ T.joints) : E :=
  κ.log ⟨T.meridianProduct j, T.meridianProduct_mem hc j hj⟩

/-- The meridian error cochain `ζ_k` (codimension two). -/
noncomputable def meridianError (hc : 𝔇.ConsistentToOrder k) : PolyhedralCochain i E 2 :=
  ∑ j : T.joints, PolyhedralCochain.mk j.val (T.meridianValue κ hc j.val j.property)

/-- `ζ_k = d A_k`, hence `d ζ_k = 0`; the coboundary is independent of the lifts
(`README §3.3`). -/
theorem centralDefect_eq_coboundary (hc : 𝔇.ConsistentToOrder k) :
    coboundary (T.centralDefect κ) = T.meridianError κ hc := by
  sorry

variable {E' : Type*} [AddCommGroup E']

open scoped Classical in
/-- The full degree component of the meridian error, before passing to the cochain quotient.
Transversality is a separate hypothesis for the sweep. -/
noncomputable def meridianComponentFree (hc : 𝔇.ConsistentToOrder k) (comp : E →ₗ[ℤ] E') :
    OrientedCell i 2 →₀ E' :=
  ∑ j : T.joints, Finsupp.single j.val (comp (T.meridianValue κ hc j.val j.property))

/-- The correction `b_{k,n} = S_{ρ n} ζ_{k,n}`, with wall label `exp(−c)` for coefficient `c`
on the positive transverse side. The correction-stage invariant supplies `hvanish`
(`README §3.3`). -/
noncomputable def centralStep (hc : 𝔇.ConsistentToOrder k) (comp : E →ₗ[ℤ] E') (n : L)
    (hvanish : ∀ j : T.joints, i (ρ n) ∈ affineDir j.val.carrier →
      comp (T.meridianValue κ hc j.val j.property) = 0) : PolyhedralCochain i E' 1 :=
  sweep (ρ n) (TransverseCochain.mk (T.meridianComponentFree κ hc comp) (by
    classical
    apply Submodule.sum_mem
    intro j hj
    by_cases ht : i (ρ n) ∈ affineDir j.val.carrier
    · simpa only [hvanish j ht, Finsupp.single_zero] using Submodule.zero_mem _
    · exact Finsupp.single_mem_supported ℤ _ ht))

end ChamberTrivialization

end Diagrams

/-! ## Layer 4: coefficient monoids and skew lattice data -/

/-- `README §4.1` *coefficient monoid*: a submonoid `Q` of `L` containing `P`. `Q = P` and
`Q = L` are the extreme cases; the principal carrier of §4.2 is `M° ⊕ P_N`. -/
structure CoefficientMonoid {L : Type*} [AddCommGroup L] (D : PositiveDegrees L) where
  carrier : AddSubmonoid L
  le : D.monoid ≤ carrier

/-- A degree map and rational-linear normal map preserving their pairing through `ρ`
(`README §4.1`). -/
structure TropicalPairing {L L' Λ Λ' : Type*}
    [AddCommGroup L] [AddCommGroup L'] [AddCommGroup Λ] [AddCommGroup Λ']
    (ρ : L →+ Λ) (ρ' : L' →+ Λ') (D : PositiveDegrees L) (E : PositiveDegrees L')
    (U : Submodule ℚ (Λ →ₗ[ℤ] ℚ)) where
  degreeMap : PositiveDegreeMap D E
  normalMap : U →ₗ[ℚ] (Λ' →ₗ[ℤ] ℚ)
  pairing : ∀ (m : U) (p : L), p ∈ D.monoid →
    normalMap m (ρ' (degreeMap.toAddMonoidHom p)) = m.val (ρ p)

section TwistedCoeffMap

variable {R R' Q Q' : Type*} [CommSemiring R] [CommSemiring R'] [AddCommMonoid Q]
  [AddCommMonoid Q']

/-- The coefficient map of `README §4.1` *tropicalVertexGroup.coeffMap* on monoid algebras,
`r z^q ↦ φ(r) χ(q) z^{Tq}`, for an additive `T : Q → Q'` and a monoid homomorphism
`χ : Q → (R', ·)`. The values of `χ` need not be units: with `Q = ℕ^E`, `χ(b) = a^b` for
non-invertible `a`, which a character `L → R'^×` cannot express. -/
noncomputable def twistedCoeffMap (φ : R →+* R') (T : Q →+ Q') (χ : Multiplicative Q →* R') :
    AddMonoidAlgebra R Q →+* AddMonoidAlgebra R' Q' :=
  AddMonoidAlgebra.liftNCRingHom (AddMonoidAlgebra.singleZeroRingHom.comp φ)
    { toFun := fun q => AddMonoidAlgebra.single (T (Multiplicative.toAdd q)) (χ q)
      map_one' := by simp [AddMonoidAlgebra.one_def]
      map_mul' := fun q q' => by simp [AddMonoidAlgebra.single_mul_single] }
    fun _ _ => Commute.all _ _

end TwistedCoeffMap

/-- A skew lattice datum (`README §4.2`): saturated `N_uf`, finite-index `N°`, an alternating
rational form and the two integrality conditions. An adapted basis is extra data. -/
structure SkewLatticeDatum (N : Type*) [AddCommGroup N] [Module.Free ℤ N] [Module.Finite ℤ N]
    where
  unfrozen : Submodule ℤ N
  unfrozen_saturated : unfrozen.toAddSubgroup.toAddSubmonoid.NSMulSaturated
  sub : Submodule ℤ N
  sub_index_ne_zero : sub.toAddSubgroup.index ≠ 0
  form : N →ₗ[ℤ] N →ₗ[ℤ] ℚ
  form_alt : form.IsAlt
  /-- `{N_uf, N°} ⊆ ℤ`. -/
  integral_unfrozen_sub : ∀ a ∈ unfrozen, ∀ b ∈ sub, ∃ k : ℤ, form a b = k
  /-- `{N, N_uf ∩ N°} ⊆ ℤ`. -/
  integral_inter : ∀ a, ∀ b ∈ unfrozen ⊓ sub, ∃ k : ℤ, form a b = k

/-! ### Units of weight zero and background slabs (README §4.4) -/

section WeightZeroSlabs

variable {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]
  (𝒜 : ℤ → Submodule R A) [GradedRing 𝒜]

/-- `Θ_f(a_n) = f^n a_n`, extended by homogeneous decomposition; `n` is the normal weight
(`README §4.4`). -/
noncomputable def weightZeroUnitMap (f : Aˣ) (a : A) : A := by
  classical
  exact (DirectSum.decompose 𝒜 a).sum fun n b => (↑(f ^ n) : A) * (b : A)

/-- The defining formula on a whole weight component. -/
theorem weightZeroUnitMap_on_piece (f : Aˣ) (n : ℤ) (a : A) (ha : a ∈ 𝒜 n) :
    weightZeroUnitMap 𝒜 f a = (↑(f ^ n) : A) * a := by
  sorry

/-- The automorphism defined by a weight-zero unit in arbitrary characteristic (`README §4.4`). -/
noncomputable def weightZeroUnitAut (f : Aˣ)
    (hf : (f : A) ∈ 𝒜 0) (hfInv : (↑(f⁻¹) : A) ∈ 𝒜 0) : A ≃ₐ[R] A where
  toFun := weightZeroUnitMap 𝒜 f
  invFun := weightZeroUnitMap 𝒜 f⁻¹
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry
  map_add' := by sorry
  commutes' := by sorry

/-- The unit action preserves homogeneous ideals. -/
theorem weightZeroUnitAut_mem_ideal_iff (f : Aˣ)
    (hf : (f : A) ∈ 𝒜 0) (hfInv : (↑(f⁻¹) : A) ∈ 𝒜 0)
    (I : Ideal A) (hI : ∀ a ∈ I, ∀ n, homogeneousComponent 𝒜 n a ∈ I) (a : A) :
    weightZeroUnitAut 𝒜 f hf hfInv a ∈ I ↔ a ∈ I := by
  sorry

end WeightZeroSlabs

section SlabLogarithm

variable {A : Type*} [CommRing A] [Algebra ℚ A]

/-- The finite logarithm for `(f - 1)^(k+1) = 0` (`README §4.4`). -/
noncomputable def truncatedUnitLog (f : Aˣ) (k : ℕ) : A :=
  ∑ j ∈ Finset.range k, ((-1 : ℚ) ^ j / (j + 1)) • (((f : A) - 1) ^ (j + 1))

/-- The logarithmic derivation `D(a_n) = n log(f) a_n` is nilpotent and exponentiates to the
unit action (`README §4.4`). -/
theorem exp_logSlab_eq_weightZeroUnitAut (𝒜 : ℤ → Submodule ℚ A) [GradedRing 𝒜]
    (f : Aˣ) (hf : (f : A) ∈ 𝒜 0) (hfInv : (↑(f⁻¹) : A) ∈ 𝒜 0)
    (k : ℕ) (hnil : ((f : A) - 1) ^ (k + 1) = 0)
    (D : Module.End ℚ A)
    (hD : ∀ n (a : A), a ∈ 𝒜 n →
      D a = (n : ℚ) • (truncatedUnitLog f k * a)) :
    D ^ (k + 1) = 0 ∧ ∀ a, IsNilpotent.exp D a = weightZeroUnitAut 𝒜 f hf hfInv a := by
  sorry

end SlabLogarithm

/-! ## Layer 5: broken lines -/

section BrokenLines

variable {L V : Type*} [AddCommGroup L] [AddCommGroup V] [Module ℝ V]

/-- The derived map `γ(t) = Q + Σ_j |[t,0] ∩ seg_j| • p_j`, `t ≤ 0`, integrating the velocity
`-p_j` of segment `j` backwards from the endpoint at time zero (`README §5.2`). -/
def brokenPath (i : L →+ V) {k : ℕ} (Q : V) (T : Fin k → ℝ) (p : Fin (k + 1) → L) (t : ℝ) : V :=
  Q + ∑ j, max 0 (Fin.snoc (α := fun _ => ℝ) T 0 j -
    max (Fin.cons (α := fun _ => ℝ) t T j) t) • i (p j)

/-- Interior times of segment `j`; the first segment has no finite left endpoint. -/
def IsSegmentInterior {k : ℕ} (T : Fin k → ℝ) (j : Fin (k + 1)) (t : ℝ) : Prop :=
  t < Fin.snoc (α := fun _ => ℝ) T 0 j ∧
    ∀ b : Fin k, b.val + 1 = j.val → T b < t

end BrokenLines

section FiniteCrossings

variable {L Λ V G : Type*} [AddCommGroup L] [AddCommGroup Λ] [NormedAddCommGroup V] [NormedSpace ℝ V]
  {i : Λ →+ V} {hi : TauCeti.Toric.IsIntegralLattice i} {ρ : L →+ Λ} {D : PositiveDegrees L}
  [Group G] {wallGroup : L → (Λ →+ ℤ) → Subgroup G} {w : ℕ}
  (walls : Fin w → DirectedWall hi ρ D wallGroup)

/-- The supports of the walls with nonidentity label; identity walls do not restrict endpoints
(`README §§2.2, 5.2`). -/
def activeWallSupport : Set V :=
  {x | ∃ j, (walls j).label.val ≠ 1 ∧ x ∈ (walls j).support}

/-- Relative wall boundaries and nonparallel intersections of the walls with nonidentity label
(`README §1.2`). -/
def activeSingularSupport : Set V :=
  {x | (∃ j, (walls j).label.val ≠ 1 ∧
      x ∈ intrinsicFrontier ℝ (walls j).support) ∨
    ∃ j k, (walls j).label.val ≠ 1 ∧ (walls k).label.val ≠ 1 ∧
      (affineSpan ℝ (walls j).support).direction ≠
        (affineSpan ℝ (walls k).support).direction ∧
      x ∈ (walls j).support ∧ x ∈ (walls k).support}

/-- The signed product of the walls met at `x` with velocity `v` (Convention 3). Off the
singular support the incident normals are parallel, so by `README §3.1` the labels commute and
the chosen finite indexing is immaterial. -/
noncomputable def signedWallProduct (x v : V) : G := by
  classical
  exact (List.ofFn fun j : Fin w =>
    if x ∈ (walls j).support then
      if hi.realCharacter (walls j).normal v < 0 then (walls j).label.val
      else if 0 < hi.realCharacter (walls j).normal v then (walls j).label.val⁻¹
      else 1
    else 1).reverse.prod

end FiniteCrossings

/-- The discrete type for a fixed affine wall presentation: incoming decoration, segment
degrees and active encounters (`README §§5.2–5.3`). -/
structure AffineDecoratedType (L A : Type*) (w : ℕ) where
  incomingDegree : L
  incomingCoefficient : A
  numEvents : ℕ
  degree : Fin (numEvents + 1) → L
  degree_zero : degree 0 = incomingDegree
  eventWalls : Fin numEvents → Finset (Fin w)
  eventWalls_nonempty : ∀ j, (eventWalls j).Nonempty

section BrokenLineCarrier

variable {R : Type*} [Semiring R]
  {L Λ V G A : Type*} [AddCommGroup L] [AddCommGroup Λ] [DecidableEq L]
  [NormedAddCommGroup V] [NormedSpace ℝ V]
  {i : Λ →+ V} (hi : TauCeti.Toric.IsIntegralLattice i) (ρ : L →+ Λ) (D : PositiveDegrees L)
  [Group G] (wallGroup : L → (Λ →+ ℤ) → Subgroup G)
  [AddCommGroup A] [Module R A] (𝒜 : L → Submodule R A)
  [DirectSum.Decomposition 𝒜]

/-- The affine positive constructor: nonzero velocity `-i (ρ p)`, increments in `P`, and
every active encounter recorded, including degree-preserving crossings (`README §5.2`). -/
structure AffineBrokenLine {w : ℕ} (walls : Fin w → DirectedWall hi ρ D wallGroup)
    (action : G →* (A ≃ₗ[R] A)) (k : ℕ) {p : L} (a : A) (ha : a ∈ 𝒜 p) where
  numEvents : ℕ
  eventTime : Fin numEvents → ℝ
  eventTime_strictMono : StrictMono eventTime
  eventTime_neg : ∀ j, eventTime j < 0
  degree : Fin (numEvents + 1) → L
  degree_zero : degree 0 = p
  direction_ne_zero : ∀ j, ρ (degree j) ≠ 0
  decoration : Fin (numEvents + 1) → A
  decoration_zero : decoration 0 = a
  decoration_mem : ∀ j, decoration j ∈ 𝒜 (degree j)
  decoration_ne_zero : ∀ j, decoration j ≠ 0
  endpoint : V
  endpoint_off : endpoint ∉ activeWallSupport walls
  increment_nonnegative : ∀ j : Fin numEvents,
    degree j.succ - degree j.castSucc ∈ D.monoid
  order_le : D.degree (degree (Fin.last numEvents) - p) ≤ (k : ℤ)
  avoids : ∀ t ≤ 0,
    brokenPath (i.comp ρ) endpoint eventTime degree t ∉ activeSingularSupport walls
  event_on_wall : ∀ j : Fin numEvents, ∃ d,
    (walls d).label.val ≠ 1 ∧
    brokenPath (i.comp ρ) endpoint eventTime degree (eventTime j) ∈ (walls d).support
  event_crosses : ∀ (j : Fin numEvents) (d : Fin w), (walls d).label.val ≠ 1 →
    brokenPath (i.comp ρ) endpoint eventTime degree (eventTime j) ∈ (walls d).support →
    0 < hi.realCharacter (walls d).normal (-i (ρ (degree j.castSucc))) *
      hi.realCharacter (walls d).normal (-i (ρ (degree j.succ)))
  event_action : ∀ j : Fin numEvents,
    decoration j.succ = homogeneousImage 𝒜
      (action (signedWallProduct walls
        (brokenPath (i.comp ρ) endpoint eventTime degree (eventTime j))
        (-i (ρ (degree j.castSucc))))).toLinearMap
      (degree j.succ) (decoration j.castSucc)
  all_encounters : ∀ (j : Fin (numEvents + 1)) (t : ℝ),
    IsSegmentInterior eventTime j t →
    brokenPath (i.comp ρ) endpoint eventTime degree t ∉ activeWallSupport walls

variable {hi ρ D wallGroup 𝒜} in
/-- Forget geometric realization data, retaining every active encounter (`README §5.2`). -/
noncomputable def AffineBrokenLine.decoratedType {w : ℕ}
    {walls : Fin w → DirectedWall hi ρ D wallGroup}
    {action : G →* (A ≃ₗ[R] A)} {k : ℕ} {p : L} {a : A} {ha : a ∈ 𝒜 p}
    (b : AffineBrokenLine hi ρ D wallGroup 𝒜 walls action k a ha) :
    AffineDecoratedType L A w := by
  classical
  exact
    { incomingDegree := p
      incomingCoefficient := a
      numEvents := b.numEvents
      degree := b.degree
      degree_zero := b.degree_zero
      eventWalls := fun j => Finset.univ.filter fun d =>
        (walls d).label.val ≠ 1 ∧
          brokenPath (i.comp ρ) b.endpoint b.eventTime b.degree (b.eventTime j) ∈ (walls d).support
      eventWalls_nonempty := by
        intro j
        obtain ⟨d, hd, hx⟩ := b.event_on_wall j
        exact ⟨d, by simp only [Finset.mem_filter, Finset.mem_univ, true_and]; exact ⟨hd, hx⟩⟩ }

/-- Finitely many discrete types across all endpoints for fixed initial decoration
(`README §5.2`). -/
theorem finite_affineDecoratedTypes {w : ℕ} (walls : Fin w → DirectedWall hi ρ D wallGroup)
    (action : G →* (A ≃ₗ[R] A)) (k : ℕ) {p : L} (a : A) (ha : a ∈ 𝒜 p) :
    (Set.range fun b : AffineBrokenLine hi ρ D wallGroup 𝒜 walls action k a ha =>
      b.decoratedType).Finite := by
  sorry

/-- The endpoint and discrete type determine the realized line (`README §5.3`). -/
theorem affineBrokenLine_type_endpoint_injective {w : ℕ}
    (walls : Fin w → DirectedWall hi ρ D wallGroup) (action : G →* (A ≃ₗ[R] A))
    (k : ℕ) {p : L} (a : A) (ha : a ∈ 𝒜 p) :
    Function.Injective (fun b : AffineBrokenLine hi ρ D wallGroup 𝒜 walls action k a ha =>
      (b.decoratedType, b.endpoint)) := by
  sorry

/-- An empty diagram has one discrete type and one line per endpoint (`README §§5.2–5.3`). -/
theorem emptyDiagram_one_decoratedType (action : G →* (A ≃ₗ[R] A))
    (k : ℕ) {p : L} (a : A) (ha : a ∈ 𝒜 p) (ha0 : a ≠ 0) (hp : ρ p ≠ 0) :
    let B := AffineBrokenLine hi ρ D wallGroup 𝒜 (fun j : Fin 0 => Fin.elim0 j) action k a ha
    ∃ τ : AffineDecoratedType L A 0,
      (∀ b : B, b.decoratedType = τ) ∧ ∀ Q : V, ∃! b : B, b.endpoint = Q := by
  sorry

/-- An invariant homogeneous source in `ker ρ`, defining a stationary section (`README §5.2`). -/
structure StationarySource (action : G →* (A ≃ₗ[R] A)) (p : L) where
  value : A
  homogeneous : value ∈ 𝒜 p
  direction_zero : ρ p = 0
  invariant : ∀ g, action g value = value

/-- The theta section of a compatible stationary source is constant. -/
def StationarySource.theta {action : G →* (A ≃ₗ[R] A)} {p : L}
    (a : StationarySource ρ 𝒜 action p) : V → A := fun _ => a.value

end BrokenLineCarrier

/-! ### Theta functions via the probe Lie algebra (README §5.5) -/

section Probe

variable {R : Type*} [Ring R]
  {L Λ V G A : Type*} [AddCommGroup L] [AddCommGroup Λ] [DecidableEq L] [NormedAddCommGroup V]
  [NormedSpace ℝ V] {i : Λ →+ V} {hi : TauCeti.Toric.IsIntegralLattice i} {ρ : L →+ Λ} {D : PositiveDegrees L}
  [Group G] {wallGroup : L → (Λ →+ ℤ) → Subgroup G}
  [AddCommGroup A] [Module R A] {𝒜 : L → Submodule R A} [DirectSum.Decomposition 𝒜]
  (action : G →* (A ≃ₗ[R] A)) {K : OrderFiltration G} (p : L)

/-- The action of `Ĝ` on the coefficient module as automorphisms of its multiplicative group. -/
def probeAut : G →* MulAut (Multiplicative A) where
  toFun g := AddEquiv.toMultiplicative (action g).toAddEquiv
  map_one' := by ext x; simp
  map_mul' g g' := by ext x; simp

/-- The probe group `exp(g ⋉ M_p)` (`README §5.5`, the module probe), at the group level:
the semidirect product of the multiplicative group of the order-`k` coefficient module by `Ĝ`.
The Lie-algebra form `LieAlgebra.SemiDirectSum` is the README's. -/
abbrev probeGroup : Type _ := Multiplicative A ⋊[probeAut action] G

variable (ρ) in
/-- The extended degree-to-tangent map (`README §5.5`). -/
def probeProjection : L × ℤ × ℤ →+ Λ × ℤ × ℤ :=
  AddMonoidHom.prodMap ρ (AddMonoidHom.id (ℤ × ℤ))

variable (i) in
/-- The extended tangent lattice `Λ_ext = Λ ⊕ ℤe_y ⊕ ℤe_z → V × ℝ²` (`README §5.5`). -/
noncomputable def probeLattice : Λ × ℤ × ℤ →+ V × ℝ × ℝ :=
  AddMonoidHom.prodMap i (AddMonoidHom.prodMap (Int.castAddHom ℝ) (Int.castAddHom ℝ))

omit [DecidableEq L] in
/-- `README §5.5`: `Λ_ext → V × ℝ²` is an integral lattice. -/
theorem probeLattice_isIntegralLattice (h : TauCeti.Toric.IsIntegralLattice i) :
    TauCeti.Toric.IsIntegralLattice (probeLattice i) := by
  sorry

variable (L) in
/-- The module normal `e_z*`. -/
def zCoord : L × ℤ × ℤ →+ ℤ := (AddMonoidHom.snd ℤ ℤ).comp (AddMonoidHom.snd L (ℤ × ℤ))

variable (D) in
/-- `δ_ext(x, c, l) = δ(x) + (1 − δ(p)) c`. -/
def probeDegree : L × ℤ × ℤ →+ ℤ :=
  D.degree.comp (AddMonoidHom.fst _ _) +
    (1 - D.degree p) • (AddMonoidHom.fst ℤ ℤ).comp (AddMonoidHom.snd _ _)

omit [DecidableEq L] in
theorem probeDegree_apply (n : L) (c : ℕ) :
    probeDegree D p (n + c • p, (c : ℤ), 0) = D.degree n + c := by
  simp [probeDegree, map_nsmul]
  ring

variable (D) in
/-- `README §5.5`: the degree data `(L_ext, P_ext, δ_ext)` with `P_ext = {(n + cp, c, 0)}` and
`δ_ext = δ(n) + c` on `P_ext`. -/
def probeDegrees : PositiveDegrees (L × ℤ × ℤ) where
  monoid :=
    { carrier := {x | ∃ n ∈ D.monoid, ∃ c : ℕ, x = (n + c • p, (c : ℤ), 0)}
      zero_mem' := ⟨0, D.monoid.zero_mem, 0, by ext <;> simp⟩
      add_mem' := by
        rintro _ _ ⟨n, hn, c, rfl⟩ ⟨n', hn', c', rfl⟩
        refine ⟨n + n', D.monoid.add_mem hn hn', c + c', ?_⟩
        ext <;> simp [add_nsmul]
        abel }
  degree := probeDegree D p
  degree_pos := by
    rintro _ ⟨n, hn, c, rfl⟩ hne
    rw [probeDegree_apply]
    have hnn : 0 ≤ D.degree n := by
      by_cases h0 : n = 0
      · simp [h0]
      · exact (D.degree_pos n hn h0).le
    rcases Nat.eq_zero_or_pos c with hc | hc
    · subst hc
      have : n ≠ 0 := fun h0 => hne (by simp [h0])
      simpa using D.degree_pos n hn this
    · omega
  finite_cutoff k := by
    refine (((D.finite_cutoff k).prod (Set.finite_Iic k)).image
      fun x : L × ℕ => (x.1 + x.2 • p, (x.2 : ℤ), (0 : ℤ))).subset ?_
    rintro _ ⟨⟨n, hn, c, rfl⟩, hle⟩
    rw [probeDegree_apply] at hle
    have hnn : 0 ≤ D.degree n := by
      by_cases h0 : n = 0
      · simp [h0]
      · exact (D.degree_pos n hn h0).le
    refine ⟨(n, c), Set.mk_mem_prod ⟨hn, ?_⟩ (Set.mem_Iic.2 (by omega)), rfl⟩
    omega

variable (D wallGroup 𝒜) in
open scoped Classical in
/-- Probe wall groups: old wall groups in charge zero and `A_q` in charge one for `q - p ∈ P`
and normal proportional to `e_z*`; trivial otherwise (`README §5.5`). -/
noncomputable def probeWallGroup (n : L × ℤ × ℤ) (ν : Λ × ℤ × ℤ →+ ℤ) :
    Subgroup (probeGroup action) :=
  if n.2 = (0, 0) ∧ ν (0, 1, 0) = 0 ∧ ν (0, 0, 1) = 0 then
    (wallGroup n.1 (ν.comp (AddMonoidHom.inl Λ (ℤ × ℤ)))).map SemidirectProduct.inr
  else if n.2 = (1, 0) ∧ n.1 - p ∈ D.monoid ∧ ν ≠ 0 ∧
      ν.comp (AddMonoidHom.inl Λ (ℤ × ℤ)) = 0 ∧ ν (0, 1, 0) = 0 then
    (AddSubgroup.toSubgroup (𝒜 n.1).toAddSubgroup).map SemidirectProduct.inl
  else ⊥

variable (hi ρ D wallGroup 𝒜) in
/-- A directed diagram over the probe setup. -/
abbrev ProbeDiagram (K' : OrderFiltration (probeGroup action)) (ι' : Type*) :=
  DirectedDiagram (probeLattice_isIntegralLattice hi) (probeProjection ρ) (probeDegrees D p)
    (probeWallGroup D wallGroup 𝒜 action p) K' ι'

/-- `𝔡'` is the cylinder lift of `𝔡` (`README §5.5`): support `𝔡 × ℝ²`,
normal `(m, 0, 0)`, degree `(n, 0, 0)`, label in charge zero. -/
def IsCylinderLiftWall (𝔡 : DirectedWall hi ρ D wallGroup)
    (𝔡' : DirectedWall (probeLattice_isIntegralLattice hi) (probeProjection ρ) (probeDegrees D p)
      (probeWallGroup D wallGroup 𝒜 action p)) : Prop :=
  𝔡'.support = {x | x.1 ∈ 𝔡.support} ∧ 𝔡'.normal = 𝔡.normal.comp (AddMonoidHom.fst Λ (ℤ × ℤ)) ∧
    𝔡'.ray.generator = (𝔡.ray.generator, 0, 0) ∧ 𝔡'.label.val = SemidirectProduct.inr 𝔡.label.val

variable (hi ρ) in
/-- `𝔡'` is the probe wall for `a ∈ A_p` (`README §5.5`): the full hyperplane `z = 0`, degree
`(p, 1, 0)`, normal `e_z*`, label `exp(a)`. -/
def IsProbeWall (a : A)
    (𝔡' : DirectedWall (probeLattice_isIntegralLattice hi) (probeProjection ρ) (probeDegrees D p)
      (probeWallGroup D wallGroup 𝒜 action p)) : Prop :=
  𝔡'.support = {x | x.2.2 = 0} ∧ 𝔡'.normal = zCoord Λ ∧ 𝔡'.ray.generator = (p, 1, 0) ∧
    𝔡'.label.val = SemidirectProduct.inl (Multiplicative.ofAdd a)

variable (D 𝒜 K) in
/-- The probe filtration: charge zero retains `K`; module charge one at extended order
`k + 1` corresponds to relative order `k` (`README §5.5`). -/
def IsProbeFiltration (K' : OrderFiltration (probeGroup action)) : Prop :=
  (∀ k (g : G), SemidirectProduct.inr g ∈ K'.ker k ↔ g ∈ K.ker k) ∧
    ∀ k (b : A), (∀ q, q - p ∉ D.monoid → homogeneousComponent 𝒜 q b = 0) →
      (SemidirectProduct.inl (Multiplicative.ofAdd b) ∈ K'.ker (k + 1) ↔
        ∀ n ∈ D.cutoff k, homogeneousComponent 𝒜 (p + n) b = 0)

/-- A consistent extension by the probe wall and outgoing charge-one walls, retaining the
cylinder lifts of `𝔇` (`README §5.5`). -/
def IsProbeCompletion {ι : Type*} (𝔇 : DirectedDiagram hi ρ D wallGroup K ι) (a : A)
    {K' : OrderFiltration (probeGroup action)} {κ : Type*}
    (𝔇' : ProbeDiagram hi ρ D wallGroup 𝒜 action p K' (ι ⊕ Unit ⊕ κ)) : Prop :=
  (∀ k, IsCylinderLiftWall action p (𝔇.wall k) (𝔇'.wall (Sum.inl k))) ∧
    IsProbeWall hi ρ action p a (𝔇'.wall (Sum.inr (Sum.inl ()))) ∧
    (∀ c, (𝔇'.wall (Sum.inr (Sum.inr c))).ray.generator.2 = (1, 0) ∧
      (𝔇'.wall (Sum.inr (Sum.inr c))).Outgoing) ∧
    𝔇'.Consistent

/-- `Θ` lies in the shifted module `M_p`: its homogeneous components outside `p + P` vanish. -/
def InShiftedModule (Θ : A) : Prop := ∀ q, q - p ∉ D.monoid → homogeneousComponent 𝒜 q Θ = 0

/-- `Θ ∈ M_p` represents the probe label at relative order `k`: an upward vertical segment
through `(Q, y, 0)` has product `exp(−Θ)` at extended order `k + 1` (`README §5.5`). -/
def IsProbeLabelRep {K' : OrderFiltration (probeGroup action)} {ι' : Type*}
    (𝔇' : ProbeDiagram hi ρ D wallGroup 𝒜 action p K' ι') (k : ℕ) (Q : V) (Θ : A) : Prop :=
  InShiftedModule (D := D) (𝒜 := 𝒜) p Θ ∧ ∃ y ε : ℝ, 0 < ε ∧
    𝔇'.IsAdmissiblePolygon (k + 1) ![(Q, y, -ε), (Q, y, ε)] ∧
    (∀ d, (𝔇'.wall d).label.val ∉ K'.ker (k + 1) →
      (segment ℝ (Q, y, -ε) (Q, y, ε) ∩ (𝔇'.wall d).support).Nonempty →
      ∃ c : ℤ, c ≠ 0 ∧ (𝔇'.wall d).normal = c • zCoord Λ) ∧
    𝔇'.polygonProduct (k + 1) ![(Q, y, -ε), (Q, y, ε)] *
      SemidirectProduct.inl (Multiplicative.ofAdd Θ) ∈ K'.ker (k + 1)

/-- Representatives of the same vertical product agree in relative degrees `≤ k`. -/
theorem probeLabelRep_component_eq {K' : OrderFiltration (probeGroup action)}
    (hK' : IsProbeFiltration D 𝒜 action K p K') (k : ℕ) (g : probeGroup action) {Θ Θ' : A}
    (hm : InShiftedModule (D := D) (𝒜 := 𝒜) p Θ) (hm' : InShiftedModule (D := D) (𝒜 := 𝒜) p Θ')
    (hg : g * SemidirectProduct.inl (Multiplicative.ofAdd Θ) ∈ K'.ker (k + 1))
    (hg' : g * SemidirectProduct.inl (Multiplicative.ofAdd Θ') ∈ K'.ker (k + 1))
    {n : L} (hn : n ∈ D.cutoff k) :
    homogeneousComponent 𝒜 (p + n) Θ = homogeneousComponent 𝒜 (p + n) Θ' := by
  have hsub : ∀ q, homogeneousComponent 𝒜 q (Θ' - Θ) =
      homogeneousComponent 𝒜 q Θ' - homogeneousComponent 𝒜 q Θ := fun q => by
    simp [homogeneousComponent, DirectSum.decompose_sub]
  have hmem : SemidirectProduct.inl (Multiplicative.ofAdd (Θ' - Θ)) ∈ K'.ker (k + 1) := by
    have := (K'.ker (k + 1)).mul_mem ((K'.ker (k + 1)).inv_mem hg) hg'
    rwa [mul_inv_rev, mul_assoc, inv_mul_cancel_left, ← map_inv, ← map_mul, ← ofAdd_neg,
      ← ofAdd_add, neg_add_eq_sub] at this
  have hM : ∀ q, q - p ∉ D.monoid → homogeneousComponent 𝒜 q (Θ' - Θ) = 0 := fun q hq => by
    rw [hsub, hm q hq, hm' q hq, sub_zero]
  have := (hK'.2 k (Θ' - Θ) hM).1 hmem n hn
  rw [hsub, sub_eq_zero] at this
  exact this.symm

/-- A representative of the probe label `F(Q)` at relative order `k` (`README §5.5`).
Its cutoff components at a fixed segment are independent of this choice. -/
noncomputable def probeLabel {K' : OrderFiltration (probeGroup action)} {ι' : Type*}
    (𝔇' : ProbeDiagram hi ρ D wallGroup 𝒜 action p K' ι') (k : ℕ) (Q : V)
    (hQ : ∃ Θ, IsProbeLabelRep action p 𝔇' k Q Θ) : A := hQ.choose

theorem probeLabel_spec {K' : OrderFiltration (probeGroup action)} {ι' : Type*}
    (𝔇' : ProbeDiagram hi ρ D wallGroup 𝒜 action p K' ι') (k : ℕ) (Q : V)
    (hQ : ∃ Θ, IsProbeLabelRep action p 𝔇' k Q Θ) :
    IsProbeLabelRep action p 𝔇' k Q (probeLabel action p 𝔇' k Q hQ) := hQ.choose_spec

/-- The sum of final decorations of order-`k` affine broken lines ending at `Q` (`README §5.2`).
`finsum` returns zero on an infinite fiber; §5.3 proves finiteness at generic endpoints. -/
noncomputable def DirectedDiagram.thetaSum {ι : Type*} (𝔇 : DirectedDiagram hi ρ D wallGroup K ι)
    (k : ℕ) (a : A) (ha : a ∈ 𝒜 p) (_hp : ρ p ≠ 0) (Q : V) : A :=
  ∑ᶠ b : {b : AffineBrokenLine hi ρ D wallGroup 𝒜 (𝔇.activeFamily k) action k a ha // b.endpoint = Q},
    b.1.decoration (Fin.last b.1.numEvents)

/-- Hit times of the backward ray `Q + t i(ρ q)`, with a perturbation selecting the incoming
side at transverse hits (`README §5.5`). -/
structure BackwardRay {w : ℕ} (walls : Fin w → DirectedWall hi ρ D wallGroup) (Q : V) (q : L)
    where
  hits : Finset ℝ
  hits_spec : ∀ t, t ∈ hits ↔ 0 < t ∧ Q + t • i (ρ q) ∈ activeWallSupport walls
  perturb : V
  perturb_sign : ∀ k : Fin w, (walls k).label.val ≠ 1 →
    hi.realCharacter (walls k).normal (i (ρ q)) ≠ 0 →
    0 < hi.realCharacter (walls k).normal (i (ρ q) + perturb) *
      hi.realCharacter (walls k).normal (i (ρ q))

/-- The incoming germ point `x + ε(i(ρ q) + r)` behind the hit `x = Q + t i(ρ q)`. -/
def BackwardRay.germPoint {w : ℕ} {walls : Fin w → DirectedWall hi ρ D wallGroup} {Q : V}
    {q : L} (R : BackwardRay walls Q q) (t ε : ℝ) : V :=
  Q + (t + ε) • i (ρ q) + ε • R.perturb

variable (𝒜) in
open scoped Classical in
/-- Last-transition recursion for `Φ Q n ∈ A_{p+n}`: sum lower-degree components propagated
from incoming germs by the signed wall action. It holds eventually as `ε → 0⁺` on `gen`
(`README §5.5`). -/
def SatisfiesTransitionRecursion {w : ℕ} (walls : Fin w → DirectedWall hi ρ D wallGroup) (k : ℕ)
    (a : A) (gen : V → Prop) (Φ : V → L → A) : Prop :=
  ∀ Q, gen Q → ∀ n ∈ D.cutoff k, ρ (p + n) ≠ 0 → ∀ R : BackwardRay walls Q (p + n),
    (∀ᶠ ε in nhdsWithin (0 : ℝ) (Set.Ioi 0), ∀ t ∈ R.hits, gen (R.germPoint t ε)) →
    ∀ᶠ ε in nhdsWithin (0 : ℝ) (Set.Ioi 0),
    Φ Q n = (if n = 0 then a else 0) + ∑ t ∈ R.hits,
      ∑ n' ∈ (D.finite_cutoff k).toFinset.filter (fun n' => D.degree n' < D.degree n),
        homogeneousComponent 𝒜 (p + n)
          (action (signedWallProduct walls (Q + t • i (ρ (p + n))) (-i (ρ (p + n))))
            (Φ (R.germPoint t ε) n'))

end Probe

/-! ## Layer 6: coefficient descent -/

section CoefficientDescent

variable {B : Type*} [TopologicalSpace B] {ι : Type*} (U : ι → Set B) {R : Type*} [CommRing R]
  {L Λ : Type*} [AddCommGroup L] [AddCommGroup Λ] (ρ : L →+ Λ)
  (A : ι → Type*) [∀ i, AddCommGroup (A i)] [∀ i, Module R (A i)]
  (𝒜 : ∀ i, L → Submodule R (A i))

/-- Coefficient transitions over degree and tangent maps commuting with `ρ`, constant on
connected components of chart overlaps (`README §6.2`). -/
structure CoefficientTransitions where
  degreeMap : ∀ i j, ↥(U i ∩ U j) → L ≃+ L
  tangentMap : ∀ i j, ↥(U i ∩ U j) → Λ ≃+ Λ
  projection_commutes : ∀ i j (x : ↥(U i ∩ U j)),
    ρ.comp (degreeMap i j x).toAddMonoidHom = (tangentMap i j x).toAddMonoidHom.comp ρ
  iso : ∀ i j, ↥(U i ∩ U j) → A i ≃ₗ[R] A j
  graded : ∀ i j (x : ↥(U i ∩ U j)) p, ∀ a ∈ 𝒜 i p, iso i j x a ∈ 𝒜 j (degreeMap i j x p)
  const : ∀ i j (x y : ↥(U i ∩ U j)),
    y.val ∈ connectedComponentIn (U i ∩ U j) x.val →
    iso i j y = iso i j x ∧ degreeMap i j y = degreeMap i j x ∧
      tangentMap i j y = tangentMap i j x

variable {U ρ A 𝒜}

/-- Identity and triple-overlap cocycle laws for coefficient, degree and tangent transitions
(`README §6.2`). -/
def CoefficientLaws (ψ : CoefficientTransitions U ρ A 𝒜) : Prop :=
  (∀ i (x : U i),
    ψ.iso i i ⟨x, x.property, x.property⟩ = LinearEquiv.refl R (A i) ∧
    ψ.degreeMap i i ⟨x, x.property, x.property⟩ = AddEquiv.refl L ∧
    ψ.tangentMap i i ⟨x, x.property, x.property⟩ = AddEquiv.refl Λ) ∧
    ∀ i j k (x : ↥(U i ∩ U j ∩ U k)),
      (ψ.iso i j ⟨x, x.property.1⟩).trans
        (ψ.iso j k ⟨x, x.property.1.2, x.property.2⟩) =
          ψ.iso i k ⟨x, x.property.1.1, x.property.2⟩ ∧
      (ψ.degreeMap i j ⟨x, x.property.1⟩).trans
        (ψ.degreeMap j k ⟨x, x.property.1.2, x.property.2⟩) =
          ψ.degreeMap i k ⟨x, x.property.1.1, x.property.2⟩ ∧
      (ψ.tangentMap i j ⟨x, x.property.1⟩).trans
        (ψ.tangentMap j k ⟨x, x.property.1.2, x.property.2⟩) =
          ψ.tangentMap i k ⟨x, x.property.1.1, x.property.2⟩

end CoefficientDescent

/-! ### Worked example: the finite focus-focus coefficient diagram (README §6.3)

The required example applies coefficient descent and the theta construction to the focus-focus
model. Only the common face ring is localized at `1+w`.
-/

namespace FocusFocus

noncomputable section

/-- Coordinates for `K[t,w,w⁻¹,x,y]`, with the inverse relation imposed in the quotients. -/
inductive Coordinate where
  | t | w | wInv | x | y
  deriving DecidableEq

open Coordinate

variable (K : Type*) [CommRing K]

abbrev Ambient := MvPolynomial Coordinate K

/-- The left maximal-stratum ideal at order `k`: `xy=t`, `t^(k+1)=y^(k+1)=0`. -/
def leftIdeal (k : ℕ) : Ideal (Ambient K) :=
  Ideal.span {MvPolynomial.X w * MvPolynomial.X wInv - 1,
    MvPolynomial.X x * MvPolynomial.X y - MvPolynomial.X t,
    MvPolynomial.X t ^ (k + 1), MvPolynomial.X y ^ (k + 1)}

/-- The right maximal-stratum ideal uses `x^(k+1)=0` instead. -/
def rightIdeal (k : ℕ) : Ideal (Ambient K) :=
  Ideal.span {MvPolynomial.X w * MvPolynomial.X wInv - 1,
    MvPolynomial.X x * MvPolynomial.X y - MvPolynomial.X t,
    MvPolynomial.X t ^ (k + 1), MvPolynomial.X x ^ (k + 1)}

/-- On the common face both transverse powers vanish. -/
def faceIdeal (k : ℕ) : Ideal (Ambient K) :=
  Ideal.span {MvPolynomial.X w * MvPolynomial.X wInv - 1,
    MvPolynomial.X x * MvPolynomial.X y - MvPolynomial.X t,
    MvPolynomial.X t ^ (k + 1), MvPolynomial.X y ^ (k + 1),
    MvPolynomial.X x ^ (k + 1)}

/-- The model relation `XY=t(1+w)` with `t^(k+1)=0`. -/
def modelIdeal (k : ℕ) : Ideal (Ambient K) :=
  Ideal.span {MvPolynomial.X w * MvPolynomial.X wInv - 1,
    MvPolynomial.X t ^ (k + 1),
    MvPolynomial.X x * MvPolynomial.X y - MvPolynomial.X t * (1 + MvPolynomial.X w)}

abbrev LeftRing (k : ℕ) := Ambient K ⧸ leftIdeal K k
abbrev RightRing (k : ℕ) := Ambient K ⧸ rightIdeal K k
abbrev FaceRing (k : ℕ) := Ambient K ⧸ faceIdeal K k
abbrev ModelAlgebra (k : ℕ) := Ambient K ⧸ modelIdeal K k

/-- A coordinate class in any of the displayed quotient rings. -/
def coordinate (I : Ideal (Ambient K)) (c : Coordinate) : Ambient K ⧸ I :=
  Ideal.Quotient.mk I (MvPolynomial.X c)

theorem leftIdeal_le_faceIdeal (k : ℕ) : leftIdeal K k ≤ faceIdeal K k := by
  sorry

theorem rightIdeal_le_faceIdeal (k : ℕ) : rightIdeal K k ≤ faceIdeal K k := by
  sorry

/-- Restriction to the common face. -/
def leftRestriction (k : ℕ) : LeftRing K k →+* FaceRing K k :=
  Ideal.Quotient.factor (leftIdeal_le_faceIdeal K k)

def rightRestriction (k : ℕ) : RightRing K k →+* FaceRing K k :=
  Ideal.Quotient.factor (rightIdeal_le_faceIdeal K k)

/-- The slab function has deformation order zero. -/
def slabFunction (k : ℕ) : FaceRing K k := 1 + coordinate K (faceIdeal K k) w

abbrev OverlapRing (k : ℕ) := Localization.Away (slabFunction K k)

/-- Localization at the slab function. -/
noncomputable def faceLocalization (k : ℕ) : FaceRing K k →+* OverlapRing K k :=
  algebraMap _ _

noncomputable def overlapCoordinate (k : ℕ) (c : Coordinate) : OverlapRing K k :=
  faceLocalization K k (coordinate K (faceIdeal K k) c)

/-- The localized slab unit `f=1+w`. -/
noncomputable def slabUnit (k : ℕ) : (OverlapRing K k)ˣ :=
  (IsLocalization.Away.algebraMap_isUnit (S := OverlapRing K k) (slabFunction K k)).unit

/-- The localized Laurent relation. -/
theorem overlap_w_mul_wInv (k : ℕ) :
    overlapCoordinate K k w * overlapCoordinate K k wInv = 1 := by
  sorry

noncomputable def overlapW (k : ℕ) : (OverlapRing K k)ˣ where
  val := overlapCoordinate K k w
  inv := overlapCoordinate K k wInv
  val_inv := overlap_w_mul_wInv K k
  inv_val := by rw [mul_comm]; exact overlap_w_mul_wInv K k

/-- The shear-chart slab function `f'=1+w⁻¹=w⁻¹ f`. -/
noncomputable def upperSlabUnit (k : ℕ) : (OverlapRing K k)ˣ :=
  (overlapW K k)⁻¹ * slabUnit K k

/-- The lower corrected transition `g_f h_II`: `x₁↦f x₂`, `y₁↦f⁻¹ y₂`. -/
noncomputable def lowerCorrectedEval (k : ℕ) : Ambient K →+* OverlapRing K k :=
  MvPolynomial.eval₂Hom
    ((faceLocalization K k).comp ((Ideal.Quotient.mk (faceIdeal K k)).comp MvPolynomial.C))
    (fun c => match c with
      | x => (slabUnit K k : OverlapRing K k) * overlapCoordinate K k x
      | y => (↑((slabUnit K k)⁻¹) : OverlapRing K k) * overlapCoordinate K k y
      | c => overlapCoordinate K k c)

/-- The upper corrected transition `g_f' h_III`, where
`h_III(x₁)=w x₂`, `h_III(y₁)=w⁻¹ y₂`. -/
noncomputable def upperCorrectedEval (k : ℕ) : Ambient K →+* OverlapRing K k :=
  MvPolynomial.eval₂Hom
    ((faceLocalization K k).comp ((Ideal.Quotient.mk (faceIdeal K k)).comp MvPolynomial.C))
    (fun c => match c with
      | x => (overlapW K k : OverlapRing K k) *
          (upperSlabUnit K k : OverlapRing K k) * overlapCoordinate K k x
      | y => (↑((overlapW K k)⁻¹) : OverlapRing K k) *
          (↑((upperSlabUnit K k)⁻¹) : OverlapRing K k) * overlapCoordinate K k y
      | c => overlapCoordinate K k c)

/-- The corrected gluing maps agree since `f=w f'`. -/
theorem correctedGluing_eq (k : ℕ) : lowerCorrectedEval K k = upperCorrectedEval K k := by
  sorry

theorem leftIdeal_correctedEval_zero (k : ℕ) (a : Ambient K) (ha : a ∈ leftIdeal K k) :
    lowerCorrectedEval K k a = 0 := by
  sorry

/-- The corrected left arrow into the localized common face. -/
noncomputable def leftGluing (k : ℕ) : LeftRing K k →+* OverlapRing K k :=
  Ideal.Quotient.lift (leftIdeal K k) (lowerCorrectedEval K k)
    (leftIdeal_correctedEval_zero K k)

noncomputable def rightGluing (k : ℕ) : RightRing K k →+* OverlapRing K k :=
  (faceLocalization K k).comp (rightRestriction K k)

/-- Regular compatible pairs in the two unlocalized maximal-stratum rings. -/
noncomputable def fiberProduct (k : ℕ) : Subring (LeftRing K k × RightRing K k) :=
  ((leftGluing K k).comp (RingHom.fst _ _)).eqLocus
    ((rightGluing K k).comp (RingHom.snd _ _))

/-- Images of the model generators: `X=(x₁,f x₂)`, `Y=(f y₁,y₂)`, and diagonal `t,w,w⁻¹`. -/
def modelGenerator (k : ℕ) (c : Coordinate) : LeftRing K k × RightRing K k :=
  match c with
  | x => (coordinate K (leftIdeal K k) x,
      (1 + coordinate K (rightIdeal K k) w) * coordinate K (rightIdeal K k) x)
  | y => ((1 + coordinate K (leftIdeal K k) w) * coordinate K (leftIdeal K k) y,
      coordinate K (rightIdeal K k) y)
  | c => (coordinate K (leftIdeal K k) c, coordinate K (rightIdeal K k) c)

noncomputable def modelEval (k : ℕ) : Ambient K →+* (LeftRing K k × RightRing K k) :=
  MvPolynomial.eval₂Hom
    (((Ideal.Quotient.mk (leftIdeal K k)).comp MvPolynomial.C).prod
      ((Ideal.Quotient.mk (rightIdeal K k)).comp MvPolynomial.C))
    (modelGenerator K k)

theorem modelIdeal_eval_zero (k : ℕ) (a : Ambient K) (ha : a ∈ modelIdeal K k) :
    modelEval K k a = 0 := by
  sorry

noncomputable def modelMap (k : ℕ) : ModelAlgebra K k →+* (LeftRing K k × RightRing K k) :=
  Ideal.Quotient.lift (modelIdeal K k) (modelEval K k) (modelIdeal_eval_zero K k)

theorem modelMap_compatible (k : ℕ) (a : ModelAlgebra K k) :
    modelMap K k a ∈ fiberProduct K k := by
  sorry

/-- The explicit model map corestricted to regular compatible pairs. -/
noncomputable def modelToFiber (k : ℕ) : ModelAlgebra K k →+* fiberProduct K k :=
  (modelMap K k).codRestrict (fiberProduct K k) (modelMap_compatible K k)

/-- The fiber-product presentation, using Laurent normal forms (`README §6.3`). -/
theorem modelToFiber_bijective (k : ℕ) : Function.Bijective (modelToFiber K k) := by
  sorry

/-- `R₋ ×_{B[(1+w)⁻¹]} R₊ ≃ K[t,w,w⁻¹,X,Y]/(t^(k+1),XY-t(1+w))`. -/
noncomputable def focusFocusAlgebra (k : ℕ) : ModelAlgebra K k ≃+* fiberProduct K k :=
  RingEquiv.ofBijective (modelToFiber K k) (modelToFiber_bijective K k)

/-- Laurent powers expressed using the two coordinate classes. -/
def laurentPower {A : Type*} [Monoid A] (w wi : A) : ℤ → A
  | .ofNat n => w ^ n
  | .negSucc n => wi ^ (n + 1)

/-- The theta candidate `X^(-n)w^b` for `n<0`, `Y^n w^b` for `n>0`, and `w^b` for `n=0`;
identified with the decorated path sum in `README §6.3`. -/
def focusFocusTheta (k : ℕ) (n b : ℤ) : ModelAlgebra K k :=
  laurentPower (coordinate K (modelIdeal K k) w) (coordinate K (modelIdeal K k) wInv) b *
    if n < 0 then coordinate K (modelIdeal K k) x ^ n.natAbs
    else coordinate K (modelIdeal K k) y ^ n.toNat

/-- The number of canceled opposite transverse factors. -/
def cancellationOrder (n m : ℤ) : ℕ := (n.natAbs + m.natAbs - (n + m).natAbs) / 2

/-- Theta multiplication with binomial structure constants (`README §6.3`). -/
theorem focusFocusTheta_mul (k : ℕ) (n b m c : ℤ) :
    focusFocusTheta K k n b * focusFocusTheta K k m c =
      coordinate K (modelIdeal K k) t ^ cancellationOrder n m *
        ∑ j ∈ Finset.range (cancellationOrder n m + 1),
          (cancellationOrder n m).choose j • focusFocusTheta K k (n + m) (b + c + j) := by
  sorry

/-- The finite-order normal forms `t^r θ_(n,b)`, `0≤r≤k`, form a `K`-basis (`README §6.3`). -/
theorem focusFocusTheta_basis (k : ℕ) :
    ∃ B : Module.Basis (Fin (k + 1) × ℤ × ℤ) K (ModelAlgebra K k), ∀ r n b,
      B (r, n, b) = coordinate K (modelIdeal K k) t ^ r.val * focusFocusTheta K k n b := by
  sorry

end

end FocusFocus

/-! ## Layer 7: positivity -/

/-- The positive subsemiring of the whole monoid algebra `ℚ[ι][Q]` (`README §7.1`):
the image of `ℕ[ι][Q]`, retaining the monomial variables as well as coefficient variables. -/
noncomputable def positiveMonoidAlgebra (ι Q : Type*) [AddCommMonoid Q] :
    Subsemiring (AddMonoidAlgebra (MvPolynomial ι ℚ) Q) :=
  (AddMonoidAlgebra.mapRingHom Q (MvPolynomial.map (Nat.castRingHom ℚ))).rangeS

/-- Positivity in `Â`: a positive representative at every order (`README §7.1`). -/
def positiveCompletion {A : Type*} [Ring A] (F : AlgFiltration A)
    (Pos : Subsemiring A) : Subsemiring F.completion where
  carrier := {x | ∀ k, ∃ y ∈ Pos, F.proj ℤ k x = Ideal.Quotient.mk _ y}
  zero_mem' _ := ⟨0, Pos.zero_mem, by rw [map_zero, map_zero]⟩
  one_mem' _ := ⟨1, Pos.one_mem, by rw [map_one, map_one]⟩
  add_mem' {x y} hx hy k := by
    obtain ⟨⟨a, ha, hxa⟩, ⟨b, hb, hyb⟩⟩ := And.intro (hx k) (hy k)
    exact ⟨a + b, Pos.add_mem ha hb, by rw [map_add, hxa, hyb, map_add]⟩
  mul_mem' {x y} hx hy k := by
    obtain ⟨⟨a, ha, hxa⟩, ⟨b, hb, hyb⟩⟩ := And.intro (hx k) (hy k)
    exact ⟨a * b, Pos.mul_mem ha hb, by rw [map_mul, hxa, hyb, map_mul]⟩

/-- `README §7.1` positivity for the completed coefficient monoid algebra. -/
noncomputable abbrev positiveMonoidCompletion {ι Q : Type*} [AddCommMonoid Q]
    (F : AlgFiltration (AddMonoidAlgebra (MvPolynomial ι ℚ) Q)) :
    Subsemiring F.completion :=
  positiveCompletion F (positiveMonoidAlgebra ι Q)

end TauCetiRoadmap.ScatteringDiagrams
