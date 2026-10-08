import Mathlib
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Ring
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.ZMod
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Component
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Decomposition
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Units
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Pow
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.PadicInt
import TauCeti.Topology.Algebra.Group.Profinite.Completion
import TauCeti.Topology.Algebra.Group.Profinite.Procyclic
import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicPow
import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicInt.Basic
import TauCeti.Topology.Algebra.Group.ContinuousAut.Basic
import TauCeti.Topology.Algebra.Group.ContinuousAut.Characteristic
import TauCeti.Topology.Algebra.Group.ContinuousAut.ClosedQuotient
import TauCeti.Topology.Algebra.Group.ContinuousAut.ClosedSubgroup
import TauCeti.Topology.Algebra.Group.ContinuousAut.Congruence
import TauCeti.Topology.Algebra.Group.ContinuousAut.ConjClasses
import TauCeti.Topology.Algebra.Group.ContinuousAut.OuterAction
import TauCeti.Topology.Algebra.Group.ContinuousAut.Profinite
import TauCeti.Topology.Algebra.Group.ContinuousAut.ProP
import TauCeti.Topology.Algebra.Group.ContinuousAut.Quotient
import TauCeti.Topology.Algebra.Group.ContinuousAut.ZHat
import TauCeti.Topology.Algebra.Group.Conjugacy
import TauCeti.Topology.Algebra.Group.Profinite.MaximalProP
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Frattini.Basic
import TauCeti.GroupTheory.Frattini
import TauCeti.Topology.Algebra.Group.Profinite.Free.Automorphism
import TauCeti.Topology.Algebra.Group.Profinite.Free.GeneralLinear
import TauCeti.Topology.Algebra.Group.Profinite.Free.LowerCentralSeries
import TauCeti.Topology.Algebra.Group.Profinite.Free.PadicInt
import TauCeti.Topology.Algebra.Group.Profinite.Free.Peripheral.RankOne
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Closed
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Abelianization
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Closed
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.ClosedSpan
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Comparison
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Continuous
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.FiniteGeneration
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.LieRing
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.PadicModule
import TauCeti.Topology.Algebra.Group.Profinite.ProP.LowerCentralSeries
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Heisenberg
import TauCeti.Topology.Algebra.Group.Heisenberg
import TauCeti.Topology.Algebra.Group.Subgroup


/-!
# Profinite integers, profinite powers, and continuous automorphisms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

Every milestone of `README.md`, Layers 0 to 3 with their named companions and the worked examples,
apart from the three listed under *Not yet certified* at the end of this note, has a statement here
in the form the roadmap asks for, closed by the Tau Ceti declaration that realizes it, so the
correspondence is checked by the Lean kernel rather than asserted in prose. No statement is left
unproved. That is evidence for completion, not its criterion: completion is judged by a
milestone-by-milestone audit against `README.md`, which a fully discharged file of suggested forms
cannot replace.

The earlier version of this file built its own copies of the objects (a `CommRing` instance on `ẑ`,
`toZMod`, `component`, `idem`, `zpowHat`, `closedZpowers`, `ContinuousAut` with its group structure
and congruence topology, `ContinuousOut`, `IsTopCharacteristic`, `mapQuotient`, `mapClosedQuotient`,
`outerAction`, `frattiniKernel`, aliases `closedLowerCentralSeries`, `lcsGradedPiece`,
`lcsGradedMk`, `lcsBracket`, and a topology on `TauCeti.HeisenbergGroup`) and stated the milestones
about them. All of these except `frattiniKernel` now live in Tau Ceti under the same names, in the
`TauCeti` namespace, so the statements below are made about the Tau Ceti objects directly. Apart
from the compatibility names described below, only three local names remain: the notation `ẑ` for
`Additive TauCeti.zHat.{0}` (the old file's convention, kept: Tau Ceti's `zHat` is
universe-polymorphic, and the notation pins universe `0`, which needs `quotPrecheck` off), the
README's alias `padicPow ℓ hG x u` for `TauCeti.IsProP.padicPow`, and the README's `HeisenbergZp p`
for `TauCeti.HeisenbergGroup ℤ_[p]`. The old targets map as follows: `frattiniKernel P` is
`(MulAut.mapQuotient (frattini P)).ker`; `nonempty_ringEquiv_pi` is the named
`TauCeti.zHat.ringEquivPiPadicInt`; `isUnit_iff` is `isUnit_iff_toZMod`;
`isProP_ker_toFrattiniQuotient` is split into its pro-`p` and open halves; `lcsBracket_natural` is
`gradedMap_lcsBracket`; `padicPow_mem_closedLowerCentralSeries` is the general `padicPow_mem` for
closed subgroups; `lcsBracket_padicPow_left` and `_right` give the membership proofs explicitly
instead of existentially; `lcsGradedPiece_eq_sum_bracket` is also stated in the reindexed form
`exists_sum_lcsBracket_eq`; the aliases `ProfiniteCompletion.continuousMonoidHomEquiv` and
`zHat.lift` are dropped, because Tau Ceti generalized those declarations in place. Every other old
target is restated. The names that PeripheralActions' README lists in its dependency contract and
that are theorems (`padicPow_one`, `padicPow_units_injective`, `zpowHat_idem_of_isProP`,
`commutator_mem_closedLowerCentralSeries`, `lcsBracket_add_left`, `lcsBracket_add_right`,
`lcsGradedPiece_eq_sum_bracket`) keep their old signatures in the last section of this file; the
objects it lists (`ContinuousAut`, `closedLowerCentralSeries`, `lcsGradedPiece`, …) are Tau Ceti's,
under the same names.

The deliberate differences between the README's requested forms and Tau Ceti's are these.

* `zHat.lift_eq_tauCeti` is vacuous after an in-place generalization: there is one declaration
  `TauCeti.zHat.lift`, with targets in any universe. It is stated as the uniqueness of the lift.
* `ringLift` is stated for a `Ring`, as in the README; Tau Ceti allows any `NonAssocSemiring`,
  with the compatibility written as `(castHom h).comp (f n) = f m`. `unitsLift` takes a `Monoid`
  in Tau Ceti (a `Group` here), with compatibility through `ZMod.unitsMap`, which is
  `Units.map (castHom h)` by definition.
* The ring API, the congruence topology and everything else are universe-polymorphic in Tau Ceti;
  this file instantiates `zHat` at universe `0` through `ẑ`.
* `ContinuousAut.mapQuotient` and `mapClosedQuotient` take `N` implicitly and need no closedness
  hypothesis; the outer action `TauCeti.outerAction N` is defined for every normal subgroup `N`,
  and its continuity (`continuous_conjNormal`, `continuous_outerAction`) assumes only that `N` is
  compact, which covers the README's topologically finitely generated profinite `N`.
* `TauCeti.isClosed_isConj_pair` assumes compact and Hausdorff; Hausdorffness follows from total
  disconnectedness in a topological group, so the README's form is a specialization.
* The pro-`p` half of the pro-`p` automorphism theorem needs no finite generation; openness does.
  The free case holds for every finite generating set, here `Fin n`.
* The graded Lie ring, its Lie homomorphisms (over `ZMod 0 = ℤ`) and the `LieAlgebra ℤ_[p]`
  structure are built in Tau Ceti for the lower `q`-series at every `q`; the closed series is
  `q = 0`. The `ℤ_p`-module structure on each `gr_n` is the definition
  `IsProP.gradedPieceModule`, not a global instance, and the profiniteness of `gr_n` is not an
  instance either; both are invoked locally below.
* The free-group bases hold for any finite, linearly ordered generating set `X`; here `Fin r`.
* Four statements are short compositions of Tau Ceti theorems rather than single declarations:
  the integer realizing finitely many projections (`exists_intCast_toZMod_eq`), the non-integer
  element `(1, 0, 1, 0, …)` (`alternating_ne_intCast`, by the integrality of idempotent integer
  casts), the identification of `TopologicalAbelianization F` with `ℤ_p ^ r`, and, among the
  worked examples, `ω_2 ≡ 3 (mod 6)`, `ofAdd 1 ^ᶻ a = ofAdd (component 3 a)` and the rank-one
  form of `gr_1` of the free pro-`p` group on two generators.
* The worked example `ContinuousAut (Multiplicative ℤ_[p]) ≃* ℤ_[p]ˣ` is Tau Ceti's
  `TauCeti.Peripheral.continuousAutEquivUnits` for a free pro-`p` group of rank one, transported
  along `TauCeti.freeProP.equivPadicInt`. Tau Ceti `main` has since added a direct
  `TauCeti.PadicInt.continuousAutEquivUnits`, which is not in the pinned revision.

The README marks nothing as optional or long-horizon; it has no out-of-scope milestones.

**Not yet certified.** Three README statements have no Tau Ceti declaration at the pinned
revision, and are not stated here.

* Layer 3.4, the detecting group: the triples of `HeisenbergZp p` with all coordinates in
  `p ^ n ℤ_p` form an open normal subgroup of index `p ^ (3 n)`, and these form a basis of
  neighbourhoods of `1`. Tau Ceti has only the pro-`p` property `HeisenbergGroup.isProP_padicInt`,
  proved by an extension argument. The levels are added in
  https://github.com/TauCetiProject/TauCeti/pull/13171 (`HeisenbergGroup.level`,
  `mem_level_iff`, `index_level`, `hasBasis_nhds_one_level`), to be certified here after the next
  pin bump.
* Layer 3.4, degree one: `gr_1(F)` as the exterior square of `gr_0(F)`, free of rank
  `r (r - 1) / 2` with `x̄_i ∧ x̄_j ↦ [x̄_i, x̄_j]`. Tau Ceti proves the basis statement
  `lcsGradedPiece_one_freeProP_bijective` and mentions the exterior square only in prose.
* Layer 2.4, the pro-`p` theorem: the identification of the kernel on the Frattini quotient with
  the inverse limit of the finite kernels over the characteristic open normal subgroups contained
  in `proPFrattini p G`. Tau Ceti describes `ContinuousAut G` by compatible families over all
  characteristic open quotients (`ContinuousAut.range_pi_mapQuotient`), but not this restricted
  family of kernels; the bridge needs the cofinality of those subgroups below the open subgroup
  `proPFrattini p G`, which is more than a specialization.
-/

set_option autoImplicit false

namespace TauCetiRoadmap.ProfiniteArithmetic

open TauCeti
open scoped commutatorElement TauCeti.zHat DirectSum

universe u v

/-! ## Layer 0: the ring structure on the profinite integers -/

set_option quotPrecheck false in
/-- The additive presentation of Tau Ceti's profinite integers `TauCeti.zHat`, the carrier of the
ring of Layer 0. This is notation, not a new type. Tau Ceti's `zHat` is universe-polymorphic;
this file works with `zHat.{0}`, which needs the notation's precheck switched off. -/
scoped notation "ẑ" => Additive TauCeti.zHat.{0}

namespace zHat

/-! ### 0.1 The ring structure -/

/-- **Layer 0.1.** `ẑ` is a commutative ring, with Tau Ceti's instance on `Additive zHat`. -/
noncomputable example : CommRing ẑ := inferInstance

/-- **Layer 0.1, the product.** `a * b` is `TauCeti.zHat.lift a b`, read additively. -/
theorem toMul_mul (a b : ẑ) :
    Additive.toMul (a * b) = TauCeti.zHat.lift (Additive.toMul a) (Additive.toMul b) :=
  TauCeti.zHat.toMul_mul a b

/-- **Layer 0.1.** The unit is the generator `TauCeti.zHat.gen`. -/
theorem toMul_one : Additive.toMul (1 : ẑ) = TauCeti.zHat.gen :=
  TauCeti.zHat.toMul_one

/-- **Layer 0.1.** The casts of natural numbers and integers are powers of the generator. -/
theorem toMul_natCast (n : ℕ) : Additive.toMul (n : ẑ) = TauCeti.zHat.gen ^ n :=
  TauCeti.zHat.toMul_natCast n

theorem toMul_intCast (n : ℤ) : Additive.toMul (n : ẑ) = TauCeti.zHat.gen ^ n :=
  TauCeti.zHat.toMul_intCast n

/-- **Layer 0.1, topology.** `ẑ` is a compact, Hausdorff, totally disconnected topological
ring. -/
example : IsTopologicalRing ẑ := inferInstance

example : CompactSpace ẑ := inferInstance

example : T2Space ẑ := inferInstance

example : TotallyDisconnectedSpace ẑ := inferInstance

/-! ### 0.2 Projections and the limit property -/

/-- **Layer 0.2.** The projection `ẑ →+* ZMod n` is the lift of `ofAdd 1` into
`Multiplicative (ZMod n)`, read additively. -/
theorem toZMod_apply (n : ℕ+) (a : ẑ) :
    TauCeti.zHat.toZMod n a = Multiplicative.toAdd
      (TauCeti.zHat.lift (Multiplicative.ofAdd (1 : ZMod n)) (Additive.toMul a)) :=
  TauCeti.zHat.toZMod_apply n a

/-- **Layer 0.2.** The projections are continuous. -/
theorem continuous_toZMod (n : ℕ+) : Continuous (TauCeti.zHat.toZMod.{0} n) :=
  TauCeti.zHat.continuous_toZMod n

/-- **Layer 0.2, functoriality.** The projections are compatible along divisibility. -/
theorem castHom_toZMod {m n : ℕ+} (h : (n : ℕ) ∣ (m : ℕ)) (a : ẑ) :
    ZMod.castHom h (ZMod n) (TauCeti.zHat.toZMod m a) = TauCeti.zHat.toZMod n a :=
  TauCeti.zHat.cast_toZMod h a

/-- **Layer 0.2.** Two elements with the same projections are equal. -/
theorem ext_iff_toZMod {a b : ẑ} :
    a = b ↔ ∀ n : ℕ+, TauCeti.zHat.toZMod n a = TauCeti.zHat.toZMod n b :=
  TauCeti.zHat.ext_iff_toZMod

/-- **Layer 0.2.** Every compatible family of residues comes from a unique element. -/
theorem existsUnique_forall_toZMod_eq (x : ∀ n : ℕ+, ZMod n)
    (hx : ∀ (m n : ℕ+) (h : (m : ℕ) ∣ n), ZMod.castHom h (ZMod m) (x n) = x m) :
    ∃! a : ẑ, ∀ n : ℕ+, TauCeti.zHat.toZMod n a = x n :=
  TauCeti.zHat.existsUnique_forall_toZMod_eq x hx

section RingLift

variable {R : Type u} [Ring R] (f : ∀ n : ℕ+, R →+* ZMod n)
  (hf : ∀ (m n : ℕ+) (h : (m : ℕ) ∣ n), (ZMod.castHom h (ZMod m)).comp (f n) = f m)

/-- **Layer 0.2, the limit property.** A compatible family `f n : R →+* ZMod n` assembles into a
unique ring homomorphism `ringLift f : R →+* ẑ` with `toZMod n ∘ ringLift f = f n`. -/
theorem toZMod_comp_ringLift (n : ℕ+) :
    (TauCeti.zHat.toZMod n).comp (TauCeti.zHat.ringLift.{0} f hf) = f n :=
  TauCeti.zHat.toZMod_comp_ringLift f hf n

theorem ringLift_unique (g : R →+* ẑ) (hg : ∀ n, (TauCeti.zHat.toZMod n).comp g = f n) :
    g = TauCeti.zHat.ringLift f hf :=
  TauCeti.zHat.ringLift_unique f hf g hg

/-- **Layer 0.2.** The lift is continuous when every `f n` is. -/
theorem continuous_ringLift [TopologicalSpace R] (hcont : ∀ n : ℕ+, Continuous (f n)) :
    Continuous (TauCeti.zHat.ringLift.{0} f hf) :=
  TauCeti.zHat.continuous_ringLift f hf hcont

/-- **Layer 0.2, naturality in `R`.** -/
theorem ringLift_comp {S : Type v} [Ring S] (g : S →+* R) :
    (TauCeti.zHat.ringLift.{0} f hf).comp g =
      TauCeti.zHat.ringLift (fun n ↦ (f n).comp g) fun m n h ↦ by
        rw [← RingHom.comp_assoc, hf m n h] :=
  TauCeti.zHat.ringLift_comp f hf g

end RingLift

/-- **Layer 0.2, density.** The integers embed in `ẑ` and are dense. -/
theorem intCast_injective : Function.Injective (Int.cast : ℤ → ẑ) :=
  Int.cast_injective

theorem denseRange_intCast : DenseRange (Int.cast : ℤ → ẑ) :=
  TauCeti.zHat.denseRange_intCast

/-- **Layer 0.2.** For every finite set of levels a single integer realizes the projections of
`a`: reduce modulo the product of the levels. -/
theorem exists_intCast_toZMod_eq (S : Finset ℕ+) (a : ẑ) :
    ∃ k : ℤ, ∀ n ∈ S, TauCeti.zHat.toZMod n a = (k : ZMod n) := by
  let N : ℕ+ := ⟨∏ n ∈ S, (n : ℕ), Finset.prod_pos fun n _ ↦ n.pos⟩
  refine ⟨((TauCeti.zHat.toZMod N a).val : ℤ), fun n hn ↦ ?_⟩
  have h : (n : ℕ) ∣ (N : ℕ) := Finset.dvd_prod_of_mem (fun n : ℕ+ ↦ (n : ℕ)) hn
  rw [← castHom_toZMod h, ZMod.castHom_apply, ZMod.cast_eq_val, Int.cast_natCast]

/-! ### 0.3 `ℓ`-adic components, the product decomposition, and idempotents -/

/-- **Layer 0.3.** The `ℓ`-adic component is characterized by its reductions modulo `ℓ ^ k`. -/
theorem toZModPow_component (ℓ : ℕ) [Fact ℓ.Prime] (k : ℕ) (a : ẑ) :
    PadicInt.toZModPow k (TauCeti.zHat.component ℓ a)
      = TauCeti.zHat.toZMod ⟨ℓ ^ k, pow_pos (Fact.out : ℓ.Prime).pos k⟩ a :=
  TauCeti.zHat.toZModPow_component ℓ k a

theorem component_unique (ℓ : ℕ) [Fact ℓ.Prime] (g : ẑ →+* ℤ_[ℓ])
    (hg : ∀ k : ℕ, (PadicInt.toZModPow k).comp g
      = TauCeti.zHat.toZMod ⟨ℓ ^ k, pow_pos (Fact.out : ℓ.Prime).pos k⟩) :
    g = TauCeti.zHat.component ℓ :=
  TauCeti.zHat.component_unique ℓ g hg

theorem continuous_component (ℓ : ℕ) [Fact ℓ.Prime] :
    Continuous (TauCeti.zHat.component.{0} ℓ) :=
  TauCeti.zHat.continuous_component ℓ

/-- **Layer 0.3, agreement with Tau Ceti's pro-`ℓ` quotient.** -/
theorem maximalProPQuotientEquivPadicInt_mk_eq_component (ℓ : ℕ) [Fact ℓ.Prime] (a : ẑ) :
    TauCeti.zHat.maximalProPQuotientEquivPadicInt ℓ
        (TauCeti.maximalProPQuotient.mk ℓ TauCeti.zHat.{0} (Additive.toMul a))
      = Multiplicative.ofAdd (TauCeti.zHat.component ℓ a) :=
  TauCeti.zHat.maximalProPQuotientEquivPadicInt_mk_eq_component ℓ a

/-- **Layer 0.3, the product decomposition.** `ẑ ≃ ∏_ℓ ℤ_ℓ` as topological rings, with
components `component ℓ`. -/
theorem ringEquivPiPadicInt_apply (a : ẑ) (ℓ : Nat.Primes) :
    TauCeti.zHat.ringEquivPiPadicInt a ℓ = TauCeti.zHat.component ℓ a :=
  TauCeti.zHat.ringEquivPiPadicInt_apply a ℓ

theorem continuous_ringEquivPiPadicInt :
    Continuous (TauCeti.zHat.ringEquivPiPadicInt.{0}) :=
  TauCeti.zHat.continuous_ringEquivPiPadicInt

theorem continuous_ringEquivPiPadicInt_symm :
    Continuous (TauCeti.zHat.ringEquivPiPadicInt.{0}.symm) :=
  TauCeti.zHat.continuous_ringEquivPiPadicInt_symm

/-- **Layer 0.3, idempotents.** `ω_ℓ` has `ℓ`-adic component `1` and every other component
`0`. -/
theorem component_idem (ℓ ℓ' : ℕ) [Fact ℓ.Prime] [Fact ℓ'.Prime] :
    TauCeti.zHat.component ℓ' (TauCeti.zHat.idem.{0} ℓ) = if ℓ' = ℓ then 1 else 0 :=
  TauCeti.zHat.component_idem ℓ ℓ'

theorem idem_mul_idem (ℓ : ℕ) [Fact ℓ.Prime] :
    TauCeti.zHat.idem.{0} ℓ * TauCeti.zHat.idem ℓ = TauCeti.zHat.idem ℓ :=
  TauCeti.zHat.idem_mul_idem ℓ

theorem idem_mul_idem_of_ne {ℓ ℓ' : ℕ} [Fact ℓ.Prime] [Fact ℓ'.Prime] (h : ℓ ≠ ℓ') :
    TauCeti.zHat.idem.{0} ℓ * TauCeti.zHat.idem ℓ' = 0 :=
  TauCeti.zHat.idem_mul_idem_of_ne ℓ h

theorem component_idem_mul (ℓ : ℕ) [Fact ℓ.Prime] (a : ẑ) :
    TauCeti.zHat.component ℓ (TauCeti.zHat.idem ℓ * a) = TauCeti.zHat.component ℓ a :=
  TauCeti.zHat.component_idem_mul ℓ a

theorem idem_mul_eq_self_iff (ℓ : ℕ) [Fact ℓ.Prime] (a : ẑ) :
    TauCeti.zHat.idem ℓ * a = a ↔
      ∀ (ℓ' : ℕ) [Fact ℓ'.Prime], ℓ' ≠ ℓ → TauCeti.zHat.component ℓ' a = 0 :=
  TauCeti.zHat.idem_mul_eq_self_iff ℓ a

/-- **Layer 0.3, reduction of an idempotent.** -/
theorem toZMod_idem_pow (ℓ : ℕ) [Fact ℓ.Prime] (k : ℕ) :
    TauCeti.zHat.toZMod ⟨ℓ ^ k, pow_pos (Fact.out : ℓ.Prime).pos k⟩ (TauCeti.zHat.idem.{0} ℓ)
      = 1 :=
  TauCeti.zHat.toZMod_idem_of_dvd_pow ℓ dvd_rfl

theorem toZMod_idem_of_not_dvd (ℓ : ℕ) [Fact ℓ.Prime] {n : ℕ+} (h : ¬ ℓ ∣ n) :
    TauCeti.zHat.toZMod n (TauCeti.zHat.idem.{0} ℓ) = 0 :=
  TauCeti.zHat.toZMod_idem_of_not_dvd ℓ h

/-- **Layer 0.3.** `ω_ℓ` is not an integer. -/
theorem idem_ne_intCast (ℓ : ℕ) [Fact ℓ.Prime] (n : ℤ) : TauCeti.zHat.idem.{0} ℓ ≠ n :=
  TauCeti.zHat.idem_ne_intCast ℓ n

/-- **Layer 0.1, edge case.** `ẑ` is not a domain, because `ω_2 · (1 - ω_2) = 0`. -/
theorem idem_two_mul_one_sub : TauCeti.zHat.idem.{0} 2 * (1 - TauCeti.zHat.idem 2) = 0 := by
  rw [mul_sub, mul_one, idem_mul_idem, sub_self]

theorem not_isDomain : ¬ IsDomain ẑ :=
  TauCeti.zHat.not_isDomain

/-- **Layer 0.1, example.** The element with components `(1, 0, 1, 0, …)` along the primes
`2, 3, 5, 7, …`, which is not an integer. -/
noncomputable def alternating : ẑ :=
  TauCeti.zHat.ringEquivPiPadicInt.symm fun ℓ ↦ if Even (Nat.count Nat.Prime ℓ) then 1 else 0

theorem component_alternating (ℓ : Nat.Primes) :
    TauCeti.zHat.component ℓ alternating = if Even (Nat.count Nat.Prime ℓ) then 1 else 0 := by
  rw [← ringEquivPiPadicInt_apply, alternating, RingEquiv.apply_symm_apply]

theorem alternating_ne_intCast (n : ℤ) : alternating ≠ n := by
  have hidem : IsIdempotentElem alternating := by
    refine TauCeti.zHat.ringEquivPiPadicInt.injective ?_
    funext ℓ
    rw [map_mul, Pi.mul_apply, ringEquivPiPadicInt_apply, component_alternating]
    split_ifs <;> simp
  intro h
  rcases isIdempotentElem_intCast_iff.mp (h ▸ hidem) with rfl | rfl
  · have h2 := component_alternating ⟨2, Nat.prime_two⟩
    have c2 : Nat.count Nat.Prime 2 = 0 := by decide
    rw [h, Int.cast_zero, map_zero] at h2
    simp [c2] at h2
  · have h3 := component_alternating ⟨3, Nat.prime_three⟩
    have c3 : Nat.count Nat.Prime 3 = 1 := by decide
    rw [h, Int.cast_one, map_one] at h3
    simp [c3] at h3

/-! ### 0.4 Units and characters -/

/-- **Layer 0.4, the unit criterion.** -/
theorem isUnit_iff_toZMod (a : ẑ) :
    IsUnit a ↔ ∀ n : ℕ+, IsUnit (TauCeti.zHat.toZMod n a) :=
  TauCeti.zHat.isUnit_iff_toZMod a

theorem isUnit_iff_component (a : ẑ) :
    IsUnit a ↔ ∀ (ℓ : ℕ) [Fact ℓ.Prime], IsUnit (TauCeti.zHat.component ℓ a) :=
  TauCeti.zHat.isUnit_iff_component a

/-- **Layer 0.4.** `ẑˣ ≃ₜ* ∏_ℓ ℤ_[ℓ]ˣ`, with components `Units.map (component ℓ)`. -/
theorem unitsEquivPiPadicInt_apply (a : ẑˣ) (ℓ : Nat.Primes) :
    TauCeti.zHat.unitsEquivPiPadicInt a ℓ = Units.map (TauCeti.zHat.component ℓ : ẑ →* ℤ_[ℓ]) a :=
  TauCeti.zHat.unitsEquivPiPadicInt_apply a ℓ

section UnitsLift

variable {G : Type u} [Group G] (χ : ∀ n : ℕ+, G →* (ZMod n)ˣ)
  (hχ : ∀ (m n : ℕ+) (h : (n : ℕ) ∣ m) (g : G),
    Units.map (ZMod.castHom h (ZMod n) : ZMod m →* ZMod n) (χ m g) = χ n g)

/-- **Layer 0.4, assembly of characters.** A compatible family `χ n : G →* (ZMod n)ˣ` assembles
into a unique `G →* ẑˣ`, continuous when every `χ n` is. -/
theorem map_toZMod_unitsLift (n : ℕ+) (g : G) :
    Units.map (TauCeti.zHat.toZMod n : ẑ →* ZMod n) (TauCeti.zHat.unitsLift.{0} χ hχ g) = χ n g :=
  TauCeti.zHat.map_toZMod_unitsLift χ hχ n g

theorem unitsLift_unique (ψ : G →* ẑˣ)
    (hψ : ∀ (n : ℕ+) (g : G), Units.map (TauCeti.zHat.toZMod n : ẑ →* ZMod n) (ψ g) = χ n g) :
    ψ = TauCeti.zHat.unitsLift χ hχ :=
  TauCeti.zHat.unitsLift_unique χ hχ ψ hψ

theorem continuous_unitsLift [TopologicalSpace G] (hcont : ∀ n : ℕ+, Continuous (χ n)) :
    Continuous (TauCeti.zHat.unitsLift.{0} χ hχ) :=
  TauCeti.zHat.continuous_unitsLift χ hχ hcont

end UnitsLift

end zHat

/-! ## Layer 1: profinite powers and `ℤ_ℓ`-powers -/

/-! ### 1.1 The power `x ^ᶻ a` -/

/-- **Layer 1.1, the universal property in every universe.** Tau Ceti's
`ProfiniteCompletion.continuousMonoidHomEquiv` now takes the profinite target `P` in any universe,
independent of the universe of `G`. -/
theorem continuousMonoidHomEquiv_apply (G : Type u) [Group G] (P : Type v) [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P]
    (f : ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of G) →ₜ* P) (g : G) :
    TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv G P f g
      = f (ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of G) g) :=
  TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv_apply G P f g

theorem continuousMonoidHomEquiv_symm_apply_etaFn (G : Type u) [Group G] (P : Type v) [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P]
    (f : G →* P) (g : G) :
    (TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv G P).symm f
      (ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of G) g) = f g :=
  TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv_symm_apply_etaFn G P f g

namespace zHat

variable {P : Type v} [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
  [TotallyDisconnectedSpace P]

/-- **Layer 1.1.** `TauCeti.zHat.lift`, generalized in place to profinite targets in every universe:
the lift of `a` sends the generator to `a`, and the image of `n ∈ ℤ` to `a ^ n`. -/
theorem lift_gen (a : P) : TauCeti.zHat.lift.{0} a TauCeti.zHat.gen = a :=
  TauCeti.zHat.lift_gen a

theorem lift_ofInt (a : P) (z : Multiplicative ℤ) :
    TauCeti.zHat.lift.{0} a (TauCeti.zHat.ofInt z) = a ^ z.toAdd :=
  TauCeti.zHat.lift_ofInt a z

/-- **Layer 1.1, `zHat.lift_eq_tauCeti`.** There is one lift: every continuous homomorphism out of
`TauCeti.zHat` into a profinite group of any universe that sends the generator to `a` is
`TauCeti.zHat.lift a`. -/
theorem lift_eq_tauCeti (a : P) (φ : TauCeti.zHat.{0} →ₜ* P) (hφ : φ TauCeti.zHat.gen = a) :
    φ = TauCeti.zHat.lift a :=
  TauCeti.zHat.lift_unique a φ hφ

theorem existsUnique_lift (a : P) :
    ∃! φ : TauCeti.zHat.{0} →ₜ* P, φ TauCeti.zHat.gen = a :=
  TauCeti.zHat.existsUnique_lift a

end zHat

section Powers

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]

/-- **Layer 1.1, definition.** `x ^ᶻ a` is `TauCeti.zHat.lift x` applied to `a` read
multiplicatively. -/
theorem zpowHat_def (x : G) (a : ẑ) : x ^ᶻ a = TauCeti.zHat.lift x (Additive.toMul a) :=
  TauCeti.zpowHat_def x a

/-- **Layer 1.1, examples.** -/
theorem zpowHat_intCast (x : G) (n : ℤ) : x ^ᶻ (n : ẑ) = x ^ n :=
  TauCeti.zpowHat_intCast x n

theorem zpowHat_zero (x : G) : x ^ᶻ (0 : ẑ) = 1 :=
  TauCeti.zpowHat_zero x

theorem zpowHat_one (x : G) : x ^ᶻ (1 : ẑ) = x :=
  TauCeti.zpowHat_one x

theorem one_zpowHat (a : ẑ) : (1 : G) ^ᶻ a = 1 :=
  TauCeti.one_zpowHat a

/-- **Layer 1.1.** In `TauCeti.zHat` itself, `(toMul b) ^ᶻ a = toMul (b * a)`. -/
theorem toMul_zpowHat (b a : ẑ) : (Additive.toMul b) ^ᶻ a = Additive.toMul (b * a) :=
  TauCeti.toMul_zpowHat b a

/-- **Layer 1.1, finite order.** If `x ^ m = 1` then `x ^ᶻ a = x ^ (toZMod m a).val`. -/
theorem zpowHat_eq_pow_val_toZMod {x : G} {m : ℕ+} (hx : x ^ (m : ℕ) = 1) (a : ẑ) :
    x ^ᶻ a = x ^ (TauCeti.zHat.toZMod m a).val :=
  TauCeti.zpowHat_eq_pow_val_toZMod hx a

/-- **Layer 1.1, edge case.** On a finite group `^ᶻ` factors through `toZMod (Nat.card G)`. -/
theorem zpowHat_eq_pow_val_toZMod_natCard [Finite G] (x : G) (a : ẑ) :
    x ^ᶻ a = x ^ (TauCeti.zHat.toZMod ⟨Nat.card G, Nat.card_pos⟩ a).val :=
  TauCeti.zpowHat_eq_pow_val_toZMod_natCard x a

/-- **Layer 1.1, naturality** under every continuous homomorphism. -/
theorem map_zpowHat {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H] (f : G →ₜ* H) (x : G) (a : ẑ) :
    f (x ^ᶻ a) = f x ^ᶻ a :=
  TauCeti.map_zpowHat f x a

theorem zpowHat_conj (g x : G) (a : ẑ) : (g * x * g⁻¹) ^ᶻ a = g * (x ^ᶻ a) * g⁻¹ :=
  TauCeti.conj_zpowHat g x a

theorem zpowHat_conj_inv (c x : G) (a : ẑ) : (c⁻¹ * x * c) ^ᶻ a = c⁻¹ * (x ^ᶻ a) * c :=
  TauCeti.conj_inv_zpowHat c x a

theorem inv_zpowHat (x : G) (a : ẑ) : x⁻¹ ^ᶻ a = (x ^ᶻ a)⁻¹ :=
  TauCeti.inv_zpowHat x a

/-- **Layer 1.1, the additive and multiplicative laws.** -/
theorem zpowHat_add (x : G) (a b : ẑ) : x ^ᶻ (a + b) = x ^ᶻ a * x ^ᶻ b :=
  TauCeti.zpowHat_add x a b

theorem zpowHat_neg (x : G) (a : ẑ) : x ^ᶻ (-a) = (x ^ᶻ a)⁻¹ :=
  TauCeti.zpowHat_neg x a

theorem zpowHat_zpowHat (x : G) (a b : ẑ) : (x ^ᶻ a) ^ᶻ b = x ^ᶻ (a * b) :=
  (TauCeti.zpowHat_mul x a b).symm

theorem zpowHat_comm (x : G) (a b : ẑ) : x ^ᶻ a * x ^ᶻ b = x ^ᶻ b * x ^ᶻ a :=
  TauCeti.zpowHat_comm x a b

theorem mul_zpowHat {x y : G} (h : Commute x y) (a : ẑ) : (x * y) ^ᶻ a = x ^ᶻ a * y ^ᶻ a :=
  TauCeti.mul_zpowHat h a

/-- **Layer 1.1, continuity**, in the exponent and jointly. -/
theorem continuous_zpowHat (x : G) : Continuous fun a : ẑ ↦ x ^ᶻ a :=
  TauCeti.continuous_zpowHat x

theorem continuous_zpowHat_prod : Continuous fun q : G × ẑ ↦ q.1 ^ᶻ q.2 :=
  TauCeti.continuous_zpowHat_prod

/-! ### 1.2 Closed procyclic subgroups and `ℓ`-parts -/

/-- **Layer 1.2.** The powers of `x` fill out `closedZpowers x`, a closed subgroup. -/
theorem range_zpowHat (x : G) :
    Set.range (fun a : ẑ ↦ x ^ᶻ a) = (TauCeti.closedZpowers x : Set G) :=
  TauCeti.range_zpowHat x

omit [CompactSpace G] [TotallyDisconnectedSpace G] in
theorem closedZpowers_eq (x : G) :
    TauCeti.closedZpowers x = (Subgroup.zpowers x).topologicalClosure :=
  TauCeti.closedZpowers_def x

omit [CompactSpace G] [TotallyDisconnectedSpace G] in
theorem isClosed_closedZpowers (x : G) : IsClosed (TauCeti.closedZpowers x : Set G) := by
  rw [closedZpowers_eq]
  exact Subgroup.isClosed_topologicalClosure _

/-- **Layer 1.2.** `closedZpowers x` is abelian. -/
theorem commute_of_mem_closedZpowers (x : G) {y z : G} (hy : y ∈ TauCeti.closedZpowers x)
    (hz : z ∈ TauCeti.closedZpowers x) : Commute y z := by
  rw [← SetLike.mem_coe, ← range_zpowHat] at hy hz
  obtain ⟨a, rfl⟩ := hy
  obtain ⟨b, rfl⟩ := hz
  exact zpowHat_comm x a b

/-- **Layer 1.2.** `closedZpowers x` is a quotient of `TauCeti.zHat`. -/
theorem closedZpowersLift_surjective (x : G) :
    Function.Surjective (TauCeti.closedZpowersLift.{0} x) :=
  TauCeti.closedZpowersLift_surjective x

omit [CompactSpace G] [TotallyDisconnectedSpace G] in
/-- **Layer 1.2.** It is procyclic: topologically generated by `x`. -/
theorem topologicallyGenerates_closedZpowers (x : G) :
    (Subgroup.zpowers
      (⟨x, TauCeti.mem_closedZpowers x⟩ : TauCeti.closedZpowers x)).topologicalClosure = ⊤ :=
  TauCeti.topologicallyGenerates_closedZpowers x

/-- **Layer 1.2, `ℓ`-parts.** -/
theorem zpowHat_idem_mem_closedZpowers (ℓ : ℕ) [Fact ℓ.Prime] (x : G) :
    x ^ᶻ TauCeti.zHat.idem.{0} ℓ ∈ TauCeti.closedZpowers x := by
  rw [← SetLike.mem_coe, ← range_zpowHat]
  exact ⟨_, rfl⟩

theorem isProP_closedZpowers_zpowHat_idem (ℓ : ℕ) [Fact ℓ.Prime] (x : G) :
    TauCeti.IsProP ℓ (TauCeti.closedZpowers (x ^ᶻ TauCeti.zHat.idem.{0} ℓ)) :=
  TauCeti.isProP_closedZpowers_zpowHat_idem ℓ x

theorem zpowHat_idem_of_isProP_closedZpowers (ℓ : ℕ) [Fact ℓ.Prime] {x : G}
    (hx : TauCeti.IsProP ℓ (TauCeti.closedZpowers x)) : x ^ᶻ TauCeti.zHat.idem.{0} ℓ = x :=
  TauCeti.zpowHat_idem_of_isProP_closedZpowers hx

theorem zpowHat_idem_mul_of_isProP (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (a : ẑ) : x ^ᶻ (TauCeti.zHat.idem ℓ * a) = x ^ᶻ a :=
  TauCeti.zpowHat_idem_mul_of_isProP hG x a

/-- **Layer 1.2.** The `ℓ`-parts recover `x`: `x ^ᶻ (Σ_{ℓ ∈ S} ω_ℓ) → x` as `S` grows. -/
theorem tendsto_zpowHat_sum_idem (x : G) :
    Filter.Tendsto (fun S : Finset Nat.Primes ↦ x ^ᶻ ∑ ℓ ∈ S, TauCeti.zHat.idem.{0} (ℓ : ℕ))
      Filter.atTop (nhds x) :=
  TauCeti.tendsto_zpowHat_sum_idem x

/-! ### 1.3 The `ℤ_ℓ`-power on a pro-`ℓ` group -/

/-- **Layer 1.3.** The `ℤ_ℓ`-power `x ^[ℓ] u`, under the README's alias: Tau Ceti's
`TauCeti.IsProP.padicPow`. -/
noncomputable abbrev padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (u : ℤ_[ℓ]) : G :=
  hG.padicPow x u

/-- **Layer 1.3, the comparison.** `x ^ᶻ a = x ^[ℓ] (component ℓ a)`. -/
theorem zpowHat_eq_padicPow_component (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (a : ẑ) : x ^ᶻ a = padicPow ℓ hG x (TauCeti.zHat.component ℓ a) :=
  TauCeti.zpowHat_eq_padicPow_component hG x a

theorem padicPow_eq_zpowHat (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    {u : ℤ_[ℓ]} {a : ẑ} (ha : TauCeti.zHat.component ℓ a = u) : padicPow ℓ hG x u = x ^ᶻ a := by
  rw [zpowHat_eq_padicPow_component ℓ hG, ha]

/-- **Layer 1.3, the calculus** (Tau Ceti). -/
theorem padicPow_intCast (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G) (n : ℤ) :
    padicPow ℓ hG x (n : ℤ_[ℓ]) = x ^ n :=
  hG.padicPow_intCast x n

theorem padicPow_add (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G) (u v : ℤ_[ℓ]) :
    padicPow ℓ hG x (u + v) = padicPow ℓ hG x u * padicPow ℓ hG x v :=
  hG.padicPow_add x u v

theorem padicPow_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (u v : ℤ_[ℓ]) : padicPow ℓ hG (padicPow ℓ hG x u) v = padicPow ℓ hG x (u * v) :=
  (hG.padicPow_mul x u v).symm

theorem map_padicPow (ℓ : ℕ) [Fact ℓ.Prime] {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : TauCeti.IsProP ℓ G) (hH : TauCeti.IsProP ℓ H) (f : G →* H) (hf : Continuous f) (x : G)
    (u : ℤ_[ℓ]) : f (padicPow ℓ hG x u) = padicPow ℓ hH (f x) u :=
  hG.map_padicPow hH f hf x u

theorem padicPow_conj (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (g x : G) (u : ℤ_[ℓ]) :
    padicPow ℓ hG (g * x * g⁻¹) u = g * padicPow ℓ hG x u * g⁻¹ :=
  hG.conj_padicPow g x u

theorem inv_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G) (u : ℤ_[ℓ]) :
    padicPow ℓ hG x⁻¹ u = (padicPow ℓ hG x u)⁻¹ :=
  hG.inv_padicPow x u

theorem continuous_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) :
    Continuous (fun p : G × ℤ_[ℓ] ↦ padicPow ℓ hG p.1 p.2) :=
  hG.continuous_padicPow.comp continuous_swap

theorem padicPow_mem (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) {K : Subgroup G}
    (hK : IsClosed (K : Set G)) {x : G} (hx : x ∈ K) (u : ℤ_[ℓ]) : padicPow ℓ hG x u ∈ K :=
  hG.padicPow_mem hK hx u

/-- **Layer 1.3.** On an abelian pro-`ℓ` group, `x ^[ℓ] u` is the scalar action of Tau Ceti's
`ℤ_ℓ`-module structure. -/
theorem module_smul {A : Type u} [CommGroup A] [TopologicalSpace A] [IsTopologicalGroup A]
    [CompactSpace A] [TotallyDisconnectedSpace A] (ℓ : ℕ) [Fact ℓ.Prime] (hA : TauCeti.IsProP ℓ A)
    (u : ℤ_[ℓ]) (x : A) :
    letI := hA.module
    u • Additive.ofMul x = Additive.ofMul (padicPow ℓ hA x u) :=
  hA.module_smul u (Additive.ofMul x)

/-- **Layer 1.3, unit exponents.** -/
theorem padicPow_units_inv (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (u : ℤ_[ℓ]ˣ) : padicPow ℓ hG (padicPow ℓ hG x u) ↑u⁻¹ = x :=
  hG.padicPow_padicPow_inv x u

theorem closedZpowers_padicPow_units (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (u : ℤ_[ℓ]ˣ) : TauCeti.closedZpowers (padicPow ℓ hG x u) = TauCeti.closedZpowers x :=
  hG.closedZpowers_padicPow x u

/-- **Layer 1.3.** `x ↦ x ^[ℓ] u` is a homeomorphism with inverse `x ↦ x ^[ℓ] u⁻¹`. -/
theorem padicPowHomeomorph_apply (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (u : ℤ_[ℓ]ˣ)
    (x : G) : hG.padicPowHomeomorph u x = padicPow ℓ hG x u :=
  hG.padicPowHomeomorph_apply u x

theorem padicPowHomeomorph_symm (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (u : ℤ_[ℓ]ˣ) :
    (hG.padicPowHomeomorph u).symm = hG.padicPowHomeomorph u⁻¹ :=
  hG.padicPowHomeomorph_symm u

theorem padicPow_units_inj (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) {x y : G}
    (u : ℤ_[ℓ]ˣ) : padicPow ℓ hG x u = padicPow ℓ hG y u ↔ x = y :=
  hG.padicPow_left_inj u

/-- **Layer 1.3, the class in a quotient** by a closed normal subgroup, and its module form when
the quotient is abelian. -/
theorem mk_padicPow_quotient (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (N : Subgroup G)
    [N.Normal] [IsClosed (N : Set G)] (x : G) (u : ℤ_[ℓ]) :
    ((padicPow ℓ hG x u : G) : G ⧸ N) = (hG.quotient N).padicPow (x : G ⧸ N) u :=
  hG.mk_padicPow_quotient N x u

open scoped IsMulCommutative in
theorem ofMul_mk_padicPow_quotient (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G)
    (N : Subgroup G) [N.Normal] [IsClosed (N : Set G)] [IsMulCommutative (G ⧸ N)] (x : G)
    (u : ℤ_[ℓ]) :
    letI := (hG.quotient N).module
    Additive.ofMul ((padicPow ℓ hG x u : G) : G ⧸ N) = u • Additive.ofMul (x : G ⧸ N) :=
  hG.ofMul_mk_padicPow_quotient N x u

end Powers

/-! ## Layer 2: continuous automorphisms and outer automorphisms -/

/-! ### 2.1 The groups -/

section Groups

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 2.1.** `ContinuousAut G` is `G ≃ₜ* G`, a group by composition:
`1 = refl`, `φ * ψ = ψ.trans φ`, `φ⁻¹ = φ.symm`, so `(φ * ψ) x = φ (ψ x)`. -/
example : TauCeti.ContinuousAut G = (G ≃ₜ* G) := rfl

omit [IsTopologicalGroup G] in
theorem ContinuousAut.mul_def (φ ψ : TauCeti.ContinuousAut G) : φ * ψ = ψ.trans φ :=
  TauCeti.ContinuousAut.mul_def φ ψ

omit [IsTopologicalGroup G] in
theorem ContinuousAut.one_def : (1 : TauCeti.ContinuousAut G) = ContinuousMulEquiv.refl G :=
  TauCeti.ContinuousAut.one_def

omit [IsTopologicalGroup G] in
theorem ContinuousAut.inv_def (φ : TauCeti.ContinuousAut G) : φ⁻¹ = φ.symm :=
  TauCeti.ContinuousAut.inv_def φ

omit [IsTopologicalGroup G] in
theorem ContinuousAut.mul_apply (φ ψ : TauCeti.ContinuousAut G) (x : G) :
    (φ * ψ) x = φ (ψ x) :=
  TauCeti.ContinuousAut.mul_apply φ ψ x

omit [IsTopologicalGroup G] in
/-- **Layer 2.1.** The forgetful homomorphism to `MulAut G` is injective. -/
theorem ContinuousAut.toMulAut_injective :
    Function.Injective (TauCeti.ContinuousAut.toMulAut : TauCeti.ContinuousAut G →* MulAut G) :=
  TauCeti.ContinuousAut.toMulAut_injective

/-- **Layer 2.1, inner automorphisms.** `conj g x = g * x * g⁻¹`, lifting `MulAut.conj`; its
kernel is the centre and its range is normal. -/
theorem ContinuousAut.conj_apply (g x : G) : TauCeti.ContinuousAut.conj g x = g * x * g⁻¹ :=
  TauCeti.ContinuousAut.conj_apply g x

theorem ContinuousAut.toMulAut_conj (g : G) :
    TauCeti.ContinuousAut.toMulAut (TauCeti.ContinuousAut.conj g) = MulAut.conj g :=
  TauCeti.ContinuousAut.toMulAut_conj g

theorem ContinuousAut.ker_conj :
    (TauCeti.ContinuousAut.conj : G →* TauCeti.ContinuousAut G).ker = Subgroup.center G :=
  TauCeti.ContinuousAut.ker_conj

example : (TauCeti.ContinuousAut.conj : G →* TauCeti.ContinuousAut G).range.Normal :=
  inferInstance

/-- **Layer 2.1.** `ContinuousOut G` is the quotient by the inner automorphisms. -/
example : TauCeti.ContinuousOut G =
    (TauCeti.ContinuousAut G ⧸ (TauCeti.ContinuousAut.conj : G →* TauCeti.ContinuousAut G).range) :=
  rfl

/-- **Layer 2.1, examples.** For abelian `G`, `ContinuousOut G = ContinuousAut G`. -/
theorem ContinuousOut.mulEquivOfIsMulCommutative_mk [IsMulCommutative G]
    (φ : TauCeti.ContinuousAut G) :
    TauCeti.ContinuousOut.mulEquivOfIsMulCommutative (TauCeti.ContinuousOut.mk φ) = φ :=
  TauCeti.ContinuousOut.mulEquivOfIsMulCommutative_mk φ

/-- For trivial centre, `conj` is injective. -/
theorem ContinuousAut.conj_injective_iff :
    Function.Injective (TauCeti.ContinuousAut.conj : G →* TauCeti.ContinuousAut G) ↔
      Subgroup.center G = ⊥ :=
  TauCeti.ContinuousAut.conj_injective_iff

/-- For `G = TauCeti.zHat`, `ContinuousAut G ≃* ẑˣ`, sending `φ` to `φ` of the generator. -/
noncomputable example : TauCeti.ContinuousAut TauCeti.zHat.{0} ≃* ẑˣ :=
  TauCeti.zHat.continuousAutEquivUnits

theorem continuousAutEquivUnits_apply (φ : TauCeti.ContinuousAut TauCeti.zHat.{0}) :
    ((TauCeti.zHat.continuousAutEquivUnits φ : ẑˣ) : ẑ) = Additive.ofMul (φ TauCeti.zHat.gen) :=
  TauCeti.zHat.coe_continuousAutEquivUnits_apply φ

/-- **Layer 2.1, inner is inner.** -/
theorem ContinuousAut.eq_conj_of_toMulAut_eq_conj {φ : TauCeti.ContinuousAut G} {g : G}
    (h : TauCeti.ContinuousAut.toMulAut φ = MulAut.conj g) :
    φ = TauCeti.ContinuousAut.conj g :=
  TauCeti.ContinuousAut.eq_conj_of_toMulAut_eq_conj h

end Groups

/-! ### 2.2 The congruence topology -/

section Congruence

variable {G : Type u} [Group G] [TopologicalSpace G]

/-- **Layer 2.2.** `IsTopCharacteristic N`: every continuous automorphism maps `N` onto itself. -/
theorem isTopCharacteristic_iff {N : Subgroup G} :
    TauCeti.IsTopCharacteristic G N ↔ ∀ φ : TauCeti.ContinuousAut G, N.map φ.toMonoidHom = N :=
  TauCeti.isTopCharacteristic_iff_map_eq

theorem isTopCharacteristic_proPKernel (p : ℕ) :
    TauCeti.IsTopCharacteristic G (TauCeti.proPKernel p G) :=
  TauCeti.isTopCharacteristic_proPKernel p

theorem isTopCharacteristic_proPFrattini (p : ℕ) :
    TauCeti.IsTopCharacteristic G (TauCeti.proPFrattini p G) :=
  TauCeti.isTopCharacteristic_proPFrattini p

/-- **Layer 2.2.** `mapQuotient` sends `φ` to `x N ↦ φ x N`. -/
theorem ContinuousAut.mapQuotient_mk {N : Subgroup G} (hN : TauCeti.IsTopCharacteristic G N)
    [N.Normal] (φ : TauCeti.ContinuousAut G) (x : G) :
    TauCeti.ContinuousAut.mapQuotient hN φ (x : G ⧸ N) = (φ x : G ⧸ N) :=
  TauCeti.ContinuousAut.mapQuotient_mk hN φ x

/-- **Layer 2.2, the topology.** The initial topology of the maps to `MulAut (G ⧸ N)`, each with
the discrete topology `⊥`, over the topologically characteristic open normal subgroups. -/
theorem congruenceTopology_eq_iInf :
    (inferInstance : TopologicalSpace (TauCeti.ContinuousAut G)) =
      ⨅ N : {N : OpenNormalSubgroup G // TauCeti.IsTopCharacteristic G N},
        TopologicalSpace.induced (TauCeti.ContinuousAut.mapQuotient N.2) ⊥ :=
  TauCeti.ContinuousAut.congruenceTopology_eq_iInf

theorem ContinuousAut.continuous_mapQuotient (N : OpenNormalSubgroup G)
    (hN : TauCeti.IsTopCharacteristic G N) :
    @Continuous _ _ _ ⊥ (TauCeti.ContinuousAut.mapQuotient hN) :=
  TauCeti.ContinuousAut.continuous_mapQuotient N hN

variable [IsTopologicalGroup G]

example : IsTopologicalGroup (TauCeti.ContinuousAut G) := inferInstance

theorem ContinuousAut.continuous_conj :
    Continuous (TauCeti.ContinuousAut.conj : G →* TauCeti.ContinuousAut G) :=
  TauCeti.ContinuousAut.continuous_conj

variable [CompactSpace G] [TotallyDisconnectedSpace G]

omit [TotallyDisconnectedSpace G] in
/-- **Layer 2.2, cofinality.** In a topologically finitely generated profinite group, every open
subgroup contains a topologically characteristic open normal subgroup. -/
theorem exists_isTopCharacteristic_le (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (U : OpenSubgroup G) :
    ∃ N : OpenNormalSubgroup G, TauCeti.IsTopCharacteristic G N ∧ (N : Subgroup G) ≤ U :=
  hfg.exists_isTopCharacteristic_le U

/-- **Layer 2.2, profiniteness under finite generation.** -/
theorem ContinuousAut.compactSpace (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    CompactSpace (TauCeti.ContinuousAut G) :=
  TauCeti.ContinuousAut.compactSpace hfg

theorem ContinuousAut.t2Space (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    T2Space (TauCeti.ContinuousAut G) :=
  TauCeti.ContinuousAut.t2Space hfg

theorem ContinuousAut.totallyDisconnectedSpace (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    TotallyDisconnectedSpace (TauCeti.ContinuousAut G) :=
  TauCeti.ContinuousAut.totallyDisconnectedSpace hfg

theorem ContinuousAut.continuous_eval (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    Continuous (fun p : TauCeti.ContinuousAut G × G ↦ p.1 p.2) :=
  TauCeti.ContinuousAut.continuous_eval hfg

theorem ContinuousAut.isClosed_range_conj (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    IsClosed ((TauCeti.ContinuousAut.conj : G →* TauCeti.ContinuousAut G).range :
      Set (TauCeti.ContinuousAut G)) :=
  TauCeti.ContinuousAut.isClosed_range_conj hfg

theorem ContinuousOut.compactSpace (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    CompactSpace (TauCeti.ContinuousOut G) :=
  TauCeti.ContinuousOut.compactSpace hfg

theorem ContinuousOut.t2Space (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    T2Space (TauCeti.ContinuousOut G) :=
  TauCeti.ContinuousOut.t2Space hfg

theorem ContinuousOut.totallyDisconnectedSpace (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    TotallyDisconnectedSpace (TauCeti.ContinuousOut G) :=
  TauCeti.ContinuousOut.totallyDisconnectedSpace hfg

/-- **Layer 2.2, closedness of the conjugacy relation** in a compact, totally disconnected group. -/
theorem isClosed_isConj_pair : IsClosed {q : G × G | IsConj q.1 q.2} :=
  TauCeti.isClosed_isConj_pair G

/-- **Layer 2.2, closedness of the automorphism conditions.** -/
theorem ContinuousAut.isClosed_setOf_apply_eq (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (x y : G) : IsClosed {φ : TauCeti.ContinuousAut G | φ x = y} :=
  TauCeti.ContinuousAut.isClosed_setOf_apply_eq hfg x y

theorem ContinuousAut.isClosed_isConj (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (x y : G) : IsClosed {φ : TauCeti.ContinuousAut G | IsConj (φ x) y} :=
  TauCeti.ContinuousAut.isClosed_isConj hfg x y

end Congruence

/-! ### 2.3 Actions and functoriality -/

section Actions

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 2.3, the action on `G`** by evaluation, a `MulDistribMulAction`. -/
example : MulDistribMulAction (TauCeti.ContinuousAut G) G := inferInstance

omit [IsTopologicalGroup G] in
theorem ContinuousAut.smul_def (φ : TauCeti.ContinuousAut G) (x : G) : φ • x = φ x :=
  TauCeti.ContinuousAut.smul_def G φ x

/-- The action is compatible with `^ᶻ` and with `^[ℓ]`. -/
theorem ContinuousAut.smul_zpowHat [CompactSpace G] [TotallyDisconnectedSpace G]
    (φ : TauCeti.ContinuousAut G) (x : G) (a : ẑ) : φ • x ^ᶻ a = (φ • x) ^ᶻ a :=
  TauCeti.smul_zpowHat φ x a

theorem ContinuousAut.smul_padicPow [CompactSpace G] [TotallyDisconnectedSpace G] (ℓ : ℕ)
    [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (φ : TauCeti.ContinuousAut G) (x : G)
    (u : ℤ_[ℓ]) : φ • padicPow ℓ hG x u = padicPow ℓ hG (φ • x) u :=
  hG.smul_padicPow φ x u

/-- **Layer 2.3, conjugacy classes.** The action descends to `ConjClasses G` through
`ContinuousOut G`. -/
theorem ContinuousOut.mk_smul_mk (φ : TauCeti.ContinuousAut G) (x : G) :
    TauCeti.ContinuousOut.mk φ • ConjClasses.mk x = ConjClasses.mk (φ x) :=
  TauCeti.ContinuousOut.mk_smul_mk φ x

omit [IsTopologicalGroup G] in
/-- **Layer 2.3, closed subgroups up to conjugacy.** -/
theorem ContinuousAut.smul_closedSubgroup_toSubgroup (φ : TauCeti.ContinuousAut G)
    (H : ClosedSubgroup G) :
    ((φ • H : ClosedSubgroup G) : Subgroup G) = (H : Subgroup G).map φ.toMonoidHom :=
  TauCeti.ContinuousAut.smul_closedSubgroup_toSubgroup φ H

example : TauCeti.ClosedSubgroupConjClasses G =
    MulAction.orbitRel.Quotient (ConjAct G) (ClosedSubgroup G) :=
  rfl

theorem ContinuousOut.mk_smul_closedSubgroupConjClass (φ : TauCeti.ContinuousAut G)
    (H : ClosedSubgroup G) :
    TauCeti.ContinuousOut.mk φ • TauCeti.ClosedSubgroupConjClasses.mk H
      = TauCeti.ClosedSubgroupConjClasses.mk (φ • H) :=
  TauCeti.ContinuousOut.mk_smul_closedSubgroupConjClass φ H

omit [IsTopologicalGroup G] in
/-- **Layer 2.3, functoriality along a characteristic quotient.** -/
theorem ContinuousAut.mapClosedQuotient_mk {N : Subgroup G} (hN : TauCeti.IsTopCharacteristic G N)
    [N.Normal] (φ : TauCeti.ContinuousAut G) (x : G) :
    TauCeti.ContinuousAut.mapClosedQuotient hN φ (x : G ⧸ N) = (φ x : G ⧸ N) :=
  TauCeti.ContinuousAut.mapClosedQuotient_mk hN φ x

theorem ContinuousAut.mapClosedQuotient_conj {N : Subgroup G}
    (hN : TauCeti.IsTopCharacteristic G N) [N.Normal] (g : G) :
    TauCeti.ContinuousAut.mapClosedQuotient hN (TauCeti.ContinuousAut.conj g)
      = TauCeti.ContinuousAut.conj (g : G ⧸ N) :=
  TauCeti.ContinuousAut.mapClosedQuotient_conj hN g

omit [IsTopologicalGroup G] in
theorem ContinuousAut.continuous_mapClosedQuotient {N : Subgroup G}
    (hN : TauCeti.IsTopCharacteristic G N) [N.Normal] :
    Continuous (TauCeti.ContinuousAut.mapClosedQuotient hN) :=
  TauCeti.ContinuousAut.continuous_mapClosedQuotient hN

omit [IsTopologicalGroup G] in
theorem ContinuousAut.mapClosedQuotient_smul_conjClasses_map {N : Subgroup G}
    (hN : TauCeti.IsTopCharacteristic G N) [N.Normal] (φ : TauCeti.ContinuousAut G)
    (c : ConjClasses G) :
    TauCeti.ContinuousAut.mapClosedQuotient hN φ • ConjClasses.map (QuotientGroup.mk' N) c
      = ConjClasses.map (QuotientGroup.mk' N) (φ • c) :=
  TauCeti.ContinuousAut.mapClosedQuotient_smul_conjClasses_map hN φ c

theorem ContinuousOut.mapClosedQuotient_mk {N : Subgroup G}
    (hN : TauCeti.IsTopCharacteristic G N) [N.Normal] (φ : TauCeti.ContinuousAut G) :
    TauCeti.ContinuousOut.mapClosedQuotient hN (TauCeti.ContinuousOut.mk φ)
      = TauCeti.ContinuousOut.mk (TauCeti.ContinuousAut.mapClosedQuotient hN φ) :=
  TauCeti.ContinuousOut.mapClosedQuotient_mk hN φ

theorem ContinuousOut.continuous_mapClosedQuotient {N : Subgroup G}
    (hN : TauCeti.IsTopCharacteristic G N) [N.Normal] :
    Continuous (TauCeti.ContinuousOut.mapClosedQuotient hN) :=
  TauCeti.ContinuousOut.continuous_mapClosedQuotient hN

end Actions

section OuterAction

variable {E : Type u} [Group E] [TopologicalSpace E] [IsTopologicalGroup E] (N : Subgroup E)
  [N.Normal]

/-- **Layer 2.3, the outer action of an extension.** `outerAction N (e N)` is the class of one
continuous automorphism of `N` conjugating every element by `e`. -/
theorem outerAction_mk (e : E) :
    ∃ φ : TauCeti.ContinuousAut N, TauCeti.ContinuousOut.mk φ = TauCeti.outerAction N (e : E ⧸ N) ∧
      ∀ n : N, (φ n : E) = e * n * e⁻¹ :=
  ⟨TauCeti.ContinuousAut.conjNormal e, (TauCeti.outerAction_mk e).symm,
    TauCeti.ContinuousAut.conjNormal_apply e⟩

/-- **Layer 2.3.** Conjugation `E → ContinuousAut N` and the outer action are continuous for the
congruence topology when `N` is compact. -/
theorem continuous_conjNormal [CompactSpace N] :
    Continuous (TauCeti.ContinuousAut.conjNormal : E →* TauCeti.ContinuousAut N) :=
  TauCeti.ContinuousAut.continuous_conjNormal

theorem continuous_outerAction [CompactSpace N] : Continuous (TauCeti.outerAction N) :=
  TauCeti.continuous_outerAction

end OuterAction

/-! ### 2.4 Automorphisms of pro-`p` groups -/

/-- **Layer 2.4, the finite theorem.** For a finite `p`-group `P`, the kernel of
`MulAut P →* MulAut (P ⧸ frattini P)` is a `p`-group. -/
theorem isPGroup_ker_mapQuotient_frattini {P : Type u} [Group P] [Finite P] (p : ℕ)
    [Fact p.Prime] (hP : IsPGroup p P) : IsPGroup p (MulAut.mapQuotient (frattini P)).ker :=
  hP.isPGroup_ker_mapQuotient_frattini

section ProP

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]

omit [TotallyDisconnectedSpace G] in
/-- **Layer 2.4, the pro-`p` theorem.** The kernel of
`ContinuousAut G →* MulAut (G ⧸ proPFrattini p G)` is pro-`p`, and open when `G` is topologically
finitely generated. -/
theorem isProP_ker_mapQuotient_proPFrattini (p : ℕ) [Fact p.Prime] (hG : TauCeti.IsProP p G) :
    TauCeti.IsProP p (TauCeti.ContinuousAut.mapQuotient
      (TauCeti.isTopCharacteristic_proPFrattini (G := G) p)).ker :=
  hG.isProP_ker_mapQuotient_proPFrattini

omit [TotallyDisconnectedSpace G] in
theorem isOpen_ker_mapQuotient_proPFrattini (p : ℕ)
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    IsOpen ((TauCeti.ContinuousAut.mapQuotient
      (TauCeti.isTopCharacteristic_proPFrattini (G := G) p)).ker : Set (TauCeti.ContinuousAut G)) :=
  TauCeti.ContinuousAut.isOpen_ker_mapQuotient_proPFrattini hfg p

end ProP

/-- **Layer 2.4, the free case.** For `F = freeProP p (Fin n)`, every automorphism of the Frattini
quotient lifts. -/
theorem mapQuotient_proPFrattini_freeProP_surjective (p n : ℕ) [Fact p.Prime] :
    Function.Surjective (TauCeti.ContinuousAut.mapQuotient
      (TauCeti.isTopCharacteristic_proPFrattini (G := TauCeti.freeProP p (Fin n)) p)) :=
  TauCeti.freeProP.mapQuotient_proPFrattini_surjective


/-! ## Layer 3: the closed lower central series and its graded Lie ring -/

/-! ### 3.1 The series -/

section Series

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 3.1.** `γ_n(G)` is Tau Ceti's lower `p`-series at `p = 0`, with `γ_0 = ⊤` and
`γ_{n+1} = closure ⁅γ_n, ⊤⁆`. -/
theorem closedLowerCentralSeries_def (n : ℕ) :
    TauCeti.closedLowerCentralSeries G n = TauCeti.pLowerCentralSeries 0 G n :=
  TauCeti.closedLowerCentralSeries_def G n

theorem closedLowerCentralSeries_zero : TauCeti.closedLowerCentralSeries G 0 = ⊤ :=
  TauCeti.closedLowerCentralSeries_zero G

theorem closedLowerCentralSeries_succ (n : ℕ) :
    TauCeti.closedLowerCentralSeries G (n + 1)
      = ⁅TauCeti.closedLowerCentralSeries G n, (⊤ : Subgroup G)⁆.topologicalClosure :=
  TauCeti.closedLowerCentralSeries_succ G n

theorem closedLowerCentralSeries_one :
    TauCeti.closedLowerCentralSeries G 1 = (commutator G).topologicalClosure :=
  TauCeti.closedLowerCentralSeries_one G

/-- **Layer 3.1.** Closedness, normality, antitonicity and the commutator inclusion. -/
theorem isClosed_closedLowerCentralSeries (n : ℕ) :
    IsClosed (TauCeti.closedLowerCentralSeries G n : Set G) :=
  TauCeti.isClosed_closedLowerCentralSeries n

example (n : ℕ) : (TauCeti.closedLowerCentralSeries G n).Normal := inferInstance

theorem closedLowerCentralSeries_antitone : Antitone (TauCeti.closedLowerCentralSeries G) :=
  TauCeti.closedLowerCentralSeries_antitone

theorem commutator_closedLowerCentralSeries_le (j k : ℕ) :
    ⁅TauCeti.closedLowerCentralSeries G j, TauCeti.closedLowerCentralSeries G k⁆
      ≤ TauCeti.closedLowerCentralSeries G (j + k + 1) :=
  TauCeti.commutator_closedLowerCentralSeries_le j k

/-- **Layer 3.1, functoriality** under continuous homomorphisms. -/
theorem map_closedLowerCentralSeries_le {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] (f : G →* H) (hf : Continuous f) (n : ℕ) :
    (TauCeti.closedLowerCentralSeries G n).map f ≤ TauCeti.closedLowerCentralSeries H n :=
  f.map_closedLowerCentralSeries_le hf n

/-- **Layer 3.1.** Every term is topologically characteristic. -/
theorem isTopCharacteristic_closedLowerCentralSeries (n : ℕ) :
    TauCeti.IsTopCharacteristic G (TauCeti.closedLowerCentralSeries G n) :=
  TauCeti.isTopCharacteristic_closedLowerCentralSeries G n

/-- **Layer 3.1, comparison with the abstract series.** -/
theorem closedLowerCentralSeries_eq_topologicalClosure (n : ℕ) :
    TauCeti.closedLowerCentralSeries G n
      = ((⊤ : Subgroup G).lowerCentralSeries n).topologicalClosure :=
  TauCeti.closedLowerCentralSeries_eq_topologicalClosure n

/-- **Layer 3.1, comparison with the lower `p`-series.** -/
theorem closedLowerCentralSeries_le_pLowerCentralSeries (p n : ℕ) :
    TauCeti.closedLowerCentralSeries G n ≤ TauCeti.pLowerCentralSeries p G n :=
  TauCeti.closedLowerCentralSeries_le_pLowerCentralSeries p n

/-- **Layer 3.1, triviality of the intersection** for a pro-`p` group. -/
theorem iInf_closedLowerCentralSeries_eq_bot [CompactSpace G] [TotallyDisconnectedSpace G]
    (p : ℕ) [Fact p.Prime] (hG : TauCeti.IsProP p G) :
    ⨅ n : ℕ, TauCeti.closedLowerCentralSeries G n = ⊥ :=
  hG.iInf_closedLowerCentralSeries_eq_bot Fact.out

end Series

/-! ### 3.2 Graded pieces and the bracket -/

section Graded

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 3.2.** `gr_n(G)` is Tau Ceti's `gradedPiece 0 G n`, with class map `gradedMk`. -/
example (n : ℕ) : TauCeti.lcsGradedPiece G n = TauCeti.gradedPiece 0 G n := rfl

theorem lcsGradedMk_surjective (n : ℕ) : Function.Surjective (TauCeti.lcsGradedMk G n) :=
  TauCeti.lcsGradedMk_surjective n

/-- **Layer 3.2.** When `G` is profinite, `gr_n(G)` is an abelian profinite group. -/
theorem lcsGradedPiece_profinite [CompactSpace G] [TotallyDisconnectedSpace G] (n : ℕ) :
    CompactSpace (TauCeti.lcsGradedPiece G n) ∧ T2Space (TauCeti.lcsGradedPiece G n) ∧
      TotallyDisconnectedSpace (TauCeti.lcsGradedPiece G n) := by
  let R := TauCeti.pLowerCentralSeries 0 G n
  let N := (TauCeti.pLowerCentralSeries 0 G (n + 1)).subgroupOf R
  have hR : IsClosed (R : Set G) := TauCeti.isClosed_pLowerCentralSeries n
  have : IsClosed (N : Set R) :=
    (TauCeti.isClosed_pLowerCentralSeries (n + 1)).preimage continuous_subtype_val
  have : CompactSpace R := isCompact_iff_compactSpace.mp hR.isCompact
  exact ⟨inferInstance, inferInstance, inferInstance⟩

example (n : ℕ) : AddCommGroup (TauCeti.lcsGradedPiece G n) := inferInstance

/-- **Layer 3.2, degree zero.** `gr_0(G) ≃ₜ+ Additive (TopologicalAbelianization G)`, pinned on
classes. -/
theorem lcsGradedPieceZeroEquiv_mk (g : G) :
    TauCeti.lcsGradedPieceZeroEquiv
        (TauCeti.lcsGradedMk G 0 ⟨g, TauCeti.mem_pLowerCentralSeries_zero 0 g⟩)
      = Additive.ofMul (g : TopologicalAbelianization G) :=
  TauCeti.lcsGradedPieceZeroEquiv_mk g

/-- **Layer 3.2, the bracket** `gr_j × gr_k → gr_{j+k+1}`, induced by the commutator. -/
theorem lcsBracket_mk {j k : ℕ} (x : TauCeti.closedLowerCentralSeries G j)
    (y : TauCeti.closedLowerCentralSeries G k) :
    TauCeti.lcsBracket G j k (TauCeti.lcsGradedMk G j x) (TauCeti.lcsGradedMk G k y)
      = TauCeti.lcsGradedMk G (j + k + 1)
          ⟨⁅(x : G), (y : G)⁆, TauCeti.commutator_closedLowerCentralSeries_le j k
            (Subgroup.commutator_mem_commutator x.2 y.2)⟩ :=
  TauCeti.lcsBracket_lcsGradedMk x y

theorem lcsBracket_self {k : ℕ} (x : TauCeti.lcsGradedPiece G k) :
    TauCeti.lcsBracket G k k x x = 0 :=
  TauCeti.gradedBracket_self x

/-- **Layer 3.2.** The Jacobi identity, up to the degree casts. -/
theorem lcsBracket_jacobi {i j k : ℕ} (x : TauCeti.lcsGradedPiece G i)
    (y : TauCeti.lcsGradedPiece G j) (z : TauCeti.lcsGradedPiece G k) :
    TauCeti.gradedCast 0 G (by omega)
        (TauCeti.lcsBracket G (i + j + 1) k (TauCeti.lcsBracket G i j x y) z) +
      TauCeti.gradedCast 0 G (by omega)
        (TauCeti.lcsBracket G (j + k + 1) i (TauCeti.lcsBracket G j k y z) x) +
      TauCeti.gradedCast 0 G (by omega)
        (TauCeti.lcsBracket G (k + i + 1) j (TauCeti.lcsBracket G k i z x) y) =
      (0 : TauCeti.lcsGradedPiece G (i + j + k + 2)) :=
  TauCeti.gradedBracket_jacobi x y z

/-- **Layer 3.2.** Naturality for continuous homomorphisms. -/
theorem gradedMap_lcsBracket {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (f : G →* H) (hf : Continuous f) {j k : ℕ} (x : TauCeti.lcsGradedPiece G j)
    (y : TauCeti.lcsGradedPiece G k) :
    TauCeti.gradedMap 0 f hf (j + k + 1) (TauCeti.lcsBracket G j k x y)
      = TauCeti.lcsBracket H j k (TauCeti.gradedMap 0 f hf j x) (TauCeti.gradedMap 0 f hf k y) :=
  TauCeti.gradedMap_gradedBracket f hf x y

/-- **Layer 3.2.** Conjugation acts trivially on every graded piece. -/
theorem lcsGradedMk_conj (n : ℕ) (g : G) (x : TauCeti.closedLowerCentralSeries G n) :
    TauCeti.lcsGradedMk G n
        ⟨g * x * g⁻¹, (inferInstance : (TauCeti.closedLowerCentralSeries G n).Normal).conj_mem
          x x.2 g⟩
      = TauCeti.lcsGradedMk G n x :=
  TauCeti.lcsGradedMk_conj n g x

/-- **Layer 3.2.** The bracket is jointly continuous. -/
theorem continuous_lcsBracket (j k : ℕ) :
    Continuous fun xy : TauCeti.lcsGradedPiece G j × TauCeti.lcsGradedPiece G k ↦
      TauCeti.lcsBracket G j k xy.1 xy.2 :=
  TauCeti.continuous_gradedBracket j k

/-- **Layer 3.2, the graded Lie ring**, with a Lie ring homomorphism for every continuous
homomorphism. -/
example : LieRing (⨁ n, TauCeti.lcsGradedPiece G n) := inferInstance

/-- **Layer 3.2.** The Lie bracket of `⨁ n, gr_n(G)` is the degreewise bracket: on homogeneous
elements of degrees `j` and `k` it is `lcsBracket`, landing in degree `j + k + 1`. -/
theorem lie_of_of {j k : ℕ} (x : TauCeti.lcsGradedPiece G j) (y : TauCeti.lcsGradedPiece G k) :
    ⁅DirectSum.of (TauCeti.lcsGradedPiece G) j x, DirectSum.of (TauCeti.lcsGradedPiece G) k y⁆
      = DirectSum.of (TauCeti.lcsGradedPiece G) (j + k + 1) (TauCeti.lcsBracket G j k x y) :=
  TauCeti.of_lie_of x y

theorem gradedLieHom_of {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (f : G →* H) (hf : Continuous f) (k : ℕ) (x : TauCeti.lcsGradedPiece G k) :
    TauCeti.gradedLieHom 0 f hf (DirectSum.of (TauCeti.lcsGradedPiece G) k x)
      = DirectSum.of (TauCeti.lcsGradedPiece H) k (TauCeti.gradedMap 0 f hf k x) :=
  TauCeti.gradedLieHom_of f hf k x

section PadicStructure

variable [CompactSpace G] [TotallyDisconnectedSpace G] (p : ℕ) [Fact p.Prime]
  (hG : TauCeti.IsProP p G)

/-- **Layer 3.2, `ℤ_p`-structure.** The class of `x ^[p] u` in `gr_n(G)` is
`u • lcsGradedMk x`. -/
theorem lcsGradedMk_padicPow {n : ℕ} (x : TauCeti.closedLowerCentralSeries G n) (u : ℤ_[p]) :
    letI := hG.gradedPieceModule 0 n
    TauCeti.lcsGradedMk G n
        ⟨padicPow p hG x u, padicPow_mem p hG (isClosed_closedLowerCentralSeries n) x.2 u⟩
      = u • TauCeti.lcsGradedMk G n x :=
  hG.gradedMk_padicPow x u

/-- **Layer 3.2.** Each `gr_n(G)` is a topological `ℤ_p`-module: the module structure is Tau
Ceti's `IsProP.module` on the abelian pro-`p` quotient, whose scalar action is continuous. -/
theorem continuousSMul_lcsGradedPiece (n : ℕ) :
    letI := hG.gradedPieceModule 0 n
    ContinuousSMul ℤ_[p] (TauCeti.lcsGradedPiece G n) := by
  let R := TauCeti.pLowerCentralSeries 0 G n
  let N := (TauCeti.pLowerCentralSeries 0 G (n + 1)).subgroupOf R
  let _ : IsClosed (R : Set G) := TauCeti.isClosed_pLowerCentralSeries n
  let _ : IsClosed (N : Set R) :=
    (TauCeti.isClosed_pLowerCentralSeries (n + 1)).preimage continuous_subtype_val
  rw [hG.gradedPieceModule_def]
  exact ((hG.subgroup R).quotient N).continuousSMul_module

/-- **Layer 3.2.** The bracket is `ℤ_p`-bilinear on classes of powers. -/
theorem lcsBracket_padicPow_left {j k : ℕ} (x : TauCeti.closedLowerCentralSeries G j)
    (y : TauCeti.closedLowerCentralSeries G k) (u : ℤ_[p]) :
    TauCeti.lcsBracket G j k
        (TauCeti.lcsGradedMk G j
          ⟨padicPow p hG x u, padicPow_mem p hG (isClosed_closedLowerCentralSeries j) x.2 u⟩)
        (TauCeti.lcsGradedMk G k y)
      = TauCeti.lcsGradedMk G (j + k + 1)
          ⟨padicPow p hG ⁅(x : G), (y : G)⁆ u,
            padicPow_mem p hG (isClosed_closedLowerCentralSeries (j + k + 1))
              (TauCeti.commutator_closedLowerCentralSeries_le j k
                (Subgroup.commutator_mem_commutator x.2 y.2)) u⟩ :=
  hG.gradedBracket_padicPow_left x y u

theorem lcsBracket_padicPow_right {j k : ℕ} (x : TauCeti.closedLowerCentralSeries G j)
    (y : TauCeti.closedLowerCentralSeries G k) (u : ℤ_[p]) :
    TauCeti.lcsBracket G j k (TauCeti.lcsGradedMk G j x)
        (TauCeti.lcsGradedMk G k
          ⟨padicPow p hG y u, padicPow_mem p hG (isClosed_closedLowerCentralSeries k) y.2 u⟩)
      = TauCeti.lcsGradedMk G (j + k + 1)
          ⟨padicPow p hG ⁅(x : G), (y : G)⁆ u,
            padicPow_mem p hG (isClosed_closedLowerCentralSeries (j + k + 1))
              (TauCeti.commutator_closedLowerCentralSeries_le j k
                (Subgroup.commutator_mem_commutator x.2 y.2)) u⟩ :=
  hG.gradedBracket_padicPow_right x y u

/-- **Layer 3.2.** So `⨁ n, gr_n(G)` is a `LieAlgebra ℤ_[p]`. -/
noncomputable example :
    letI := fun k ↦ hG.gradedPieceModule 0 k
    LieAlgebra ℤ_[p] (⨁ n, TauCeti.lcsGradedPiece G n) :=
  hG.gradedLieAlgebra 0

end PadicStructure

/-- **Layer 3.2, comparison with the lower `p`-series**, additive and compatible with brackets. -/
theorem lcsToPLowerCentral_mk (p n : ℕ) (x : TauCeti.closedLowerCentralSeries G n) :
    TauCeti.lcsToPLowerCentral p G n (TauCeti.lcsGradedMk G n x)
      = TauCeti.gradedMk p G n ⟨x, closedLowerCentralSeries_le_pLowerCentralSeries p n x.2⟩ :=
  TauCeti.lcsToPLowerCentral_gradedMk p n x

theorem lcsToPLowerCentral_lcsBracket (p : ℕ) {j k : ℕ} (x : TauCeti.lcsGradedPiece G j)
    (y : TauCeti.lcsGradedPiece G k) :
    TauCeti.lcsToPLowerCentral p G (j + k + 1) (TauCeti.lcsBracket G j k x y)
      = TauCeti.gradedBracket p G j k (TauCeti.lcsToPLowerCentral p G j x)
          (TauCeti.lcsToPLowerCentral p G k y) :=
  TauCeti.lcsToPLowerCentral_lcsBracket p x y

end Graded

/-! ### 3.3 Generation -/

section Generation

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 3.3, the spanning theorem.** For a topological generating set `S`, `gr_{n+1}(G)` is
the closure of the subgroup generated by the brackets `[s̄, y]`, `s ∈ S`, `y ∈ gr_n(G)`. -/
theorem topologicalClosure_closure_lcsBracket_eq_top (n : ℕ) {S : Set G}
    (hS : (Subgroup.closure S).topologicalClosure = ⊤) :
    (AddSubgroup.closure (Set.range fun sy : S × TauCeti.lcsGradedPiece G n ↦
      TauCeti.lcsBracket G 0 n
        (TauCeti.lcsGradedMk G 0 ⟨sy.1, TauCeti.mem_pLowerCentralSeries_zero 0 _⟩) sy.2)
      ).topologicalClosure = ⊤ :=
  TauCeti.topologicalClosure_closure_gradedBracket_eq_top n hS

/-- **Layer 3.3, the finite form.** In a compact group with a finite topological generating
family `s`, every element of `gr_{n+1}(G)` is `Σ_i [s̄_i, y_i]`. -/
theorem exists_sum_lcsBracket_eq [CompactSpace G] {ι : Type*} [Fintype ι] (n : ℕ) (s : ι → G)
    (hs : (Subgroup.closure (Set.range s)).topologicalClosure = ⊤)
    (z : TauCeti.lcsGradedPiece G (0 + n + 1)) :
    ∃ y : ι → TauCeti.lcsGradedPiece G n,
      ∑ i, TauCeti.lcsBracket G 0 n
        (TauCeti.lcsGradedMk G 0 ⟨s i, TauCeti.mem_pLowerCentralSeries_zero 0 _⟩) (y i) = z := by
  have : CompactSpace (TauCeti.pLowerCentralSeries 0 G n) :=
    isCompact_iff_compactSpace.mp (TauCeti.isClosed_pLowerCentralSeries n).isCompact
  exact TauCeti.exists_sum_gradedBracket_eq_of_range n s hs z

/-- **Layer 3.3, finite generation of the pieces** of a topologically finitely generated pro-`p`
group. -/
theorem module_finite_lcsGradedPiece [CompactSpace G] [TotallyDisconnectedSpace G] (p : ℕ)
    [Fact p.Prime] (hG : TauCeti.IsProP p G) (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (n : ℕ) :
    letI := hG.gradedPieceModule 0 n
    Module.Finite ℤ_[p] (TauCeti.lcsGradedPiece G n) :=
  hG.module_finite_lcsGradedPiece hfg n

end Generation

/-! ### 3.4 The free pro-`p` group -/

/-- **Layer 3.4, the detecting group.** Tau Ceti's Heisenberg group over `ℤ_p`. -/
abbrev HeisenbergZp (p : ℕ) [Fact p.Prime] : Type := TauCeti.HeisenbergGroup ℤ_[p]

section Heisenberg

variable (p : ℕ) [Fact p.Prime]

/-- **Layer 3.4.** The group law and the commutator formula are Tau Ceti's. -/
theorem HeisenbergZp.mul_def (a b : HeisenbergZp p) :
    a * b = ⟨a.x + b.x, a.y + b.y, a.z + b.z + a.x * b.y⟩ :=
  rfl

theorem HeisenbergZp.commutatorElement_eq (a b : HeisenbergZp p) :
    ⁅a, b⁆ = ⟨0, 0, a.x * b.y - b.x * a.y⟩ :=
  TauCeti.HeisenbergGroup.commutatorElement_eq a b

/-- **Layer 3.4.** The topology of `ℤ_p³`, a compact, totally disconnected topological group, and
pro-`p`. -/
example : IsTopologicalGroup (HeisenbergZp p) := inferInstance

example : CompactSpace (HeisenbergZp p) := inferInstance

example : TotallyDisconnectedSpace (HeisenbergZp p) := inferInstance

theorem HeisenbergZp.isProP : TauCeti.IsProP p (HeisenbergZp p) :=
  TauCeti.HeisenbergGroup.isProP_padicInt p

end Heisenberg

section FreeGraded

variable (p : ℕ) [Fact p.Prime] (r : ℕ)

/-- **Layer 3.4, detection.** For `i ≠ j` there is a continuous homomorphism
`F → HeisenbergZp p` with `x_i ↦ (1, 0, 0)`, `x_j ↦ (0, 1, 0)` and `x_k ↦ 1` otherwise. -/
theorem exists_heisenberg_detect {i j : Fin r} (hij : i ≠ j) :
    ∃ f : TauCeti.freeProP p (Fin r) →* HeisenbergZp p, Continuous f ∧
      f (TauCeti.freeProP.of i) = ⟨1, 0, 0⟩ ∧ f (TauCeti.freeProP.of j) = ⟨0, 1, 0⟩ ∧
      ∀ k, k ≠ i → k ≠ j → f (TauCeti.freeProP.of k) = 1 :=
  TauCeti.freeProP.exists_heisenberg_detect hij

/-- **Layer 3.4, degree zero.** `a ↦ Σ_i [x_i ^[p] a_i]` is a bijection
`(Fin r → ℤ_[p]) → gr_0(F)`. -/
theorem lcsGradedPiece_zero_freeProP_bijective :
    Function.Bijective fun a : Fin r → ℤ_[p] ↦
      ∑ i, TauCeti.lcsGradedMk (TauCeti.freeProP p (Fin r)) 0
        ⟨padicPow p (TauCeti.isProP_freeProP p (Fin r)) (TauCeti.freeProP.of i) (a i),
          TauCeti.mem_pLowerCentralSeries_zero 0 _⟩ :=
  TauCeti.lcsGradedPiece_zero_freeProP_bijective p (Fin r)

/-- **Layer 3.4.** Through `lcsGradedPieceZeroEquiv`, the topological abelianization of `F` is
`ℤ_p ^ r`. -/
theorem topologicalAbelianization_freeProP_bijective :
    Function.Bijective fun a : Fin r → ℤ_[p] ↦
      ∑ i, Additive.ofMul
        ((padicPow p (TauCeti.isProP_freeProP p (Fin r)) (TauCeti.freeProP.of i) (a i) :
          TauCeti.freeProP p (Fin r)) :
          TopologicalAbelianization (TauCeti.freeProP p (Fin r))) := by
  convert TauCeti.lcsGradedPieceZeroEquiv.bijective.comp
    (lcsGradedPiece_zero_freeProP_bijective p r) using 1
  funext a
  simp only [Function.comp_apply, map_sum]
  refine Finset.sum_congr rfl fun i _ ↦ (lcsGradedPieceZeroEquiv_mk _).symm

/-- **Layer 3.4, degree one.** `c ↦ Σ_{i<j} [⁅x_i, x_j⁆ ^[p] c_ij]` is a bijection onto
`gr_1(F)`. -/
theorem lcsGradedPiece_one_freeProP_bijective :
    Function.Bijective fun c : {ij : Fin r × Fin r // ij.1 < ij.2} → ℤ_[p] ↦
      ∑ ij, TauCeti.gradedMk 0 (TauCeti.freeProP p (Fin r)) 1
        ⟨padicPow p (TauCeti.isProP_freeProP p (Fin r))
            ⁅(TauCeti.freeProP.of ij.1.1 : TauCeti.freeProP p (Fin r)),
              TauCeti.freeProP.of ij.1.2⁆ (c ij), by
          refine padicPow_mem p _ (TauCeti.isClosed_pLowerCentralSeries 1) ?_ _
          exact TauCeti.commutator_closedLowerCentralSeries_le 0 0
            (Subgroup.commutator_mem_commutator (TauCeti.mem_pLowerCentralSeries_zero 0 _)
              (TauCeti.mem_pLowerCentralSeries_zero 0 _))⟩ :=
  TauCeti.lcsGradedPiece_one_freeProP_bijective p (Fin r)

/-- **Layer 3.4, nonvanishing.** `[x̄_i, x̄_j] ≠ 0` in `gr_1(F)` for `i ≠ j`. -/
theorem lcsBracket_freeProP_ne_zero {i j : Fin r} (hij : i ≠ j) :
    TauCeti.lcsBracket (TauCeti.freeProP p (Fin r)) 0 0
        (TauCeti.lcsGradedMk _ 0 ⟨TauCeti.freeProP.of i, TauCeti.mem_pLowerCentralSeries_zero 0 _⟩)
        (TauCeti.lcsGradedMk _ 0 ⟨TauCeti.freeProP.of j, TauCeti.mem_pLowerCentralSeries_zero 0 _⟩)
      ≠ 0 :=
  TauCeti.lcsBracket_freeProP_ne_zero hij

end FreeGraded

/-! ## Worked examples -/

section WorkedExamples

/-- **Worked example.** `ω_2` at the levels `2 ^ k` is `1`. -/
theorem toZMod_two_pow_idem_two (k : ℕ) :
    TauCeti.zHat.toZMod ⟨2 ^ k, pow_pos two_pos k⟩ (TauCeti.zHat.idem.{0} 2) = 1 :=
  zHat.toZMod_idem_pow 2 k

/-- At an odd level `ω_2` is `0`. -/
theorem toZMod_idem_two_of_odd {n : ℕ+} (hn : Odd (n : ℕ)) :
    TauCeti.zHat.toZMod n (TauCeti.zHat.idem.{0} 2) = 0 :=
  zHat.toZMod_idem_of_not_dvd 2 (Nat.two_dvd_ne_zero.mpr (Nat.odd_iff.mp hn))

/-- In particular `ω_2 ≡ 3 (mod 6)`. -/
theorem toZMod_six_idem_two :
    TauCeti.zHat.toZMod 6 (TauCeti.zHat.idem.{0} 2) = 3 := by
  have h2 := (zHat.castHom_toZMod (m := 6) (n := 2) (by norm_num) (TauCeti.zHat.idem.{0} 2)).trans
    (TauCeti.zHat.toZMod_idem_of_dvd_pow 2 (n := 2) (k := 1) (by norm_num))
  have h3 := (zHat.castHom_toZMod (m := 6) (n := 3) (by norm_num) (TauCeti.zHat.idem.{0} 2)).trans
    (zHat.toZMod_idem_of_not_dvd 2 (n := 3) (by norm_num))
  generalize TauCeti.zHat.toZMod 6 (TauCeti.zHat.idem.{0} 2) = y at h2 h3
  revert y
  decide

/-- **Worked example.** In `Multiplicative ℤ_[3]`, `ofAdd 1 ^ᶻ a = ofAdd (component 3 a)`. -/
theorem ofAdd_one_zpowHat_padicInt_three (a : ẑ) :
    Multiplicative.ofAdd (1 : ℤ_[3]) ^ᶻ a = Multiplicative.ofAdd (TauCeti.zHat.component 3 a) := by
  rw [zpowHat_eq_padicPow_component 3 (TauCeti.isProP_multiplicative_padicInt 3)]
  exact TauCeti.IsProP.padicPow_ofAdd_one_padicInt 3 _

/-- **Worked example.** In `Multiplicative (ZMod 6)`, `x ^ᶻ a = x ^ (toZMod 6 a).val`, so
`x ^ᶻ ω_2 = x ^ 3`, the `2`-component of `x` under `ZMod 6 ≃ ZMod 2 × ZMod 3`. -/
theorem zpowHat_zmod_six (x : Multiplicative (ZMod 6)) (a : ẑ) :
    x ^ᶻ a = x ^ (TauCeti.zHat.toZMod 6 a).val :=
  zpowHat_eq_pow_val_toZMod (m := 6) (by revert x; decide) a

theorem zpowHat_idem_two_zmod_six (x : Multiplicative (ZMod 6)) :
    x ^ᶻ TauCeti.zHat.idem.{0} 2 = x ^ 3 := by
  rw [zpowHat_zmod_six, toZMod_six_idem_two]
  rfl

/-- **Worked example.** `ContinuousAut (Multiplicative ℤ_[p]) ≃* ℤ_[p]ˣ`: Tau Ceti's
identification of the automorphisms of a free pro-`p` group of rank one, along
`freeProP.equivPadicInt`. The image of `φ` is the unit `u` with `φ (ofAdd 1) = ofAdd u`. -/
noncomputable def continuousAutPadicIntEquivUnits (p : ℕ) [Fact p.Prime] :
    TauCeti.ContinuousAut (Multiplicative ℤ_[p]) ≃* ℤ_[p]ˣ :=
  (TauCeti.Peripheral.continuousAutEquivUnits (TauCeti.isProP_multiplicative_padicInt p)
    (TauCeti.freeProP.equivPadicInt p (Fin 1)).symm).toMulEquiv

theorem continuousAutPadicIntEquivUnits_eq_iff (p : ℕ) [Fact p.Prime]
    (φ : TauCeti.ContinuousAut (Multiplicative ℤ_[p])) (u : ℤ_[p]ˣ) :
    continuousAutPadicIntEquivUnits p φ = u ↔
      φ (Multiplicative.ofAdd 1) = Multiplicative.ofAdd (u : ℤ_[p]) := by
  have hb : TauCeti.Peripheral.basis (TauCeti.freeProP.equivPadicInt p (Fin 1)).symm 0
      = Multiplicative.ofAdd 1 := by
    rw [TauCeti.Peripheral.basis_apply, ContinuousMulEquiv.symm_symm,
      TauCeti.freeProP.equivPadicInt_of]
  have h := TauCeti.Peripheral.continuousAutEquivUnits_eq_iff
    (TauCeti.isProP_multiplicative_padicInt p) (TauCeti.freeProP.equivPadicInt p (Fin 1)).symm φ u
  rw [hb, TauCeti.IsProP.padicPow_ofAdd_one_padicInt] at h
  exact h

/-- `ContinuousOut` of an abelian group is `ContinuousAut`. -/
noncomputable example (G : Type u) [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G] :
    TauCeti.ContinuousOut G ≃* TauCeti.ContinuousAut G :=
  TauCeti.ContinuousOut.mulEquivOfIsMulCommutative

variable (p : ℕ) [Fact p.Prime]

/-- **Worked example**, `F = freeProP p (Fin 2)`: `ContinuousAut F →* GL_2(𝔽_p)` is surjective. -/
theorem continuousAutToGL_fin_two_surjective :
    Function.Surjective (TauCeti.freeProP.continuousAutToGL p (Fin 2)) :=
  TauCeti.freeProP.continuousAutToGL_surjective

/-- `gr_0(F) = ℤ_p ^ 2`. -/
theorem lcsGradedPiece_zero_freeProP_fin_two_bijective :
    Function.Bijective fun a : Fin 2 → ℤ_[p] ↦
      ∑ i, TauCeti.lcsGradedMk (TauCeti.freeProP p (Fin 2)) 0
        ⟨padicPow p (TauCeti.isProP_freeProP p (Fin 2)) (TauCeti.freeProP.of i) (a i),
          TauCeti.mem_pLowerCentralSeries_zero 0 _⟩ :=
  lcsGradedPiece_zero_freeProP_bijective p 2

/-- `gr_1(F) = ℤ_p [x̄_0, x̄_1]`: `c ↦ [⁅x_0, x_1⁆ ^[p] c]` is a bijection `ℤ_[p] → gr_1(F)`. -/
theorem lcsGradedPiece_one_freeProP_fin_two_bijective :
    Function.Bijective fun c : ℤ_[p] ↦
      TauCeti.gradedMk 0 (TauCeti.freeProP p (Fin 2)) 1
        ⟨padicPow p (TauCeti.isProP_freeProP p (Fin 2))
            ⁅(TauCeti.freeProP.of 0 : TauCeti.freeProP p (Fin 2)), TauCeti.freeProP.of 1⁆ c, by
          refine padicPow_mem p _ (TauCeti.isClosed_pLowerCentralSeries 1) ?_ _
          exact TauCeti.commutator_closedLowerCentralSeries_le 0 0
            (Subgroup.commutator_mem_commutator (TauCeti.mem_pLowerCentralSeries_zero 0 _)
              (TauCeti.mem_pLowerCentralSeries_zero 0 _))⟩ := by
  let i₀ : {ij : Fin 2 × Fin 2 // ij.1 < ij.2} := ⟨(0, 1), by decide⟩
  have hu : ∀ ij : {ij : Fin 2 × Fin 2 // ij.1 < ij.2}, ij = i₀ := by decide
  let _ : Unique {ij : Fin 2 × Fin 2 // ij.1 < ij.2} := ⟨⟨i₀⟩, hu⟩
  convert (lcsGradedPiece_one_freeProP_bijective p 2).comp
    (Equiv.funUnique {ij : Fin 2 × Fin 2 // ij.1 < ij.2} ℤ_[p]).symm.bijective using 1
  funext c
  rw [Function.comp_apply, Fintype.sum_unique]
  rfl

end WorkedExamples

/-! ## Names kept for the PeripheralActions contract

PeripheralActions' README lists these names from this roadmap's namespace in its dependency
contract. They keep the old file's signatures and are closed by the Tau Ceti declarations. -/

section Compatibility

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]

/-- Tau Ceti's `TauCeti.IsProP.padicPow_one`. -/
theorem padicPow_one (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G) :
    padicPow ℓ hG x 1 = x :=
  hG.padicPow_one x

/-- Unit powers are injective: Tau Ceti's `TauCeti.IsProP.padicPow_left_injective`. -/
theorem padicPow_units_injective (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G)
    (u : ℤ_[ℓ]ˣ) : Function.Injective (fun x : G => padicPow ℓ hG x u) :=
  hG.padicPow_left_injective u

/-- On a pro-`ℓ` group `ω_ℓ` acts as the identity exponent: Tau Ceti's
`TauCeti.zpowHat_idem_of_isProP`. -/
theorem zpowHat_idem_of_isProP (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G) :
    x ^ᶻ TauCeti.zHat.idem.{0} ℓ = x :=
  TauCeti.zpowHat_idem_of_isProP hG x

end Compatibility

section CompatibilityLCS

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Commutators raise the degree: Tau Ceti's `TauCeti.commutator_closedLowerCentralSeries_le`. -/
theorem commutator_mem_closedLowerCentralSeries (j k : ℕ) {x y : G}
    (hx : x ∈ TauCeti.closedLowerCentralSeries G j)
    (hy : y ∈ TauCeti.closedLowerCentralSeries G k) :
    ⁅x, y⁆ ∈ TauCeti.closedLowerCentralSeries G (j + k + 1) :=
  TauCeti.commutator_closedLowerCentralSeries_le j k (Subgroup.commutator_mem_commutator hx hy)

/-- Additivity of the bracket in the first variable: `lcsBracket` is bundled biadditive. -/
theorem lcsBracket_add_left (j k : ℕ) (x x' : TauCeti.lcsGradedPiece G j)
    (y : TauCeti.lcsGradedPiece G k) :
    TauCeti.lcsBracket G j k (x + x') y
      = TauCeti.lcsBracket G j k x y + TauCeti.lcsBracket G j k x' y := by
  simp only [map_add, AddMonoidHom.add_apply]

theorem lcsBracket_add_right (j k : ℕ) (x : TauCeti.lcsGradedPiece G j)
    (y y' : TauCeti.lcsGradedPiece G k) :
    TauCeti.lcsBracket G j k x (y + y')
      = TauCeti.lcsBracket G j k x y + TauCeti.lcsBracket G j k x y' :=
  map_add _ y y'

/-- The finite form of the spanning theorem, in the old file's `List.ofFn` form:
`exists_sum_lcsBracket_eq` reindexed along `Fintype.equivFin`. -/
theorem lcsGradedPiece_eq_sum_bracket [CompactSpace G] {ι : Type} [Fintype ι] (s : ι → G)
    (hs : (Subgroup.closure (Set.range s)).topologicalClosure = ⊤) (n : ℕ)
    (z : TauCeti.lcsGradedPiece G (0 + n + 1)) :
    ∃ y : Fin (Fintype.card ι) → TauCeti.lcsGradedPiece G n,
      z = (List.ofFn fun i => TauCeti.lcsBracket G 0 n
        (TauCeti.lcsGradedMk G 0 ⟨s ((Fintype.equivFin ι).symm i),
          TauCeti.mem_pLowerCentralSeries_zero 0 _⟩) (y i)).sum := by
  obtain ⟨y, hy⟩ := exists_sum_lcsBracket_eq n s hs z
  refine ⟨y ∘ (Fintype.equivFin ι).symm, ?_⟩
  rw [List.sum_ofFn, ← hy]
  exact (Equiv.sum_comp (Fintype.equivFin ι).symm
    (fun i => TauCeti.lcsBracket G 0 n
      (TauCeti.lcsGradedMk G 0 ⟨s i, TauCeti.mem_pLowerCentralSeries_zero 0 _⟩) (y i))).symm

end CompatibilityLCS

end TauCetiRoadmap.ProfiniteArithmetic
