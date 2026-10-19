import Mathlib
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic

/-!
# Weights in étale cohomology: representative target signatures

This file records suggested forms and is not exhaustive. README.md is definitive.
The statements give forms statable against the pinned APIs for arithmetic cohomology
and eigenform applications, with geometric Frobenius and contragredient duals.

The representation, polynomial and matrix interfaces below use Mathlib directly.
Inertia groups, Frobenius lifts and residue cardinalities are supplied parameters;
they do not construct continuous Galois representations or arithmetic places.
The arithmetic and geometric comparisons require the supplier interfaces stated
in README.md. Targets whose carriers are unavailable are listed at the end;
no arbitrary proposition or mock cohomology carrier replaces them.
The declarations use the pinned Mathlib carriers and light definitions with real bodies.
-/
open Polynomial
open scoped TensorProduct

namespace TauCeti.Weights

/-! ## Layer R34.1: exceptional-set weights and numerical checks -/

namespace GaloisRep
section Predicates
variable {E G V P : Type*} [Field E]
  [Group G] [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- All-embeddings purity on a splitting coefficient field admitting a complex embedding.
The arithmetic adapter supplies continuity and actual local Galois data. -/
def IsPureOutside [CharZero E] [Algebra ℚ E] [IsAlgClosed E]
    [Nonempty (E →+* ℂ)] (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ) : Prop :=
  ∀ v ∉ T, (∀ g ∈ I v, ρ g = 1) ∧
    ∀ α : E, (ρ (F v)).charpoly.IsRoot α →
      IsIntegral ℚ α ∧ ∀ ι : E →+* ℂ,
        ‖ι α‖ = Real.rpow (q v : ℝ) ((w : ℝ) / 2)

/-- Rational integral coefficients are stronger than algebraic-integral roots. -/
def HasIntegralFrobOutside [CharZero E] [Algebra ℚ E] (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (T : Set P) : Prop :=
  ∀ v ∉ T, (∀ g ∈ I v, ρ g = 1) ∧
    ∃ Q : ℤ[X], Q.map (Int.castRingHom E) = (ρ (F v)).charpoly

/-- The chosen-embedding predicate deliberately makes no algebraicity assertion. -/
def IsIotaPureOutside [CharZero E] [Algebra ℚ E] [IsAlgClosed E] (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (ι : E →+* ℂ) (w : ℝ) : Prop :=
  ∀ v ∉ T, (∀ g ∈ I v, ρ g = 1) ∧
    ∀ α : E, (ρ (F v)).charpoly.IsRoot α →
      ‖ι α‖ = Real.rpow (q v : ℝ) (w / 2)

/-- Positive rank and one nonexceptional place of size greater than one determine the weight. -/
theorem IsPureOutside.weight_unique [CharZero E] [Algebra ℚ E] [IsAlgClosed E]
    [Nonempty (E →+* ℂ)] (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w w' : ℤ)
    (hv : 0 < Module.finrank E V) (v : P) (hout : v ∉ T) (hq : 1 < q v)
    (ι : E →+* ℂ) (h : IsPureOutside ρ I F q T w)
    (h' : IsPureOutside ρ I F q T w') : w = w' := by
  sorry

/-- R34.1: purity expands into unramifiedness, algebraicity and all-embedding norms. -/
theorem isPureOutside_iff [CharZero E] [Algebra ℚ E] [IsAlgClosed E]
    [Nonempty (E →+* ℂ)] (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ) :
    IsPureOutside ρ I F q T w ↔
      ∀ v ∉ T, (∀ g ∈ I v, ρ g = 1) ∧
        ∀ α : E, (ρ (F v)).charpoly.IsRoot α →
          IsIntegral ℚ α ∧ ∀ ι : E →+* ℂ,
            ‖ι α‖ = Real.rpow (q v : ℝ) ((w : ℝ) / 2) := Iff.rfl

/-- R34.1: integral Frobenius polynomials have integer coefficient preimages. -/
theorem hasIntegralFrobOutside_iff [CharZero E] [Algebra ℚ E]
    (ρ : Representation E G V) (I : P → Subgroup G) (F : P → G) (T : Set P) :
    HasIntegralFrobOutside ρ I F T ↔
      ∀ v ∉ T, (∀ g ∈ I v, ρ g = 1) ∧
        ∃ Q : ℤ[X], Q.map (Int.castRingHom E) = (ρ (F v)).charpoly := Iff.rfl

/-- R34.1: chosen-embedding purity asserts unramifiedness and the specified root norms. -/
theorem isIotaPureOutside_iff [CharZero E] [Algebra ℚ E] [IsAlgClosed E]
    (ρ : Representation E G V) (I : P → Subgroup G) (F : P → G) (q : P → ℕ)
    (T : Set P) (ι : E →+* ℂ) (w : ℝ) :
    IsIotaPureOutside ρ I F q T ι w ↔
      ∀ v ∉ T, (∀ g ∈ I v, ρ g = 1) ∧
        ∀ α : E, (ρ (F v)).charpoly.IsRoot α →
          ‖ι α‖ = Real.rpow (q v : ℝ) (w / 2) := Iff.rfl

/-- R34.1: enlarging the exceptional set preserves purity at the same weight. -/
theorem IsPureOutside.mono [CharZero E] [Algebra ℚ E] [IsAlgClosed E]
    [Nonempty (E →+* ℂ)] {ρ : Representation E G V} {I : P → Subgroup G}
    {F : P → G} {q : P → ℕ} {T T' : Set P} {w : ℤ}
    (h : IsPureOutside ρ I F q T w) (hTT' : T ⊆ T') :
    IsPureOutside ρ I F q T' w :=
  fun v hv => h v (fun hmem => hv (hTT' hmem))

/-- R34.1: enlarging the exceptional set preserves integral Frobenius polynomials. -/
theorem HasIntegralFrobOutside.mono [CharZero E] [Algebra ℚ E]
    {ρ : Representation E G V} {I : P → Subgroup G} {F : P → G} {T T' : Set P}
    (h : HasIntegralFrobOutside ρ I F T) (hTT' : T ⊆ T') :
    HasIntegralFrobOutside ρ I F T' :=
  fun v hv => h v (fun hmem => hv (hTT' hmem))

/-- R34.1: enlarging the exceptional set preserves the chosen embedding and weight. -/
theorem IsIotaPureOutside.mono [CharZero E] [Algebra ℚ E] [IsAlgClosed E]
    {ρ : Representation E G V} {I : P → Subgroup G} {F : P → G} {q : P → ℕ}
    {T T' : Set P} {ι : E →+* ℂ} {w : ℝ}
    (h : IsIotaPureOutside ρ I F q T ι w) (hTT' : T ⊆ T') :
    IsIotaPureOutside ρ I F q T' ι w :=
  fun v hv => h v (fun hmem => hv (hTT' hmem))

/-- R34.1: all-embeddings purity supplies purity for each chosen complex embedding. -/
theorem IsPureOutside.iota [CharZero E] [Algebra ℚ E] [IsAlgClosed E]
    [Nonempty (E →+* ℂ)] {ρ : Representation E G V} {I : P → Subgroup G}
    {F : P → G} {q : P → ℕ} {T : Set P} {w : ℤ}
    (h : IsPureOutside ρ I F q T w) (ι : E →+* ℂ) :
    IsIotaPureOutside ρ I F q T ι (w : ℝ) :=
  fun v hv => ⟨(h v hv).1, fun α hα => ((h v hv).2 α hα).2 ι⟩

end Predicates

section Milestones
variable {E G V W P : Type*} [Field E] [CharZero E] [Algebra ℚ E]
  [IsAlgClosed E] [Nonempty (E →+* ℂ)] [Group G]
  [AddCommGroup V] [Module E V] [FiniteDimensional E V]
  [AddCommGroup W] [Module E W] [FiniteDimensional E W]

/-- R34.1, Every embedding and a chosen embedding: testing every embedding also forces
algebraicity of the roots. -/
theorem isPureOutside_iff_forall_iota (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ) :
    IsPureOutside ρ I F q T w ↔
      ∀ ι : E →+* ℂ, IsIotaPureOutside ρ I F q T ι (w : ℝ) := by
  sorry

/-- R34.1, Linear algebra operations: invariant subspaces inherit the ambient purity. -/
theorem IsPureOutside.subrepresentation (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ)
    (U : Submodule E V) (hU : ∀ g, U ≤ U.comap (ρ g))
    (h : IsPureOutside ρ I F q T w) :
    IsPureOutside (ρ.subrepresentation U hU) I F q T w := by
  sorry

/-- R34.1, Linear algebra operations: invariant quotients inherit the ambient purity. -/
theorem IsPureOutside.quotient (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ)
    (U : Submodule E V) (hU : ∀ g, U ≤ U.comap (ρ g))
    (h : IsPureOutside ρ I F q T w) :
    IsPureOutside (ρ.quotient U hU) I F q T w := by
  sorry

/-- R34.1, Linear algebra operations: an unramified extension is pure exactly when
its subrepresentation and quotient have that weight. -/
theorem pureOutside_iff_subrepresentation_quotient (ρ : Representation E G V)
    (I : P → Subgroup G) (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ)
    (U : Submodule E V) (hU : ∀ g, U ≤ U.comap (ρ g))
    (hunram : ∀ v ∉ T, ∀ g ∈ I v, ρ g = 1) :
    IsPureOutside ρ I F q T w ↔
      IsPureOutside (ρ.subrepresentation U hU) I F q T w ∧
        IsPureOutside (ρ.quotient U hU) I F q T w := by
  sorry

/-- R34.1, Linear algebra operations: direct sums preserve a common weight. -/
theorem IsPureOutside.prod (ρ : Representation E G V) (σ : Representation E G W)
    (I : P → Subgroup G) (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ)
    (hρ : IsPureOutside ρ I F q T w) (hσ : IsPureOutside σ I F q T w) :
    IsPureOutside (ρ.prod σ) I F q T w := by
  sorry

/-- R34.1, Linear algebra operations: tensor products add geometric weights. -/
theorem IsPureOutside.tprod (ρ : Representation E G V) (σ : Representation E G W)
    (I : P → Subgroup G) (F : P → G) (q : P → ℕ) (T : Set P) (w w' : ℤ)
    (hq : ∀ v ∉ T, 1 < q v)
    (hρ : IsPureOutside ρ I F q T w) (hσ : IsPureOutside σ I F q T w') :
    IsPureOutside (ρ.tprod σ) I F q T (w + w') := by
  sorry

/-- R34.6, Transport through actual arithmetic comparisons: an intertwining linear
isomorphism transports purity on the supplied local data. -/
theorem isPureOutside_iff_of_equiv (ρ : Representation E G V) (σ : Representation E G W)
    (I : P → Subgroup G) (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ)
    (e : V ≃ₗ[E] W) (he : ∀ g, e.toLinearMap.comp (ρ g) = (σ g).comp e.toLinearMap) :
    IsPureOutside ρ I F q T w ↔ IsPureOutside σ I F q T w := by
  sorry

/-- R34.6, Eigenform purity and the Ramanujan bound: purity bounds every embedded
Frobenius trace by the rank times the common root modulus. -/
theorem IsPureOutside.trace_bound (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ)
    (h : IsPureOutside ρ I F q T w) (ι : E →+* ℂ) (v : P) (hv : v ∉ T) :
    ‖ι (LinearMap.trace E V (ρ (F v)))‖ ≤
      (Module.finrank E V : ℝ) * Real.rpow (q v : ℝ) ((w : ℝ) / 2) := by
  sorry
end Milestones

section IntegralMilestones
variable {E G V W P : Type*} [Field E] [CharZero E] [Algebra ℚ E] [Group G]
  [AddCommGroup V] [Module E V] [FiniteDimensional E V]
  [AddCommGroup W] [Module E W] [FiniteDimensional E W]

/-- R34.1, Rational integrality: direct sums preserve integer Frobenius polynomials. -/
theorem HasIntegralFrobOutside.prod (ρ : Representation E G V) (σ : Representation E G W)
    (I : P → Subgroup G) (F : P → G) (T : Set P)
    (hρ : HasIntegralFrobOutside ρ I F T) (hσ : HasIntegralFrobOutside σ I F T) :
    HasIntegralFrobOutside (ρ.prod σ) I F T := by
  sorry

/-- R34.1, Rational integrality: tensor products preserve integer Frobenius polynomials. -/
theorem HasIntegralFrobOutside.tprod (ρ : Representation E G V) (σ : Representation E G W)
    (I : P → Subgroup G) (F : P → G) (T : Set P)
    (hρ : HasIntegralFrobOutside ρ I F T) (hσ : HasIntegralFrobOutside σ I F T) :
    HasIntegralFrobOutside (ρ.tprod σ) I F T := by
  sorry

/-- R34.1, Rational integrality: a rational invariant factor of an integer polynomial
has integer coefficients. -/
theorem hasIntegralFrobOutside_subrepresentation (ρ : Representation E G V)
    (I : P → Subgroup G) (F : P → G) (T : Set P)
    (U : Submodule E V) (hU : ∀ g, U ≤ U.comap (ρ g))
    (h : HasIntegralFrobOutside ρ I F T)
    (hrat : ∀ v ∉ T, ∃ Q : ℚ[X],
      Q.map (algebraMap ℚ E) = ((ρ.subrepresentation U hU) (F v)).charpoly) :
    HasIntegralFrobOutside (ρ.subrepresentation U hU) I F T := by
  sorry
end IntegralMilestones
end GaloisRep
open GaloisRep

/-- R34.1, Continuous Frobenius eigenvalues: on the profinite-integer presentation of
the finite-field Galois group, a unit determines a unique continuous character.
The generator is identified with geometric Frobenius. -/
theorem finite_field_unit_character (ℓ : ℕ) [Fact ℓ.Prime] (u : ℤ_[ℓ]ˣ) :
    ∃! χ : TauCeti.zHat.{0} →ₜ* ℤ_[ℓ]ˣ, χ TauCeti.zHat.gen = u := by
  sorry

/-- R34.1, Continuous Frobenius eigenvalues need not be algebraic: a continuous
rank-one character has a transcendental geometric Frobenius eigenvalue. -/
theorem continuous_frobenius_not_algebraic (ℓ : ℕ) [Fact ℓ.Prime] :
    ∃ χ : TauCeti.zHat.{0} →ₜ* ℤ_[ℓ]ˣ,
      ¬ IsIntegral ℚ (((χ TauCeti.zHat.gen) : ℤ_[ℓ]) : ℚ_[ℓ]) := by
  sorry

/-- The scalar representation on a complex line used in the convention checks. -/
noncomputable abbrev scalarRep : Representation ℂ ℂˣ ℂ :=
  Representation.ofDistribMulAction ℂ ℂˣ ℂ

/-- Duality negates geometric weight, retaining the unramified condition. -/
theorem pureOutside_dual {G V P : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ)
    (_hq : ∀ v ∉ T, 1 < q v) (h : IsPureOutside ρ I F q T w) :
    IsPureOutside (Representation.dual ρ) I F q T (-w) := by
  sorry

-- Rational-integrality is not stable under an arbitrary invariant summand.
/-- An invariant line of an integer-polynomial operator need not have a rational polynomial. -/
theorem integer_charpoly_factor_nonexample :
    ∃ α : ℂ, α ^ 2 = 2 ∧
      (X - C α) * (X + C α) = (X ^ 2 - C 2 : ℂ[X]) ∧
      ¬ ∃ Q : ℤ[X], Q.map (Int.castRingHom ℂ) = X - C α := by
  sorry

-- At an inert quadratic place, induction of the trivial character has roots ±1.
/-- The inert quadratic permutation block has characteristic roots one and minus one. -/
theorem charpoly_induced_inert_trivial :
    (!![(0 : ℚ), 1; 1, 0]).charpoly = X ^ 2 - 1 := by
  sorry

/-- Complex eigenvalues need not be algebraic over the rationals. -/
theorem transcendental_not_pure : ∃ α : ℂ, ¬ IsIntegral ℚ α := by
  sorry

-- The same irreducible rational polynomial has unit-circle and non-unit-circle
-- conjugates. Its algebraic-unit root gives the finite-field character in R34.1;
-- this numerical core does not assert a globally pure number-field character.
/-- An irreducible rational polynomial has both unit-circle and larger-modulus conjugates. -/
theorem chosen_embedding_integer_weight_nonexample :
    Irreducible (X ^ 4 - X ^ 3 - X ^ 2 - X + 1 : ℚ[X]) ∧
      ∃ α β : ℂ, (X ^ 4 - X ^ 3 - X ^ 2 - X + 1 : ℂ[X]).IsRoot α ∧
        (X ^ 4 - X ^ 3 - X ^ 2 - X + 1 : ℂ[X]).IsRoot β ∧
          ‖α‖ = 1 ∧ 1 < ‖β‖ := by
  sorry

/-- R34.1, Every embedding and a chosen embedding: the quartic algebraic-unit
character has chosen-embedding weight zero without all-embeddings purity. -/
theorem chosen_embedding_purity_nonexample : ∃ α : ℂˣ,
    (X ^ 4 - X ^ 3 - X ^ 2 - X + 1 : ℂ[X]).IsRoot (α : ℂ) ∧
    IsIotaPureOutside scalarRep (fun _ : Unit => ⊥)
      (fun _ => α) (fun _ => 3) ∅ (RingHom.id ℂ) 0 ∧
    ¬ IsPureOutside scalarRep (fun _ : Unit => ⊥)
      (fun _ => α) (fun _ => 3) ∅ 0 := by
  sorry

/-- All-embeddings purity specializes to any chosen complex embedding. -/
theorem pureOutside_implies_iota {G V P : Type*} [Group G] [AddCommGroup V]
    [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    (I : P → Subgroup G) (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ)
    (ι : ℂ →+* ℂ) (h : IsPureOutside ρ I F q T w) :
    IsIotaPureOutside ρ I F q T ι (w : ℝ) := by
  sorry

/-! ## Layer R34.2: Tate/H¹ variance and good-reduction traces -/

/-- The geometric action on the dual is the transpose of the arithmetic action. -/
theorem tate_h1_inverse_dual {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ G V) (F : G) :
    ((Representation.dual ρ) F⁻¹).charpoly = (ρ F).charpoly := by
  sorry

/-- The geometric Tate constant coefficient at positive dimension is not an integer. -/
theorem positive_dimension_tate_constant (q g : ℕ) (hq : 1 < q) (hg : 0 < g) :
    ¬ ∃ z : ℤ, (z : ℚ) = (q : ℚ) ^ (-(g : ℤ)) := by
  sorry

/-- The elliptic curve y²=x³−x over F₅ has seven affine points and one point at infinity. -/
theorem card_points_y2_eq_x3_sub_x_F5 :
    (Finset.univ.filter (fun p : ZMod 5 × ZMod 5 => p.2 ^ 2 = p.1 ^ 3 - p.1)).card + 1 = 8 := by
  decide

/-- Trace squared minus twice the determinant gives the trace of the second power. -/
theorem elliptic_second_power_trace (α β a q : ℂ) (ht : α + β = a)
    (hd : α * β = q) : α ^ 2 + β ^ 2 = a ^ 2 - 2 * q := by
  sorry

/-! ## Layer R34.3: geometric monodromy normalization -/

/-- Nodal monodromy sends the vanishing direction to the graph direction,
kills the graph direction and scales by q⁻¹ under geometric Frobenius. -/
theorem nodal_monodromy_scaling (q : ℚ) (hq : q ≠ 0) :
    let F : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 0, q]
    let Finv : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 0, q⁻¹]
    let N : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    F * N * Finv = q⁻¹ • N ∧ N * N = 0 ∧
      N.mulVec ![0, 1] = ![1, 0] ∧ N.mulVec ![1, 0] = 0 := by
  sorry

/-! ## Layer R34.5: degree and Tate-twist checks -/

/-- Symmetric degree k−2 and curve degree one give weight k−1. -/
theorem parabolic_degree_weight (k : ℤ) : (k - 2) + 1 = k - 1 := by
  sorry

/-- The arithmetic Lefschetz twist makes the source and target weights equal. -/
theorem hard_lefschetz_target_weight (d a : ℤ) : d + a - 2 * a = d - a := by
  sorry

/-! ## Layer R34.6: trace bounds and the local twist -/

/-- Common alternating and outer traces give a common degree-one trace through both
coefficient maps. The arithmetic application supplies the outer trace comparisons. -/
theorem degree_one_trace_from_alternating {L E E' : Type*}
    [CommRing L] [CommRing E] [CommRing E'] (iotaLambda : L →+* E) (iotaMu : L →+* E')
    (t₀ t₂ t_alt : L) (u : Fin 3 → E) (v : Fin 3 → E')
    (hu₀ : u 0 = iotaLambda t₀) (hu₂ : u 2 = iotaLambda t₂)
    (hv₀ : v 0 = iotaMu t₀) (hv₂ : v 2 = iotaMu t₂)
    (hu : u 0 - u 1 + u 2 = iotaLambda t_alt)
    (hv : v 0 - v 1 + v 2 = iotaMu t_alt) :
    u 1 = iotaLambda (t₀ + t₂ - t_alt) ∧ v 1 = iotaMu (t₀ + t₂ - t_alt) := by
  constructor
  · rw [map_sub, map_add, ← hu₀, ← hu₂, ← hu]
    ring
  · rw [map_sub, map_add, ← hv₀, ← hv₂, ← hv]
    ring

/-- Two roots of the same modulus give the rank-two Ramanujan trace bound. -/
theorem ramanujan_trace_bound (α β : ℂ) (R : ℝ) (hα : ‖α‖ = R) (hβ : ‖β‖ = R) :
    ‖α + β‖ ≤ 2 * R := by
  sorry

/-- Equal root moduli do not determine a characteristic polynomial. -/
theorem equal_root_norms_not_same_polynomial :
    ‖(1 : ℂ)‖ = ‖(-1 : ℂ)‖ ∧ (X - 1 : ℂ[X]) ≠ X + 1 := by
  sorry

/-- A Tate twist lowers the upper rank-two monodromy weight to the lower weight. -/
theorem local_monodromy_twist_weight (w : ℤ) : (w - 1 + 1) - 2 = w - 2 := by
  sorry

/-! README targets over arithmetic and geometric carriers:
R34.1/purity-under-restriction-and-induction: continuous Galois induction and local places.
R34.1/purity-under-linear-algebra-operations: full arithmetic subquotient/tensor/Tate interfaces.
R34.1/frobenius-eigenvalues-need-not-be-algebraic: continuous character of Gal(F_qbar/F_q).
R34.1/representation-sheaf-weight-comparison: actual lisse sheaf and π₁ correspondence.
R34.1/arithmetic-complex-weight-normalization: smooth finite-field scheme, ℓ invertible, lisse
cohomology of a bounded constructible adic complex and Verdier duality.
R34.2/frobenius-on-tate-modules-and-first-cohomology: actual Tate module and étale H¹ duality.
R34.2/purity-of-tate-modules-with-good-reduction: smooth proper specialization and exterior powers.
R34.2/good-reduction-point-counts-and-traces: Frobenius on the reduction of an abelian variety.
R34.2/curve-traces-over-all-residue-extensions: unpointed curve/Jacobian H¹ comparison,
translation invariance and Frobenius-equivariant cohomological trace.
R34.3/proper-trait-specialization-comparison: proper trait, finite-level nearby cycles and R lim.
R34.3/nodal-modular-curve-comparison: named integral curve, normalization and dual graph.
R34.3/arithmetic-picard-lefschetz-normalization: quadratic degeneration and tame inertia.
R34.3/saito-crystalline-weight-spectral-sequence: strictly semistable model, smooth intersection
strata, filtered log-crystalline complex, stratum maps and raw N_HK; L-coefficient projector,
embeddings into L_λ and L_μ, chosen C_μ factor and coefficient extension of the image filtration.
R34.3/saito-stratum-correspondence-trace: supplied crystalline trace, duality, Gysin and diagonal
maps from CrystallineCohomology CR.3:duality.1 with its CR.4.7 and other transitive prerequisites;
additional cycle/intersection compatibilities, rational constituent trace identities and their
L-linear extension through the specified coefficient embeddings, including projector images.
R34.3/saito-semistable-comparison-model: compatible ramified refinement of Saito's curve models,
level maps, L-coefficient projector and log-crystalline comparison; N_HK = e_V N_p in finite-local
descent, retaining the embeddings into L_λ and L_μ and the chosen C_μ factor.
R34.3/semistable-period-comparison: proper strictly semistable model over a finite local field,
structured period comparison with N_p on the period factor and N_HK/e_K on the HK factor,
their sum on the HK tensor product and zero on the étale factor; L_μ coefficient extension,
L-coefficient correspondences and their images, full-algebra Frobenius compatibility and chosen
C_μ factor for linearized Weil/monodromy, and ramified base change dividing raw N by d.
R34.4/finite-field-pencil-descent: supplied finite-field pencil/incidence descent on the chosen axis.
R34.4/vanishing-quotient-parity-comparison: supplied odd-degree arithmetic radical quotient and
Tate pairing; comparison with the even-degree symmetric pairing.
R34.4/original-coefficient-monodromy-hypotheses: original Q_l geometric monodromy and local factors.
R34.5/parabolic-cohomology-weight-comparison: actual H_c¹→H¹ image of Sym^r R¹.
R34.5/kuga-sato-projector-weight-comparison: full torsion-translation, inversion and permutation
Scholl correspondence on the equivariant resolution and its parabolic étale comparison.
The Hilbert branch uses Saito's L-coefficient e and e°, the L_λ realization, the L_μ structured
period comparison with chosen C_μ factor, and coefficient extension of projector images.
R34.5/weight-two-jacobian-weight-comparison: actual modular abelian quotient and coefficient action.
R34.5/arithmetic-hard-lefschetz-comparison: smooth projective finite-field scheme, ℓ invertible,
ample class and Frobenius-equivariant cup product.
R34.6/eigenform-purity-and-ramanujan-bound: existing newform eigensummand and Hecke polynomial.
R34.6/fixed-eigenform-good-prime-compatibility: common coefficient field and actual λ-realizations.
R34.6/arithmetic-realization-transport: actual comparison morphisms and commuting correspondences.
R34.6/hilbert-degreewise-trace-comparison: Saito's sufficiently small K=K_𝔫 K^𝔫,
away-from-𝔫 Hecke algebra and σ∈W⁺; the specified L-coefficient projectors and degree shift,
Tate twist and period comparison on the chosen C_μ factor; generic-curve H⁰/H² vanishing
for nonconstant coefficients and component/Tate descriptions with arithmetic and Hecke
norm-character actions for parallel weight two; common traces through ι_λ and ι_μ,
outer-degree subtraction and compatibility with extension of L.
R34.6/hilbert-local-monodromy-weight-export: global Jacquet–Langlands and coefficient models,
degreewise trace comparison before Hecke isolation and division by positive multiplicity,
Saito's cohomological decomposition and rank-two multiplicity descent, local WD carriers,
L-coefficient e and e° with specified embeddings and chosen C_μ factor, descent to the Hecke
coefficient field with a model and descent datum, and N_HK/e_K = N_p before the Weil–Deligne export.
R34.6/common-good-prime-polynomials: HasCommonGoodPrimePolynomials on an arithmetic family.
See README.md for the required supplier interfaces and arithmetic hypotheses. -/

end TauCeti.Weights
