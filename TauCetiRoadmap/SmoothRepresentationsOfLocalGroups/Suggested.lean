import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic
import TauCetiRoadmap.ReductiveGroupsPartII.Suggested
import TauCeti.NumberTheory.HeckeRing.Associativity
import TauCeti.RepresentationTheory.BaseChange
import TauCeti.RepresentationTheory.LinearCharacter.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic

/-!
# Smooth representations of local groups: representative target signatures

The mathematical specification is README.md; these are suggested Lean forms, not an exhaustive
list of its targets.

The general theory uses a commutative coefficient ring and algebraic representations of a
topological group. Compactness, local compactness, Hausdorffness and invertibility of subgroup
orders are explicit hypotheses where they are required. Polynomial and cocycle identities are
stated on their algebraic carriers; their reductive applications use the hypotheses in README.md.
-/

namespace TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

noncomputable section
open scoped BigOperators TensorProduct MonoidAlgebra
open CategoryTheory Polynomial
local instance (X : Type*) : DecidableEq X := Classical.decEq X
local instance (p : Prop) : Decidable p := Classical.propDecidable p
universe u v w

/-! ## Layer SR.0: the smooth category and its basic API -/

section SmoothCategory
variable {A : Type*} [CommRing A] {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- van Dantzig: in a locally compact totally disconnected Hausdorff group every
neighbourhood of `1` contains a compact open subgroup. -/
theorem exists_compactOpenSubgroup_le [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] {U : Set G} (hU : U ∈ nhds (1 : G)) :
    ∃ K : OpenSubgroup G, IsCompact (K : Set G) ∧ (K : Set G) ⊆ U := sorry

namespace Representation

section Monoid
variable {V : Type*} [AddCommMonoid V] [Module A V] (ρ : Representation A G V)

/-- A representation on an `A`-module (no topology on `V`) is smooth when every vector has
an open stabiliser. -/
class IsSmooth : Prop where
  smooth : ∀ v : V, IsOpen ((ρ.stabilizer v : Subgroup G) : Set G)

/-- Whittaker functionals: linear forms transforming by the character `ψ` of `U`. -/
def whittakerFunctionals (U : Subgroup G) (ψ : U →* Aˣ) : Submodule A (V →ₗ[A] A) where
  carrier := {ℓ | ∀ (u : U) (v : V), ℓ (ρ u v) = (ψ u : A) * ℓ v}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

theorem isSmooth_iff_exists_openSubgroup :
    IsSmooth ρ ↔ ∀ v : V, ∃ U : OpenSubgroup G, ∀ g ∈ U, ρ g v = v := sorry
theorem IsSmooth.subrepresentation (h : IsSmooth ρ) (S : Subrepresentation ρ) :
    IsSmooth S.toRepresentation := sorry
theorem IsSmooth.comp_continuous {H : Type*} [Group H] [TopologicalSpace H] (h : IsSmooth ρ)
    (f : H →* G) (hf : Continuous f) : IsSmooth (ρ.comp f) := sorry
theorem isSmooth_ofMulAction_quotient (U : Subgroup G) (hU : IsOpen (U : Set G)) :
    IsSmooth (Representation.ofMulAction A G (G ⧸ U)) := sorry
/-- Change of coefficients (Tau Ceti's `Representation.baseChange`) preserves smoothness. -/
theorem isSmooth_baseChange (B : Type*) [CommRing B] [Algebra A B] (h : IsSmooth ρ) :
    IsSmooth (_root_.Representation.baseChange B ρ) := sorry
theorem whittakerFunctionals_trivial_of_ne_one (U : Subgroup G) (ψ : U →* Aˣ) [IsDomain A]
    (hψ : ∃ u : U, (ψ u : A) ≠ 1) :
    whittakerFunctionals (Representation.trivial A G V) U ψ = ⊥ := sorry

-- Representation.isSmooth_trivial
theorem isSmooth_trivial : IsSmooth (Representation.trivial A G V) := sorry

/- Check `Representation.isSmooth_trivial`: the trivial representation of any topological group on any A-module is smooth. -/
example : IsSmooth (Representation.trivial A G V) := sorry
-- Representation.isSmooth_of_discreteTopology
example [DiscreteTopology G] : IsSmooth ρ := sorry
-- Representation.isSmooth_ofMulAction_zmod
example (U : OpenSubgroup G) : IsSmooth (Representation.ofMulAction A G (G ⧸ U.toSubgroup)) := sorry
-- Representation.not_isSmooth_leftRegular
theorem not_isSmooth_leftRegular (p : ℕ) [Fact p.Prime] :
    ¬ IsSmooth (Representation.ofMulAction ℤ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p])) := sorry

/- Check `Representation.not_isSmooth_leftRegular`: for G = ℤ_p (additive, p-adic topology) and A = ℤ, the left regular representation on ℤ[ℤ_p] is not smooth. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsSmooth (Representation.ofMulAction ℤ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p])) := sorry

-- A nontrivial character over a ring with zero divisors can have nonzero functionals.
/- Check `SmoothRep.whittaker_torus`: for G = T (U = ⊥), Hom_U(V, ψ) = Hom_A(V, A). -/
example :
    whittakerFunctionals ρ (⊥ : Subgroup G) 1 = ⊤ := sorry
example (U : Subgroup G) (ψ : U →* Aˣ) :
    Subsingleton (whittakerFunctionals (Representation.trivial A G (Fin 0 → A)) U ψ) := sorry
example (U : Subgroup G) (ψ : U →* Aˣ) [IsDomain A]
    (hψ : ∃ u : U, (ψ u : A) ≠ 1) :
    whittakerFunctionals (Representation.trivial A G V) U ψ = ⊥ := sorry
example :
    whittakerFunctionals (Representation.trivial (ZMod 6) (ZMod 6)ˣ (ZMod 6))
      (⊤ : Subgroup (ZMod 6)ˣ) (⊤ : Subgroup (ZMod 6)ˣ).subtype ≠ ⊥ := sorry

end Monoid

section Group
variable {V : Type*} [AddCommGroup V] [Module A V] (ρ : Representation A G V)

/-- The smooth vectors: those with open stabiliser. They form a subrepresentation. -/
def smoothVectors : Subrepresentation ρ where
  toSubmodule :=
    { carrier := {v | IsOpen ((ρ.stabilizer v : Subgroup G) : Set G)}
      zero_mem' := sorry
      add_mem' := sorry
      smul_mem' := sorry }
  apply_mem_toSubmodule := sorry

/-- Admissible: smooth, and the invariants of every compact open subgroup are finitely generated
over `A` (no dimension condition over a general ring). The second clause has content only when
compact open subgroups exist, as for locally profinite `G`: the group `ℚ_p^ℕ` has none, and there
the predicate reduces to smoothness. -/
def IsAdmissible : Prop :=
  IsSmooth ρ ∧ ∀ U : OpenSubgroup G, IsCompact (U : Set G) → Module.Finite A (Representation.invariants (ρ.comp U.toSubgroup.subtype))

/-- The smooth contragredient: the smooth vectors of the full algebraic dual. -/
noncomputable def smoothDual : Subrepresentation ρ.dual := smoothVectors ρ.dual

theorem mem_smoothVectors_iff (v : V) :
    v ∈ (smoothVectors ρ).toSubmodule ↔ IsOpen ((ρ.stabilizer v : Subgroup G) : Set G) := sorry
theorem smoothVectors_isSmooth : IsSmooth (smoothVectors ρ).toRepresentation := sorry
theorem smoothVectors_eq_top_iff : (smoothVectors ρ).toSubmodule = ⊤ ↔ IsSmooth ρ := sorry
theorem invariantsOf_mono {U U' : Subgroup G} (h : U' ≤ U) : Representation.invariants (ρ.comp U.subtype) ≤ Representation.invariants (ρ.comp U'.subtype) := sorry
/-- A smooth representation is the union of its compact-open invariants. Local compactness and
Hausdorffness are needed: for `G = ℚ_p^ℕ` with the product topology, a nonarchimedean group with no
compact open subgroup, the supremum on the left is empty while the trivial representation is smooth. -/
theorem iSup_invariantsOf_compactOpen_eq_top
    [TotallyDisconnectedSpace G]
    [LocallyCompactSpace G] [T2Space G] (h : IsSmooth ρ) :
    ⨆ U : {U : OpenSubgroup G // IsCompact (U : Set G)}, Representation.invariants (ρ.comp U.1.toSubgroup.subtype) = ⊤ := sorry
omit [IsTopologicalGroup G] in
theorem IsAdmissible.isSmooth (h : IsAdmissible ρ) : IsSmooth ρ := h.1
theorem isSmooth_smoothDual : IsSmooth (smoothDual ρ).toRepresentation := sorry

-- Representation.smoothVectors_leftRegular_eq_bot (for the compact group `ℤ_p`, not discrete)
theorem smoothVectors_leftRegular_eq_bot (p : ℕ) [Fact p.Prime] :
    (Representation.smoothVectors (Representation.ofMulAction ℤ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p]))).toSubmodule = ⊥ := sorry

/- Check `Representation.smoothVectors_leftRegular_eq_bot`: for G = ℤ_p and A = ℤ the smooth vectors of the left regular representation on ℤ[ℤ_p] are 0. -/
example (p : ℕ) [Fact p.Prime] :
    (Representation.smoothVectors (Representation.ofMulAction ℤ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p]))).toSubmodule = ⊥ := sorry
-- Representation.isAdmissible_ofMulAction_compact
example (p : ℕ) [Fact p.Prime] (U : OpenSubgroup (Multiplicative ℤ_[p])) :
    IsAdmissible (Representation.ofMulAction ℚ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p] ⧸ U.toSubgroup)) := sorry
-- Representation.smoothDual_finite (finite free smooth representations are reflexive)
example [Module.Finite A V] [Module.Free A V] (h : IsSmooth ρ) :
    (smoothDual ρ).toSubmodule = ⊤ := sorry
-- Representation.jacquetModule_trivial
example (N : Subgroup G) : Nonempty (Representation.Coinvariants ((Representation.trivial A G V).comp N.subtype) ≃ₗ[A] V) := sorry

-- Admissibility distinguishes finite rank, zero and infinite rank for a compact group.
example [IsNoetherianRing A] [Module.Finite A V] :
    IsAdmissible (Representation.trivial A G V) := sorry
theorem isAdmissible_zero : IsAdmissible (Representation.trivial A G (Fin 0 → A)) := sorry

/- Check `Representation.isAdmissible_zero`: the zero representation is admissible. -/
example : IsAdmissible (Representation.trivial A G (Fin 0 → A)) := sorry
example [CompactSpace G] :
    ¬ IsAdmissible (Representation.trivial ℚ G (ℕ →₀ ℚ)) := sorry
-- Without local compactness there may be no compact open subgroup: in `ℚ_p^ℕ` every open subgroup
-- has a factor `ℚ_p`, so the infinite-rank trivial action satisfies the predicate vacuously.
example (p : ℕ) [Fact p.Prime] :
    IsEmpty {U : OpenSubgroup (Multiplicative (ℕ → ℚ_[p])) //
      IsCompact (U : Set (Multiplicative (ℕ → ℚ_[p])))} := sorry
example (p : ℕ) [Fact p.Prime] :
    IsAdmissible (Representation.trivial ℚ (Multiplicative (ℕ → ℚ_[p])) (ℕ →₀ ℚ)) := sorry
theorem smoothVectors_of_discreteTopology [DiscreteTopology G] : (smoothVectors ρ).toSubmodule = ⊤ := sorry

/- Check `Representation.smoothVectors_of_discreteTopology`: for G discrete, V^∞ = ⊤ for every representation. -/
example [DiscreteTopology G] : (smoothVectors ρ).toSubmodule = ⊤ := sorry
example : (smoothVectors (Representation.trivial A G (Fin 0 → A))).toSubmodule = ⊤ := sorry
example : (smoothDual (Representation.trivial A G V)).toSubmodule = ⊤ := sorry
/- Check `SmoothRep.smoothDual_zero`: the smooth dual of 0 is 0. -/
example : Subsingleton (smoothDual (Representation.trivial A G (Fin 0 → A))).toSubmodule := sorry

end Group

end Representation

/-- A compact subgroup `K` has pro-order invertible in `A` when the order of each of its finite
continuous quotients is a unit of `A`. -/
def HasUnitProOrder (A : Type*) [CommRing A] (K : Subgroup G) : Prop :=
  ∀ U : OpenNormalSubgroup K, IsUnit ((Nat.card (K ⧸ U.toSubgroup) : ℕ) : A)

/-- Unit pro-order passes to open subgroups of a compact `K`: an open subgroup `K'` then has finite
index, and the normal core in `K` of an open normal subgroup of `K'` is open normal in `K`. Compactness
cannot be dropped: `SL₂(ℚ_p)` has no proper open normal subgroup, so it has unit pro-order over every
`A`, while its open subgroup `SL₂(ℤ_p)` has the quotient `SL₂(𝔽_p)` of order `p(p² − 1)`, not a unit of
`𝔽_p`. Openness of `K'` cannot be weakened to closedness unless `K` is profinite: the circle has no
proper open subgroup, so it has unit pro-order over `𝔽_p`, while its closed subgroup `μ_p` does not. -/
theorem hasUnitProOrder_of_le {K K' : Subgroup G} (h : K' ≤ K) (hKc : IsCompact (K : Set G))
    (hK : IsOpen (K' : Set G)) (hU : HasUnitProOrder A K) : HasUnitProOrder A K' := sorry
/-- A compact pro-`p` subgroup (Tau Ceti's `IsProP`) has unit pro-order once `p` is a unit. -/
theorem hasUnitProOrder_of_proP (p : ℕ) (K : Subgroup G)
    (hcompact : IsCompact (K : Set G)) (hp : IsUnit (p : A))
    (hK : TauCeti.IsProP p K) : HasUnitProOrder A K := sorry

-- `TauCeti.IsProP` is exactly the open-normal-quotient condition.
example (p : ℕ) (K : Subgroup G) :
    TauCeti.IsProP p K ↔ ∀ U : OpenNormalSubgroup K, IsPGroup p (K ⧸ U.toSubgroup) :=
  TauCeti.isProP_iff

-- HasUnitProOrder.zp_rat
example (p : ℕ) [Fact p.Prime] : HasUnitProOrder ℚ (⊤ : Subgroup (Multiplicative ℤ_[p])) := sorry
-- HasUnitProOrder.not_zp_zmod
example (p : ℕ) [Fact p.Prime] : ¬ HasUnitProOrder (ZMod p) (⊤ : Subgroup (Multiplicative ℤ_[p])) := sorry
-- HasUnitProOrder.finite
example (K : Subgroup G) [Finite K] (h : IsUnit ((Nat.card K : ℕ) : A)) : HasUnitProOrder A K := sorry

-- Compactness excludes the infinite discrete elementary abelian 2-group.
theorem HasUnitProOrder.discrete_infinite :
    letI : TopologicalSpace (Multiplicative (ℕ →₀ ZMod 2)) := ⊥
    IsPGroup 2 (Multiplicative (ℕ →₀ ZMod 2)) ∧
      ¬ HasUnitProOrder ℚ (⊤ : Subgroup (Multiplicative (ℕ →₀ ZMod 2))) := sorry

/- Check `HasUnitProOrder.discrete_infinite`: The infinite discrete elementary abelian 2-group fails unit pro-order over ℚ. -/
example :
    letI : TopologicalSpace (Multiplicative (ℕ →₀ ZMod 2)) := ⊥
    IsPGroup 2 (Multiplicative (ℕ →₀ ZMod 2)) ∧
      ¬ HasUnitProOrder ℚ (⊤ : Subgroup (Multiplicative (ℕ →₀ ZMod 2))) := sorry

-- Inheritance fails for a closed subgroup of a compact group that is not profinite: the connected
-- circle has unit pro-order over `𝔽_p`, its closed subgroup of `p`-th roots of unity does not.
theorem HasUnitProOrder.closed_circle (p : ℕ) [Fact p.Prime] :
    HasUnitProOrder (ZMod p) (⊤ : Subgroup Circle) ∧
      ¬ HasUnitProOrder (ZMod p) (Subgroup.zpowers (Circle.exp (2 * Real.pi / p))) := sorry

/- Check `HasUnitProOrder.closed_circle`: The circle has unit pro-order over F_p but its closed subgroup μ_p does not. -/
example (p : ℕ) [Fact p.Prime] :
    HasUnitProOrder (ZMod p) (⊤ : Subgroup Circle) ∧
      ¬ HasUnitProOrder (ZMod p) (Subgroup.zpowers (Circle.exp (2 * Real.pi / p))) := sorry

section Averaging
variable {V : Type*} [AddCommGroup V] [Module A V]

/-- The averaging projector onto `U`-invariants, for compact open `U` of invertible pro-order. -/
noncomputable def Representation.averaging (ρ : Representation A G V)
    (_hs : Representation.IsSmooth ρ) (U : OpenSubgroup G)
    (_hc : IsCompact (U : Set G)) (_hU : HasUnitProOrder A U.toSubgroup) : V →ₗ[A] V := sorry

theorem Representation.averaging_mem (ρ : Representation A G V)
    (hs : Representation.IsSmooth ρ) (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hU : HasUnitProOrder A U.toSubgroup) (v : V) :
    Representation.averaging ρ hs U hc hU v ∈ Representation.invariants (ρ.comp U.toSubgroup.subtype) := sorry
theorem Representation.averaging_of_mem (ρ : Representation A G V)
    (hs : Representation.IsSmooth ρ) (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hU : HasUnitProOrder A U.toSubgroup) {v : V}
    (hv : v ∈ Representation.invariants (ρ.comp U.toSubgroup.subtype)) : Representation.averaging ρ hs U hc hU v = v := sorry

/-- Averaging is the finite quotient sum for every open normal subgroup fixing the vector. -/
theorem Representation.averaging_apply (ρ : Representation A G V)
    (hs : Representation.IsSmooth ρ) (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hU : HasUnitProOrder A U.toSubgroup)
    (N : OpenNormalSubgroup U) [Fintype (U ⧸ N.toSubgroup)]
    (r : U ⧸ N.toSubgroup → U)
    (hr : ∀ x, QuotientGroup.mk (r x) = x) (v : V)
    (hv : ∀ n : N, ρ (n : U) v = v) :
    Representation.averaging ρ hs U hc hU v =
      (↑((hU N).unit⁻¹) : A) • ∑ x, ρ (r x) v := sorry

theorem SmoothRep.averaging_idem (ρ : Representation A G V) (hs : Representation.IsSmooth ρ)
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
    (hU : HasUnitProOrder A U.toSubgroup) :
    Representation.averaging ρ hs U hc hU ∘ₗ Representation.averaging ρ hs U hc hU =
      Representation.averaging ρ hs U hc hU := sorry

/- Check `SmoothRep.averaging_idem`: Averaging twice equals averaging once. -/
example (ρ : Representation A G V) (hs : Representation.IsSmooth ρ)
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
    (hU : HasUnitProOrder A U.toSubgroup) :
    Representation.averaging ρ hs U hc hU ∘ₗ Representation.averaging ρ hs U hc hU =
      Representation.averaging ρ hs U hc hU := sorry

-- Over characteristic two the group order is not invertible.
example : ¬ IsUnit (2 : ZMod 2) := sorry
example : (1 / 2 : ℚ) * (1 + (-1)) = 0 := by norm_num

end Averaging

-- The two-term average of the C₂ sign character is zero.
example (χ : Multiplicative (ZMod 2) →* ℚˣ)
    (hχ : χ (Multiplicative.ofAdd 1) = -1) :
    Representation.averaging (Representation.ofLinearCharacter χ) (by sorry)
      (⊤ : OpenSubgroup (Multiplicative (ZMod 2))) (by sorry) (by sorry) (1 : ℚ) = 0 := sorry
theorem SmoothRep.averaging_trivial (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
    (hu : HasUnitProOrder A U.toSubgroup) :
    Representation.averaging (Representation.trivial A G A) (by sorry) U hc hu =
      LinearMap.id := sorry

/- Check `SmoothRep.averaging_trivial`: on the trivial representation e_U = id. -/
example (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
    (hu : HasUnitProOrder A U.toSubgroup) :
    Representation.averaging (Representation.trivial A G A) (by sorry) U hc hu =
      LinearMap.id := sorry
example : ¬ HasUnitProOrder (ZMod 2) (⊤ : Subgroup (Multiplicative (ZMod 2))) := sorry

/-- A smooth character is a homomorphism to the units with open kernel. -/
def IsSmoothCharacter (χ : G →* Aˣ) : Prop := IsOpen ((χ.ker : Subgroup G) : Set G)


theorem isSmoothCharacter_iff_isSmooth (χ : G →* Aˣ) :
    IsSmoothCharacter χ ↔ Representation.IsSmooth (Representation.ofLinearCharacter χ) := sorry
-- IsSmoothCharacter.one
example : IsSmoothCharacter (1 : G →* Aˣ) := sorry
-- IsSmoothCharacter.mul
example (χ χ' : G →* Aˣ) (h : IsSmoothCharacter χ) (h' : IsSmoothCharacter χ') :
    IsSmoothCharacter (χ * χ') := sorry
-- IsSmoothCharacter.of_discrete
example [DiscreteTopology G] (χ : G →* Aˣ) : IsSmoothCharacter χ := sorry

end SmoothCategory

-- An arbitrary topology need not preserve smooth vectors under translation.
example :
    let H : Subgroup (Equiv.Perm (Fin 3)) := Subgroup.zpowers (Equiv.swap 0 1)
    letI : TopologicalSpace (Equiv.Perm (Fin 3)) := TopologicalSpace.generateFrom {(H : Set _)}
    let ρ := Representation.ofMulAction ℚ (Equiv.Perm (Fin 3)) ((Equiv.Perm (Fin 3)) ⧸ H)
    ∃ v g, IsOpen (ρ.stabilizer v).carrier ∧
      ¬ IsOpen (ρ.stabilizer (ρ g v)).carrier := sorry

section SmoothRepCategory
variable (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- The category of smooth representations: the full subcategory of `Rep A G` on the smooth
objects. -/
abbrev SmoothRep : Type _ :=
  ObjectProperty.FullSubcategory (fun X : Rep A G => Representation.IsSmooth X.ρ)

/-- The inclusion into `Rep A G`. -/
abbrev SmoothRep.ι : SmoothRep A G ⥤ Rep A G :=
  ObjectProperty.ι (fun X : Rep A G => Representation.IsSmooth X.ρ)

/-- Smooth representations form an abelian category (kernels, cokernels and sums of smooth
representations are smooth). -/
noncomputable instance SmoothRep.instAbelian : Abelian (SmoothRep A G) where
  toPreadditive := inferInstance
  toIsNormalMonoCategory := sorry
  toIsNormalEpiCategory := sorry
  has_finite_products := sorry
  has_kernels := sorry
  has_cokernels := sorry

/-- The smooth-part functor, right adjoint to the inclusion. -/
noncomputable def SmoothRep.smoothPart : Rep A G ⥤ SmoothRep A G where
  obj X := ⟨Rep.of (Representation.smoothVectors X.ρ).toRepresentation,
    Representation.smoothVectors_isSmooth X.ρ⟩
  map {X Y} f := ObjectProperty.homMk (Rep.ofHom
    { toLinearMap :=
        { toFun := fun v => ⟨f.hom v, by sorry⟩
          map_add' := by sorry
          map_smul' := by sorry }
      isIntertwining' := by sorry })
  map_id := by sorry
  map_comp := by sorry

/-- The coreflection acts by the original equivariant map on underlying vectors. -/
theorem SmoothRep.smoothPart_map_apply {X Y : Rep A G} (f : X ⟶ Y)
    (v : ((SmoothRep.smoothPart A G).obj X).obj.V) :
    (((SmoothRep.smoothPart A G).map f).hom.hom v).val = f.hom v.val := rfl

/-- `ι ⊣ smoothPart`: the smooth category is coreflective in `Rep A G`. -/
noncomputable def SmoothRep.smoothPartAdjunction : SmoothRep.ι A G ⊣ SmoothRep.smoothPart A G := sorry

/-- The counit is the inclusion of smooth vectors, fixing the chosen adjunction. -/
theorem SmoothRep.smoothPartAdjunction_counit (X : Rep A G)
    (v : ((SmoothRep.smoothPart A G).obj X).obj.V) :
    ((SmoothRep.smoothPartAdjunction A G).counit.app X).hom v = v.val := sorry

example [DiscreteTopology G] (X : Rep A G) :
    IsIso ((SmoothRep.smoothPartAdjunction A G).counit.app X) := sorry
example : Subsingleton (((SmoothRep.smoothPart A G).obj
    (Rep.of (Representation.trivial A G (Fin 0 → A)))).obj.V) := sorry
example (X : Rep A G) (v : ((SmoothRep.smoothPart A G).obj X).obj.V) :
    ((SmoothRep.smoothPartAdjunction A G).counit.app X).hom v = v.val := sorry
example {X Y : Rep A G} (f : X ⟶ Y)
    (v : ((SmoothRep.smoothPart A G).obj X).obj.V) :
    (((SmoothRep.smoothPart A G).map f).hom.hom v).val = f.hom v.val := rfl

/-- The centre of the smooth category, `End (𝟭 _)`. -/
abbrev SmoothCentre := CatCenter (SmoothRep A G)

/-- The smooth category is Grothendieck abelian (filtered colimits are exact and the permutation
modules `A[G/U]` form a family of generators). -/
noncomputable instance SmoothRep.instIsGrothendieckAbelian :
    IsGrothendieckAbelian.{u} (SmoothRep A G) := sorry

-- SmoothRep.abelian_test
example : Abelian (SmoothRep A G) := inferInstance
-- SmoothCentre.commutative
example : IsMulCommutative (SmoothCentre A G) := inferInstance
-- SmoothRep.ι_faithful
example : (SmoothRep.ι A G).Faithful := inferInstance
-- Quotient objects of `Rep` are `Rep.quotient` with projection `Rep.mkQ`; `Rep.ofQuotient` is the
-- representation of `Γ ⧸ S` on a module where the normal subgroup `S` acts trivially.
example {k Γ : Type u} [CommRing k] [Group Γ] (X : Rep k Γ) (W : Submodule k X)
    (h : ∀ g, W ≤ W.comap (X.ρ g)) : X ⟶ Rep.quotient X W h := Rep.mkQ X W h
example {k Γ : Type u} [CommRing k] [Group Γ] (X : Rep k Γ) (S : Subgroup Γ) [S.Normal]
    [Representation.IsTrivial (X.ρ.comp S.subtype)] : Rep k (Γ ⧸ S) := Rep.ofQuotient X S
theorem SmoothRep.equivalence_of_discrete [DiscreteTopology G] : (SmoothRep.ι A G).IsEquivalence := sorry

/- Check `SmoothRep.equivalence_of_discrete`: for G with the discrete topology, ι is an equivalence SmoothRep A G ≌ Rep A G. -/
example [DiscreteTopology G] : (SmoothRep.ι A G).IsEquivalence := sorry
theorem SmoothRep.end_trivial :
    let X : SmoothRep A G := ⟨Rep.of (Representation.trivial A G A), by sorry⟩
    Nonempty (End X ≃+* A) := sorry

/- Check `SmoothRep.end_trivial`: the endomorphism algebra of the trivial object A of SmoothRep A G is A. -/
example :
    let X : SmoothRep A G := ⟨Rep.of (Representation.trivial A G A), by sorry⟩
    Nonempty (End X ≃+* A) := sorry
example (p : ℕ) [Fact p.Prime] :
    ¬ ∃ X : SmoothRep ℤ (Multiplicative ℤ_[p]),
      X.obj = Rep.of (Representation.ofMulAction ℤ (Multiplicative ℤ_[p])
        (Multiplicative ℤ_[p])) := sorry
theorem SmoothCentre.trivialGroup : Nonempty (SmoothCentre A PUnit ≃+* A) := sorry

/- Check `SmoothCentre.trivialGroup`: for G trivial, SmoothCentre A G ≅ A. -/
example : Nonempty (SmoothCentre A PUnit ≃+* A) := sorry
theorem SmoothCentre.finite_eq_center [Finite G] [DiscreteTopology G] :
    Nonempty (SmoothCentre A G ≃+* Subring.center (MonoidAlgebra A G)) := sorry

/- Check `SmoothCentre.finite_eq_center`: for G finite discrete, SmoothCentre A G ≅ the centre of A[G] (Mathlib Subring.center of MonoidAlgebra). -/
example [Finite G] [DiscreteTopology G] :
    Nonempty (SmoothCentre A G ≃+* Subring.center (MonoidAlgebra A G)) := sorry
theorem SmoothCentre.int_discrete (R : Type) [CommRing R] :
    Nonempty (SmoothCentre R (Multiplicative ℤ) ≃+* LaurentPolynomial R) := sorry

/- Check `SmoothCentre.int_discrete`: for G = ℤ discrete and A a field, SmoothCentre A G ≅ A[t, t⁻¹]. -/
example (R : Type) [CommRing R] :
    Nonempty (SmoothCentre R (Multiplicative ℤ) ≃+* LaurentPolynomial R) := sorry

/-- The image of the categorical center acting on the actual underlying module.
Naturality makes every element equivariant and preserves all invariant submodules. -/
def SmoothCentre.image (X : SmoothRep A G) : Subalgebra A (Module.End A X.obj.V) where
  carrier := {f | ∃ z : SmoothCentre A G, (z.app X).hom.hom.toLinearMap = f}
  zero_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  mul_mem' := sorry
  algebraMap_mem' := sorry

theorem SmoothCentre.image_commute (X : SmoothRep A G) (f g : SmoothCentre.image A G X) :
    f * g = g * f := sorry

instance (X : SmoothRep A G) : Module (SmoothCentre.image A G X) X.obj.V :=
  Module.compHom X.obj.V (SmoothCentre.image A G X).val.toRingHom

/-- Compact-open invariants as a module over the image of the categorical center. -/
def SmoothCentre.invariants (X : SmoothRep A G) (K : OpenSubgroup G) :
    Submodule (SmoothCentre.image A G X) X.obj.V where
  carrier := Representation.invariants (X.obj.ρ.comp K.toSubgroup.subtype)
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- Z-finiteness uses the image of the center, not an independently chosen scalar algebra.
DHKM, Finiteness for Hecke algebras of p-adic groups, introduction and Lemma 3.1. -/
def ZFinite (X : SmoothRep A G) : Prop :=
  Algebra.FiniteType A (SmoothCentre.image A G X) ∧
    ∀ K : OpenSubgroup G, IsCompact (K : Set G) →
      Module.Finite (SmoothCentre.image A G X) (SmoothCentre.invariants A G X K)

-- The image acts as the corresponding central endomorphism; invariants retain their usual carrier.
example (X : SmoothRep A G) (f : Module.End A X.obj.V) :
    f ∈ SmoothCentre.image A G X ↔
      ∃ z : SmoothCentre A G, (z.app X).hom.hom.toLinearMap = f := Iff.rfl
example (X : SmoothRep A G) (K : OpenSubgroup G) (v : X.obj.V) :
    v ∈ SmoothCentre.invariants A G X K ↔
      ∀ g : K, X.obj.ρ g v = v := Iff.rfl
example (X : SmoothRep A G) (K : OpenSubgroup G) [Subsingleton X.obj.V] :
    Subsingleton (SmoothCentre.invariants A G X K) := inferInstance
example (X : SmoothRep A G) (K : OpenSubgroup G)
    (h : X.obj.ρ = Representation.trivial A G X.obj.V) :
    SmoothCentre.invariants A G X K = ⊤ := sorry
example (X : SmoothRep A G) [Subsingleton X.obj.V] :
    Subsingleton (SmoothCentre.image A G X) := inferInstance
example :
    let X : SmoothRep ℚ PUnit := ⟨Rep.of (Representation.trivial ℚ PUnit ℚ), by sorry⟩
    SmoothCentre.image ℚ PUnit X = ⊤ := sorry
theorem ZFinite.zero :
    let X : SmoothRep A G := ⟨Rep.of (Representation.trivial A G (Fin 0 → A)), by sorry⟩
    ZFinite A G X := sorry

/- Check `ZFinite.zero`: the zero representation is Z-finite. -/
example :
    let X : SmoothRep A G := ⟨Rep.of (Representation.trivial A G (Fin 0 → A)), by sorry⟩
    ZFinite A G X := sorry
example :
    let X : SmoothRep A G := ⟨Rep.of (Representation.trivial A G A), by sorry⟩
    ZFinite A G X := sorry
theorem ZFinite.infiniteDirectSum :
    let X : SmoothRep ℚ PUnit := ⟨Rep.of (Representation.trivial ℚ PUnit (ℕ →₀ ℚ)), by sorry⟩
    ¬ ZFinite ℚ PUnit X := sorry

/- Check `ZFinite.infiniteDirectSum`: the countable direct sum of the trivial ℚ-representation of the trivial group is not Z-finite. -/
example :
    let X : SmoothRep ℚ PUnit := ⟨Rep.of (Representation.trivial ℚ PUnit (ℕ →₀ ℚ)), by sorry⟩
    ¬ ZFinite ℚ PUnit X := sorry

end SmoothRepCategory

/-! ## Layer SR.0d: the existing derived-category carrier and K-injective resolutions -/
section DerivedSmooth
variable (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Every unbounded smooth complex has a K-injective resolution.
Stacks Project, Tag 079P, applied to the smooth Grothendieck category. -/
theorem SmoothRep.exists_kInjective (K : CochainComplex (SmoothRep A G) ℤ) :
    ∃ I : CochainComplex (SmoothRep A G) ℤ, ∃ f : K ⟶ I,
      QuasiIso f ∧ I.IsKInjective := sorry

example : CochainComplex.IsKInjective
    (HomologicalComplex.zero : CochainComplex (SmoothRep A G) ℤ) := sorry
example (K : CochainComplex (SmoothRep A G) ℤ) [K.IsKInjective] :
    QuasiIso (𝟙 K) := inferInstance
example (K : CochainComplex (SmoothRep A G) ℤ) (n : ℤ)
    [K.IsStrictlyGE n] [∀ i, Injective (K.X i)] : K.IsKInjective := sorry

variable [HasDerivedCategory (SmoothRep A G)]
-- Fully faithful in degree zero, negative Ext vanishes, and zero remains zero.
example (X Y : SmoothRep A G) :
    Function.Bijective ((DerivedCategory.singleFunctor (SmoothRep A G) 0).map :
      (X ⟶ Y) → _) := sorry
example (X Y : SmoothRep A G) :
    Subsingleton ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj X ⟶
      ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj Y)⟦(-1 : ℤ)⟧) := sorry
example (X : SmoothRep A G) (hX : Limits.IsZero X) :
    Limits.IsZero ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj X) := sorry
end DerivedSmooth

/-! ## Layer SR.1: Hecke algebras over rings -/

section HeckeAlgebras
variable {A : Type*} [CommRing A] {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Locally constant functions `G → A` with compact support. -/
structure LocallyConstantCompact (G A : Type*) [TopologicalSpace G] [Zero A] where
  toFun : LocallyConstant G A
  isCompact_closure_support : IsCompact (closure (Function.support ⇑toFun))

/-- An `A`-valued Haar measure: a finitely additive left-invariant function on compact opens. -/
structure HaarMeasureWithValues (G A : Type*) [Group G] [TopologicalSpace G] [AddCommMonoid A] where
  vol : TopologicalSpace.CompactOpens G → A
  vol_bot : vol ⊥ = 0
  vol_sup_of_disjoint (K L : TopologicalSpace.CompactOpens G) :
    Disjoint (K : Set G) (L : Set G) → vol (K ⊔ L) = vol K + vol L
  vol_translate (g : G) (K L : TopologicalSpace.CompactOpens G) :
    (L : Set G) = (g * ·) '' (K : Set G) → vol L = vol K

/-- The compact-open indicator has no topology on the coefficient ring. -/
def LocallyConstantCompact.indicator {M : Type*} [Zero M] [T2Space G]
    (U : TopologicalSpace.CompactOpens G) (a : M) : LocallyConstantCompact G M where
  toFun := ⟨fun x => if x ∈ U then a else 0, by sorry⟩
  isCompact_closure_support := sorry

example [T2Space G] (U : TopologicalSpace.CompactOpens G) (a : A) (x : G) (hx : x ∈ U) :
    (LocallyConstantCompact.indicator U a).toFun x = a := sorry
example [T2Space G] (U : TopologicalSpace.CompactOpens G) (a : A) (x : G) (hx : x ∉ U) :
    (LocallyConstantCompact.indicator U a).toFun x = 0 := sorry
example [T2Space G] (U : TopologicalSpace.CompactOpens G) :
    (LocallyConstantCompact.indicator U (0 : A)).toFun = LocallyConstant.const G 0 := sorry
example [T2Space G] (a : A) :
    (LocallyConstantCompact.indicator (⊥ : TopologicalSpace.CompactOpens G) a).toFun =
      LocallyConstant.const G 0 := sorry

/-- Counting volume on a finite discrete group. -/
def HaarMeasureWithValues.counting [Finite G] [DiscreteTopology G] : HaarMeasureWithValues G A where
  vol U := (Nat.card U : A)
  vol_bot := sorry
  vol_sup_of_disjoint := sorry
  vol_translate := sorry

example [Finite G] [DiscreteTopology G] :
    (HaarMeasureWithValues.counting (G := G) (A := A)).vol ⊥ = 0 := sorry
example [Finite G] [DiscreteTopology G] (U : TopologicalSpace.CompactOpens G)
    (hU : (U : Set G) = Set.univ) :
    (HaarMeasureWithValues.counting (G := G) (A := A)).vol U = (Nat.card G : A) := sorry
example [Finite G] [DiscreteTopology G] (U : TopologicalSpace.CompactOpens G)
    (g : G) (hU : (U : Set G) = {g}) :
    (HaarMeasureWithValues.counting (G := G) (A := A)).vol U = 1 := sorry
-- Unnormalized volume permits zero; it cannot yield a normalized idempotent over a nonzero ring.
example : ∃ μ : HaarMeasureWithValues G A, ∀ U, μ.vol U = 0 := sorry
example [Nontrivial A] (μ : HaarMeasureWithValues G A) (hμ : ∀ U, μ.vol U = 0)
    (U : TopologicalSpace.CompactOpens G) : ¬ IsUnit (μ.vol U) := sorry

/-- Compact support makes the nonzero fibers a finite compact-open partition. -/
theorem LocallyConstantCompact.exists_indicator_expansion {M : Type*} [AddCommMonoid M] [T2Space G]
    (f : LocallyConstantCompact G M) :
    ∃ s : Finset (TopologicalSpace.CompactOpens G), ∃ a : TopologicalSpace.CompactOpens G → M,
      ∀ x, f.toFun x = ∑ U ∈ s, if x ∈ U then a U else 0 := sorry

/-- Finite-sum integration chooses an indicator expansion; finite additivity makes it independent
of that choice. Bernstein, lectures Ch. I §§1.2 and 2.1, pp. 8 and 11–12. -/
def HaarMeasureWithValues.integrate [T2Space G] (μ : HaarMeasureWithValues G A)
    (f : LocallyConstantCompact G A) : A :=
  let s := Classical.choose f.exists_indicator_expansion
  let a := Classical.choose (Classical.choose_spec f.exists_indicator_expansion)
  ∑ U ∈ s, μ.vol U * a U

theorem HaarMeasureWithValues.integrate_expansion [T2Space G] (μ : HaarMeasureWithValues G A)
    (f : LocallyConstantCompact G A) (s : Finset (TopologicalSpace.CompactOpens G))
    (a : TopologicalSpace.CompactOpens G → A)
    (hf : ∀ x, f.toFun x = ∑ U ∈ s, if x ∈ U then a U else 0) :
    μ.integrate f = ∑ U ∈ s, μ.vol U * a U := sorry
theorem HaarMeasureWithValues.integrate_indicator [T2Space G] (μ : HaarMeasureWithValues G A) (U : TopologicalSpace.CompactOpens G)
    (a : A) : μ.integrate (LocallyConstantCompact.indicator U a) = μ.vol U * a := sorry

/- Check `HaarMeasureWithValues.integrate_indicator`: The integral of `LocallyConstantCompact.indicator U a` is μ(U)a. -/
example [T2Space G] (μ : HaarMeasureWithValues G A) (U : TopologicalSpace.CompactOpens G)
    (a : A) : μ.integrate (LocallyConstantCompact.indicator U a) = μ.vol U * a := sorry
theorem HaarMeasureWithValues.integrate_zero [T2Space G] (μ : HaarMeasureWithValues G A) (U : TopologicalSpace.CompactOpens G) :
    μ.integrate (LocallyConstantCompact.indicator U (0 : A)) = 0 := sorry

/- Check `HaarMeasureWithValues.integrate_zero`: A zero indicator has integral zero, also for the zero coefficient ring. -/
example [T2Space G] (μ : HaarMeasureWithValues G A) (U : TopologicalSpace.CompactOpens G) :
    μ.integrate (LocallyConstantCompact.indicator U (0 : A)) = 0 := sorry
theorem HaarMeasureWithValues.integrate_counting [Finite G] [DiscreteTopology G] [Fintype G] (f : LocallyConstantCompact G A) :
    (HaarMeasureWithValues.counting (G := G) (A := A)).integrate f = ∑ g, f.toFun g := sorry

/- Check `HaarMeasureWithValues.integrate_counting`: With finite discrete G and counting volume, the integral is Σ_g f(g). -/
example [Finite G] [DiscreteTopology G] [Fintype G] (f : LocallyConstantCompact G A) :
    (HaarMeasureWithValues.counting (G := G) (A := A)).integrate f = ∑ g, f.toFun g := sorry
-- A two-term witness computes actual integration, not only a scalar identity.
theorem HaarMeasureWithValues.integrate_cyclicTwo (f : LocallyConstantCompact (Multiplicative (ZMod 2)) ℚ) :
    (HaarMeasureWithValues.counting (G := Multiplicative (ZMod 2)) (A := ℚ)).integrate f =
      f.toFun 1 + f.toFun (Multiplicative.ofAdd 1) := sorry

/- Check `HaarMeasureWithValues.integrate_cyclicTwo`: For C₂ = {1,s}, counting integration is f(1) + f(s), a computed two-term Lean example. -/
example (f : LocallyConstantCompact (Multiplicative (ZMod 2)) ℚ) :
    (HaarMeasureWithValues.counting (G := Multiplicative (ZMod 2)) (A := ℚ)).integrate f =
      f.toFun 1 + f.toFun (Multiplicative.ofAdd 1) := sorry

/-- Module-valued finite-sum integration. Bushnell–Henniart, §3.2, pp. 28–29, gives the
complex case; finite additivity gives this version for modules over a commutative ring. -/
def HaarMeasureWithValues.integrateModule {M : Type*} [AddCommGroup M] [Module A M]
    [T2Space G] (μ : HaarMeasureWithValues G A) (f : LocallyConstantCompact G M) : M :=
  let s := Classical.choose f.exists_indicator_expansion
  let a := Classical.choose (Classical.choose_spec f.exists_indicator_expansion)
  ∑ U ∈ s, μ.vol U • a U

theorem HaarMeasureWithValues.integrateModule_expansion {M : Type*} [AddCommGroup M] [Module A M]
    [T2Space G] (μ : HaarMeasureWithValues G A) (f : LocallyConstantCompact G M)
    (s : Finset (TopologicalSpace.CompactOpens G)) (a : TopologicalSpace.CompactOpens G → M)
    (hf : ∀ x, f.toFun x = ∑ U ∈ s, if x ∈ U then a U else 0) :
    μ.integrateModule f = ∑ U ∈ s, μ.vol U • a U := sorry

theorem HaarMeasureWithValues.integrateModule_map {M N : Type*}
    [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] [T2Space G]
    (μ : HaarMeasureWithValues G A) (L : M →ₗ[A] N)
    (f : LocallyConstantCompact G M) (g : LocallyConstantCompact G N)
    (hg : ∀ x, g.toFun x = L (f.toFun x)) :
    μ.integrateModule g = L (μ.integrateModule f) := sorry

theorem HaarMeasureWithValues.integrateModule_scalar [T2Space G]
    (μ : HaarMeasureWithValues G A) (f : LocallyConstantCompact G A) :
    μ.integrateModule f = μ.integrate f := sorry

theorem HaarMeasureWithValues.integrateModule_indicator {M : Type*} [AddCommGroup M] [Module A M] [T2Space G]
    (μ : HaarMeasureWithValues G A) (U : TopologicalSpace.CompactOpens G) (m : M) :
    μ.integrateModule (LocallyConstantCompact.indicator U m) = μ.vol U • m := sorry

/- Check `HaarMeasureWithValues.integrateModule_indicator`: Module indicators integrate to volume times the vector, including zero. -/
example {M : Type*} [AddCommGroup M] [Module A M] [T2Space G]
    (μ : HaarMeasureWithValues G A) (U : TopologicalSpace.CompactOpens G) (m : M) :
    μ.integrateModule (LocallyConstantCompact.indicator U m) = μ.vol U • m := sorry
/- Check `HaarMeasureWithValues.integrateModule_indicator`: Module indicators integrate to volume times the vector, including zero. -/
example {M : Type*} [AddCommGroup M] [Module A M] [T2Space G]
    (μ : HaarMeasureWithValues G A) (U : TopologicalSpace.CompactOpens G) :
    μ.integrateModule (LocallyConstantCompact.indicator U (0 : M)) = 0 := sorry
theorem HaarMeasureWithValues.integrateModule_cyclicTwo (f : LocallyConstantCompact (Multiplicative (ZMod 2)) (ℚ × ℚ)) :
    (HaarMeasureWithValues.counting (G := Multiplicative (ZMod 2)) (A := ℚ)).integrateModule f =
      f.toFun 1 + f.toFun (Multiplicative.ofAdd 1) := sorry

/- Check `HaarMeasureWithValues.integrateModule_cyclicTwo`: For C₂ and M = ℚ × ℚ, counting integration is the vector sum f(1) + f(s). -/
example (f : LocallyConstantCompact (Multiplicative (ZMod 2)) (ℚ × ℚ)) :
    (HaarMeasureWithValues.counting (G := Multiplicative (ZMod 2)) (A := ℚ)).integrateModule f =
      f.toFun 1 + f.toFun (Multiplicative.ofAdd 1) := sorry

section ProductIntegration
variable {H M : Type*} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [T2Space G] [T2Space H] [AddCommGroup M] [Module A M]

/-- Product volume is characterized by its values on compact-open rectangles. -/
def HaarMeasureWithValues.prod (μ : HaarMeasureWithValues G A) (ν : HaarMeasureWithValues H A) :
    HaarMeasureWithValues (G × H) A := sorry

theorem HaarMeasureWithValues.prod_vol (μ : HaarMeasureWithValues G A)
    (ν : HaarMeasureWithValues H A) (U : TopologicalSpace.CompactOpens G)
    (V : TopologicalSpace.CompactOpens H) (W : TopologicalSpace.CompactOpens (G × H))
    (hW : (W : Set (G × H)) = (U : Set G) ×ˢ (V : Set H)) :
    (μ.prod ν).vol W = μ.vol U * ν.vol V := sorry

def LocallyConstantCompact.sliceRight (f : LocallyConstantCompact (G × H) M) (x : G) :
    LocallyConstantCompact H M where
  toFun := ⟨fun y => f.toFun (x, y), by sorry⟩
  isCompact_closure_support := sorry

def HaarMeasureWithValues.integrateRight (ν : HaarMeasureWithValues H A)
    (f : LocallyConstantCompact (G × H) M) : LocallyConstantCompact G M where
  toFun := ⟨fun x => ν.integrateModule (f.sliceRight x), by sorry⟩
  isCompact_closure_support := sorry

/-- Fubini for compactly supported locally constant module-valued functions needs no
completeness or topology on the module. Bushnell–Henniart, §3.2, pp. 28–29. -/
theorem HaarMeasureWithValues.integrateModule_prod (μ : HaarMeasureWithValues G A)
    (ν : HaarMeasureWithValues H A) (f : LocallyConstantCompact (G × H) M) :
    (μ.prod ν).integrateModule f = μ.integrateModule (ν.integrateRight f) := sorry

theorem HaarMeasureWithValues.prod_counting [Fintype G] [Fintype H] [DiscreteTopology G] [DiscreteTopology H]
    (f : LocallyConstantCompact (G × H) M) :
    ((HaarMeasureWithValues.counting (G := G) (A := A)).prod
      (HaarMeasureWithValues.counting (G := H) (A := A))).integrateModule f =
        ∑ x, ∑ y, f.toFun (x, y) := sorry

/- Check `HaarMeasureWithValues.prod_counting`: On a product of finite discrete groups, product integration is Σ_x Σ_y f(x,y). -/
example [Fintype G] [Fintype H] [DiscreteTopology G] [DiscreteTopology H]
    (f : LocallyConstantCompact (G × H) M) :
    ((HaarMeasureWithValues.counting (G := G) (A := A)).prod
      (HaarMeasureWithValues.counting (G := H) (A := A))).integrateModule f =
        ∑ x, ∑ y, f.toFun (x, y) := sorry
end ProductIntegration

/-- The Hecke algebra `H(G, A)`: compactly supported locally constant functions with the
convolution of the measure `μ`. -/
def HeckeAlgebra (_μ : HaarMeasureWithValues G A) : Type _ := LocallyConstantCompact G A

noncomputable instance [LocallyCompactSpace G] [T2Space G]
    (μ : HaarMeasureWithValues G A) : NonUnitalRing (HeckeAlgebra μ) := sorry
noncomputable instance [LocallyCompactSpace G] [T2Space G]
    (μ : HaarMeasureWithValues G A) : Module A (HeckeAlgebra μ) := sorry

/-- Convolution is integration of the product against the specified measure. A finite
compact-open indicator expansion gives its value independently of that expansion. -/
theorem HeckeAlgebra.mul_apply [LocallyCompactSpace G] [T2Space G]
    (μ : HaarMeasureWithValues G A) (f g : HeckeAlgebra μ) (x : G)
    (s : Finset (TopologicalSpace.CompactOpens G))
    (a : TopologicalSpace.CompactOpens G → A)
    (hf : ∀ y, f.toFun y * g.toFun (y⁻¹ * x) =
      ∑ U ∈ s, if y ∈ U then a U else 0) :
    (f * g).toFun x = ∑ U ∈ s, μ.vol U * a U := sorry

theorem HeckeAlgebra.add_smul_apply [LocallyCompactSpace G] [T2Space G]
    (μ : HaarMeasureWithValues G A) (f g : HeckeAlgebra μ) (a : A) (x : G) :
    (f + g).toFun x = f.toFun x + g.toFun x ∧
      (a • f).toFun x = a * f.toFun x := sorry

/-- The normalised idempotent `e_U = μ(U)⁻¹ 1_U`, defined when `μ(U)` is a unit. -/
noncomputable def HeckeAlgebra.idempotent (μ : HaarMeasureWithValues G A)
    [LocallyCompactSpace G] [T2Space G]
    (U : TopologicalSpace.CompactOpens G) (_hsub : ∃ K : Subgroup G, (K : Set G) = (U : Set G))
    (_h : IsUnit (μ.vol U)) : HeckeAlgebra μ := sorry

/-- The normalized characteristic function has the prescribed value at every point. -/
theorem HeckeAlgebra.idempotent_apply (μ : HaarMeasureWithValues G A)
    [LocallyCompactSpace G] [T2Space G]
    (U : TopologicalSpace.CompactOpens G) (hsub : ∃ K : Subgroup G, (K : Set G) = (U : Set G))
    (h : IsUnit (μ.vol U)) (x : G) :
    (HeckeAlgebra.idempotent μ U hsub h).toFun x =
      if x ∈ U then (↑(h.unit⁻¹) : A) else 0 := sorry

theorem HeckeAlgebra.idempotent_mul_self (μ : HaarMeasureWithValues G A)
    [LocallyCompactSpace G] [T2Space G]
    (U : TopologicalSpace.CompactOpens G) (hsub : ∃ K : Subgroup G, (K : Set G) = (U : Set G))
    (h : IsUnit (μ.vol U)) :
    HeckeAlgebra.idempotent μ U hsub h * HeckeAlgebra.idempotent μ U hsub h = HeckeAlgebra.idempotent μ U hsub h := sorry

/-- The Hecke algebra of level `U` over any ring: endomorphisms of the permutation module
`A[G/U]` as an `A[G]`-module. -/
abbrev HeckeAlgebraLevel (A G : Type u) [CommRing A] [Group G] (U : Subgroup G) :=
  Module.End (MonoidAlgebra A G) (Representation.ofMulAction A G (G ⧸ U)).asModule

/-- The level-`U` Hecke algebra is the double-coset Hecke ring of Mathlib and Tau Ceti. -/
noncomputable def HeckeAlgebraLevel.equivHeckeRing {A G : Type u} [CommRing A] [Group G]
    [TopologicalSpace G] (U : OpenSubgroup G)
    [IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup] :
    HeckeAlgebraLevel A G U.toSubgroup ≃+* HeckeRing (⊤ : Submonoid G) U.toSubgroup A := sorry

/-- A double-coset coefficient is read from the image of the identity coset,
at the inverse coset. This fixes the permutation-endomorphism convention. -/
theorem HeckeAlgebraLevel.equivHeckeRing_apply {A G : Type u} [CommRing A] [Group G]
    [TopologicalSpace G] (U : OpenSubgroup G)
    [IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup]
    (f : HeckeAlgebraLevel A G U.toSubgroup) (g : G) :
    HeckeAlgebraLevel.equivHeckeRing U f
        (HeckeCoset.mk U.toSubgroup U.toSubgroup ⟨g, trivial⟩) =
      ((Representation.ofMulAction A G (G ⧸ U.toSubgroup)).asModuleEquiv
        (f ((Representation.ofMulAction A G (G ⧸ U.toSubgroup)).asModuleEquiv.symm
          (MonoidAlgebra.single (QuotientGroup.mk (s := U.toSubgroup) 1) 1)))).coeff
        (QuotientGroup.mk (s := U.toSubgroup) g⁻¹) := sorry

example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    (U : OpenSubgroup G) [IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup] :
    HeckeAlgebraLevel.equivHeckeRing (A := A) U 0 = 0 := by simp
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    (U : OpenSubgroup G) [IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup]
    (g : G) :
    HeckeAlgebraLevel.equivHeckeRing (A := A) U 1
      (HeckeCoset.mk U.toSubgroup U.toSubgroup ⟨g, trivial⟩) =
        if g ∈ U then 1 else 0 := sorry
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    (U : OpenSubgroup G) [IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup]
    (g h : G) :
    let ρ := Representation.ofMulAction A G (G ⧸ U.toSubgroup)
    let D := HeckeCoset.mk U.toSubgroup U.toSubgroup (⟨g, trivial⟩ : (⊤ : Submonoid G))
    let f := (HeckeAlgebraLevel.equivHeckeRing (A := A) U).symm
      (HeckeCosetModule.of (Finsupp.single D 1))
    (ρ.asModuleEquiv (f (ρ.asModuleEquiv.symm
      (MonoidAlgebra.single (QuotientGroup.mk (s := U.toSubgroup) 1) 1)))).coeff
      (QuotientGroup.mk (s := U.toSubgroup) h⁻¹) =
        if HeckeCoset.mk U.toSubgroup U.toSubgroup (⟨h, trivial⟩ : (⊤ : Submonoid G)) = D
        then 1 else 0 := sorry
/-- Through `V^U = Hom_G(A[G/U], V)` the basis element `[UgU]` therefore acts on invariants by
`v ↦ Σ_{Ug' ⊆ UgU} ρ(g')⁻¹ v`, the convolution operator of `1_{Ug⁻¹U}`. For the discrete group `ℤ`
with trivial `U`, the double coset of the generator sends `δ_0` to `δ_{-1}`, not to `δ_1`. -/
example (U : OpenSubgroup (Multiplicative ℤ)) (hU : U.toSubgroup = ⊥)
    [IsHeckeTriple (⊤ : Submonoid (Multiplicative ℤ)) U.toSubgroup U.toSubgroup] :
    let ρ := Representation.ofMulAction ℚ (Multiplicative ℤ) (Multiplicative ℤ ⧸ U.toSubgroup)
    let D := HeckeCoset.mk U.toSubgroup U.toSubgroup
      (⟨Multiplicative.ofAdd 1, trivial⟩ : (⊤ : Submonoid (Multiplicative ℤ)))
    let f := (HeckeAlgebraLevel.equivHeckeRing (A := ℚ) U).symm
      (HeckeCosetModule.of (Finsupp.single D 1))
    let v := ρ.asModuleEquiv (f (ρ.asModuleEquiv.symm
      (MonoidAlgebra.single (QuotientGroup.mk (s := U.toSubgroup) 1) 1)))
    v.coeff (QuotientGroup.mk (s := U.toSubgroup) (Multiplicative.ofAdd (-1))) = 1 ∧
      v.coeff (QuotientGroup.mk (s := U.toSubgroup) (Multiplicative.ofAdd 1)) = 0 := sorry

-- HeckeAlgebraLevel.ring_test
example {A G : Type u} [CommRing A] [Group G] (U : Subgroup G) : Ring (HeckeAlgebraLevel A G U) := inferInstance
-- HeckeAlgebraLevel.top
example {A G : Type u} [CommRing A] [Group G] :
    Nonempty (HeckeAlgebraLevel A G (⊤ : Subgroup G) ≃+* A) := sorry
-- HeckeAlgebraLevel.bot_discrete
example {A G : Type u} [CommRing A] [Group G] :
    Nonempty (HeckeAlgebraLevel A G (⊥ : Subgroup G) ≃+* (MonoidAlgebra A G)ᵐᵒᵖ) := sorry
-- LocallyConstantCompact.zero
example [Zero A] : Nonempty (LocallyConstantCompact G A) := sorry

-- A compact open coset need not be a subgroup or give an idempotent.
example [LocallyCompactSpace G] [T2Space G] (μ : HaarMeasureWithValues G A)
    (hμ : ∀ U, μ.vol U = 0) (f g : HeckeAlgebra μ) (x : G) :
    (f * g).toFun x = 0 := sorry
example [Finite G] [Fintype G] [DiscreteTopology G]
    (f g : HeckeAlgebra (HaarMeasureWithValues.counting (G := G) (A := A))) (x : G) :
    (f * g).toFun x = ∑ y, f.toFun y * g.toFun (y⁻¹ * x) := sorry
example
    (f g : HeckeAlgebra (HaarMeasureWithValues.counting
      (G := Multiplicative (ZMod 2)) (A := ℚ))) :
    (f * g).toFun 1 = f.toFun 1 * g.toFun 1 +
      f.toFun (Multiplicative.ofAdd 1) * g.toFun (Multiplicative.ofAdd 1) := sorry
example (U : TopologicalSpace.CompactOpens (Multiplicative (ZMod 2)))
    (hU : (U : Set (Multiplicative (ZMod 2))) = Set.univ) (x : Multiplicative (ZMod 2)) :
    (HeckeAlgebra.idempotent (HaarMeasureWithValues.counting (A := ℚ))
      U (by sorry) (by sorry)).toFun x = 1 / 2 := sorry
example [LocallyCompactSpace G] [T2Space G] (μ : HaarMeasureWithValues G A)
    (U : TopologicalSpace.CompactOpens G)
    (hU : ∃ K : Subgroup G, (K : Set G) = (U : Set G)) (hv : IsUnit (μ.vol U))
    (x : G) (hx : x ∉ U) : (HeckeAlgebra.idempotent μ U hU hv).toFun x = 0 := sorry
example [LocallyCompactSpace G] [T2Space G] (μ : HaarMeasureWithValues G A)
    (U : TopologicalSpace.CompactOpens G)
    (hU : ∃ K : Subgroup G, (K : Set G) = (U : Set G)) (hv : IsUnit (μ.vol U)) :
    HeckeAlgebra.idempotent μ U hU hv * HeckeAlgebra.idempotent μ U hU hv =
      HeckeAlgebra.idempotent μ U hU hv := sorry
theorem HeckeAlgebra.idempotent_nonSubgroup :
    let d : MonoidAlgebra ℚ (Multiplicative (ZMod 2)) :=
      MonoidAlgebra.single (Multiplicative.ofAdd 1) 1
    d * d = 1 ∧ d ≠ 1 := sorry

/- Check `HeckeAlgebra.idempotent_nonSubgroup`: In C₂ a singleton coset gives δ_s² = 1 and δ_s ≠ 1. -/
example :
    let d : MonoidAlgebra ℚ (Multiplicative (ZMod 2)) :=
      MonoidAlgebra.single (Multiplicative.ofAdd 1) 1
    d * d = 1 ∧ d ≠ 1 := sorry
-- Two noncommuting basis elements pin the convolution multiplication order.
theorem HeckeAlgebra.mul_order :
    let s := Equiv.swap (0 : Fin 3) 1
    let t := Equiv.swap (1 : Fin 3) 2
    (MonoidAlgebra.single s (1 : ℤ) * MonoidAlgebra.single t 1).coeff (s * t) = 1 ∧
      (MonoidAlgebra.single s (1 : ℤ) * MonoidAlgebra.single t 1).coeff (t * s) = 0 := sorry

/- Check `HeckeAlgebra.mul_order`: In S₃, δ_s δ_t has coefficient 1 at st and 0 at ts. -/
example :
    let s := Equiv.swap (0 : Fin 3) 1
    let t := Equiv.swap (1 : Fin 3) 2
    (MonoidAlgebra.single s (1 : ℤ) * MonoidAlgebra.single t 1).coeff (s * t) = 1 ∧
      (MonoidAlgebra.single s (1 : ℤ) * MonoidAlgebra.single t 1).coeff (t * s) = 0 := sorry

end HeckeAlgebras

/-! ## Layer SR.2: induction, compact induction and Jacquet functors -/

section Induction
variable {A : Type*} [CommRing A] {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
variable {V W : Type*} [AddCommGroup V] [Module A V] [AddCommGroup W] [Module A W]

/-- Smooth induction from a subgroup `H`: the smooth vectors of algebraic coinduction. -/
noncomputable def Representation.ind (H : Subgroup G) (σ : Representation A H W) :
    Subrepresentation (Representation.coind H.subtype σ) :=
  Representation.smoothVectors (Representation.coind H.subtype σ)

/-- Frobenius reciprocity for smooth induction: `Res ⊣ Ind`. -/
noncomputable def Representation.indResEquiv (H : Subgroup G) (π : Representation A G V)
    (σ : Representation A H W) (_hπ : Representation.IsSmooth π) (_hσ : Representation.IsSmooth σ) :
    Representation.IntertwiningMap π (Representation.ind H σ).toRepresentation ≃
      Representation.IntertwiningMap (π.comp H.subtype) σ := sorry

theorem Representation.ind_isSmooth (H : Subgroup G) (σ : Representation A H W) :
    Representation.IsSmooth (Representation.ind H σ).toRepresentation := sorry

-- Representation.ind_top
theorem SmoothRep.ind_self (σ : Representation A (⊤ : Subgroup G) W) (hs : Representation.IsSmooth σ) :
    Nonempty (Representation.Equiv (Representation.ind ⊤ σ).toRepresentation
      (σ.comp (Subgroup.topEquiv).symm.toMonoidHom)) := sorry

/- Check `SmoothRep.ind_self`: Ind_G^G σ ≅ σ. -/
example (σ : Representation A (⊤ : Subgroup G) W) (hs : Representation.IsSmooth σ) :
    Nonempty (Representation.Equiv (Representation.ind ⊤ σ).toRepresentation
      (σ.comp (Subgroup.topEquiv).symm.toMonoidHom)) := sorry
-- Representation.ind_trivial_bot
example [DiscreteTopology G] [Finite G] :
    Nonempty (Representation.Equiv
      (Representation.ind (⊥ : Subgroup G) (Representation.trivial A (⊥ : Subgroup G) A)).toRepresentation
      (Representation.ofMulAction A G G)) := sorry
-- Representation.jacquetModule_bot
theorem SmoothRep.jacquet_N_trivial (ρ : Representation A G V) : Nonempty (Representation.Coinvariants (ρ.comp (⊥ : Subgroup G).subtype) ≃ₗ[A] V) := sorry

/- Check `SmoothRep.jacquet_N_trivial`: if N = ⊥ then V_N ≅ V. -/
example (ρ : Representation A G V) : Nonempty (Representation.Coinvariants (ρ.comp (⊥ : Subgroup G).subtype) ≃ₗ[A] V) := sorry

end Induction

/-! ## Layer SR.3: the sourced dimension bound -/

/-- Bernstein–Zelevinsky [BZ76], Lemma 4.10, p. 39, proof 4.12, p. 40.
The source states this over `ℂ`; `l` is the number of algebra generators, excluding the unit. -/
theorem commutativeSubalgebraBound {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (R : Subalgebra ℂ (Module.End ℂ V))
    (l : ℕ) (hl : 1 ≤ l) (hm : 1 ≤ Module.finrank ℂ V)
    (generators : Fin l → Module.End ℂ V)
    (hgen : Algebra.adjoin ℂ (Set.range generators) = R)
    (hcomm : ∀ x y : R, x * y = y * x) :
    (Module.finrank ℂ R : ℝ) ≤
      (Module.finrank ℂ V : ℝ) ^ (2 - (2 : ℝ) ^ (1 - (l : ℤ))) := sorry

example : (2 : ℝ) - (2 : ℝ) ^ (1 - (3 : ℤ)) = 7 / 4 := by norm_num
example : (2 : ℝ) - (2 : ℝ) ^ (1 - (1 : ℤ)) = 1 := by norm_num

/-- HKP [HKP], (1.5.1)–(1.5.2), p. 2: the coefficient character is the inverse
of the tautological character. In rank one the two Laurent monomials differ. -/
theorem hkpInverseCoefficient :
    (MonoidAlgebra.single (Multiplicative.ofAdd (-1 : ℤ)) (1 : ℚ)) ≠
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℤ)) 1 := by
  intro h
  have hcoeff := congrArg (fun f : MonoidAlgebra ℚ (Multiplicative ℤ) =>
    f.coeff (Multiplicative.ofAdd (-1 : ℤ))) h
  norm_num [MonoidAlgebra.coeff_single, Finsupp.single_apply] at hcoeff
  have hz := congrArg Multiplicative.toAdd hcoeff
  change (1 : ℤ) = -1 at hz
  omega

/-! ## Layer SR.4: spherical representations and Satake -/


section Pseudoroot
variable {W H : Type*} [Group W] [CommGroup H]
/-- Both the square and twisted fixed-point conditions are required. In the Satake application
`H` is the dual torus, `twist w = ((wΣ* − Σ*)/2)(q)` and `sigmaQ = Σ*(q)⁻¹`, so that with the raw
transform `S*f(t) = ∫_N f(tn) dn` the canonical pseudoroot is the parameter of `δ_P^{1/2}`.
TV [TV], (2.9.2), p. 187, uses the direct dictionary for `v(ϖ) = 1`. The printed
(7.2.1), p. 206, and §7.4(a), p. 209, have the inverse twist and square; `inv_iff`
transports those point formulas. Their signs disagree with the raw transform (7.2.5)
and the modulus character (7.4.2) under that direct dictionary; see the GL₂ controls. -/
def Pseudoroot (a : W →* MulAut H) (twist : W → H) (sigmaQ x : H) : Prop :=
  x * x = sigmaQ ∧ ∀ w, a w x * twist w = x
namespace Pseudoroot
/-- Inverting a point inverts both the twist and the prescribed square. This compares
TV's printed point formulas with the direct-lattice Satake convention. -/
theorem inv_iff (a : W →* MulAut H) (d : W → H) (s x : H) :
    Pseudoroot a (fun w => (d w)⁻¹) s⁻¹ x⁻¹ ↔ Pseudoroot a d s x := by
  simp only [Pseudoroot, map_inv, ← mul_inv, inv_inj]

theorem square (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) : x * x = s := sorry
theorem fixed (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) (w : W) : a w x * d w = x := sorry
theorem translate (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) (w : W) (y : H) :
    a w (y * x) * d w = a w y * x := sorry
theorem even (a : W →* MulAut H) (d : W → H) (x : H)
    (h : ∀ w, a w x * d w = x) : Pseudoroot a d (x * x) x := sorry
theorem trivial (a : W →* MulAut H) : Pseudoroot a (fun _ => 1) 1 1 := sorry
/-- In characteristic two squaring is injective on the dual torus, so a pseudoroot is unique
when it exists. There the odd residue cardinality `q` maps to `1`, so `Σ*(q) = 1`, the twist is
trivial and the identity is that pseudoroot; `Σ*(q) ≠ 1` has no characteristic-two instance. -/
theorem characteristicTwo (a : W →* MulAut H) (d : W → H) (s x y : H)
    (hinj : Function.Injective (fun z : H => z * z))
    (hx : Pseudoroot a d s x) (hy : Pseudoroot a d s y) : x = y := sorry
/- Check `Pseudoroot.characteristicTwo`: over a coefficient field of characteristic two, squaring is injective, so a pseudoroot is unique when it exists. Since p is then odd, q maps to 1, so Σ*(q) = 1, the twist is trivial and the identity is the pseudoroot: the condition Σ*(q) ≠ 1 has no characteristic-two instance. -/
example (a : W →* MulAut H) (d : W → H) (s x y : H)
    (hinj : Function.Injective (fun z : H => z * z))
    (hx : Pseudoroot a d s x) (hy : Pseudoroot a d s y) : x = y := sorry
/-- The identity is not a pseudoroot when `Σ*(q)⁻¹ ≠ 1`, which needs coefficients of
characteristic other than two: a negative control for the square condition. -/
theorem square_controls (a : W →* MulAut H) (d : W → H) (s : H) (hs : s ≠ 1) : ¬ Pseudoroot a d s 1 := sorry

/- Check `Pseudoroot.square_controls`: The square condition rejects the identity with nontrivial prescribed square and a bad invariant translate. -/
example (a : W →* MulAut H) (d : W → H) (s : H) (hs : s ≠ 1) : ¬ Pseudoroot a d s 1 := sorry
/-- A pseudoroot times a Weyl-invariant `c` with `c² ≠ 1` is still twisted-fixed but fails the
square condition, so the fixed-point condition alone does not determine the pseudoroot. -/
/- Check `Pseudoroot.square_controls`: The square condition rejects the identity with nontrivial prescribed square and a bad invariant translate. -/
example (a : W →* MulAut H) (d : W → H) (s x c : H) (hx : Pseudoroot a d s x)
    (hc : ∀ w, a w c = c) (hc2 : c * c ≠ 1) :
    (∀ w, a w (x * c) * d w = x * c) ∧ ¬ Pseudoroot a d s (x * c) := by
  refine ⟨fun w => ?_, fun h => hc2 ?_⟩
  · rw [map_mul, hc, mul_right_comm, hx.2 w]
  · have h1 := h.1
    rw [← hx.1] at h1
    have : x * x * (c * c) = x * x * 1 := by
      rw [mul_one, mul_mul_mul_comm]; exact h1
    exact mul_left_cancel this
/- Check `Pseudoroot.trivial`: for a torus Σ* = 0, the identity is a pseudoroot. -/
example (a : W →* MulAut H) : Pseudoroot a (fun _ => 1) 1 1 := sorry
example (a : W →* MulAut H) (d : W → H) (x : H)
    (h : ∀ w, a w x * d w = x) : Pseudoroot a d (x * x) x := sorry
example (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) (w : W) (y : H) :
    a w (y * x) * d w = a w y * x := sorry
end Pseudoroot

/-- The twisted Weyl action matches the raw Satake transform. For `GL₂` over a local field with
`q = 3`, `S*(1_{K diag(ϖ,1) K})` is `q` at `diag(ϖ,1)` and `1` at `diag(1,ϖ)`; as a function on
`ℤ²` it is invariant under `c ↦ (λ ↦ q^{λ₁ − λ₂} c(λ₂, λ₁))`, the reflection twisted by
`((sΣ* − Σ*)/2)(q)`, and not under the reflection twisted by `((Σ* − sΣ*)/2)(q)`. -/
theorem directLatticeSatake :
    let c : ℤ × ℤ → ℚ := fun l => if l = (1, 0) then 3 else if l = (0, 1) then 1 else 0
    (∀ l : ℤ × ℤ, (3 : ℚ) ^ (l.1 - l.2) * c (l.2, l.1) = c l) ∧
      ¬ ∀ l : ℤ × ℤ, (3 : ℚ) ^ (l.2 - l.1) * c (l.2, l.1) = c l := by
  intro c
  refine ⟨fun l => ?_, fun h => ?_⟩
  · rcases l with ⟨a, b⟩
    by_cases h1 : (a, b) = (1, 0)
    · simp only [Prod.mk.injEq] at h1; obtain ⟨rfl, rfl⟩ := h1; simp [c]
    by_cases h2 : (a, b) = (0, 1)
    · simp only [Prod.mk.injEq] at h2; obtain ⟨rfl, rfl⟩ := h2; norm_num [c]
    have h3 : (b, a) ≠ (1, 0) := by
      intro h; apply h2; simp only [Prod.mk.injEq] at h ⊢; omega
    have h4 : (b, a) ≠ (0, 1) := by
      intro h; apply h1; simp only [Prod.mk.injEq] at h ⊢; omega
    simp [c, h1, h2, h3, h4]
  · have := h (1, 0)
    norm_num [c] at this
/-- TV's printed twist fixes the raw transform only after inverting the lattice.
The same `q = 3` coefficients now sit at negative cocharacters. -/
theorem tvInverseLattice :
    let c : ℤ × ℤ → ℚ := fun l => if l = (-1, 0) then 3 else if l = (0, -1) then 1 else 0
    (∀ l : ℤ × ℤ, (3 : ℚ) ^ (l.2 - l.1) * c (l.2, l.1) = c l) ∧
      ¬ ∀ l : ℤ × ℤ, (3 : ℚ) ^ (l.1 - l.2) * c (l.2, l.1) = c l := by
  intro c
  refine ⟨fun l => ?_, fun h => ?_⟩
  · rcases l with ⟨a, b⟩
    by_cases h1 : (a, b) = (-1, 0)
    · simp only [Prod.mk.injEq] at h1; obtain ⟨rfl, rfl⟩ := h1; norm_num [c]
    by_cases h2 : (a, b) = (0, -1)
    · simp only [Prod.mk.injEq] at h2; obtain ⟨rfl, rfl⟩ := h2; norm_num [c]
    have h3 : (b, a) ≠ (-1, 0) := by
      intro h; apply h2; simp only [Prod.mk.injEq] at h ⊢; omega
    have h4 : (b, a) ≠ (0, -1) := by
      intro h; apply h1; simp only [Prod.mk.injEq] at h ⊢; omega
    simp [c, h1, h2, h3, h4]
  · have := h (-1, 0)
    norm_num [c] at this
end Pseudoroot

namespace parabolicDescent
/-- Leslie [Les], Lemma 3.2, p. 24: `q` is the base-field residue size, so
`|ϖ|_E = q⁻²`. Both determinant twists have positive half-exponents. -/
def xiVariables {A : Type*} [CommRing A] (q : Aˣ) (a b : ℕ)
    (x : Fin a → A) (y : Fin b → A) : (Fin a → A) × (Fin b → A) :=
  (fun i => ((q⁻¹ : Aˣ) : A) ^ b * x i,
   fun j => ((q⁻¹ : Aˣ) : A) ^ a * y j)

/- Check `parabolicDescent.xiVariables`: ξ_{(a,b)} replaces the first a variables by q^{−b} X_i and the last b by q^{−a} Y_j. For a = 1, b = 2, q = 3 and all coordinates 1, the -/
example : xiVariables (Units.mk0 (3 : ℚ) (by norm_num)) 1 2 (fun _ => 1) (fun _ => 1) =
    ((fun _ => 1 / 9), (fun _ => 1 / 3)) := by
  norm_num [xiVariables]
end parabolicDescent

section Parameters
variable {A : Type*} [CommRing A]
structure PairedParameter (n : ℕ) where
  alpha : Fin n → Aˣ
  paired : ∀ i, alpha i * alpha i.rev = 1
  middle : ∀ i, 2 * i.val + 1 = n → alpha i = 1
namespace PairedParameter
def polynomial {n : ℕ} (a : PairedParameter (A := A) n) : A[X] :=
  ∏ i, (X - C (a.alpha i : A))
theorem reciprocal {n : ℕ} (a : PairedParameter (A := A) n) :
    a.polynomial.reverse = C ((-1 : A) ^ n) * a.polynomial := sorry
theorem weyl {n : ℕ} (a : PairedParameter (A := A) n) (σ : Equiv.Perm (Fin n)) :
    (∏ i, (X - C (a.alpha (σ i) : A))) = a.polynomial := sorry
theorem rankOne (a : PairedParameter (A := A) 1) : a.alpha 0 = 1 := sorry
theorem rankTwo (a : Aˣ) :
    (X - C (a : A)) * (X - C ((a⁻¹ : Aˣ) : A)) =
      X^2 - C ((a : A) + ((a⁻¹ : Aˣ) : A)) * X + 1 := sorry
/-- A reciprocal polynomial need not split over the coefficient field: `X² − 3X + 1` over `ℚ` is
reciprocal and has no rational root, so it admits no paired ordering of roots. -/
theorem productRing :
    (X ^ 2 - 3 * X + 1 : ℚ[X]).reverse = X ^ 2 - 3 * X + 1 ∧
      ¬ ∃ r : ℚ, r ^ 2 - 3 * r + 1 = 0 := sorry
example (a : PairedParameter (A := A) 1) : a.alpha 0 = 1 := sorry
/- Check `PairedParameter.rankTwo`: for units a, a⁻¹, P = T² − (a + a⁻¹)T + 1. -/
example (a : Aˣ) :
    (X - C (a : A)) * (X - C ((a⁻¹ : Aˣ) : A)) =
      X^2 - C ((a : A) + ((a⁻¹ : Aˣ) : A)) * X + 1 := sorry
example : ¬ ∃ r : ℚ, r ^ 2 - 3 * r + 1 = 0 := sorry
example (a : PairedParameter (A := A) 0) : a.polynomial = 1 := sorry
example : (X - 1 : ℤ[X]).reverse = -(X - 1) := sorry
example : (X^2 - 3*X + 1 : ℤ[X]).reverse = X^2 - 3*X + 1 := sorry

end PairedParameter

inductive GenericityKind | oddTate | oddIntertwining | evenSpecial | evenIntertwining
/-- The four polynomial tests of Liu–Tian–Xiao–Zhang [LTXZZ], Definition 3.1.5,
pp. 139–140. `AtRank` below supplies the monicity, reciprocity, unit and parity hypotheses.
The source calls the even raising condition "level-raising special". -/
def UnitaryGenericity (kind : GenericityKind) (P : A[X]) (q : A) : Prop :=
  match kind with
  | .oddTate => IsUnit (P.derivative.eval 1)
  | .oddIntertwining => IsUnit (P.eval (-q))
  | .evenSpecial => P.eval q = 0 ∧ IsUnit (P.derivative.eval q)
  | .evenIntertwining => IsUnit (P.eval (-1))
namespace UnitaryGenericity
/-- The full inert-place hypotheses of [LTXZZ], Definition 3.1.5, pp. 139–140.
`reverse` expresses the reciprocal Laurent identity after clearing powers. -/
def AtRank (kind : GenericityKind) (N : ℕ) (P : A[X]) (q : A) : Prop :=
  IsUnit q ∧ P.Monic ∧ P.natDegree = N ∧
    P.reverse = C ((-1 : A) ^ N) * P ∧
    (match kind with
      | .oddTate | .oddIntertwining => Odd N
      | .evenSpecial | .evenIntertwining => Even N) ∧
    UnitaryGenericity kind P q

namespace AtRank
theorem baseChange {B : Type*} [CommRing B] [Nontrivial B] (φ : A →+* B)
    (kind : GenericityKind) (N : ℕ) (P : A[X]) (q : A)
    (h : AtRank kind N P q) : AtRank kind N (P.map φ) (φ q) := sorry

/- Check `UnitaryGenericity.AtRank`: over ℚ, T − 1 passes odd Tate at rank one but cannot pass an even-rank condition, even when its polynomial evaluation is a unit. -/
example : AtRank .oddTate 1 (X - 1 : ℚ[X]) 3 := sorry
-- The raw even intertwining test passes, but the source condition rejects odd rank.
/- Check `UnitaryGenericity.AtRank`: over ℚ, T − 1 passes odd Tate at rank one but cannot pass an even-rank condition, even when its polynomial evaluation is a unit. -/
example : UnitaryGenericity .evenIntertwining (X - 1 : ℚ[X]) 3 ∧
    ¬ AtRank .evenIntertwining 1 (X - 1 : ℚ[X]) 3 := by
  constructor
  · norm_num [UnitaryGenericity]
  · intro h
    have hp := h.2.2.2.2.1
    norm_num at hp
end AtRank

theorem oddTate (P : A[X]) (q : A) :
    UnitaryGenericity .oddTate P q ↔ IsUnit (P.derivative.eval 1) := sorry
theorem evenSpecial (P : A[X]) (q : A) :
    UnitaryGenericity .evenSpecial P q ↔ P.eval q = 0 ∧ IsUnit (P.derivative.eval q) := sorry
theorem baseChange {B : Type*} [CommRing B] (φ : A →+* B) (k : GenericityKind)
    (P : A[X]) (q : A) (h : UnitaryGenericity k P q) :
    UnitaryGenericity k (P.map φ) (φ q) := sorry
theorem doubleRoot [Nontrivial A] :
    ¬ UnitaryGenericity .evenSpecial ((X - C (1 : A))^2) 1 := sorry
theorem oddOne : UnitaryGenericity .oddTate (X - C (1 : A)) 1 := sorry
theorem collision [Nontrivial A] :
    ¬ UnitaryGenericity .oddIntertwining (X - C (1 : A)) (-1) := sorry
/- Check `UnitaryGenericity.doubleRoot`: for rank two with q = 1 and P = (T − 1)², the even level-raising special condition fails. -/
example [Nontrivial A] :
    ¬ UnitaryGenericity .evenSpecial ((X - C (1 : A))^2) 1 := sorry
/- Check `UnitaryGenericity.oddOne`: for P = T − 1 the odd Tate condition holds. -/
example : UnitaryGenericity .oddTate (X - C (1 : A)) 1 := sorry
/- Check `UnitaryGenericity.collision`: for P = T − 1 and q = −1, odd intertwining fails despite there being no nonmiddle reciprocal pair. -/
example [Nontrivial A] :
    ¬ UnitaryGenericity .oddIntertwining (X - C (1 : A)) (-1) := sorry
end UnitaryGenericity

def SpinPolynomial (q T0 T1 T2 : A) : A[X] :=
  1 - C T2 * X + C (q * (T1 + (q^2 + 1) * T0)) * X^2 -
    C (q^3 * T2 * T0) * X^3 + C (q^6 * T0^2) * X^4
namespace SpinPolynomial
theorem constant (q T0 T1 T2 : A) : (SpinPolynomial q T0 T1 T2).eval 0 = 1 := sorry
theorem coefficients (q T0 T1 T2 : A) :
    (SpinPolynomial q T0 T1 T2).coeff 4 = q^6 * T0^2 ∧
    (SpinPolynomial q T0 T1 T2).coeff 1 = -T2 := sorry
theorem reciprocal (q T0 T1 T2 : A) :
    Polynomial.reflect 4 (SpinPolynomial q T0 T1 T2) =
      X^4 - C T2 * X^3 + C (q*T1+(q^3+q)*T0)*X^2 -
        C (q^3*T2*T0)*X + C (q^6*T0^2) := sorry
theorem rankFour (q T0 T1 T2 : A) :
    (SpinPolynomial q T0 T1 T2).coeff 2 = q*T1+(q^3+q)*T0 := sorry
theorem similitude (q T0 : A) (a b c d : A) (hq : IsUnit q)
    (hab : a*d=b*c) (hT0 : q^3*T0=a*d) : q^6*T0^2=a*b*c*d := sorry
theorem centralScaling (q T0 T1 T2 z : A) (j : ℕ) :
    (SpinPolynomial q (z^2*T0) (z^2*T1) (z*T2)).coeff j =
      z^j * (SpinPolynomial q T0 T1 T2).coeff j := sorry
example (q T0 T1 T2 : A) :
    (SpinPolynomial q T0 T1 T2).coeff 2 = q*T1+(q^3+q)*T0 := sorry
/- Check `SpinPolynomial.similitude`: for roots α, β, γ, δ with αδ = βγ, its top coefficient is their product. -/
example (q T0 : A) (a b c d : A) (hq : IsUnit q)
    (hab : a*d=b*c) (hT0 : q^3*T0=a*d) : q^6*T0^2=a*b*c*d := sorry
/- Check `SpinPolynomial.centralScaling`: scaling all four spin roots by c multiplies the coefficient of X^j by c^j. -/
example (q T0 T1 T2 z : A) (j : ℕ) :
    (SpinPolynomial q (z^2*T0) (z^2*T1) (z*T2)).coeff j =
      z^j * (SpinPolynomial q T0 T1 T2).coeff j := sorry
example : SpinPolynomial (1 : ℤ) 1 4 4 = (1 - X)^4 := sorry
example : SpinPolynomial (0 : ℤ) 1 2 3 = 1 - 3*X := sorry

end SpinPolynomial
end Parameters

section HallLittlewood
variable {K : Type*} [Field K]
def inversionLength {n : ℕ} (w : Equiv.Perm (Fin n)) : ℕ :=
  (Finset.univ.filter (fun ij : Fin n × Fin n => ij.1 < ij.2 ∧ w ij.2 < w ij.1)).card
def hallNormalizer {n : ℕ} (lam : Fin n → ℤ) (t : K) : K :=
  ∑ w ∈ Finset.univ.filter (fun w : Equiv.Perm (Fin n) => ∀ i, lam (w i) = lam i),
    t ^ inversionLength w
/-- Rational evaluation of the symmetrized expression, using total division in the field. -/
def hallLittlewoodEval {n : ℕ} (lam : Fin n → ℤ) (t : K) (x : Fin n → K) : K :=
  (∑ w : Equiv.Perm (Fin n), (∏ i, x (w i) ^ lam i) *
    ∏ ij ∈ Finset.univ.filter (fun ij : Fin n × Fin n => ij.1 < ij.2),
      (x (w ij.1) - t * x (w ij.2)) / (x (w ij.1) - x (w ij.2))) /
    hallNormalizer lam t
namespace HallLittlewood
example : inversionLength (1 : Equiv.Perm (Fin 0)) = 0 := sorry
example : inversionLength (1 : Equiv.Perm (Fin 2)) = 0 := sorry
example : inversionLength (Equiv.swap (0 : Fin 2) 1) = 1 := sorry
example (t : K) : hallNormalizer (fun _ : Fin 0 => 0) t = 1 := sorry
example (t : K) : hallNormalizer (fun _ : Fin 2 => 0) t = 1 + t := sorry
example (t : K) : hallNormalizer (fun i : Fin 2 => (i.val : ℤ)) t = 1 := sorry
theorem symmetric {n : ℕ} (lam : Fin n → ℤ) (t : K) (x : Fin n → K)
    (w : Equiv.Perm (Fin n)) : hallLittlewoodEval lam t (x ∘ w) = hallLittlewoodEval lam t x := sorry
theorem homogeneous {n : ℕ} (lam : Fin n → ℤ) (t z : K) (hz : z ≠ 0)
    (x : Fin n → K) :
    hallLittlewoodEval lam t (fun i => z * x i) = z ^ (∑ i, lam i) * hallLittlewoodEval lam t x := sorry
/-- For dominant nonnegative exponents the rational evaluation agrees with an integral
polynomial wherever its denominators are nonzero. -/
theorem integralEvaluation [CharZero K] {n : ℕ} (lam : Fin n → ℤ)
    (hdom : ∀ i j, i ≤ j → lam j ≤ lam i) (hpos : ∀ i, 0 ≤ lam i) :
    ∃ P : MvPolynomial (Option (Fin n)) ℤ, ∀ (t : K) (x : Fin n → K),
      Function.Injective x → hallNormalizer lam t ≠ 0 →
      hallLittlewoodEval lam t x = MvPolynomial.eval₂ (Int.castRingHom K) (fun j => match j with | none => t | some i => x i) P := sorry
theorem rankOne (m : ℤ) (t x : K) :
    hallLittlewoodEval (fun _ : Fin 1 => m) t (fun _ => x) = x^m := sorry
theorem zero {n : ℕ} (t : K) (x : Fin n → K) (hx : Function.Injective x)
    (ht : hallNormalizer (fun _ : Fin n => 0) t ≠ 0) :
    hallLittlewoodEval (fun _ : Fin n => 0) t x = 1 := sorry
theorem minuscule {n r : ℕ} (hr : r ≤ n) (t : K) (x : Fin n → K)
    (hx : Function.Injective x)
    (ht : hallNormalizer (fun i : Fin n => if i.val < r then 1 else 0) t ≠ 0) :
    hallLittlewoodEval (fun i : Fin n => if i.val < r then 1 else 0) t x =
      ∑ s ∈ (Finset.univ : Finset (Fin n)).powersetCard r, ∏ i ∈ s, x i := sorry
/- Check `HallLittlewood.rankOne`: for n = 1, P_{(m)} = X^m. -/
example (m : ℤ) (t x : K) :
    hallLittlewoodEval (fun _ : Fin 1 => m) t (fun _ => x) = x^m := sorry
/- Check `HallLittlewood.zero`: P₀ = 1 at pairwise distinct coordinates with nonzero Hall normalizer (the raw rational expression need not equal its polynomial extension at collisions). -/
example {n : ℕ} (t : K) (x : Fin n → K) (hx : Function.Injective x)
    (ht : hallNormalizer (fun _ : Fin n => 0) t ≠ 0) :
    hallLittlewoodEval (fun _ : Fin n => 0) t x = 1 := sorry
example (t : K) (x : Fin 2 → K) (hx : Function.Injective x)
    (ht : hallNormalizer (fun i : Fin 2 => if i.val < 1 then 1 else 0) t ≠ 0) :
    hallLittlewoodEval (fun i : Fin 2 => if i.val < 1 then 1 else 0) t x = x 0 + x 1 := sorry
-- Two equal variables give zero under total division, unlike polynomial specialization.
example : hallLittlewoodEval (fun _ : Fin 2 => 0) (0 : ℚ) (fun _ => 1) = 0 := sorry
example : hallLittlewoodEval (fun _ : Fin 0 => 0) (1 : ℚ) (fun i => Fin.elim0 i) = 1 := sorry
example : hallNormalizer (fun _ : Fin 2 => 0) (-1 : ℚ) = 0 := sorry
example : hallLittlewoodEval (fun _ : Fin 2 => 0) (-1 : ℚ) ![1, 2] = 0 := sorry

end HallLittlewood
end HallLittlewood

/-! ## Layer SR.5: integral local families for `GL_n` -/

section Whittaker
variable {A U V : Type*} [CommRing A] [Group U] [AddCommGroup V] [Module A V]
abbrev WhittakerCoinvariants (rho : Representation A U V) (psi : U →* Aˣ) :=
  V ⧸ Submodule.span A {z | ∃ (u : U) (v : V), z = rho u v - (psi u : A) • v}
namespace WhittakerCoinvariants
abbrev mk (rho : Representation A U V) (psi : U →* Aˣ) :
    V →ₗ[A] WhittakerCoinvariants rho psi := Submodule.mkQ _
theorem relation (rho : Representation A U V) (psi : U →* Aˣ) (u : U) (v : V) :
    mk rho psi (rho u v) = (psi u : A) • mk rho psi v := sorry
theorem lift {M : Type*} [AddCommGroup M] [Module A M]
    (rho : Representation A U V) (psi : U →* Aˣ) (f : V →ₗ[A] M)
    (hf : ∀ u v, f (rho u v) = (psi u : A) • f v) :
    ∃! b : WhittakerCoinvariants rho psi →ₗ[A] M, b.comp (mk rho psi) = f := sorry
/-- The tensor relation quotient is explicit, so no flatness is assumed. -/
theorem tensor {M : Type*} [AddCommGroup M] [Module A M]
    (rho : Representation A U V) (psi : U →* Aˣ) :
    Nonempty ((M ⊗[A] WhittakerCoinvariants rho psi) ≃ₗ[A]
      (M ⊗[A] V) ⧸ Submodule.span A
        {z | ∃ (u : U) (m : M) (v : V),
          z = m ⊗ₜ[A] rho u v - (psi u : A) • (m ⊗ₜ[A] v)}) := sorry
theorem trivialCharacter (rho : Representation A U V) :
    Nonempty (WhittakerCoinvariants rho (1 : U →* Aˣ) ≃ₗ[A]
      Representation.Coinvariants rho) := sorry
theorem trivialGroup (rho : Representation A Unit V) (psi : Unit →* Aˣ) :
    Function.Bijective (mk rho psi) := sorry
theorem incompatibleCharacter (psi : U →* Aˣ) (u : U)
    (h : IsUnit ((psi u : A) - 1)) :
    Subsingleton (WhittakerCoinvariants (Representation.trivial A U A) psi) := sorry
/- Check `WhittakerCoinvariants.trivialCharacter`: for ψ = 1 the quotient agrees with Mathlib's ordinary coinvariants. -/
example (rho : Representation A U V) :
    Nonempty (WhittakerCoinvariants rho (1 : U →* Aˣ) ≃ₗ[A]
      Representation.Coinvariants rho) := sorry
/- Check `WhittakerCoinvariants.trivialGroup`: for U = 1 the quotient map is an isomorphism. -/
example (rho : Representation A Unit V) (psi : Unit →* Aˣ) :
    Function.Bijective (mk rho psi) := sorry
/- Check `WhittakerCoinvariants.incompatibleCharacter`: a trivial rank-one action and a ψ value with ψ(u) − 1 invertible have zero Whittaker quotient. -/
example (psi : U →* Aˣ) (u : U) (h : IsUnit ((psi u : A) - 1)) :
    Subsingleton (WhittakerCoinvariants (Representation.trivial A U A) psi) := sorry
end WhittakerCoinvariants
end Whittaker

section AIG
variable {k G V : Type u} [Field k] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [AddCommGroup V] [Module k V]
-- Algebraic absolute simplicity plus smoothness, with scalar extensions stated
-- explicitly. This is not the weaker End(V)=k condition.
def AbsolutelyIrreducible (rho : Representation k G V) : Prop :=
  ∀ (L : Type u) (hL : Field L) (hAlg : Algebra k L),
    letI := hL
    letI := hAlg
    Representation.IsIrreducible (_root_.Representation.baseChange L rho)
def Generic (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ) : Prop :=
  Nontrivial (WhittakerCoinvariants (rho.comp U.subtype) psi)
example : AbsolutelyIrreducible (Representation.trivial k G k) := sorry
example : ¬ AbsolutelyIrreducible (Representation.trivial k G (Fin 0 → k)) := sorry
example : ¬ AbsolutelyIrreducible (Representation.trivial k G (Fin 2 → k)) := sorry
example : Generic (Representation.trivial k G k) (⊥ : Subgroup G) 1 := sorry
example (U : Subgroup G) (psi : U →* kˣ) :
    ¬ Generic (Representation.trivial k G (Fin 0 → k)) U psi := sorry
theorem SmoothRep.not_isGeneric_trivial_gl2 (U : Subgroup G) (psi : U →* kˣ) (hpsi : ∃ u, psi u ≠ 1) :
    ¬ Generic (Representation.trivial k G k) U psi := sorry

/- Check `SmoothRep.not_isGeneric_trivial_gl2`: the trivial representation of GL_2(ℚ_p) is not generic. -/
example (U : Subgroup G) (psi : U →* kˣ) (hpsi : ∃ u, psi u ≠ 1) :
    ¬ Generic (Representation.trivial k G k) U psi := sorry
/-- The existential S is the socle: absolute simplicity and containing every
simple subrepresentation identify it without introducing an opaque socle field. -/
def EssentiallyAIG (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ) : Prop :=
  Representation.IsSmooth rho ∧ ∃ S : Subrepresentation rho,
    AbsolutelyIrreducible S.toRepresentation ∧ Generic S.toRepresentation U psi ∧
    (∀ T : Subrepresentation rho, Representation.IsIrreducible T.toRepresentation → T ≤ S) ∧
    Subsingleton (WhittakerCoinvariants ((rho.quotient S.toSubmodule (fun g => S.apply_mem_toSubmodule g)).comp U.subtype) psi) ∧
    ∀ v : V, ∃ T : Subrepresentation rho, v ∈ T ∧ IsFiniteLength k[G] T.toRepresentation.asModule
namespace EssentiallyAIG
theorem socle (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (h : EssentiallyAIG rho U psi) :
    ∃ S : Subrepresentation rho, AbsolutelyIrreducible S.toRepresentation ∧
      Generic S.toRepresentation U psi ∧
      ∀ T : Subrepresentation rho, Representation.IsIrreducible T.toRepresentation → T ≤ S := sorry
theorem quotient (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (h : EssentiallyAIG rho U psi) :
    ∃ S : Subrepresentation rho, AbsolutelyIrreducible S.toRepresentation ∧
      Subsingleton (WhittakerCoinvariants ((rho.quotient S.toSubmodule (fun g => S.apply_mem_toSubmodule g)).comp U.subtype) psi) := sorry
theorem genericSimple (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (hs : Representation.IsSmooth rho) (hi : AbsolutelyIrreducible rho) (hg : Generic rho U psi) :
    EssentiallyAIG rho U psi := sorry
theorem twoGeneric {W : Type u} [AddCommGroup W] [Module k W]
    (rho : Representation k G V) (sigma : Representation k G W)
    (U : Subgroup G) (psi : U →* kˣ)
    (hi : Representation.IsIrreducible rho) (hj : Representation.IsIrreducible sigma)
    (hg : Generic rho U psi) (hh : Generic sigma U psi) :
    ¬ EssentiallyAIG (rho.prod sigma) U psi := sorry
/- Check `EssentiallyAIG.twoGeneric`: the direct sum of two nonzero generic simple representations is not essentially AIG. -/
example {W : Type u} [AddCommGroup W] [Module k W]
    (rho : Representation k G V) (sigma : Representation k G W)
    (U : Subgroup G) (psi : U →* kˣ)
    (hi : Representation.IsIrreducible rho) (hj : Representation.IsIrreducible sigma)
    (hg : Generic rho U psi) (hh : Generic sigma U psi) :
    ¬ EssentiallyAIG (rho.prod sigma) U psi := sorry
theorem zero (U : Subgroup G) (psi : U →* kˣ) :
    ¬ EssentiallyAIG (Representation.trivial k G (Fin 0 → k)) U psi := sorry
/- Check `EssentiallyAIG.genericSimple`: an absolutely irreducible generic representation is essentially AIG. -/
example (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (hs : Representation.IsSmooth rho) (hi : AbsolutelyIrreducible rho) (hg : Generic rho U psi) :
    EssentiallyAIG rho U psi := sorry
/- Check `EssentiallyAIG.zero`: the zero representation is not essentially AIG. -/
example (U : Subgroup G) (psi : U →* kˣ) :
    ¬ EssentiallyAIG (Representation.trivial k G (Fin 0 → k)) U psi := sorry
end EssentiallyAIG
end AIG

section Families
variable {A G V : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [AddCommGroup V] [Module A V]
/-- The smooth, admissible, rank-one Whittaker condition with an essentially AIG
smooth dual at every prime fiber, relative to specified subgroup and character data. -/
def CoWhittaker (rho : Representation A G V) (U : Subgroup G) (psi : U →* Aˣ) : Prop :=
  Representation.IsSmooth rho ∧ Representation.IsAdmissible rho ∧
  Nonempty (WhittakerCoinvariants (rho.comp U.subtype) psi ≃ₗ[A] A) ∧
  ∀ (P : Ideal A) (hP : P.IsPrime),
    letI := hP
    letI : CommRing P.ResidueField := Field.toCommRing
    EssentiallyAIG
      (Representation.smoothVectors (Representation.dual (_root_.Representation.baseChange P.ResidueField rho))).toRepresentation
      U ((Units.map (algebraMap A P.ResidueField).toMonoidHom).comp psi)
namespace CoWhittaker
theorem derivative (rho : Representation A G V) (U : Subgroup G) (psi : U →* Aˣ)
    (h : CoWhittaker rho U psi) :
    Nonempty (WhittakerCoinvariants (rho.comp U.subtype) psi ≃ₗ[A] A) := sorry
theorem fibers (rho : Representation A G V) (U : Subgroup G) (psi : U →* Aˣ)
    (h : CoWhittaker rho U psi) :
    ∀ (P : Ideal A) (hP : P.IsPrime),
    letI := hP
    letI : CommRing P.ResidueField := Field.toCommRing
    EssentiallyAIG
      (Representation.smoothVectors (Representation.dual (_root_.Representation.baseChange P.ResidueField rho))).toRepresentation
      U ((Units.map (algebraMap A P.ResidueField).toMonoidHom).comp psi) := sorry
theorem twoCopies [Nontrivial A] (rho : Representation A G V)
    (U : Subgroup G) (psi : U →* Aˣ) (h : CoWhittaker rho U psi) :
    ¬ CoWhittaker (rho.prod rho) U psi := sorry
/- Check `CoWhittaker.twoCopies`: the direct sum of two nonzero co-Whittaker families fails the rank-one derivative condition. -/
example [Nontrivial A] (rho : Representation A G V)
    (U : Subgroup G) (psi : U →* Aˣ) (h : CoWhittaker rho U psi) :
    ¬ CoWhittaker (rho.prod rho) U psi := sorry
theorem nongeneric [Nontrivial A] (rho : Representation A G V) (U : Subgroup G)
    (psi : U →* Aˣ) [Subsingleton (WhittakerCoinvariants (rho.comp U.subtype) psi)] :
    ¬ CoWhittaker rho U psi := sorry
/- Check `CoWhittaker.nongeneric`: over a nonzero coefficient ring, an admissible representation with zero top derivative is not co-Whittaker. -/
example [Nontrivial A] (rho : Representation A G V) (U : Subgroup G)
    (psi : U →* Aˣ) [Subsingleton (WhittakerCoinvariants (rho.comp U.subtype) psi)] :
    ¬ CoWhittaker rho U psi := sorry
-- Rank one supplies a positive check, including nonreduced coefficient rings.
example : CoWhittaker (Representation.trivial A G A) (⊥ : Subgroup G) 1 := sorry
-- Over the zero ring the rank-one and zero modules coincide; there are no prime fibers.
example [Subsingleton A] :
    CoWhittaker (Representation.trivial A G (Fin 0 → A)) (⊥ : Subgroup G) 1 := sorry
end CoWhittaker
end Families



section CompactInductionInterface
variable {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
/-- Locally constant equivariant functions with support contained in U times a compact set.
For Helm's application [Hel12], §3, pp. 4–5, `F/ℚ_p` is finite, `G = GL_n(F)`,
`n ≥ 1`, `A = W(k)` for algebraically closed `k` of characteristic `ℓ ≠ p`,
and `U` is the unipotent radical of a Borel with a smooth nondegenerate `psi`.
This carrier alone is neither a smooth representation nor its Bernstein-block projection.
Block representability is [Hel12] §3 property (2), p. 5, restricted using [Hel16]
Theorem 11.8, p. 58; Lemma 3.2, p. 5, and Theorem 5.2 / Proposition 5.3,
pp. 10–11, supply the derivative line, center and admissibility. No general-group
representability statement is asserted by this definition. -/
def CompactInducedFunctions (U : Subgroup G) (psi : U →* Aˣ) : Submodule A (G → A) where
  carrier := {f | IsLocallyConstant f ∧
    (∀ (u : U) (g : G), f (u * g) = (psi u : A) * f g) ∧
    ∃ C : Set G, IsCompact C ∧ ∀ g, f g ≠ 0 → ∃ (u : U) (c : G), c ∈ C ∧ g = u * c}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry
example (U : Subgroup G) (psi : U →* Aˣ) :
    (0 : G → A) ∈ CompactInducedFunctions U psi := sorry
example [CompactSpace G] :
    (fun _ : G => (1 : A)) ∈ CompactInducedFunctions ⊤ 1 := sorry
example (psi : (⊤ : Subgroup G) →* Aˣ)
    (hpsi : ∃ u, psi u ≠ 1) :
    (fun _ : G => (1 : A)) ∉ CompactInducedFunctions ⊤ psi := sorry
end CompactInductionInterface

-- Homomorphisms out of a direct sum of infinitely many block summands, each contributing one
-- line, form the product `ℕ → ℚ`; the top derivative of the target is the sum `ℕ →₀ ℚ`. So
-- The blockwise statement also gives the formula for finite block support. The unrestricted
-- wording of [Hel12] §3 property (2), p. 5, cannot be used with ordinary module Hom here
-- (GL₁: `W = C_c^∞(F^×)`). No admissibility or finite-generation condition is needed on
-- the target inside a fixed block, including for `n ≥ 2`.
theorem UniversalWhittaker.productOfBlocks : ¬ Nonempty ((ℕ → ℚ) ≃ₗ[ℚ] (ℕ →₀ ℚ)) := by
  rintro ⟨e⟩
  have hc : Countable (ℕ → ℚ) := e.toEquiv.injective.countable
  have h1 : Cardinal.mk (ℕ → ℚ) ≤ Cardinal.aleph0 := Cardinal.mk_le_aleph0_iff.mpr hc
  rw [← Cardinal.power_def, Cardinal.mkRat, Cardinal.mk_nat, Cardinal.aleph0_power_aleph0] at h1
  exact absurd h1 (not_le.mpr Cardinal.aleph0_lt_continuum)

/- Check `UniversalWhittaker.productOfBlocks`: The countable product of ℚ is not linearly equivalent to its direct sum. -/
example : ¬ Nonempty ((ℕ → ℚ) ≃ₗ[ℚ] (ℕ →₀ ℚ)) := by
  rintro ⟨e⟩
  have hc : Countable (ℕ → ℚ) := e.toEquiv.injective.countable
  have h1 : Cardinal.mk (ℕ → ℚ) ≤ Cardinal.aleph0 := Cardinal.mk_le_aleph0_iff.mpr hc
  rw [← Cardinal.power_def, Cardinal.mkRat, Cardinal.mk_nat, Cardinal.aleph0_power_aleph0] at h1
  exact absurd h1 (not_le.mpr Cardinal.aleph0_lt_continuum)

/-! ## Layer SR.6: late integral finiteness and second adjointness -/

section Cocycle
variable {Gamma H : Type*} [Group Gamma] [Group H]
structure CrossedCocycle (action : Gamma →* MulAut H) where
  value : Gamma → H
  cocycle : ∀ g h, value (g*h) = value g * action g (value h)
namespace CrossedCocycle
theorem one (action : Gamma →* MulAut H) (c : CrossedCocycle action) : c.value 1 = 1 := sorry
def gauge (action : Gamma →* MulAut H) (h : H) (c : CrossedCocycle action) :
    CrossedCocycle action where
  value g := h * c.value g * (action g h)⁻¹
  cocycle := sorry
def map {J : Type*} [Group J] (a : Gamma →* MulAut H) (b : Gamma →* MulAut J)
    (f : H →* J) (hf : ∀ g x, f (a g x) = b g (f x)) (c : CrossedCocycle a) :
    CrossedCocycle b where
  value g := f (c.value g)
  cocycle := sorry
theorem trivialAction (c : CrossedCocycle (1 : Gamma →* MulAut H)) (g h : Gamma) :
    c.value (g*h) = c.value g * c.value h := sorry
def identityCocycle (a : Gamma →* MulAut H) : CrossedCocycle a where
  value _ := 1
  cocycle := sorry
theorem coboundary (a : Gamma →* MulAut H) (h : H) (g : Gamma) :
    (gauge a h (identityCocycle a)).value g = h * (a g h)⁻¹ := sorry
/-- A crossed cocycle is a section of the semidirect product projection. -/
def toSection (a : Gamma →* MulAut H) (c : CrossedCocycle a) : Gamma →* H ⋊[a] Gamma where
  toFun g := ⟨c.value g, g⟩
  map_one' := sorry
  map_mul' := sorry
example (a : Gamma →* MulAut H) :
    toSection a (identityCocycle a) = SemidirectProduct.inr := sorry
example (a : Gamma →* MulAut H) (c : CrossedCocycle a) (g : Gamma) :
    (toSection a c g).right = g := rfl
example (a : Gamma →* MulAut H) (c : CrossedCocycle a) (h : H) (g : Gamma) :
    toSection a (gauge a h c) g =
      SemidirectProduct.inl h * toSection a c g * (SemidirectProduct.inl h)⁻¹ := sorry
-- Arithmetic/geometric inversion acts on the full parameter in the semidirect product.
example (c : CrossedCocycle (1 : Multiplicative ℤ →* MulAut ℚˣ))
    (hc : c.value (Multiplicative.ofAdd 1) = Units.mk0 (2 : ℚ) (by norm_num)) :
    ((toSection 1 c (Multiplicative.ofAdd 1))⁻¹).left =
      Units.mk0 (1 / 2 : ℚ) (by norm_num) ∧
    ((toSection 1 c (Multiplicative.ofAdd 1))⁻¹).right = Multiplicative.ofAdd (-1) := sorry
example (a : Multiplicative ℤ →* MulAut ℚˣ)
    (ha : ∀ u, a (Multiplicative.ofAdd 1) u = u⁻¹)
    (c : CrossedCocycle a)
    (hc : c.value (Multiplicative.ofAdd 1) = Units.mk0 (2 : ℚ) (by norm_num)) :
    ((toSection a c (Multiplicative.ofAdd 1))⁻¹).left =
      Units.mk0 (2 : ℚ) (by norm_num) ∧
    ((toSection a c (Multiplicative.ofAdd 1))⁻¹).right = Multiplicative.ofAdd (-1) := sorry
/- Check `CrossedCocycle.trivialAction`: for trivial α, cocycles are group homomorphisms. -/
example (c : CrossedCocycle (1 : Gamma →* MulAut H)) (g h : Gamma) :
    c.value (g*h) = c.value g * c.value h := sorry
example (a : Gamma →* MulAut H) (g : Gamma) : (identityCocycle a).value g = 1 := sorry
example (a : Gamma →* MulAut H) (h : H) (g : Gamma) :
    (gauge a h (identityCocycle a)).value g = h * (a g h)⁻¹ := sorry
/-- Gauge transformations are a left action; the order is h * k. -/
theorem gauge_one (a : Gamma →* MulAut H) (c : CrossedCocycle a) : gauge a 1 c = c := sorry
theorem gauge_mul (a : Gamma →* MulAut H) (h k : H) (c : CrossedCocycle a) :
    gauge a h (gauge a k c) = gauge a (h * k) c := sorry
theorem map_id (a : Gamma →* MulAut H) (c : CrossedCocycle a) :
    map a a (MonoidHom.id H) (fun _ _ => rfl) c = c := sorry
theorem map_comp {J K : Type*} [Group J] [Group K]
    (a : Gamma →* MulAut H) (b : Gamma →* MulAut J) (d : Gamma →* MulAut K)
    (f : H →* J) (hf : ∀ g x, f (a g x) = b g (f x))
    (j : J →* K) (hj : ∀ g x, j (b g x) = d g (j x)) (c : CrossedCocycle a) :
    map b d j hj (map a b f hf c) =
      map a d (j.comp f) (by intro g x; simp only [MonoidHom.comp_apply, hf, hj]) c := sorry
theorem map_gauge {J : Type*} [Group J] (a : Gamma →* MulAut H) (b : Gamma →* MulAut J)
    (f : H →* J) (hf : ∀ g x, f (a g x) = b g (f x)) (h : H) (c : CrossedCocycle a) :
    map a b f hf (gauge a h c) = gauge b (f h) (map a b f hf c) := sorry
example (a : Gamma →* MulAut H) (c : CrossedCocycle a) : gauge a 1 c = c := sorry
example (a : Gamma →* MulAut H) (h k : H) (c : CrossedCocycle a) :
    gauge a h (gauge a k c) = gauge a (h * k) c := sorry
example (a : Gamma →* MulAut H) (c : CrossedCocycle a) :
    map a a (MonoidHom.id H) (fun _ _ => rfl) c = c := sorry
example (a : Gamma →* MulAut H) (c : CrossedCocycle a) :
    map a a (1 : H →* H) (by intro g x; simp) c = identityCocycle a := sorry
example {J : Type*} [Group J] (a : Gamma →* MulAut H) (b : Gamma →* MulAut J)
    (f : H →* J) (hf : ∀ g x, f (a g x) = b g (f x)) (h : H) (c : CrossedCocycle a) :
    map a b f hf (gauge a h c) = gauge b (f h) (map a b f hf c) := sorry
example (a : Gamma →* MulAut H) (h : H) :
    gauge a h (gauge a h⁻¹ (identityCocycle a)) = identityCocycle a := sorry
/- Check `CrossedCocycle.identityCocycle`: when the target group is trivial, every crossed cocycle equals the identity cocycle. -/
example [Subsingleton H] (a : Gamma →* MulAut H) (c : CrossedCocycle a) :
    c = identityCocycle a := sorry
end CrossedCocycle
-- Inversion is an automorphism of a commutative multiplicative group.
/- Check `CrossedCocycle.coboundary`: The inversion action sends the coboundary of 2 to 4 at the generator. -/
example (a : Multiplicative ℤ →* MulAut ℚˣ)
    (ha : ∀ u, a (Multiplicative.ofAdd 1) u = u⁻¹) :
    (CrossedCocycle.gauge a (Units.mk0 (2 : ℚ) (by norm_num)) (CrossedCocycle.identityCocycle a)).value
      (Multiplicative.ofAdd 1) = (Units.mk0 (4 : ℚ) (by norm_num)) := sorry

end Cocycle

section Excursions
variable {A H I V : Type*} [CommRing A] [Group H] [AddCommGroup V] [Module A V]
/-- Matrix-coefficient data with diagonal-invariant creation and annihilation. -/
structure ExcursionDatum (A H I V : Type*) [CommRing A] [Group H]
    [AddCommGroup V] [Module A V] where
  rho : Representation A (I → H) V
  alpha : V
  beta : V →ₗ[A] A
  alpha_fixed : ∀ h : H, rho (fun _ => h) alpha = alpha
  beta_fixed : ∀ h : H, ∀ v, beta (rho (fun _ => h) v) = beta v
namespace ExcursionDatum
def matrixCoefficient (D : ExcursionDatum A H I V) (h : I → H) : A := D.beta (D.rho h D.alpha)
theorem diagonalInvariant (D : ExcursionDatum A H I V) (k : H) (h : I → H) :
    D.matrixCoefficient (fun i => k * h i * k⁻¹) = D.matrixCoefficient h := sorry
/-- Tensor products multiply matrix coefficients. -/
theorem tensorProduct {W : Type*} [AddCommGroup W] [Module A W]
    (D : ExcursionDatum A H I V) (E : ExcursionDatum A H I W)
    (b : (V ⊗[A] W) →ₗ[A] A)
    (hb : ∀ v w, b (v ⊗ₜ[A] w) = D.beta v * E.beta w) (h : I → H) :
    b ((D.rho.tprod E.rho) h (D.alpha ⊗ₜ[A] E.alpha)) =
      D.matrixCoefficient h * E.matrixCoefficient h := sorry
theorem unit (D : ExcursionDatum A H I A) (hrho : D.rho = Representation.trivial A (I → H) A)
    (ha : D.alpha = 1) (hb : D.beta = LinearMap.id) (h : I → H) :
    D.matrixCoefficient h = 1 := sorry
theorem zeroAnnihilation (D : ExcursionDatum A H I V) (hb : D.beta = 0) (h : I → H) :
    D.matrixCoefficient h = 0 := sorry
theorem singleton (D : ExcursionDatum A H Unit V) (h : Unit → H) :
    D.matrixCoefficient h = D.beta D.alpha := sorry
/- Check `ExcursionDatum.unit`: for the trivial one-dimensional representation with identity creation and annihilation, the coefficient is one. -/
example (D : ExcursionDatum A H I A) (hrho : D.rho = Representation.trivial A (I → H) A)
    (ha : D.alpha = 1) (hb : D.beta = LinearMap.id) (h : I → H) : D.matrixCoefficient h = 1 := sorry
/- Check `ExcursionDatum.zeroAnnihilation`: if β is zero, the coefficient is zero. -/
example (D : ExcursionDatum A H I V) (hb : D.beta = 0) (h : I → H) : D.matrixCoefficient h = 0 := sorry
/- Check `ExcursionDatum.singleton`: for one index, creation and annihilation through invariant vectors give a constant coefficient function. For the empty index set the value is also β(α), as in the Lean empty-index example. -/
example (D : ExcursionDatum A H Unit V) (h : Unit → H) : D.matrixCoefficient h = D.beta D.alpha := sorry
/- Check `ExcursionDatum.singleton`: for one index, creation and annihilation through invariant vectors give a constant coefficient function. For the empty index set the value is also β(α), as in the Lean empty-index example. -/
example (D : ExcursionDatum A H Empty V) (h : Empty → H) :
    D.matrixCoefficient h = D.beta D.alpha := sorry
end ExcursionDatum
end Excursions


section Stability
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
/-- An operator with a nilpotent summand and an invariant invertible complement. -/
def StableOperator (T : Module.End R M) : Prop :=
  ∃ (c : ℕ) (I : Submodule R M), 0 < c ∧
    IsCompl (LinearMap.ker (T^c)) I ∧
    (∀ x ∈ I, T x ∈ I) ∧
    (∀ y ∈ I, ∃! x : I, T x = y)
namespace StableOperator
theorem split (T : Module.End R M) (h : StableOperator T) :
    ∃ (c : ℕ) (I : Submodule R M), 0 < c ∧ IsCompl (LinearMap.ker (T^c)) I := sorry
theorem nilpotent (T : Module.End R M) (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    StableOperator T := sorry
theorem automorphism (e : M ≃ₗ[R] M) : StableOperator e.toLinearMap := sorry
theorem mixed {N : Type*} [AddCommGroup N] [Module R N]
    (T : Module.End R M) (e : N ≃ₗ[R] N) (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    StableOperator (LinearMap.prodMap T e.toLinearMap) := sorry
example (T : Module.End R M) (c : ℕ) (hc : 0 < c) (h : T^c = 0) : StableOperator T := sorry
example (e : M ≃ₗ[R] M) : StableOperator e.toLinearMap := sorry
example {N : Type*} [AddCommGroup N] [Module R N]
    (T : Module.End R M) (e : N ≃ₗ[R] N) (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    StableOperator (LinearMap.prodMap T e.toLinearMap) := sorry
end StableOperator
end Stability



theorem Representation.isSmooth_ofMulAction_zmod (p n : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℤ_[p]) :=
      { carrier := {g | PadicInt.toZModPow n (Multiplicative.toAdd g) = 0}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let ρ := Representation.ofMulAction ℤ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p] ⧸ U)
    Representation.IsSmooth ρ ∧ ∀ u : U, ∀ v, ρ u v = v := sorry

/- Check `Representation.isSmooth_ofMulAction_zmod`: for G = ℤ_p and U = p^n ℤ_p, the permutation representation ℤ[ℤ_p ⧸ U] is smooth and every vector is fixed by U. -/
example (p n : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℤ_[p]) :=
      { carrier := {g | PadicInt.toZModPow n (Multiplicative.toAdd g) = 0}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let ρ := Representation.ofMulAction ℤ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p] ⧸ U)
    Representation.IsSmooth ρ ∧ ∀ u : U, ∀ v, ρ u v = v := sorry

theorem Representation.smoothVectors_product_ne_top (p : ℕ) [Fact p.Prime] :
    let U : ℕ → Subgroup (Multiplicative ℤ_[p]) := fun n =>
      { carrier := {g | PadicInt.toZModPow n (Multiplicative.toAdd g) = 0}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let σ := fun n => Representation.ofMulAction ℤ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p] ⧸ U n)
    let ρ : Representation ℤ (Multiplicative ℤ_[p])
        (∀ n : ℕ, MonoidAlgebra ℤ (Multiplicative ℤ_[p] ⧸ U n)) :=
      { toFun := fun g => LinearMap.pi (fun n => (σ n g).comp (LinearMap.proj n))
        map_one' := by sorry
        map_mul' := by sorry }
    ¬ Representation.IsSmooth ρ ∧
      (fun n => MonoidAlgebra.single (QuotientGroup.mk (s := U n) 1) 1) ∉
        (Representation.smoothVectors ρ).toSubmodule := sorry

/- Check `Representation.smoothVectors_product_ne_top`: for G = ℤ_p, the product over n of ℤ[ℤ_p ⧸ p^n ℤ_p] is not smooth, the family of basepoints not being a smooth vector. -/
example (p : ℕ) [Fact p.Prime] :
    let U : ℕ → Subgroup (Multiplicative ℤ_[p]) := fun n =>
      { carrier := {g | PadicInt.toZModPow n (Multiplicative.toAdd g) = 0}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let σ := fun n => Representation.ofMulAction ℤ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p] ⧸ U n)
    let ρ : Representation ℤ (Multiplicative ℤ_[p])
        (∀ n : ℕ, MonoidAlgebra ℤ (Multiplicative ℤ_[p] ⧸ U n)) :=
      { toFun := fun g => LinearMap.pi (fun n => (σ n g).comp (LinearMap.proj n))
        map_one' := by sorry
        map_mul' := by sorry }
    ¬ Representation.IsSmooth ρ ∧
      (fun n => MonoidAlgebra.single (QuotientGroup.mk (s := U n) 1) 1) ∉
        (Representation.smoothVectors ρ).toSubmodule := sorry

theorem SmoothRep.not_closed_under_extensions (p : ℕ) [Fact p.Prime] :
    ∃ l : ℚ_[p] →ₗ[ℚ] ℚ,
    let ρ : Representation ℚ (Multiplicative ℤ_[p]) (ℚ × ℚ) :=
      { toFun := fun g =>
          { toFun := fun v => (v.1 + l ((Multiplicative.toAdd g : ℤ_[p]) : ℚ_[p]) * v.2, v.2)
            map_add' := by sorry
            map_smul' := by sorry }
        map_one' := by sorry
        map_mul' := by sorry }
    ¬ Representation.IsSmooth ρ ∧
      (∀ g a, ρ g (a, 0) = (a, 0)) ∧ (∀ g v, (ρ g v).2 = v.2) := sorry

/- Check `SmoothRep.not_closed_under_extensions`: for G = ℤ_p and A = ℚ, a non-continuous ℚ-linear map ℚ_p → ℚ defines an extension of the trivial representation by itself in Rep ℚ ℤ_p whose middle term is not smooth, so SmoothRep is not a Serre subcategory of Rep. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ l : ℚ_[p] →ₗ[ℚ] ℚ,
    let ρ : Representation ℚ (Multiplicative ℤ_[p]) (ℚ × ℚ) :=
      { toFun := fun g =>
          { toFun := fun v => (v.1 + l ((Multiplicative.toAdd g : ℤ_[p]) : ℚ_[p]) * v.2, v.2)
            map_add' := by sorry
            map_smul' := by sorry }
        map_one' := by sorry
        map_mul' := by sorry }
    ¬ Representation.IsSmooth ρ ∧
      (∀ g a, ρ g (a, 0) = (a, 0)) ∧ (∀ g v, (ρ g v).2 = v.2) := sorry

theorem SmoothRep.invariants_top_of_trivial {A G V : Type*} [CommRing A] [Group G] [AddCommGroup V] [Module A V]
    (U : Subgroup G) :
    Representation.invariants ((Representation.trivial A G V).comp U.subtype) = ⊤ := sorry

/- Check `SmoothRep.invariants_top_of_trivial`: for the trivial representation, V^U = V for every U. -/
example {A G V : Type*} [CommRing A] [Group G] [AddCommGroup V] [Module A V]
    (U : Subgroup G) :
    Representation.invariants ((Representation.trivial A G V).comp U.subtype) = ⊤ := sorry

theorem SmoothRep.invariants_not_exact_fp (p : ℕ) [Fact p.Prime] :
    ¬ Function.Surjective (fun v : Representation.invariants
      (Representation.ofMulAction (ZMod p) (Multiplicative (ZMod p)) (Multiplicative (ZMod p))) =>
        v.val.coeff.sum (fun _ a => a)) := sorry

/- Check `SmoothRep.invariants_not_exact_fp`: for G = ℤ/p (discrete) and A = F_p, the U = G invariants of F_p[G] → F_p (augmentation) are not surjective, so invariantsFunctor is not right exact without invertibility of |U|. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ Function.Surjective (fun v : Representation.invariants
      (Representation.ofMulAction (ZMod p) (Multiplicative (ZMod p)) (Multiplicative (ZMod p))) =>
        v.val.coeff.sum (fun _ a => a)) := sorry

theorem hasUnitProOrder_padicInt_iff {A : Type*} [CommRing A] [Nontrivial A] (p : ℕ) [Fact p.Prime] :
    HasUnitProOrder A (⊤ : Subgroup (Multiplicative ℤ_[p])) ↔ IsUnit (p : A) := sorry

/- Check `hasUnitProOrder_padicInt_iff`: HasUnitProOrder A ℤ_p ↔ IsUnit (p : A), for A nonzero. -/
example {A : Type*} [CommRing A] [Nontrivial A] (p : ℕ) [Fact p.Prime] :
    HasUnitProOrder A (⊤ : Subgroup (Multiplicative ℤ_[p])) ↔ IsUnit (p : A) := sorry

theorem hasUnitProOrder_finite_iff {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [DiscreteTopology G] [Finite G] :
    HasUnitProOrder A (⊤ : Subgroup G) ↔ IsUnit (Nat.card G : A) := sorry

/- Check `hasUnitProOrder_finite_iff`: for a finite discrete group U, HasUnitProOrder A U ↔ IsUnit (Nat.card U : A). -/
example {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [DiscreteTopology G] [Finite G] :
    HasUnitProOrder A (⊤ : Subgroup G) ↔ IsUnit (Nat.card G : A) := sorry

theorem hasUnitProOrder_trivial {A : Type*} [CommRing A] : HasUnitProOrder A (⊤ : Subgroup Unit) := sorry

/- Check `hasUnitProOrder_trivial`: the trivial group has invertible pro-order in every A. -/
example {A : Type*} [CommRing A] : HasUnitProOrder A (⊤ : Subgroup Unit) := sorry

theorem SmoothRep.averaging_sign (χ : Multiplicative (ZMod 2) →* (Localization.Away (2 : ℤ))ˣ)
    (hχ : χ (Multiplicative.ofAdd 1) = -1) :
    Representation.averaging (Representation.ofLinearCharacter χ) (by sorry)
      (⊤ : OpenSubgroup (Multiplicative (ZMod 2))) (by sorry) (by sorry) = 0 := sorry

/- Check `SmoothRep.averaging_sign`: for U = ℤ/2 acting by −1 on ℤ[1/2], e_U = 0. -/
example (χ : Multiplicative (ZMod 2) →* (Localization.Away (2 : ℤ))ˣ)
    (hχ : χ (Multiplicative.ofAdd 1) = -1) :
    Representation.averaging (Representation.ofLinearCharacter χ) (by sorry)
      (⊤ : OpenSubgroup (Multiplicative (ZMod 2))) (by sorry) (by sorry) = 0 := sorry

theorem SmoothRep.averaging_eq_averageMap_test {A G V : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [DiscreteTopology G] [Fintype G] [AddCommGroup V] [Module A V]
    [Invertible (Fintype.card G : A)] (ρ : Representation A G V) :
    Representation.averaging ρ (by sorry) (⊤ : OpenSubgroup G) (by sorry) (by sorry) =
      Representation.averageMap ρ := sorry

/- Check `SmoothRep.averaging_eq_averageMap_test`: for G finite discrete and U = G with |G| invertible, e_G = Representation.averageMap. -/
example {A G V : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [DiscreteTopology G] [Fintype G] [AddCommGroup V] [Module A V]
    [Invertible (Fintype.card G : A)] (ρ : Representation A G V) :
    Representation.averaging ρ (by sorry) (⊤ : OpenSubgroup G) (by sorry) (by sorry) =
      Representation.averageMap ρ := sorry

theorem Representation.isAdmissible_quotient_compact (p n : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℤ_[p]) :=
      { carrier := {g | PadicInt.toZModPow n (Multiplicative.toAdd g) = 0}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let ρ := Representation.ofMulAction ℚ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p] ⧸ U)
    Representation.IsAdmissible ρ ∧ Module.finrank ℚ (Representation.invariants ρ) = 1 := sorry

/- Check `Representation.isAdmissible_quotient_compact`: for G = ℤ_p and A = ℚ, ℚ[ℤ_p ⧸ p^n ℤ_p] is admissible with (·)^{ℤ_p} of dimension 1. -/
example (p n : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℤ_[p]) :=
      { carrier := {g | PadicInt.toZModPow n (Multiplicative.toAdd g) = 0}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let ρ := Representation.ofMulAction ℚ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p] ⧸ U)
    Representation.IsAdmissible ρ ∧ Module.finrank ℚ (Representation.invariants ρ) = 1 := sorry

theorem Representation.not_isAdmissible_cInd_qp (p : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℚ_[p]) :=
      { carrier := {g | ‖Multiplicative.toAdd g‖ ≤ 1}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let ρ := Representation.ofMulAction ℚ (Multiplicative ℚ_[p]) (Multiplicative ℚ_[p] ⧸ U)
    Representation.IsSmooth ρ ∧ ¬ Representation.IsAdmissible ρ := sorry

/- Check `Representation.not_isAdmissible_cInd_qp`: for G = ℚ_p and A = ℚ, ℚ[ℚ_p ⧸ ℤ_p] is smooth but not admissible. -/
example (p : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℚ_[p]) :=
      { carrier := {g | ‖Multiplicative.toAdd g‖ ≤ 1}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let ρ := Representation.ofMulAction ℚ (Multiplicative ℚ_[p]) (Multiplicative ℚ_[p] ⧸ U)
    Representation.IsSmooth ρ ∧ ¬ Representation.IsAdmissible ρ := sorry

theorem Representation.fg_not_admissible (p : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℚ_[p]) :=
      { carrier := {g | ‖Multiplicative.toAdd g‖ ≤ 1}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let ρ := Representation.ofMulAction ℚ (Multiplicative ℚ_[p]) (Multiplicative ℚ_[p] ⧸ U)
    Module.Finite (MonoidAlgebra ℚ (Multiplicative ℚ_[p])) ρ.asModule ∧
      ¬ Representation.IsAdmissible ρ := sorry

/- Check `Representation.fg_not_admissible`: ℚ[ℚ_p ⧸ ℤ_p] is finitely generated and not admissible. -/
example (p : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℚ_[p]) :=
      { carrier := {g | ‖Multiplicative.toAdd g‖ ≤ 1}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let ρ := Representation.ofMulAction ℚ (Multiplicative ℚ_[p]) (Multiplicative ℚ_[p] ⧸ U)
    Module.Finite (MonoidAlgebra ℚ (Multiplicative ℚ_[p])) ρ.asModule ∧
      ¬ Representation.IsAdmissible ρ := sorry

theorem Representation.admissible_not_fg {k : Type*} [Field k] [CharZero k] (p : ℕ) [Fact p.Prime]
    (χ : ℕ → Multiplicative ℤ_[p] →* kˣ)
    (hχ : ∀ n g, χ n g = 1 ↔ PadicInt.toZModPow (n + 1) (Multiplicative.toAdd g) = 0) :
    let ρ := Representation.directSum (fun n => Representation.ofLinearCharacter (χ n))
    Representation.IsAdmissible ρ ∧
      ¬ Module.Finite (MonoidAlgebra k (Multiplicative ℤ_[p])) ρ.asModule := sorry

/- Check `Representation.admissible_not_fg`: ⊕_{n≥1} of characters of ℤ_p of exact conductor p^n (over ℚ(μ_{p^∞})) is admissible and not finitely generated. -/
example {k : Type*} [Field k] [CharZero k] (p : ℕ) [Fact p.Prime]
    (χ : ℕ → Multiplicative ℤ_[p] →* kˣ)
    (hχ : ∀ n g, χ n g = 1 ↔ PadicInt.toZModPow (n + 1) (Multiplicative.toAdd g) = 0) :
    let ρ := Representation.directSum (fun n => Representation.ofLinearCharacter (χ n))
    Representation.IsAdmissible ρ ∧
      ¬ Module.Finite (MonoidAlgebra k (Multiplicative ℤ_[p])) ρ.asModule := sorry

theorem Representation.isLocallyAdmissible_trivial {A G : Type*} [CommRing A] [IsNoetherianRing A] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] :
    Module.Finite (MonoidAlgebra A G) (Representation.trivial A G A).asModule ∧
      ∀ S : Subrepresentation (Representation.trivial A G A),
        Representation.IsAdmissible S.toRepresentation := sorry

/- Check `Representation.isLocallyAdmissible_trivial`: the trivial rank-one representation A is locally admissible and finitely generated. An arbitrary trivial module need not be finitely generated. -/
example {A G : Type*} [CommRing A] [IsNoetherianRing A] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] :
    Module.Finite (MonoidAlgebra A G) (Representation.trivial A G A).asModule ∧
      ∀ S : Subrepresentation (Representation.trivial A G A),
        Representation.IsAdmissible S.toRepresentation := sorry

theorem isSmoothCharacter_unramified {A : Type*} [CommRing A] (p : ℕ) [Fact p.Prime] (t : Aˣ)
    (χ : ℚ_[p]ˣ →* Aˣ) (hχ : ∀ x, χ x = t ^ (x : ℚ_[p]).valuation) :
    IsSmoothCharacter χ := sorry

/- Check `isSmoothCharacter_unramified`: x ↦ t^{v_p(x)} on ℚ_p^× is a smooth character for any t ∈ Aˣ. -/
example {A : Type*} [CommRing A] (p : ℕ) [Fact p.Prime] (t : Aˣ)
    (χ : ℚ_[p]ˣ →* Aˣ) (hχ : ∀ x, χ x = t ^ (x : ℚ_[p]).valuation) :
    IsSmoothCharacter χ := sorry

theorem isSmoothCharacter_one {A G V : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [AddCommGroup V] [Module A V] (ρ : Representation A G V) :
    IsSmoothCharacter (1 : G →* Aˣ) ∧ (∀ g v, (((1 : G →* Aˣ) g : Aˣ) : A) • ρ g v = ρ g v) := sorry

/- Check `isSmoothCharacter_one`: the trivial character is smooth and twisting by it is the identity. -/
example {A G V : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [AddCommGroup V] [Module A V] (ρ : Representation A G V) :
    IsSmoothCharacter (1 : G →* Aˣ) ∧ (∀ g v, (((1 : G →* Aˣ) g : Aˣ) : A) • ρ g v = ρ g v) := sorry

theorem not_isSmoothCharacter_padicExp (p : ℕ) [Fact p.Prime] (χ : Multiplicative ℤ_[p] →* ℤ_[p]ˣ)
    (hχ : ∀ n : ℕ, (χ (Multiplicative.ofAdd (n : ℤ_[p])) : ℤ_[p]) = (1 + p)^n) :
    ¬ IsSmoothCharacter χ := sorry

/- Check `not_isSmoothCharacter_padicExp`: x ↦ (1+p)^x, ℤ_p → ℤ_p^×, is not smooth with ℤ_p^× discrete. -/
example (p : ℕ) [Fact p.Prime] (χ : Multiplicative ℤ_[p] →* ℤ_[p]ˣ)
    (hχ : ∀ n : ℕ, (χ (Multiplicative.ofAdd (n : ℤ_[p])) : ℤ_[p]) = (1 + p)^n) :
    ¬ IsSmoothCharacter χ := sorry

theorem SmoothRep.smoothDual_character {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    Nonempty (Representation.Equiv
      (Representation.smoothDual (Representation.ofLinearCharacter χ)).toRepresentation
      (Representation.ofLinearCharacter χ⁻¹)) := sorry

/- Check `SmoothRep.smoothDual_character`: the smooth dual of A(χ) is A(χ⁻¹). -/
example {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    Nonempty (Representation.Equiv
      (Representation.smoothDual (Representation.ofLinearCharacter χ)).toRepresentation
      (Representation.ofLinearCharacter χ⁻¹)) := sorry

theorem SmoothRep.toDoubleDual_not_surjective (p : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℚ_[p]) :=
      { carrier := {g | ‖Multiplicative.toAdd g‖ ≤ 1}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let ρ := Representation.ofMulAction ℚ (Multiplicative ℚ_[p]) (Multiplicative ℚ_[p] ⧸ U)
    ¬ ∀ L : Representation.smoothDual (Representation.smoothDual ρ).toRepresentation,
      ∃ v, ∀ ℓ : Representation.smoothDual ρ, L.val ℓ = ℓ.val v := sorry

/- Check `SmoothRep.toDoubleDual_not_surjective`: for G = ℚ_p, k = ℚ and V = ℚ[ℚ_p/ℤ_p], V → Ṽ̃ is not surjective. -/
example (p : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℚ_[p]) :=
      { carrier := {g | ‖Multiplicative.toAdd g‖ ≤ 1}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let ρ := Representation.ofMulAction ℚ (Multiplicative ℚ_[p]) (Multiplicative ℚ_[p] ⧸ U)
    ¬ ∀ L : Representation.smoothDual (Representation.smoothDual ρ).toRepresentation,
      ∃ v, ∀ ℓ : Representation.smoothDual ρ, L.val ℓ = ℓ.val v := sorry

theorem SmoothRep.baseChangeInvariants_sign_not_surjective (χ : Multiplicative (ZMod 2) →* ℤˣ)
    (hχ : χ (Multiplicative.ofAdd 1) = -1) :
    Subsingleton (Representation.invariants (Representation.ofLinearCharacter χ)) ∧
    Nontrivial (Representation.invariants
      (_root_.Representation.baseChange (ZMod 2) (Representation.ofLinearCharacter χ))) ∧
    ¬ ∃ f : (ZMod 2 ⊗[ℤ] Representation.invariants (Representation.ofLinearCharacter χ)) →ₗ[ZMod 2]
      Representation.invariants (_root_.Representation.baseChange (ZMod 2)
        (Representation.ofLinearCharacter χ)), Function.Surjective f := sorry

/- Check `SmoothRep.baseChangeInvariants_sign_not_surjective`: for U = ℤ/2 acting by sign on ℤ and B = F_2 the map 0 → F_2 is not surjective. -/
example (χ : Multiplicative (ZMod 2) →* ℤˣ)
    (hχ : χ (Multiplicative.ofAdd 1) = -1) :
    Subsingleton (Representation.invariants (Representation.ofLinearCharacter χ)) ∧
    Nontrivial (Representation.invariants
      (_root_.Representation.baseChange (ZMod 2) (Representation.ofLinearCharacter χ))) ∧
    ¬ ∃ f : (ZMod 2 ⊗[ℤ] Representation.invariants (Representation.ofLinearCharacter χ)) →ₗ[ZMod 2]
      Representation.invariants (_root_.Representation.baseChange (ZMod 2)
        (Representation.ofLinearCharacter χ)), Function.Surjective f := sorry

theorem SmoothRep.baseChange_id {A G V : Type*} [CommRing A] [Group G] [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) :
    ∃ e : Representation.Equiv (_root_.Representation.baseChange A ρ) ρ,
      ∀ a v, e (a ⊗ₜ[A] v) = a • v := sorry

/- Check `SmoothRep.baseChange_id`: base change along the identity is naturally the identity functor. -/
example {A G V : Type*} [CommRing A] [Group G] [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) :
    ∃ e : Representation.Equiv (_root_.Representation.baseChange A ρ) ρ,
      ∀ a v, e (a ⊗ₜ[A] v) = a • v := sorry

theorem SmoothRep.baseChangeInvariants_permutation {A B G : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (U U' : OpenSubgroup G) (hU : IsCompact (U : Set G)) :
    let ρ := Representation.ofMulAction A G (G ⧸ U'.toSubgroup)
    ∃ e : (B ⊗[A] Representation.invariants (ρ.comp U.toSubgroup.subtype)) ≃ₗ[B]
        Representation.invariants ((_root_.Representation.baseChange B ρ).comp U.toSubgroup.subtype),
      ∀ b v, (e (b ⊗ₜ[A] v)).val = b ⊗ₜ[A] v.val := sorry

/- Check `SmoothRep.baseChangeInvariants_permutation`: for V = A[G/U'] and U compact open, B ⊗ V^U → (B ⊗ V)^U is an isomorphism, both being free on the U-orbits of G/U'. -/
example {A B G : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (U U' : OpenSubgroup G) (hU : IsCompact (U : Set G)) :
    let ρ := Representation.ofMulAction A G (G ⧸ U'.toSubgroup)
    ∃ e : (B ⊗[A] Representation.invariants (ρ.comp U.toSubgroup.subtype)) ≃ₗ[B]
        Representation.invariants ((_root_.Representation.baseChange B ρ).comp U.toSubgroup.subtype),
      ∀ b v, (e (b ⊗ₜ[A] v)).val = b ⊗ₜ[A] v.val := sorry

theorem LocallyConstantCompact.finite_eq_pi : Function.Bijective
    (fun f : LocallyConstantCompact (Fin 3) ℤ => (f.toFun : Fin 3 → ℤ)) := sorry

/- Check `LocallyConstantCompact.finite_eq_pi`: for X = Fin 3 discrete, C_c^∞(X, ℤ) ≃ Fin 3 → ℤ. -/
example : Function.Bijective
    (fun f : LocallyConstantCompact (Fin 3) ℤ => (f.toFun : Fin 3 → ℤ)) := sorry

theorem LocallyConstantCompact.empty {M : Type*} [Zero M] : Subsingleton (LocallyConstantCompact Empty M) := sorry

/- Check `LocallyConstantCompact.empty`: for X empty, C_c^∞(X, M) = 0. -/
example {M : Type*} [Zero M] : Subsingleton (LocallyConstantCompact Empty M) := sorry

theorem LocallyConstantCompact.real_eq_zero (f : LocallyConstantCompact ℝ ℤ) : f.toFun = LocallyConstant.const ℝ 0 := sorry

/- Check `LocallyConstantCompact.real_eq_zero`: for X = ℝ with its usual topology, every locally constant compactly supported f : ℝ → ℤ is 0. -/
example (f : LocallyConstantCompact ℝ ℤ) : f.toFun = LocallyConstant.const ℝ 0 := sorry

theorem HaarMeasureWithValues.padic_apply (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (Multiplicative ℚ_[p]) (Localization.Away (p : ℤ)))
    (U₀ : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU₀ : ∀ x, x ∈ U₀ ↔ ‖Multiplicative.toAdd x‖ ≤ 1) (hμ : μ.vol U₀ = 1) (n : ℤ)
    (U : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU : ∀ x, x ∈ U ↔ ‖Multiplicative.toAdd x‖ ≤ (p : ℝ)^(-n)) :
    μ.vol U = ((IsLocalization.Away.algebraMap_isUnit (S := Localization.Away (p : ℤ)) (p : ℤ)).unit ^ (-n) :
      (Localization.Away (p : ℤ))ˣ) := sorry

/- Check `HaarMeasureWithValues.padic_apply`: for G = ℚ_p, U₀ = ℤ_p over ℤ[1/p], μ(p^n ℤ_p) = p^{−n} for all n ∈ ℤ. -/
example (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (Multiplicative ℚ_[p]) (Localization.Away (p : ℤ)))
    (U₀ : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU₀ : ∀ x, x ∈ U₀ ↔ ‖Multiplicative.toAdd x‖ ≤ 1) (hμ : μ.vol U₀ = 1) (n : ℤ)
    (U : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU : ∀ x, x ∈ U ↔ ‖Multiplicative.toAdd x‖ ≤ (p : ℝ)^(-n)) :
    μ.vol U = ((IsLocalization.Away.algebraMap_isUnit (S := Localization.Away (p : ℤ)) (p : ℤ)).unit ^ (-n) :
      (Localization.Away (p : ℤ))ˣ) := sorry

theorem HaarMeasureWithValues.finite_counting {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [DiscreteTopology G] [Finite G] (μ : HaarMeasureWithValues G A)
    (E : TopologicalSpace.CompactOpens G) (hE : (E : Set G) = {1}) (hμ : μ.vol E = 1)
    (K : TopologicalSpace.CompactOpens G) : μ.vol K = (Nat.card K : A) := sorry

/- Check `HaarMeasureWithValues.finite_counting`: for G finite discrete normalised at {1}, μ(K) = |K|. -/
example {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [DiscreteTopology G] [Finite G] (μ : HaarMeasureWithValues G A)
    (E : TopologicalSpace.CompactOpens G) (hE : (E : Set G) = {1}) (hμ : μ.vol E = 1)
    (K : TopologicalSpace.CompactOpens G) : μ.vol K = (Nat.card K : A) := sorry

theorem HaarMeasureWithValues.no_fp_measure (p : ℕ) [Fact p.Prime] :
    ¬ ∃ μ : HaarMeasureWithValues (Multiplicative ℤ_[p]) (ZMod p),
      ∃ K : TopologicalSpace.CompactOpens (Multiplicative ℤ_[p]),
        (K : Set (Multiplicative ℤ_[p])) = Set.univ ∧ μ.vol K = 1 := sorry

/- Check `HaarMeasureWithValues.no_fp_measure`: there is no F_p-valued Haar measure on ℤ_p with μ(ℤ_p) = 1. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ ∃ μ : HaarMeasureWithValues (Multiplicative ℤ_[p]) (ZMod p),
      ∃ K : TopologicalSpace.CompactOpens (Multiplicative ℤ_[p]),
        (K : Set (Multiplicative ℤ_[p])) = Set.univ ∧ μ.vol K = 1 := sorry

theorem HeckeAlgebra.finite_compat : Nonempty
    (HeckeAlgebra (HaarMeasureWithValues.counting (G := Multiplicative (ZMod 3)) (A := ℤ))
      ≃+* MonoidAlgebra ℤ (Multiplicative (ZMod 3))) := sorry

/- Check `HeckeAlgebra.finite_compat`: for G = ZMod 3 discrete with counting measure, H(G, ℤ) ≃ ℤ[ZMod 3]. -/
example : Nonempty
    (HeckeAlgebra (HaarMeasureWithValues.counting (G := Multiplicative (ZMod 3)) (A := ℤ))
      ≃+* MonoidAlgebra ℤ (Multiplicative (ZMod 3))) := sorry

theorem HeckeAlgebra.indicator_padic (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (Multiplicative ℚ_[p]) (Localization.Away (p : ℤ)))
    (U₀ : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU₀ : ∀ x, x ∈ U₀ ↔ ‖Multiplicative.toAdd x‖ ≤ 1) (hμ : μ.vol U₀ = 1)
    (U : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU : ∀ x, x ∈ U ↔ ‖Multiplicative.toAdd x‖ ≤ (p : ℝ)⁻¹) :
    let f : HeckeAlgebra μ := LocallyConstantCompact.indicator U 1
    f * f = (↑((IsLocalization.Away.algebraMap_isUnit (S := Localization.Away (p : ℤ)) (p : ℤ)).unit⁻¹) : Localization.Away (p : ℤ)) • f := sorry

/- Check `HeckeAlgebra.indicator_padic`: in H(ℚ_p, ℤ[1/p]) normalised on ℤ_p, 1_{pℤ_p} * 1_{pℤ_p} = p⁻¹ • 1_{pℤ_p}. -/
example (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (Multiplicative ℚ_[p]) (Localization.Away (p : ℤ)))
    (U₀ : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU₀ : ∀ x, x ∈ U₀ ↔ ‖Multiplicative.toAdd x‖ ≤ 1) (hμ : μ.vol U₀ = 1)
    (U : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU : ∀ x, x ∈ U ↔ ‖Multiplicative.toAdd x‖ ≤ (p : ℝ)⁻¹) :
    let f : HeckeAlgebra μ := LocallyConstantCompact.indicator U 1
    f * f = (↑((IsLocalization.Away.algebraMap_isUnit (S := Localization.Away (p : ℤ)) (p : ℤ)).unit⁻¹) : Localization.Away (p : ℤ)) • f := sorry

theorem HeckeAlgebra.no_one (p : ℕ) [Fact p.Prime] (μ : HaarMeasureWithValues (Multiplicative ℚ_[p]) ℚ) :
    ¬ ∃ e : HeckeAlgebra μ, ∀ f, e * f = f ∧ f * e = f := sorry

/- Check `HeckeAlgebra.no_one`: H(ℚ_p, ℚ) has no multiplicative identity. -/
example (p : ℕ) [Fact p.Prime] (μ : HaarMeasureWithValues (Multiplicative ℚ_[p]) ℚ) :
    ¬ ∃ e : HeckeAlgebra μ, ∀ f, e * f = f ∧ f * e = f := sorry

theorem HeckeAlgebra.idempotent_finite (U : TopologicalSpace.CompactOpens (Multiplicative (ZMod 2)))
    (hU : (U : Set (Multiplicative (ZMod 2))) = Set.univ)
    (x : Multiplicative (ZMod 2)) :
    (HeckeAlgebra.idempotent
      (HaarMeasureWithValues.counting (A := Localization.Away (2 : ℤ)))
      U (by sorry) (by sorry)).toFun x =
        ↑((IsLocalization.Away.algebraMap_isUnit (S := Localization.Away (2 : ℤ)) (2 : ℤ)).unit⁻¹) := sorry

/- Check `HeckeAlgebra.idempotent_finite`: for G = ZMod 2 discrete and A = ℤ[1/2], e_G = (1/2)(δ_0 + δ_1). -/
example (U : TopologicalSpace.CompactOpens (Multiplicative (ZMod 2)))
    (hU : (U : Set (Multiplicative (ZMod 2))) = Set.univ)
    (x : Multiplicative (ZMod 2)) :
    (HeckeAlgebra.idempotent
      (HaarMeasureWithValues.counting (A := Localization.Away (2 : ℤ)))
      U (by sorry) (by sorry)).toFun x =
        ↑((IsLocalization.Away.algebraMap_isUnit (S := Localization.Away (2 : ℤ)) (2 : ℤ)).unit⁻¹) := sorry

theorem HeckeAlgebra.idempotent_padic (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (Multiplicative ℚ_[p]) (Localization.Away (p : ℤ)))
    (U₀ : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU₀ : ∀ x, x ∈ U₀ ↔ ‖Multiplicative.toAdd x‖ ≤ 1) (hμ : μ.vol U₀ = 1)
    (U : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU : ∀ x, x ∈ U ↔ ‖Multiplicative.toAdd x‖ ≤ (p : ℝ)⁻¹) :
    HeckeAlgebra.idempotent μ U (by sorry) (by sorry) =
      (p : Localization.Away (p : ℤ)) • (show HeckeAlgebra μ from LocallyConstantCompact.indicator U 1) := sorry

/- Check `HeckeAlgebra.idempotent_padic`: in H(ℚ_p, ℤ[1/p]) normalised on ℤ_p, e_{pℤ_p} = p • 1_{pℤ_p}. -/
example (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (Multiplicative ℚ_[p]) (Localization.Away (p : ℤ)))
    (U₀ : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU₀ : ∀ x, x ∈ U₀ ↔ ‖Multiplicative.toAdd x‖ ≤ 1) (hμ : μ.vol U₀ = 1)
    (U : TopologicalSpace.CompactOpens (Multiplicative ℚ_[p]))
    (hU : ∀ x, x ∈ U ↔ ‖Multiplicative.toAdd x‖ ≤ (p : ℝ)⁻¹) :
    HeckeAlgebra.idempotent μ U (by sorry) (by sorry) =
      (p : Localization.Away (p : ℤ)) • (show HeckeAlgebra μ from LocallyConstantCompact.indicator U 1) := sorry

theorem HeckeAlgebra.idempotent_top {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (μ : HaarMeasureWithValues G A) (U : TopologicalSpace.CompactOpens G)
    (hU : (U : Set G) = Set.univ) (hv : IsUnit (μ.vol U)) (f : HeckeAlgebra μ) :
    HeckeAlgebra.idempotent μ U (by sorry) hv * f =
      μ.integrate f • HeckeAlgebra.idempotent μ U (by sorry) hv := sorry

/- Check `HeckeAlgebra.idempotent_top`: for G compact open in itself and U = G of invertible pro-order, e_G * f = (∫ f) e_G. -/
example {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (μ : HaarMeasureWithValues G A) (U : TopologicalSpace.CompactOpens G)
    (hU : (U : Set G) = Set.univ) (hv : IsUnit (μ.vol U)) (f : HeckeAlgebra μ) :
    HeckeAlgebra.idempotent μ U (by sorry) hv * f =
      μ.integrate f • HeckeAlgebra.idempotent μ U (by sorry) hv := sorry

theorem HeckeAlgebraLevel.normal_eq_groupAlgebra {A G : Type u} [CommRing A] [Group G] (U : Subgroup G) [U.Normal] :
    Nonempty (HeckeAlgebraLevel A G U ≃+* MonoidAlgebra A (G ⧸ U)) := sorry

/- Check `HeckeAlgebraLevel.normal_eq_groupAlgebra`: for U normal in G, H(G, U; A) ≃ MonoidAlgebra A (G ⧸ U). -/
example {A G : Type u} [CommRing A] [Group G] (U : Subgroup G) [U.Normal] :
    Nonempty (HeckeAlgebraLevel A G U ≃+* MonoidAlgebra A (G ⧸ U)) := sorry

theorem SmoothRep.traceLevel_comp_incl {A G V : Type*} [CommRing A] [Group G] [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) (U U' : Subgroup G) (h : U' ≤ U)
    [Fintype (U ⧸ U'.subgroupOf U)]
    (r : U ⧸ U'.subgroupOf U → U) (hr : ∀ x, QuotientGroup.mk (r x) = x)
    (v : Representation.invariants (ρ.comp U.subtype)) :
    ∑ x, ρ (r x) v.val = (Fintype.card (U ⧸ U'.subgroupOf U) : A) • v.val := sorry

/- Check `SmoothRep.traceLevel_comp_incl`: tr_{U/U'} ∘ incl = [U : U'] • id on V^U. -/
example {A G V : Type*} [CommRing A] [Group G] [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) (U U' : Subgroup G) (h : U' ≤ U)
    [Fintype (U ⧸ U'.subgroupOf U)]
    (r : U ⧸ U'.subgroupOf U → U) (hr : ∀ x, QuotientGroup.mk (r x) = x)
    (v : Representation.invariants (ρ.comp U.subtype)) :
    ∑ x, ρ (r x) v.val = (Fintype.card (U ⧸ U'.subgroupOf U) : A) • v.val := sorry

theorem SmoothRep.ext_one_padicInt_fp {k : Type} [Field k] (p : ℕ) [Fact p.Prime] [CharP k p]
    [CategoryTheory.HasExt (SmoothRep k (Multiplicative ℤ_[p]))] :
    let X : SmoothRep k (Multiplicative ℤ_[p]) :=
      ⟨Rep.of (Representation.trivial k (Multiplicative ℤ_[p]) k), by sorry⟩
    Nonempty (CategoryTheory.Abelian.Ext X X 1 ≃ₗ[k] k) := sorry

/- Check `SmoothRep.ext_one_padicInt_fp`: Ext¹ of the trivial representation of ℤ_p over F_p with itself is one-dimensional. -/
example {k : Type} [Field k] (p : ℕ) [Fact p.Prime] [CharP k p]
    [CategoryTheory.HasExt (SmoothRep k (Multiplicative ℤ_[p]))] :
    let X : SmoothRep k (Multiplicative ℤ_[p]) :=
      ⟨Rep.of (Representation.trivial k (Multiplicative ℤ_[p]) k), by sorry⟩
    Nonempty (CategoryTheory.Abelian.Ext X X 1 ≃ₗ[k] k) := sorry

theorem SmoothRep.ext_pos_padicInt_fl (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (h : ℓ ≠ p)
    [CategoryTheory.HasExt (SmoothRep (ZMod ℓ) (Multiplicative ℤ_[p]))]
    (X Y : SmoothRep (ZMod ℓ) (Multiplicative ℤ_[p])) (i : ℕ) (hi : 0 < i) :
    Subsingleton (CategoryTheory.Abelian.Ext X Y i) := sorry

/- Check `SmoothRep.ext_pos_padicInt_fl`: for ℓ ≠ p, Ext^i of smooth F_ℓ-representations of ℤ_p vanishes for i > 0. -/
example (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (h : ℓ ≠ p)
    [CategoryTheory.HasExt (SmoothRep (ZMod ℓ) (Multiplicative ℤ_[p]))]
    (X Y : SmoothRep (ZMod ℓ) (Multiplicative ℤ_[p])) (i : ℕ) (hi : 0 < i) :
    Subsingleton (CategoryTheory.Abelian.Ext X Y i) := sorry

theorem SmoothRep.ext_zero_test {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CategoryTheory.HasExt (SmoothRep A G)] :
    let X : SmoothRep A G := ⟨Rep.of (Representation.trivial A G A), by sorry⟩
    Nonempty (CategoryTheory.Abelian.Ext X X 0 ≃+ A) := sorry

/- Check `SmoothRep.ext_zero_test`: Ext⁰ of the trivial representation with itself is A. -/
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CategoryTheory.HasExt (SmoothRep A G)] :
    let X : SmoothRep A G := ⟨Rep.of (Representation.trivial A G A), by sorry⟩
    Nonempty (CategoryTheory.Abelian.Ext X X 0 ≃+ A) := sorry

theorem SmoothRep.ind_bot_padicInt {A : Type*} [CommRing A] (p : ℕ) [Fact p.Prime] :
    Nonempty ((Representation.ind (⊥ : Subgroup (Multiplicative ℤ_[p]))
      (Representation.trivial A (⊥ : Subgroup (Multiplicative ℤ_[p])) A)).toSubmodule
        ≃ₗ[A] LocallyConstant (Multiplicative ℤ_[p]) A) := sorry

/- Check `SmoothRep.ind_bot_padicInt`: for G = ℤ_p and H = ⊥, Ind_H^G A ≅ LocallyConstant ℤ_p A with translation. -/
example {A : Type*} [CommRing A] (p : ℕ) [Fact p.Prime] :
    Nonempty ((Representation.ind (⊥ : Subgroup (Multiplicative ℤ_[p]))
      (Representation.trivial A (⊥ : Subgroup (Multiplicative ℤ_[p])) A)).toSubmodule
        ≃ₗ[A] LocallyConstant (Multiplicative ℤ_[p]) A) := sorry

theorem SmoothRep.ind_ne_coind (p : ℕ) [Fact p.Prime] :
    ¬ (Representation.ind (⊥ : Subgroup (Multiplicative ℤ_[p]))
      (Representation.trivial ℤ (⊥ : Subgroup (Multiplicative ℤ_[p])) ℤ)).toSubmodule = ⊤ := sorry

/- Check `SmoothRep.ind_ne_coind`: for G = ℤ_p, H = ⊥ and A = ℤ, Ind_H^G ℤ ≠ coind, the characteristic function of a non-open set being in coind but not smooth. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ (Representation.ind (⊥ : Subgroup (Multiplicative ℤ_[p]))
      (Representation.trivial ℤ (⊥ : Subgroup (Multiplicative ℤ_[p])) ℤ)).toSubmodule = ⊤ := sorry

theorem SmoothRep.cInd_ne_ind {A : Type*} [CommRing A] [Nontrivial A] (p : ℕ) [Fact p.Prime] :
    ¬ (fun _ : Multiplicative ℚ_[p] => (1 : A)) ∈
      CompactInducedFunctions (⊥ : Subgroup (Multiplicative ℚ_[p])) 1 := sorry

/- Check `SmoothRep.cInd_ne_ind`: for G = ℚ_p, H = {0} and A nonzero, the constant function 1 lies in Ind but not in c-Ind. For the zero coefficient ring both function spaces are zero. -/
example {A : Type*} [CommRing A] [Nontrivial A] (p : ℕ) [Fact p.Prime] :
    ¬ (fun _ : Multiplicative ℚ_[p] => (1 : A)) ∈
      CompactInducedFunctions (⊥ : Subgroup (Multiplicative ℚ_[p])) 1 := sorry

theorem SmoothRep.jacquet_eq_coinvariants_test {A G : Type*} [CommRing A] [Group G] [Finite G] :
    ∃ e : Representation.Coinvariants (Representation.ofMulAction A G G) ≃ₗ[A] A,
      ∀ g, e (Representation.Coinvariants.mk _ (MonoidAlgebra.single g 1)) = 1 := sorry

/- Check `SmoothRep.jacquet_eq_coinvariants_test`: for the regular representation of a finite discrete group G over A and N = G, the coinvariants are A, with each basis vector mapping to 1. -/
example {A G : Type*} [CommRing A] [Group G] [Finite G] :
    ∃ e : Representation.Coinvariants (Representation.ofMulAction A G G) ≃ₗ[A] A,
      ∀ g, e (Representation.Coinvariants.mk _ (MonoidAlgebra.single g 1)) = 1 := sorry

theorem SmoothRep.universalUnramifiedTwist_hkpInverse :
    (MonoidAlgebra.single (Multiplicative.ofAdd (-1 : ℤ)) (1 : ℚ)) ≠
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℤ)) 1 := sorry

/- Check `SmoothRep.universalUnramifiedTwist_hkpInverse`: in rank one, the untransported HKP model has ϖ acting by t⁻¹, while our tautological twist has ϖ acting by t; the coefficient involution t ↦ t⁻¹ identifies them. `hkpInverseCoefficient` distinguishes the two Laurent monomials in Lean. -/
example :
    (MonoidAlgebra.single (Multiplicative.ofAdd (-1 : ℤ)) (1 : ℚ)) ≠
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℤ)) 1 := sorry

example : Pseudoroot (1 : Unit →* MulAut ℚˣ) (fun _ => 1) 1 (-1) := sorry

/- Check `HallLittlewood.minuscule`: for λ = (1, …, 1, 0, …, 0) with r ≤ n ones, P_λ = e_r at pairwise distinct coordinates with nonzero Hall normalizer. -/
example {K : Type*} [Field K] {n r : ℕ} (hr : r ≤ n)
    (t : K) (x : Fin n → K) (hx : Function.Injective x)
    (ht : hallNormalizer (fun i : Fin n => if i.val < r then 1 else 0) t ≠ 0) :
    hallLittlewoodEval (fun i : Fin n => if i.val < r then 1 else 0) t x =
      ∑ s ∈ (Finset.univ : Finset (Fin n)).powersetCard r, ∏ i ∈ s, x i := sorry

/- Check `PairedParameter.productRing`: over L = ℚ, T² − 3T + 1 is reciprocal but has no root in L, so it admits no paired ordering. -/
example : (X^2 - 3*X + 1 : ℚ[X]).reverse = X^2 - 3*X + 1 ∧
    ¬ ∃ r : ℚ, r^2 - 3*r + 1 = 0 := sorry

/- Check `SpinPolynomial.rankFour`: at q = 2, T₀ = 1, T₁ = 2 and T₂ = 3 over ℤ, the spin polynomial is 1 − 3X + 14X² − 24X³ + 64X⁴; in particular the middle coefficient includes q³ + q. -/
example : SpinPolynomial (2 : ℤ) 1 2 3 =
    1 - 3 * X + 14 * X^2 - 24 * X^3 + 64 * X^4 := sorry

theorem ZFinite.scalarFinite {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (X : SmoothRep A G)
    (ha : Representation.IsAdmissible X.obj.ρ)
    (hf : Algebra.FiniteType A (SmoothCentre.image A G X)) : ZFinite A G X := sorry

/- Check `ZFinite.scalarFinite`: an admissible family with scalar center image and finite-type scalar image is Z-finite. -/
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (X : SmoothRep A G)
    (ha : Representation.IsAdmissible X.obj.ρ)
    (hf : Algebra.FiniteType A (SmoothCentre.image A G X)) : ZFinite A G X := sorry

/- Check `PairedParameter.rankOne`: every inert paired rank-one parameter has polynomial T − 1 (and its sole entry is 1). -/
example {A : Type*} [CommRing A] (a : PairedParameter (A := A) 1) :
    a.polynomial = X - 1 ∧ a.alpha 0 = 1 := sorry

/- Check `StableOperator.nilpotent`: a nilpotent T is stable with invertible part zero. -/
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (T : Module.End R M) (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    StableOperator T ∧ LinearMap.ker (T^c) = ⊤ ∧
      IsCompl (LinearMap.ker (T^c)) (⊥ : Submodule R M) := sorry

/- Check `StableOperator.automorphism`: an invertible T is stable with nilpotent part zero. -/
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (e : M ≃ₗ[R] M) : StableOperator e.toLinearMap ∧
      LinearMap.ker e.toLinearMap = ⊥ ∧
      IsCompl (LinearMap.ker e.toLinearMap) (⊤ : Submodule R M) := sorry

/- Check `StableOperator.mixed`: on M₁ ⊕ M₂ with T nilpotent on M₁ and invertible on M₂, the stable invertible part is M₂. -/
example {R M N : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    [AddCommGroup N] [Module R N] (T : Module.End R M) (e : N ≃ₗ[R] N)
    (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    let S := LinearMap.prodMap T e.toLinearMap
    let I : Submodule R (M × N) := LinearMap.range (LinearMap.inr R M N)
    StableOperator S ∧ IsCompl (LinearMap.ker (S^c)) I ∧
      (∀ x ∈ I, S x ∈ I) ∧ (∀ y ∈ I, ∃! x : I, S x = y) := sorry

theorem SmoothRep.cInd_padic {A : Type*} [CommRing A] (p : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℚ_[p]) :=
      { carrier := {g | ‖Multiplicative.toAdd g‖ ≤ 1}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    Nonempty (CompactInducedFunctions U (1 : U →* Aˣ) ≃ₗ[A]
      MonoidAlgebra A (Multiplicative ℚ_[p] ⧸ U)) := sorry

/- Check `SmoothRep.cInd_padic`: c-Ind_{ℤ_p}^{ℚ_p} A ≅ A[ℚ_p ⧸ ℤ_p]. -/
example {A : Type*} [CommRing A] (p : ℕ) [Fact p.Prime] :
    let U : Subgroup (Multiplicative ℚ_[p]) :=
      { carrier := {g | ‖Multiplicative.toAdd g‖ ≤ 1}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    Nonempty (CompactInducedFunctions U (1 : U →* Aˣ) ≃ₗ[A]
      MonoidAlgebra A (Multiplicative ℚ_[p] ⧸ U)) := sorry

theorem SmoothRep.derivedHecke_padicInt {k : Type} [Field k] (p : ℕ) [Fact p.Prime] [CharP k p]
    [CategoryTheory.HasExt (SmoothRep k (Multiplicative ℤ_[p]))] :
    let X : SmoothRep k (Multiplicative ℤ_[p]) :=
      ⟨Rep.of (Representation.trivial k (Multiplicative ℤ_[p]) k), by sorry⟩
    Nonempty (CategoryTheory.Abelian.Ext X X 1 ≃ₗ[k] k) ∧
      ∀ i : ℕ, 2 ≤ i → Subsingleton (CategoryTheory.Abelian.Ext X X i) := sorry

/- Check `SmoothRep.derivedHecke_padicInt`: for G = U = ℤ_p and S = F_p, H¹(G, U; F_p) ≅ F_p and H^i = 0 for i ≥ 2. -/
example {k : Type} [Field k] (p : ℕ) [Fact p.Prime] [CharP k p]
    [CategoryTheory.HasExt (SmoothRep k (Multiplicative ℤ_[p]))] :
    let X : SmoothRep k (Multiplicative ℤ_[p]) :=
      ⟨Rep.of (Representation.trivial k (Multiplicative ℤ_[p]) k), by sorry⟩
    Nonempty (CategoryTheory.Abelian.Ext X X 1 ≃ₗ[k] k) ∧
      ∀ i : ℕ, 2 ≤ i → Subsingleton (CategoryTheory.Abelian.Ext X X i) := sorry

theorem SmoothRep.derivedHecke_unit_degree_zero {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CategoryTheory.HasExt (SmoothRep A G)]
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
    (hu : HasUnitProOrder A U.toSubgroup) (i : ℕ) (hi : 0 < i) :
    let X : SmoothRep A G := ⟨Rep.of
      (Representation.ofMulAction A G (G ⧸ U.toSubgroup)), by sorry⟩
    Subsingleton (CategoryTheory.Abelian.Ext X X i) := sorry

/- Check `SmoothRep.derivedHecke_unit_degree_zero`: for U of invertible pro-order in S, H^i(G, U; S) = 0 for i > 0. -/
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CategoryTheory.HasExt (SmoothRep A G)]
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
    (hu : HasUnitProOrder A U.toSubgroup) (i : ℕ) (hi : 0 < i) :
    let X : SmoothRep A G := ⟨Rep.of
      (Representation.ofMulAction A G (G ⧸ U.toSubgroup)), by sorry⟩
    Subsingleton (CategoryTheory.Abelian.Ext X X i) := sorry

theorem SmoothRep.derivedHecke_zero_compat {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CategoryTheory.HasExt (SmoothRep A G)]
    (U : OpenSubgroup G)
    [IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup] :
    let X : SmoothRep A G := ⟨Rep.of
      (Representation.ofMulAction A G (G ⧸ U.toSubgroup)), by sorry⟩
    ∃ e : CategoryTheory.Abelian.Ext X X 0 ≃+
        HeckeRing (⊤ : Submonoid G) U.toSubgroup A,
      ∀ f g, e (CategoryTheory.Abelian.Ext.comp g f (by omega)) = e f * e g := sorry

/- Check `SmoothRep.derivedHecke_zero_compat`: H⁰(G, U; S) is the double-coset Hecke ring 𝕋 of the Hecke pair (U, G) over S (via SR.1 *hecke-ring-comparison*). -/
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CategoryTheory.HasExt (SmoothRep A G)]
    (U : OpenSubgroup G)
    [IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup] :
    let X : SmoothRep A G := ⟨Rep.of
      (Representation.ofMulAction A G (G ⧸ U.toSubgroup)), by sorry⟩
    ∃ e : CategoryTheory.Abelian.Ext X X 0 ≃+
        HeckeRing (⊤ : Submonoid G) U.toSubgroup A,
      ∀ f g, e (CategoryTheory.Abelian.Ext.comp g f (by omega)) = e f * e g := sorry

/- Check `Pseudoroot.even`: The inverse cocharacter satisfies the prescribed square and Weyl twist. -/
example {W H : Type*} [Group W] [CommGroup H] (a : W →* MulAut H)
    (η : ℚˣ →* H) (q : ℚˣ) :
    Pseudoroot a (fun w => a w (η q) * (η q)⁻¹) ((η q)⁻¹ * (η q)⁻¹) (η q)⁻¹ := sorry

/- Check `Pseudoroot.even`: At q = 2 the inverse identity cocharacter is 1/2, with square 1/4. -/
example : Pseudoroot (1 : Unit →* MulAut ℚˣ) (fun _ => 1)
    (Units.mk0 (1 / 4 : ℚ) (by norm_num)) (Units.mk0 (1 / 2 : ℚ) (by norm_num)) := sorry

/- Check `Pseudoroot.characteristicTwo`: In characteristic two the identity is the unique pseudoroot for the trivial twist and square 1. -/
example {k W : Type*} [Field k] [CharP k 2] [Group W] (n : ℕ)
    (a : W →* MulAut (Fin n → kˣ)) (x : Fin n → kˣ) :
    Pseudoroot a (fun _ => 1) 1 x ↔ x = 1 := sorry

theorem HeckeAlgebraLevel.gl2_tp_card (p : ℕ) [Fact p.Prime] :
    let G := (Matrix (Fin 2) (Fin 2) ℚ_[p])ˣ
    let U : Subgroup G :=
      { carrier := {g | (∀ i j, ‖g.val i j‖ ≤ 1) ∧ (∀ i j, ‖(g⁻¹).val i j‖ ≤ 1)}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let d : ℤ × ℤ → G := fun ab =>
      { val := Matrix.diagonal ![(p : ℚ_[p]) ^ ab.1, (p : ℚ_[p]) ^ ab.2]
        inv := Matrix.diagonal ![(p : ℚ_[p]) ^ (-ab.1), (p : ℚ_[p]) ^ (-ab.2)]
        val_inv := by sorry
        inv_val := by sorry }
    Nat.card {x : G ⧸ U // ∃ u : U, x = QuotientGroup.mk (u.val * d (1, 0))} = p + 1 := sorry

/- Check `HeckeAlgebraLevel.gl2_tp_card`: for G = GL_2(ℚ_p), U = GL_2(ℤ_p), [U diag(p,1) U] is the sum of p + 1 left cosets. -/
example (p : ℕ) [Fact p.Prime] :
    let G := (Matrix (Fin 2) (Fin 2) ℚ_[p])ˣ
    let U : Subgroup G :=
      { carrier := {g | (∀ i j, ‖g.val i j‖ ≤ 1) ∧ (∀ i j, ‖(g⁻¹).val i j‖ ≤ 1)}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let d : ℤ × ℤ → G := fun ab =>
      { val := Matrix.diagonal ![(p : ℚ_[p]) ^ ab.1, (p : ℚ_[p]) ^ ab.2]
        inv := Matrix.diagonal ![(p : ℚ_[p]) ^ (-ab.1), (p : ℚ_[p]) ^ (-ab.2)]
        val_inv := by sorry
        inv_val := by sorry }
    Nat.card {x : G ⧸ U // ∃ u : U, x = QuotientGroup.mk (u.val * d (1, 0))} = p + 1 := sorry

theorem SmoothRep.invariants_permutation_gl2 (p : ℕ) [Fact p.Prime] :
    let G := (Matrix (Fin 2) (Fin 2) ℚ_[p])ˣ
    let U : Subgroup G :=
      { carrier := {g | (∀ i j, ‖g.val i j‖ ≤ 1) ∧ (∀ i j, ‖(g⁻¹).val i j‖ ≤ 1)}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let d : ℤ × ℤ → G := fun ab =>
      { val := Matrix.diagonal ![(p : ℚ_[p]) ^ ab.1, (p : ℚ_[p]) ^ ab.2]
        inv := Matrix.diagonal ![(p : ℚ_[p]) ^ (-ab.1), (p : ℚ_[p]) ^ (-ab.2)]
        val_inv := by sorry
        inv_val := by sorry }
    let ρ := Representation.ofMulAction ℤ G (G ⧸ U)
    ∃ b : Module.Basis {ab : ℤ × ℤ // ab.2 ≤ ab.1} ℤ (Representation.invariants (ρ.comp U.subtype)),
      ∀ ab x, (b ab).val.coeff x =
        if ∃ u : U, x = QuotientGroup.mk (u.val * d ab.val) then 1 else 0 := sorry

/- Check `SmoothRep.invariants_permutation_gl2`: for G = GL_2(ℚ_p) and U = GL_2(ℤ_p), the U-invariants of ℤ[G/U] are free on the double cosets of diag(p^a, p^b), a ≥ b. -/
example (p : ℕ) [Fact p.Prime] :
    let G := (Matrix (Fin 2) (Fin 2) ℚ_[p])ˣ
    let U : Subgroup G :=
      { carrier := {g | (∀ i j, ‖g.val i j‖ ≤ 1) ∧ (∀ i j, ‖(g⁻¹).val i j‖ ≤ 1)}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry }
    let d : ℤ × ℤ → G := fun ab =>
      { val := Matrix.diagonal ![(p : ℚ_[p]) ^ ab.1, (p : ℚ_[p]) ^ ab.2]
        inv := Matrix.diagonal ![(p : ℚ_[p]) ^ (-ab.1), (p : ℚ_[p]) ^ (-ab.2)]
        val_inv := by sorry
        inv_val := by sorry }
    let ρ := Representation.ofMulAction ℤ G (G ⧸ U)
    ∃ b : Module.Basis {ab : ℤ × ℤ // ab.2 ≤ ab.1} ℤ (Representation.invariants (ρ.comp U.subtype)),
      ∀ ab x, (b ab).val.coeff x =
        if ∃ u : U, x = QuotientGroup.mk (u.val * d ab.val) then 1 else 0 := sorry


set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

/-! ## Layer SR.0: functorial invariants and coefficient-free operations -/
section SmoothFunctorAPI
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]

abbrev SmoothRep.trivial (V : ModuleCat.{u} A) : SmoothRep A G :=
  ⟨Rep.of (Representation.trivial A G V), by sorry⟩

abbrev SmoothRep.invariants (U : Subgroup G) (V : SmoothRep A G) :=
  Representation.invariants (V.obj.ρ.comp U.subtype)

/-- Restriction of intertwining maps to the fixed submodules. -/
def SmoothRep.invariantsFunctor (U : Subgroup G) : SmoothRep A G ⥤ ModuleCat A where
  obj V := ModuleCat.of A (SmoothRep.invariants U V)
  map f := ModuleCat.ofHom
    { toFun := fun v => ⟨f.hom.hom v, by sorry⟩
      map_add' := by sorry
      map_smul' := by sorry }
  map_id := by sorry
  map_comp := by sorry

instance SmoothRep.invariantsFunctor_additive (U : Subgroup G) :
    (SmoothRep.invariantsFunctor (A := A) U).Additive := by sorry

omit [IsTopologicalGroup G] in
theorem SmoothRep.invariantsFunctor_map_apply (U : Subgroup G) {V W : SmoothRep A G}
    (f : V ⟶ W) (v : SmoothRep.invariants U V) :
    (((SmoothRep.invariantsFunctor U).map f).hom v).val = f.hom.hom v := rfl

theorem SmoothRep.invariants_antitone (V : SmoothRep A G) {U U' : Subgroup G}
    (h : U' ≤ U) : SmoothRep.invariants U V ≤ SmoothRep.invariants U' V := sorry

theorem SmoothRep.invariants_conj (V : SmoothRep A G) (U : Subgroup G) (g : G) :
    ∃ e : SmoothRep.invariants U V ≃ₗ[A]
      SmoothRep.invariants (U.map (MulAut.conj g).toMonoidHom) V,
      ∀ v, (e v).val = V.obj.ρ g v := sorry

/-- Restriction along a continuous group homomorphism. -/
def SmoothRep.res {H : Type u} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (f : H →* G) (hf : Continuous f) : SmoothRep A G ⥤ SmoothRep A H where
  obj V := ⟨Rep.of (V.obj.ρ.comp f), Representation.IsSmooth.comp_continuous V.obj.ρ V.property f hf⟩
  map φ := ObjectProperty.homMk (Rep.ofHom
    { toLinearMap := φ.hom.hom.toLinearMap
      isIntertwining' := by sorry })
  map_id := by sorry
  map_comp := by sorry

theorem Representation.IsSmooth.quotient {V : Type u} [AddCommGroup V] [Module A V]
    {ρ : Representation A G V} (h : Representation.IsSmooth ρ) (S : Subrepresentation ρ) :
    Representation.IsSmooth (ρ.quotient S.toSubmodule (fun g => S.apply_mem_toSubmodule g)) := sorry

/-- A cofinal family of compact opens on which averaging is defined. -/
def HasCofinalUnitProOrder (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G] : Prop :=
  ∀ W ∈ nhds (1 : G), ∃ U : OpenSubgroup G,
    IsCompact (U : Set G) ∧ HasUnitProOrder A U.toSubgroup ∧ (U : Set G) ⊆ W

theorem HasUnitProOrder.map {B : Type u} [CommRing B] (f : A →+* B)
    (K : Subgroup G) (h : HasUnitProOrder A K) : HasUnitProOrder B K := sorry

theorem Representation.averaging_idem {V : Type u} [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) (hs : Representation.IsSmooth ρ)
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup) :
    Representation.averaging ρ hs U hc hu ∘ₗ Representation.averaging ρ hs U hc hu =
      Representation.averaging ρ hs U hc hu := sorry

theorem Representation.range_averaging {V : Type u} [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) (hs : Representation.IsSmooth ρ)
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup) :
    LinearMap.range (Representation.averaging ρ hs U hc hu) =
      Representation.invariants (ρ.comp U.toSubgroup.subtype) := sorry

/-- Finite generation as a group module, without a dimension restriction. -/
def Representation.IsFinitelyGenerated {V : Type u} [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) : Prop := Module.Finite (MonoidAlgebra A G) ρ.asModule

/-- The subrepresentation generated by the orbit of a vector. -/
def Representation.cyclicSubrepresentation {V : Type u} [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) (v : V) : Subrepresentation ρ where
  toSubmodule := Submodule.span A {w | ∃ g : G, w = ρ g v}
  apply_mem_toSubmodule := by sorry

/-- Every cyclic subrepresentation is admissible. -/
def Representation.IsLocallyAdmissible {V : Type u} [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) : Prop :=
  ∀ v, Representation.IsAdmissible (Representation.cyclicSubrepresentation ρ v).toRepresentation

/-- Smooth duals as objects of the same category. -/
def SmoothRep.smoothDual (V : SmoothRep A G) : SmoothRep A G :=
  ⟨Rep.of (X := (Representation.smoothDual V.obj.ρ).toSubmodule) (Representation.smoothDual V.obj.ρ).toRepresentation,
    Representation.isSmooth_smoothDual V.obj.ρ⟩

/-- Evaluation gives the canonical equivariant bidual map. -/
def SmoothRep.toDoubleDual (V : SmoothRep A G) : V ⟶ SmoothRep.smoothDual (SmoothRep.smoothDual V) :=
  ObjectProperty.homMk (Rep.ofHom
    { toLinearMap :=
        { toFun := fun v => ⟨
            { toFun := fun ℓ => ℓ.val v
              map_add' := by sorry
              map_smul' := by sorry }, by sorry⟩
          map_add' := by sorry
          map_smul' := by sorry }
      isIntertwining' := by sorry })

/-- Underlying evaluation, including the smooth-vector inclusions. -/
theorem SmoothRep.toDoubleDual_apply (V : SmoothRep A G) (v : V.obj.V)
    (ℓ : (SmoothRep.smoothDual V).obj.V) :
    ((SmoothRep.toDoubleDual V).hom.hom v).val ℓ = ℓ.val v := rfl

end SmoothFunctorAPI

/-! ## Layer SR.1: locally unital algebras on Mathlib's unitization -/
section NondegenerateModules
variable (A H : Type u) [CommRing A] [NonUnitalRing H] [Module A H]
  [IsScalarTower A H H] [SMulCommClass A H H]

/-- Finite subsets have a common two-sided idempotent local unit. -/
class IsIdempotented : Prop where
  localUnit : ∀ s : Finset H, ∃ e : H, e * e = e ∧ ∀ x ∈ s, e * x = x ∧ x * e = x

/-- Nondegenerate modules are unital modules for the unitization on which H has local units.
The scalar action and H-action are thus compatible by construction. -/
abbrev NondegMod := ObjectProperty.FullSubcategory
  (fun M : ModuleCat.{u} (Unitization A H) =>
    ∀ m : M, ∃ e : H, e * e = e ∧ (Unitization.inr e : Unitization A H) • m = m)

instance NondegMod.instAbelian [IsIdempotented H] : Abelian (NondegMod A H) where
  toPreadditive := inferInstance
  toIsNormalMonoCategory := sorry
  toIsNormalEpiCategory := sorry
  has_finite_products := sorry
  has_kernels := sorry
  has_cokernels := sorry

/-- The left ideal cut out by right multiplication by e. -/
def NondegMod.principalIdeal (e : H) : Submodule A H where
  carrier := {x | x * e = x}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- The projective left ideal He, as a nondegenerate unitization module. -/
def NondegMod.principal [IsIdempotented H] (e : H) (he : e * e = e) : NondegMod A H := sorry

theorem NondegMod.principal_carrier [IsIdempotented H] (e : H) (he : e * e = e) :
    ∃ b : (NondegMod.principal A H e he).obj ≃+ NondegMod.principalIdeal A H e,
      ∀ h v, b ((Unitization.inr h : Unitization A H) • v) =
        ⟨h * (b v).val, by sorry⟩ := sorry

/-- The map sends a module homomorphism to its value on e. -/
theorem NondegMod.homProjEquiv [IsIdempotented H] (e : H) (he : e * e = e)
    (M : NondegMod A H) :
    Nonempty (((NondegMod.principal A H e he ⟶ M)) ≃
      {m : M.obj // (Unitization.inr e : Unitization A H) • m = m}) := sorry

theorem IsIdempotented.unital (R : Type u) [Ring R] [Algebra A R] : IsIdempotented R := sorry

theorem NondegMod.unital_equiv : Nonempty (NondegMod A A ≌ ModuleCat.{u} A) := sorry
/- Check `NondegMod.unital_equiv`: the scalar algebra gives the ordinary module category. -/
example : Nonempty (NondegMod A A ≌ ModuleCat.{u} A) := sorry

open scoped Finsupp in
/-- Componentwise multiplication, not the convolution multiplication of a monoid algebra. -/
theorem IsIdempotented.directSum : IsIdempotented (ℕ →₀ A) ∧
    (Nontrivial A → ¬ ∀ v : ℕ → A, ∃ e : ℕ →₀ A, ∀ n, e n * v n = v n) := sorry
open scoped Finsupp in
/- Check `IsIdempotented.directSum`: finite-support local units cannot fix the constant-one product vector. -/
example [Nontrivial A] : IsIdempotented (ℕ →₀ A) ∧
    ¬ ∀ v : ℕ → A, ∃ e : ℕ →₀ A, ∀ n, e n * v n = v n := sorry

theorem IsIdempotented.not_zeroMul [Nontrivial H] (hzero : ∀ x y : H, x * y = 0) :
    ¬ IsIdempotented H := sorry
/- Check `IsIdempotented.not_zeroMul`: a nonzero additive carrier with zero product has no local units. -/
example [Nontrivial H] (hzero : ∀ x y : H, x * y = 0) : ¬ IsIdempotented H := sorry

/- Check `NondegMod.zero`: the zero module is nondegenerate, including for the zero algebra. -/
example : ∀ m : ModuleCat.of (Unitization A H) (Fin 0 → Unitization A H),
    ∃ e : H, e * e = e ∧ (Unitization.inr e : Unitization A H) • m = m := sorry

/- Check `NondegMod.scalarQuotient`: the augmentation module of a nonzero scalar ring is degenerate. -/
example [Nontrivial A] : ¬ ∀ a : A, ∃ e : H, (0 : A) * a = a := sorry

end NondegenerateModules

/-! ## Layer SR.2: compact induction on arbitrary coefficient modules -/
section GeneralCompactInduction
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
variable {W : Type u} [AddCommGroup W] [Module A W]

/-- Smooth equivariant functions with support contained in H times a compact subset of G. -/
def Representation.cInd (H : Subgroup G) (σ : Representation A H W) :
    Subrepresentation (Representation.coind H.subtype σ) where
  toSubmodule :=
    { carrier := {f | f ∈ (Representation.ind H σ).toSubmodule ∧
        ∃ C : Set G, IsCompact C ∧ ∀ g, f.val g ≠ 0 → ∃ h : H, ∃ c ∈ C, g = h * c}
      zero_mem' := by sorry
      add_mem' := by sorry
      smul_mem' := by sorry }
  apply_mem_toSubmodule := by sorry

abbrev SmoothRep.ind (H : Subgroup G) (σ : SmoothRep A H) : SmoothRep A G :=
  ⟨Rep.of (X := (Representation.ind H σ.obj.ρ).toSubmodule) (Representation.ind H σ.obj.ρ).toRepresentation,
    Representation.ind_isSmooth H σ.obj.ρ⟩

abbrev SmoothRep.cInd (H : Subgroup G) (σ : SmoothRep A H) : SmoothRep A G :=
  ⟨Rep.of (X := (Representation.cInd H σ.obj.ρ).toSubmodule) (Representation.cInd H σ.obj.ρ).toRepresentation, by sorry⟩

/-- Postcomposition on the equivariant function model. -/
def SmoothRep.indFunctor (H : Subgroup G) : SmoothRep A H ⥤ SmoothRep A G where
  obj := SmoothRep.ind H
  map f := ObjectProperty.homMk (Rep.ofHom
    { toLinearMap :=
        { toFun := fun v => ⟨⟨fun g => f.hom.hom (v.val.val g), by sorry⟩, by sorry⟩
          map_add' := by sorry
          map_smul' := by sorry }
      isIntertwining' := by sorry })
  map_id := by sorry
  map_comp := by sorry

/-- Postcomposition preserves compact support modulo H. -/
def SmoothRep.cIndFunctor (H : Subgroup G) : SmoothRep A H ⥤ SmoothRep A G where
  obj := SmoothRep.cInd H
  map f := ObjectProperty.homMk (Rep.ofHom
    { toLinearMap :=
        { toFun := fun v => ⟨⟨fun g => f.hom.hom (v.val.val g), by sorry⟩, by sorry⟩
          map_add' := by sorry
          map_smul' := by sorry }
      isIntertwining' := by sorry })
  map_id := by sorry
  map_comp := by sorry

theorem SmoothRep.ind_apply_mul (H : Subgroup G) (σ : SmoothRep A H)
    (f : (SmoothRep.ind H σ).obj.V) (h : H) (g g' : G) :
    f.val.val (h * g) = σ.obj.ρ h (f.val.val g) ∧
      ((SmoothRep.ind H σ).obj.ρ g' f).val.val g = f.val.val (g * g') := sorry

/-- Evaluation at the group identity is the restriction-induction counit. -/
def SmoothRep.indEval (H : Subgroup G) (σ : SmoothRep A H) :
    (SmoothRep.res H.subtype continuous_subtype_val).obj (SmoothRep.ind H σ) ⟶ σ :=
  ObjectProperty.homMk (Rep.ofHom
    { toLinearMap :=
        { toFun := fun f => f.val.val 1
          map_add' := by sorry
          map_smul' := by sorry }
      isIntertwining' := by sorry })

theorem SmoothRep.indEval_surjective [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (H : Subgroup G) (hH : IsClosed (H : Set G)) (σ : SmoothRep A H) :
    Function.Surjective (SmoothRep.indEval H σ).hom.hom := sorry

theorem SmoothRep.cInd_eq_ind_of_compact [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] (H : Subgroup G)
    (hH : IsClosed (H : Set G)) [CompactSpace (G ⧸ H)] (σ : Representation A H W) :
    Representation.cInd H σ = Representation.ind H σ := sorry

theorem SmoothRep.cIndIsoInd [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (H : OpenSubgroup G) (σ : SmoothRep A H) :
    Nonempty ((SmoothRep.cInd H.toSubgroup σ).obj ≅ Rep.ind H.toSubgroup.subtype σ.obj) := sorry

theorem SmoothRep.frobeniusReciprocity (H : Subgroup G) :
    Nonempty (SmoothRep.res (A := A) H.subtype continuous_subtype_val ⊣ SmoothRep.indFunctor H) := sorry

theorem SmoothRep.compactFrobeniusReciprocity [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] (H : OpenSubgroup G) :
    Nonempty (SmoothRep.cIndFunctor (A := A) H.toSubgroup ⊣
      SmoothRep.res H.toSubgroup.subtype continuous_subtype_val) := sorry

theorem SmoothRep.cInd_self (σ : Representation A (⊤ : Subgroup G) W)
    (hs : Representation.IsSmooth σ) :
    Nonempty (Representation.Equiv (Representation.cInd ⊤ σ).toRepresentation
      (σ.comp Subgroup.topEquiv.symm.toMonoidHom)) := sorry
/- Check `SmoothRep.cInd_self`: evaluation at one identifies whole-group compact induction with its input. -/
example (σ : Representation A (⊤ : Subgroup G) W) (hs : Representation.IsSmooth σ) :
    Nonempty (Representation.Equiv (Representation.cInd ⊤ σ).toRepresentation
      (σ.comp Subgroup.topEquiv.symm.toMonoidHom)) := sorry

/-- Comparison with the character-valued compact-function carrier. -/
theorem Representation.cInd_character [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (H : Subgroup G) (hH : IsClosed (H : Set G)) (χ : H →* Aˣ)
    (hχ : IsSmoothCharacter χ) :
    ∃ e : (Representation.cInd H (Representation.ofLinearCharacter χ)).toSubmodule ≃ₗ[A]
      CompactInducedFunctions H χ, ∀ f g, (e f).val g = f.val.val g := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.cInd_zero (H : Subgroup G) : Subsingleton
    (Representation.cInd H (Representation.trivial A H (Fin 0 → A))).toSubmodule := sorry

/- Check `SmoothRep.cInd_zero`: compact induction of the zero module is zero. -/
example (H : Subgroup G) : Subsingleton
    (Representation.cInd H (Representation.trivial A H (Fin 0 → A))).toSubmodule := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.cInd_character [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (H : Subgroup G) (hH : IsClosed (H : Set G)) (χ : H →* Aˣ) (hχ : IsSmoothCharacter χ) :
    ∃ e : (Representation.cInd H (Representation.ofLinearCharacter χ)).toSubmodule ≃ₗ[A]
      CompactInducedFunctions H χ, ∀ f g, (e f).val g = f.val.val g := sorry

/- Check `SmoothRep.cInd_character`: the general construction agrees pointwise with the character carrier. -/
example [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (H : Subgroup G) (hH : IsClosed (H : Set G)) (χ : H →* Aˣ) (hχ : IsSmoothCharacter χ) :
    ∃ e : (Representation.cInd H (Representation.ofLinearCharacter χ)).toSubmodule ≃ₗ[A]
      CompactInducedFunctions H χ, ∀ f g, (e f).val g = f.val.val g := sorry

end GeneralCompactInduction

/-! ## Iwahori factorizations and contraction -/
section Iwahori
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Both orders of multiplication give unique factorizations inside U. -/
def HasIwahoriDecomposition (U M N Nbar : Subgroup G) : Prop :=
  Function.Bijective (fun x : ↥(U ⊓ Nbar) × ↥(U ⊓ M) × ↥(U ⊓ N) =>
    (⟨x.1.val * x.2.1.val * x.2.2.val, by sorry⟩ : U)) ∧
  Function.Bijective (fun x : ↥(U ⊓ N) × ↥(U ⊓ M) × ↥(U ⊓ Nbar) =>
    (⟨x.1.val * x.2.1.val * x.2.2.val, by sorry⟩ : U))

/-- Conjugation contracts N and inverse conjugation contracts the opposite radical. -/
def positiveMonoid (U M N Nbar : Subgroup G) : Submonoid M where
  carrier := {m | (∀ n ∈ U ⊓ N, m.val * n * m.val⁻¹ ∈ U ⊓ N) ∧
    ∀ n ∈ U ⊓ Nbar, m.val⁻¹ * n * m.val ∈ U ⊓ Nbar}
  one_mem' := by sorry
  mul_mem' := by sorry

/-- Strong positivity includes centrality and contraction of every pair of compact opens. -/
def IsStronglyPositive (U M N Nbar : Subgroup G) (z : M) : Prop :=
  z ∈ Subgroup.center M ∧ z ∈ positiveMonoid U M N Nbar ∧
  (∀ H₁ H₂ : OpenSubgroup ↥(U ⊓ N), IsCompact (H₁ : Set ↥(U ⊓ N)) →
    IsCompact (H₂ : Set ↥(U ⊓ N)) → ∃ k : ℕ, ∀ x ∈ H₁,
      z.val ^ k * x.val * z.val ^ (-(k : ℤ)) ∈ (H₂.toSubgroup.map (U ⊓ N).subtype : Set G)) ∧
  (∀ H₁ H₂ : OpenSubgroup ↥(U ⊓ Nbar), IsCompact (H₁ : Set ↥(U ⊓ Nbar)) →
    IsCompact (H₂ : Set ↥(U ⊓ Nbar)) → ∃ k : ℕ, ∀ x ∈ H₁,
      z.val ^ (-(k : ℤ)) * x.val * z.val ^ k ∈ (H₂.toSubgroup.map (U ⊓ Nbar).subtype : Set G))

theorem HasIwahoriDecomposition.mul_mem_iff (U M N Nbar : Subgroup G)
    (h : HasIwahoriDecomposition U M N Nbar) (g : G) :
    (g ∈ U ↔ ∃! x : ↥(U ⊓ Nbar) × ↥(U ⊓ M) × ↥(U ⊓ N),
      g = x.1.val * x.2.1.val * x.2.2.val) ∧
    (g ∈ U ↔ ∃! x : ↥(U ⊓ N) × ↥(U ⊓ M) × ↥(U ⊓ Nbar),
      g = x.1.val * x.2.1.val * x.2.2.val) := sorry

theorem positiveMonoid.contains_intersection (U M N Nbar : Subgroup G)
    (hN : M ≤ Subgroup.normalizer (N : Set G)) (hNbar : M ≤ Subgroup.normalizer (Nbar : Set G)) (m : M) (hm : m.val ∈ U) :
    m ∈ positiveMonoid U M N Nbar := sorry

end Iwahori

namespace PadicGL2
variable (p : ℕ) [Fact p.Prime]
abbrev Group := GL (Fin 2) ℚ_[p]

/-- The diagonal Levi, as a subgroup of the matrix unit group. -/
def diagonal : Subgroup (Group p) where
  carrier := {g | g.val 0 1 = 0 ∧ g.val 1 0 = 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The upper unipotent radical. -/
def upper : Subgroup (Group p) where
  carrier := {g | g.val 0 0 = 1 ∧ g.val 1 1 = 1 ∧ g.val 1 0 = 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The lower unipotent radical. -/
def lower : Subgroup (Group p) where
  carrier := {g | g.val 0 0 = 1 ∧ g.val 1 1 = 1 ∧ g.val 0 1 = 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- Integral matrices with integral inverse. -/
def maximalCompact : Subgroup (Group p) where
  carrier := {g | (∀ i j, ‖g.val i j‖ ≤ 1) ∧ ∀ i j, ‖g.inv i j‖ ≤ 1}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The inverse image of the upper Borel under reduction modulo p. -/
def iwahori : Subgroup (Group p) where
  carrier := {g | g ∈ maximalCompact p ∧ ‖g.val 1 0‖ < 1}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The contracting diagonal element. -/
def contracting : diagonal p :=
  ⟨{ val := Matrix.diagonal ![(p : ℚ_[p]), 1]
     inv := Matrix.diagonal ![(p : ℚ_[p])⁻¹, 1]
     val_inv := by sorry
     inv_val := by sorry }, by sorry⟩
end PadicGL2

theorem HasIwahoriDecomposition.gl2_iwahori (p : ℕ) [Fact p.Prime] :
    HasIwahoriDecomposition (PadicGL2.iwahori p) (PadicGL2.diagonal p)
      (PadicGL2.upper p) (PadicGL2.lower p) := sorry
/- Check `HasIwahoriDecomposition.gl2_iwahori`: integral triangular reduction admits both orders. -/
example (p : ℕ) [Fact p.Prime] :
    HasIwahoriDecomposition (PadicGL2.iwahori p) (PadicGL2.diagonal p)
      (PadicGL2.upper p) (PadicGL2.lower p) := sorry

theorem not_hasIwahoriDecomposition_gl2_maximal (p : ℕ) [Fact p.Prime] :
    ¬ HasIwahoriDecomposition (PadicGL2.maximalCompact p) (PadicGL2.diagonal p)
      (PadicGL2.upper p) (PadicGL2.lower p) := sorry
/- Check `not_hasIwahoriDecomposition_gl2_maximal`: the Weyl matrix prevents the factorization. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ HasIwahoriDecomposition (PadicGL2.maximalCompact p) (PadicGL2.diagonal p)
      (PadicGL2.upper p) (PadicGL2.lower p) := sorry

theorem IsStronglyPositive.gl2_diag (p : ℕ) [Fact p.Prime] :
    IsStronglyPositive (PadicGL2.iwahori p) (PadicGL2.diagonal p)
      (PadicGL2.upper p) (PadicGL2.lower p) (PadicGL2.contracting p) := sorry
/- Check `IsStronglyPositive.gl2_diag`: p in the first diagonal slot contracts upper entries. -/
example (p : ℕ) [Fact p.Prime] :
    IsStronglyPositive (PadicGL2.iwahori p) (PadicGL2.diagonal p)
      (PadicGL2.upper p) (PadicGL2.lower p) (PadicGL2.contracting p) := sorry

/- Check `HasIwahoriDecomposition.torus`: with trivial radicals, the Levi factor is all of U. -/
example {G : Type u} [Group G] (U : Subgroup G) :
    HasIwahoriDecomposition U ⊤ ⊥ ⊥ := sorry
theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.IsStronglyPositive.not_one_gl2 (p : ℕ) [Fact p.Prime] :
    ¬ IsStronglyPositive (PadicGL2.iwahori p) (PadicGL2.diagonal p)
      (PadicGL2.upper p) (PadicGL2.lower p) 1 := sorry

/- Check `IsStronglyPositive.not_one_gl2`: the identity cannot contract p-adic balls. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsStronglyPositive (PadicGL2.iwahori p) (PadicGL2.diagonal p)
      (PadicGL2.upper p) (PadicGL2.lower p) 1 := sorry
/- Check `IsStronglyPositive.torus`: contraction is vacuous for trivial radicals. -/
example {G : Type u} [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]
    (U : Subgroup G) (z : (⊤ : Subgroup G)) : IsStronglyPositive U ⊤ ⊥ ⊥ z := sorry

/-! ## Derived invariants and Hom complexes on the pinned derived category -/
section DerivedInterfaces
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- A chosen resolution supplied by the unbounded K-injective existence theorem. -/
def SmoothRep.injectiveResolution (V : CochainComplex (SmoothRep A G) ℤ) :=
  Classical.choose (SmoothRep.exists_kInjective A G V)

def SmoothRep.toInjectiveResolution (V : CochainComplex (SmoothRep A G) ℤ) :
    V ⟶ SmoothRep.injectiveResolution V :=
  Classical.choose (Classical.choose_spec (SmoothRep.exists_kInjective A G V))

theorem SmoothRep.injectiveResolution_spec (V : CochainComplex (SmoothRep A G) ℤ) :
    QuasiIso (SmoothRep.toInjectiveResolution V) ∧
      CochainComplex.IsKInjective (SmoothRep.injectiveResolution V) :=
  Classical.choose_spec (Classical.choose_spec (SmoothRep.exists_kInjective A G V))

/-- The A-linear version of Mathlib's HomComplex, using its cochains and differential. -/
def SmoothRep.rHom (V W : CochainComplex (SmoothRep A G) ℤ) :
    CochainComplex (ModuleCat A) ℤ where
  X n := ModuleCat.of A (CochainComplex.HomComplex.Cochain V (SmoothRep.injectiveResolution W) n)
  d n m := ModuleCat.ofHom (CochainComplex.HomComplex.δ_hom (R := A) (F := V)
    (G := SmoothRep.injectiveResolution W) n m)
  shape := by sorry
  d_comp_d' := by sorry

/-- The differential is the signed commutator with the two complex differentials. -/
theorem SmoothRep.rHom_d (V W : CochainComplex (SmoothRep A G) ℤ) (n m : ℤ) :
    ((SmoothRep.rHom V W).d n m).hom =
      CochainComplex.HomComplex.δ_hom (R := A) (F := V) (G := SmoothRep.injectiveResolution W) n m := rfl

variable [HasDerivedCategory (SmoothRep A G)] [HasDerivedCategory (ModuleCat.{u} A)]

/-- Derived compact-open invariants use Mathlib's right derived functor, including its unit. -/
def SmoothRep.derivedInvariants (U : Subgroup G) :
    DerivedCategory.Plus (SmoothRep A G) ⥤ DerivedCategory.Plus (ModuleCat A) :=
  (SmoothRep.invariantsFunctor (A := A) U).rightDerivedFunctorPlus

/-- Cohomology of derived invariants on an object placed in degree zero. -/
abbrev SmoothRep.invariantCohomology (U : Subgroup G) (V : SmoothRep A G) (n : ℤ) :=
  (DerivedCategory.Plus.homologyFunctor (ModuleCat A) n).obj
    ((SmoothRep.derivedInvariants U).obj
      ((DerivedCategory.Plus.singleFunctor (SmoothRep A G) 0).obj V))

theorem SmoothRep.derivedInvariants_zero (U : Subgroup G) (V : SmoothRep A G) :
    Nonempty (SmoothRep.invariantCohomology U V 0 ≅
      (SmoothRep.invariantsFunctor U).obj V) := sorry

theorem SmoothRep.derivedInvariants_of_unit (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup)
    (V : SmoothRep A G) (n : ℤ) (hn : n ≠ 0) :
    Limits.IsZero (SmoothRep.invariantCohomology U.toSubgroup V n) := sorry

theorem SmoothRep.res_preserves_injective (U : OpenSubgroup G)
    (V : SmoothRep A G) [Injective V] :
    Injective ((SmoothRep.res (A := A) U.toSubgroup.subtype continuous_subtype_val).obj V) := sorry

theorem SmoothRep.homology_rHom (V W : CochainComplex (SmoothRep A G) ℤ) (n : ℤ) :
    Nonempty (((HomologicalComplex.homologyFunctor (ModuleCat A) (ComplexShape.up ℤ) n).obj
      (SmoothRep.rHom V W)) ≃+
      ((DerivedCategory.Q.obj V) ⟶ (DerivedCategory.Q.obj W)⟦n⟧)) := sorry

/-- Both variances descend through the localization of complexes. -/
theorem SmoothRep.rHom_functorial :
    ∃ F : (DerivedCategory (SmoothRep A G))ᵒᵖ ⥤
      DerivedCategory (SmoothRep A G) ⥤ DerivedCategory (ModuleCat A),
      ∀ V W : CochainComplex (SmoothRep A G) ℤ,
        Nonempty (((F.obj (Opposite.op (DerivedCategory.Q.obj V))).obj (DerivedCategory.Q.obj W)) ≅
          DerivedCategory.Q.obj (SmoothRep.rHom V W)) := sorry

theorem SmoothRep.homology_rHom_zero :
    let V := (HomologicalComplex.single (SmoothRep A G) (ComplexShape.up ℤ) 0).obj
      (SmoothRep.trivial (G := G) (ModuleCat.of A A))
    Nonempty (((HomologicalComplex.homologyFunctor (ModuleCat A) (ComplexShape.up ℤ) 0).obj
      (SmoothRep.rHom V V)) ≃ₗ[A] A) := sorry
/- Check `SmoothRep.homology_rHom_zero`: degree zero retains precisely the scalar endomorphisms. -/
example :
    let V := (HomologicalComplex.single (SmoothRep A G) (ComplexShape.up ℤ) 0).obj
      (SmoothRep.trivial (G := G) (ModuleCat.of A A))
    Nonempty (((HomologicalComplex.homologyFunctor (ModuleCat A) (ComplexShape.up ℤ) 0).obj
      (SmoothRep.rHom V V)) ≃ₗ[A] A) := sorry

end DerivedInterfaces

section DerivedInvariantChecks
attribute [local instance] HasDerivedCategory.standard

theorem SmoothRep.derivedInvariants_padicInt_fp (p : ℕ) [Fact p.Prime] :
    let V := SmoothRep.trivial (G := Multiplicative ℤ_[p]) (ModuleCat.of (ZMod p) (ZMod p))
    Nonempty (SmoothRep.invariantCohomology ⊤ V 1 ≃ₗ[ZMod p] ZMod p) ∧
      Limits.IsZero (SmoothRep.invariantCohomology ⊤ V 2) := sorry
/- Check `SmoothRep.derivedInvariants_padicInt_fp`: the degree-one class survives, degree two vanishes. -/
example (p : ℕ) [Fact p.Prime] :
    let V := SmoothRep.trivial (G := Multiplicative ℤ_[p]) (ModuleCat.of (ZMod p) (ZMod p))
    Nonempty (SmoothRep.invariantCohomology ⊤ V 1 ≃ₗ[ZMod p] ZMod p) ∧
      Limits.IsZero (SmoothRep.invariantCohomology ⊤ V 2) := sorry

theorem SmoothRep.derivedInvariants_trivial_group {A G : Type u} [CommRing A]
    [Group G] [TopologicalSpace G] [DiscreteTopology G] (V : SmoothRep A G) :
    Nonempty (SmoothRep.invariantCohomology ⊥ V 0 ≃ₗ[A] V.obj.V) ∧
      ∀ n : ℤ, n ≠ 0 → Limits.IsZero (SmoothRep.invariantCohomology ⊥ V n) := sorry
/- Check `SmoothRep.derivedInvariants_trivial_group`: restriction to the trivial subgroup is exact. -/
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [DiscreteTopology G]
    (V : SmoothRep A G) :
    Nonempty (SmoothRep.invariantCohomology ⊥ V 0 ≃ₗ[A] V.obj.V) ∧
      ∀ n : ℤ, n ≠ 0 → Limits.IsZero (SmoothRep.invariantCohomology ⊥ V n) := sorry

theorem SmoothRep.derivedInvariants_unit_test
    (V : SmoothRep (Localization.Away (3 : ℤ)) (Multiplicative (ZMod 3))) :
    Nonempty (SmoothRep.invariantCohomology ⊤ V 0 ≃ₗ[Localization.Away (3 : ℤ)]
      Representation.invariants V.obj.ρ) ∧
      ∀ n : ℤ, n ≠ 0 → Limits.IsZero (SmoothRep.invariantCohomology ⊤ V n) := sorry
/- Check `SmoothRep.derivedInvariants_unit_test`: inverting three removes all higher cohomology. -/
example (V : SmoothRep (Localization.Away (3 : ℤ)) (Multiplicative (ZMod 3))) :
    Nonempty (SmoothRep.invariantCohomology ⊤ V 0 ≃ₗ[Localization.Away (3 : ℤ)]
      Representation.invariants V.obj.ρ) ∧
      ∀ n : ℤ, n ≠ 0 → Limits.IsZero (SmoothRep.invariantCohomology ⊤ V n) := sorry

theorem SmoothRep.rHom_padicInt_fp (p : ℕ) [Fact p.Prime] :
    let V := (HomologicalComplex.single (SmoothRep (ZMod p) (Multiplicative ℤ_[p])) (ComplexShape.up ℤ) 0).obj
      (SmoothRep.trivial (ModuleCat.of (ZMod p) (ZMod p)))
    Nonempty (((HomologicalComplex.homologyFunctor (ModuleCat (ZMod p)) (ComplexShape.up ℤ) 1).obj
      (SmoothRep.rHom V V)) ≃ₗ[ZMod p] ZMod p) := sorry
/- Check `SmoothRep.rHom_padicInt_fp`: derived Hom detects the mod-p extension. -/
example (p : ℕ) [Fact p.Prime] :
    let V := (HomologicalComplex.single (SmoothRep (ZMod p) (Multiplicative ℤ_[p])) (ComplexShape.up ℤ) 0).obj
      (SmoothRep.trivial (ModuleCat.of (ZMod p) (ZMod p)))
    Nonempty (((HomologicalComplex.homologyFunctor (ModuleCat (ZMod p)) (ComplexShape.up ℤ) 1).obj
      (SmoothRep.rHom V V)) ≃ₗ[ZMod p] ZMod p) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.rHom_zero {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (V : CochainComplex (SmoothRep A G) ℤ) (n : ℤ) :
    Limits.IsZero ((HomologicalComplex.homologyFunctor (ModuleCat A) (ComplexShape.up ℤ) n).obj
      (SmoothRep.rHom V HomologicalComplex.zero)) := sorry

/- Check `SmoothRep.rHom_zero`: resolving the zero second argument gives an acyclic Hom complex. -/
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (V : CochainComplex (SmoothRep A G) ℤ) (n : ℤ) :
    Limits.IsZero ((HomologicalComplex.homologyFunctor (ModuleCat A) (ComplexShape.up ℤ) n).obj
      (SmoothRep.rHom V HomologicalComplex.zero)) := sorry
end DerivedInvariantChecks

/-! ## Levi decompositions, modulus and normalized functors -/
section ParabolicCarriers
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Topological subgroup data underlying a local parabolic, with a continuous Levi projection.
Reductivity is an additional hypothesis for the classification theorems; it is not encoded
by an unconstrained group called reductive. -/
structure LeviDecomposition where
  P : Subgroup G
  M : Subgroup G
  N : Subgroup G
  m_le : M ≤ P
  n_le : N ≤ P
  closed_P : IsClosed (P : Set G)
  closed_M : IsClosed (M : Set G)
  closed_N : IsClosed (N : Set G)
  projection : P →* M
  continuous_projection : Continuous projection
  projection_inclusion : ∀ m : M, projection ⟨m.val, m_le m.property⟩ = m
  kernel : projection.ker = N.subgroupOf P

/-- The normalizer acts continuously on N by conjugation. -/
def normalizerConjugation (N : Subgroup G) (g : Subgroup.normalizer (N : Set G)) : N ≃ₜ N where
  toEquiv :=
    { toFun := fun n => ⟨g.val * n.val * g.val⁻¹, by sorry⟩
      invFun := fun n => ⟨g.val⁻¹ * n.val * g.val, by sorry⟩
      left_inv := by sorry
      right_inv := by sorry }
  continuous_toFun := by sorry
  continuous_invFun := by sorry

/-- The rational Haar scaling factor, specified below by compact-open index ratios. -/
def modulus (N : Subgroup G) [LocallyCompactSpace N] [TotallyDisconnectedSpace N] [T2Space N] :
    Subgroup.normalizer (N : Set G) →* ℚˣ := sorry

theorem modulus_index_ratio (N : Subgroup G) [LocallyCompactSpace N]
    [TotallyDisconnectedSpace N] [T2Space N]
    (g : Subgroup.normalizer (N : Set G)) (U : OpenSubgroup N) (hc : IsCompact (U : Set N)) :
    let c : N →* N :=
      { toFun := normalizerConjugation N g
        map_one' := by sorry
        map_mul' := by sorry }
    ((modulus N g : ℚˣ) : ℚ) =
      ((U.toSubgroup.map c ⊓ U.toSubgroup).relIndex (U.toSubgroup.map c) : ℚ) /
      ((U.toSubgroup.map c ⊓ U.toSubgroup).relIndex U.toSubgroup : ℚ) := sorry

omit [IsTopologicalGroup G] in
theorem modulus_mul (N : Subgroup G) [LocallyCompactSpace N]
    [TotallyDisconnectedSpace N] [T2Space N] (g h : Subgroup.normalizer (N : Set G)) :
    modulus N (g * h) = modulus N g * modulus N h := map_mul _ _ _

theorem modulus_eq_index (N : Subgroup G) [LocallyCompactSpace N]
    [TotallyDisconnectedSpace N] [T2Space N]
    (g : Subgroup.normalizer (N : Set G)) (U : OpenSubgroup N) (hc : IsCompact (U : Set N))
    (c : N →* N) (hc' : ∀ n, c n = normalizerConjugation N g n)
    (hU : U.toSubgroup ≤ U.toSubgroup.map c) :
    ((modulus N g : ℚˣ) : ℚ) = (U.toSubgroup.relIndex (U.toSubgroup.map c) : ℚ) := sorry

def LeviDecomposition.normalizerMap (L : LeviDecomposition (G := G)) :
    L.P →* Subgroup.normalizer (L.N : Set G) where
  toFun g := ⟨g.val, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- The integer exponent of the residue cardinality, fixed by the rational Haar module. -/
structure ResidueModulus (L : LeviDecomposition (G := G)) (q : ℕ)
    [LocallyCompactSpace L.N] [TotallyDisconnectedSpace L.N] [T2Space L.N] where
  one_lt : 1 < q
  exponent : L.P →* Multiplicative ℤ
  scaling : ∀ g, ((modulus L.N (L.normalizerMap g) : ℚˣ) : ℚ) =
    (q : ℚ) ^ Multiplicative.toAdd (exponent g)
  radical : ∀ n : L.N, exponent ⟨n.val, L.n_le n.property⟩ = 1

/-- The coefficient character is obtained from the same integer exponent. -/
def residueExponentCharacter {L : LeviDecomposition (G := G)} {q : ℕ}
    [LocallyCompactSpace L.N] [TotallyDisconnectedSpace L.N] [T2Space L.N]
    (d : ResidueModulus L q) {A : Type u} [CommRing A] (qA : Aˣ) : L.P →* Aˣ where
  toFun g := qA ^ Multiplicative.toAdd (d.exponent g)
  map_one' := by sorry
  map_mul' := by sorry

/-- The residue cardinality must map to the specified coefficient unit. -/
def modulusCharacter {L : LeviDecomposition (G := G)} {q : ℕ}
    [LocallyCompactSpace L.N] [TotallyDisconnectedSpace L.N] [T2Space L.N]
    (d : ResidueModulus L q) {A : Type u} [CommRing A] (qA : Aˣ)
    (_hqA : (qA : A) = (q : A)) : L.P →* Aˣ := residueExponentCharacter d qA

def modulusCharacterSqrt {L : LeviDecomposition (G := G)} {q : ℕ}
    [LocallyCompactSpace L.N] [TotallyDisconnectedSpace L.N] [T2Space L.N]
    (d : ResidueModulus L q) {A : Type u} [CommRing A] (sqrtQ : Aˣ)
    (_hsqrt : (sqrtQ : A) ^ 2 = (q : A)) : L.P →* Aˣ :=
  residueExponentCharacter d sqrtQ

theorem modulusCharacterSqrt_sq {L : LeviDecomposition (G := G)} {q : ℕ}
    [LocallyCompactSpace L.N] [TotallyDisconnectedSpace L.N] [T2Space L.N]
    (d : ResidueModulus L q) {A : Type u} [CommRing A] (sqrtQ qA : Aˣ)
    (hqA : (qA : A) = (q : A)) (hsqrt : (sqrtQ : A) ^ 2 = (q : A))
    (hq : sqrtQ ^ 2 = qA) :
    modulusCharacterSqrt d sqrtQ hsqrt ^ 2 = modulusCharacter d qA hqA := sorry

theorem modulusCharacter_isSmooth {L : LeviDecomposition (G := G)} {q : ℕ}
    [LocallyCompactSpace L.N] [TotallyDisconnectedSpace L.N] [T2Space L.N]
    (d : ResidueModulus L q) {A : Type u} [CommRing A] (qA : Aˣ)
    (hqA : (qA : A) = (q : A)) : IsSmoothCharacter (modulusCharacter d qA hqA) := sorry

/-- Agreement uses a unimodular Levi; this holds for a reductive local Levi. -/
theorem modulusCharacter_eq_modularCharacter (L : LeviDecomposition (G := G))
    [LocallyCompactSpace L.P] [LocallyCompactSpace L.M] [LocallyCompactSpace L.N]
    [TotallyDisconnectedSpace L.N] [T2Space L.N]
    (hM : MeasureTheory.Measure.modularCharacter (G := L.M) = 1) (g : L.P) :
    (((modulus L.N (L.normalizerMap g) : ℚˣ) : ℚ) : ℝ) =
      (MeasureTheory.Measure.modularCharacter g : ℝ) := sorry

/-- Twisting changes the action on the same coefficient module. -/
def Representation.twist {A V : Type u} [CommRing A] [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) (χ : G →* Aˣ) : Representation A G V where
  toFun g := (χ g : A) • ρ g
  map_one' := by sorry
  map_mul' := by sorry

abbrev SmoothRep.twist {A : Type u} [CommRing A] (V : SmoothRep A G)
    (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) : SmoothRep A G :=
  ⟨Rep.of (Representation.twist V.obj.ρ χ), by sorry⟩

/-- Inflation is restriction along the continuous Levi projection. -/
abbrev SmoothRep.inflate {A : Type u} [CommRing A] (L : LeviDecomposition (G := G)) :
    SmoothRep A L.M ⥤ SmoothRep A L.P :=
  SmoothRep.res L.projection L.continuous_projection

abbrev SmoothRep.unnormalizedParabolicInd {A : Type u} [CommRing A]
    (L : LeviDecomposition (G := G)) : SmoothRep A L.M ⥤ SmoothRep A G :=
  SmoothRep.inflate L ⋙ SmoothRep.indFunctor L.P

/-- Normalized induction uses the positive square-root character in the covariance law. -/
def SmoothRep.parabolicInd {A : Type u} [CommRing A] (L : LeviDecomposition (G := G))
    (δhalf : L.P →* Aˣ) (hδ : IsSmoothCharacter δhalf) (V : SmoothRep A L.M) : SmoothRep A G :=
  SmoothRep.ind L.P (SmoothRep.twist ((SmoothRep.inflate L).obj V) δhalf hδ)

theorem SmoothRep.parabolicInd_apply {A : Type u} [CommRing A]
    (L : LeviDecomposition (G := G)) (δhalf : L.P →* Aˣ) (hδ : IsSmoothCharacter δhalf)
    (V : SmoothRep A L.M) (f : (SmoothRep.parabolicInd L δhalf hδ V).obj.V)
    (p : L.P) (g : G) :
    f.val.val (p.val * g) = (δhalf p : A) • V.obj.ρ (L.projection p) (f.val.val g) := sorry

/-- The action on coinvariants is induced by the original Levi action. -/
def SmoothRep.jacquet {A : Type u} [CommRing A]
    (L : LeviDecomposition (G := G)) (V : SmoothRep A G) : SmoothRep A L.M :=
  ⟨Rep.of (X := Representation.Coinvariants (V.obj.ρ.comp L.N.subtype))
    { toFun m := Representation.Coinvariants.lift _
        ((Representation.Coinvariants.mk _).comp (V.obj.ρ m.val)) (by sorry)
      map_one' := by sorry
      map_mul' := by sorry }, by sorry⟩

theorem SmoothRep.jacquet_mk_surjective {A : Type u} [CommRing A]
    (L : LeviDecomposition (G := G)) (V : SmoothRep A G) :
    Function.Surjective (Representation.Coinvariants.mk (V.obj.ρ.comp L.N.subtype)) ∧
      ∀ m : L.M, ∀ v : V.obj.V,
        (SmoothRep.jacquet L V).obj.ρ m (Representation.Coinvariants.mk _ v) =
          Representation.Coinvariants.mk _ (V.obj.ρ m.val v) := sorry

def SmoothRep.jacquetFunctor {A : Type u} [CommRing A] (L : LeviDecomposition (G := G)) :
    SmoothRep A G ⥤ SmoothRep A L.M where
  obj := SmoothRep.jacquet L
  map f := ObjectProperty.homMk (Rep.ofHom
    { toLinearMap := Representation.Coinvariants.lift _
        ((Representation.Coinvariants.mk _).comp f.hom.hom.toLinearMap) (by sorry)
      isIntertwining' := by sorry })
  map_id := by sorry
  map_comp := by sorry

def SmoothRep.normalizedJacquet {A : Type u} [CommRing A]
    (L : LeviDecomposition (G := G)) (δhalfM : L.M →* Aˣ) (hδ : IsSmoothCharacter δhalfM)
    (V : SmoothRep A G) : SmoothRep A L.M :=
  SmoothRep.twist (SmoothRep.jacquet L V) δhalfM⁻¹ (by sorry)

end ParabolicCarriers

namespace PadicGL2
variable (p : ℕ) [Fact p.Prime]

def borel : Subgroup (Group p) where
  carrier := {g | g.val 1 0 = 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def diag (a d : ℚ_[p]ˣ) : diagonal p :=
  ⟨{ val := Matrix.diagonal ![(a : ℚ_[p]), (d : ℚ_[p])]
     inv := Matrix.diagonal ![(a⁻¹ : ℚ_[p]ˣ), (d⁻¹ : ℚ_[p]ˣ)]
     val_inv := by sorry
     inv_val := by sorry }, by sorry⟩

abbrev levi : LeviDecomposition (G := Group p) where
  P := borel p
  M := diagonal p
  N := upper p
  m_le := by sorry
  n_le := by sorry
  closed_P := by sorry
  closed_M := by sorry
  closed_N := by sorry
  projection :=
    { toFun := fun g =>
        ⟨{ val := Matrix.diagonal ![g.val.val 0 0, g.val.val 1 1]
           inv := Matrix.diagonal ![(g.val.val 0 0)⁻¹, (g.val.val 1 1)⁻¹]
           val_inv := by sorry
           inv_val := by sorry }, by sorry⟩
      map_one' := by sorry
      map_mul' := by sorry }
  continuous_projection := by sorry
  projection_inclusion := by sorry
  kernel := by sorry

instance : LocallyCompactSpace (upper p) := by sorry
instance : TotallyDisconnectedSpace (upper p) := by sorry
instance : T2Space (upper p) := by sorry
instance : LocallyCompactSpace (borel p) := by sorry
instance : LocallyCompactSpace (diagonal p) := by sorry

/-- The residue exponent for GL₂ is minus the valuation of the diagonal ratio. -/
def residueModulus : ResidueModulus (levi p) p := sorry

theorem residueModulus_diag (a d : ℚ_[p]ˣ) :
    Multiplicative.toAdd ((residueModulus p).exponent
      ⟨(diag p a d).val, (levi p).m_le (diag p a d).property⟩) =
        -Padic.valuation (a : ℚ_[p]) + Padic.valuation (d : ℚ_[p]) := sorry

/-- Complex normalization uses the positive real square root. -/
def halfModulus : (borel p) →* ℂˣ where
  toFun g := Units.mk0
    (Real.sqrt (‖g.val.val 0 0‖ / ‖g.val.val 1 1‖) : ℂ) (by sorry)
  map_one' := by sorry
  map_mul' := by sorry

theorem halfModulus_smooth : IsSmoothCharacter (halfModulus p) := sorry
end PadicGL2

theorem modulusCharacter_gl2_borel (p : ℕ) [Fact p.Prime] (a d : ℚ_[p]ˣ) :
    ((((modulus (PadicGL2.upper p)) ((PadicGL2.levi p).normalizerMap
      ⟨(PadicGL2.diag p a d).val, (PadicGL2.levi p).m_le (PadicGL2.diag p a d).property⟩)
        : ℚˣ) : ℚ) : ℝ) = ‖(a : ℚ_[p]) / (d : ℚ_[p])‖ := sorry
/- Check `modulusCharacter_gl2_borel`: conjugation scales the upper entry by a/d. -/
example (p : ℕ) [Fact p.Prime] (a d : ℚ_[p]ˣ) :
    ((((modulus (PadicGL2.upper p)) ((PadicGL2.levi p).normalizerMap
      ⟨(PadicGL2.diag p a d).val, (PadicGL2.levi p).m_le (PadicGL2.diag p a d).property⟩)
        : ℚˣ) : ℚ) : ℝ) = ‖(a : ℚ_[p]) / (d : ℚ_[p])‖ := sorry

theorem modulusCharacter_trivial_parabolic {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : modulus (⊥ : Subgroup G) = 1 := sorry
/- Check `modulusCharacter_trivial_parabolic`: the trivial radical has no volume distortion. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    modulus (⊥ : Subgroup G) = 1 := sorry

theorem modulusCharacter_eq_modularCharacter_test (p : ℕ) [Fact p.Prime]
    (g : PadicGL2.borel p) :
    ((((modulus (PadicGL2.upper p)) ((PadicGL2.levi p).normalizerMap g) : ℚˣ) : ℚ) : ℝ) =
      (MeasureTheory.Measure.modularCharacter g : ℝ) := sorry
/- Check `modulusCharacter_eq_modularCharacter_test`: the index convention matches right inverse translation. -/
example (p : ℕ) [Fact p.Prime] (g : PadicGL2.borel p) :
    ((((modulus (PadicGL2.upper p)) ((PadicGL2.levi p).normalizerMap g) : ℚˣ) : ℚ) : ℝ) =
      (MeasureTheory.Measure.modularCharacter g : ℝ) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.modulusCharacter.diagonal_controls (p : ℕ) [Fact p.Prime] :
    let uniformizer : ℚ_[p]ˣ := Units.mk0 (p : ℚ_[p]) (by sorry)
    let b₁ : PadicGL2.borel p :=
      ⟨(PadicGL2.diag p uniformizer 1).val, (PadicGL2.levi p).m_le (by sorry)⟩
    let b₂ : PadicGL2.borel p :=
      ⟨(PadicGL2.diag p 1 uniformizer).val, (PadicGL2.levi p).m_le (by sorry)⟩
    ((modulus (PadicGL2.upper p) ((PadicGL2.levi p).normalizerMap b₁) : ℚˣ) : ℚ) = (p : ℚ)⁻¹ ∧
    ((modulus (PadicGL2.upper p) ((PadicGL2.levi p).normalizerMap b₂) : ℚˣ) : ℚ) = p := sorry

/- Check `modulusCharacter.diagonal_controls`: the two diagonal slots give inverse factors. -/
example (p : ℕ) [Fact p.Prime] :
    let uniformizer : ℚ_[p]ˣ := Units.mk0 (p : ℚ_[p]) (by sorry)
    let b₁ : PadicGL2.borel p :=
      ⟨(PadicGL2.diag p uniformizer 1).val, (PadicGL2.levi p).m_le (by sorry)⟩
    let b₂ : PadicGL2.borel p :=
      ⟨(PadicGL2.diag p 1 uniformizer).val, (PadicGL2.levi p).m_le (by sorry)⟩
    ((modulus (PadicGL2.upper p) ((PadicGL2.levi p).normalizerMap b₁) : ℚˣ) : ℚ) = (p : ℚ)⁻¹ ∧
    ((modulus (PadicGL2.upper p) ((PadicGL2.levi p).normalizerMap b₂) : ℚˣ) : ℚ) = p := sorry

/-- The whole group as its own Levi. -/
def LeviDecomposition.self {G : Type u} [Group G] [TopologicalSpace G] [T2Space G] :
    LeviDecomposition (G := G) where
  P := ⊤
  M := ⊤
  N := ⊥
  m_le := le_rfl
  n_le := bot_le
  closed_P := isClosed_univ
  closed_M := isClosed_univ
  closed_N := by sorry
  projection := MonoidHom.id _
  continuous_projection := continuous_id
  projection_inclusion := by sorry
  kernel := by sorry

theorem SmoothRep.parabolicInd_self {A G : Type u} [CommRing A] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [T2Space G] (V : SmoothRep A G) :
    Nonempty (SmoothRep.parabolicInd LeviDecomposition.self 1 (by sorry)
      ((SmoothRep.res (⊤ : Subgroup G).subtype continuous_subtype_val).obj V) ≅ V) := sorry
/- Check `SmoothRep.parabolicInd_self`: whole-group induction preserves the representation. -/
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [T2Space G] (V : SmoothRep A G) :
    Nonempty (SmoothRep.parabolicInd LeviDecomposition.self 1 (by sorry)
      ((SmoothRep.res (⊤ : Subgroup G).subtype continuous_subtype_val).obj V) ≅ V) := sorry

theorem SmoothRep.parabolicInd_gl2_apply (p : ℕ) [Fact p.Prime]
    (χ : PadicGL2.diagonal p →* ℂˣ) (hχ : IsSmoothCharacter χ)
    (f : (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
      (PadicGL2.halfModulus_smooth p) ⟨Rep.of (Representation.ofLinearCharacter χ), by sorry⟩).obj.V)
    (b : PadicGL2.borel p) (g : PadicGL2.Group p) :
    f.val.val (b.val * g) = ((χ ((PadicGL2.levi p).projection b) : ℂ) *
      (Real.sqrt (‖b.val.val 0 0‖ / ‖b.val.val 1 1‖) : ℂ)) • f.val.val g := sorry
/- Check `SmoothRep.parabolicInd_gl2_apply`: covariance has the positive half modulus. -/
example (p : ℕ) [Fact p.Prime]
    (χ : PadicGL2.diagonal p →* ℂˣ) (hχ : IsSmoothCharacter χ)
    (f : (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
      (PadicGL2.halfModulus_smooth p) ⟨Rep.of (Representation.ofLinearCharacter χ), by sorry⟩).obj.V)
    (b : PadicGL2.borel p) (g : PadicGL2.Group p) :
    f.val.val (b.val * g) = ((χ ((PadicGL2.levi p).projection b) : ℂ) *
      (Real.sqrt (‖b.val.val 0 0‖ / ‖b.val.val 1 1‖) : ℂ)) • f.val.val g := sorry

theorem SmoothRep.jacquet_trivial_gl2 (p : ℕ) [Fact p.Prime] {A : Type} [CommRing A] :
    Nonempty (SmoothRep.jacquet (PadicGL2.levi p)
      (SmoothRep.trivial (ModuleCat.of A A)) ≅ SmoothRep.trivial (ModuleCat.of A A)) := sorry
/- Check `SmoothRep.jacquet_trivial_gl2`: this is the unnormalized, hence trivial, Levi action. -/
example (p : ℕ) [Fact p.Prime] {A : Type} [CommRing A] :
    Nonempty (SmoothRep.jacquet (PadicGL2.levi p)
      (SmoothRep.trivial (ModuleCat.of A A)) ≅ SmoothRep.trivial (ModuleCat.of A A)) := sorry

section DerivedDuality
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [HasDerivedCategory (SmoothRep A G)] [HasDerivedCategory (ModuleCat.{u} A)]

/-- The unbounded derived invariants functor, computed by the chosen K-injective resolution. -/
def SmoothRep.derivedInvariantsUnbounded (U : Subgroup G) :
    DerivedCategory (SmoothRep A G) ⥤ DerivedCategory (ModuleCat A) := sorry

theorem SmoothRep.derivedInvariantsUnbounded_obj (U : Subgroup G)
    (V : CochainComplex (SmoothRep A G) ℤ) :
    Nonempty ((SmoothRep.derivedInvariantsUnbounded U).obj (DerivedCategory.Q.obj V) ≅
      DerivedCategory.Q.obj (((SmoothRep.invariantsFunctor (A := A) U).mapHomologicalComplex
        (ComplexShape.up ℤ)).obj (SmoothRep.injectiveResolution V))) := sorry

/-- Perfect means represented by a bounded complex of finite projective A-modules. -/
def SmoothRep.IsPerfect (V : DerivedCategory (ModuleCat.{u} A)) : Prop :=
  ∃ P : CochainComplex (ModuleCat A) ℤ,
    (∃ a b : ℤ, ∀ n, n < a ∨ b < n → Limits.IsZero (P.X n)) ∧
    (∀ n, Module.Finite A (P.X n) ∧ Module.Projective A (P.X n)) ∧
    Nonempty (DerivedCategory.Q.obj P ≅ V)

/-- Admissibility is tested on the actual derived compact-open invariants. -/
def SmoothRep.IsAdmissibleComplex (V : DerivedCategory (SmoothRep A G)) : Prop :=
  ∀ U : OpenSubgroup G, IsCompact (U : Set G) → HasUnitProOrder A U.toSubgroup →
    SmoothRep.IsPerfect ((SmoothRep.derivedInvariantsUnbounded U.toSubgroup).obj V)

/-- Unbounded module duality, with the Hom-complex model fixed below. -/
def SmoothRep.moduleDerivedDual :
    (DerivedCategory (ModuleCat.{u} A))ᵒᵖ ⥤ DerivedCategory (ModuleCat A) := sorry

/-- On complexes the dual is computed against a K-injective resolution of the scalar module. -/
theorem SmoothRep.moduleDerivedDual_obj (V : CochainComplex (ModuleCat.{u} A) ℤ) :
    ∃ I : CochainComplex (ModuleCat A) ℤ,
      ∃ f : (HomologicalComplex.single (ModuleCat A) (ComplexShape.up ℤ) 0).obj
        (ModuleCat.of A A) ⟶ I,
      QuasiIso f ∧ I.IsKInjective ∧
      ∃ C : CochainComplex (ModuleCat A) ℤ,
        (∀ n, C.X n = ModuleCat.of A (CochainComplex.HomComplex.Cochain V I n)) ∧
        Nonempty (((forget₂ (ModuleCat A) AddCommGrpCat).mapHomologicalComplex
          (ComplexShape.up ℤ)).obj C ≅ CochainComplex.HomComplex V I) ∧
        Nonempty ((SmoothRep.moduleDerivedDual (A := A)).obj
          (Opposite.op (DerivedCategory.Q.obj V)) ≅ DerivedCategory.Q.obj C) := sorry

/-- Derived smooth duality is characterized on the cofinal family of averaging subgroups. -/
def SmoothRep.derivedSmoothDual (hG : HasCofinalUnitProOrder A G) :
    (DerivedCategory (SmoothRep A G))ᵒᵖ ⥤ DerivedCategory (SmoothRep A G) := sorry

theorem SmoothRep.invariants_derivedSmoothDual (hG : HasCofinalUnitProOrder A G)
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup) :
    Nonempty (SmoothRep.derivedSmoothDual hG ⋙ SmoothRep.derivedInvariantsUnbounded U.toSubgroup ≅
      (SmoothRep.derivedInvariantsUnbounded U.toSubgroup).op ⋙ SmoothRep.moduleDerivedDual) := sorry

theorem SmoothRep.derivedSmoothDual_admissible (hG : HasCofinalUnitProOrder A G)
    (V : DerivedCategory (SmoothRep A G)) (hV : SmoothRep.IsAdmissibleComplex V) :
    SmoothRep.IsAdmissibleComplex ((SmoothRep.derivedSmoothDual hG).obj (Opposite.op V)) := sorry

def SmoothRep.derivedBidualMap (hG : HasCofinalUnitProOrder A G)
    (V : DerivedCategory (SmoothRep A G)) :
    V ⟶ (SmoothRep.derivedSmoothDual hG).obj
      (Opposite.op ((SmoothRep.derivedSmoothDual hG).obj (Opposite.op V))) := sorry

/-- The bidual morphism is the evaluation map on every finite projective scalar complex. -/
theorem SmoothRep.derivedBidualMap_iso (hG : HasCofinalUnitProOrder A G)
    (V : DerivedCategory (SmoothRep A G)) (hV : SmoothRep.IsAdmissibleComplex V) :
    IsIso (SmoothRep.derivedBidualMap hG V) := sorry

theorem SmoothRep.derivedSmoothDual_character (hG : HasCofinalUnitProOrder A G)
    (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    let V : SmoothRep A G := ⟨Rep.of (Representation.ofLinearCharacter χ), by sorry⟩
    let W : SmoothRep A G := ⟨Rep.of (Representation.ofLinearCharacter χ⁻¹), by sorry⟩
    Nonempty ((SmoothRep.derivedSmoothDual hG).obj
      (Opposite.op ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj V)) ≅
        (DerivedCategory.singleFunctor (SmoothRep A G) 0).obj W) := sorry
/- Check `SmoothRep.derivedSmoothDual_character`: a free character line dualizes to its inverse. -/
example (hG : HasCofinalUnitProOrder A G) (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    let V : SmoothRep A G := ⟨Rep.of (Representation.ofLinearCharacter χ), by sorry⟩
    let W : SmoothRep A G := ⟨Rep.of (Representation.ofLinearCharacter χ⁻¹), by sorry⟩
    Nonempty ((SmoothRep.derivedSmoothDual hG).obj
      (Opposite.op ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj V)) ≅
        (DerivedCategory.singleFunctor (SmoothRep A G) 0).obj W) := sorry

theorem SmoothRep.derivedSmoothDual_zero (hG : HasCofinalUnitProOrder A G)
    (V : DerivedCategory (SmoothRep A G)) (hV : Limits.IsZero V) :
    Limits.IsZero ((SmoothRep.derivedSmoothDual hG).obj (Opposite.op V)) := sorry
/- Check `SmoothRep.derivedSmoothDual_zero`: zero remains zero. -/
example (hG : HasCofinalUnitProOrder A G) (V : DerivedCategory (SmoothRep A G))
    (hV : Limits.IsZero V) :
    Limits.IsZero ((SmoothRep.derivedSmoothDual hG).obj (Opposite.op V)) := sorry

/- Check `SmoothRep.IsAdmissibleComplex.zero`: zero is perfect at every averaging level. -/
example (V : DerivedCategory (SmoothRep A G)) (hV : Limits.IsZero V) :
    SmoothRep.IsAdmissibleComplex V := sorry

end DerivedDuality

section Unramified
open scoped IsMulCommutative
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- The algebraic subgroup generated by the compact subgroups, without taking a closure. -/
def SmoothRep.compactlyGeneratedSubgroup : Subgroup G :=
  Subgroup.closure {g | ∃ K : Subgroup G, IsCompact (K : Set G) ∧ g ∈ K}

instance SmoothRep.compactlyGeneratedSubgroup_normal :
    (SmoothRep.compactlyGeneratedSubgroup (G := G)).Normal := by sorry

theorem SmoothRep.compactlyGeneratedSubgroup_open [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] :
    IsOpen (SmoothRep.compactlyGeneratedSubgroup (G := G) : Set G) := sorry

abbrev SmoothRep.unramifiedCharacters (A : Type u) [CommRing A] :=
  (G ⧸ SmoothRep.compactlyGeneratedSubgroup) →* Aˣ

def SmoothRep.unramifiedCharacter {A : Type u} [CommRing A]
    (χ : SmoothRep.unramifiedCharacters (G := G) A) : G →* Aˣ :=
  χ.comp (QuotientGroup.mk' _)

theorem SmoothRep.unramifiedCharacters_isSmoothCharacter [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] {A : Type u} [CommRing A]
    (χ : SmoothRep.unramifiedCharacters (G := G) A) :
    IsSmoothCharacter (SmoothRep.unramifiedCharacter χ) := sorry

/-- The universal character takes a coset to its group-algebra basis unit. -/
def SmoothRep.tautologicalUnramifiedCharacter (A : Type u) [CommRing A] :
    G →* (MonoidAlgebra A (G ⧸ SmoothRep.compactlyGeneratedSubgroup))ˣ where
  toFun g :=
    { val := MonoidAlgebra.single (QuotientGroup.mk g) 1
      inv := MonoidAlgebra.single (QuotientGroup.mk g⁻¹) 1
      val_inv := by sorry
      inv_val := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

/-- The universal twist before parabolic induction. -/
abbrev SmoothRep.unramifiedTwist {A : Type u} [CommRing A]
    [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    [IsMulCommutative (G ⧸ SmoothRep.compactlyGeneratedSubgroup)] (V : SmoothRep A G) :
    SmoothRep (MonoidAlgebra A (G ⧸ SmoothRep.compactlyGeneratedSubgroup)) G :=
  let B := MonoidAlgebra A (G ⧸ SmoothRep.compactlyGeneratedSubgroup)
  ⟨Rep.of (Representation.twist (_root_.Representation.baseChange B V.obj.ρ)
    (SmoothRep.tautologicalUnramifiedCharacter A)), by sorry⟩

theorem SmoothRep.unramifiedTwist_apply {A : Type u} [CommRing A]
    [IsMulCommutative (G ⧸ SmoothRep.compactlyGeneratedSubgroup)]
    [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (V : SmoothRep A G) (g : G) (b : MonoidAlgebra A (G ⧸ SmoothRep.compactlyGeneratedSubgroup))
    (v : V.obj.V) :
    (SmoothRep.unramifiedTwist V).obj.ρ g (b ⊗ₜ[A] v) =
      (MonoidAlgebra.single (QuotientGroup.mk g) 1 * b) ⊗ₜ[A] (V.obj.ρ g v) := sorry

/-- Universal unramified induction, with the original half modulus extended to the group algebra. -/
def SmoothRep.universalUnramifiedTwist {A : Type u} [CommRing A]
    (L : LeviDecomposition (G := G)) [LocallyCompactSpace L.M]
    [TotallyDisconnectedSpace L.M] [T2Space L.M]
    [IsMulCommutative (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)]
    (δhalf : L.P →* Aˣ) (hδ : IsSmoothCharacter δhalf) (V : SmoothRep A L.M) :
    SmoothRep (MonoidAlgebra A (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)) G :=
  let B := MonoidAlgebra A (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)
  SmoothRep.parabolicInd L ((Units.map (algebraMap A B).toMonoidHom).comp δhalf)
    (by sorry) (SmoothRep.unramifiedTwist V)

end Unramified

theorem SmoothRep.unramifiedCharacters_gl1 (p : ℕ) [Fact p.Prime] :
    ∃ e : SmoothRep.unramifiedCharacters (G := ℚ_[p]ˣ) ℂ ≃* ℂˣ,
      ∀ χ, e χ = SmoothRep.unramifiedCharacter χ (Units.mk0 (p : ℚ_[p]) (by sorry)) := sorry
/- Check `SmoothRep.unramifiedCharacters_gl1`: the valuation generator determines the character. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ e : SmoothRep.unramifiedCharacters (G := ℚ_[p]ˣ) ℂ ≃* ℂˣ,
      ∀ χ, e χ = SmoothRep.unramifiedCharacter χ (Units.mk0 (p : ℚ_[p]) (by sorry)) := sorry

theorem SmoothRep.unramifiedCharacters_sl2 (p : ℕ) [Fact p.Prime] :
    SmoothRep.compactlyGeneratedSubgroup (G := Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) = ⊤ ∧
      Subsingleton (SmoothRep.unramifiedCharacters (G := Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) ℂ) := sorry
/- Check `SmoothRep.unramifiedCharacters_sl2`: compact subgroups generate the split simply connected group. -/
example (p : ℕ) [Fact p.Prime] :
    SmoothRep.compactlyGeneratedSubgroup (G := Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) = ⊤ ∧
      Subsingleton (SmoothRep.unramifiedCharacters (G := Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) ℂ) := sorry

theorem SmoothRep.not_unramified_ramified (p : ℕ) [Fact p.Prime]
    (χ : ℚ_[p]ˣ →* ℂˣ) (hχ : IsSmoothCharacter χ)
    (x : ℚ_[p]ˣ) (hx : ‖(x : ℚ_[p])‖ = 1) (h : χ x ≠ 1) :
    ¬ ∃ ψ : SmoothRep.unramifiedCharacters (G := ℚ_[p]ˣ) ℂ,
      SmoothRep.unramifiedCharacter ψ = χ := sorry
/- Check `SmoothRep.not_unramified_ramified`: a nontrivial unit value excludes factorization through the lattice. -/
example (p : ℕ) [Fact p.Prime] (χ : ℚ_[p]ˣ →* ℂˣ) (hχ : IsSmoothCharacter χ)
    (x : ℚ_[p]ˣ) (hx : ‖(x : ℚ_[p])‖ = 1) (h : χ x ≠ 1) :
    ¬ ∃ ψ : SmoothRep.unramifiedCharacters (G := ℚ_[p]ˣ) ℂ,
      SmoothRep.unramifiedCharacter ψ = χ := sorry

section Steinberg
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Pullback along B\G → Q\G, in the equivariant function model. -/
def SmoothRep.indTrivialInclusion (B Q : Subgroup G) (hBQ : B ≤ Q) :
    (Representation.ind Q (Representation.trivial A Q A)).toSubmodule →ₗ[A]
      (Representation.ind B (Representation.trivial A B A)).toSubmodule where
  toFun f := ⟨⟨f.val.val, by sorry⟩, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- The sum of pullbacks from the specified parabolics strictly larger than B. -/
def SmoothRep.steinbergRelations (B : Subgroup G) (parabolics : Set (Subgroup G)) :
    Subrepresentation (Representation.ind B (Representation.trivial A B A)).toRepresentation where
  toSubmodule := ⨆ Q : {Q : Subgroup G // Q ∈ parabolics ∧ B < Q},
    LinearMap.range (SmoothRep.indTrivialInclusion (A := A) B Q.val Q.property.2.le)
  apply_mem_toSubmodule := by sorry

/-- The unnormalized minimal-parabolic induction modulo larger-parabolic pullbacks.
The parabolic family is explicit, so this definition also applies to relative rank zero. -/
abbrev SmoothRep.steinberg (B : Subgroup G) (parabolics : Set (Subgroup G)) : SmoothRep A G :=
  let ρ := (Representation.ind B (Representation.trivial A B A)).toRepresentation
  let S := SmoothRep.steinbergRelations (A := A) B parabolics
  ⟨Rep.of
    (ρ.quotient (V := (Representation.ind B (Representation.trivial A B A)).toSubmodule) S.toSubmodule (fun g => S.apply_mem_toSubmodule g)), by sorry⟩

/-- The quotient map pins the construction to the function model. -/
theorem SmoothRep.steinberg_quotient (B : Subgroup G) (parabolics : Set (Subgroup G)) :
    let S := SmoothRep.steinbergRelations (A := A) B parabolics
    Function.Surjective (Submodule.mkQ (R := A) (M := (Representation.ind B (Representation.trivial A B A)).toSubmodule) S.toSubmodule) ∧ LinearMap.ker (Submodule.mkQ (R := A) (M := (Representation.ind B (Representation.trivial A B A)).toSubmodule) S.toSubmodule) = S.toSubmodule := sorry

theorem SmoothRep.steinberg_torus :
    Nonempty (SmoothRep.steinberg (A := A) (⊤ : Subgroup G) {⊤} ≅
      SmoothRep.trivial (ModuleCat.of A A)) := sorry
/- Check `SmoothRep.steinberg_torus`: with no larger parabolic the quotient is the trivial line. -/
example : Nonempty (SmoothRep.steinberg (A := A) (⊤ : Subgroup G) {⊤} ≅
    SmoothRep.trivial (ModuleCat.of A A)) := sorry

end Steinberg

theorem SmoothRep.steinberg_gl2_exact (p : ℕ) [Fact p.Prime] {A : Type} [CommRing A] :
    let B := PadicGL2.borel p
    let c := SmoothRep.indTrivialInclusion (A := A) B ⊤ le_top
    let S := SmoothRep.steinbergRelations (A := A) B {B, ⊤}
    Function.Injective c ∧ Function.Exact c (Submodule.mkQ (R := A) (M := (Representation.ind B (Representation.trivial A B A)).toSubmodule) S.toSubmodule) ∧
      Function.Surjective (Submodule.mkQ (R := A) (M := (Representation.ind B (Representation.trivial A B A)).toSubmodule) S.toSubmodule) := sorry
/- Check `SmoothRep.steinberg_gl2_exact`: constants are exactly the kernel of the quotient. -/
example (p : ℕ) [Fact p.Prime] {A : Type} [CommRing A] :
    let B := PadicGL2.borel p
    let c := SmoothRep.indTrivialInclusion (A := A) B ⊤ le_top
    let S := SmoothRep.steinbergRelations (A := A) B {B, ⊤}
    Function.Injective c ∧ Function.Exact c (Submodule.mkQ (R := A) (M := (Representation.ind B (Representation.trivial A B A)).toSubmodule) S.toSubmodule) ∧
      Function.Surjective (Submodule.mkQ (R := A) (M := (Representation.ind B (Representation.trivial A B A)).toSubmodule) S.toSubmodule) := sorry

theorem SmoothRep.steinberg_ne_trivial (p : ℕ) [Fact p.Prime] :
    ¬ Nonempty (SmoothRep.steinberg (A := ℂ) (PadicGL2.borel p) {PadicGL2.borel p, ⊤} ≅
      SmoothRep.trivial (ModuleCat.of ℂ ℂ)) := sorry
/- Check `SmoothRep.steinberg_ne_trivial`: the rank-one quotient is not the constants it kills. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ Nonempty (SmoothRep.steinberg (A := ℂ) (PadicGL2.borel p) {PadicGL2.borel p, ⊤} ≅
      SmoothRep.trivial (ModuleCat.of ℂ ℂ)) := sorry

section MatrixCoefficients
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Evaluation against the smooth contragredient, with the original action convention. -/
def SmoothRep.matrixCoefficient (V : SmoothRep ℂ G) (v : V.obj.V)
    (ℓ : (Representation.smoothDual V.obj.ρ).toSubmodule) (g : G) : ℂ := ℓ.val (V.obj.ρ g v)

/-- The centre acts by a specified unitary character. -/
def SmoothRep.HasUnitaryCentralCharacter (V : SmoothRep ℂ G) : Prop :=
  ∃ ω : Subgroup.center G →* ℂˣ,
    (∀ z, ‖(ω z : ℂ)‖ = 1) ∧ ∀ z v, V.obj.ρ z.val v = (ω z : ℂ) • v

/-- Square integrability of every smooth matrix coefficient modulo the centre. -/
def SmoothRep.IsSquareIntegrable [LocallyCompactSpace (G ⧸ Subgroup.center G)]
    (V : SmoothRep ℂ G) : Prop :=
  letI : MeasurableSpace (G ⧸ Subgroup.center G) := borel _
  letI : BorelSpace (G ⧸ Subgroup.center G) := ⟨rfl⟩
  Representation.IsAdmissible V.obj.ρ ∧ SmoothRep.HasUnitaryCentralCharacter V ∧
    ∀ v ℓ, MeasureTheory.Integrable
      (fun x : G ⧸ Subgroup.center G => ‖SmoothRep.matrixCoefficient V v ℓ x.out‖ ^ 2)
      MeasureTheory.Measure.haar

/-- Unitarity of the central character makes the norm independent of the quotient representative. -/
theorem SmoothRep.matrixCoefficient_norm_center (V : SmoothRep ℂ G)
    (hV : SmoothRep.HasUnitaryCentralCharacter V) (v : V.obj.V)
    (ℓ : (Representation.smoothDual V.obj.ρ).toSubmodule) (g : G) (z : Subgroup.center G) :
    ‖SmoothRep.matrixCoefficient V v ℓ (g * z.val)‖ = ‖SmoothRep.matrixCoefficient V v ℓ g‖ := sorry

/-- Generalized central weight characters, using powers of the actual action operators. -/
def SmoothRep.centralExponents (V : SmoothRep ℂ G) (C : Subgroup G) : Set (C →* ℂˣ) :=
  {χ | ∃ v : V.obj.V, v ≠ 0 ∧ ∀ c : C, ∃ n : ℕ, 0 < n ∧
    (((V.obj.ρ c.val - (χ c : ℂ) • LinearMap.id : Module.End ℂ V.obj.V) ^ n) v) = 0}

end MatrixCoefficients

instance PadicGL2.locallyCompactModuloCenter (p : ℕ) [Fact p.Prime] :
    LocallyCompactSpace (PadicGL2.Group p ⧸ Subgroup.center (PadicGL2.Group p)) := by sorry

theorem SmoothRep.isSquareIntegrable_steinberg_gl2 (p : ℕ) [Fact p.Prime] :
    SmoothRep.IsSquareIntegrable
      (SmoothRep.steinberg (A := ℂ) (PadicGL2.borel p) {PadicGL2.borel p, ⊤}) := sorry
/- Check `SmoothRep.isSquareIntegrable_steinberg_gl2`: Steinberg coefficients are integrable modulo scalars. -/
example (p : ℕ) [Fact p.Prime] :
    SmoothRep.IsSquareIntegrable
      (SmoothRep.steinberg (A := ℂ) (PadicGL2.borel p) {PadicGL2.borel p, ⊤}) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.IsSquareIntegrable.nonunitary_torus (χ : ℚˣ →* ℂˣ) (x : ℚˣ) (hx : ‖(χ x : ℂ)‖ ≠ 1) :
    letI : TopologicalSpace ℚˣ := ⊥
    letI : DiscreteTopology ℚˣ := ⟨rfl⟩
    ¬ SmoothRep.IsSquareIntegrable
      (⟨Rep.of (Representation.ofLinearCharacter χ), by sorry⟩ : SmoothRep ℂ ℚˣ) := sorry

/- Check `SmoothRep.IsSquareIntegrable.nonunitary_torus`: quotienting by the centre does not remove unitarity. -/
example (χ : ℚˣ →* ℂˣ) (x : ℚˣ) (hx : ‖(χ x : ℂ)‖ ≠ 1) :
    letI : TopologicalSpace ℚˣ := ⊥
    letI : DiscreteTopology ℚˣ := ⟨rfl⟩
    ¬ SmoothRep.IsSquareIntegrable
      (⟨Rep.of (Representation.ofLinearCharacter χ), by sorry⟩ : SmoothRep ℂ ℚˣ) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.IsSquareIntegrable.unitary_torus (χ : ℚˣ →* ℂˣ) (hχ : ∀ x, ‖(χ x : ℂ)‖ = 1) :
    letI : TopologicalSpace ℚˣ := ⊥
    letI : DiscreteTopology ℚˣ := ⟨rfl⟩
    SmoothRep.IsSquareIntegrable
      (⟨Rep.of (Representation.ofLinearCharacter χ), by sorry⟩ : SmoothRep ℂ ℚˣ) := sorry

/- Check `SmoothRep.IsSquareIntegrable.unitary_torus`: a unitary line on a torus passes the central test. -/
example (χ : ℚˣ →* ℂˣ) (hχ : ∀ x, ‖(χ x : ℂ)‖ = 1) :
    letI : TopologicalSpace ℚˣ := ⊥
    letI : DiscreteTopology ℚˣ := ⟨rfl⟩
    SmoothRep.IsSquareIntegrable
      (⟨Rep.of (Representation.ofLinearCharacter χ), by sorry⟩ : SmoothRep ℂ ℚˣ) := sorry

/-- Pointwise additive structure on compactly supported locally constant functions. -/
instance LocallyConstantCompact.instAddCommGroup {X W : Type u} [TopologicalSpace X]
    [AddCommGroup W] : AddCommGroup (LocallyConstantCompact X W) := by sorry
instance LocallyConstantCompact.instModule {A X W : Type u} [CommRing A] [TopologicalSpace X]
    [AddCommGroup W] [Module A W] : Module A (LocallyConstantCompact X W) := by sorry

theorem LocallyConstantCompact.add_apply {X W : Type u} [TopologicalSpace X] [AddCommGroup W]
    (f g : LocallyConstantCompact X W) (x : X) : (f + g).toFun x = f.toFun x + g.toFun x := sorry
theorem LocallyConstantCompact.smul_apply {A X W : Type u} [CommRing A] [TopologicalSpace X]
    [AddCommGroup W] [Module A W] (a : A) (f : LocallyConstantCompact X W) (x : X) :
    (a • f).toFun x = a • f.toFun x := sorry
theorem LocallyConstantCompact.zero_apply {X W : Type u} [TopologicalSpace X] [AddCommGroup W]
    (x : X) : (0 : LocallyConstantCompact X W).toFun x = 0 := sorry

section InductionSheaf
variable {A G W : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [AddCommGroup W] [Module A W]

/-- Inversion identifies left cosets with Mathlib's right-coset quotient. -/
def leftCosetMap (H : Subgroup G) (g : G) : G ⧸ H := QuotientGroup.mk g⁻¹

/-- Sections are locally constant equivariant functions on the inverse image of the base subset. -/
def InductionSections (H : Subgroup G) (σ : Representation A H W) (U : Set (G ⧸ H)) :
    Submodule A (((leftCosetMap H) ⁻¹' U) → W) where
  carrier := {f | IsLocallyConstant f ∧ ∀ (h : H) (g : G) (hg : leftCosetMap H g ∈ U),
    f ⟨h.val * g, by sorry⟩ = σ h (f ⟨g, hg⟩)}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Compact support is measured on the quotient, not on G. -/
def InductionCompactSections (H : Subgroup G) (σ : Representation A H W)
    (U : Set (G ⧸ H)) : Submodule A (InductionSections H σ U) where
  carrier := {f | ∃ C : Set U, IsCompact C ∧ ∀ g : (leftCosetMap H) ⁻¹' U,
    f.val g ≠ 0 → (⟨leftCosetMap H g.val, g.property⟩ : U) ∈ C}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- The restriction maps are literal restriction of equivariant functions. -/
def SmoothRep.indPresheaf (H : Subgroup G) (σ : Representation A H W) :
    TopCat.Presheaf (ModuleCat A) (TopCat.of (G ⧸ H)) where
  obj U := ModuleCat.of A (InductionSections H σ (U.unop : Set (G ⧸ H)))
  map {U V} i := ModuleCat.ofHom
    { toFun := fun f => ⟨fun g => f.val ⟨g.val, by sorry⟩, by sorry⟩
      map_add' := by sorry
      map_smul' := by sorry }
  map_id := by sorry
  map_comp := by sorry

/-- The induction sheaf on H\G, using inversion only for the quotient carrier. -/
def SmoothRep.indSheaf (H : Subgroup G) (σ : Representation A H W) :
    TopCat.Sheaf (ModuleCat A) (TopCat.of (G ⧸ H)) :=
  ⟨SmoothRep.indPresheaf H σ, by sorry⟩

omit [IsTopologicalGroup G] in
theorem SmoothRep.indSheaf_restrict (H : Subgroup G) (σ : Representation A H W)
    (U V : TopologicalSpace.Opens (G ⧸ H)) (h : V ≤ U)
    (f : InductionSections H σ (U : Set (G ⧸ H)))
    (g : (leftCosetMap H) ⁻¹' (V : Set (G ⧸ H))) :
    (((SmoothRep.indPresheaf H σ).map (homOfLE h).op).hom f).val g =
      f.val ⟨g.val, h g.property⟩ := rfl

/-- Global sections carry right translation, before taking smooth vectors. -/
def SmoothRep.indSectionAction (H : Subgroup G) (σ : Representation A H W) :
    Representation A G (InductionSections H σ Set.univ) where
  toFun g :=
    { toFun := fun f => ⟨fun x => f.val ⟨x.val * g, Set.mem_univ _⟩, by sorry⟩
      map_add' := by sorry
      map_smul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

theorem SmoothRep.ind_equiv_sections [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (H : Subgroup G) (hH : IsClosed (H : Set G))
    (σ : Representation A H W) (hσ : Representation.IsSmooth σ) :
    (∃ e : (Representation.ind H σ).toSubmodule ≃ₗ[A]
      (Representation.smoothVectors (SmoothRep.indSectionAction H σ)).toSubmodule,
      ∀ f g, (e f).val.val ⟨g, Set.mem_univ _⟩ = f.val.val g) ∧
    (∃ e : (Representation.cInd H σ).toSubmodule ≃ₗ[A]
      InductionCompactSections H σ Set.univ,
      ∀ f g, (e f).val.val ⟨g, Set.mem_univ _⟩ = f.val.val g) := sorry

/-- Extension by zero for compact sections of an open subset. -/
def SmoothRep.indExtendZero [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (H : Subgroup G) (hH : IsClosed (H : Set G)) (σ : Representation A H W)
    (U : TopologicalSpace.Opens (G ⧸ H)) :
    InductionCompactSections H σ (U : Set (G ⧸ H)) →ₗ[A]
      InductionCompactSections H σ Set.univ where
  toFun f := ⟨⟨fun g => if h : leftCosetMap H g.val ∈ U then f.val.val ⟨g.val, h⟩ else 0,
    by sorry⟩, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- Restriction to a closed subset preserves compact support. -/
def SmoothRep.indRestrictClosed (H : Subgroup G) (σ : Representation A H W)
    (Z : Set (G ⧸ H)) (hZ : IsClosed Z) :
    InductionCompactSections H σ Set.univ →ₗ[A] InductionCompactSections H σ Z where
  toFun f := ⟨⟨fun g => f.val.val ⟨g.val, Set.mem_univ _⟩, by sorry⟩, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

theorem SmoothRep.cInd_shortExact_open [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (H : Subgroup G) (hH : IsClosed (H : Set G))
    (σ : Representation A H W) (hσ : Representation.IsSmooth σ)
    (U : TopologicalSpace.Opens (G ⧸ H)) :
    let i := SmoothRep.indExtendZero H hH σ U
    let r := SmoothRep.indRestrictClosed H σ (U : Set (G ⧸ H))ᶜ U.isOpen.isClosed_compl
    Function.Injective i ∧ Function.Exact i r ∧ Function.Surjective r := sorry

theorem SmoothRep.indSheaf_point (σ : Representation A (⊤ : Subgroup G) W)
    (hσ : Representation.IsSmooth σ) :
    ∃ e : InductionCompactSections ⊤ σ Set.univ ≃ₗ[A] W,
      ∀ f, e f = f.val.val ⟨1, Set.mem_univ _⟩ := sorry
/- Check `SmoothRep.indSheaf_point`: equivariance makes evaluation at one a complete section. -/
example (σ : Representation A (⊤ : Subgroup G) W) (hσ : Representation.IsSmooth σ) :
    ∃ e : InductionCompactSections ⊤ σ Set.univ ≃ₗ[A] W,
      ∀ f, e f = f.val.val ⟨1, Set.mem_univ _⟩ := sorry

theorem SmoothRep.indSheaf_trivial_subgroup [T2Space G] :
    ∃ e : InductionCompactSections (⊥ : Subgroup G)
      (Representation.trivial A (⊥ : Subgroup G) W) Set.univ ≃ₗ[A] LocallyConstantCompact G W,
      ∀ f g, (e f).toFun g = f.val.val ⟨g, Set.mem_univ _⟩ := sorry
/- Check `SmoothRep.indSheaf_trivial_subgroup`: compact sections are precisely compactly supported functions. -/
example [T2Space G] :
    ∃ e : InductionCompactSections (⊥ : Subgroup G)
      (Representation.trivial A (⊥ : Subgroup G) W) Set.univ ≃ₗ[A] LocallyConstantCompact G W,
      ∀ f g, (e f).toFun g = f.val.val ⟨g, Set.mem_univ _⟩ := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.indSheaf_empty (H : Subgroup G) (σ : Representation A H W) :
    Subsingleton (InductionSections H σ ∅) := sorry

/- Check `SmoothRep.indSheaf_empty`: no nonzero section exists over the empty open. -/
example (H : Subgroup G) (σ : Representation A H W) :
    Subsingleton (InductionSections H σ ∅) := sorry
end InductionSheaf

section ElementaryAPI
variable {A G V : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [AddCommGroup V] [Module A V]

omit [TopologicalSpace G] [IsTopologicalGroup G] in
theorem Representation.fg_iff_module_finite (ρ : Representation A G V) :
    Representation.IsFinitelyGenerated ρ ↔ Module.Finite (MonoidAlgebra A G) ρ.asModule := Iff.rfl

theorem Representation.IsAdmissible.subrepresentation [IsNoetherianRing A]
    (ρ : Representation A G V) (hρ : Representation.IsAdmissible ρ) (S : Subrepresentation ρ) :
    Representation.IsAdmissible S.toRepresentation := sorry

theorem Representation.IsAdmissible.quotient
    (ρ : Representation A G V) (hρ : Representation.IsAdmissible ρ) (S : Subrepresentation ρ)
    (hu : ∀ U : OpenSubgroup G, IsCompact (U : Set G) → HasUnitProOrder A U.toSubgroup) :
    Representation.IsAdmissible (ρ.quotient S.toSubmodule S.apply_mem_toSubmodule) := sorry

theorem Representation.IsAdmissible.isLocallyAdmissible [IsNoetherianRing A]
    (ρ : Representation A G V) (hρ : Representation.IsAdmissible ρ) :
    Representation.IsLocallyAdmissible ρ := sorry

theorem Representation.isAdmissible_of_fg_of_locallyAdmissible [IsNoetherianRing A]
    (ρ : Representation A G V) (hs : Representation.IsSmooth ρ)
    (hfg : Representation.IsFinitelyGenerated ρ) (hla : Representation.IsLocallyAdmissible ρ)
    (hu : ∀ U : OpenSubgroup G, IsCompact (U : Set G) → HasUnitProOrder A U.toSubgroup) :
    Representation.IsAdmissible ρ := sorry

/-- The smooth line associated with an open-kernel character. -/
abbrev SmoothRep.ofCharacter (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) : SmoothRep A G :=
  ⟨Rep.of (Representation.ofLinearCharacter χ), by sorry⟩

/-- Transpose on the smooth dual, with the contravariant direction made explicit. -/
def SmoothRep.smoothDualFunctor : SmoothRep A G ⥤ (SmoothRep A G)ᵒᵖ where
  obj X := Opposite.op (SmoothRep.smoothDual X)
  map f := Quiver.Hom.op (ObjectProperty.homMk (Rep.ofHom
    { toLinearMap :=
        { toFun := fun ℓ => ⟨ℓ.val.comp f.hom.hom.toLinearMap, by sorry⟩
          map_add' := by sorry
          map_smul' := by sorry }
      isIntertwining' := by sorry }))
  map_id := by sorry
  map_comp := by sorry

theorem SmoothRep.homSmoothDualEquiv (X Y : SmoothRep A G) :
    ∃ e : (X ⟶ SmoothRep.smoothDual Y) ≃ₗ[A] (Y ⟶ SmoothRep.smoothDual X),
      ∀ f x y, ((e f).hom.hom y).val x = (f.hom.hom x).val y := sorry

theorem SmoothRep.smoothDual_zero (X : SmoothRep A G) [Subsingleton X.obj.V] :
    Subsingleton (SmoothRep.smoothDual X).obj.V := sorry

/-- The fixed-vector dual is obtained by composing a functional with averaging. -/
theorem SmoothRep.smoothDual_invariants (X : SmoothRep A G) (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup) :
    Nonempty (SmoothRep.invariants U.toSubgroup (SmoothRep.smoothDual X) ≃ₗ[A]
      Module.Dual A (SmoothRep.invariants U.toSubgroup X)) := sorry

end ElementaryAPI

section CoefficientFunctor
variable {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B]
  [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

def SmoothRep.baseChange : SmoothRep A G ⥤ SmoothRep B G where
  obj X := ⟨Rep.of (_root_.Representation.baseChange B X.obj.ρ),
    Representation.isSmooth_baseChange X.obj.ρ B X.property⟩
  map f := ObjectProperty.homMk (Rep.ofHom
    { toLinearMap := LinearMap.baseChange B f.hom.hom.toLinearMap
      isIntertwining' := by sorry })
  map_id := by sorry
  map_comp := by sorry

def SmoothRep.restrictScalars : SmoothRep B G ⥤ SmoothRep A G where
  obj X :=
    letI : Module A X.obj.V := Module.compHom X.obj.V (algebraMap A B)
    ⟨Rep.of (X := X.obj.V)
      { toFun g :=
          { toFun := X.obj.ρ g
            map_add' := by sorry
            map_smul' := by sorry }
        map_one' := by sorry
        map_mul' := by sorry }, by sorry⟩
  map {X Y} f :=
    letI : Module A X.obj.V := Module.compHom X.obj.V (algebraMap A B)
    letI : Module A Y.obj.V := Module.compHom Y.obj.V (algebraMap A B)
    ObjectProperty.homMk (Rep.ofHom
    { toLinearMap :=
        { toFun := f.hom.hom
          map_add' := by sorry
          map_smul' := by sorry }
      isIntertwining' := by sorry })
  map_id := by sorry
  map_comp := by sorry

def SmoothRep.baseChangeAdjunction : SmoothRep.baseChange (A := A) (B := B) (G := G) ⊣
    SmoothRep.restrictScalars := sorry

theorem SmoothRep.baseChangeAdjunction_unit (X : SmoothRep A G) (x : X.obj.V) :
    ((SmoothRep.baseChangeAdjunction (B := B)).unit.app X).hom.hom x = (1 : B) ⊗ₜ[A] x := sorry

def SmoothRep.baseChangeInvariants (U : Subgroup G) (X : SmoothRep A G) :
    B ⊗[A] SmoothRep.invariants U X →ₗ[B]
      SmoothRep.invariants U ((SmoothRep.baseChange (B := B)).obj X) :=
  { toFun := fun x => ⟨(LinearMap.baseChange B (Submodule.subtype _)) x, by sorry⟩
    map_add' := by sorry
    map_smul' := by sorry }

theorem SmoothRep.baseChangeInvariants_tmul (U : Subgroup G) (X : SmoothRep A G)
    (b : B) (v : SmoothRep.invariants U X) :
    (SmoothRep.baseChangeInvariants U X (b ⊗ₜ[A] v)).val = b ⊗ₜ[A] v.val := sorry

theorem SmoothRep.baseChangeInvariants_bijective_of_flat [Module.Flat A B]
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) (X : SmoothRep A G) :
    Function.Bijective (SmoothRep.baseChangeInvariants (B := B) U.toSubgroup X) := sorry

theorem SmoothRep.baseChangeInvariants_bijective_of_unit (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup) (X : SmoothRep A G) :
    Function.Bijective (SmoothRep.baseChangeInvariants (B := B) U.toSubgroup X) := sorry

end CoefficientFunctor

/-! ## Unnormalized derivatives in the matrix and twisted-coinvariant models -/
namespace BZDerivative
variable {F : Type u} {A : Type v} {V : Type w} [Field F] [CommRing A] [AddCommGroup V] [Module A V]

/-- The mirabolic subgroup has last row (0,…,0,1). -/
def mirabolic (n : ℕ) : Subgroup (GL (Fin (n + 1)) F) where
  carrier := {g | ∀ j, g.val (Fin.last n) j = if j = Fin.last n then 1 else 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The unipotent subgroup for the r-th derivative, including the last r upper-root groups. -/
def unipotent (n r : ℕ) : Subgroup (GL (Fin n) F) where
  carrier := {g | ∀ i j, j.val < n - r ∨ j.val ≤ i.val →
    g.val i j = if i = j then 1 else 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The character uses only the superdiagonal in the last r-by-r block.
The preceding last-column quotient is untwisted, as in Ψ⁻(Φ⁻)^{r−1}. -/
def character (n r : ℕ) (ψ : Multiplicative F →* Aˣ) : unipotent (F := F) n r →* Aˣ where
  toFun g := ψ (Multiplicative.ofAdd (∑ i : Fin n,
    if n - r ≤ i.val then
      if h : i.val + 1 < n then g.val.val i ⟨i.val + 1, h⟩ else 0 else 0))
  map_one' := by sorry
  map_mul' := by sorry

/-- The derivative module is the explicit twisted relation quotient. -/
abbrev module (n r : ℕ) (ψ : Multiplicative F →* Aˣ) (ρ : Representation A (GL (Fin n) F) V) :=
  WhittakerCoinvariants (ρ.comp (unipotent n r).subtype) (character n r ψ)

/-- Block diagonal embedding of the surviving general linear group. -/
def remainingBlock (n r : ℕ) : GL (Fin (n - r)) F →* GL (Fin n) F where
  toFun g :=
    { val := fun i j => if hi : i.val < n - r then
        if hj : j.val < n - r then g.val ⟨i.val, hi⟩ ⟨j.val, hj⟩ else 0
        else if i = j then 1 else 0
      inv := fun i j => if hi : i.val < n - r then
        if hj : j.val < n - r then g.inv ⟨i.val, hi⟩ ⟨j.val, hj⟩ else 0
        else if i = j then 1 else 0
      val_inv := by sorry
      inv_val := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

/-- The remaining block normalizes the relation submodule. -/
def action (n r : ℕ) (ψ : Multiplicative F →* Aˣ) (ρ : Representation A (GL (Fin n) F) V) :
    Representation A (GL (Fin (n - r)) F) (module n r ψ ρ) := sorry

theorem action_mk (n r : ℕ) (ψ : Multiplicative F →* Aˣ)
    (ρ : Representation A (GL (Fin n) F) V) (g : GL (Fin (n - r)) F) (v : V) :
    action n r ψ ρ g (WhittakerCoinvariants.mk _ _ v) =
      WhittakerCoinvariants.mk _ _ (ρ (remainingBlock n r g) v) := sorry

theorem zero (n : ℕ) (ψ : Multiplicative F →* Aˣ) (ρ : Representation A (GL (Fin n) F) V) :
    ∃ e : module n 0 ψ ρ ≃ₗ[A] V,
      ∀ v, e (WhittakerCoinvariants.mk _ _ v) = v := sorry

theorem top (n : ℕ) (ψ : Multiplicative F →* Aˣ) (ρ : Representation A (GL (Fin n) F) V) :
    module n n ψ ρ = WhittakerCoinvariants (ρ.comp (unipotent n n).subtype) (character n n ψ) := rfl

theorem baseChange {B : Type u} [CommRing B] [Algebra A B] (n r : ℕ)
    (ψ : Multiplicative F →* Aˣ) (ρ : Representation A (GL (Fin n) F) V) :
    ∃ e : B ⊗[A] module n r ψ ρ ≃ₗ[B]
      module n r ((Units.map (algebraMap A B).toMonoidHom).comp ψ)
        (_root_.Representation.baseChange B ρ),
      ∀ b v, e (b ⊗ₜ[A] WhittakerCoinvariants.mk _ _ v) =
        WhittakerCoinvariants.mk _ _ (b ⊗ₜ[A] v) := sorry

theorem rankOne (ψ : Multiplicative F →* Aˣ) (ρ : Representation A (GL (Fin 1) F) V) :
    ∃ e : module 1 1 ψ ρ ≃ₗ[A] V,
      ∀ v, e (WhittakerCoinvariants.mk _ _ v) = v := sorry
/- Check `BZDerivative.rankOne`: no unipotent relation remains in rank one. -/
example (ψ : Multiplicative F →* Aˣ) (ρ : Representation A (GL (Fin 1) F) V) :
    ∃ e : module 1 1 ψ ρ ≃ₗ[A] V,
      ∀ v, e (WhittakerCoinvariants.mk _ _ v) = v := sorry

theorem trivialRep (n : ℕ) (hn : 2 ≤ n) (ψ : Multiplicative F →* Aˣ)
    (hψ : ∃ x, IsUnit ((ψ x : A) - 1)) :
    Subsingleton (module n n ψ (Representation.trivial A (GL (Fin n) F) V)) := sorry
/- Check `BZDerivative.trivialRep`: a unit-valued nontrivial relation kills the trivial action. -/
example (n : ℕ) (hn : 2 ≤ n) (ψ : Multiplicative F →* Aˣ)
    (hψ : ∃ x, IsUnit ((ψ x : A) - 1)) :
    Subsingleton (module n n ψ (Representation.trivial A (GL (Fin n) F) V)) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.BZDerivative.character_trivial (n r : ℕ) :
    Nonempty (module n r (1 : Multiplicative F →* Aˣ)
      (Representation.trivial A (GL (Fin n) F) V) ≃ₗ[A] V) := sorry

/- Check `BZDerivative.character_trivial`: without the generic character, a trivial action survives. -/
example (n r : ℕ) :
    Nonempty (module n r (1 : Multiplicative F →* Aˣ)
      (Representation.trivial A (GL (Fin n) F) V) ≃ₗ[A] V) := sorry

end BZDerivative

section FunctionAndMeasureAPI
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

def LocallyConstantCompact.coeFn {X M : Type u} [TopologicalSpace X] [Zero M]
    (f : LocallyConstantCompact X M) : X → M := f.toFun

theorem LocallyConstantCompact.ext {X M : Type u} [TopologicalSpace X] [Zero M]
    (f g : LocallyConstantCompact X M) (h : ∀ x, f.toFun x = g.toFun x) : f = g := sorry

/-- Bundle a compact open subgroup as a compact open subset. -/
def compactOpenSet (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) :
    TopologicalSpace.CompactOpens G := ⟨⟨U, hc⟩, U.isOpen⟩

/-- Existence of normalized ring-valued Haar volume at an averaging subgroup. -/
def HaarMeasureWithValues.normalized (U₀ : OpenSubgroup G) (hc : IsCompact (U₀ : Set G))
    (hu : HasUnitProOrder A U₀.toSubgroup) : HaarMeasureWithValues G A := sorry

theorem HaarMeasureWithValues.normalized_vol (U₀ : OpenSubgroup G) (hc : IsCompact (U₀ : Set G))
    (hu : HasUnitProOrder A U₀.toSubgroup) :
    (HaarMeasureWithValues.normalized U₀ hc hu).vol (compactOpenSet U₀ hc) = 1 := sorry

theorem HaarMeasureWithValues.ext (μ ν : HaarMeasureWithValues G A)
    (U₀ : OpenSubgroup G) (hc : IsCompact (U₀ : Set G)) (hu : HasUnitProOrder A U₀.toSubgroup)
    (h : μ.vol (compactOpenSet U₀ hc) = ν.vol (compactOpenSet U₀ hc)) : μ = ν := sorry

/-- A denominator-free index formula, valid over an arbitrary commutative coefficient ring. -/
theorem HaarMeasureWithValues.apply_subgroup (U₀ U : OpenSubgroup G)
    (hc₀ : IsCompact (U₀ : Set G)) (hc : IsCompact (U : Set G))
    (hu : HasUnitProOrder A U₀.toSubgroup) :
    (((U.toSubgroup ⊓ U₀.toSubgroup).relIndex U₀.toSubgroup : ℕ) : A) *
      (HaarMeasureWithValues.normalized U₀ hc₀ hu).vol (compactOpenSet U hc) =
        (((U.toSubgroup ⊓ U₀.toSubgroup).relIndex U.toSubgroup : ℕ) : A) := sorry

theorem HaarMeasureWithValues.vol_isUnit_iff (U₀ U : OpenSubgroup G)
    (hc₀ : IsCompact (U₀ : Set G)) (hc : IsCompact (U : Set G))
    (hu : HasUnitProOrder A U₀.toSubgroup) :
    IsUnit ((HaarMeasureWithValues.normalized U₀ hc₀ hu).vol (compactOpenSet U hc)) ↔
      HasUnitProOrder A U.toSubgroup := sorry

instance HeckeAlgebra.scalarTower (μ : HaarMeasureWithValues G A) :
    IsScalarTower A (HeckeAlgebra μ) (HeckeAlgebra μ) := by sorry
instance HeckeAlgebra.scalarComm (μ : HaarMeasureWithValues G A) :
    SMulCommClass A (HeckeAlgebra μ) (HeckeAlgebra μ) := by sorry

theorem HeckeAlgebra.isIdempotented (μ : HaarMeasureWithValues G A)
    (hG : HasCofinalUnitProOrder A G) (U₀ : OpenSubgroup G) (hc : IsCompact (U₀ : Set G))
    (hu : HasUnitProOrder A U₀.toSubgroup) (hμ : μ.vol (compactOpenSet U₀ hc) = 1) :
    IsIdempotented (HeckeAlgebra μ) := sorry

/-- The integration equivalence, on the category built from Unitization and ModuleCat. -/
def SmoothRep.heckeModuleEquivalence (μ : HaarMeasureWithValues G A)
    (hG : HasCofinalUnitProOrder A G) (U₀ : OpenSubgroup G) (hc : IsCompact (U₀ : Set G))
    (hu : HasUnitProOrder A U₀.toSubgroup) (hμ : μ.vol (compactOpenSet U₀ hc) = 1) :
    SmoothRep A G ≌ NondegMod A (HeckeAlgebra μ) := sorry

theorem SmoothRep.heckeModuleEquivalence_action (μ : HaarMeasureWithValues G A)
    (hG : HasCofinalUnitProOrder A G) (U₀ : OpenSubgroup G) (hc : IsCompact (U₀ : Set G))
    (hu : HasUnitProOrder A U₀.toSubgroup) (hμ : μ.vol (compactOpenSet U₀ hc) = 1)
    (V : SmoothRep A G) :
    let E := SmoothRep.heckeModuleEquivalence μ hG U₀ hc hu hμ
    ∃ e : (E.functor.obj V).obj ≃+ V.obj.V,
      ∀ f : HeckeAlgebra μ, ∀ v,
        e ((Unitization.inr f : Unitization A (HeckeAlgebra μ)) • v) =
          μ.integrateModule
            { toFun := ⟨fun g => f.toFun g • V.obj.ρ g (e v), by sorry⟩
              isCompact_closure_support := by sorry } := sorry

theorem HeckeAlgebra.support_mul_subset (μ : HaarMeasureWithValues G A) (f g : HeckeAlgebra μ) :
    Function.support (f * g).toFun ⊆
      {x | ∃ y ∈ Function.support f.toFun, ∃ z ∈ Function.support g.toFun, x = y * z} := sorry

end FunctionAndMeasureAPI

section ExponentCones
open scoped NNReal
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Root and Levi data used to test normalized Jacquet exponents.
Each entry names its actual subgroups, normalization character, and restricted-root norms. -/
structure CasselmanData where
  Index : Type
  levi : Index → LeviDecomposition (G := G)
  splitCentre : ∀ i, Subgroup (levi i).M
  central : ∀ i, splitCentre i ≤ Subgroup.center (levi i).M
  halfModulus : ∀ i, (levi i).M →* ℂˣ
  smooth_half : ∀ i, IsSmoothCharacter (halfModulus i)
  roots : ∀ i, Finset ((splitCentre i) →* ℝ≥0)

/-- The closed negative cone includes its walls. -/
def CasselmanData.negativeCone (D : CasselmanData (G := G)) (i : D.Index) :
    Set (D.splitCentre i) := {a | ∀ α ∈ D.roots i, α a ≤ 1}

/-- Compact elements and elements central in the ambient group are omitted from the strict test. -/
def CasselmanData.compactCentral (D : CasselmanData (G := G)) (i : D.Index) :
    Subgroup (D.splitCentre i) :=
  SmoothRep.compactlyGeneratedSubgroup ⊔
    (Subgroup.center G).comap ((D.levi i).M.subtype.comp (D.splitCentre i).subtype)

/-- Temperedness in the specified standard-parabolic/root datum, including the central condition. -/
def SmoothRep.IsTempered (D : CasselmanData (G := G)) (V : SmoothRep ℂ G) : Prop :=
  Representation.IsAdmissible V.obj.ρ ∧ SmoothRep.HasUnitaryCentralCharacter V ∧
    ∀ i χ, χ ∈ SmoothRep.centralExponents
      (SmoothRep.normalizedJacquet (D.levi i) (D.halfModulus i) (D.smooth_half i) V)
      (D.splitCentre i) →
      ∀ a ∈ D.negativeCone i, a ∉ D.compactCentral i → ‖(χ a : ℂ)‖ ≤ 1

/-- The strict exponent inequality used by Casselman's criterion. -/
def CasselmanData.StrictExponentBound (D : CasselmanData (G := G)) (V : SmoothRep ℂ G) : Prop :=
  SmoothRep.HasUnitaryCentralCharacter V ∧
    ∀ i χ, χ ∈ SmoothRep.centralExponents
      (SmoothRep.normalizedJacquet (D.levi i) (D.halfModulus i) (D.smooth_half i) V)
      (D.splitCentre i) →
      ∀ a ∈ D.negativeCone i, a ∉ D.compactCentral i → ‖(χ a : ℂ)‖ < 1

/-- A torus has no proper standard parabolic. -/
def CasselmanData.torus : CasselmanData (G := G) where
  Index := Empty
  levi := Empty.elim
  splitCentre := fun i => i.elim
  central := fun i => i.elim
  halfModulus := fun i => i.elim
  smooth_half := fun i => i.elim
  roots := fun i => i.elim

end ExponentCones

def PadicGL2.casselmanData (p : ℕ) [Fact p.Prime] : CasselmanData (G := PadicGL2.Group p) where
  Index := Unit
  levi _ := PadicGL2.levi p
  splitCentre _ := ⊤
  central := by sorry
  halfModulus _ := (PadicGL2.halfModulus p).comp
    { toFun := fun m => ⟨m.val, (PadicGL2.levi p).m_le m.property⟩
      map_one' := by sorry
      map_mul' := by sorry }
  smooth_half := by sorry
  roots _ :=
    { { toFun := fun a => ‖a.val.val.val 0 0 / a.val.val.val 1 1‖₊
        map_one' := by sorry
        map_mul' := by sorry } }

theorem SmoothRep.isTempered_unitary_principal (p : ℕ) [Fact p.Prime]
    (χ : PadicGL2.diagonal p →* ℂˣ) (hχ : IsSmoothCharacter χ)
    (hu : ∀ a, ‖(χ a : ℂ)‖ = 1) :
    SmoothRep.IsTempered (PadicGL2.casselmanData p)
      (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p) (SmoothRep.ofCharacter χ hχ)) := sorry
/- Check `SmoothRep.isTempered_unitary_principal`: unitary inducing characters lie on the tempered boundary. -/
example (p : ℕ) [Fact p.Prime] (χ : PadicGL2.diagonal p →* ℂˣ)
    (hχ : IsSmoothCharacter χ) (hu : ∀ a, ‖(χ a : ℂ)‖ = 1) :
    SmoothRep.IsTempered (PadicGL2.casselmanData p)
      (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p) (SmoothRep.ofCharacter χ hχ)) := sorry

theorem SmoothRep.not_isTempered_trivial (p : ℕ) [Fact p.Prime] :
    ¬ SmoothRep.IsTempered (PadicGL2.casselmanData p)
      (SmoothRep.trivial (ModuleCat.of ℂ ℂ)) := sorry
/- Check `SmoothRep.not_isTempered_trivial`: inverse half modulus expands along the negative cone. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ SmoothRep.IsTempered (PadicGL2.casselmanData p)
      (SmoothRep.trivial (ModuleCat.of ℂ ℂ)) := sorry

theorem CasselmanCriterion.gl2 (p : ℕ) [Fact p.Prime] (V : SmoothRep ℂ (PadicGL2.Group p))
    (hV : Representation.IsAdmissible V.obj.ρ) :
    SmoothRep.IsSquareIntegrable V ↔ (PadicGL2.casselmanData p).StrictExponentBound V := sorry

theorem SmoothRep.IsSquareIntegrable.isTempered_gl2 (p : ℕ) [Fact p.Prime]
    (V : SmoothRep ℂ (PadicGL2.Group p)) (hV : SmoothRep.IsSquareIntegrable V) :
    SmoothRep.IsTempered (PadicGL2.casselmanData p) V := sorry

/- Check `SmoothRep.IsTempered.torus`: unitarity remains necessary when there are no roots. -/
example {G : Type} [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]
    (V : SmoothRep ℂ G) (hV : Representation.IsAdmissible V.obj.ρ) :
    SmoothRep.IsTempered CasselmanData.torus V ↔ SmoothRep.HasUnitaryCentralCharacter V := sorry

/- Check `SmoothRep.centralExponents.line`: a scalar line has exactly its given weight. -/
example {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (χ : G →* ℂˣ) (hχ : IsSmoothCharacter χ) :
    SmoothRep.centralExponents (SmoothRep.ofCharacter χ hχ) ⊤ =
      {χ.comp (⊤ : Subgroup G).subtype} := sorry
/- Check `SmoothRep.centralExponents.zero`: the nonzero generalized weight-vector condition matters. -/
example {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (V : SmoothRep ℂ G) [Subsingleton V.obj.V] (C : Subgroup G) :
    SmoothRep.centralExponents V C = ∅ := sorry
/- Check `SmoothRep.centralExponents.trivial`: a nonzero trivial module has only the trivial exponent. -/
example {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (V : ModuleCat ℂ) [Nontrivial V] (C : Subgroup G) :
    SmoothRep.centralExponents (SmoothRep.trivial (G := G) V) C = {1} := sorry

section DerivedHecke
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

abbrev SmoothRep.permutation (U : OpenSubgroup G) : SmoothRep A G :=
  ⟨Rep.of (Representation.ofMulAction A G (G ⧸ U.toSubgroup)), by sorry⟩

variable [CategoryTheory.HasExt (SmoothRep A G)]

/-- The graded carrier uses Ext in the smooth category, not Ext of all abstract group modules. -/
abbrev SmoothRep.derivedHecke (U : OpenSubgroup G) (n : ℕ) :=
  CategoryTheory.Abelian.Ext (SmoothRep.permutation (A := A) U) (SmoothRep.permutation U) n

/-- Opposite Yoneda composition agrees in degree zero with endomorphism multiplication. -/
def SmoothRep.derivedHeckeMul (U : OpenSubgroup G) {n m : ℕ}
    (a : SmoothRep.derivedHecke (A := A) U n) (b : SmoothRep.derivedHecke (A := A) U m) :
    SmoothRep.derivedHecke (A := A) U (n + m) := b.comp a (Nat.add_comm m n)

/-- The action on Ext from the permutation generator is a right action by precomposition. -/
def SmoothRep.derivedHeckeAction (U : OpenSubgroup G) (V : SmoothRep A G) {n m : ℕ}
    (x : CategoryTheory.Abelian.Ext (SmoothRep.permutation U) V n)
    (a : SmoothRep.derivedHecke (A := A) U m) :
    CategoryTheory.Abelian.Ext (SmoothRep.permutation U) V (n + m) := a.comp x (Nat.add_comm m n)

theorem SmoothRep.derivedHecke_zero (U : OpenSubgroup G) :
    ∃ e : SmoothRep.derivedHecke (A := A) U 0 ≃ₗ[A] HeckeAlgebraLevel A G U.toSubgroup,
      ∀ a b, e (SmoothRep.derivedHeckeMul U a b) = e a * e b := sorry

theorem SmoothRep.central_ext_annihilation (z : SmoothCentre A G) (V W : SmoothRep A G)
    (a b : A) (hV : z.app V = a • 𝟙 V) (hW : z.app W = b • 𝟙 W)
    (n : ℕ) (x : CategoryTheory.Abelian.Ext V W n) : (a - b) • x = 0 := sorry

theorem SmoothRep.central_ext_vanishing (z : SmoothCentre A G) (V W : SmoothRep A G)
    (a b : A) (hV : z.app V = a • 𝟙 V) (hW : z.app W = b • 𝟙 W)
    (hab : IsUnit (a - b)) (n : ℕ) : Subsingleton (CategoryTheory.Abelian.Ext V W n) := sorry

end DerivedHecke

section AdmissibleComplexChecks
attribute [local instance] HasDerivedCategory.standard

theorem SmoothRep.not_isAdmissibleComplex_cInd (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime]
    (hne : ℓ ≠ p) :
    let U : OpenSubgroup (Multiplicative ℚ_[p]) :=
      { carrier := {x | ‖Multiplicative.toAdd x‖ ≤ 1}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry
        isOpen' := by sorry }
    ¬ SmoothRep.IsAdmissibleComplex
      ((DerivedCategory.singleFunctor (SmoothRep (ZMod ℓ) (Multiplicative ℚ_[p])) 0).obj
        (SmoothRep.permutation U)) := sorry
/- Check `SmoothRep.not_isAdmissibleComplex_cInd`: infinitely many fixed cosets prevent perfection. -/
example (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (hne : ℓ ≠ p) :
    let U : OpenSubgroup (Multiplicative ℚ_[p]) :=
      { carrier := {x | ‖Multiplicative.toAdd x‖ ≤ 1}
        one_mem' := by sorry
        mul_mem' := by sorry
        inv_mem' := by sorry
        isOpen' := by sorry }
    ¬ SmoothRep.IsAdmissibleComplex
      ((DerivedCategory.singleFunctor (SmoothRep (ZMod ℓ) (Multiplicative ℚ_[p])) 0).obj
        (SmoothRep.permutation U)) := sorry

/- Check `SmoothRep.IsAdmissibleComplex.character`: averaging cuts out a finite projective summand of the coefficient line. -/
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    SmoothRep.IsAdmissibleComplex ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj
      (SmoothRep.ofCharacter χ hχ)) := sorry

/- Check `SmoothRep.derivedSmoothDual.torsion`: integral duality retains the degree-one torsion class. -/
example (p : ℕ) [Fact p.Prime] :
    let hG : HasCofinalUnitProOrder ℤ PUnit := by sorry
    let V := (DerivedCategory.singleFunctor (SmoothRep ℤ PUnit) 0).obj
      (SmoothRep.trivial (ModuleCat.of ℤ (ZMod p)))
    Nonempty (((DerivedCategory.homologyFunctor (SmoothRep ℤ PUnit) 1).obj
      ((SmoothRep.derivedSmoothDual hG).obj (Opposite.op V))).obj.V ≃+ ZMod p) := sorry

end AdmissibleComplexChecks

/-! ## Functorial parabolic induction and Whittaker quotients -/
section ParabolicFunctorAPI
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

def SmoothRep.twistFunctor (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    SmoothRep A G ⥤ SmoothRep A G where
  obj V := SmoothRep.twist V χ hχ
  map f := ObjectProperty.homMk (Rep.ofHom
    { toLinearMap := f.hom.hom.toLinearMap
      isIntertwining' := by sorry })
  map_id := by sorry
  map_comp := by sorry

def SmoothRep.parabolicIndFunctor (L : LeviDecomposition (G := G))
    (δhalf : L.P →* Aˣ) (hδ : IsSmoothCharacter δhalf) :
    SmoothRep A L.M ⥤ SmoothRep A G :=
  SmoothRep.inflate L ⋙ SmoothRep.twistFunctor δhalf hδ ⋙ SmoothRep.indFunctor L.P

def SmoothRep.normalizedJacquetFunctor (L : LeviDecomposition (G := G))
    (δhalfM : L.M →* Aˣ) (hδ : IsSmoothCharacter δhalfM) :
    SmoothRep A G ⥤ SmoothRep A L.M :=
  SmoothRep.jacquetFunctor L ⋙ SmoothRep.twistFunctor δhalfM⁻¹ (by sorry)

theorem SmoothRep.firstAdjunction (L : LeviDecomposition (G := G))
    [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (χ : L.M →* Aˣ) (hχ : IsSmoothCharacter χ) :
    Nonempty (SmoothRep.normalizedJacquetFunctor L χ hχ ⊣
      SmoothRep.parabolicIndFunctor L (χ.comp L.projection) (by sorry)) := sorry

/-- Whittaker functionals retain the actual restriction of the original action. -/
abbrev SmoothRep.whittakerFunctionals (V : SmoothRep A G) (U : Subgroup G)
    (ψ : U →* Aˣ) := Representation.whittakerFunctionals V.obj.ρ U ψ

abbrev SmoothRep.twistedJacquet (V : SmoothRep A G) (U : Subgroup G)
    (ψ : U →* Aˣ) := WhittakerCoinvariants (V.obj.ρ.comp U.subtype) ψ

theorem SmoothRep.whittakerFunctionals_equiv_hom_ind
    [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (V : SmoothRep A G) (U : Subgroup G) (hU : IsClosed (U : Set G))
    (ψ : U →* Aˣ) (hψ : IsSmoothCharacter ψ) :
    ∃ e : SmoothRep.whittakerFunctionals V U ψ ≃ₗ[A]
      (V ⟶ SmoothRep.ind U (SmoothRep.ofCharacter ψ hψ)),
      ∀ ℓ v, ((e ℓ).hom.hom v).val.val 1 = ℓ.val v := sorry

theorem SmoothRep.twistedJacquet_dual (V : SmoothRep A G) (U : Subgroup G)
    (ψ : U →* Aˣ) :
    Nonempty (Module.Dual A (SmoothRep.twistedJacquet V U ψ) ≃ₗ[A]
      SmoothRep.whittakerFunctionals V U ψ) := sorry

theorem SmoothRep.whittaker_torus (V : SmoothRep A G) :
    SmoothRep.whittakerFunctionals V ⊥ 1 = ⊤ := sorry
/- Check `SmoothRep.whittaker_torus`: the trivial radical imposes no linear relation. -/
example (V : SmoothRep A G) : SmoothRep.whittakerFunctionals V ⊥ 1 = ⊤ := sorry
end ParabolicFunctorAPI

section WhittakerGL2
variable (p : ℕ) [Fact p.Prime]

theorem SmoothRep.trivial_sub_parabolicInd :
    ∃ f : SmoothRep.trivial (ModuleCat.of ℂ ℂ) ⟶
      SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p)
        (SmoothRep.ofCharacter
          (((PadicGL2.halfModulus p).comp
            (Subgroup.inclusion (PadicGL2.levi p).m_le))⁻¹) (by sorry)),
      Function.Injective f.hom.hom ∧ ∀ z g, (f.hom.hom z).val.val g = z := sorry
/- Check `SmoothRep.trivial_sub_parabolicInd`: the inverse half modulus cancels covariance. -/
example :
    ∃ f : SmoothRep.trivial (ModuleCat.of ℂ ℂ) ⟶
      SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p)
        (SmoothRep.ofCharacter
          (((PadicGL2.halfModulus p).comp
            (Subgroup.inclusion (PadicGL2.levi p).m_le))⁻¹) (by sorry)),
      Function.Injective f.hom.hom ∧ ∀ z g, (f.hom.hom z).val.val g = z := sorry

theorem SmoothRep.isGeneric_principalSeries_gl2
    (χ : PadicGL2.diagonal p →* ℂˣ) (hχ : IsSmoothCharacter χ)
    (ψ : PadicGL2.upper p →* ℂˣ) (hψ : IsSmoothCharacter ψ) (hne : ψ ≠ 1) :
    Module.finrank ℂ (SmoothRep.twistedJacquet
      (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p) (SmoothRep.ofCharacter χ hχ))
      (PadicGL2.upper p) ψ) = 1 := sorry
/- Check `SmoothRep.isGeneric_principalSeries_gl2`: reducible principal series also have a line quotient. -/
example (χ : PadicGL2.diagonal p →* ℂˣ) (hχ : IsSmoothCharacter χ)
    (ψ : PadicGL2.upper p →* ℂˣ) (hψ : IsSmoothCharacter ψ) (hne : ψ ≠ 1) :
    Module.finrank ℂ (SmoothRep.twistedJacquet
      (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p) (SmoothRep.ofCharacter χ hχ))
      (PadicGL2.upper p) ψ) = 1 := sorry

theorem SmoothRep.whittakerMultiplicityOne_gl2
    (V : SmoothRep ℂ (PadicGL2.Group p)) (hi : Representation.IsIrreducible V.obj.ρ)
    (hinf : ¬ Module.Finite ℂ V.obj.V)
    (ψ : PadicGL2.upper p →* ℂˣ) (hψ : IsSmoothCharacter ψ) (hne : ψ ≠ 1) :
    Module.finrank ℂ (SmoothRep.twistedJacquet V (PadicGL2.upper p) ψ) = 1 ∧
      Module.finrank ℂ (SmoothRep.whittakerFunctionals V (PadicGL2.upper p) ψ) = 1 ∧
      ∃! S : Subrepresentation (SmoothRep.ind (PadicGL2.upper p)
        (SmoothRep.ofCharacter ψ hψ)).obj.ρ,
        Nonempty (V.obj ≅ Rep.of S.toRepresentation) := sorry
end WhittakerGL2

/-! ## Opposite Borel and the second adjunction for GL₂ -/
namespace PadicGL2
variable (p : ℕ) [Fact p.Prime]

def oppositeBorel : Subgroup (Group p) where
  carrier := {g | g.val 0 1 = 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

abbrev oppositeLevi : LeviDecomposition (G := Group p) where
  P := oppositeBorel p
  M := diagonal p
  N := lower p
  m_le := by sorry
  n_le := by sorry
  closed_P := by sorry
  closed_M := by sorry
  closed_N := by sorry
  projection :=
    { toFun := fun g =>
        ⟨{ val := Matrix.diagonal ![g.val.val 0 0, g.val.val 1 1]
           inv := Matrix.diagonal ![(g.val.val 0 0)⁻¹, (g.val.val 1 1)⁻¹]
           val_inv := by sorry
           inv_val := by sorry }, by sorry⟩
      map_one' := by sorry
      map_mul' := by sorry }
  continuous_projection := by sorry
  projection_inclusion := by sorry
  kernel := by sorry

def halfModulusM : diagonal p →* ℂˣ :=
  (halfModulus p).comp (Subgroup.inclusion (levi p).m_le)

def normalizedInduction : SmoothRep ℂ (diagonal p) ⥤ SmoothRep ℂ (Group p) :=
  SmoothRep.parabolicIndFunctor (levi p) (halfModulus p) (halfModulus_smooth p)

def oppositeJacquet : SmoothRep ℂ (Group p) ⥤ SmoothRep ℂ (diagonal p) :=
  SmoothRep.normalizedJacquetFunctor (oppositeLevi p) (halfModulusM p)⁻¹ (by sorry)

/-- The big cell is the actual product of the upper Borel and lower unipotent. -/
def bigCell : Set (Group p) := {g | ∃ b : borel p, ∃ n : lower p, g = b.val * n.val}

/-- Compactly supported functions on the lower radical extend by B-covariance on the big cell. -/
def bigCellSection (V : SmoothRep ℂ (diagonal p))
    (f : LocallyConstantCompact (lower p) V.obj.V) :
    ((normalizedInduction p).obj V).obj.V := sorry

theorem bigCellSection_apply (V : SmoothRep ℂ (diagonal p))
    (f : LocallyConstantCompact (lower p) V.obj.V) (b : borel p) (n : lower p) :
    (bigCellSection p V f).val.val (b.val * n.val) =
      (halfModulus p b : ℂ) • V.obj.ρ ((levi p).projection b) (f.toFun n) := sorry

theorem bigCellSection_outside (V : SmoothRep ℂ (diagonal p))
    (f : LocallyConstantCompact (lower p) V.obj.V) (g : Group p) (hg : g ∉ bigCell p) :
    (bigCellSection p V f).val.val g = 0 := sorry

instance : LocallyCompactSpace (lower p) := by sorry
instance : TotallyDisconnectedSpace (lower p) := by sorry
instance : T2Space (lower p) := by sorry
end PadicGL2

/-- The Haar normalization is fixed by the big-cell integral identity below. -/
def SmoothRep.secondAdjunction (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.lower p) ℂ) (hμ : ∃ K, μ.vol K ≠ 0) :
    PadicGL2.normalizedInduction p ⊣ PadicGL2.oppositeJacquet p := sorry

abbrev SmoothRep.secondAdjunctionUnit (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.lower p) ℂ) (hμ : ∃ K, μ.vol K ≠ 0) :=
  (SmoothRep.secondAdjunction p μ hμ).unit

abbrev SmoothRep.secondAdjunctionCounit (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.lower p) ℂ) (hμ : ∃ K, μ.vol K ≠ 0) :=
  (SmoothRep.secondAdjunction p μ hμ).counit

abbrev SmoothRep.secondAdjunctionHomEquiv (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.lower p) ℂ) (hμ : ∃ K, μ.vol K ≠ 0)
    (V : SmoothRep ℂ (PadicGL2.diagonal p)) (W : SmoothRep ℂ (PadicGL2.Group p)) :=
  (SmoothRep.secondAdjunction p μ hμ).homEquiv V W

theorem SmoothRep.secondAdjunctionUnit_gl2 (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.lower p) ℂ) (hμ : ∃ K, μ.vol K ≠ 0)
    (V : SmoothRep ℂ (PadicGL2.diagonal p))
    (f : LocallyConstantCompact (PadicGL2.lower p) V.obj.V) :
    ((SmoothRep.secondAdjunctionUnit p μ hμ).app V).hom.hom (μ.integrateModule f) =
      Representation.Coinvariants.mk
        (((PadicGL2.normalizedInduction p).obj V).obj.ρ.comp (PadicGL2.lower p).subtype)
        (PadicGL2.bigCellSection p V f) := sorry
/- Check `SmoothRep.secondAdjunctionUnit_gl2`: integration identifies the open-orbit quotient. -/
example (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.lower p) ℂ) (hμ : ∃ K, μ.vol K ≠ 0)
    (V : SmoothRep ℂ (PadicGL2.diagonal p))
    (f : LocallyConstantCompact (PadicGL2.lower p) V.obj.V) :
    ((SmoothRep.secondAdjunctionUnit p μ hμ).app V).hom.hom (μ.integrateModule f) =
      Representation.Coinvariants.mk
        (((PadicGL2.normalizedInduction p).obj V).obj.ρ.comp (PadicGL2.lower p).subtype)
        (PadicGL2.bigCellSection p V f) := sorry

theorem SmoothRep.secondAdjunctionUnit_injective (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.lower p) ℂ) (hμ : ∃ K, μ.vol K ≠ 0)
    (V : SmoothRep ℂ (PadicGL2.diagonal p)) :
    Function.Injective ((SmoothRep.secondAdjunctionUnit p μ hμ).app V).hom.hom := sorry
/- Check `SmoothRep.secondAdjunctionUnit_injective`: no admissibility hypothesis on V. -/
example (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.lower p) ℂ) (hμ : ∃ K, μ.vol K ≠ 0)
    (V : SmoothRep ℂ (PadicGL2.diagonal p)) :
    Function.Injective ((SmoothRep.secondAdjunctionUnit p μ hμ).app V).hom.hom := sorry

theorem SmoothRep.secondAdjunction_left_triangle (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.lower p) ℂ) (hμ : ∃ K, μ.vol K ≠ 0)
    (W : SmoothRep ℂ (PadicGL2.Group p)) :
    (SmoothRep.secondAdjunctionUnit p μ hμ).app ((PadicGL2.oppositeJacquet p).obj W) ≫
      (PadicGL2.oppositeJacquet p).map ((SmoothRep.secondAdjunctionCounit p μ hμ).app W) =
        𝟙 _ := sorry

theorem SmoothRep.secondAdjunction_right_triangle (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.lower p) ℂ) (hμ : ∃ K, μ.vol K ≠ 0)
    (V : SmoothRep ℂ (PadicGL2.diagonal p)) :
    (PadicGL2.normalizedInduction p).map ((SmoothRep.secondAdjunctionUnit p μ hμ).app V) ≫
      (SmoothRep.secondAdjunctionCounit p μ hμ).app ((PadicGL2.normalizedInduction p).obj V) =
        𝟙 _ := sorry


section InvariantIdentities
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

theorem IsSmoothCharacter.mul {χ ψ : G →* Aˣ}
    (hχ : IsSmoothCharacter χ) (hψ : IsSmoothCharacter ψ) :
    IsSmoothCharacter (χ * ψ) := sorry

theorem Representation.isAdmissible_iff_basis {V : Type u} [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) (hs : Representation.IsSmooth ρ)
    (B : Set (OpenSubgroup G)) (hc : ∀ U ∈ B, IsCompact (U : Set G))
    (hb : ∀ U : OpenSubgroup G, IsCompact (U : Set G) → ∃ U' ∈ B, U' ≤ U)
    (hA : IsNoetherianRing A ∨ ∀ U : OpenSubgroup G, IsCompact (U : Set G) →
      HasUnitProOrder A U.toSubgroup) :
    Representation.IsAdmissible ρ ↔ ∀ U ∈ B, Module.Finite A (Representation.invariants (ρ.comp U.toSubgroup.subtype)) := sorry

theorem HeckeAlgebra.idempotent_mul_of_le [LocallyCompactSpace G] [T2Space G]
    (μ : HaarMeasureWithValues G A) (U V : TopologicalSpace.CompactOpens G)
    (hU : ∃ K : Subgroup G, (K : Set G) = (U : Set G))
    (hV : ∃ K : Subgroup G, (K : Set G) = (V : Set G))
    (uU : IsUnit (μ.vol U)) (uV : IsUnit (μ.vol V)) (h : V ≤ U) :
    HeckeAlgebra.idempotent μ U hU uU * HeckeAlgebra.idempotent μ V hV uV =
      HeckeAlgebra.idempotent μ U hU uU ∧
    HeckeAlgebra.idempotent μ V hV uV * HeckeAlgebra.idempotent μ U hU uU =
      HeckeAlgebra.idempotent μ U hU uU := sorry

theorem HeckeAlgebra.idempotent_mul_eq_iff [LocallyCompactSpace G] [T2Space G]
    (μ : HaarMeasureWithValues G A) (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
    (hu : IsUnit (μ.vol (compactOpenSet U hc))) (f : HeckeAlgebra μ) :
    (HeckeAlgebra.idempotent μ (compactOpenSet U hc) ⟨U.toSubgroup, rfl⟩ hu * f = f ↔
      ∀ u : U, ∀ g, f.toFun (u.val * g) = f.toFun g) ∧
    (f * HeckeAlgebra.idempotent μ (compactOpenSet U hc) ⟨U.toSubgroup, rfl⟩ hu = f ↔
      ∀ u : U, ∀ g, f.toFun (g * u.val) = f.toFun g) := sorry
end InvariantIdentities

/-! ## Specialization of the universal character -/
section UniversalSpecialization
open scoped IsMulCommutative
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

def SmoothRep.unramifiedEvaluation (χ : SmoothRep.unramifiedCharacters (G := G) A) :
    MonoidAlgebra A (G ⧸ SmoothRep.compactlyGeneratedSubgroup) →ₐ[A] A :=
  MonoidAlgebra.lift A A _ ((Units.coeHom A).comp χ)

omit [IsTopologicalGroup G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G] in
theorem SmoothRep.unramifiedEvaluation_single (χ : SmoothRep.unramifiedCharacters (G := G) A)
    (g : G) (a : A) :
    SmoothRep.unramifiedEvaluation χ (MonoidAlgebra.single (QuotientGroup.mk g) a) =
      a * (SmoothRep.unramifiedCharacter χ g : A) := sorry

theorem SmoothRep.universalUnramifiedTwist_specialize
    (L : LeviDecomposition (G := G)) [LocallyCompactSpace L.M]
    [TotallyDisconnectedSpace L.M] [T2Space L.M]
    [IsMulCommutative (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)] [CompactSpace (G ⧸ L.P)]
    (δhalf : L.P →* Aˣ) (hδ : IsSmoothCharacter δhalf) (V : SmoothRep A L.M)
    (χ : SmoothRep.unramifiedCharacters (G := L.M) A) :
    let B := MonoidAlgebra A (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)
    letI : Algebra B A := (SmoothRep.unramifiedEvaluation χ).toRingHom.toAlgebra
    Nonempty ((SmoothRep.baseChange (A := B) (B := A)).obj
      (SmoothRep.universalUnramifiedTwist L δhalf hδ V) ≅
        SmoothRep.parabolicInd L δhalf hδ
          (SmoothRep.twist V (SmoothRep.unramifiedCharacter χ)
            (SmoothRep.unramifiedCharacters_isSmoothCharacter χ))) := sorry

theorem SmoothRep.universalUnramifiedTwist_trivial_levi
    (L : LeviDecomposition (G := G)) [LocallyCompactSpace L.M]
    [TotallyDisconnectedSpace L.M] [T2Space L.M]
    [IsMulCommutative (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)]
    (hM : SmoothRep.compactlyGeneratedSubgroup (G := L.M) = ⊤)
    (δhalf : L.P →* Aˣ) (hδ : IsSmoothCharacter δhalf) (V : SmoothRep A L.M) :
    let B := MonoidAlgebra A (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)
    ∃ e : B ≃ₐ[A] A,
      (∀ m, e (MonoidAlgebra.single (QuotientGroup.mk m) 1) = 1) ∧
      Nonempty ((SmoothRep.restrictScalars (A := A) (B := B)).obj
        (SmoothRep.universalUnramifiedTwist L δhalf hδ V) ≅
          SmoothRep.parabolicInd L δhalf hδ V) := sorry
/- Check `SmoothRep.universalUnramifiedTwist_trivial_levi`: trivial lattice removes the entire coefficient extension. -/
example (L : LeviDecomposition (G := G)) [LocallyCompactSpace L.M]
    [TotallyDisconnectedSpace L.M] [T2Space L.M]
    [IsMulCommutative (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)]
    (hM : SmoothRep.compactlyGeneratedSubgroup (G := L.M) = ⊤)
    (δhalf : L.P →* Aˣ) (hδ : IsSmoothCharacter δhalf) (V : SmoothRep A L.M) :
    let B := MonoidAlgebra A (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)
    ∃ e : B ≃ₐ[A] A,
      (∀ m, e (MonoidAlgebra.single (QuotientGroup.mk m) 1) = 1) ∧
      Nonempty ((SmoothRep.restrictScalars (A := A) (B := B)).obj
        (SmoothRep.universalUnramifiedTwist L δhalf hδ V) ≅
          SmoothRep.parabolicInd L δhalf hδ V) := sorry
end UniversalSpecialization

section UniversalGL1
instance (p : ℕ) [Fact p.Prime] : TotallyDisconnectedSpace ℚ_[p]ˣ := by sorry
instance (p : ℕ) [Fact p.Prime] : IsMulCommutative
    (ℚ_[p]ˣ ⧸ SmoothRep.compactlyGeneratedSubgroup) := by sorry
open scoped IsMulCommutative

theorem SmoothRep.universalUnramifiedTwist_gl1 (p : ℕ) [Fact p.Prime] :
    let V : SmoothRep ℂ ℚ_[p]ˣ := SmoothRep.trivial (ModuleCat.of ℂ ℂ)
    let B := MonoidAlgebra ℂ (ℚ_[p]ˣ ⧸ SmoothRep.compactlyGeneratedSubgroup)
    let ϖ := Units.mk0 (p : ℚ_[p]) (by sorry)
    ∃ e : (SmoothRep.unramifiedTwist V).obj.V ≃ₗ[B] B,
      ∀ v, e ((SmoothRep.unramifiedTwist V).obj.ρ ϖ v) =
        MonoidAlgebra.single (QuotientGroup.mk ϖ) 1 * e v := sorry
/- Check `SmoothRep.universalUnramifiedTwist_gl1`: the uniformizer acts by the positive lattice generator. -/
example (p : ℕ) [Fact p.Prime] :
    let V : SmoothRep ℂ ℚ_[p]ˣ := SmoothRep.trivial (ModuleCat.of ℂ ℂ)
    let B := MonoidAlgebra ℂ (ℚ_[p]ˣ ⧸ SmoothRep.compactlyGeneratedSubgroup)
    let ϖ := Units.mk0 (p : ℚ_[p]) (by sorry)
    ∃ e : (SmoothRep.unramifiedTwist V).obj.V ≃ₗ[B] B,
      ∀ v, e ((SmoothRep.unramifiedTwist V).obj.ρ ϖ v) =
        MonoidAlgebra.single (QuotientGroup.mk ϖ) 1 * e v := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.universalUnramifiedTwist.unit_character (p : ℕ) [Fact p.Prime] (V : SmoothRep ℂ ℚ_[p]ˣ) :
    let B := MonoidAlgebra ℂ (ℚ_[p]ˣ ⧸ SmoothRep.compactlyGeneratedSubgroup)
    letI : Algebra B ℂ := (SmoothRep.unramifiedEvaluation (1 :
      SmoothRep.unramifiedCharacters (G := ℚ_[p]ˣ) ℂ)).toRingHom.toAlgebra
    Nonempty ((SmoothRep.baseChange (A := B) (B := ℂ)).obj
      (SmoothRep.unramifiedTwist V) ≅ V) := sorry

/- Check `SmoothRep.universalUnramifiedTwist.unit_character`: evaluation at 1 recovers the original action. -/
example (p : ℕ) [Fact p.Prime] (V : SmoothRep ℂ ℚ_[p]ˣ) :
    let B := MonoidAlgebra ℂ (ℚ_[p]ˣ ⧸ SmoothRep.compactlyGeneratedSubgroup)
    letI : Algebra B ℂ := (SmoothRep.unramifiedEvaluation (1 :
      SmoothRep.unramifiedCharacters (G := ℚ_[p]ˣ) ℂ)).toRingHom.toAlgebra
    Nonempty ((SmoothRep.baseChange (A := B) (B := ℂ)).obj
      (SmoothRep.unramifiedTwist V) ≅ V) := sorry
end UniversalGL1

section QuasiCuspidal
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- A family is supplied by rational parabolics; its members retain their actual subgroups.
The predicate itself is meaningful for any such family and makes no reductivity assertion. -/
def SmoothRep.IsQuasiCuspidal (P : Set (LeviDecomposition (G := G))) (V : SmoothRep A G) : Prop :=
  ∀ L ∈ P, L.P ≠ ⊤ → Subsingleton (SmoothRep.jacquet L V).obj.V

def SmoothRep.IsCuspidal (P : Set (LeviDecomposition (G := G))) (V : SmoothRep A G) : Prop :=
  SmoothRep.IsQuasiCuspidal P V ∧ Representation.IsFinitelyGenerated V.obj.ρ

theorem SmoothRep.isQuasiCuspidal_iff_hom [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G]
    (P : Set (LeviDecomposition (G := G))) (V : SmoothRep A G) :
    SmoothRep.IsQuasiCuspidal P V ↔
      ∀ L ∈ P, L.P ≠ ⊤ → ∀ σ : SmoothRep A L.M,
        Subsingleton (V ⟶ (SmoothRep.unnormalizedParabolicInd L).obj σ) := sorry

theorem SmoothRep.isQuasiCuspidal_torus [T2Space G] (V : SmoothRep A G) :
    SmoothRep.IsQuasiCuspidal {LeviDecomposition.self} V := sorry
/- Check `SmoothRep.isQuasiCuspidal_torus`: with no proper parabolics every representation qualifies. -/
example [T2Space G] (V : SmoothRep A G) :
    SmoothRep.IsQuasiCuspidal {LeviDecomposition.self} V := sorry

/- Check `SmoothRep.IsQuasiCuspidal.zero`: every Jacquet quotient of a zero module is zero. -/
example (P : Set (LeviDecomposition (G := G))) (V : SmoothRep A G) [Subsingleton V.obj.V] :
    SmoothRep.IsQuasiCuspidal P V := sorry
end QuasiCuspidal

theorem SmoothRep.not_isQuasiCuspidal_principalSeries (p : ℕ) [Fact p.Prime]
    (χ : PadicGL2.diagonal p →* ℂˣ) (hχ : IsSmoothCharacter χ) :
    ¬ SmoothRep.IsQuasiCuspidal {PadicGL2.levi p, LeviDecomposition.self}
      (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p) (SmoothRep.ofCharacter χ hχ)) := sorry
/- Check `SmoothRep.not_isQuasiCuspidal_principalSeries`: the Borel quotient detects principal series. -/
example (p : ℕ) [Fact p.Prime] (χ : PadicGL2.diagonal p →* ℂˣ) (hχ : IsSmoothCharacter χ) :
    ¬ SmoothRep.IsQuasiCuspidal {PadicGL2.levi p, LeviDecomposition.self}
      (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p) (SmoothRep.ofCharacter χ hχ)) := sorry


/-! ## Constant terms on the actual spherical function carrier -/
section SatakeCarrier
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [T2Space G]

def SphericalHeckeFunctions (μ : HaarMeasureWithValues G A) (K : OpenSubgroup G) :
    Submodule A (HeckeAlgebra μ) where
  carrier := {f | ∀ k : K, ∀ g, f.toFun (k.val * g) = f.toFun g ∧
    f.toFun (g * k.val) = f.toFun g}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- A lattice quotient of the Levi and Haar measure on the actual radical.
The compact projection condition is the Iwasawa-compatible position of K. -/
structure SatakeDatum (A : Type u) [CommRing A] (L : LeviDecomposition (G := G))
    (K : OpenSubgroup G) (Λ : Type u) [CommGroup Λ] where
  lattice : L.M →* Λ
  onto : Function.Surjective lattice
  kernel : ∀ m : L.M, lattice m = 1 ↔ m.val ∈ K
  compact_K : IsCompact (K : Set G)
  projection_K : ∀ p : L.P, p.val ∈ K → (L.projection p).val ∈ K
  radicalCompact : OpenSubgroup L.N
  radicalCompact_mem : ∀ n : L.N, n ∈ radicalCompact ↔ n.val ∈ K
  radicalCompact_compact : IsCompact (radicalCompact : Set L.N)
  haar : HaarMeasureWithValues L.N A
  normalized : haar.vol (compactOpenSet radicalCompact radicalCompact_compact) = 1

/-- The integrand of the unnormalized constant term, with no hidden modulus factor. -/
def satakeIntegrand (L : LeviDecomposition (G := G)) (μ : HaarMeasureWithValues G A)
    (f : HeckeAlgebra μ) (m : L.M) : LocallyConstantCompact L.N A where
  toFun := ⟨fun n => f.toFun (m.val * n.val), by sorry⟩
  isCompact_closure_support := by sorry

/-- Finite support on the lattice is a theorem of the compact support and the kernel equation. -/
def satakeTransform {Λ : Type u} [CommGroup Λ]
    (L : LeviDecomposition (G := G)) (K : OpenSubgroup G)
    (d : SatakeDatum A L K Λ) (μ : HaarMeasureWithValues G A) :
    SphericalHeckeFunctions μ K →ₗ[A] MonoidAlgebra A Λ := sorry

theorem satakeTransform.coefficient {Λ : Type u} [CommGroup Λ]
    (L : LeviDecomposition (G := G)) (K : OpenSubgroup G)
    (d : SatakeDatum A L K Λ) (μ : HaarMeasureWithValues G A)
    (f : SphericalHeckeFunctions μ K) (m : L.M) :
    (satakeTransform L K d μ f).coeff (d.lattice m) =
      d.haar.integrate (satakeIntegrand L μ f.val m) := sorry

theorem satakeTransform.support {Λ : Type u} [CommGroup Λ]
    (L : LeviDecomposition (G := G)) (K : OpenSubgroup G)
    (d : SatakeDatum A L K Λ) (μ : HaarMeasureWithValues G A)
    (f : SphericalHeckeFunctions μ K) :
    Set.Finite {ell : Λ | ∃ m : L.M, ∃ n : L.N,
      d.lattice m = ell ∧ f.val.toFun (m.val * n.val) ≠ 0} ∧
    ∀ ell ∈ (satakeTransform L K d μ f).coeff.support,
      ∃ m : L.M, ∃ n : L.N, d.lattice m = ell ∧ f.val.toFun (m.val * n.val) ≠ 0 := sorry

/-- The compact-open identity function is an element of the same spherical carrier. -/
def sphericalUnit (μ : HaarMeasureWithValues G A) (K : OpenSubgroup G)
    (hc : IsCompact (K : Set G)) : SphericalHeckeFunctions μ K :=
  ⟨LocallyConstantCompact.indicator (compactOpenSet K hc) 1, by sorry⟩

theorem satakeTransform.unit {Λ : Type u} [CommGroup Λ]
    (L : LeviDecomposition (G := G)) (K : OpenSubgroup G)
    (d : SatakeDatum A L K Λ) (μ : HaarMeasureWithValues G A) :
    satakeTransform L K d μ (sphericalUnit μ K d.compact_K) = MonoidAlgebra.single 1 1 := sorry
/- Check `satakeTransform.unit`: radical volume one gives precisely the identity monomial. -/
example {Λ : Type u} [CommGroup Λ]
    (L : LeviDecomposition (G := G)) (K : OpenSubgroup G)
    (d : SatakeDatum A L K Λ) (μ : HaarMeasureWithValues G A) :
    satakeTransform L K d μ (sphericalUnit μ K d.compact_K) = MonoidAlgebra.single 1 1 := sorry

theorem satakeTransform.torus {Λ : Type u} [CommGroup Λ]
    (K : OpenSubgroup G) (d : SatakeDatum A LeviDecomposition.self K Λ)
    (μ : HaarMeasureWithValues G A) (f : SphericalHeckeFunctions μ K) (g : G) :
    (satakeTransform LeviDecomposition.self K d μ f).coeff (d.lattice ⟨g, trivial⟩) =
      f.val.toFun g := sorry
/- Check `satakeTransform.torus`: the trivial radical contributes no factor. -/
example {Λ : Type u} [CommGroup Λ]
    (K : OpenSubgroup G) (d : SatakeDatum A LeviDecomposition.self K Λ)
    (μ : HaarMeasureWithValues G A) (f : SphericalHeckeFunctions μ K) (g : G) :
    (satakeTransform LeviDecomposition.self K d μ f).coeff (d.lattice ⟨g, trivial⟩) =
      f.val.toFun g := sorry

/- Check `satakeTransform.zero`: the zero spherical function has empty lattice support. -/
example {Λ : Type u} [CommGroup Λ]
    (L : LeviDecomposition (G := G)) (K : OpenSubgroup G)
    (d : SatakeDatum A L K Λ) (μ : HaarMeasureWithValues G A) :
    (satakeTransform L K d μ 0).coeff.support = ∅ := sorry
end SatakeCarrier


/-- Multiplication by a lattice character, coefficient by coefficient. -/
def normalizeSatake {A Λ : Type u} [CommRing A] [CommGroup Λ] (θ : Λ →* Aˣ) :
    MonoidAlgebra A Λ →ₗ[A] MonoidAlgebra A Λ := sorry

theorem normalizeSatake_coeff {A Λ : Type u} [CommRing A] [CommGroup Λ]
    (θ : Λ →* Aˣ) (f : MonoidAlgebra A Λ) (ell : Λ) :
    (normalizeSatake θ f).coeff ell = (θ ell : A) * f.coeff ell := sorry

namespace PadicGL2
variable (p : ℕ) [Fact p.Prime]

instance : LocallyCompactSpace (Group p) := by sorry

def hyperspecial : OpenSubgroup (Group p) where
  toSubgroup := maximalCompact p
  isOpen' := by sorry

/-- The two determinant coordinates are the valuations of the diagonal entries. -/
def satakeDatum : SatakeDatum ℂ (levi p) (hyperspecial p) (Multiplicative (ℤ × ℤ)) := sorry

theorem satakeDatum_diag (a d : ℚ_[p]ˣ) :
    (satakeDatum p).lattice (diag p a d) =
      Multiplicative.ofAdd (Padic.valuation (a : ℚ_[p]), Padic.valuation (d : ℚ_[p])) := sorry

/-- Positive square-root modulus in the same lattice coordinates. -/
def satakeHalf : Multiplicative (ℤ × ℤ) →* ℂˣ where
  toFun ell := (Units.mk0 (Real.sqrt (p : ℝ) : ℂ) (by sorry)) ^
    ((Multiplicative.toAdd ell).2 - (Multiplicative.toAdd ell).1)
  map_one' := by sorry
  map_mul' := by sorry

/-- Characteristic function of the first spherical double coset. -/
def firstSpherical (μ : HaarMeasureWithValues (Group p) ℂ) :
    SphericalHeckeFunctions μ (hyperspecial p) :=
  ⟨{ toFun := ⟨fun g => if ∃ k₁ k₂ : hyperspecial p,
        g = k₁.val * (diag p (Units.mk0 (p : ℚ_[p]) (by sorry)) 1).val * k₂.val
        then 1 else 0, by sorry⟩
     isCompact_closure_support := by sorry }, by sorry⟩
end PadicGL2

theorem satakeTransform.gl2 (p : ℕ) [Fact p.Prime]
    (μ : HaarMeasureWithValues (PadicGL2.Group p) ℂ) :
    normalizeSatake (PadicGL2.satakeHalf p)
      (satakeTransform (PadicGL2.levi p) (PadicGL2.hyperspecial p)
        (PadicGL2.satakeDatum p) μ (PadicGL2.firstSpherical p μ)) =
      (Real.sqrt (p : ℝ) : ℂ) •
        (MonoidAlgebra.single (Multiplicative.ofAdd (1, 0)) 1 +
          MonoidAlgebra.single (Multiplicative.ofAdd (0, 1)) 1) := sorry
/- Check `satakeTransform.gl2`: both normalized coefficients are the positive square root of p. -/
example (p : ℕ) [Fact p.Prime] (μ : HaarMeasureWithValues (PadicGL2.Group p) ℂ) :
    normalizeSatake (PadicGL2.satakeHalf p)
      (satakeTransform (PadicGL2.levi p) (PadicGL2.hyperspecial p)
        (PadicGL2.satakeDatum p) μ (PadicGL2.firstSpherical p μ)) =
      (Real.sqrt (p : ℝ) : ℂ) •
        (MonoidAlgebra.single (Multiplicative.ofAdd (1, 0)) 1 +
          MonoidAlgebra.single (Multiplicative.ofAdd (0, 1)) 1) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.satakeTransform.gl2_raw (p : ℕ) [Fact p.Prime] (μ : HaarMeasureWithValues (PadicGL2.Group p) ℂ) :
    satakeTransform (PadicGL2.levi p) (PadicGL2.hyperspecial p)
      (PadicGL2.satakeDatum p) μ (PadicGL2.firstSpherical p μ) =
        MonoidAlgebra.single (Multiplicative.ofAdd (1, 0)) (p : ℂ) +
          MonoidAlgebra.single (Multiplicative.ofAdd (0, 1)) 1 := sorry

/- Check `satakeTransform.gl2_raw`: the raw coefficients distinguish the modulus orientation. -/
example (p : ℕ) [Fact p.Prime] (μ : HaarMeasureWithValues (PadicGL2.Group p) ℂ) :
    satakeTransform (PadicGL2.levi p) (PadicGL2.hyperspecial p)
      (PadicGL2.satakeDatum p) μ (PadicGL2.firstSpherical p μ) =
        MonoidAlgebra.single (Multiplicative.ofAdd (1, 0)) (p : ℂ) +
          MonoidAlgebra.single (Multiplicative.ofAdd (0, 1)) 1 := sorry

/- Check `normalizeSatake.one`: omitting the normalization character preserves every coefficient. -/
example {A Λ : Type u} [CommRing A] [CommGroup Λ] (f : MonoidAlgebra A Λ) :
    normalizeSatake 1 f = f := sorry


section ExactParabolicInduction
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

theorem SmoothRep.parabolicInd_exact (L : LeviDecomposition (G := G))
    [CompactSpace (G ⧸ L.P)] (δhalf : L.P →* Aˣ) (hδ : IsSmoothCharacter δhalf) :
    Limits.PreservesFiniteLimits (SmoothRep.parabolicIndFunctor L δhalf hδ) ∧
      Limits.PreservesFiniteColimits (SmoothRep.parabolicIndFunctor L δhalf hδ) := sorry

theorem SmoothRep.parabolicInd_admissible (L : LeviDecomposition (G := G))
    [CompactSpace (G ⧸ L.P)] (δhalf : L.P →* Aˣ) (hδ : IsSmoothCharacter δhalf)
    (hδc : ∀ C : Subgroup L.P, IsCompact (C : Set L.P) → ∀ c : C, δhalf c.val = 1)
    (V : SmoothRep A L.M) (hV : Representation.IsAdmissible V.obj.ρ) :
    Representation.IsAdmissible (SmoothRep.parabolicInd L δhalf hδ V).obj.ρ := sorry
end ExactParabolicInduction

section UniversalProjectivity
open scoped IsMulCommutative
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

theorem SmoothRep.universalUnramifiedTwist_invariants_projective
    (L : LeviDecomposition (G := G)) [LocallyCompactSpace L.M]
    [TotallyDisconnectedSpace L.M] [T2Space L.M]
    [IsMulCommutative (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)]
    [CompactSpace (G ⧸ L.P)] (δhalf : L.P →* ℂˣ) (hδ : IsSmoothCharacter δhalf)
    (V : SmoothRep ℂ L.M) (hV : Representation.IsAdmissible V.obj.ρ)
    (K : OpenSubgroup G) (hc : IsCompact (K : Set G)) :
    let B := MonoidAlgebra ℂ (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)
    let W := SmoothRep.invariants K.toSubgroup
      (SmoothRep.universalUnramifiedTwist L δhalf hδ V)
    Module.Finite B W ∧ Module.Projective B W := sorry
end UniversalProjectivity

/- The torus case retains the unitary-central-character requirement. -/
theorem CasselmanCriterion.torus {G : Type} [CommGroup G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace (G ⧸ Subgroup.center G)]
    (V : SmoothRep ℂ G) (hV : Representation.IsAdmissible V.obj.ρ) :
    SmoothRep.IsSquareIntegrable V ↔ SmoothRep.HasUnitaryCentralCharacter V := sorry
/- Check `CasselmanCriterion.torus`: the quotient by the centre is a point, but unitarity still matters. -/
example {G : Type} [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]
    [LocallyCompactSpace (G ⧸ Subgroup.center G)]
    (V : SmoothRep ℂ G) (hV : Representation.IsAdmissible V.obj.ρ) :
    SmoothRep.IsSquareIntegrable V ↔ SmoothRep.HasUnitaryCentralCharacter V := sorry

/-- In rank one the finite-length case is a specialization of the admissible statement. -/
theorem CasselmanCriterion.finiteLength (p : ℕ) [Fact p.Prime]
    (V : SmoothRep ℂ (PadicGL2.Group p)) (hV : Representation.IsAdmissible V.obj.ρ)
    (hfinite : IsNoetherian ℂ[PadicGL2.Group p] V.obj.ρ.asModule ∧
      IsArtinian ℂ[PadicGL2.Group p] V.obj.ρ.asModule) :
    SmoothRep.IsSquareIntegrable V ↔ (PadicGL2.casselmanData p).StrictExponentBound V := sorry
/- Check `CasselmanCriterion.finiteLength`: the extra finite-length assumption specializes the full rank-one criterion. -/
example (p : ℕ) [Fact p.Prime]
    (V : SmoothRep ℂ (PadicGL2.Group p)) (hV : Representation.IsAdmissible V.obj.ρ)
    (hfinite : IsNoetherian ℂ[PadicGL2.Group p] V.obj.ρ.asModule ∧
      IsArtinian ℂ[PadicGL2.Group p] V.obj.ρ.asModule) :
    SmoothRep.IsSquareIntegrable V ↔ (PadicGL2.casselmanData p).StrictExponentBound V := sorry


section DescentCarrier
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [T2Space G]

/-- On bi-K-invariant functions, K-conjugation averaging leaves the integrand unchanged. -/
def parabolicDescent (L : LeviDecomposition (G := G))
    (μ : HaarMeasureWithValues G A) (ν : HaarMeasureWithValues L.N A)
    (δhalf : L.M →* Aˣ) (hδ : IsSmoothCharacter δhalf) :
    HeckeAlgebra μ →ₗ[A] LocallyConstantCompact L.M A where
  toFun f :=
    { toFun := ⟨fun m => (δhalf m : A) * ν.integrate (satakeIntegrand L μ f m), by sorry⟩
      isCompact_closure_support := by sorry }
  map_add' := by sorry
  map_smul' := by sorry

theorem parabolicDescent.coefficient (L : LeviDecomposition (G := G))
    (μ : HaarMeasureWithValues G A) (ν : HaarMeasureWithValues L.N A)
    (δhalf : L.M →* Aˣ) (hδ : IsSmoothCharacter δhalf) (f : HeckeAlgebra μ) (m : L.M) :
    (parabolicDescent L μ ν δhalf hδ f).toFun m =
      (δhalf m : A) * ν.integrate (satakeIntegrand L μ f m) := rfl

theorem parabolicDescent.support (L : LeviDecomposition (G := G))
    (μ : HaarMeasureWithValues G A) (ν : HaarMeasureWithValues L.N A)
    (δhalf : L.M →* Aˣ) (hδ : IsSmoothCharacter δhalf) (f : HeckeAlgebra μ) :
    Function.support (parabolicDescent L μ ν δhalf hδ f).toFun ⊆
      L.projection '' ((fun p : L.P => p.val) ⁻¹' closure (Function.support f.toFun)) := sorry

theorem parabolicDescent.wholeGroup {Λ : Type u} [CommGroup Λ]
    (K : OpenSubgroup G) (d : SatakeDatum A LeviDecomposition.self K Λ)
    (μ : HaarMeasureWithValues G A) (f : HeckeAlgebra μ) (g : G) :
    (parabolicDescent LeviDecomposition.self μ d.haar 1 (by sorry) f).toFun ⟨g, trivial⟩ =
      f.toFun g := sorry
/- Check `parabolicDescent.wholeGroup`: the trivial-radical integral is the original value. -/
example {Λ : Type u} [CommGroup Λ]
    (K : OpenSubgroup G) (d : SatakeDatum A LeviDecomposition.self K Λ)
    (μ : HaarMeasureWithValues G A) (f : HeckeAlgebra μ) (g : G) :
    (parabolicDescent LeviDecomposition.self μ d.haar 1 (by sorry) f).toFun ⟨g, trivial⟩ =
      f.toFun g := sorry

theorem parabolicDescent.torus {Λ : Type u} [CommGroup Λ]
    (L : LeviDecomposition (G := G)) (K : OpenSubgroup G) (d : SatakeDatum A L K Λ)
    (μ : HaarMeasureWithValues G A) (θ : Λ →* Aˣ) (hθ : IsSmoothCharacter (θ.comp d.lattice))
    (f : SphericalHeckeFunctions μ K) (m : L.M) :
    (parabolicDescent L μ d.haar (θ.comp d.lattice) hθ f.val).toFun m =
      (normalizeSatake θ (satakeTransform L K d μ f)).coeff (d.lattice m) := sorry
/- Check `parabolicDescent.torus`: descent to the torus has the same normalization as Satake. -/
example {Λ : Type u} [CommGroup Λ]
    (L : LeviDecomposition (G := G)) (K : OpenSubgroup G) (d : SatakeDatum A L K Λ)
    (μ : HaarMeasureWithValues G A) (θ : Λ →* Aˣ) (hθ : IsSmoothCharacter (θ.comp d.lattice))
    (f : SphericalHeckeFunctions μ K) (m : L.M) :
    (parabolicDescent L μ d.haar (θ.comp d.lattice) hθ f.val).toFun m =
      (normalizeSatake θ (satakeTransform L K d μ f)).coeff (d.lattice m) := sorry

/- Check `parabolicDescent.zero`: normalization does not create support. -/
example (L : LeviDecomposition (G := G))
    (μ : HaarMeasureWithValues G A) (ν : HaarMeasureWithValues L.N A)
    (δhalf : L.M →* Aˣ) (hδ : IsSmoothCharacter δhalf) :
    (parabolicDescent L μ ν δhalf hδ 0).toFun = 0 := sorry
end DescentCarrier


/-! ## Rational parabolics on the pinned reductive Hopf-algebra carrier -/
namespace RationalParabolic
open ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} F)

abbrev Points := WithConv (H →ₐ[F] F)
abbrev Cocharacter := H →ₐc[F] LaurentPolynomial F

/-- The rational Levi decomposition uses Tau Ceti's dynamic parabolic, Levi and limit map. -/
abbrev decomposition (l : Cocharacter H) : LeviDecomposition (G := Points H) where
  P := TauCeti.Cocharacter.parabolic F l
  M := TauCeti.Cocharacter.levi F l
  N := TauCeti.Cocharacter.unipotent F l
  m_le := by sorry
  n_le := by sorry
  closed_P := by sorry
  closed_M := by sorry
  closed_N := by sorry
  projection := (TauCeti.Cocharacter.limit F l).codRestrict _ (by sorry)
  continuous_projection := by sorry
  projection_inclusion := by sorry
  kernel := by sorry

instance (l : Cocharacter H) : LocallyCompactSpace (decomposition H l).N := by sorry
instance (l : Cocharacter H) : TotallyDisconnectedSpace (decomposition H l).N := by sorry
instance (l : Cocharacter H) : T2Space (decomposition H l).N := by sorry
instance (l : Cocharacter H) : LocallyCompactSpace (decomposition H l).M := by sorry
instance (l : Cocharacter H) : TotallyDisconnectedSpace (decomposition H l).M := by sorry
instance (l : Cocharacter H) : T2Space (decomposition H l).M := by sorry

/-- Inverting a cocharacter inverts its value on every unit of every coefficient algebra. -/
def opposite (l : Cocharacter H) : Cocharacter H := sorry

theorem opposite_points (l : Cocharacter H) (B : Type u) [CommRing B] [Algebra F B] (b : Bˣ) :
    TauCeti.Cocharacter.pointsHom B (opposite H l) b =
      TauCeti.Cocharacter.pointsHom B l b⁻¹ := sorry

theorem opposite_levi (l : Cocharacter H) :
    (decomposition H (opposite H l)).M = (decomposition H l).M := sorry

/-- The residue exponent is determined by the rational conjugation module of the radical. -/
def residueModulus (l : Cocharacter H) :
    ResidueModulus (decomposition H l) (Nat.card (𝓀[F])) := sorry

theorem residueModulus_scaling (l : Cocharacter H) (p : (decomposition H l).P) :
    ((modulus (decomposition H l).N ((decomposition H l).normalizerMap p) : ℚˣ) : ℚ) =
      (Nat.card (𝓀[F]) : ℚ) ^
        Multiplicative.toAdd ((residueModulus H l).exponent p) := sorry

/-- The family of rational parabolics includes all cocharacter parabolics. -/
def family : Set (LeviDecomposition (G := Points H)) := Set.range (decomposition H)

/-- Positive complex square-root normalization on rational parabolics. -/
def halfModulus (l : Cocharacter H) : (decomposition H l).P →* ℂˣ :=
  modulusCharacterSqrt (residueModulus H l)
    (Units.mk0 (Real.sqrt (Nat.card (𝓀[F]) : ℝ) : ℂ) (by sorry))
    (by sorry)

theorem halfModulus_smooth (l : Cocharacter H) : IsSmoothCharacter (halfModulus H l) := sorry

theorem halfModulus_positive (l : Cocharacter H) (p : (decomposition H l).P) :
    0 < Complex.re (halfModulus H l p : ℂ) ∧ Complex.im (halfModulus H l p : ℂ) = 0 := sorry

/-- Properness of the flag quotient is used exactly at rational parabolics of a reductive group. -/
theorem compact_quotient (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) : CompactSpace (Points H ⧸ (decomposition H l).P) := sorry

end RationalParabolic

section CategoricalProperties
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]

theorem locallyProfinite_iff_compactOpenBasis [T2Space G] :
    (LocallyCompactSpace G ∧ TotallyDisconnectedSpace G) ↔
      ∀ S ∈ nhds (1 : G), ∃ U : OpenSubgroup G,
        IsCompact (U : Set G) ∧ (U : Set G) ⊆ S := sorry

theorem locallyProfinite_iff_nonarchimedean [T2Space G] :
    (LocallyCompactSpace G ∧ TotallyDisconnectedSpace G) ↔
      (LocallyCompactSpace G ∧ NonarchimedeanGroup G) := sorry

theorem SmoothRep.mono_iff_injective {V W : SmoothRep A G} (f : V ⟶ W) :
    Mono f ↔ Function.Injective f.hom.hom := sorry

theorem SmoothRep.epi_iff_surjective {V W : SmoothRep A G} (f : V ⟶ W) :
    Epi f ↔ Function.Surjective f.hom.hom := sorry

theorem SmoothRep.inclusion_exact :
    Limits.PreservesFiniteLimits (SmoothRep.ι A G) ∧
      Limits.PreservesFiniteColimits (SmoothRep.ι A G) := sorry

theorem SmoothRep.inclusion_colimits :
    Limits.PreservesColimitsOfSize.{u,u} (SmoothRep.ι A G) := sorry

theorem SmoothRep.invariants_leftExact (U : Subgroup G) :
    Limits.PreservesFiniteLimits (SmoothRep.invariantsFunctor (A := A) U) := sorry

theorem SmoothRep.invariants_exact (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup) :
    Limits.PreservesFiniteLimits (SmoothRep.invariantsFunctor (A := A) U.toSubgroup) ∧
      Limits.PreservesFiniteColimits (SmoothRep.invariantsFunctor (A := A) U.toSubgroup) := sorry

theorem SmoothRep.invariants_colimits (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup) :
    Limits.PreservesColimitsOfSize.{u,u} (SmoothRep.invariantsFunctor (A := A) U.toSubgroup) := sorry

theorem HasUnitProOrder.closed_subgroup [T2Space G] [TotallyDisconnectedSpace G]
    (K K' : Subgroup G) (hc : IsCompact (K : Set G)) (hclosed : IsClosed (K' : Set G))
    (hle : K' ≤ K) (hu : HasUnitProOrder A K) : HasUnitProOrder A K' := sorry

theorem HasUnitProOrder.iff_open_index (K : Subgroup G) (hc : IsCompact (K : Set G)) :
    HasUnitProOrder A K ↔ ∀ U : OpenSubgroup K, IsUnit (U.toSubgroup.index : A) := sorry

theorem Representation.averaging_natural {V W : Type u}
    [AddCommGroup V] [Module A V] [AddCommGroup W] [Module A W]
    (ρ : Representation A G V) (σ : Representation A G W)
    (hρ : Representation.IsSmooth ρ) (hσ : Representation.IsSmooth σ)
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup)
    (f : Representation.IntertwiningMap (ρ.comp U.toSubgroup.subtype)
      (σ.comp U.toSubgroup.subtype)) :
    f.toLinearMap.comp (Representation.averaging ρ hρ U hc hu) =
      (Representation.averaging σ hσ U hc hu).comp f.toLinearMap := sorry

theorem Representation.averaging_ker {V : Type u} [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) (hρ : Representation.IsSmooth ρ)
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup) :
    LinearMap.ker (Representation.averaging ρ hρ U hc hu) =
      Submodule.span A {w | ∃ u : U, ∃ v : V, w = ρ u v - v} := sorry

theorem Representation.averaging_nested {V : Type u} [AddCommGroup V] [Module A V]
    (ρ : Representation A G V) (hρ : Representation.IsSmooth ρ)
    (U U' : OpenSubgroup G) (hc : IsCompact (U : Set G)) (hc' : IsCompact (U' : Set G))
    (hu : HasUnitProOrder A U.toSubgroup) (hu' : HasUnitProOrder A U'.toSubgroup)
    (hle : U' ≤ U) :
    (Representation.averaging ρ hρ U hc hu).comp (Representation.averaging ρ hρ U' hc' hu') =
      Representation.averaging ρ hρ U hc hu ∧
    (Representation.averaging ρ hρ U' hc' hu').comp (Representation.averaging ρ hρ U hc hu) =
      Representation.averaging ρ hρ U hc hu := sorry

theorem Representation.IsAdmissible.prod {V W : Type u}
    [AddCommGroup V] [Module A V] [AddCommGroup W] [Module A W]
    (ρ : Representation A G V) (σ : Representation A G W)
    (hρ : Representation.IsAdmissible ρ) (hσ : Representation.IsAdmissible σ) :
    Representation.IsAdmissible (ρ.prod σ) := sorry

theorem IsSmoothCharacter.inv (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    IsSmoothCharacter χ⁻¹ := sorry

theorem SmoothRep.twist_composition (χ ψ : G →* Aˣ)
    (hχ : IsSmoothCharacter χ) (hψ : IsSmoothCharacter ψ) :
    Nonempty (SmoothRep.twistFunctor χ hχ ⋙ SmoothRep.twistFunctor ψ hψ ≅
      SmoothRep.twistFunctor (χ * ψ) (IsSmoothCharacter.mul hχ hψ)) := sorry

theorem SmoothRep.twist_inverse (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    Nonempty (SmoothRep.twistFunctor χ hχ ⋙
      SmoothRep.twistFunctor χ⁻¹ (IsSmoothCharacter.inv χ hχ) ≅ 𝟭 (SmoothRep A G)) := sorry

theorem SmoothRep.twist_exact (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    Limits.PreservesFiniteLimits (SmoothRep.twistFunctor χ hχ) ∧
      Limits.PreservesFiniteColimits (SmoothRep.twistFunctor χ hχ) := sorry

theorem SmoothRep.twist_invariants (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ)
    (U : Subgroup G) (hU : U ≤ χ.ker) (V : SmoothRep A G) :
    SmoothRep.invariants U (SmoothRep.twist V χ hχ) = SmoothRep.invariants U V := sorry

theorem SmoothCentre.ext_permutation [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (z w : SmoothCentre A G)
    (h : ∀ U : OpenSubgroup G, IsCompact (U : Set G) →
      z.app (SmoothRep.permutation U) = w.app (SmoothRep.permutation U)) : z = w := sorry

theorem Representation.fg_iff_permutation_quotient [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] (V : SmoothRep A G) :
    Representation.IsFinitelyGenerated V.obj.ρ ↔
      ∃ (n : ℕ) (U : Fin n → OpenSubgroup G),
        (∀ i, IsCompact (U i : Set G)) ∧
        ∃ f : (DirectSum (Fin n) (fun i => A[G ⧸ (U i).toSubgroup])) →ₗ[A] V.obj.V,
          Function.Surjective f ∧
          ∀ (i : Fin n) (g : G) (v : A[G ⧸ (U i).toSubgroup]),
            f (DirectSum.lof A (Fin n) (fun j => A[G ⧸ (U j).toSubgroup]) i
              (Representation.ofMulAction A G (G ⧸ (U i).toSubgroup) g v)) =
            V.obj.ρ g (f (DirectSum.lof A (Fin n)
              (fun j => A[G ⧸ (U j).toSubgroup]) i v)) := sorry

variable [TopologicalSpace A] [DiscreteTopology A]

/-- The discrete topology on each module, with the original representation operators. -/
def SmoothRep.toDiscrete : SmoothRep A G ⥤ TauCeti.SmoothDiscreteTopRep A G := sorry

theorem SmoothRep.toDiscrete_carrier (V : SmoothRep A G) :
    ∃ e : ((SmoothRep.toDiscrete.obj V).obj).V ≃ₗ[A] V.obj.V,
      ∀ g v, e (((SmoothRep.toDiscrete.obj V).obj).ρ g v) = V.obj.ρ g (e v) := sorry

theorem SmoothRep.toDiscrete_equivalence :
    (SmoothRep.toDiscrete (A := A) (G := G)).IsEquivalence := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.toDiscrete_trivial (V : ModuleCat A) (g : G) :
    ((SmoothRep.toDiscrete.obj (SmoothRep.trivial (G := G) V)).obj).ρ g = 1 := sorry

/- Check `SmoothRep.toDiscrete_trivial`: the trivial object remains trivial. -/
example (V : ModuleCat A) (g : G) :
    ((SmoothRep.toDiscrete.obj (SmoothRep.trivial (G := G) V)).obj).ρ g = 1 := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.toDiscrete_zero : Subsingleton ((SmoothRep.toDiscrete.obj
    (SmoothRep.trivial (G := G) (ModuleCat.of A (Fin 0 → A)))).obj).V := sorry

/- Check `SmoothRep.toDiscrete_zero`: the zero module remains zero. -/
example : Subsingleton ((SmoothRep.toDiscrete.obj
    (SmoothRep.trivial (G := G) (ModuleCat.of A (Fin 0 → A)))).obj).V := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.toDiscrete_discrete [DiscreteTopology G] (V : Rep A G) :
    ∃ W : TauCeti.SmoothDiscreteTopRep A G,
      Nonempty (W.obj.V ≃ₗ[A] V.V) := sorry

/- Check `SmoothRep.toDiscrete_discrete`: for discrete G every representation is allowed. -/
example [DiscreteTopology G] (V : Rep A G) :
    ∃ W : TauCeti.SmoothDiscreteTopRep A G,
      Nonempty (W.obj.V ≃ₗ[A] V.V) := sorry

end CategoricalProperties

section FieldDuality
variable {k G : Type u} [Field k] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

theorem SmoothRep.toDoubleDual_injective (hG : HasCofinalUnitProOrder k G)
    (V : SmoothRep k G) : Function.Injective (SmoothRep.toDoubleDual V).hom.hom := sorry

theorem SmoothRep.toDoubleDual_iso_iff (hG : HasCofinalUnitProOrder k G)
    (V : SmoothRep k G) : IsIso (SmoothRep.toDoubleDual V) ↔
      Representation.IsAdmissible V.obj.ρ := sorry

theorem SmoothRep.smoothDual_exact (hG : HasCofinalUnitProOrder k G) :
    Limits.PreservesFiniteLimits (SmoothRep.smoothDualFunctor (A := k) (G := G)) ∧
      Limits.PreservesFiniteColimits (SmoothRep.smoothDualFunctor (A := k) (G := G)) := sorry
end FieldDuality

section CohomologyComparison
attribute [local instance] HasDerivedCategory.standard
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]

theorem SmoothRep.derivedInvariants_iso_rHom (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (V : CochainComplex (SmoothRep A G) ℤ) :
    Nonempty ((SmoothRep.derivedInvariantsUnbounded U.toSubgroup).obj (DerivedCategory.Q.obj V) ≅
      DerivedCategory.Q.obj (SmoothRep.rHom
        ((HomologicalComplex.single (SmoothRep A G) (ComplexShape.up ℤ) 0).obj
          (SmoothRep.permutation U)) V)) := sorry

theorem SmoothRep.rHom_permutation (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (V : CochainComplex (SmoothRep A G) ℤ) :
    Nonempty (DerivedCategory.Q.obj (SmoothRep.rHom
      ((HomologicalComplex.single (SmoothRep A G) (ComplexShape.up ℤ) 0).obj
        (SmoothRep.permutation U)) V) ≅
      (SmoothRep.derivedInvariantsUnbounded U.toSubgroup).obj (DerivedCategory.Q.obj V)) := sorry

theorem SmoothRep.permutation_projective (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hu : HasUnitProOrder A U.toSubgroup) :
    Projective (SmoothRep.permutation (A := A) U) := sorry

theorem SmoothRep.derivedInvariants_detect_zero (hG : HasCofinalUnitProOrder A G)
    (V : DerivedCategory (SmoothRep A G))
    (hV : ∀ (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
      (hu : HasUnitProOrder A U.toSubgroup),
      Limits.IsZero ((SmoothRep.derivedInvariantsUnbounded U.toSubgroup).obj V)) :
    Limits.IsZero V := sorry

variable [TopologicalSpace A] [DiscreteTopology A]

theorem SmoothRep.homology_derivedInvariants_iso_continuousCohomology
    [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) (V : SmoothRep A G) (n : ℕ) :
    Nonempty (SmoothRep.invariantCohomology U.toSubgroup V n ≃ₗ[A]
      continuousCohomology n
        ((SmoothRep.toDiscrete.obj
          ((SmoothRep.res U.toSubgroup.subtype continuous_subtype_val).obj V)).obj)) := sorry
end CohomologyComparison

section DiscreteDerivedComparison
attribute [local instance] HasDerivedCategory.standard
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [DiscreteTopology G]

/-- The canonical comparison with the group-algebra category, through the inclusion. -/
abbrev SmoothRep.toGroupAlgebra : SmoothRep A G ⥤ ModuleCat A[G] :=
  SmoothRep.ι A G ⋙ Rep.equivalenceModuleMonoidAlgebra.functor

theorem SmoothRep.rHom_discrete_compat [Finite G]
    (V W : CochainComplex (SmoothRep A G) ℤ) :
    ∃ I : CochainComplex (ModuleCat A[G]) ℤ,
      ∃ f : (SmoothRep.toGroupAlgebra.mapHomologicalComplex (ComplexShape.up ℤ)).obj W ⟶ I,
      QuasiIso f ∧ I.IsKInjective ∧
      Nonempty (((forget₂ (ModuleCat A) AddCommGrpCat).mapHomologicalComplex
        (ComplexShape.up ℤ)).obj (SmoothRep.rHom V W) ≅
        CochainComplex.HomComplex
          ((SmoothRep.toGroupAlgebra.mapHomologicalComplex (ComplexShape.up ℤ)).obj V) I) := sorry

/- Check `SmoothRep.rHom_discrete_compat`: use the actual group-algebra equivalence. -/
example [Finite G] (V W : CochainComplex (SmoothRep A G) ℤ) :
    ∃ I : CochainComplex (ModuleCat A[G]) ℤ,
      ∃ f : (SmoothRep.toGroupAlgebra.mapHomologicalComplex (ComplexShape.up ℤ)).obj W ⟶ I,
      QuasiIso f ∧ I.IsKInjective ∧
      Nonempty (((forget₂ (ModuleCat A) AddCommGrpCat).mapHomologicalComplex
        (ComplexShape.up ℤ)).obj (SmoothRep.rHom V W) ≅
        CochainComplex.HomComplex
          ((SmoothRep.toGroupAlgebra.mapHomologicalComplex (ComplexShape.up ℤ)).obj V) I) := sorry
end DiscreteDerivedComparison

namespace RationalParabolic
open ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} F)

/-- The opposite parabolic with exactly the same Levi subgroup as the original. -/
abbrev oppositeDecomposition (l : Cocharacter H) : LeviDecomposition (G := Points H) where
  P := (decomposition H (opposite H l)).P
  M := (decomposition H l).M
  N := (decomposition H (opposite H l)).N
  m_le := by sorry
  n_le := (decomposition H (opposite H l)).n_le
  closed_P := (decomposition H (opposite H l)).closed_P
  closed_M := (decomposition H l).closed_M
  closed_N := (decomposition H (opposite H l)).closed_N
  projection := (TauCeti.Cocharacter.limit F (opposite H l)).codRestrict _ (by sorry)
  continuous_projection := by sorry
  projection_inclusion := by sorry
  kernel := by sorry

def halfModulusM (l : Cocharacter H) : (decomposition H l).M →* ℂˣ :=
  (halfModulus H l).comp (Subgroup.inclusion (decomposition H l).m_le)

abbrev induction (l : Cocharacter H) :
    SmoothRep ℂ (decomposition H l).M ⥤ SmoothRep ℂ (Points H) :=
  SmoothRep.parabolicIndFunctor (decomposition H l) (halfModulus H l) (halfModulus_smooth H l)

abbrev restriction (l : Cocharacter H) :
    SmoothRep ℂ (Points H) ⥤ SmoothRep ℂ (decomposition H l).M :=
  SmoothRep.normalizedJacquetFunctor (decomposition H l) (halfModulusM H l) (by sorry)

abbrev oppositeRestriction (l : Cocharacter H) :
    SmoothRep ℂ (Points H) ⥤ SmoothRep ℂ (decomposition H l).M :=
  SmoothRep.normalizedJacquetFunctor (oppositeDecomposition H l)
    (halfModulusM H l)⁻¹ (by sorry)

/-- The open multiplication cell for the two opposite unipotent radicals. -/
def bigCell (l : Cocharacter H) : Set (Points H) :=
  {g | ∃ b : (decomposition H l).P, ∃ n : (oppositeDecomposition H l).N,
    g = b.val * n.val}

/-- Extension by zero of the induced section on the open multiplication cell. -/
def bigCellSection (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (V : SmoothRep ℂ (decomposition H l).M)
    (f : LocallyConstantCompact (oppositeDecomposition H l).N V.obj.V) :
    ((induction H l).obj V).obj.V := sorry

theorem bigCellSection_apply (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (V : SmoothRep ℂ (decomposition H l).M)
    (f : LocallyConstantCompact (oppositeDecomposition H l).N V.obj.V)
    (b : (decomposition H l).P) (n : (oppositeDecomposition H l).N) :
    (bigCellSection H hH l V f).val.val (b.val * n.val) =
      (halfModulus H l b : ℂ) • V.obj.ρ ((decomposition H l).projection b) (f.toFun n) := sorry

theorem bigCellSection_outside (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (V : SmoothRep ℂ (decomposition H l).M)
    (f : LocallyConstantCompact (oppositeDecomposition H l).N V.obj.V)
    (g : Points H) (hg : g ∉ bigCell H l) :
    (bigCellSection H hH l V f).val.val g = 0 := sorry

/-- Second adjunction on all rational parabolics, normalized by the opposite radical measure. -/
def secondAdjunction (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) : induction H l ⊣ oppositeRestriction H l := sorry

abbrev secondAdjunctionUnit (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) := (secondAdjunction H hH l μ hμ).unit

abbrev secondAdjunctionCounit (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) := (secondAdjunction H hH l μ hμ).counit

abbrev secondAdjunctionHomEquiv (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) := (secondAdjunction H hH l μ hμ).homEquiv

theorem secondAdjunctionUnit_integral (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) (V : SmoothRep ℂ (decomposition H l).M)
    (f : LocallyConstantCompact (oppositeDecomposition H l).N V.obj.V) :
    ((secondAdjunctionUnit H hH l μ hμ).app V).hom.hom (μ.integrateModule f) =
      Representation.Coinvariants.mk
        (((induction H l).obj V).obj.ρ.comp (oppositeDecomposition H l).N.subtype)
        (bigCellSection H hH l V f) := sorry

theorem secondAdjunctionUnit_injective (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) (V : SmoothRep ℂ (decomposition H l).M) :
    Function.Injective ((secondAdjunctionUnit H hH l μ hμ).app V).hom.hom := sorry

theorem secondAdjunction_left_triangle (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) (W : SmoothRep ℂ (Points H)) :
    (secondAdjunctionUnit H hH l μ hμ).app ((oppositeRestriction H l).obj W) ≫
      (oppositeRestriction H l).map ((secondAdjunctionCounit H hH l μ hμ).app W) = 𝟙 _ := sorry

theorem secondAdjunction_right_triangle (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) (V : SmoothRep ℂ (decomposition H l).M) :
    (induction H l).map ((secondAdjunctionUnit H hH l μ hμ).app V) ≫
      (secondAdjunctionCounit H hH l μ hμ).app ((induction H l).obj V) = 𝟙 _ := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.RationalParabolic.secondAdjunction_zero (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) (V : SmoothRep ℂ (decomposition H l).M)
    (hV : Limits.IsZero V) : IsIso ((secondAdjunctionUnit H hH l μ hμ).app V) := sorry

/- Check `RationalParabolic.secondAdjunction_zero`: the unit on zero is invertible. -/
example (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) (V : SmoothRep ℂ (decomposition H l).M)
    (hV : Limits.IsZero V) : IsIso ((secondAdjunctionUnit H hH l μ hμ).app V) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.RationalParabolic.secondAdjunction_self (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (hl : (decomposition H l).P = ⊤)
    (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) (V : SmoothRep ℂ (decomposition H l).M)
    (W : SmoothRep ℂ (Points H)) :
    IsIso ((secondAdjunctionUnit H hH l μ hμ).app V) ∧
      IsIso ((secondAdjunctionCounit H hH l μ hμ).app W) := sorry

/- Check `RationalParabolic.secondAdjunction_self`: for the full parabolic the unit and counit are invertible. -/
example (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (hl : (decomposition H l).P = ⊤)
    (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) (V : SmoothRep ℂ (decomposition H l).M)
    (W : SmoothRep ℂ (Points H)) :
    IsIso ((secondAdjunctionUnit H hH l μ hμ).app V) ∧
      IsIso ((secondAdjunctionCounit H hH l μ hμ).app W) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.RationalParabolic.secondAdjunction_injective (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) (V : SmoothRep ℂ (decomposition H l).M) :
    Function.Injective ((secondAdjunctionUnit H hH l μ hμ).app V).hom.hom := sorry

/- Check `RationalParabolic.secondAdjunction_injective`: no admissibility on the inducing object. -/
example (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0) (V : SmoothRep ℂ (decomposition H l).M) :
    Function.Injective ((secondAdjunctionUnit H hH l μ hμ).app V).hom.hom := sorry

theorem jacquet_duality (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (V : SmoothRep ℂ (Points H)) :
    Nonempty ((oppositeRestriction H l).obj (SmoothRep.smoothDual V) ≅
      SmoothRep.smoothDual ((restriction H l).obj V)) := sorry

theorem induction_projective (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (V : SmoothRep ℂ (decomposition H l).M) [Projective V] :
    Projective ((induction H l).obj V) := sorry

theorem jacquet_products (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (J : Type) : Limits.PreservesLimitsOfShape (Discrete J)
      (oppositeRestriction H l) := sorry

theorem irreducible_admissible (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (Points H)) (hi : Representation.IsIrreducible V.obj.ρ) :
    Representation.IsAdmissible V.obj.ρ := sorry

theorem irreducible_end (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (Points H)) (hi : Representation.IsIrreducible V.obj.ρ) :
    ∀ f : V ⟶ V, ∃! c : ℂ, f = c • 𝟙 V := sorry

theorem irreducible_centralCharacter (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (Points H)) (hi : Representation.IsIrreducible V.obj.ρ) :
    ∃ χ : Subgroup.center (Points H) →* ℂˣ,
      ∀ z v, V.obj.ρ z.val v = (χ z : ℂ) • v := sorry

theorem uniform_admissibility (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (K : OpenSubgroup (Points H)) (hc : IsCompact (K : Set (Points H))) :
    ∃ c : ℕ, ∀ V : SmoothRep ℂ (Points H), Representation.IsIrreducible V.obj.ρ →
      Module.finrank ℂ (SmoothRep.invariants K.toSubgroup V) ≤ c := sorry

theorem finiteLength_of_fg_admissible (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (Points H)) (hf : Representation.IsFinitelyGenerated V.obj.ρ)
    (ha : Representation.IsAdmissible V.obj.ρ) : IsFiniteLength ℂ[Points H] V.obj.ρ.asModule := sorry

theorem induction_finiteLength (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (V : SmoothRep ℂ (decomposition H l).M)
    (hf : IsFiniteLength ℂ[(decomposition H l).M] V.obj.ρ.asModule)
    (ha : Representation.IsAdmissible V.obj.ρ) :
    IsFiniteLength ℂ[Points H] ((induction H l).obj V).obj.ρ.asModule := sorry

theorem fg_noetherian (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (Points H)) (hf : Representation.IsFinitelyGenerated V.obj.ρ) :
    IsNoetherian ℂ[Points H] V.obj.ρ.asModule := sorry

theorem induction_fg (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (V : SmoothRep ℂ (decomposition H l).M)
    (hf : Representation.IsFinitelyGenerated V.obj.ρ) :
    Representation.IsFinitelyGenerated ((induction H l).obj V).obj.ρ := sorry

theorem jacquet_fg (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (V : SmoothRep ℂ (Points H))
    (hf : Representation.IsFinitelyGenerated V.obj.ρ) :
    Representation.IsFinitelyGenerated ((restriction H l).obj V).obj.ρ := sorry

/-- Minimal rational parabolic, ordered by inclusion of its rational point subgroups. -/
def IsMinimal (l : Cocharacter H) : Prop :=
  ∀ m : Cocharacter H, (decomposition H m).P ≤ (decomposition H l).P →
    (decomposition H m).P = (decomposition H l).P

abbrev steinberg (l : Cocharacter H) : SmoothRep ℂ (Points H) :=
  SmoothRep.steinberg (decomposition H l).P (Set.range fun m : Cocharacter H => (decomposition H m).P)

theorem steinberg_irreducible (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : Cocharacter H) (hl : IsMinimal H l) :
    Representation.IsIrreducible (steinberg H l).obj.ρ := sorry

theorem steinberg_isSquareIntegrable (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    [LocallyCompactSpace (Points H ⧸ Subgroup.center (Points H))]
    (l : Cocharacter H) (hl : IsMinimal H l) :
    SmoothRep.IsSquareIntegrable (steinberg H l) := sorry

end RationalParabolic

section CornerCentres
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]

/-- Compact open subgroups on which averaging is defined over the given ring. -/
abbrev UnitLevel (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G] :=
  {U : OpenSubgroup G // IsCompact (U : Set G) ∧ HasUnitProOrder A U.toSubgroup}

abbrev HeckeAlgebraLevel.basis (U : Subgroup G) (g : G) :=
  (Representation.ofMulAction A G (G ⧸ U)).asModuleEquiv.symm
    (MonoidAlgebra.single (QuotientGroup.mk g) (1 : A))

/-- The quotient map of permutation modules for nested subgroups. -/
def HeckeAlgebraLevel.projection (U U' : Subgroup G) (hle : U' ≤ U) :
    (Representation.ofMulAction A G (G ⧸ U')).asModule →ₗ[A[G]]
      (Representation.ofMulAction A G (G ⧸ U)).asModule := sorry

theorem HeckeAlgebraLevel.projection_basis (U U' : Subgroup G) (hle : U' ≤ U) (g : G) :
    HeckeAlgebraLevel.projection (A := A) U U' hle (HeckeAlgebraLevel.basis U' g) =
      HeckeAlgebraLevel.basis U g := sorry

/-- The normalized transfer splitting the quotient of permutation modules. -/
def HeckeAlgebraLevel.transfer (U U' : UnitLevel A G) (hle : U'.val ≤ U.val) :
    (Representation.ofMulAction A G (G ⧸ U.val.toSubgroup)).asModule →ₗ[A[G]]
      (Representation.ofMulAction A G (G ⧸ U'.val.toSubgroup)).asModule := sorry

theorem HeckeAlgebraLevel.transfer_basis (U U' : UnitLevel A G) (hle : U'.val ≤ U.val)
    [Fintype (U.val ⧸ U'.val.toSubgroup.subgroupOf U.val.toSubgroup)]
    (r : U.val ⧸ U'.val.toSubgroup.subgroupOf U.val.toSubgroup → U.val)
    (hr : ∀ x, QuotientGroup.mk (r x) = x) (g : G) :
    (Nat.card (U.val ⧸ U'.val.toSubgroup.subgroupOf U.val.toSubgroup) : A) •
      HeckeAlgebraLevel.transfer U U' hle (HeckeAlgebraLevel.basis U.val.toSubgroup g) =
      ∑ x, HeckeAlgebraLevel.basis U'.val.toSubgroup (g * (r x).val) := sorry

/-- Compression of a central endomorphism along the normalized transfer. -/
def SmoothCentre.cornerCentreTransition (U U' : UnitLevel A G) (hle : U'.val ≤ U.val) :
    Subring.center (HeckeAlgebraLevel A G U'.val.toSubgroup) →+*
      Subring.center (HeckeAlgebraLevel A G U.val.toSubgroup) := sorry

theorem SmoothCentre.cornerCentreTransition_apply (U U' : UnitLevel A G)
    (hle : U'.val ≤ U.val) (z : Subring.center (HeckeAlgebraLevel A G U'.val.toSubgroup)) :
    (SmoothCentre.cornerCentreTransition U U' hle z).val =
      (HeckeAlgebraLevel.projection U.val.toSubgroup U'.val.toSubgroup hle).comp
        (z.val.comp (HeckeAlgebraLevel.transfer U U' hle)) := sorry

theorem SmoothCentre.cornerCentreTransition_self (U : UnitLevel A G)
    (z : Subring.center (HeckeAlgebraLevel A G U.val.toSubgroup)) :
    SmoothCentre.cornerCentreTransition U U le_rfl z = z := sorry

theorem SmoothCentre.cornerCentreTransition_comp (U V W : UnitLevel A G)
    (hVU : V.val ≤ U.val) (hWV : W.val ≤ V.val)
    (z : Subring.center (HeckeAlgebraLevel A G W.val.toSubgroup)) :
    SmoothCentre.cornerCentreTransition U V hVU
      (SmoothCentre.cornerCentreTransition V W hWV z) =
    SmoothCentre.cornerCentreTransition U W (le_trans hWV hVU) z := sorry

/-- The inverse limit as the subring of compatible central endomorphisms. -/
def SmoothCentre.cornerLimit :
    Subring (∀ U : UnitLevel A G, Subring.center (HeckeAlgebraLevel A G U.val.toSubgroup)) where
  carrier := {z | ∀ U V h, SmoothCentre.cornerCentreTransition U V h (z V) = z U}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry
  mul_mem' := by sorry

def SmoothCentre.equivLimCornerCentre [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (hG : HasCofinalUnitProOrder A G) :
    SmoothCentre A G ≃+* SmoothCentre.cornerLimit (A := A) (G := G) := sorry

theorem SmoothCentre.equivLimCornerCentre_apply [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] (hG : HasCofinalUnitProOrder A G)
    (z : SmoothCentre A G) (U : UnitLevel A G) :
    (((SmoothCentre.equivLimCornerCentre hG z).val U).val) =
      Representation.IntertwiningMap.equivAlgEnd _ (z.app (SmoothRep.permutation U.val)).hom.hom := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.cornerCentreTransition_identity (U : UnitLevel A G) (z : Subring.center (HeckeAlgebraLevel A G U.val.toSubgroup)) :
    SmoothCentre.cornerCentreTransition U U le_rfl z = z := sorry

/- Check `SmoothCentre.cornerCentreTransition_identity`: equal levels give the identity. -/
example (U : UnitLevel A G) (z : Subring.center (HeckeAlgebraLevel A G U.val.toSubgroup)) :
    SmoothCentre.cornerCentreTransition U U le_rfl z = z := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.cornerCentreTransition_scalar (U U' : UnitLevel A G) (hle : U'.val ≤ U.val) (a : A) :
    (SmoothCentre.cornerCentreTransition U U' hle ⟨a • 1, by sorry⟩).val = a • 1 := sorry

/- Check `SmoothCentre.cornerCentreTransition_scalar`: compression preserves scalar operators. -/
example (U U' : UnitLevel A G) (hle : U'.val ≤ U.val) (a : A) :
    (SmoothCentre.cornerCentreTransition U U' hle ⟨a • 1, by sorry⟩).val = a • 1 := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.cornerCentreTransition_sign (U U' : UnitLevel ℚ (Multiplicative (ZMod 2)))
    (hU : U.val.toSubgroup = ⊤) (hU' : U'.val.toSubgroup = ⊥)
    (z : Subring.center (HeckeAlgebraLevel ℚ (Multiplicative (ZMod 2)) U'.val.toSubgroup))
    (hz : ∀ g, z.val (HeckeAlgebraLevel.basis U'.val.toSubgroup g) =
      (1/2 : ℚ) • (HeckeAlgebraLevel.basis U'.val.toSubgroup g -
        HeckeAlgebraLevel.basis U'.val.toSubgroup (g * Multiplicative.ofAdd 1))) :
    SmoothCentre.cornerCentreTransition U U' (by sorry) z = 0 := sorry

/- Check `SmoothCentre.cornerCentreTransition_sign`: the sign projector disappears at full level. -/
example (U U' : UnitLevel ℚ (Multiplicative (ZMod 2)))
    (hU : U.val.toSubgroup = ⊤) (hU' : U'.val.toSubgroup = ⊥)
    (z : Subring.center (HeckeAlgebraLevel ℚ (Multiplicative (ZMod 2)) U'.val.toSubgroup))
    (hz : ∀ g, z.val (HeckeAlgebraLevel.basis U'.val.toSubgroup g) =
      (1/2 : ℚ) • (HeckeAlgebraLevel.basis U'.val.toSubgroup g -
        HeckeAlgebraLevel.basis U'.val.toSubgroup (g * Multiplicative.ofAdd 1))) :
    SmoothCentre.cornerCentreTransition U U' (by sorry) z = 0 := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.cornerLimit_trivial : Nonempty (SmoothCentre.cornerLimit (A := A) (G := PUnit) ≃+* A) := sorry

/- Check `SmoothCentre.cornerLimit_trivial`: the inverse limit for the point is the coefficient ring. -/
example : Nonempty (SmoothCentre.cornerLimit (A := A) (G := PUnit) ≃+* A) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.cornerLimit_finite [Finite G] [DiscreteTopology G] :
    Nonempty (SmoothCentre.cornerLimit (A := A) (G := G) ≃+* Subring.center A[G]) := sorry

/- Check `SmoothCentre.cornerLimit_finite`: the bottom level determines a finite discrete group. -/
example [Finite G] [DiscreteTopology G] :
    Nonempty (SmoothCentre.cornerLimit (A := A) (G := G) ≃+* Subring.center A[G]) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.cornerLimit_laurent {R : Type} [CommRing R] : Nonempty (SmoothCentre.cornerLimit (A := R) (G := Multiplicative ℤ) ≃+*
    LaurentPolynomial R) := sorry

/- Check `SmoothCentre.cornerLimit_laurent`: the discrete infinite cyclic case is Laurent polynomials. -/
example {R : Type} [CommRing R] : Nonempty (SmoothCentre.cornerLimit (A := R) (G := Multiplicative ℤ) ≃+*
    LaurentPolynomial R) := sorry

variable {B : Type u} [CommRing B] [Algebra A B]

/-- Coefficient extension of the compatible central endomorphisms of permutation modules. -/
def SmoothCentre.coeffChange [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (hG : HasCofinalUnitProOrder A G) : SmoothCentre A G →+* SmoothCentre B G := sorry

theorem SmoothCentre.coeffChange_apply [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (hG : HasCofinalUnitProOrder A G) (z : SmoothCentre A G)
    (V : SmoothRep A G) (b : B) (v : V.obj.V) :
    ((SmoothCentre.coeffChange hG z).app ((SmoothRep.baseChange (B := B)).obj V)).hom.hom
      (b ⊗ₜ[A] v) = b ⊗ₜ[A] (z.app V).hom.hom v := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.coeffChange_identity [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (hG : HasCofinalUnitProOrder A G) (z : SmoothCentre A G) :
    SmoothCentre.coeffChange (B := A) hG z = z := sorry

/- Check `SmoothCentre.coeffChange_identity`: extension by the identity preserves the action. -/
example [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (hG : HasCofinalUnitProOrder A G) (z : SmoothCentre A G) :
    SmoothCentre.coeffChange (B := A) hG z = z := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.coeffChange_scalar [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (hG : HasCofinalUnitProOrder A G) (a : A) :
    SmoothCentre.coeffChange (B := B) hG (a • 1) = (algebraMap A B a) • 1 := sorry

/- Check `SmoothCentre.coeffChange_scalar`: scalars map by the coefficient homomorphism. -/
example [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]
    (hG : HasCofinalUnitProOrder A G) (a : A) :
    SmoothCentre.coeffChange (B := B) hG (a • 1) = (algebraMap A B a) • 1 := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.coeffChange_characteristic : SmoothCentre.coeffChange (A := ℤ) (B := ZMod 2) (G := PUnit) (by sorry) 2 = 0 := sorry

/- Check `SmoothCentre.coeffChange_characteristic`: the scalar 2 vanishes after reduction modulo 2. -/
example : SmoothCentre.coeffChange (A := ℤ) (B := ZMod 2) (G := PUnit) (by sorry) 2 = 0 := sorry

end CornerCentres

section DerivedTensor
attribute [local instance] HasDerivedCategory.standard
open scoped MonoidalCategory
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]

/-- Diagonal tensor product, on the library representation tensor product. -/
def SmoothRep.tensor (V W : SmoothRep A G) : SmoothRep A G :=
  ⟨Rep.of (V.obj.ρ.tprod W.obj.ρ), by sorry⟩

/-- Internal Hom is the smooth part of the library conjugation representation on linear maps. -/
abbrev SmoothRep.internalHom (V W : SmoothRep A G) : SmoothRep A G :=
  (SmoothRep.smoothPart A G).obj ((Rep.ihom V.obj).obj W.obj)

theorem SmoothRep.tensorHomEquiv (U V W : SmoothRep A G) :
    Nonempty ((SmoothRep.tensor U V ⟶ W) ≃ₗ[A] (U ⟶ SmoothRep.internalHom V W)) := sorry

instance SmoothRep.smoothPart_additive : (SmoothRep.smoothPart.{u,u} A G).Additive := by sorry

/-- The library's direct-sum total tensor complex, with its Koszul differential. -/
abbrev SmoothRep.tensorComplex (V W : CochainComplex (SmoothRep.{u,u} A G) ℤ) :
    CochainComplex (SmoothRep.{u,u} A G) ℤ :=
  ((SmoothRep.smoothPart A G).mapHomologicalComplex (ComplexShape.up ℤ)).obj
    (HomologicalComplex.tensorObj
      (((SmoothRep.ι A G).mapHomologicalComplex (ComplexShape.up ℤ)).obj V)
      (((SmoothRep.ι A G).mapHomologicalComplex (ComplexShape.up ℤ)).obj W))

/-- K-flatness means that diagonal tensoring preserves acyclic complexes. -/
def SmoothRep.IsKFlat (V : CochainComplex (SmoothRep.{u,u} A G) ℤ) : Prop :=
  ∀ W : CochainComplex (SmoothRep.{u,u} A G) ℤ,
    (∀ n, Limits.IsZero (W.homology n)) →
      ∀ n, Limits.IsZero ((SmoothRep.tensorComplex V W).homology n)

theorem SmoothRep.exists_kFlat (V : CochainComplex (SmoothRep A G) ℤ) :
    ∃ P : CochainComplex (SmoothRep A G) ℤ, ∃ f : P ⟶ V,
      SmoothRep.IsKFlat P ∧ QuasiIso f := sorry

/-- Total left derived diagonal tensor product. -/
def SmoothRep.derivedTensor : DerivedCategory (SmoothRep A G) ⥤
    DerivedCategory (SmoothRep A G) ⥤ DerivedCategory (SmoothRep A G) := sorry

theorem SmoothRep.derivedTensor_obj (P V : CochainComplex (SmoothRep A G) ℤ)
    (hP : SmoothRep.IsKFlat P) :
    Nonempty (((SmoothRep.derivedTensor.obj (DerivedCategory.Q.obj P)).obj
      (DerivedCategory.Q.obj V)) ≅ DerivedCategory.Q.obj (SmoothRep.tensorComplex P V)) := sorry

/-- Derived internal Hom, right adjoint to derived tensor in the smooth category. -/
def SmoothRep.derivedInternalHom : (DerivedCategory (SmoothRep A G))ᵒᵖ ⥤
    DerivedCategory (SmoothRep A G) ⥤ DerivedCategory (SmoothRep A G) := sorry

theorem SmoothRep.derivedTensorHomAdjunction (V : DerivedCategory (SmoothRep A G)) :
    Nonempty (SmoothRep.derivedTensor.obj V ⊣
      SmoothRep.derivedInternalHom.obj (Opposite.op V)) := sorry

theorem SmoothRep.derivedInternalHom_dual (hG : HasCofinalUnitProOrder A G)
    (V : DerivedCategory (SmoothRep A G)) :
    Nonempty (((SmoothRep.derivedInternalHom.obj (Opposite.op V)).obj
      ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj
        (SmoothRep.trivial (ModuleCat.of A A)))) ≅
      (SmoothRep.derivedSmoothDual hG).obj (Opposite.op V)) := sorry

theorem SmoothRep.hom_derivedSmoothDual (hG : HasCofinalUnitProOrder A G)
    (B V : DerivedCategory (SmoothRep A G)) :
    Nonempty ((B ⟶ (SmoothRep.derivedSmoothDual hG).obj (Opposite.op V)) ≃
      (((SmoothRep.derivedTensor.obj B).obj V) ⟶
        (DerivedCategory.singleFunctor (SmoothRep A G) 0).obj
          (SmoothRep.trivial (ModuleCat.of A A)))) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.derivedTensor_unit (V : DerivedCategory (SmoothRep A G)) :
    Nonempty (((SmoothRep.derivedTensor.obj
      ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj
        (SmoothRep.trivial (ModuleCat.of A A)))).obj V) ≅ V) := sorry

/- Check `SmoothRep.derivedTensor_unit`: the rank-one trivial object is the tensor unit. -/
example (V : DerivedCategory (SmoothRep A G)) :
    Nonempty (((SmoothRep.derivedTensor.obj
      ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj
        (SmoothRep.trivial (ModuleCat.of A A)))).obj V) ≅ V) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.derivedTensor_zero (V W : DerivedCategory (SmoothRep A G)) (hV : Limits.IsZero V) :
    Limits.IsZero ((SmoothRep.derivedTensor.obj V).obj W) := sorry

/- Check `SmoothRep.derivedTensor_zero`: tensoring with an acyclic complex is zero. -/
example (V W : DerivedCategory (SmoothRep A G)) (hV : Limits.IsZero V) :
    Limits.IsZero ((SmoothRep.derivedTensor.obj V).obj W) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.derivedTensor_torsion (p : ℕ) [Fact p.Prime] :
    let V := (DerivedCategory.singleFunctor (SmoothRep ℤ PUnit) 0).obj
      (SmoothRep.trivial (ModuleCat.of ℤ (ZMod p)))
    let T := (SmoothRep.derivedTensor.obj V).obj V
    Nonempty (((DerivedCategory.homologyFunctor (SmoothRep ℤ PUnit) (-1)).obj T).obj.V
      ≃ₗ[ℤ] ZMod p) ∧
    Limits.IsZero ((DerivedCategory.homologyFunctor (SmoothRep ℤ PUnit) 1).obj T) := sorry

/- Check `SmoothRep.derivedTensor_torsion`: Tor sits in cohomological degree minus one. -/
example (p : ℕ) [Fact p.Prime] :
    let V := (DerivedCategory.singleFunctor (SmoothRep ℤ PUnit) 0).obj
      (SmoothRep.trivial (ModuleCat.of ℤ (ZMod p)))
    let T := (SmoothRep.derivedTensor.obj V).obj V
    Nonempty (((DerivedCategory.homologyFunctor (SmoothRep ℤ PUnit) (-1)).obj T).obj.V
      ≃ₗ[ℤ] ZMod p) ∧
    Limits.IsZero ((DerivedCategory.homologyFunctor (SmoothRep ℤ PUnit) 1).obj T) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.derivedInternalHom_unit (V : DerivedCategory (SmoothRep A G)) :
    Nonempty (((SmoothRep.derivedInternalHom.obj
      (Opposite.op ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj
        (SmoothRep.trivial (ModuleCat.of A A))))).obj V) ≅ V) := sorry

/- Check `SmoothRep.derivedInternalHom_unit`: Hom out of the tensor unit is the original object. -/
example (V : DerivedCategory (SmoothRep A G)) :
    Nonempty (((SmoothRep.derivedInternalHom.obj
      (Opposite.op ((DerivedCategory.singleFunctor (SmoothRep A G) 0).obj
        (SmoothRep.trivial (ModuleCat.of A A))))).obj V) ≅ V) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.derivedInternalHom_zero (V W : DerivedCategory (SmoothRep A G)) (hW : Limits.IsZero W) :
    Limits.IsZero ((SmoothRep.derivedInternalHom.obj (Opposite.op V)).obj W) := sorry

/- Check `SmoothRep.derivedInternalHom_zero`: Hom into zero is zero. -/
example (V W : DerivedCategory (SmoothRep A G)) (hW : Limits.IsZero W) :
    Limits.IsZero ((SmoothRep.derivedInternalHom.obj (Opposite.op V)).obj W) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.derivedInternalHom_torsion (p : ℕ) [Fact p.Prime] :
    let V := (DerivedCategory.singleFunctor (SmoothRep ℤ PUnit) 0).obj
      (SmoothRep.trivial (ModuleCat.of ℤ (ZMod p)))
    let Z := (DerivedCategory.singleFunctor (SmoothRep ℤ PUnit) 0).obj
      (SmoothRep.trivial (ModuleCat.of ℤ ℤ))
    let D := (SmoothRep.derivedInternalHom.obj (Opposite.op V)).obj Z
    Nonempty (((DerivedCategory.homologyFunctor (SmoothRep ℤ PUnit) 1).obj D).obj.V
      ≃ₗ[ℤ] ZMod p) ∧
    Limits.IsZero ((DerivedCategory.homologyFunctor (SmoothRep ℤ PUnit) 0).obj D) := sorry

/- Check `SmoothRep.derivedInternalHom_torsion`: Ext of integral torsion appears in degree one. -/
example (p : ℕ) [Fact p.Prime] :
    let V := (DerivedCategory.singleFunctor (SmoothRep ℤ PUnit) 0).obj
      (SmoothRep.trivial (ModuleCat.of ℤ (ZMod p)))
    let Z := (DerivedCategory.singleFunctor (SmoothRep ℤ PUnit) 0).obj
      (SmoothRep.trivial (ModuleCat.of ℤ ℤ))
    let D := (SmoothRep.derivedInternalHom.obj (Opposite.op V)).obj Z
    Nonempty (((DerivedCategory.homologyFunctor (SmoothRep ℤ PUnit) 1).obj D).obj.V
      ≃ₗ[ℤ] ZMod p) ∧
    Limits.IsZero ((DerivedCategory.homologyFunctor (SmoothRep ℤ PUnit) 0).obj D) := sorry

end DerivedTensor

section InductionProperties
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

theorem SmoothRep.ind_invariants (H : Subgroup G) (hH : IsClosed (H : Set G))
    (V : SmoothRep A H) (K : OpenSubgroup G) (hc : IsCompact (K : Set G))
    (r : DoubleCoset.Quotient (H : Set G) K.toSubgroup → G)
    (hr : ∀ x, DoubleCoset.mk H K.toSubgroup (r x) = x) :
    ∃ e : SmoothRep.invariants K.toSubgroup (SmoothRep.ind H V) ≃ₗ[A]
      (∀ x, SmoothRep.invariants
        ((K.toSubgroup.map (MulAut.conj (r x)).toMonoidHom).comap H.subtype) V),
      ∀ f x, (e f x).val = f.val.val.val (r x) := sorry

theorem SmoothRep.cInd_invariants (H : Subgroup G) (hH : IsClosed (H : Set G))
    (V : SmoothRep A H) (K : OpenSubgroup G) (hc : IsCompact (K : Set G))
    (r : DoubleCoset.Quotient (H : Set G) K.toSubgroup → G)
    (hr : ∀ x, DoubleCoset.mk H K.toSubgroup (r x) = x) :
    ∃ e : SmoothRep.invariants K.toSubgroup (SmoothRep.cInd H V) ≃ₗ[A]
      DirectSum (DoubleCoset.Quotient (H : Set G) K.toSubgroup)
        (fun x => SmoothRep.invariants
          ((K.toSubgroup.map (MulAut.conj (r x)).toMonoidHom).comap H.subtype) V),
      ∀ f x, (e f x).val = f.val.val.val (r x) := sorry

theorem SmoothRep.cInd_exact (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    Limits.PreservesFiniteLimits (SmoothRep.cIndFunctor (A := A) H) ∧
      Limits.PreservesFiniteColimits (SmoothRep.cIndFunctor (A := A) H) := sorry

theorem SmoothRep.ind_exact_compact (H : Subgroup G) (hH : IsClosed (H : Set G))
    [CompactSpace (G ⧸ H)] :
    Limits.PreservesFiniteLimits (SmoothRep.indFunctor (A := A) H) ∧
      Limits.PreservesFiniteColimits (SmoothRep.indFunctor (A := A) H) := sorry

theorem SmoothRep.ind_exact_unit (H : Subgroup G) (hH : IsClosed (H : Set G))
    (hu : ∀ K : OpenSubgroup H, IsCompact (K : Set H) → HasUnitProOrder A K.toSubgroup) :
    Limits.PreservesFiniteLimits (SmoothRep.indFunctor (A := A) H) ∧
      Limits.PreservesFiniteColimits (SmoothRep.indFunctor (A := A) H) := sorry

theorem SmoothRep.ind_stages (H : Subgroup G) (hH : IsClosed (H : Set G))
    (K : Subgroup H) (hK : IsClosed (K : Set H)) (V : SmoothRep A K) :
    ∃ W : SmoothRep A (K.map H.subtype),
      Nonempty ((SmoothRep.res
        ((Subgroup.equivMapOfInjective K H.subtype Subtype.val_injective).toMonoidHom)
        (by sorry)).obj W ≅ V) ∧
      Nonempty (SmoothRep.ind H (SmoothRep.ind K V) ≅ SmoothRep.ind (K.map H.subtype) W) := sorry

theorem SmoothRep.cInd_stages (H : Subgroup G) (hH : IsClosed (H : Set G))
    (K : Subgroup H) (hK : IsClosed (K : Set H)) (V : SmoothRep A K) :
    ∃ W : SmoothRep A (K.map H.subtype),
      Nonempty ((SmoothRep.res
        ((Subgroup.equivMapOfInjective K H.subtype Subtype.val_injective).toMonoidHom)
        (by sorry)).obj W ≅ V) ∧
      Nonempty (SmoothRep.cInd H (SmoothRep.cInd K V) ≅ SmoothRep.cInd (K.map H.subtype) W) := sorry

theorem SmoothRep.jacquet_colimits (L : LeviDecomposition (G := G)) :
    Limits.PreservesColimitsOfSize.{u,u} (SmoothRep.jacquetFunctor (A := A) L) := sorry

theorem SmoothRep.jacquet_baseChange {B : Type u} [CommRing B] [Algebra A B]
    (L : LeviDecomposition (G := G)) :
    Nonempty (SmoothRep.jacquetFunctor L ⋙ SmoothRep.baseChange (A := A) (B := B) ≅
      SmoothRep.baseChange ⋙ SmoothRep.jacquetFunctor L) := sorry

theorem SmoothRep.jacquet_exact (L : LeviDecomposition (G := G))
    (U : ℕ → OpenSubgroup L.N) (hc : ∀ i, IsCompact (U i : Set L.N))
    (hu : ∀ i, HasUnitProOrder A (U i).toSubgroup) (hm : Monotone U)
    (hex : ∀ n : L.N, ∃ i, n ∈ U i) :
    Limits.PreservesFiniteLimits (SmoothRep.jacquetFunctor (A := A) L) ∧
      Limits.PreservesFiniteColimits (SmoothRep.jacquetFunctor (A := A) L) := sorry

theorem SmoothRep.jacquet_ker_averaging (L : LeviDecomposition (G := G))
    (U : ℕ → OpenSubgroup L.N) (hc : ∀ i, IsCompact (U i : Set L.N))
    (hu : ∀ i, HasUnitProOrder A (U i).toSubgroup) (hm : Monotone U)
    (hex : ∀ n : L.N, ∃ i, n ∈ U i) (V : SmoothRep A G) (v : V.obj.V) :
    Representation.Coinvariants.mk (V.obj.ρ.comp L.N.subtype) v = 0 ↔
      ∃ i, Representation.averaging (V.obj.ρ.comp L.N.subtype) (by sorry)
        (U i) (hc i) (hu i) v = 0 := sorry
end InductionProperties

section DoubleCosetCohomology
attribute [local instance] HasDerivedCategory.standard
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

theorem SmoothRep.derivedHecke_equiv_doubleCoset
    [CategoryTheory.HasExt (SmoothRep A G)] (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (n : ℕ)
    (r : DoubleCoset.Quotient (U.toSubgroup : Set G) U.toSubgroup → G)
    (hr : ∀ x, DoubleCoset.mk U.toSubgroup U.toSubgroup (r x) = x) :
    Nonempty (SmoothRep.derivedHecke (A := A) U n ≃ₗ[A]
      DirectSum (DoubleCoset.Quotient (U.toSubgroup : Set G) U.toSubgroup)
        (fun x => SmoothRep.invariantCohomology
          ((U.toSubgroup.map (MulAut.conj (r x)).toMonoidHom).comap U.toSubgroup.subtype)
          (SmoothRep.trivial (G := U) (ModuleCat.of A A)) n)) := sorry
end DoubleCosetCohomology

section CuspidalData
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

/-- Compactness of every matrix coefficient modulo the full group centre. -/
def SmoothRep.IsCompactModuloCenter (V : SmoothRep ℂ G) : Prop :=
  ∀ (v : V.obj.V) (ℓ : (Representation.smoothDual V.obj.ρ).toSubmodule),
    _root_.IsCompact (closure ((QuotientGroup.mk : G → G ⧸ Subgroup.center G) ''
      Function.support (SmoothRep.matrixCoefficient V v ℓ)))

/-- Compactness of matrix coefficients in the group itself. -/
def SmoothRep.IsCompact (V : SmoothRep ℂ G) : Prop :=
  ∀ (v : V.obj.V) (ℓ : (Representation.smoothDual V.obj.ρ).toSubmodule),
    HasCompactSupport (SmoothRep.matrixCoefficient V v ℓ)

/-- The positive complex square root of the conjugation modulus of the radical. -/
def complexHalfModulus (L : LeviDecomposition (G := G)) : L.P →* ℂˣ := by
  letI : LocallyCompactSpace L.N := by sorry
  exact
    { toFun := fun p => Units.mk0
        (Real.sqrt (((modulus L.N (L.normalizerMap p) : ℚˣ) : ℚ) : ℝ) : ℂ) (by sorry)
      map_one' := by sorry
      map_mul' := by sorry }

theorem complexHalfModulus_smooth (L : LeviDecomposition (G := G)) :
    IsSmoothCharacter (complexHalfModulus L) := sorry

theorem complexHalfModulus_square (L : LeviDecomposition (G := G))
    [LocallyCompactSpace L.N] (p : L.P) :
    (complexHalfModulus L p : ℂ)^2 =
      (((modulus L.N (L.normalizerMap p) : ℚˣ) : ℚ) : ℂ) := sorry

/-- A representation is a subquotient when it is a quotient of an invariant submodule. -/
def SmoothRep.IsSubquotient (V W : SmoothRep ℂ G) : Prop :=
  ∃ S : Subrepresentation W.obj.ρ, ∃ f : Rep.of S.toRepresentation ⟶ V.obj,
    Function.Surjective f.hom

/-- An unquotiented cuspidal datum with its actual Levi and irreducible compact representation. -/
structure SmoothRep.CuspidalPair (P : Set (LeviDecomposition (G := G))) where
  levi : LeviDecomposition (G := G)
  mem : levi ∈ P
  representation : SmoothRep ℂ levi.M
  irreducible : Representation.IsIrreducible representation.obj.ρ
  compact : SmoothRep.IsCompactModuloCenter representation

/-- Conjugacy compares the actual Levi action, not just the underlying vector spaces. -/
def SmoothRep.CuspidalPair.conjugate {P : Set (LeviDecomposition (G := G))}
    (D E : SmoothRep.CuspidalPair P) : Prop :=
  ∃ g : G, ∃ e : D.levi.M ≃* E.levi.M,
    (∀ m, (e m).val = g * m.val * g⁻¹) ∧
    Nonempty (D.representation.obj ≅ Rep.of (E.representation.obj.ρ.comp e.toMonoidHom))

def SmoothRep.CuspidalPair.conjugacy (P : Set (LeviDecomposition (G := G))) :
    Setoid (SmoothRep.CuspidalPair P) where
  r := SmoothRep.CuspidalPair.conjugate
  iseqv := by sorry

abbrev SmoothRep.CuspidalDatum (P : Set (LeviDecomposition (G := G))) :=
  Quotient (SmoothRep.CuspidalPair.conjugacy P)

/-- The set of supports computed by parabolic induction; uniqueness is a theorem. -/
def SmoothRep.cuspidalSupports (P : Set (LeviDecomposition (G := G)))
    (V : SmoothRep ℂ G) : Set (SmoothRep.CuspidalDatum P) :=
  {d | ∃ D : SmoothRep.CuspidalPair P, Quotient.mk _ D = d ∧
    SmoothRep.IsSubquotient V (SmoothRep.parabolicInd D.levi (complexHalfModulus D.levi)
      (complexHalfModulus_smooth D.levi) D.representation)}

/-- Inertia allows both conjugation and an unramified character twist. -/
def SmoothRep.CuspidalPair.inertiallyEquivalent {P : Set (LeviDecomposition (G := G))}
    (D E : SmoothRep.CuspidalPair P) : Prop :=
  ∃ g : G, ∃ e : D.levi.M ≃* E.levi.M,
    (∀ m, (e m).val = g * m.val * g⁻¹) ∧
    ∃ χ : SmoothRep.unramifiedCharacters (G := E.levi.M) ℂ,
      Nonempty (D.representation.obj ≅ Rep.of
        ((Representation.twist E.representation.obj.ρ
          (SmoothRep.unramifiedCharacter χ)).comp e.toMonoidHom))

def SmoothRep.CuspidalPair.inertia (P : Set (LeviDecomposition (G := G))) :
    Setoid (SmoothRep.CuspidalPair P) where
  r := SmoothRep.CuspidalPair.inertiallyEquivalent
  iseqv := by sorry

abbrev SmoothRep.InertialClass (P : Set (LeviDecomposition (G := G))) :=
  Quotient (SmoothRep.CuspidalPair.inertia P)

def SmoothRep.CuspidalDatum.inertialClass {P : Set (LeviDecomposition (G := G))} :
    SmoothRep.CuspidalDatum P → SmoothRep.InertialClass P :=
  Quotient.map id (by sorry)

/-- The unramified orbit of a cuspidal representation as a set of smooth objects. -/
def SmoothRep.cuspidalComponent {P : Set (LeviDecomposition (G := G))}
    (D : SmoothRep.CuspidalPair P) : Set (SmoothRep ℂ D.levi.M) :=
  {V | ∃ χ : SmoothRep.unramifiedCharacters (G := D.levi.M) ℂ,
    Nonempty (V.obj ≅ Rep.of (Representation.twist D.representation.obj.ρ
      (SmoothRep.unramifiedCharacter χ)))}

/-- The group of normalizing elements preserving the unramified orbit. -/
def SmoothRep.inertialNormalizer {P : Set (LeviDecomposition (G := G))}
    (D : SmoothRep.CuspidalPair P) : Subgroup G where
  carrier := {g | ∃ e : D.levi.M ≃* D.levi.M,
    (∀ m, (e m).val = g * m.val * g⁻¹) ∧
    ∃ χ : SmoothRep.unramifiedCharacters (G := D.levi.M) ℂ,
      Nonempty (D.representation.obj ≅ Rep.of
        ((Representation.twist D.representation.obj.ρ
          (SmoothRep.unramifiedCharacter χ)).comp e.toMonoidHom))}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

instance SmoothRep.inertialNormalizer_leviNormal {P : Set (LeviDecomposition (G := G))}
    (D : SmoothRep.CuspidalPair P) :
    (D.levi.M.subgroupOf (SmoothRep.inertialNormalizer D)).Normal := by sorry

abbrev SmoothRep.bernsteinWeylGroup {P : Set (LeviDecomposition (G := G))}
    (D : SmoothRep.CuspidalPair P) :=
  SmoothRep.inertialNormalizer D ⧸ D.levi.M.subgroupOf (SmoothRep.inertialNormalizer D)

/- Check `SmoothRep.bernsteinWeylGroup_supercuspidal`: a full-group Levi has trivial Weyl group. -/
theorem SmoothRep.bernsteinWeylGroup_supercuspidal {P : Set (LeviDecomposition (G := G))}
    (D : SmoothRep.CuspidalPair P) (hD : D.levi.M = ⊤) :
    Subsingleton (SmoothRep.bernsteinWeylGroup D) := sorry

/- Check `SmoothRep.bernsteinWeylGroup_supercuspidal`: a full-group Levi has trivial Weyl group. -/
example {P : Set (LeviDecomposition (G := G))}
    (D : SmoothRep.CuspidalPair P) (hD : D.levi.M = ⊤) :
    Subsingleton (SmoothRep.bernsteinWeylGroup D) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.CuspidalDatum_empty : IsEmpty (SmoothRep.CuspidalDatum (∅ : Set (LeviDecomposition (G := G)))) := sorry

/- Check `SmoothRep.CuspidalDatum_empty`: there are no data without Levi subgroups. -/
example : IsEmpty (SmoothRep.CuspidalDatum (∅ : Set (LeviDecomposition (G := G)))) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.CuspidalDatum_conjugacy {P : Set (LeviDecomposition (G := G))} (D E : SmoothRep.CuspidalPair P)
    (h : SmoothRep.CuspidalPair.conjugate D E) :
    (Quotient.mk _ D : SmoothRep.CuspidalDatum P) = Quotient.mk _ E := sorry

/- Check `SmoothRep.CuspidalDatum_conjugacy`: changing the conjugate representative changes no datum. -/
example {P : Set (LeviDecomposition (G := G))} (D E : SmoothRep.CuspidalPair P)
    (h : SmoothRep.CuspidalPair.conjugate D E) :
    (Quotient.mk _ D : SmoothRep.CuspidalDatum P) = Quotient.mk _ E := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.InertialClass_conjugacy {P : Set (LeviDecomposition (G := G))} (D E : SmoothRep.CuspidalPair P)
    (h : SmoothRep.CuspidalPair.conjugate D E) :
    (Quotient.mk _ D : SmoothRep.InertialClass P) = Quotient.mk _ E := sorry

/- Check `SmoothRep.InertialClass_conjugacy`: conjugate data have the same inertial class. -/
example {P : Set (LeviDecomposition (G := G))} (D E : SmoothRep.CuspidalPair P)
    (h : SmoothRep.CuspidalPair.conjugate D E) :
    (Quotient.mk _ D : SmoothRep.InertialClass P) = Quotient.mk _ E := sorry

end CuspidalData

section RationalCuspidalSupport
open ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} F)

theorem SmoothRep.cuspidalSupport_unique (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hi : Representation.IsIrreducible V.obj.ρ) :
    ∃! d, d ∈ SmoothRep.cuspidalSupports (RationalParabolic.family H) V := sorry

/-- The unique cuspidal support of an irreducible representation of a rational reductive group. -/
def SmoothRep.cuspidalSupport (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hi : Representation.IsIrreducible V.obj.ρ) :
    SmoothRep.CuspidalDatum (RationalParabolic.family H) :=
  Classical.choose (SmoothRep.cuspidalSupport_unique H hH V hi).exists

theorem SmoothRep.cuspidalSupport_spec (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hi : Representation.IsIrreducible V.obj.ρ) (d : SmoothRep.CuspidalDatum (RationalParabolic.family H)) :
    d ∈ SmoothRep.cuspidalSupports (RationalParabolic.family H) V ↔
      SmoothRep.cuspidalSupport H hH V hi = d := sorry

abbrev SmoothRep.inertialSupport (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (RationalParabolic.Points H)) (hi : Representation.IsIrreducible V.obj.ρ) :=
  SmoothRep.CuspidalDatum.inertialClass (SmoothRep.cuspidalSupport H hH V hi)

theorem SmoothRep.isCompactModuloCenter_iff_isQuasiCuspidal
    (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (RationalParabolic.Points H))
    (ha : Representation.IsAdmissible V.obj.ρ) :
    SmoothRep.IsCompactModuloCenter V ↔ SmoothRep.IsQuasiCuspidal (RationalParabolic.family H) V := sorry

theorem SmoothRep.bernsteinWeylGroup_finite (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (D : SmoothRep.CuspidalPair (RationalParabolic.family H)) :
    Finite (SmoothRep.bernsteinWeylGroup D) := sorry

theorem SmoothRep.cuspidalSupport_supercuspidal (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (RationalParabolic.Points H)) (hi : Representation.IsIrreducible V.obj.ρ)
    (hc : SmoothRep.IsQuasiCuspidal (RationalParabolic.family H) V)
    (D : SmoothRep.CuspidalPair (RationalParabolic.family H)) (hD : D.levi.M = ⊤)
    (e : D.levi.M ≃* RationalParabolic.Points H) (he : ∀ m, e m = m.val)
    (hσ : Nonempty (D.representation.obj ≅ Rep.of (V.obj.ρ.comp e.toMonoidHom))) :
    SmoothRep.cuspidalSupport H hH V hi = Quotient.mk _ D := sorry

/- Check `SmoothRep.cuspidalSupport_supercuspidal`: the full-group datum is the support. -/
example (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (RationalParabolic.Points H)) (hi : Representation.IsIrreducible V.obj.ρ)
    (hc : SmoothRep.IsQuasiCuspidal (RationalParabolic.family H) V)
    (D : SmoothRep.CuspidalPair (RationalParabolic.family H)) (hD : D.levi.M = ⊤)
    (e : D.levi.M ≃* RationalParabolic.Points H) (he : ∀ m, e m = m.val)
    (hσ : Nonempty (D.representation.obj ≅ Rep.of (V.obj.ρ.comp e.toMonoidHom))) :
    SmoothRep.cuspidalSupport H hH V hi = Quotient.mk _ D := sorry

end RationalCuspidalSupport

section MirabolicFunctors
open ValuativeRel
variable {F A : Type u} [Field F] [TopologicalSpace F] [ValuativeRel F]
  [IsNonarchimedeanLocalField F] [CommRing A]
namespace BZDerivative

/-- Projection to the upper left block of the mirabolic group. -/
def projection (n : ℕ) : mirabolic (F := F) n →* GL (Fin n) F := sorry

theorem projection_apply (n : ℕ) (g : mirabolic (F := F) n) (i j : Fin n) :
    (projection n g).val i j = g.val.val i.castSucc j.castSucc := sorry

theorem projection_continuous (n : ℕ) : Continuous (projection (F := F) n) := sorry

/-- The last-column vector group, as a subgroup of the mirabolic group. -/
abbrev lastColumn (n : ℕ) : Subgroup (mirabolic (F := F) n) := (projection n).ker

/-- The block diagonal splitting of the mirabolic projection. -/
def inclusion (n : ℕ) : GL (Fin n) F →* mirabolic (F := F) n := sorry

theorem inclusion_apply (n : ℕ) (g : GL (Fin n) F) (i j : Fin (n + 1)) :
    (inclusion n g).val.val i j = if hi : i.val < n then
      if hj : j.val < n then g.val ⟨i.val, hi⟩ ⟨j.val, hj⟩ else 0
      else if i = j then 1 else 0 := sorry

/-- Ordinary last-column coinvariants with the surviving block action. -/
def psiMinus (n : ℕ) : SmoothRep.{u,u} A (mirabolic (F := F) n) ⥤ SmoothRep.{u,u} A (GL (Fin n) F) := sorry

theorem psiMinus_obj (n : ℕ) (V : SmoothRep.{u,u} A (mirabolic (F := F) n)) :
    ∃ e : ((psiMinus n).obj V).obj.V ≃ₗ[A]
      Representation.Coinvariants (V.obj.ρ.comp (lastColumn n).subtype),
      ∀ g v, e (((psiMinus n).obj V).obj.ρ g v) =
        (Representation.Coinvariants.mk _) (V.obj.ρ (inclusion n g)
          (Classical.choose (Submodule.mkQ_surjective _ (e v)))) := sorry

/-- Inflation along the upper-left-block projection. -/
abbrev psiPlus (n : ℕ) : SmoothRep.{u,u} A (GL (Fin n) F) ⥤ SmoothRep.{u,u} A (mirabolic (F := F) n) :=
  SmoothRep.res (projection n) (projection_continuous n)

/-- The character of the last-column radical used in Φ⁻. -/
def lastColumnCharacter (n : ℕ) (ψ : Multiplicative F →* Aˣ) : lastColumn (F := F) (n + 1) →* Aˣ where
  toFun g := ψ (Multiplicative.ofAdd (g.val.val.val (Fin.last n).castSucc (Fin.last (n + 1))))
  map_one' := by sorry
  map_mul' := by sorry

/-- Twisted last-column coinvariants, acted on by the mirabolic stabilizer of ψ. -/
def phiMinus (n : ℕ) (ψ : Multiplicative F →* Aˣ) :
    SmoothRep.{u,u} A (mirabolic (F := F) (n + 1)) ⥤ SmoothRep.{u,u} A (mirabolic (F := F) n) := sorry

theorem phiMinus_obj (n : ℕ) (ψ : Multiplicative F →* Aˣ)
    (V : SmoothRep.{u,u} A (mirabolic (F := F) (n + 1))) :
    ∃ e : ((phiMinus n ψ).obj V).obj.V ≃ₗ[A]
      WhittakerCoinvariants (V.obj.ρ.comp (lastColumn (n + 1)).subtype)
        (lastColumnCharacter n ψ),
      ∀ g v, e.symm (WhittakerCoinvariants.mk _ _
        (V.obj.ρ (inclusion (n + 1) g.val) v)) =
        ((phiMinus n ψ).obj V).obj.ρ g (e.symm (WhittakerCoinvariants.mk _ _ v)) := sorry

/-- The preimage of the smaller mirabolic, the stabilizer used for Φ⁺. -/
abbrev characterStabilizer (n : ℕ) : Subgroup (mirabolic (F := F) (n + 1)) :=
  (mirabolic n).comap (projection (n + 1))

/-- The stabilizer representation extends the smaller mirabolic action by ψ on the radical. -/
def phiExtension (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsSmoothCharacter ψ) :
    SmoothRep.{u,u} A (mirabolic (F := F) n) ⥤ SmoothRep.{u,u} A (characterStabilizer (F := F) n) := sorry

theorem phiExtension_obj (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsSmoothCharacter ψ)
    (V : SmoothRep.{u,u} A (mirabolic (F := F) n)) :
    ∃ e : ((phiExtension n ψ hψ).obj V).obj.V ≃ₗ[A] V.obj.V,
      ∀ g v, e (((phiExtension n ψ hψ).obj V).obj.ρ g v) =
        (ψ (Multiplicative.ofAdd (g.val.val.val (Fin.last n).castSucc (Fin.last (n + 1)))) : A) •
          V.obj.ρ ⟨projection (n + 1) g.val, g.property⟩ (e v) := sorry

/-- Unnormalised compact induction from the character stabilizer. -/
abbrev phiPlus (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsSmoothCharacter ψ) :=
  phiExtension n ψ hψ ⋙ SmoothRep.cIndFunctor (characterStabilizer n)

/-- Unnormalised smooth induction from the character stabilizer. -/
abbrev phiHatPlus (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsSmoothCharacter ψ) :=
  phiExtension n ψ hψ ⋙ SmoothRep.indFunctor (characterStabilizer n)

theorem psiAdjunction (n : ℕ) : Nonempty (psiMinus (A := A) (F := F) n ⊣ psiPlus n) := sorry

theorem psi_composition (n : ℕ) :
    Nonempty (psiPlus (A := A) (F := F) n ⋙ psiMinus n ≅ 𝟭 _) := sorry

/-- Unit character differences are the coefficient hypothesis for the nonzero additive orbit. -/
def IsGenericCharacter (ψ : Multiplicative F →* Aˣ) : Prop :=
  IsSmoothCharacter ψ ∧ ψ ≠ 1 ∧ ∀ x, ψ x ≠ 1 → IsUnit ((ψ x : A) - 1)

theorem phiAdjunction (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ) :
    Nonempty (phiPlus n ψ hψ.1 ⊣ phiMinus n ψ) ∧
    Nonempty (phiMinus n ψ ⊣ phiHatPlus n ψ hψ.1) := sorry

theorem phi_composition (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ) :
    Nonempty (phiPlus n ψ hψ.1 ⋙ phiMinus n ψ ≅ 𝟭 _) ∧
    Nonempty (phiHatPlus n ψ hψ.1 ⋙ phiMinus n ψ ≅ 𝟭 _) := sorry

theorem phi_psi_vanish (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ) :
    (∀ V, Limits.IsZero ((psiMinus (n + 1)).obj ((phiPlus n ψ hψ.1).obj V))) ∧
    ∀ V, Limits.IsZero ((phiMinus n ψ).obj ((psiPlus (n + 1)).obj V)) := sorry

/-- The counit of Φ⁺ ⊣ Φ⁻, determined by this adjunction. -/
def phiCounit (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ) :
    phiMinus n ψ ⋙ phiPlus n ψ hψ.1 ⟶ 𝟭 _ :=
  (Classical.choice (phiAdjunction n ψ hψ).1).counit

/-- The unit of Ψ⁻ ⊣ Ψ⁺. -/
def psiUnit (n : ℕ) : 𝟭 _ ⟶ psiMinus (A := A) (F := F) n ⋙ psiPlus n :=
  (Classical.choice (psiAdjunction n)).unit

theorem mirabolic_shortExact (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ)
    (V : SmoothRep.{u,u} A (mirabolic (F := F) (n + 1))) :
    Mono ((phiCounit n ψ hψ).app V) ∧ Epi ((psiUnit (n + 1)).app V) ∧
      Function.Exact ((phiCounit n ψ hψ).app V).hom.hom ((psiUnit (n + 1)).app V).hom.hom := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.BZDerivative.psiMinus_inflation (n : ℕ) (V : SmoothRep.{u,u} A (GL (Fin n) F)) :
    Nonempty ((psiMinus n).obj ((psiPlus n).obj V) ≅ V) := sorry

/- Check `BZDerivative.psiMinus_inflation`: the full coefficient module survives inflation. -/
example (n : ℕ) (V : SmoothRep.{u,u} A (GL (Fin n) F)) :
    Nonempty ((psiMinus n).obj ((psiPlus n).obj V) ≅ V) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.BZDerivative.psiMinus_zero (n : ℕ) :
    Limits.IsZero ((psiMinus (A := A) (F := F) n).obj (SmoothRep.trivial (ModuleCat.of A (Fin 0 → A)))) := sorry

/- Check `BZDerivative.psiMinus_zero`: the zero representation has zero ordinary derivative. -/
example (n : ℕ) :
    Limits.IsZero ((psiMinus (A := A) (F := F) n).obj (SmoothRep.trivial (ModuleCat.of A (Fin 0 → A)))) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.BZDerivative.psiMinus_trivial (n : ℕ) (M : ModuleCat.{u} A) :
    Nonempty ((psiMinus (F := F) n).obj (SmoothRep.trivial M) ≅ SmoothRep.trivial M) := sorry

/- Check `BZDerivative.psiMinus_trivial`: an arbitrary trivial coefficient module survives. -/
example (n : ℕ) (M : ModuleCat.{u} A) :
    Nonempty ((psiMinus (F := F) n).obj (SmoothRep.trivial M) ≅ SmoothRep.trivial M) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.BZDerivative.phiMinus_inflation (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ)
    (V : SmoothRep.{u,u} A (GL (Fin (n + 1)) F)) :
    Limits.IsZero ((phiMinus n ψ).obj ((psiPlus (n + 1)).obj V)) := sorry

/- Check `BZDerivative.phiMinus_inflation`: the nontrivial character kills an inflated module. -/
example (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ)
    (V : SmoothRep.{u,u} A (GL (Fin (n + 1)) F)) :
    Limits.IsZero ((phiMinus n ψ).obj ((psiPlus (n + 1)).obj V)) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.BZDerivative.phiMinus_zero (n : ℕ) (ψ : Multiplicative F →* Aˣ) :
    Limits.IsZero ((phiMinus n ψ).obj (SmoothRep.trivial (ModuleCat.of A (Fin 0 → A)))) := sorry

/- Check `BZDerivative.phiMinus_zero`: the twisted derivative of zero is zero. -/
example (n : ℕ) (ψ : Multiplicative F →* Aˣ) :
    Limits.IsZero ((phiMinus n ψ).obj (SmoothRep.trivial (ModuleCat.of A (Fin 0 → A)))) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.BZDerivative.phiMinus_compactInduction (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ)
    (V : SmoothRep.{u,u} A (mirabolic (F := F) n)) :
    Nonempty ((phiMinus n ψ).obj ((phiPlus n ψ hψ.1).obj V) ≅ V) := sorry

/- Check `BZDerivative.phiMinus_compactInduction`: the character orbit recovers its inducing module. -/
example (n : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ)
    (V : SmoothRep.{u,u} A (mirabolic (F := F) n)) :
    Nonempty ((phiMinus n ψ).obj ((phiPlus n ψ hψ.1).obj V) ≅ V) := sorry

end BZDerivative
end MirabolicFunctors

section SchwartzModules
open ValuativeRel
variable {F A : Type u} [Field F] [TopologicalSpace F] [ValuativeRel F]
  [IsNonarchimedeanLocalField F] [CommRing A]

/-- The underlying coefficient module functor. -/
abbrev SmoothRep.forgetModule (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    SmoothRep.{u,u} A G ⥤ ModuleCat.{u} A :=
  SmoothRep.ι A G ⋙ forget₂ (Rep A G) (ModuleCat A)

/-- The trivial representation functor, including its action on linear maps. -/
def SmoothRep.trivialFunctor (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    ModuleCat.{u} A ⥤ SmoothRep.{u,u} A G where
  obj := SmoothRep.trivial
  map f := ObjectProperty.homMk (Rep.ofHom
    { toLinearMap := f.hom
      isIntertwining' := by sorry })
  map_id := by sorry
  map_comp := by sorry

namespace BZDerivative
/-- The top mirabolic derivative, with Ψ⁻ following all the Φ⁻ steps. -/
def topFunctor (ψ : Multiplicative F →* Aˣ) : (n : ℕ) →
    SmoothRep.{u,u} A (mirabolic (F := F) n) ⥤ ModuleCat.{u} A
  | 0 => psiMinus 0 ⋙ SmoothRep.forgetModule (GL (Fin 0) F)
  | n + 1 => phiMinus n ψ ⋙ topFunctor ψ n

/-- The iterated compact-induction functor that supplies the Schwartz submodule. -/
def schwartzSource (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ) : (n : ℕ) →
    ModuleCat.{u} A ⥤ SmoothRep.{u,u} A (mirabolic (F := F) n)
  | 0 => SmoothRep.trivialFunctor (mirabolic (F := F) 0)
  | n + 1 => schwartzSource ψ hψ n ⋙ phiPlus n ψ hψ.1

/-- The iterated mirabolic counit. -/
def schwartzMap (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ) (n : ℕ) :
    topFunctor ψ n ⋙ schwartzSource ψ hψ n ⟶ 𝟭 _ := sorry

theorem schwartzMap_successor (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ)
    (n : ℕ) (V : SmoothRep.{u,u} A (mirabolic (F := F) (n + 1))) :
    (schwartzMap ψ hψ (n + 1)).app V =
      (phiPlus n ψ hψ.1).map ((schwartzMap ψ hψ n).app ((phiMinus n ψ).obj V)) ≫
        (phiCounit n ψ hψ).app V := sorry

theorem schwartzMap_zero (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ)
    (V : SmoothRep.{u,u} A (mirabolic (F := F) 0)) :
    Function.Bijective ((schwartzMap ψ hψ 0).app V).hom.hom := sorry

/-- The iteration agrees with the explicit upper-unipotent relation quotient. -/
theorem topFunctor_restriction (ψ : Multiplicative F →* Aˣ) (n : ℕ)
    (V : SmoothRep.{u,u} A (GL (Fin (n + 1)) F)) :
    Nonempty (((topFunctor ψ n).obj
      ((SmoothRep.res (mirabolic n).subtype continuous_subtype_val).obj V)) ≃ₗ[A]
      module (n + 1) (n + 1) ψ V.obj.ρ) := sorry
end BZDerivative

/-- The actual invariant image of the iterated mirabolic counit. -/
def SchwartzSubmodule (ψ : Multiplicative F →* Aˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (n : ℕ) (V : SmoothRep.{u,u} A (BZDerivative.mirabolic (F := F) n)) : Subrepresentation V.obj.ρ where
  toSubmodule := LinearMap.range ((BZDerivative.schwartzMap ψ hψ n).app V).hom.hom.toLinearMap
  apply_mem_toSubmodule := by sorry

namespace SchwartzSubmodule

theorem injective (ψ : Multiplicative F →* Aˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (n : ℕ) (V : SmoothRep.{u,u} A (BZDerivative.mirabolic (F := F) n)) :
    Function.Injective ((BZDerivative.schwartzMap ψ hψ n).app V).hom.hom := sorry

theorem derivative (ψ : Multiplicative F →* Aˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (n : ℕ) (V : SmoothRep.{u,u} A (BZDerivative.mirabolic (F := F) n)) :
    Nonempty (((BZDerivative.topFunctor ψ n).obj
      ⟨Rep.of (SchwartzSubmodule ψ hψ n V).toRepresentation, by sorry⟩) ≅
      (BZDerivative.topFunctor ψ n).obj V) := sorry

theorem endomorphisms (ψ : Multiplicative F →* Aˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (n : ℕ) (V : SmoothRep.{u,u} A (BZDerivative.mirabolic (F := F) n)) :
    Nonempty ((Module.End (MonoidAlgebra A (BZDerivative.mirabolic (F := F) n))
      (SchwartzSubmodule ψ hψ n V).toRepresentation.asModule) ≃+*
      Module.End A ((BZDerivative.topFunctor ψ n).obj V)) := sorry

theorem rankOne (ψ : Multiplicative F →* Aˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (V : SmoothRep.{u,u} A (BZDerivative.mirabolic (F := F) 0)) :
    SchwartzSubmodule ψ hψ 0 V = ⊤ := sorry

/- Check `SchwartzSubmodule.rankOne`: rank one has no Φ step and its Schwartz submodule is all of V. -/
example (ψ : Multiplicative F →* Aˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (V : SmoothRep.{u,u} A (BZDerivative.mirabolic (F := F) 0)) :
    SchwartzSubmodule ψ hψ 0 V = ⊤ := sorry

theorem zeroDerivative (ψ : Multiplicative F →* Aˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (n : ℕ) (V : SmoothRep.{u,u} A (BZDerivative.mirabolic (F := F) n))
    (hV : Subsingleton ((BZDerivative.topFunctor ψ n).obj V)) :
    SchwartzSubmodule ψ hψ n V = ⊥ := sorry

/- Check `SchwartzSubmodule.zeroDerivative`: a vanishing top derivative leaves no Schwartz submodule. -/
example (ψ : Multiplicative F →* Aˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (n : ℕ) (V : SmoothRep.{u,u} A (BZDerivative.mirabolic (F := F) n))
    (hV : Subsingleton ((BZDerivative.topFunctor ψ n).obj V)) :
    SchwartzSubmodule ψ hψ n V = ⊥ := sorry

theorem tensor (ψ : Multiplicative F →* Aˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (n : ℕ) (V : SmoothRep.{u,u} A (BZDerivative.mirabolic (F := F) n))
    (M : ModuleCat.{u} A) :
    ∃ e : (M ⊗[A] (SchwartzSubmodule ψ hψ n V).toSubmodule) ≃ₗ[A]
      (SchwartzSubmodule ψ hψ n (SmoothRep.tensor (SmoothRep.trivial M) V)).toSubmodule,
      ∀ m v, (e (m ⊗ₜ[A] v)).val = m ⊗ₜ[A] v.val := sorry

/- Check `SchwartzSubmodule.tensor`: tensoring an arbitrary coefficient module preserves the canonical image. -/
example (ψ : Multiplicative F →* Aˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (n : ℕ) (V : SmoothRep.{u,u} A (BZDerivative.mirabolic (F := F) n))
    (M : ModuleCat.{u} A) :
    ∃ e : (M ⊗[A] (SchwartzSubmodule ψ hψ n V).toSubmodule) ≃ₗ[A]
      (SchwartzSubmodule ψ hψ n (SmoothRep.tensor (SmoothRep.trivial M) V)).toSubmodule,
      ∀ m v, (e (m ⊗ₜ[A] v)).val = m ⊗ₜ[A] v.val := sorry

end SchwartzSubmodule
end SchwartzModules

namespace PadicGL2
variable (p : ℕ) [Fact p.Prime]

instance totallyDisconnectedSpace : TotallyDisconnectedSpace (Group p) := by sorry

/-- The two standard Levi decompositions of GL₂. -/
def standardParabolics : Set (LeviDecomposition (G := Group p)) :=
  {levi p, LeviDecomposition.self}

/-- The cuspidal pair attached to a diagonal character. -/
def characterDatum (χ : diagonal p →* ℂˣ) (hχ : IsSmoothCharacter χ) :
    SmoothRep.CuspidalPair (standardParabolics p) where
  levi := levi p
  mem := by sorry
  representation := SmoothRep.ofCharacter χ hχ
  irreducible := by sorry
  compact := by sorry

/-- The inverse half modulus on the diagonal torus. -/
def inverseHalf : diagonal p →* ℂˣ :=
  ((halfModulus p).comp
    { toFun := fun m => ⟨m.val, (levi p).m_le m.property⟩
      map_one' := by sorry
      map_mul' := by sorry })⁻¹

theorem inverseHalf_smooth : IsSmoothCharacter (inverseHalf p) := sorry
end PadicGL2

theorem SmoothRep.cuspidalSupport_trivial_gl2 (p : ℕ) [Fact p.Prime] :
    SmoothRep.cuspidalSupports (PadicGL2.standardParabolics p)
      (SmoothRep.trivial (ModuleCat.of ℂ ℂ)) =
      {Quotient.mk _ (PadicGL2.characterDatum p (PadicGL2.inverseHalf p)
        (PadicGL2.inverseHalf_smooth p))} := sorry

/- Check `SmoothRep.cuspidalSupport_trivial_gl2`: the trivial representation has inverse-half-modulus support. -/
example (p : ℕ) [Fact p.Prime] :
    SmoothRep.cuspidalSupports (PadicGL2.standardParabolics p)
      (SmoothRep.trivial (ModuleCat.of ℂ ℂ)) =
      {Quotient.mk _ (PadicGL2.characterDatum p (PadicGL2.inverseHalf p)
        (PadicGL2.inverseHalf_smooth p))} := sorry

theorem SmoothRep.cuspidalSupport_steinberg_gl2 (p : ℕ) [Fact p.Prime] :
    SmoothRep.cuspidalSupports (PadicGL2.standardParabolics p)
      (SmoothRep.steinberg (A := ℂ) (PadicGL2.borel p) {PadicGL2.borel p, ⊤}) =
      {Quotient.mk _ (PadicGL2.characterDatum p (PadicGL2.inverseHalf p)
        (PadicGL2.inverseHalf_smooth p))} := sorry

/- Check `SmoothRep.cuspidalSupport_steinberg_gl2`: Steinberg and the trivial representation share cuspidal support. -/
example (p : ℕ) [Fact p.Prime] :
    SmoothRep.cuspidalSupports (PadicGL2.standardParabolics p)
      (SmoothRep.steinberg (A := ℂ) (PadicGL2.borel p) {PadicGL2.borel p, ⊤}) =
      {Quotient.mk _ (PadicGL2.characterDatum p (PadicGL2.inverseHalf p)
        (PadicGL2.inverseHalf_smooth p))} := sorry

theorem SmoothRep.inertialSupport_trivial_steinberg (p : ℕ) [Fact p.Prime] :
    SmoothRep.CuspidalDatum.inertialClass ''
      SmoothRep.cuspidalSupports (PadicGL2.standardParabolics p)
        (SmoothRep.trivial (ModuleCat.of ℂ ℂ)) =
    SmoothRep.CuspidalDatum.inertialClass ''
      SmoothRep.cuspidalSupports (PadicGL2.standardParabolics p)
        (SmoothRep.steinberg (A := ℂ) (PadicGL2.borel p) {PadicGL2.borel p, ⊤}) := sorry

/- Check `SmoothRep.inertialSupport_trivial_steinberg`: the shared support also gives the same inertial class. -/
example (p : ℕ) [Fact p.Prime] :
    SmoothRep.CuspidalDatum.inertialClass ''
      SmoothRep.cuspidalSupports (PadicGL2.standardParabolics p)
        (SmoothRep.trivial (ModuleCat.of ℂ ℂ)) =
    SmoothRep.CuspidalDatum.inertialClass ''
      SmoothRep.cuspidalSupports (PadicGL2.standardParabolics p)
        (SmoothRep.steinberg (A := ℂ) (PadicGL2.borel p) {PadicGL2.borel p, ⊤}) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.bernsteinWeylGroup_unramified (p : ℕ) [Fact p.Prime] :
    Nat.card (SmoothRep.bernsteinWeylGroup (PadicGL2.characterDatum p 1 (by sorry))) = 2 := sorry

/- Check `SmoothRep.bernsteinWeylGroup_unramified`: the unramified GL₂ torus datum has the two-element Weyl group. -/
example (p : ℕ) [Fact p.Prime] :
    Nat.card (SmoothRep.bernsteinWeylGroup (PadicGL2.characterDatum p 1 (by sorry))) = 2 := sorry

theorem CasselmanCriterion.wall (p : ℕ) [Fact p.Prime]
    (χ : PadicGL2.diagonal p →* ℂˣ) (hχ : IsSmoothCharacter χ)
    (hu : ∀ a, ‖(χ a : ℂ)‖ = 1) :
    SmoothRep.IsTempered (PadicGL2.casselmanData p)
      (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p) (SmoothRep.ofCharacter χ hχ)) ∧
    ¬ SmoothRep.IsSquareIntegrable
      (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p) (SmoothRep.ofCharacter χ hχ)) := sorry

/- Check `CasselmanCriterion.wall`: unitary principal series satisfy the weak inequality and fail the strict one. -/
example (p : ℕ) [Fact p.Prime] (χ : PadicGL2.diagonal p →* ℂˣ)
    (hχ : IsSmoothCharacter χ) (hu : ∀ a, ‖(χ a : ℂ)‖ = 1) :
    SmoothRep.IsTempered (PadicGL2.casselmanData p)
      (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p) (SmoothRep.ofCharacter χ hχ)) ∧
    ¬ SmoothRep.IsSquareIntegrable
      (SmoothRep.parabolicInd (PadicGL2.levi p) (PadicGL2.halfModulus p)
        (PadicGL2.halfModulus_smooth p) (SmoothRep.ofCharacter χ hχ)) := sorry

section CompactControls
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.IsCompact_finite [Finite G] (V : SmoothRep ℂ G) : SmoothRep.IsCompact V := sorry

/- Check `SmoothRep.IsCompact_finite`: finite groups have compactly supported coefficients. -/
example [Finite G] (V : SmoothRep ℂ G) : SmoothRep.IsCompact V := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.IsCompact_zero (V : SmoothRep ℂ G) [Subsingleton V.obj.V] : SmoothRep.IsCompact V := sorry

/- Check `SmoothRep.IsCompact_zero`: all coefficients of zero vanish. -/
example (V : SmoothRep ℂ G) [Subsingleton V.obj.V] : SmoothRep.IsCompact V := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.IsCompact_noncompact [T2Space G] : SmoothRep.IsCompact (SmoothRep.trivial (G := G) (ModuleCat.of ℂ ℂ)) ↔
    CompactSpace G := sorry

/- Check `SmoothRep.IsCompact_noncompact`: a nonzero trivial line is compact exactly when G is compact. -/
example [T2Space G] : SmoothRep.IsCompact (SmoothRep.trivial (G := G) (ModuleCat.of ℂ ℂ)) ↔
    CompactSpace G := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.IsCompactModuloCenter_finite [Finite G] (V : SmoothRep ℂ G) : SmoothRep.IsCompactModuloCenter V := sorry

/- Check `SmoothRep.IsCompactModuloCenter_finite`: a finite group has compact central quotient. -/
example [Finite G] (V : SmoothRep ℂ G) : SmoothRep.IsCompactModuloCenter V := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.IsCompactModuloCenter_zero (V : SmoothRep ℂ G) [Subsingleton V.obj.V] : SmoothRep.IsCompactModuloCenter V := sorry

/- Check `SmoothRep.IsCompactModuloCenter_zero`: the zero representation has empty coefficient support. -/
example (V : SmoothRep ℂ G) [Subsingleton V.obj.V] : SmoothRep.IsCompactModuloCenter V := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.IsCompactModuloCenter_torus [IsMulCommutative G] (V : SmoothRep ℂ G) : SmoothRep.IsCompactModuloCenter V := sorry

/- Check `SmoothRep.IsCompactModuloCenter_torus`: an abelian group has one-point central quotient. -/
example [IsMulCommutative G] (V : SmoothRep ℂ G) : SmoothRep.IsCompactModuloCenter V := sorry
end CompactControls

section TorusInertia
variable {G : Type} [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

/-- A character is a full-group cuspidal datum for a torus. -/
def SmoothRep.torusCharacterDatum (χ : G →* ℂˣ) (hχ : IsSmoothCharacter χ) :
    SmoothRep.CuspidalPair ({LeviDecomposition.self} : Set (LeviDecomposition (G := G))) where
  levi := LeviDecomposition.self
  mem := by simp
  representation := SmoothRep.ofCharacter (χ.comp (⊤ : Subgroup G).subtype) (by sorry)
  irreducible := by sorry
  compact := by sorry

theorem SmoothRep.inertialClass_gl1 (χ ψ : G →* ℂˣ)
    (hχ : IsSmoothCharacter χ) (hψ : IsSmoothCharacter ψ) :
    (Quotient.mk _ (SmoothRep.torusCharacterDatum χ hχ) :
      SmoothRep.InertialClass {LeviDecomposition.self}) =
        Quotient.mk _ (SmoothRep.torusCharacterDatum ψ hψ) ↔
      ∀ g ∈ SmoothRep.compactlyGeneratedSubgroup (G := G), χ g = ψ g := sorry

/- Check `SmoothRep.inertialClass_gl1`: inertia of torus characters is equality on the compactly generated subgroup. -/
example (χ ψ : G →* ℂˣ) (hχ : IsSmoothCharacter χ) (hψ : IsSmoothCharacter ψ) :
    (Quotient.mk _ (SmoothRep.torusCharacterDatum χ hχ) :
      SmoothRep.InertialClass {LeviDecomposition.self}) =
        Quotient.mk _ (SmoothRep.torusCharacterDatum ψ hψ) ↔
      ∀ g ∈ SmoothRep.compactlyGeneratedSubgroup (G := G), χ g = ψ g := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.InertialClass_ramified (χ ψ : G →* ℂˣ) (hχ : IsSmoothCharacter χ) (hψ : IsSmoothCharacter ψ)
    (g : G) (hg : g ∈ SmoothRep.compactlyGeneratedSubgroup (G := G)) (h : χ g ≠ ψ g) :
    (Quotient.mk _ (SmoothRep.torusCharacterDatum χ hχ) :
      SmoothRep.InertialClass {LeviDecomposition.self}) ≠
        Quotient.mk _ (SmoothRep.torusCharacterDatum ψ hψ) := sorry

/- Check `SmoothRep.InertialClass_ramified`: different compact-unit values cannot have the same inertial class. -/
example (χ ψ : G →* ℂˣ) (hχ : IsSmoothCharacter χ) (hψ : IsSmoothCharacter ψ)
    (g : G) (hg : g ∈ SmoothRep.compactlyGeneratedSubgroup (G := G)) (h : χ g ≠ ψ g) :
    (Quotient.mk _ (SmoothRep.torusCharacterDatum χ hχ) :
      SmoothRep.InertialClass {LeviDecomposition.self}) ≠
        Quotient.mk _ (SmoothRep.torusCharacterDatum ψ hψ) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.bernsteinWeylGroup_torus (χ : G →* ℂˣ) (hχ : IsSmoothCharacter χ) :
    Subsingleton (SmoothRep.bernsteinWeylGroup (SmoothRep.torusCharacterDatum χ hχ)) := sorry

/- Check `SmoothRep.bernsteinWeylGroup_torus`: a torus character has trivial Bernstein Weyl group. -/
example (χ : G →* ℂˣ) (hχ : IsSmoothCharacter χ) :
    Subsingleton (SmoothRep.bernsteinWeylGroup (SmoothRep.torusCharacterDatum χ hχ)) := sorry
end TorusInertia

section EquivariantSheaves
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Translation of an open subset of the homogeneous space G/H. -/
def cosetTranslateOpen (H : Subgroup G) (g : G) (U : TopologicalSpace.Opens (G ⧸ H)) :
    TopologicalSpace.Opens (G ⧸ H) := ⟨{x | g⁻¹ • x ∈ U}, by sorry⟩

/-- A smooth equivariant sheaf of modules, with action and restriction on all opens.
Local smoothness is continuity of the group action on the discrete stalks. -/
structure EquivariantLSheaf (A : Type u) [CommRing A] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] (H : Subgroup G) where
  sheaf : TopCat.Sheaf (ModuleCat.{u} A) (TopCat.of (G ⧸ H))
  act : ∀ g U, sheaf.obj.obj (Opposite.op U) →ₗ[A]
    sheaf.obj.obj (Opposite.op (cosetTranslateOpen H g U))
  act_one : ∀ U s, HEq (act 1 U s) s
  act_mul : ∀ g h U s, HEq (act g (cosetTranslateOpen H h U) (act h U s)) (act (g * h) U s)
  act_restrict : ∀ g U V (h : V ≤ U) s,
    (sheaf.obj.map (homOfLE (show cosetTranslateOpen H g V ≤ cosetTranslateOpen H g U from by sorry)).op).hom
      (act g U s) = act g V ((sheaf.obj.map (homOfLE h).op).hom s)
  locally_smooth : ∀ U s x, x ∈ U → ∃ V : TopologicalSpace.Opens (G ⧸ H),
    ∃ hV : V ≤ U, x ∈ V ∧ ∃ K : OpenSubgroup G, ∀ k : K,
      cosetTranslateOpen H k.val V = V ∧
      HEq (act k.val V ((sheaf.obj.map (homOfLE hV).op).hom s))
        ((sheaf.obj.map (homOfLE hV).op).hom s)

namespace EquivariantLSheaf
variable {H : Subgroup G}

/-- A morphism commutes with every translated local section. -/
structure Hom (F F' : EquivariantLSheaf A G H) where
  hom : F.sheaf ⟶ F'.sheaf
  commutes : ∀ g U s,
    (hom.hom.app (Opposite.op (cosetTranslateOpen H g U))).hom (F.act g U s) =
      F'.act g U ((hom.hom.app (Opposite.op U)).hom s)

instance : Category (EquivariantLSheaf A G H) where
  Hom := Hom
  id F := ⟨𝟙 F.sheaf, by sorry⟩
  comp f g := ⟨f.hom ≫ g.hom, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

def forget : EquivariantLSheaf A G H ⥤ TopCat.Sheaf (ModuleCat A) (TopCat.of (G ⧸ H)) where
  obj F := F.sheaf
  map f := f.hom
  map_id := by intros; rfl
  map_comp := by intros; rfl

/-- The fibre at the identity coset is the library sheaf stalk. -/
abbrev fibre (F : EquivariantLSheaf A G H) : ModuleCat A :=
  TopCat.Presheaf.stalk F.sheaf.obj (QuotientGroup.mk (1 : G))
end EquivariantLSheaf

variable [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

/-- The induction sheaf with right translation of local equivariant functions. -/
def SmoothRep.indEquivariantSheaf (H : Subgroup G) (hH : IsClosed (H : Set G))
    (V : SmoothRep.{u,u} A H) : EquivariantLSheaf A G H where
  sheaf := SmoothRep.indSheaf H V.obj.ρ
  act g U :=
    { toFun := fun f => ⟨fun x => f.val ⟨x.val * g, by sorry⟩, by sorry⟩
      map_add' := by sorry
      map_smul' := by sorry }
  act_one := by sorry
  act_mul := by sorry
  act_restrict := by sorry
  locally_smooth := by sorry

theorem SmoothRep.indEquivariantSheaf_apply (H : Subgroup G) (hH : IsClosed (H : Set G))
    (V : SmoothRep.{u,u} A H) (g : G) (U : TopologicalSpace.Opens (G ⧸ H))
    (f : InductionSections H V.obj.ρ (U : Set (G ⧸ H)))
    (x : (leftCosetMap H) ⁻¹' (cosetTranslateOpen H g U : Set (G ⧸ H))) :
    ((SmoothRep.indEquivariantSheaf H hH V).act g U f).val x =
      f.val ⟨x.val * g, by sorry⟩ := rfl

/-- Fibre and homogeneous induction are inverse equivalences. -/
def SmoothRep.indSheafEquiv (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    SmoothRep.{u,u} A H ≌ EquivariantLSheaf A G H := sorry

theorem SmoothRep.indSheafEquiv_obj (H : Subgroup G) (hH : IsClosed (H : Set G))
    (V : SmoothRep.{u,u} A H) :
    (SmoothRep.indSheafEquiv H hH).functor.obj V = SmoothRep.indEquivariantSheaf H hH V := sorry

theorem SmoothRep.indSheafEquiv_fibre (H : Subgroup G) (hH : IsClosed (H : Set G))
    (F : EquivariantLSheaf A G H) :
    Nonempty (((SmoothRep.indSheafEquiv H hH).inverse.obj F).obj.V ≃ₗ[A] F.fibre) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.indEquivariantSheaf_point (V : SmoothRep.{u,u} A (⊤ : Subgroup G)) :
    Nonempty ((SmoothRep.indEquivariantSheaf ⊤ (by simp) V).fibre ≃ₗ[A] V.obj.V) := sorry

/- Check `SmoothRep.indEquivariantSheaf_point`: the fibre of induction from G is the inducing module. -/
example (V : SmoothRep.{u,u} A (⊤ : Subgroup G)) :
    Nonempty ((SmoothRep.indEquivariantSheaf ⊤ (by simp) V).fibre ≃ₗ[A] V.obj.V) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.indEquivariantSheaf_zero (H : Subgroup G) (hH : IsClosed (H : Set G)) (V : SmoothRep.{u,u} A H)
    [Subsingleton V.obj.V] (x : G ⧸ H) :
    Subsingleton ((TopCat.Presheaf.stalk (C := ModuleCat.{u} A)
      (SmoothRep.indEquivariantSheaf H hH V).sheaf.obj x) : Type u) := sorry

/- Check `SmoothRep.indEquivariantSheaf_zero`: induction of zero has zero stalk at every point. -/
example (H : Subgroup G) (hH : IsClosed (H : Set G)) (V : SmoothRep.{u,u} A H)
    [Subsingleton V.obj.V] (x : G ⧸ H) :
    Subsingleton ((TopCat.Presheaf.stalk (C := ModuleCat.{u} A)
      (SmoothRep.indEquivariantSheaf H hH V).sheaf.obj x) : Type u) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.indEquivariantSheaf_translation (H : Subgroup G) (hH : IsClosed (H : Set G)) (V : SmoothRep.{u,u} A H)
    (f : InductionSections H V.obj.ρ (⊤ : TopologicalSpace.Opens (G ⧸ H))) (g x : G) :
    ((SmoothRep.indEquivariantSheaf H hH V).act g ⊤ f).val ⟨x, by sorry⟩ =
      f.val ⟨x * g, by simp⟩ := sorry

/- Check `SmoothRep.indEquivariantSheaf_translation`: right translation is retained on global sections. -/
example (H : Subgroup G) (hH : IsClosed (H : Set G)) (V : SmoothRep.{u,u} A H)
    (f : InductionSections H V.obj.ρ (⊤ : TopologicalSpace.Opens (G ⧸ H))) (g x : G) :
    ((SmoothRep.indEquivariantSheaf H hH V).act g ⊤ f).val ⟨x, by sorry⟩ =
      f.val ⟨x * g, by simp⟩ := sorry
end EquivariantSheaves

section AbelianCentre
variable {A G : Type u} [CommRing A] [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Pushforward along the quotient homomorphism, with no averaging factor. -/
def SmoothCentre.groupRingTransition (U V : UnitLevel A G) (h : V.val ≤ U.val) :
    MonoidAlgebra A (G ⧸ V.val.toSubgroup) →+* MonoidAlgebra A (G ⧸ U.val.toSubgroup) :=
  MonoidAlgebra.mapDomainRingHom A
    (QuotientGroup.map V.val.toSubgroup U.val.toSubgroup (MonoidHom.id G) h)

/-- Compatible group-ring elements over compact open subgroups of unit pro-order. -/
def SmoothCentre.groupRingLimit : Subring (∀ U : UnitLevel A G, MonoidAlgebra A (G ⧸ U.val.toSubgroup)) where
  carrier := {x | ∀ U V h, SmoothCentre.groupRingTransition U V h (x V) = x U}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry
  mul_mem' := by sorry

/-- For an abelian group the permutation endomorphism rings are group rings. -/
def SmoothCentre.equivLimGroupRing [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (hG : HasCofinalUnitProOrder A G) :
    SmoothCentre A G ≃+* SmoothCentre.groupRingLimit (A := A) (G := G) := sorry

theorem SmoothCentre.equivLimGroupRing_apply [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] (hG : HasCofinalUnitProOrder A G) (z : SmoothCentre A G) (U : UnitLevel A G) :
    (SmoothCentre.equivLimGroupRing hG z).val U =
      (z.app (SmoothRep.permutation U.val)).hom.hom
        (MonoidAlgebra.single (QuotientGroup.mk (1 : G)) 1) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.groupRingLimit_trivial : Nonempty (SmoothCentre.groupRingLimit (A := A) (G := PUnit) ≃+* A) := sorry

/- Check `SmoothCentre.groupRingLimit_trivial`: the one-point group gives the coefficient ring. -/
example : Nonempty (SmoothCentre.groupRingLimit (A := A) (G := PUnit) ≃+* A) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.groupRingLimit_cyclic {R : Type} [CommRing R] :
    Nonempty (SmoothCentre.groupRingLimit (A := R) (G := Multiplicative ℤ) ≃+* LaurentPolynomial R) := sorry

/- Check `SmoothCentre.groupRingLimit_cyclic`: the discrete infinite cyclic group gives Laurent polynomials. -/
example {R : Type} [CommRing R] :
    Nonempty (SmoothCentre.groupRingLimit (A := R) (G := Multiplicative ℤ) ≃+* LaurentPolynomial R) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.groupRingLimit_finite [Finite G] [DiscreteTopology G] :
    Nonempty (SmoothCentre.groupRingLimit (A := A) (G := G) ≃+* MonoidAlgebra A G) := sorry

/- Check `SmoothCentre.groupRingLimit_finite`: for a finite discrete abelian group the limit is its group algebra. -/
example [Finite G] [DiscreteTopology G] :
    Nonempty (SmoothCentre.groupRingLimit (A := A) (G := G) ≃+* MonoidAlgebra A G) := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothCentre.groupRingTransition_basis (U V : UnitLevel A G) (h : V.val ≤ U.val) (g : G) (a : A) :
    SmoothCentre.groupRingTransition U V h (MonoidAlgebra.single (QuotientGroup.mk g) a) =
      MonoidAlgebra.single (QuotientGroup.mk g) a := sorry

/- Check `SmoothCentre.groupRingTransition_basis`: a delta function maps to the coarser coset without a scalar factor. -/
example (U V : UnitLevel A G) (h : V.val ≤ U.val) (g : G) (a : A) :
    SmoothCentre.groupRingTransition U V h (MonoidAlgebra.single (QuotientGroup.mk g) a) =
      MonoidAlgebra.single (QuotientGroup.mk g) a := sorry
end AbelianCentre

section CentreSeparatedness
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

theorem HeckeAlgebraLevel.separated (ℓ : ℕ)
    (hA : ∀ a : A, (∀ n : ℕ, ∃ b, a = (ℓ : A)^n * b) → a = 0)
    (U : OpenSubgroup G) (z : HeckeAlgebraLevel A G U.toSubgroup)
    (hz : ∀ n : ℕ, ∃ w, z = ℓ^n • w) : z = 0 := sorry

theorem SmoothCentre.separated (hG : HasCofinalUnitProOrder A G) (ℓ : ℕ)
    (hA : ∀ a : A, (∀ n : ℕ, ∃ b, a = (ℓ : A)^n * b) → a = 0)
    (z : SmoothCentre A G) (hz : ∀ n : ℕ, ∃ w, z = ℓ^n • w) : z = 0 := sorry

theorem SmoothCentre.ext_mod_pow (hG : HasCofinalUnitProOrder A G) (ℓ : ℕ)
    (hA : ∀ a : A, (∀ n : ℕ, ∃ b, a = (ℓ : A)^n * b) → a = 0)
    (z w : SmoothCentre A G) (hz : ∀ n : ℕ, ∃ t, z - w = ℓ^n • t) : z = w := sorry
end CentreSeparatedness

section AffineCell
variable (p : ℕ) [Fact p.Prime] {A : Type} [CommRing A]

/-- The affine chart x ↦ B w n(x) of the flag line. -/
def PadicGL2.affineRepresentative (x : ℚ_[p]) : PadicGL2.Group p :=
  { val := !![0, 1; -1, -x]
    inv := !![-x, -1; 1, 0]
    val_inv := by sorry
    inv_val := by sorry }

/-- Right translation on the big cell, including the inducing character on the opposite diagonal. -/
def PadicGL2.affineAction (χ : PadicGL2.borel p →* Aˣ) :
    Representation A (PadicGL2.borel p) (LocallyConstantCompact ℚ_[p] A) where
  toFun b :=
    { toFun f :=
        { toFun := ⟨fun x =>
            (χ ⟨(PadicGL2.diag p (Units.mk0 (b.val.val 1 1) (by sorry))
              (Units.mk0 (b.val.val 0 0) (by sorry))).val, by sorry⟩ : A) *
              f.toFun ((b.val.val 1 1 * x + b.val.val 0 1) / b.val.val 0 0), by sorry⟩
          isCompact_closure_support := by sorry }
      map_add' := by sorry
      map_smul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

theorem SmoothRep.cInd_shortExact_gl2 (χ : PadicGL2.borel p →* Aˣ)
    (hχ : IsSmoothCharacter χ) :
    let V := SmoothRep.ofCharacter χ hχ
    let I := SmoothRep.ind (PadicGL2.borel p) V
    ∃ i : Representation.IntertwiningMap (PadicGL2.affineAction p χ)
      (I.obj.ρ.comp (PadicGL2.borel p).subtype),
      Function.Injective i ∧
      Function.Exact i (fun f : I.obj.V => f.val.val 1) ∧
      Function.Surjective (fun f : I.obj.V => f.val.val 1) ∧
      ∀ f x, (i f).val.val (PadicGL2.affineRepresentative p x) = f.toFun x := sorry

/- Check `SmoothRep.cInd_shortExact_gl2`: the affine-cell kernel has the twisted B action and the quotient is A. -/
example (χ : PadicGL2.borel p →* Aˣ) (hχ : IsSmoothCharacter χ) :
    let V := SmoothRep.ofCharacter χ hχ
    let I := SmoothRep.ind (PadicGL2.borel p) V
    ∃ i : Representation.IntertwiningMap (PadicGL2.affineAction p χ)
      (I.obj.ρ.comp (PadicGL2.borel p).subtype),
      Function.Injective i ∧
      Function.Exact i (fun f : I.obj.V => f.val.val 1) ∧
      Function.Surjective (fun f : I.obj.V => f.val.val 1) ∧
      ∀ f x, (i f).val.val (PadicGL2.affineRepresentative p x) = f.toFun x := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.PadicGL2.affineAction_identity (χ : PadicGL2.borel p →* Aˣ) (f : LocallyConstantCompact ℚ_[p] A) :
    PadicGL2.affineAction p χ 1 f = f := sorry

/- Check `PadicGL2.affineAction_identity`: the identity has no translation or character factor. -/
example (χ : PadicGL2.borel p →* Aˣ) (f : LocallyConstantCompact ℚ_[p] A) :
    PadicGL2.affineAction p χ 1 f = f := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.PadicGL2.affineAction_scalar (χ : PadicGL2.borel p →* Aˣ) (a : ℚ_[p]ˣ) (f : LocallyConstantCompact ℚ_[p] A)
    (x : ℚ_[p]) :
    (PadicGL2.affineAction p χ ⟨(PadicGL2.diag p a a).val, by sorry⟩ f).toFun x =
      (χ ⟨(PadicGL2.diag p a a).val, by sorry⟩ : A) * f.toFun x := sorry

/- Check `PadicGL2.affineAction_scalar`: a central scalar fixes the coordinate and acts by χ. -/
example (χ : PadicGL2.borel p →* Aˣ) (a : ℚ_[p]ˣ) (f : LocallyConstantCompact ℚ_[p] A)
    (x : ℚ_[p]) :
    (PadicGL2.affineAction p χ ⟨(PadicGL2.diag p a a).val, by sorry⟩ f).toFun x =
      (χ ⟨(PadicGL2.diag p a a).val, by sorry⟩ : A) * f.toFun x := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.PadicGL2.affineAction_zero (χ : PadicGL2.borel p →* Aˣ) (b : PadicGL2.borel p) :
    PadicGL2.affineAction p χ b (0 : LocallyConstantCompact ℚ_[p] A) = 0 := sorry

/- Check `PadicGL2.affineAction_zero`: the affine action preserves the zero function. -/
example (χ : PadicGL2.borel p →* Aˣ) (b : PadicGL2.borel p) :
    PadicGL2.affineAction p χ b (0 : LocallyConstantCompact ℚ_[p] A) = 0 := sorry
end AffineCell

section NondegenerateCategory
variable (A H : Type u) [CommRing A] [NonUnitalRing H] [Module A H]
  [IsScalarTower A H H] [SMulCommClass A H H] [IsIdempotented H]

theorem NondegMod.principal_projective (e : H) (he : e * e = e) :
    Projective (NondegMod.principal A H e he) := sorry

theorem NondegMod.principal_finitelyGenerated (e : H) (he : e * e = e) :
    Module.Finite (Unitization A H) (NondegMod.principal A H e he).obj := sorry

theorem NondegMod.principal_generators (M : NondegMod A H) (hM : ¬ Limits.IsZero M) :
    ∃ e : H, ∃ he : e * e = e, ∃ f : NondegMod.principal A H e he ⟶ M, f ≠ 0 := sorry

theorem NondegMod.homProjEquiv_evaluation (e : H) (he : e * e = e)
    (M : NondegMod A H) :
    let b := Classical.choose (NondegMod.principal_carrier A H e he)
    ∃ q : (NondegMod.principal A H e he ⟶ M) ≃
      {m : M.obj // (Unitization.inr e : Unitization A H) • m = m},
      ∀ f, (q f).val = f.hom.hom (b.symm ⟨e, he⟩) := sorry

instance NondegMod.grothendieckAbelian : IsGrothendieckAbelian (NondegMod A H) := by sorry

/-- The largest submodule on which the nonunital algebra acts nondegenerately. -/
def NondegMod.part (M : ModuleCat.{u} (Unitization A H)) : Submodule (Unitization A H) M where
  carrier := {m | ∃ e : H, e * e = e ∧ (Unitization.inr e : Unitization A H) • m = m}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

theorem NondegMod.part_eq_top (M : NondegMod A H) : NondegMod.part A H M.obj = ⊤ := sorry

theorem NondegMod.part_idempotent (M : ModuleCat.{u} (Unitization A H)) :
    NondegMod.part A H (ModuleCat.of _ (NondegMod.part A H M)) = ⊤ := sorry

/-- The bimodule endomorphism ring uses the given A-linear structure and both H actions. -/
def NondegMod.bimoduleEnd : Subring (Module.End A H) where
  carrier := {f | (∀ h x, f (h * x) = h * f x) ∧ ∀ h x, f (x * h) = f x * h}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry
  mul_mem' := by sorry

def NondegMod.centreEquiv : CatCenter (NondegMod A H) ≃+* NondegMod.bimoduleEnd A H := sorry

theorem NondegMod.centreEquiv_principal (z : CatCenter (NondegMod A H))
    (e : H) (he : e * e = e) :
    let b := Classical.choose (NondegMod.principal_carrier A H e he)
    ∀ v, (b ((z.app (NondegMod.principal A H e he)).hom.hom v)).val =
      (NondegMod.centreEquiv A H z).val (b v).val := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.NondegMod.part_nondegenerate (M : NondegMod A H) : NondegMod.part A H M.obj = ⊤ := sorry

/- Check `NondegMod.part_nondegenerate`: a nondegenerate input is unchanged. -/
example (M : NondegMod A H) : NondegMod.part A H M.obj = ⊤ := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.NondegMod.part_zeroAction (M : ModuleCat.{u} (Unitization A H))
    (hM : ∀ h : H, ∀ m : M, (Unitization.inr h : Unitization A H) • m = 0) :
    NondegMod.part A H M = ⊥ := sorry

/- Check `NondegMod.part_zeroAction`: a module annihilated by H has zero nondegenerate part. -/
example (M : ModuleCat.{u} (Unitization A H))
    (hM : ∀ h : H, ∀ m : M, (Unitization.inr h : Unitization A H) • m = 0) :
    NondegMod.part A H M = ⊥ := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.NondegMod.part_zero : NondegMod.part A H (ModuleCat.of _ (Fin 0 → Unitization A H)) = ⊥ := sorry

/- Check `NondegMod.part_zero`: the zero module has zero nondegenerate part. -/
example : NondegMod.part A H (ModuleCat.of _ (Fin 0 → Unitization A H)) = ⊥ := sorry
end NondegenerateCategory

section CentralBlocks
set_option synthInstance.maxHeartbeats 200000
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- A nonzero primitive central idempotent, specifying a single indecomposable block. -/
structure SmoothRep.CentralBlock where
  idempotent : SmoothCentre.{u,u} A G
  square : IsIdempotentElem idempotent
  nonzero : idempotent ≠ 0
  primitive : ∀ f : SmoothCentre.{u,u} A G, IsIdempotentElem f →
    f * idempotent = f → f = 0 ∨ f = idempotent

/-- The invariant image of a central natural endomorphism. -/
def SmoothRep.centralImage (e : SmoothCentre.{u,u} A G) (V : SmoothRep.{u,u} A G) : Subrepresentation V.obj.ρ where
  toSubmodule := LinearMap.range (e.app V).hom.hom.toLinearMap
  apply_mem_toSubmodule := by sorry

/-- Projection to a block, on the actual image submodule. -/
def SmoothRep.blockPart (e : SmoothRep.CentralBlock (A := A) (G := G))
    (V : SmoothRep.{u,u} A G) : SmoothRep.{u,u} A G :=
  ⟨Rep.of (SmoothRep.centralImage e.idempotent V).toRepresentation, by sorry⟩

/-- The block centre is the library idempotent corner in the categorical centre. -/
abbrev SmoothRep.blockCentre (e : SmoothRep.CentralBlock (A := A) (G := G)) := e.square.Corner

instance SmoothRep.blockCentre_commRing (e : SmoothRep.CentralBlock (A := A) (G := G)) :
    CommRing (SmoothRep.blockCentre e) :=
  { (inferInstance : Ring (SmoothRep.blockCentre e)) with mul_comm := by sorry }

theorem SmoothRep.blockPart_identity (e : SmoothRep.CentralBlock (A := A) (G := G))
    (V : SmoothRep.{u,u} A G) (hV : e.idempotent.app V = 𝟙 V) :
    Nonempty (SmoothRep.blockPart e V ≅ V) := sorry

theorem SmoothRep.blockPart_idempotent (e : SmoothRep.CentralBlock (A := A) (G := G))
    (V : SmoothRep.{u,u} A G) :
    e.idempotent.app (SmoothRep.blockPart e V) = 𝟙 _ := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.centralImage_zero (V : SmoothRep.{u,u} A G) : SmoothRep.centralImage 0 V = ⊥ := sorry

/- Check `SmoothRep.centralImage_zero`: the zero central operator has zero image. -/
example (V : SmoothRep.{u,u} A G) : SmoothRep.centralImage 0 V = ⊥ := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.centralImage_identity (V : SmoothRep.{u,u} A G) : SmoothRep.centralImage 1 V = ⊤ := sorry

/- Check `SmoothRep.centralImage_identity`: the identity central operator has full image. -/
example (V : SmoothRep.{u,u} A G) : SmoothRep.centralImage 1 V = ⊤ := sorry

theorem _root_.TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.SmoothRep.centralImage_orthogonal (e f : SmoothCentre.{u,u} A G) (he : IsIdempotentElem e) (hf : IsIdempotentElem f)
    (h : e * f = 0) (V : SmoothRep.{u,u} A G) :
    Disjoint (SmoothRep.centralImage e V) (SmoothRep.centralImage f V) := sorry

/- Check `SmoothRep.centralImage_orthogonal`: orthogonal central idempotents give disjoint images. -/
example (e f : SmoothCentre.{u,u} A G) (he : IsIdempotentElem e) (hf : IsIdempotentElem f)
    (h : e * f = 0) (V : SmoothRep.{u,u} A G) :
    Disjoint (SmoothRep.centralImage e V) (SmoothRep.centralImage f V) := sorry
end CentralBlocks

section UniversalWhittakerModule
open ValuativeRel
variable (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (hpℓ : p ≠ ℓ)
  {F k : Type} [Field F] [TopologicalSpace F] [ValuativeRel F]
  [IsNonarchimedeanLocalField F] [hAlg : Algebra ℚ_[p] F] [hfin : FiniteDimensional ℚ_[p] F]
  [hcont : ContinuousSMul ℚ_[p] F] [Field k] [hkChar : CharP k ℓ]
  [hkClosed : IsAlgClosed k] [hkPerfect : PerfectRing k ℓ]
  (n : ℕ)

namespace UniversalWhittaker
set_option synthInstance.maxHeartbeats 200000
/-- The block summand of compact induction of the nondegenerate upper-unipotent character. -/
def representation (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F)) :
    SmoothRep (WittVector ℓ k) (GL (Fin (n + 1)) F) :=
  SmoothRep.blockPart e (SmoothRep.cInd (BZDerivative.unipotent (n + 1) (n + 1))
    (SmoothRep.ofCharacter (BZDerivative.character (n + 1) (n + 1) ψ) (by sorry)))

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
theorem represents (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    (V : SmoothRep (WittVector ℓ k) (GL (Fin (n + 1)) F))
    (hV : e.idempotent.app V = 𝟙 V) :
    Nonempty ((representation ℓ n ψ hψ e ⟶ V) ≃ₗ[WittVector ℓ k]
      BZDerivative.module (n + 1) (n + 1) ψ V.obj.ρ) := sorry

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
theorem projective (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F)) :
    Projective (representation ℓ n ψ hψ e) := sorry

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
theorem center (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F)) :
    ∃ q : SmoothRep.blockCentre e ≃+* End (representation ℓ n ψ hψ e),
      ∀ z, q z = z.val.app (representation ℓ n ψ hψ e) := sorry

/-- The central action descends to the top derivative. -/
instance derivativeModule (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F)) :
    Module (SmoothRep.blockCentre e)
      (BZDerivative.module (n + 1) (n + 1) ψ (representation ℓ n ψ hψ e).obj.ρ) := by sorry

theorem derivativeModule_mk (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    (z : SmoothRep.blockCentre e) (v : (representation ℓ n ψ hψ e).obj.V) :
    let q := WhittakerCoinvariants.mk
      ((representation ℓ n ψ hψ e).obj.ρ.comp (BZDerivative.unipotent (n + 1) (n + 1)).subtype)
      (BZDerivative.character (n + 1) (n + 1) ψ)
    z • q v = q ((z.val.app (representation ℓ n ψ hψ e)).hom.hom v) := sorry

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
theorem line (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F)) :
    Nonempty (BZDerivative.module (n + 1) (n + 1) ψ (representation ℓ n ψ hψ e).obj.ρ
      ≃ₗ[SmoothRep.blockCentre e] SmoothRep.blockCentre e) := sorry

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
theorem nongeneric (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    (V : SmoothRep (WittVector ℓ k) (GL (Fin (n + 1)) F)) (hV : e.idempotent.app V = 𝟙 V)
    (h : Subsingleton (BZDerivative.module (n + 1) (n + 1) ψ V.obj.ρ)) :
    Subsingleton (representation ℓ n ψ hψ e ⟶ V) := sorry

/- Check `UniversalWhittaker.nongeneric`: zero derivative gives no maps from the block Whittaker projective. -/
include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
example (ψ : Multiplicative F →* (WittVector ℓ k)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    (V : SmoothRep (WittVector ℓ k) (GL (Fin (n + 1)) F)) (hV : e.idempotent.app V = 𝟙 V)
    (h : Subsingleton (BZDerivative.module (n + 1) (n + 1) ψ V.obj.ρ)) :
    Subsingleton (representation ℓ n ψ hψ e ⟶ V) := sorry

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
theorem genericSimple (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    (V : SmoothRep (WittVector ℓ k) (GL (Fin (n + 1)) F)) (hV : e.idempotent.app V = 𝟙 V)
    (hi : Simple V) (hg : Nontrivial (BZDerivative.module (n + 1) (n + 1) ψ V.obj.ρ)) :
    ∃ f : representation ℓ n ψ hψ e ⟶ V, Epi f := sorry

/- Check `UniversalWhittaker.genericSimple`: a generic simple block object is a nonzero quotient. -/
include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
example (ψ : Multiplicative F →* (WittVector ℓ k)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    (V : SmoothRep (WittVector ℓ k) (GL (Fin (n + 1)) F)) (hV : e.idempotent.app V = 𝟙 V)
    (hi : Simple V) (hg : Nontrivial (BZDerivative.module (n + 1) (n + 1) ψ V.obj.ρ)) :
    ∃ f : representation ℓ n ψ hψ e ⟶ V, Epi f := sorry
/-- The block centre acts on the Whittaker module by evaluation of natural endomorphisms. -/
instance representationModule (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F)) :
    Module (SmoothRep.blockCentre e) (representation ℓ n ψ hψ e).obj.V := by sorry

theorem representationModule_apply (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    (z : SmoothRep.blockCentre e) (v : (representation ℓ n ψ hψ e).obj.V) :
    z • v = (z.val.app (representation ℓ n ψ hψ e)).hom.hom v := sorry

/-- The coefficient map to the block centre is scalar multiplication followed by its idempotent. -/
def coefficientMap
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F)) :
    WittVector ℓ k →+* SmoothRep.blockCentre e where
  toFun a := ⟨CategoryTheory.Linear.toCatCenter (WittVector ℓ k)
    (SmoothRep.{0,0} (WittVector ℓ k) (GL (Fin (n + 1)) F)) a * e.idempotent, by sorry⟩
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry

/-- The same group operators, now linear over the block centre. -/
def centerRepresentation (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F)) :
    Representation (SmoothRep.blockCentre e) (GL (Fin (n + 1)) F)
      (representation ℓ n ψ hψ e).obj.V where
  toFun g :=
    { toFun := (representation ℓ n ψ hψ e).obj.ρ g
      map_add' := by sorry
      map_smul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
theorem admissible_overCentre (ψ : Multiplicative F →* (WittVector ℓ k)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F)) :
    Representation.IsAdmissible (centerRepresentation ℓ n ψ hψ e) := sorry

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
theorem baseChange {B : Type*} [CommRing B]
    (ψ : Multiplicative F →* (WittVector ℓ k)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    [Algebra (SmoothRep.blockCentre e) B] :
    Nonempty (BZDerivative.module (n + 1) (n + 1)
      ((Units.map ((algebraMap (SmoothRep.blockCentre e) B).comp (coefficientMap ℓ n e)).toMonoidHom).comp ψ)
      (_root_.Representation.baseChange B (centerRepresentation ℓ n ψ hψ e)) ≃ₗ[B] B) := sorry

/- Check `UniversalWhittaker.baseChange`: the derivative line remains the coefficient ring after a centre map. -/
include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
example {B : Type*} [CommRing B]
    (ψ : Multiplicative F →* (WittVector ℓ k)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    [Algebra (SmoothRep.blockCentre e) B] :
    Nonempty (BZDerivative.module (n + 1) (n + 1)
      ((Units.map ((algebraMap (SmoothRep.blockCentre e) B).comp (coefficientMap ℓ n e)).toMonoidHom).comp ψ)
      (_root_.Representation.baseChange B (centerRepresentation ℓ n ψ hψ e)) ≃ₗ[B] B) := sorry

end UniversalWhittaker
end UniversalWhittakerModule

end
noncomputable section StableLocalization
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
namespace StableOperator
/-- Inverting an endomorphism is the colimit of its nonnegative powers. -/
abbrev localization (T : Module.End R M) :=
  Module.DirectLimit (fun _ : ℕ => M) (fun i j (_ : i ≤ j) => T ^ (j - i))

abbrev localizationMap (T : Module.End R M) : M →ₗ[R] localization T :=
  Module.DirectLimit.of R ℕ (fun _ : ℕ => M) (fun i j (_ : i ≤ j) => T ^ (j - i)) 0

theorem invertiblePart (T : Module.End R M) (h : StableOperator T) :
    ∃ c : ℕ, 0 < c ∧ ∃ e : LinearMap.range (T ^ c) ≃ₗ[R] localization T,
      ∀ x, e x = localizationMap T x.val := sorry

/-- The adjoint acts by precomposition on the actual linear Hom module. -/
def adjoint (T : Module.End R M) (N : Type*) [AddCommGroup N] [Module R N] :
    Module.End R (M →ₗ[R] N) where
  toFun f := f.comp T
  map_add' := by intros; rfl
  map_smul' := by intros; rfl

theorem dual (T : Module.End R M) (h : StableOperator T)
    (N : Type*) [AddCommGroup N] [Module R N] : StableOperator (adjoint T N) := sorry

theorem localization_nilpotent (T : Module.End R M) (c : ℕ) (h : T ^ c = 0) :
    Subsingleton (localization T) := sorry
/- Check `StableOperator.localization_nilpotent`: inverting a nilpotent operator gives zero. -/
example (T : Module.End R M) (c : ℕ) (h : T ^ c = 0) :
    Subsingleton (localization T) := sorry

theorem localization_identity : Nonempty (localization (LinearMap.id : Module.End R M) ≃ₗ[R] M) := sorry
/- Check `StableOperator.localization_identity`: the identity gives the original module. -/
example : Nonempty (localization (LinearMap.id : Module.End R M) ≃ₗ[R] M) := sorry

theorem localization_mixed {N : Type*} [AddCommGroup N] [Module R N]
    (T : Module.End R M) (e : N ≃ₗ[R] N) (c : ℕ) (h : T ^ c = 0) :
    Nonempty (localization (LinearMap.prodMap T e.toLinearMap) ≃ₗ[R] N) := sorry
/- Check `StableOperator.localization_mixed`: only the invertible summand survives. -/
example {N : Type*} [AddCommGroup N] [Module R N]
    (T : Module.End R M) (e : N ≃ₗ[R] N) (c : ℕ) (h : T ^ c = 0) :
    Nonempty (localization (LinearMap.prodMap T e.toLinearMap) ≃ₗ[R] N) := sorry
end StableOperator
end StableLocalization

section CentralFiniteness
variable {A G : Type u} [CommRing A] [IsNoetherianRing A] [Group G]
  [TopologicalSpace G] [IsTopologicalGroup G] [LocallyCompactSpace G]
  [TotallyDisconnectedSpace G] [T2Space G]
theorem ZFinite.subquotient (hG : HasCofinalUnitProOrder A G)
    (V W : SmoothRep.{u,u} A G) (hV : ZFinite A G V)
    (S : Subrepresentation V.obj.ρ)
    (f : Representation.IntertwiningMap S.toRepresentation W.obj.ρ)
    (hf : Function.Surjective f) : ZFinite A G W := sorry
end CentralFiniteness

section UnramifiedIndex
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [TopologicalSpace F] [ValuativeRel F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat F)
theorem SmoothRep.finiteIndex_center_mul (hH : TauCeti.reductiveCommHopfAlgProperty F H) :
    (Subgroup.center (RationalParabolic.Points H) ⊔
      SmoothRep.compactlyGeneratedSubgroup (G := RationalParabolic.Points H)).FiniteIndex := sorry
end UnramifiedIndex

noncomputable section HallLaurent
namespace HallLittlewood
/-- Integer polynomials in t and the coordinates, with all coordinates inverted. -/
abbrev LaurentRing (n : ℕ) := Localization.Away
  (∏ i : Fin n, MvPolynomial.X (some i) : MvPolynomial (Option (Fin n)) ℤ)

instance LaurentRing_domain (n : ℕ) : IsDomain (LaurentRing n) := by sorry

def parameter (n : ℕ) : LaurentRing n :=
  algebraMap (MvPolynomial (Option (Fin n)) ℤ) (LaurentRing n) (MvPolynomial.X none)

def coordinate (n : ℕ) (i : Fin n) : (LaurentRing n)ˣ where
  val := algebraMap (MvPolynomial (Option (Fin n)) ℤ) (LaurentRing n) (MvPolynomial.X (some i))
  inv := IsLocalization.Away.invSelf (S := LaurentRing n)
      (∏ j : Fin n, MvPolynomial.X (some j) : MvPolynomial (Option (Fin n)) ℤ) *
    algebraMap (MvPolynomial (Option (Fin n)) ℤ) (LaurentRing n)
      (∏ j ∈ Finset.univ.erase i, MvPolynomial.X (some j))
  val_inv := by sorry
  inv_val := by sorry

/-- The rational symmetric expression belongs to the integral Laurent subring. -/
theorem integral {n : ℕ} (lam : Fin n → ℤ) (hlam : Antitone lam) :
    ∃ P : LaurentRing n,
      algebraMap (LaurentRing n) (FractionRing (LaurentRing n)) P =
        hallLittlewoodEval lam
          (algebraMap (LaurentRing n) (FractionRing (LaurentRing n)) (parameter n))
          (fun i => algebraMap (LaurentRing n) (FractionRing (LaurentRing n)) (coordinate n i)) := sorry

/-- The integral Laurent polynomial, characterized before specializing its denominators. -/
def polynomial {n : ℕ} (lam : Fin n → ℤ) (hlam : Antitone lam) : LaurentRing n :=
  Classical.choose (integral lam hlam)

theorem polynomial_fraction {n : ℕ} (lam : Fin n → ℤ) (hlam : Antitone lam) :
    algebraMap (LaurentRing n) (FractionRing (LaurentRing n)) (polynomial lam hlam) =
      hallLittlewoodEval lam
        (algebraMap (LaurentRing n) (FractionRing (LaurentRing n)) (parameter n))
        (fun i => algebraMap (LaurentRing n) (FractionRing (LaurentRing n)) (coordinate n i)) := sorry

theorem polynomial_zero (n : ℕ) : polynomial (fun _ : Fin n => 0) (by sorry) = 1 := sorry
/- Check `HallLittlewood.polynomial_zero`: the integral zero-weight polynomial is one, including at poles of the raw expression. -/
example (n : ℕ) : polynomial (fun _ : Fin n => 0) (by sorry) = 1 := sorry

theorem polynomial_rankOne (m : ℤ) :
    polynomial (fun _ : Fin 1 => m) (by sorry) = ((coordinate 1 0) ^ m : (LaurentRing 1)ˣ) := sorry
/- Check `HallLittlewood.polynomial_rankOne`: negative as well as positive rank-one weights give the corresponding Laurent monomial. -/
example (m : ℤ) :
    polynomial (fun _ : Fin 1 => m) (by sorry) = ((coordinate 1 0) ^ m : (LaurentRing 1)ˣ) := sorry

theorem polynomial_minuscule : polynomial (fun i : Fin 2 => if i = 0 then 1 else 0) (by sorry) =
    (coordinate 2 0 : LaurentRing 2) + coordinate 2 1 := sorry
/- Check `HallLittlewood.polynomial_minuscule`: the first rank-two fundamental weight gives X₁ + X₂. -/
example : polynomial (fun i : Fin 2 => if i = 0 then 1 else 0) (by sorry) =
    (coordinate 2 0 : LaurentRing 2) + coordinate 2 1 := sorry
end HallLittlewood
end HallLaurent

noncomputable section Cosocles
variable {k G V : Type u} [Field k] [Group G] [AddCommGroup V] [Module k V]
/-- The intersection of all maximal proper invariant submodules. -/
def Representation.radical (ρ : Representation k G V) : Subrepresentation ρ where
  toSubmodule := sInf ((fun S : Subrepresentation ρ => S.toSubmodule) ''
    {S | Representation.IsIrreducible
      (ρ.quotient S.toSubmodule (fun g => S.apply_mem_toSubmodule g))})
  apply_mem_toSubmodule := by sorry

/-- The maximal semisimple quotient for representations of finite length. -/
abbrev Representation.cosocle (ρ : Representation k G V) :=
  ρ.quotient (Representation.radical ρ).toSubmodule
    (fun g => (Representation.radical ρ).apply_mem_toSubmodule g)

theorem Representation.radical_simple (ρ : Representation k G V)
    (h : Representation.IsIrreducible ρ) : Representation.radical ρ = ⊥ := sorry
/- Check `Representation.radical_simple`: a simple representation has zero radical. -/
example (ρ : Representation k G V) (h : Representation.IsIrreducible ρ) :
    Representation.radical ρ = ⊥ := sorry

theorem Representation.radical_zero :
    Representation.radical (Representation.trivial k G (Fin 0 → k)) = ⊤ := sorry
/- Check `Representation.radical_zero`: the empty intersection on the zero module is its whole zero submodule. -/
example : Representation.radical (Representation.trivial k G (Fin 0 → k)) = ⊤ := sorry

theorem Representation.radical_trivial :
    Representation.radical (Representation.trivial k G (Fin 2 → k)) = ⊥ := sorry
/- Check `Representation.radical_trivial`: a semisimple rank-two trivial representation has zero radical. -/
example : Representation.radical (Representation.trivial k G (Fin 2 → k)) = ⊥ := sorry
end Cosocles

section WhittakerFieldProperties
variable {F k V : Type u} [Field F] [TopologicalSpace F] [ValuativeRel F]
  [IsNonarchimedeanLocalField F] [Field k] [AddCommGroup V] [Module k V]
  (n : ℕ) (ψ : Multiplicative F →* kˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
  (ρ : Representation k (GL (Fin (n + 1)) F) V)

include hψ in
theorem EssentiallyAIG.endomorphisms
    (h : EssentiallyAIG ρ (BZDerivative.unipotent (n + 1) (n + 1))
      (BZDerivative.character (n + 1) (n + 1) ψ))
    (f : Representation.IntertwiningMap ρ ρ) :
    ∃! a : k, ∀ v, f v = a • v := sorry

include hψ in
theorem CoWhittaker.field (hs : Representation.IsSmooth ρ)
    (ha : Representation.IsAdmissible ρ) (hl : IsFiniteLength (MonoidAlgebra k (GL (Fin (n + 1)) F)) ρ.asModule) :
    CoWhittaker ρ (BZDerivative.unipotent (n + 1) (n + 1))
      (BZDerivative.character (n + 1) (n + 1) ψ) ↔
    AbsolutelyIrreducible (Representation.cosocle ρ) ∧
    Generic (Representation.cosocle ρ) (BZDerivative.unipotent (n + 1) (n + 1))
      (BZDerivative.character (n + 1) (n + 1) ψ) ∧
    Module.finrank k (BZDerivative.module (n + 1) (n + 1) ψ ρ) = 1 := sorry

/- Check `CoWhittaker.field`: finite length identifies the generic cosocle criterion over a field. -/
include hψ in
example (hs : Representation.IsSmooth ρ)
    (ha : Representation.IsAdmissible ρ) (hl : IsFiniteLength (MonoidAlgebra k (GL (Fin (n + 1)) F)) ρ.asModule) :
    CoWhittaker ρ (BZDerivative.unipotent (n + 1) (n + 1))
      (BZDerivative.character (n + 1) (n + 1) ψ) ↔
    AbsolutelyIrreducible (Representation.cosocle ρ) ∧
    Generic (Representation.cosocle ρ) (BZDerivative.unipotent (n + 1) (n + 1))
      (BZDerivative.character (n + 1) (n + 1) ψ) ∧
    Module.finrank k (BZDerivative.module (n + 1) (n + 1) ψ ρ) = 1 := sorry
end WhittakerFieldProperties

section WhittakerScalarEndomorphisms
variable (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (hpℓ : p ≠ ℓ)
  {F k A V : Type} [Field F] [TopologicalSpace F] [ValuativeRel F]
  [IsNonarchimedeanLocalField F] [hAlg : Algebra ℚ_[p] F]
  [hfin : FiniteDimensional ℚ_[p] F] [hcont : ContinuousSMul ℚ_[p] F]
  [Field k] [hkChar : CharP k ℓ] [hkClosed : IsAlgClosed k] [hkPerfect : PerfectRing k ℓ]
  [CommRing A] [IsNoetherianRing A] [hA : Algebra (WittVector ℓ k) A]
  [AddCommGroup V] [Module A V]
include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect hA in
theorem CoWhittaker.scalars (n : ℕ) (ψ : Multiplicative F →* Aˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (ρ : Representation A (GL (Fin (n + 1)) F) V)
    (h : CoWhittaker ρ (BZDerivative.unipotent (n + 1) (n + 1))
      (BZDerivative.character (n + 1) (n + 1) ψ))
    (f : Representation.IntertwiningMap ρ ρ) :
    ∃! a : A, ∀ v, f v = a • v := sorry
end WhittakerScalarEndomorphisms

noncomputable section BlockInduction
open scoped TensorProduct
namespace BZDerivative
variable {F A V W : Type u} [Field F] [TopologicalSpace F] [ValuativeRel F]
  [IsNonarchimedeanLocalField F] [Field A] [AddCommGroup V] [Module A V]
  [AddCommGroup W] [Module A W]

/-- The standard two-block upper parabolic. -/
def blockParabolic (a b : ℕ) : Subgroup (GL (Fin (a + b)) F) where
  carrier := {g | ∀ (i : Fin b) (j : Fin a), g.val (i.natAdd a) (j.castAdd b) = 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- Projection to the two diagonal blocks. -/
def blockProjection (a b : ℕ) : blockParabolic (F := F) a b →*
    (GL (Fin a) F × GL (Fin b) F) := by sorry

theorem blockProjection_left (a b : ℕ) (g : blockParabolic (F := F) a b)
    (i j : Fin a) : (blockProjection a b g).1.val i j = g.val.val (i.castAdd b) (j.castAdd b) := sorry

theorem blockProjection_right (a b : ℕ) (g : blockParabolic (F := F) a b)
    (i j : Fin b) : (blockProjection a b g).2.val i j = g.val.val (i.natAdd a) (j.natAdd a) := sorry

/-- Unnormalised induction of the exterior tensor product of the two Levi actions. -/
def blockInduction (a b : ℕ) (ρ : Representation A (GL (Fin a) F) V)
    (σ : Representation A (GL (Fin b) F) W)
    (hρ : Representation.IsSmooth ρ) (hσ : Representation.IsSmooth σ) :
    SmoothRep.{u,u} A (GL (Fin (a + b)) F) :=
  SmoothRep.ind (blockParabolic a b)
    ⟨Rep.of ((_root_.Representation.tprod (ρ.comp (MonoidHom.fst (GL (Fin a) F) (GL (Fin b) F)))
      (σ.comp (MonoidHom.snd (GL (Fin a) F) (GL (Fin b) F)))).comp
      (blockProjection a b)), by sorry⟩

theorem induced (a b : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ)
    (ρ : Representation A (GL (Fin a) F) V) (σ : Representation A (GL (Fin b) F) W)
    (hρ : Representation.IsSmooth ρ) (hσ : Representation.IsSmooth σ)
    (ha : Representation.IsAdmissible ρ) (hb : Representation.IsAdmissible σ) :
    Nonempty (module (a + b) (a + b) ψ (blockInduction a b ρ σ hρ hσ).obj.ρ ≃ₗ[A]
      (module a a ψ ρ ⊗[A] module b b ψ σ)) := sorry

/- Check `BZDerivative.induced`: the top derivative of unnormalised two-block induction is the tensor product. -/
example (a b : ℕ) (ψ : Multiplicative F →* Aˣ) (hψ : IsGenericCharacter ψ)
    (ρ : Representation A (GL (Fin a) F) V) (σ : Representation A (GL (Fin b) F) W)
    (hρ : Representation.IsSmooth ρ) (hσ : Representation.IsSmooth σ)
    (ha : Representation.IsAdmissible ρ) (hb : Representation.IsAdmissible σ) :
    Nonempty (module (a + b) (a + b) ψ (blockInduction a b ρ σ hρ hσ).obj.ρ ≃ₗ[A]
      (module a a ψ ρ ⊗[A] module b b ψ σ)) := sorry

theorem blockParabolic_empty (a : ℕ) : blockParabolic (F := F) a 0 = ⊤ := sorry
/- Check `BZDerivative.blockParabolic_empty`: an empty second block leaves the whole group. -/
example (a : ℕ) : blockParabolic (F := F) a 0 = ⊤ := sorry

theorem blockParabolic_borel : blockParabolic (F := F) 1 1 =
    { carrier := {g | g.val 1 0 = 0}
      one_mem' := by sorry
      mul_mem' := by sorry
      inv_mem' := by sorry } := sorry
/- Check `BZDerivative.blockParabolic_borel`: two one-dimensional blocks give the upper triangular subgroup. -/
example (g : GL (Fin 2) F) : g ∈ blockParabolic (F := F) 1 1 ↔ g.val 1 0 = 0 := sorry

theorem blockParabolic_weyl :
    ({ val := !![0, 1; 1, 0]
       inv := !![0, 1; 1, 0]
       val_inv := by sorry
       inv_val := by sorry } : GL (Fin 2) F)
      ∉ blockParabolic (F := F) 1 1 := sorry
/- Check `BZDerivative.blockParabolic_weyl`: the nontrivial rank-two permutation is outside the Borel. -/
example :
    ({ val := !![0, 1; 1, 0]
       inv := !![0, 1; 1, 0]
       val_inv := by sorry
       inv_val := by sorry } : GL (Fin 2) F)
      ∉ blockParabolic (F := F) 1 1 := sorry
end BZDerivative
end BlockInduction

noncomputable section OpenClosed
local instance (p : Prop) : Decidable p := Classical.propDecidable p
namespace LocallyConstantCompact
variable {A X M : Type u} [CommRing A] [TopologicalSpace X] [T2Space X]
  [AddCommGroup M] [Module A M]

/-- Extension by zero along an open inclusion. -/
def extendOpen (U : TopologicalSpace.Opens X) :
    LocallyConstantCompact U M →ₗ[A] LocallyConstantCompact X M where
  toFun f :=
    { toFun := ⟨fun x => if h : x ∈ U then f.toFun ⟨x, h⟩ else 0, by sorry⟩
      isCompact_closure_support := by sorry }
  map_add' := by sorry
  map_smul' := by sorry

/-- Restriction to a closed subspace preserves compact support. -/
def restrictClosed (Z : Set X) (hZ : IsClosed Z) :
    LocallyConstantCompact X M →ₗ[A] LocallyConstantCompact Z M where
  toFun f :=
    { toFun := f.toFun.comap ⟨Subtype.val, continuous_subtype_val⟩
      isCompact_closure_support := by sorry }
  map_add' := by sorry
  map_smul' := by sorry

theorem openClosed_exact [LocallyCompactSpace X] [TotallyDisconnectedSpace X]
    (U : TopologicalSpace.Opens X) :
    Function.Injective (extendOpen (A := A) (M := M) U) ∧
    Function.Exact (extendOpen (A := A) (M := M) U)
      (restrictClosed (A := A) (M := M) (U : Set X)ᶜ U.isOpen.isClosed_compl) ∧
    Function.Surjective (restrictClosed (A := A) (M := M) (U : Set X)ᶜ U.isOpen.isClosed_compl) := sorry

theorem extendOpen_empty (f : LocallyConstantCompact (⊥ : TopologicalSpace.Opens X) M) :
    extendOpen (A := A) ⊥ f = 0 := sorry
/- Check `LocallyConstantCompact.extendOpen_empty`: extension from the empty space is zero. -/
example (f : LocallyConstantCompact (⊥ : TopologicalSpace.Opens X) M) :
    extendOpen (A := A) ⊥ f = 0 := sorry

theorem extendOpen_full (f : LocallyConstantCompact (⊤ : TopologicalSpace.Opens X) M) (x : X) :
    (extendOpen (A := A) ⊤ f).toFun x = f.toFun ⟨x, trivial⟩ := sorry
/- Check `LocallyConstantCompact.extendOpen_full`: extension from the whole space is unchanged. -/
example (f : LocallyConstantCompact (⊤ : TopologicalSpace.Opens X) M) (x : X) :
    (extendOpen (A := A) ⊤ f).toFun x = f.toFun ⟨x, trivial⟩ := sorry

theorem extendOpen_complement (U : TopologicalSpace.Opens X) (f : LocallyConstantCompact U M) :
    restrictClosed (A := A) (U : Set X)ᶜ U.isOpen.isClosed_compl (extendOpen (A := A) U f) = 0 := sorry
/- Check `LocallyConstantCompact.extendOpen_complement`: restriction to the complement annihilates the extension. -/
example (U : TopologicalSpace.Opens X) (f : LocallyConstantCompact U M) :
    restrictClosed (A := A) (U : Set X)ᶜ U.isOpen.isClosed_compl (extendOpen (A := A) U f) = 0 := sorry
end LocallyConstantCompact
end OpenClosed

section RationalCuspidalCriteria
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)

theorem SmoothRep.isQuasiCuspidal_iff_maximal
    (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (B : LeviDecomposition (G := RationalParabolic.Points H))
    (hB : B ∈ RationalParabolic.family H)
    (hmin : ∀ L ∈ RationalParabolic.family H, L.P ≤ B.P → L.P = B.P)
    (V : SmoothRep ℂ (RationalParabolic.Points H)) :
    SmoothRep.IsQuasiCuspidal (RationalParabolic.family H) V ↔
      ∀ L ∈ RationalParabolic.family H, B.P ≤ L.P → L.P ≠ ⊤ →
        (∀ Q ∈ RationalParabolic.family H, L.P < Q.P → Q.P = ⊤) →
          Subsingleton (SmoothRep.jacquet L V).obj.V := sorry

theorem SmoothRep.jacquet_subrepresentation
    (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hV : Representation.IsIrreducible V.obj.ρ) :
    ∃ D : SmoothRep.CuspidalPair (RationalParabolic.family H),
      ∃ f : V ⟶ SmoothRep.parabolicInd D.levi (complexHalfModulus D.levi)
        (complexHalfModulus_smooth D.levi) D.representation,
      Function.Injective f.hom.hom := sorry
end RationalCuspidalCriteria

section FullParabolicAdjunction
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
open RationalParabolic
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)

theorem SmoothRep.secondAdjunctionUnit_trivial_parabolic
    (hH : TauCeti.reductiveCommHopfAlgProperty F H) (l : Cocharacter H)
    (hl : (decomposition H l).P = ⊤)
    (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0)
    (hvol : ∃ U : TopologicalSpace.CompactOpens (oppositeDecomposition H l).N, (U : Set (oppositeDecomposition H l).N) = Set.univ ∧ μ.vol U = 1)
    (V : SmoothRep ℂ (decomposition H l).M) (W : SmoothRep ℂ (Points H)) :
    (∀ f : LocallyConstantCompact (oppositeDecomposition H l).N V.obj.V,
      ((RationalParabolic.secondAdjunctionUnit H hH l μ hμ).app V).hom.hom (f.toFun 1) =
        Representation.Coinvariants.mk
          (((induction H l).obj V).obj.ρ.comp (oppositeDecomposition H l).N.subtype)
          (bigCellSection H hH l V f)) ∧
    (∀ (v : W.obj.V) (f : ((induction H l).obj ((oppositeRestriction H l).obj W)).obj.V),
      (∀ g, f.val.val g = Representation.Coinvariants.mk
        (W.obj.ρ.comp (oppositeDecomposition H l).N.subtype) (W.obj.ρ g v)) →
      ((RationalParabolic.secondAdjunctionCounit H hH l μ hμ).app W).hom.hom f = v) := sorry

/- Check `SmoothRep.secondAdjunctionUnit_trivial_parabolic`: unit mass on the trivial radical makes both transformations identities under evaluation. -/
example (hH : TauCeti.reductiveCommHopfAlgProperty F H) (l : Cocharacter H)
    (hl : (decomposition H l).P = ⊤)
    (μ : HaarMeasureWithValues (oppositeDecomposition H l).N ℂ)
    (hμ : ∃ U, μ.vol U ≠ 0)
    (hvol : ∃ U : TopologicalSpace.CompactOpens (oppositeDecomposition H l).N, (U : Set (oppositeDecomposition H l).N) = Set.univ ∧ μ.vol U = 1)
    (V : SmoothRep ℂ (decomposition H l).M) (W : SmoothRep ℂ (Points H)) :
    (∀ f : LocallyConstantCompact (oppositeDecomposition H l).N V.obj.V,
      ((RationalParabolic.secondAdjunctionUnit H hH l μ hμ).app V).hom.hom (f.toFun 1) =
        Representation.Coinvariants.mk
          (((induction H l).obj V).obj.ρ.comp (oppositeDecomposition H l).N.subtype)
          (bigCellSection H hH l V f)) ∧
    (∀ (v : W.obj.V) (f : ((induction H l).obj ((oppositeRestriction H l).obj W)).obj.V),
      (∀ g, f.val.val g = Representation.Coinvariants.mk
        (W.obj.ρ.comp (oppositeDecomposition H l).N.subtype) (W.obj.ρ g v)) →
      ((RationalParabolic.secondAdjunctionCounit H hH l μ hμ).app W).hom.hom f = v) := sorry
end FullParabolicAdjunction

section SatakeCoefficients
variable {A B G Λ : Type u} [CommRing A] [CommRing B] [Group G]
  [TopologicalSpace G] [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G]
  [CommGroup Λ]
/-- The constant-term sum commutes with every coefficient homomorphism. -/
theorem satakeTransform.baseChange (φ : A →+* B)
    (L : LeviDecomposition (G := G)) (K : OpenSubgroup G)
    (dA : SatakeDatum A L K Λ) (dB : SatakeDatum B L K Λ)
    (hl : dB.lattice = dA.lattice)
    (hμ : ∀ U, dB.haar.vol U = φ (dA.haar.vol U))
    (μA : HaarMeasureWithValues G A) (μB : HaarMeasureWithValues G B)
    (fA : SphericalHeckeFunctions μA K) (fB : SphericalHeckeFunctions μB K)
    (hf : ∀ g, fB.val.toFun g = φ (fA.val.toFun g)) (ell : Λ) :
    (satakeTransform L K dB μB fB).coeff ell = φ ((satakeTransform L K dA μA fA).coeff ell) := sorry
end SatakeCoefficients

section MirabolicExactness
open CategoryTheory
variable {F A : Type u} [Field F] [TopologicalSpace F] [ValuativeRel F]
  [IsNonarchimedeanLocalField F] [CommRing A]
/-- Exactness of all five character-model functors. -/
theorem BZDerivative.functors_exact (n : ℕ) (ψ : Multiplicative F →* Aˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ) :
    Limits.PreservesFiniteLimits (BZDerivative.psiMinus (A := A) (F := F) n) ∧
    Limits.PreservesFiniteColimits (BZDerivative.psiMinus (A := A) (F := F) n) ∧
    Limits.PreservesFiniteLimits (BZDerivative.psiPlus (A := A) (F := F) n) ∧
    Limits.PreservesFiniteColimits (BZDerivative.psiPlus (A := A) (F := F) n) ∧
    Limits.PreservesFiniteLimits (BZDerivative.phiMinus n ψ) ∧
    Limits.PreservesFiniteColimits (BZDerivative.phiMinus n ψ) ∧
    Limits.PreservesFiniteLimits (BZDerivative.phiPlus n ψ hψ.1) ∧
    Limits.PreservesFiniteColimits (BZDerivative.phiPlus n ψ hψ.1) ∧
    Limits.PreservesFiniteLimits (BZDerivative.phiHatPlus n ψ hψ.1) ∧
    Limits.PreservesFiniteColimits (BZDerivative.phiHatPlus n ψ hψ.1) := sorry
end MirabolicExactness

noncomputable section

section InductionNaturality
open CategoryTheory
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

/-- Frobenius reciprocity sends a map into induction to evaluation at one. -/
theorem SmoothRep.frobeniusReciprocity_evaluation (H : Subgroup G) :
    ∃ adj : SmoothRep.res (A := A) H.subtype continuous_subtype_val ⊣ SmoothRep.indFunctor H,
      ∀ (V : SmoothRep A G) (W : SmoothRep A H)
        (f : V ⟶ SmoothRep.ind H W) (v : V.obj.V),
        ((adj.homEquiv V W).symm f).hom.hom v = (f.hom.hom v).val.val 1 := sorry

/-- The stages comparison is natural, and its value is evaluation of the inner function at one. -/
theorem SmoothRep.ind_stages_natural (H : Subgroup G) (hH : IsClosed (H : Set G))
    (K : Subgroup H) (hK : IsClosed (K : Set H)) :
    ∃ e : SmoothRep.indFunctor (A := A) K ⋙ SmoothRep.indFunctor H ≅
      SmoothRep.res
        (Subgroup.equivMapOfInjective K H.subtype Subtype.val_injective).symm.toMonoidHom
        (by sorry) ⋙ SmoothRep.indFunctor (K.map H.subtype),
      ∀ (V : SmoothRep A K) (f : (SmoothRep.ind H (SmoothRep.ind K V)).obj.V) (g : G),
        ((e.hom.app V).hom.hom f).val.val g = (f.val.val g).val.val 1 := sorry

theorem SmoothRep.cInd_stages_natural (H : Subgroup G) (hH : IsClosed (H : Set G))
    (K : Subgroup H) (hK : IsClosed (K : Set H)) :
    ∃ e : SmoothRep.cIndFunctor (A := A) K ⋙ SmoothRep.cIndFunctor H ≅
      SmoothRep.res
        (Subgroup.equivMapOfInjective K H.subtype Subtype.val_injective).symm.toMonoidHom
        (by sorry) ⋙ SmoothRep.cIndFunctor (K.map H.subtype),
      ∀ (V : SmoothRep A K) (f : (SmoothRep.cInd H (SmoothRep.cInd K V)).obj.V) (g : G),
        ((e.hom.app V).hom.hom f).val.val g = (f.val.val g).val.val 1 := sorry

attribute [local instance] HasDerivedCategory.standard

instance SmoothRep.cIndFunctor_additive (H : Subgroup G) :
    (SmoothRep.cIndFunctor (A := A) H).Additive := by sorry

instance SmoothRep.res_additive {J : Type u} [Group J] [TopologicalSpace J]
    [IsTopologicalGroup J] (f : J →* G) (hf : Continuous f) :
    (SmoothRep.res (A := A) f hf).Additive := by sorry

instance SmoothRep.res_preservesZeroMorphisms {J : Type u} [Group J] [TopologicalSpace J]
    [IsTopologicalGroup J] (f : J →* G) (hf : Continuous f) :
    (SmoothRep.res (A := A) f hf).PreservesZeroMorphisms := by sorry

/-- Exact compact induction and restriction induce the same adjunction on unbounded categories. -/
theorem SmoothRep.derivedCompactFrobeniusReciprocity (H : OpenSubgroup G) :
    let rr := SmoothRep.res (A := A) H.toSubgroup.subtype continuous_subtype_val
    letI : rr.PreservesZeroMorphisms := by sorry
    ∃ (L : DerivedCategory (SmoothRep A H) ⥤ DerivedCategory (SmoothRep A G))
      (R : DerivedCategory (SmoothRep A G) ⥤ DerivedCategory (SmoothRep A H)),
      Nonempty (L ⊣ R) ∧
      Nonempty (DerivedCategory.Q ⋙ L ≅
        (SmoothRep.cIndFunctor H.toSubgroup).mapHomologicalComplex (ComplexShape.up ℤ) ⋙
          DerivedCategory.Q) ∧
      Nonempty (DerivedCategory.Q ⋙ R ≅
        rr.mapHomologicalComplex
          (ComplexShape.up ℤ) ⋙ DerivedCategory.Q) := sorry

end InductionNaturality

section DiscreteDerivedEquivalence
open CategoryTheory
open scoped MonoidAlgebra
attribute [local instance] HasDerivedCategory.standard
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [DiscreteTopology G]

/-- The group-algebra equivalence commutes with localization of complexes. -/
theorem SmoothRep.derivedGroupAlgebra_equivalence :
    ∃ E : DerivedCategory (SmoothRep A G) ≌ DerivedCategory (ModuleCat A[G]),
      Nonempty (DerivedCategory.Q ⋙ E.functor ≅
        SmoothRep.toGroupAlgebra.mapHomologicalComplex (ComplexShape.up ℤ) ⋙
          DerivedCategory.Q) := sorry
end DiscreteDerivedEquivalence

section OrbitFiltrations
open CategoryTheory
open scoped Pointwise
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- An exhaustive finite filtration by actual invariant submodules. -/
structure SmoothRep.Filtration (V : SmoothRep A G) (n : ℕ) where
  step : Fin (n + 1) → Subrepresentation V.obj.ρ
  monotone : Monotone step
  first : step 0 = ⊥
  last : step (Fin.last n) = ⊤

/-- The successive quotient uses the inverse image of the previous submodule. -/
def SmoothRep.Filtration.graded {V : SmoothRep A G} {n : ℕ}
    (F : SmoothRep.Filtration V n) (i : Fin n) : SmoothRep A G :=
  let S : Subrepresentation (F.step i.succ).toRepresentation :=
    { toSubmodule := (F.step i.castSucc).toSubmodule.comap (F.step i.succ).toSubmodule.subtype
      apply_mem_toSubmodule := by sorry }
  ⟨Rep.of S.quotient, by sorry⟩

theorem SmoothRep.Filtration_zero (V : SmoothRep A G) :
    Nonempty (SmoothRep.Filtration V 0) ↔ Subsingleton V.obj.V := sorry
/- Check `SmoothRep.Filtration_zero`: a filtration with no pieces forces the object to vanish. -/
example (V : SmoothRep A G) :
    Nonempty (SmoothRep.Filtration V 0) ↔ Subsingleton V.obj.V := sorry

theorem SmoothRep.Filtration_single (V : SmoothRep A G) (F : SmoothRep.Filtration V 1) :
    Nonempty (F.graded 0 ≅ V) := sorry
/- Check `SmoothRep.Filtration_single`: a single graded piece is the original representation. -/
example (V : SmoothRep A G) (F : SmoothRep.Filtration V 1) :
    Nonempty (F.graded 0 ≅ V) := sorry

theorem SmoothRep.Filtration_repeated {V : SmoothRep A G} {n : ℕ}
    (F : SmoothRep.Filtration V n) (i : Fin n)
    (hi : F.step i.castSucc = F.step i.succ) : Limits.IsZero (F.graded i) := sorry
/- Check `SmoothRep.Filtration_repeated`: repeated submodules have zero successive quotient. -/
example {V : SmoothRep A G} {n : ℕ} (F : SmoothRep.Filtration V n) (i : Fin n)
    (hi : F.step i.castSucc = F.step i.succ) : Limits.IsZero (F.graded i) := sorry

theorem SmoothRep.Filtration.graded_zero {V : SmoothRep A G} {n : ℕ}
    (F : SmoothRep.Filtration V n) (hV : Subsingleton V.obj.V) (i : Fin n) :
    Limits.IsZero (F.graded i) := sorry
/- Check `SmoothRep.Filtration.graded_zero`: every graded piece of a filtration of zero is zero. -/
example {V : SmoothRep A G} {n : ℕ} (F : SmoothRep.Filtration V n)
    (hV : Subsingleton V.obj.V) (i : Fin n) : Limits.IsZero (F.graded i) := sorry

/-- Stabilizer of the right Q-orbit of Hx. -/
def SmoothRep.orbitStabilizer (H Q : Subgroup G) (x : G) : Subgroup Q :=
  H.comap ((MulAut.conj x).toMonoidHom.comp Q.subtype)

/-- Pull back the H-representation through q ↦ xqx⁻¹. -/
def SmoothRep.orbitRepresentation (H Q : Subgroup G) (x : G) (V : SmoothRep A H) :
    SmoothRep A (SmoothRep.orbitStabilizer H Q x) :=
  (SmoothRep.res
    (((MulAut.conj x).toMonoidHom.comp
      (Q.subtype.comp (SmoothRep.orbitStabilizer H Q x).subtype)).codRestrict H (by sorry))
    (by sorry)).obj V

theorem SmoothRep.orbitStabilizer_identity (H : Subgroup G) :
    SmoothRep.orbitStabilizer H H 1 = ⊤ := sorry
/- Check `SmoothRep.orbitStabilizer_identity`: the identity orbit under H is a point. -/
example (H : Subgroup G) : SmoothRep.orbitStabilizer H H 1 = ⊤ := sorry

theorem SmoothRep.orbitStabilizer_trivial (Q : Subgroup G) (x : G) :
    SmoothRep.orbitStabilizer ⊥ Q x = ⊥ := sorry
/- Check `SmoothRep.orbitStabilizer_trivial`: right translation on G is free. -/
example (Q : Subgroup G) (x : G) : SmoothRep.orbitStabilizer ⊥ Q x = ⊥ := sorry

theorem SmoothRep.orbitStabilizer_full (Q : Subgroup G) (x : G) :
    SmoothRep.orbitStabilizer ⊤ Q x = ⊤ := sorry
/- Check `SmoothRep.orbitStabilizer_full`: the one-point quotient has full stabilizer. -/
example (Q : Subgroup G) (x : G) : SmoothRep.orbitStabilizer ⊤ Q x = ⊤ := sorry

/-- Mackey's filtration, with an open ordering of the double cosets and evaluation on each orbit. -/
theorem SmoothRep.mackey_filtration [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [T2Space G] [SigmaCompactSpace G] (H Q : Subgroup G)
    (hH : IsClosed (H : Set G)) (hQ : IsClosed (Q : Set G))
    (n : ℕ) (x : Fin n → G)
    (hdisjoint : Pairwise fun i j => Disjoint ((H : Set G) * {x i} * (Q : Set G))
      ((H : Set G) * {x j} * (Q : Set G)))
    (hcover : (⋃ i, ((H : Set G) * {x i} * (Q : Set G))) = Set.univ)
    (hopen : ∀ i : Fin (n + 1), IsOpen (⋃ j : {j : Fin n // j.val < i.val},
      ((H : Set G) * {x j.val} * (Q : Set G))))
    (hloc : ∀ i, IsLocallyClosed ((H : Set G) * {x i} * (Q : Set G))) (V : SmoothRep A H) :
    ∃ F : SmoothRep.Filtration
      ((SmoothRep.res Q.subtype continuous_subtype_val).obj (SmoothRep.cInd H V)) n,
      (∀ i : Fin (n + 1), ∀ f,
        f ∈ F.step i ↔ Function.support (fun g => f.val.val g) ⊆
          ⋃ j : {j : Fin n // j.val < i.val}, ((H : Set G) * {x j.val} * (Q : Set G))) ∧
      ∀ i : Fin n, Nonempty (F.graded i ≅
        SmoothRep.cInd (SmoothRep.orbitStabilizer H Q (x i))
          (SmoothRep.orbitRepresentation H Q (x i) V)) := sorry
end OrbitFiltrations

section ParabolicDuality
open CategoryTheory
open ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)

/-- Normalized parabolic induction commutes with smooth contragredients, naturally. -/
theorem RationalParabolic.induction_duality (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : RationalParabolic.Cocharacter H) :
    Nonempty (RationalParabolic.induction H l ⋙ SmoothRep.smoothDualFunctor ≅
      SmoothRep.smoothDualFunctor ⋙ (RationalParabolic.induction H l).op) := sorry

end ParabolicDuality

section ResidueFieldChecks
open CategoryTheory ValuativeRel
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F]

/-- Depth-zero compact induction uses Z GL₂(O), and an actual extension of the inflated type. -/
theorem SmoothRep.isCuspidal_depthZero_gl2
    {V : Type} [AddCommGroup V] [Module ℂ V]
    (τ : Representation ℂ (GL (Fin 2) (𝓀[F])) V)
    (hi : Representation.IsIrreducible τ)
    (hc : Subsingleton (Representation.invariants
      (τ.comp (BZDerivative.unipotent (F := 𝓀[F]) 2 2).subtype))) :
    let G := GL (Fin 2) F
    let j := Matrix.GeneralLinearGroup.map (𝒪[F]).subtype
    let K : Subgroup G := Subgroup.center G ⊔ j.range
    let jK : GL (Fin 2) (𝒪[F]) →* K := j.codRestrict K (by
      intro g; exact (show j.range ≤ K from le_sup_right) ⟨g, rfl⟩)
    ∀ σ : SmoothRep ℂ K,
      Nonempty (Representation.Equiv (σ.obj.ρ.comp jK)
        (τ.comp (Matrix.GeneralLinearGroup.map (IsLocalRing.residue (𝒪[F]))))) →
      Representation.IsIrreducible (SmoothRep.cInd K σ).obj.ρ ∧
      SmoothRep.IsCuspidal
        {L : LeviDecomposition (G := G) | L.P = ⊤ ∨ ∃ g : G,
          L.N = (BZDerivative.unipotent (F := F) 2 2).map (MulAut.conj g).toMonoidHom}
        (SmoothRep.cInd K σ) := sorry

/- Check `SmoothRep.isCuspidal_depthZero_gl2`: inflation and its central extension are part of the input. -/
example {V : Type} [AddCommGroup V] [Module ℂ V]
    (τ : Representation ℂ (GL (Fin 2) (𝓀[F])) V)
    (hi : Representation.IsIrreducible τ)
    (hc : Subsingleton (Representation.invariants
      (τ.comp (BZDerivative.unipotent (F := 𝓀[F]) 2 2).subtype))) :
    let G := GL (Fin 2) F
    let j := Matrix.GeneralLinearGroup.map (𝒪[F]).subtype
    let K : Subgroup G := Subgroup.center G ⊔ j.range
    let jK : GL (Fin 2) (𝒪[F]) →* K := j.codRestrict K (by
      intro g; exact (show j.range ≤ K from le_sup_right) ⟨g, rfl⟩)
    ∀ σ : SmoothRep ℂ K,
      Nonempty (Representation.Equiv (σ.obj.ρ.comp jK)
        (τ.comp (Matrix.GeneralLinearGroup.map (IsLocalRing.residue (𝒪[F]))))) →
      Representation.IsIrreducible (SmoothRep.cInd K σ).obj.ρ ∧
      SmoothRep.IsCuspidal
        {L : LeviDecomposition (G := G) | L.P = ⊤ ∨ ∃ g : G,
          L.N = (BZDerivative.unipotent (F := F) 2 2).map (MulAut.conj g).toMonoidHom}
        (SmoothRep.cInd K σ) := sorry

/-- Residue degree two gives q⁻² on the root group and q⁻¹ for the positive half modulus. -/
theorem parabolicDescent.quadraticNorm (q : ℕ) (hq : 1 < q)
    (hresidue : Nat.card (𝓀[F]) = q ^ 2)
    (ϖ : 𝒪[F]) (hϖ : Ideal.span {ϖ} = IsLocalRing.maximalIdeal (𝒪[F])) :
    let N := BZDerivative.unipotent (F := F) 2 2
    letI : LocallyCompactSpace N := by sorry
    letI : TotallyDisconnectedSpace N := by sorry
    letI : T2Space N := by sorry
    let a : Subgroup.normalizer (N : Set (GL (Fin 2) F)) :=
      ⟨{ val := Matrix.diagonal ![(ϖ : F), 1]
         inv := Matrix.diagonal ![(ϖ : F)⁻¹, 1]
         val_inv := by sorry
         inv_val := by sorry }, by sorry⟩
    (modulus N a : ℚ) = (q : ℚ) ^ (-2 : ℤ) ∧
      Real.sqrt (modulus N a : ℝ) = (q : ℝ)⁻¹ := sorry

/- Check `parabolicDescent.quadraticNorm`: the E-normalized absolute value uses the square of the base residue size. -/
example (q : ℕ) (hq : 1 < q) (hresidue : Nat.card (𝓀[F]) = q ^ 2)
    (ϖ : 𝒪[F]) (hϖ : Ideal.span {ϖ} = IsLocalRing.maximalIdeal (𝒪[F])) :
    let N := BZDerivative.unipotent (F := F) 2 2
    letI : LocallyCompactSpace N := by sorry
    letI : TotallyDisconnectedSpace N := by sorry
    letI : T2Space N := by sorry
    let a : Subgroup.normalizer (N : Set (GL (Fin 2) F)) :=
      ⟨{ val := Matrix.diagonal ![(ϖ : F), 1]
         inv := Matrix.diagonal ![(ϖ : F)⁻¹, 1]
         val_inv := by sorry
         inv_val := by sorry }, by sorry⟩
    (modulus N a : ℚ) = (q : ℚ) ^ (-2 : ℤ) ∧
      Real.sqrt (modulus N a : ℝ) = (q : ℝ)⁻¹ := sorry
end ResidueFieldChecks

section WittMirabolicDescent
open CategoryTheory
variable {F k κ : Type} [Field F] [TopologicalSpace F] [ValuativeRel F]
  [IsNonarchimedeanLocalField F] [Field k] [Field κ]
  (ℓ : ℕ) [Fact ℓ.Prime]

/-- Unnormalized mirabolic functors over Witt vectors, including the two adjunctions. -/
structure BZDerivative.WittFunctors (n : ℕ) where
  minus : SmoothRep (WittVector ℓ k) (BZDerivative.mirabolic (F := F) (n + 1)) ⥤
    SmoothRep (WittVector ℓ k) (BZDerivative.mirabolic (F := F) n)
  plus : SmoothRep (WittVector ℓ k) (BZDerivative.mirabolic (F := F) n) ⥤
    SmoothRep (WittVector ℓ k) (BZDerivative.mirabolic (F := F) (n + 1))
  hatPlus : SmoothRep (WittVector ℓ k) (BZDerivative.mirabolic (F := F) n) ⥤
    SmoothRep (WittVector ℓ k) (BZDerivative.mirabolic (F := F) (n + 1))
  compactAdjunction : plus ⊣ minus
  smoothAdjunction : minus ⊣ hatPlus

variable (p : ℕ) [Fact p.Prime] (hpℓ : p ≠ ℓ)
  [hAlg : Algebra ℚ_[p] F] [hfin : FiniteDimensional ℚ_[p] F]
  [hcont : ContinuousSMul ℚ_[p] F] [hkChar : CharP k ℓ] [hkPerfect : PerfectRing k ℓ]
  [hκChar : CharP κ ℓ] [hκPerfect : PerfectRing κ ℓ] [hκClosed : IsAlgClosed κ]
  [Algebra k κ] [Algebra (WittVector ℓ k) (WittVector ℓ κ)]
  (hW : algebraMap (WittVector ℓ k) (WittVector ℓ κ) = WittVector.map (algebraMap k κ))

/-- Diagonal-conjugation descent of the character-model functors of EH Proposition 3.1.4. -/
def BZDerivative.wittFunctors (n : ℕ)
    (ψ : Multiplicative F →* (WittVector ℓ κ)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ) :
    BZDerivative.WittFunctors (F := F) (k := k) ℓ n := sorry

include hpℓ hAlg hfin hcont hkChar hkPerfect hκChar hκPerfect hκClosed hW in
theorem BZDerivative.descent (n : ℕ)
    (ψ : Multiplicative F →* (WittVector ℓ κ)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ) :
    let D := BZDerivative.wittFunctors (k := k) ℓ n ψ hψ
    Nonempty (D.minus ⋙ SmoothRep.baseChange (B := WittVector ℓ κ) ≅
      SmoothRep.baseChange ⋙ BZDerivative.phiMinus n ψ) ∧
    Nonempty (D.plus ⋙ SmoothRep.baseChange (B := WittVector ℓ κ) ≅
      SmoothRep.baseChange ⋙ BZDerivative.phiPlus n ψ hψ.1) ∧
    Nonempty (D.hatPlus ⋙ SmoothRep.baseChange (B := WittVector ℓ κ) ≅
      SmoothRep.baseChange ⋙ BZDerivative.phiHatPlus n ψ hψ.1) ∧
    (∀ V, Mono (D.compactAdjunction.counit.app V)) ∧
    (∀ V, Epi ((BZDerivative.psiUnit (F := F) (A := WittVector ℓ k) (n + 1)).app V)) ∧
    (∀ V, Function.Exact (D.compactAdjunction.counit.app V).hom.hom
      ((BZDerivative.psiUnit (F := F) (A := WittVector ℓ k) (n + 1)).app V).hom.hom) := sorry

include hpℓ hAlg hfin hcont hkChar hkPerfect hκChar hκPerfect hκClosed hW in
/- Check `BZDerivative.descent`: scalar extension recovers the character-model functors and the exact adjunction sequence. -/
example (n : ℕ)
    (ψ : Multiplicative F →* (WittVector ℓ κ)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ) :
    let D := BZDerivative.wittFunctors (k := k) ℓ n ψ hψ
    Nonempty (D.minus ⋙ SmoothRep.baseChange (B := WittVector ℓ κ) ≅
      SmoothRep.baseChange ⋙ BZDerivative.phiMinus n ψ) ∧
    Nonempty (D.plus ⋙ SmoothRep.baseChange (B := WittVector ℓ κ) ≅
      SmoothRep.baseChange ⋙ BZDerivative.phiPlus n ψ hψ.1) ∧
    Nonempty (D.hatPlus ⋙ SmoothRep.baseChange (B := WittVector ℓ κ) ≅
      SmoothRep.baseChange ⋙ BZDerivative.phiHatPlus n ψ hψ.1) ∧
    (∀ V, Mono (D.compactAdjunction.counit.app V)) ∧
    (∀ V, Epi ((BZDerivative.psiUnit (F := F) (A := WittVector ℓ k) (n + 1)).app V)) ∧
    (∀ V, Function.Exact (D.compactAdjunction.counit.app V).hom.hom
      ((BZDerivative.psiUnit (F := F) (A := WittVector ℓ k) (n + 1)).app V).hom.hom) := sorry

include hpℓ hAlg hfin hcont hkChar hkPerfect hκChar hκPerfect hκClosed hW in
theorem BZDerivative.wittFunctors_zero (n : ℕ)
    (ψ : Multiplicative F →* (WittVector ℓ κ)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (V : SmoothRep (WittVector ℓ k) (BZDerivative.mirabolic (F := F) (n + 1)))
    (hV : Limits.IsZero V) :
    Limits.IsZero ((BZDerivative.wittFunctors (k := k) ℓ n ψ hψ).minus.obj V) := sorry

include hpℓ hAlg hfin hcont hkChar hkPerfect hκChar hκPerfect hκClosed hW in
/- Check `BZDerivative.wittFunctors_zero`: the descended derivative of zero vanishes. -/
example (n : ℕ) (ψ : Multiplicative F →* (WittVector ℓ κ)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (V : SmoothRep (WittVector ℓ k) (BZDerivative.mirabolic (F := F) (n + 1)))
    (hV : Limits.IsZero V) :
    Limits.IsZero ((BZDerivative.wittFunctors (k := k) ℓ n ψ hψ).minus.obj V) := sorry

include hpℓ hAlg hfin hcont hkChar hkPerfect hκChar hκPerfect hκClosed hW in
theorem BZDerivative.wittFunctors_inflation (n : ℕ)
    (ψ : Multiplicative F →* (WittVector ℓ κ)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (V : SmoothRep (WittVector ℓ k) (GL (Fin (n + 1)) F)) :
    Limits.IsZero ((BZDerivative.wittFunctors (k := k) ℓ n ψ hψ).minus.obj
      ((BZDerivative.psiPlus (n + 1)).obj V)) := sorry

include hpℓ hAlg hfin hcont hkChar hkPerfect hκChar hκPerfect hκClosed hW in
/- Check `BZDerivative.wittFunctors_inflation`: a trivial last-column action has zero nontrivial derivative. -/
example (n : ℕ) (ψ : Multiplicative F →* (WittVector ℓ κ)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (V : SmoothRep (WittVector ℓ k) (GL (Fin (n + 1)) F)) :
    Limits.IsZero ((BZDerivative.wittFunctors (k := k) ℓ n ψ hψ).minus.obj
      ((BZDerivative.psiPlus (n + 1)).obj V)) := sorry

include hpℓ hAlg hfin hcont hkChar hkPerfect hκChar hκPerfect hκClosed hW in
theorem BZDerivative.wittFunctors_compactInduction (n : ℕ)
    (ψ : Multiplicative F →* (WittVector ℓ κ)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ) :
    let D := BZDerivative.wittFunctors (k := k) ℓ n ψ hψ
    IsIso D.compactAdjunction.unit := sorry

include hpℓ hAlg hfin hcont hkChar hkPerfect hκChar hκPerfect hκClosed hW in
/- Check `BZDerivative.wittFunctors_compactInduction`: the unit identifies the derivative after compact induction. -/
example (n : ℕ) (ψ : Multiplicative F →* (WittVector ℓ κ)ˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ) :
    let D := BZDerivative.wittFunctors (k := k) ℓ n ψ hψ
    IsIso D.compactAdjunction.unit := sorry
end WittMirabolicDescent

section SplitIwahori
open CategoryTheory ValuativeRel
open TauCetiRoadmap.ReductiveGroupsPartII
open BruhatTits
open scoped PointTopology MonoidAlgebra IsMulCommutative
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] [ModelField F]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F}
  (D : LocalRootData F H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
  (a : BaseAlcove D φ)
  (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)

include hsplit in
/-- Rank-one freeness means the actual right Hecke action is the regular action. -/
theorem SmoothRep.universalUnramifiedTwist_iwahori_free
    (l : RationalParabolic.Cocharacter H)
    (hT : (RationalParabolic.decomposition H l).M = D.rootDatum.T) :
    let L := RationalParabolic.decomposition H l
    letI : IsMulCommutative (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup) := by sorry
    let B := MonoidAlgebra ℂ (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)
    let W := (SmoothRep.restrictScalars (A := ℂ) (B := B)).obj
      (SmoothRep.universalUnramifiedTwist L (RationalParabolic.halfModulus H l)
        (RationalParabolic.halfModulus_smooth H l) (SmoothRep.trivial (ModuleCat.of ℂ ℂ)))
    let P := Representation.ofMulAction ℂ (RationalParabolic.Points H)
      (RationalParabolic.Points H ⧸ a.iwahori)
    ∃ e : HeckeAlgebraLevel ℂ (RationalParabolic.Points H) a.iwahori ≃ₗ[ℂ]
        (P.asModule →ₗ[ℂ[RationalParabolic.Points H]] W.obj.ρ.asModule),
      ∀ x y, e (x * y) = (e x).comp y := sorry

include hsplit in
/- Check `SmoothRep.universalUnramifiedTwist_iwahori_free`: Frobenius identifies these Hom spaces with the Iwahori-fixed vectors, with right action by precomposition. -/
example (l : RationalParabolic.Cocharacter H)
    (hT : (RationalParabolic.decomposition H l).M = D.rootDatum.T) :
    let L := RationalParabolic.decomposition H l
    letI : IsMulCommutative (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup) := by sorry
    let B := MonoidAlgebra ℂ (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)
    let W := (SmoothRep.restrictScalars (A := ℂ) (B := B)).obj
      (SmoothRep.universalUnramifiedTwist L (RationalParabolic.halfModulus H l)
        (RationalParabolic.halfModulus_smooth H l) (SmoothRep.trivial (ModuleCat.of ℂ ℂ)))
    let P := Representation.ofMulAction ℂ (RationalParabolic.Points H)
      (RationalParabolic.Points H ⧸ a.iwahori)
    ∃ e : HeckeAlgebraLevel ℂ (RationalParabolic.Points H) a.iwahori ≃ₗ[ℂ]
        (P.asModule →ₗ[ℂ[RationalParabolic.Points H]] W.obj.ρ.asModule),
      ∀ x y, e (x * y) = (e x).comp y := sorry

variable (A : Type) [CommRing A]

/-- The double-coset basis indexed by the supplied Iwahori–Bruhat bijection. -/
def HeckeAlgebraLevel.iwahoriBasis :
    Module.Basis (IwahoriWeylGroup D) A
      (HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori) := sorry

/-- Basis coefficients agree with the inverse-coset convention of the permutation model. -/
theorem HeckeAlgebraLevel.iwahoriBasis_coefficient (w : IwahoriWeylGroup D)
    (x : D.normalizer) :
    let P := Representation.ofMulAction A (RationalParabolic.Points H)
      (RationalParabolic.Points H ⧸ a.iwahori)
    (P.asModuleEquiv (HeckeAlgebraLevel.iwahoriBasis D φ a A w
      (P.asModuleEquiv.symm (MonoidAlgebra.single (QuotientGroup.mk 1) 1)))).coeff
        (QuotientGroup.mk x.val⁻¹) = @ite A (IwahoriWeylGroup.mk D x = w) (Classical.propDecidable _) 1 0 := sorry

include hsplit in
theorem HeckeAlgebraLevel.iwahoriMatsumoto :
    let T := HeckeAlgebraLevel.iwahoriBasis D φ a A
    (T 1 = 1) ∧
    (∀ w v, IwahoriWeylGroup.length a (w * v) =
      IwahoriWeylGroup.length a w + IwahoriWeylGroup.length a v → T w * T v = T (w * v)) ∧
    ∀ s ∈ IwahoriWeylGroup.simpleReflections a,
      (T s - (Nat.card (𝓀[F]) : A) • 1) * (T s + 1) = 0 := sorry

include hsplit in
theorem HeckeAlgebraLevel.iwahoriMatsumoto_presentation
    (R : Type) [Ring R] [Algebra A R] (t : IwahoriWeylGroup D → R)
    (h1 : t 1 = 1)
    (hmul : ∀ w v, IwahoriWeylGroup.length a (w * v) =
      IwahoriWeylGroup.length a w + IwahoriWeylGroup.length a v → t w * t v = t (w * v))
    (hs : ∀ s ∈ IwahoriWeylGroup.simpleReflections a,
      (t s - algebraMap A R (Nat.card (𝓀[F]) : A)) * (t s + 1) = 0) :
    ∃! f : HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori →ₐ[A] R,
      ∀ w, f (HeckeAlgebraLevel.iwahoriBasis D φ a A w) = t w := sorry

include hsplit in
theorem HeckeAlgebraLevel.iwahoriBasis_unit (hq : IsUnit (Nat.card (𝓀[F]) : A))
    (w : IwahoriWeylGroup D) : IsUnit (HeckeAlgebraLevel.iwahoriBasis D φ a A w) := sorry

include hsplit in
theorem HeckeAlgebraLevel.iwahoriBasis_groupAlgebra (hq : (Nat.card (𝓀[F]) : A) = 1) :
    ∃ e : HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori ≃ₐ[A]
      MonoidAlgebra A (IwahoriWeylGroup D),
      ∀ w, e (HeckeAlgebraLevel.iwahoriBasis D φ a A w) = MonoidAlgebra.single w 1 := sorry

theorem HeckeAlgebraLevel.iwahoriBasis_identity : HeckeAlgebraLevel.iwahoriBasis D φ a A 1 = 1 := sorry

/- Check `HeckeAlgebraLevel.iwahoriBasis_identity`: the identity double coset acts as identity. -/
example : HeckeAlgebraLevel.iwahoriBasis D φ a A 1 = 1 := sorry

include hsplit in
theorem HeckeAlgebraLevel.iwahoriBasis_reflection (s : IwahoriWeylGroup D) (hs : s ∈ IwahoriWeylGroup.simpleReflections a) :
    let T := HeckeAlgebraLevel.iwahoriBasis D φ a A s
    T * T = ((Nat.card (𝓀[F]) : A) - 1) • T + (Nat.card (𝓀[F]) : A) • 1 := sorry

include hsplit in
/- Check `HeckeAlgebraLevel.iwahoriBasis_reflection`: a reflection has T_s² = (q−1)T_s + q. -/
example (s : IwahoriWeylGroup D) (hs : s ∈ IwahoriWeylGroup.simpleReflections a) :
    let T := HeckeAlgebraLevel.iwahoriBasis D φ a A s
    T * T = ((Nat.card (𝓀[F]) : A) - 1) • T + (Nat.card (𝓀[F]) : A) • 1 := sorry

include hsplit in
theorem HeckeAlgebraLevel.iwahoriBasis_residueOne (hq : (Nat.card (𝓀[F]) : A) = 1) :
    ∃ e : HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori ≃ₐ[A]
      MonoidAlgebra A (IwahoriWeylGroup D),
      ∀ w, e (HeckeAlgebraLevel.iwahoriBasis D φ a A w) = MonoidAlgebra.single w 1 := sorry

include hsplit in
/- Check `HeckeAlgebraLevel.iwahoriBasis_residueOne`: reduction to q = 1 recovers the group algebra, including its basis. -/
example (hq : (Nat.card (𝓀[F]) : A) = 1) :
    ∃ e : HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori ≃ₐ[A]
      MonoidAlgebra A (IwahoriWeylGroup D),
      ∀ w, e (HeckeAlgebraLevel.iwahoriBasis D φ a A w) = MonoidAlgebra.single w 1 := sorry
end SplitIwahori

section BernsteinBlocks
open CategoryTheory
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

/-- The block is the full category whose irreducible subquotients have the specified inertia. -/
abbrev SmoothRep.BernsteinBlock (P : Set (LeviDecomposition (G := G)))
    (s : SmoothRep.InertialClass P) :=
  ObjectProperty.FullSubcategory (fun V : SmoothRep ℂ G =>
    ∀ (π : SmoothRep ℂ G), Representation.IsIrreducible π.obj.ρ →
      SmoothRep.IsSubquotient π V →
      ∀ d ∈ SmoothRep.cuspidalSupports P π, d.inertialClass = s)

theorem SmoothRep.BernsteinBlock_zero (P : Set (LeviDecomposition (G := G)))
    (s : SmoothRep.InertialClass P) :
    ∃ V : SmoothRep.BernsteinBlock P s, Limits.IsZero V.obj := sorry
/- Check `SmoothRep.BernsteinBlock_zero`: zero belongs to every block. -/
example (P : Set (LeviDecomposition (G := G))) (s : SmoothRep.InertialClass P) :
    ∃ V : SmoothRep.BernsteinBlock P s, Limits.IsZero V.obj := sorry

end BernsteinBlocks

section RationalBlocks
open CategoryTheory ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)
  (hH : TauCeti.reductiveCommHopfAlgProperty F H)

include hH in
theorem SmoothRep.bernstein_decomposition :
    Nonempty (SmoothRep ℂ (RationalParabolic.Points H) ≌
      (∀ s : SmoothRep.InertialClass (RationalParabolic.family H),
        SmoothRep.BernsteinBlock (RationalParabolic.family H) s)) := sorry

include hH in
theorem SmoothRep.bernstein_blocks_orthogonal
    (s t : SmoothRep.InertialClass (RationalParabolic.family H)) (hst : s ≠ t)
    (V : SmoothRep.BernsteinBlock (RationalParabolic.family H) s)
    (W : SmoothRep.BernsteinBlock (RationalParabolic.family H) t) :
    Subsingleton (V.obj ⟶ W.obj) := sorry

include hH in
theorem SmoothRep.BernsteinBlock_simple
    (s : SmoothRep.InertialClass (RationalParabolic.family H))
    (V : SmoothRep ℂ (RationalParabolic.Points H)) (hV : Representation.IsIrreducible V.obj.ρ) :
    (∃ W : SmoothRep.BernsteinBlock (RationalParabolic.family H) s, Nonempty (W.obj ≅ V)) ↔
      SmoothRep.inertialSupport H hH V hV = s := sorry

/- Check `SmoothRep.BernsteinBlock_simple`: an irreducible belongs to precisely its inertia block. -/
example (s : SmoothRep.InertialClass (RationalParabolic.family H))
    (V : SmoothRep ℂ (RationalParabolic.Points H)) (hV : Representation.IsIrreducible V.obj.ρ) :
    (∃ W : SmoothRep.BernsteinBlock (RationalParabolic.family H) s, Nonempty (W.obj ≅ V)) ↔
      SmoothRep.inertialSupport H hH V hV = s := sorry

include hH in
theorem SmoothRep.BernsteinBlock_disjoint
    (s t : SmoothRep.InertialClass (RationalParabolic.family H)) (hst : s ≠ t)
    (V : SmoothRep.BernsteinBlock (RationalParabolic.family H) s)
    (W : SmoothRep.BernsteinBlock (RationalParabolic.family H) t)
    (e : V.obj ≅ W.obj) : Limits.IsZero V.obj := sorry

include hH in
/- Check `SmoothRep.BernsteinBlock_disjoint`: the intersection of two different blocks is zero. -/
example (s t : SmoothRep.InertialClass (RationalParabolic.family H)) (hst : s ≠ t)
    (V : SmoothRep.BernsteinBlock (RationalParabolic.family H) s)
    (W : SmoothRep.BernsteinBlock (RationalParabolic.family H) t)
    (e : V.obj ≅ W.obj) : Limits.IsZero V.obj := sorry

include hH in
theorem SmoothCentre.bernstein_product :
    Nonempty (SmoothCentre ℂ (RationalParabolic.Points H) ≃+*
      (∀ s : SmoothRep.InertialClass (RationalParabolic.family H),
        CatCenter (SmoothRep.BernsteinBlock (RationalParabolic.family H) s))) := sorry

include hH in
theorem SmoothRep.bernstein_finite_level (K : OpenSubgroup (RationalParabolic.Points H))
    (hK : _root_.IsCompact (K : Set (RationalParabolic.Points H))) :
    Set.Finite {s : SmoothRep.InertialClass (RationalParabolic.family H) |
      ∃ V : SmoothRep.BernsteinBlock (RationalParabolic.family H) s,
        Nontrivial (SmoothRep.invariants K.toSubgroup V.obj)} := sorry

include hH in
theorem SmoothRep.fg_zFinite (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hV : Representation.IsFinitelyGenerated V.obj.ρ) :
    ZFinite ℂ (RationalParabolic.Points H) V := sorry

include hH in
theorem HeckeAlgebraLevel.finite_over_center
    (K : OpenSubgroup (RationalParabolic.Points H))
    (hK : _root_.IsCompact (K : Set (RationalParabolic.Points H))) :
    let R := HeckeAlgebraLevel ℂ (RationalParabolic.Points H) K.toSubgroup
    Module.Finite (Subalgebra.center ℂ R) R ∧
      Algebra.FiniteType ℂ (Subalgebra.center ℂ R) := sorry

include hH in
theorem SmoothRep.jacquet_steinberg (l : RationalParabolic.Cocharacter H)
    (hl : RationalParabolic.IsMinimal H l) :
    Nonempty ((RationalParabolic.restriction H l).obj (RationalParabolic.steinberg H l) ≅
      SmoothRep.ofCharacter (RationalParabolic.halfModulusM H l) (by sorry)) := sorry

end RationalBlocks

section SpinFactorization
open Polynomial
variable {A : Type*} [CommRing A]

/-- The generator evaluations, including the central similitude, determine the spin factors. -/
theorem SpinPolynomial.factorization (q : Aˣ) (α β γ δ T₀ T₁ T₂ : A)
    (hpair : α * δ = β * γ) (h₀ : (q : A)^3 * T₀ = α * δ)
    (h₂ : T₂ = α + β + γ + δ)
    (h₁ : (q : A) * (T₁ + ((q : A)^2 + 1) * T₀) =
      α * β + α * γ + α * δ + β * γ + β * δ + γ * δ) :
    SpinPolynomial (q : A) T₀ T₁ T₂ =
      (1 - C α * X) * (1 - C β * X) * (1 - C γ * X) * (1 - C δ * X) := sorry

/-- The reciprocal monic polynomial has the CG generator order T₂, T₁, T₀. -/
theorem SpinPolynomial.monic_comparison (q T₀ T₁ T₂ : A) :
    Polynomial.reflect 4 (SpinPolynomial q T₀ T₁ T₂) =
      X^4 - C T₂ * X^3 + C (q * T₁ + (q^3 + q) * T₀) * X^2 -
        C (q^3 * T₂ * T₀) * X + C (q^6 * T₀^2) := sorry
end SpinFactorization

section IrreducibleCorners
open CategoryTheory
open scoped MonoidAlgebra
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

/-- The right corner action is precomposition on equivariant maps out of A[G/U]. -/
def SmoothRep.cornerFunctor (U : OpenSubgroup G) :
    SmoothRep A G ⥤ ModuleCat.{u} (HeckeAlgebraLevel A G U.toSubgroup)ᵐᵒᵖ := sorry

instance SmoothRep.cornerFunctor_module (U : OpenSubgroup G) (V : SmoothRep A G) :
    Module A ((SmoothRep.cornerFunctor U).obj V) :=
  Module.compHom _ (algebraMap A (HeckeAlgebraLevel A G U.toSubgroup)ᵐᵒᵖ)

theorem SmoothRep.cornerFunctor_hom (U : OpenSubgroup G) (V : SmoothRep A G) :
    ∃ e : ((SmoothRep.cornerFunctor U).obj V) ≃ₗ[A]
      ((Representation.ofMulAction A G (G ⧸ U.toSubgroup)).asModule →ₗ[A[G]] V.obj.ρ.asModule),
      ∀ (h : HeckeAlgebraLevel A G U.toSubgroup) (v : (SmoothRep.cornerFunctor U).obj V),
        e (MulOpposite.op h • v) = (e v).comp h := sorry

theorem SmoothRep.cornerFunctor_natural (U : OpenSubgroup G) {V W : SmoothRep A G}
    (f : V ⟶ W) :
    ∃ (eV : ((SmoothRep.cornerFunctor U).obj V) ≃ₗ[A] SmoothRep.invariants U.toSubgroup V)
      (eW : ((SmoothRep.cornerFunctor U).obj W) ≃ₗ[A] SmoothRep.invariants U.toSubgroup W),
      ∀ v, (eW (((SmoothRep.cornerFunctor U).map f).hom v)).val = f.hom.hom (eV v).val := sorry

theorem SmoothRep.cornerFunctor_invariants (U : OpenSubgroup G) :
    Nonempty (SmoothRep.cornerFunctor (A := A) U ⋙
      ModuleCat.restrictScalars (algebraMap A (HeckeAlgebraLevel A G U.toSubgroup)ᵐᵒᵖ) ≅
        SmoothRep.invariantsFunctor U.toSubgroup) := sorry

theorem SmoothRep.corner_adjunction (U : OpenSubgroup G) (hc : _root_.IsCompact (U : Set G))
    (hu : HasUnitProOrder A U.toSubgroup) :
    ∃ (L : ModuleCat.{u} (HeckeAlgebraLevel A G U.toSubgroup)ᵐᵒᵖ ⥤ SmoothRep A G)
      (adj : L ⊣ SmoothRep.cornerFunctor U), IsIso adj.unit ∧
      Limits.PreservesFiniteLimits (SmoothRep.cornerFunctor (A := A) U) ∧
      Limits.PreservesFiniteColimits (SmoothRep.cornerFunctor (A := A) U) := sorry

theorem SmoothRep.cornerFunctor_zero (U : OpenSubgroup G) (V : SmoothRep A G)
    (hV : Limits.IsZero V) : Limits.IsZero ((SmoothRep.cornerFunctor U).obj V) := sorry
/- Check `SmoothRep.cornerFunctor_zero`: zero has zero corner module. -/
example (U : OpenSubgroup G) (V : SmoothRep A G)
    (hV : Limits.IsZero V) : Limits.IsZero ((SmoothRep.cornerFunctor U).obj V) := sorry

theorem SmoothRep.cornerFunctor_trivial (U : OpenSubgroup G) (M : ModuleCat A) :
    Nonempty (((SmoothRep.cornerFunctor U).obj (SmoothRep.trivial M)) ≃ₗ[A] M) := sorry
/- Check `SmoothRep.cornerFunctor_trivial`: every coefficient vector is invariant in a trivial representation. -/
example (U : OpenSubgroup G) (M : ModuleCat A) :
    Nonempty (((SmoothRep.cornerFunctor U).obj (SmoothRep.trivial M)) ≃ₗ[A] M) := sorry

theorem SmoothRep.cornerFunctor_regular (U : OpenSubgroup G) :
    ∃ e : ((SmoothRep.cornerFunctor U).obj (SmoothRep.permutation (A := A) U)) ≃ₗ[A]
        HeckeAlgebraLevel A G U.toSubgroup,
      ∀ h v, e (MulOpposite.op h • v) = e v * h := sorry
/- Check `SmoothRep.cornerFunctor_regular`: the permutation object gives the regular right corner module. -/
example (U : OpenSubgroup G) :
    ∃ e : ((SmoothRep.cornerFunctor U).obj (SmoothRep.permutation (A := A) U)) ≃ₗ[A]
        HeckeAlgebraLevel A G U.toSubgroup,
      ∀ h v, e (MulOpposite.op h • v) = e v * h := sorry

variable {k : Type u} [Field k]

theorem SmoothRep.corner_irreducible (U : OpenSubgroup G) (hc : _root_.IsCompact (U : Set G))
    (hu : HasUnitProOrder k U.toSubgroup) (V : SmoothRep k G)
    (hV : Representation.IsIrreducible V.obj.ρ) :
    Limits.IsZero ((SmoothRep.cornerFunctor U).obj V) ∨
      Simple ((SmoothRep.cornerFunctor U).obj V) := sorry

theorem SmoothRep.corner_simple_lift (U : OpenSubgroup G) (hc : _root_.IsCompact (U : Set G))
    (hu : HasUnitProOrder k U.toSubgroup)
    (M : ModuleCat.{u} (HeckeAlgebraLevel k G U.toSubgroup)ᵐᵒᵖ) [Simple M] :
    ∃ V : SmoothRep k G, Representation.IsIrreducible V.obj.ρ ∧
      Nonempty ((SmoothRep.cornerFunctor U).obj V ≅ M) ∧
      ∀ W : SmoothRep k G, Representation.IsIrreducible W.obj.ρ →
        Nonempty ((SmoothRep.cornerFunctor U).obj W ≅ M) → Nonempty (W ≅ V) := sorry

theorem SmoothRep.corner_irreducible_iso (U : OpenSubgroup G) (hc : _root_.IsCompact (U : Set G))
    (hu : HasUnitProOrder k U.toSubgroup) (V W : SmoothRep k G)
    (hV : Representation.IsIrreducible V.obj.ρ) (hW : Representation.IsIrreducible W.obj.ρ)
    (hVU : Nontrivial (SmoothRep.invariants U.toSubgroup V))
    (hWU : Nontrivial (SmoothRep.invariants U.toSubgroup W)) :
    Nonempty (V ≅ W) ↔ Nonempty ((SmoothRep.cornerFunctor U).obj V ≅
      (SmoothRep.cornerFunctor U).obj W) := sorry
end IrreducibleCorners

section InductionCompatibility
open CategoryTheory
open scoped Pointwise
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

theorem SmoothRep.mackey_open (H : Subgroup G) (hH : IsClosed (H : Set G))
    (Q : OpenSubgroup G) (V : SmoothRep A H)
    (x : DoubleCoset.Quotient (H : Set G) Q.toSubgroup → G)
    (hx : ∀ i, DoubleCoset.mk H Q.toSubgroup (x i) = i) :
    let W := fun i => SmoothRep.cInd (SmoothRep.orbitStabilizer H Q.toSubgroup (x i))
      (SmoothRep.orbitRepresentation H Q.toSubgroup (x i) V)
    ∃ e : (SmoothRep.cInd H V).obj.V ≃ₗ[A]
      DirectSum (DoubleCoset.Quotient (H : Set G) Q.toSubgroup) (fun i => (W i).obj.V),
      (∀ q : Q, ∀ v i, e ((SmoothRep.cInd H V).obj.ρ q.val v) i =
        (W i).obj.ρ q (e v i)) ∧
      ∀ v i q, (e v i).val.val q = v.val.val (x i * q.val) := sorry

theorem SmoothRep.orbitRepresentation_trivial (H Q : Subgroup G) (x : G)
    (V : ModuleCat A) :
    Nonempty (SmoothRep.orbitRepresentation H Q x (SmoothRep.trivial V) ≅
      SmoothRep.trivial V) := sorry
/- Check `SmoothRep.orbitRepresentation_trivial`: conjugation preserves the trivial action. -/
example (H Q : Subgroup G) (x : G) (V : ModuleCat A) :
    Nonempty (SmoothRep.orbitRepresentation H Q x (SmoothRep.trivial V) ≅
      SmoothRep.trivial V) := sorry

theorem SmoothRep.orbitRepresentation_zero (H Q : Subgroup G) (x : G)
    (V : SmoothRep A H) (hV : Limits.IsZero V) :
    Limits.IsZero (SmoothRep.orbitRepresentation H Q x V) := sorry
/- Check `SmoothRep.orbitRepresentation_zero`: the zero fibre remains zero. -/
example (H Q : Subgroup G) (x : G) (V : SmoothRep A H) (hV : Limits.IsZero V) :
    Limits.IsZero (SmoothRep.orbitRepresentation H Q x V) := sorry

theorem SmoothRep.orbitRepresentation_action (H Q : Subgroup G) (x : G)
    (V : SmoothRep A H) (q : SmoothRep.orbitStabilizer H Q x) (v : V.obj.V) :
    (SmoothRep.orbitRepresentation H Q x V).obj.ρ q v =
      V.obj.ρ ⟨x * q.val.val * x⁻¹, by sorry⟩ v := sorry
/- Check `SmoothRep.orbitRepresentation_action`: the orbit Hx uses xqx⁻¹, fixing the direction of transport. -/
example (H Q : Subgroup G) (x : G) (V : SmoothRep A H)
    (q : SmoothRep.orbitStabilizer H Q x) (v : V.obj.V) :
    (SmoothRep.orbitRepresentation H Q x V).obj.ρ q v =
      V.obj.ρ ⟨x * q.val.val * x⁻¹, by sorry⟩ v := sorry

/-- Transitivity uses compatible projections and the product of the two square-root moduli. -/
theorem SmoothRep.parabolicInd_trans (L : LeviDecomposition (G := G))
    (R : LeviDecomposition (G := L.M)) (S : LeviDecomposition (G := G))
    (hSP : S.P ≤ L.P)
    (hP : S.P = (R.P.comap L.projection).map L.P.subtype)
    (e : R.M ≃* S.M) (he : ∀ m, (e m).val = m.val.val)
    (lift : S.P →* R.P)
    (hlift : ∀ s, (lift s).val = L.projection ⟨s.val, hSP s.property⟩)
    (hproj : ∀ s, S.projection s = e (R.projection (lift s)))
    (δL : L.P →* Aˣ) (δR : R.P →* Aˣ) (δS : S.P →* Aˣ)
    (hδL : IsSmoothCharacter δL) (hδR : IsSmoothCharacter δR)
    (hδS : IsSmoothCharacter δS)
    (hδ : ∀ s, δS s = δL ⟨s.val, hSP s.property⟩ * δR (lift s)) :
    Nonempty (SmoothRep.parabolicIndFunctor R δR hδR ⋙
      SmoothRep.parabolicIndFunctor L δL hδL ≅
      SmoothRep.res e.symm.toMonoidHom (by sorry) ⋙
        SmoothRep.parabolicIndFunctor S δS hδS) := sorry
end InductionCompatibility

section UniversalPrincipalSeries
open CategoryTheory
open TauCetiRoadmap.ReductiveGroupsPartII BruhatTits
open scoped PointTopology MonoidAlgebra IsMulCommutative
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] {H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F}
  (D : LocalRootData F H)

/-- The coefficient lattice acts on compact induction by normalized left translation;
its sign is opposite to the untransported HKP action. -/
theorem SmoothRep.universalUnramifiedTwist_principal
    (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
    (l : RationalParabolic.Cocharacter H)
    (hT : (RationalParabolic.decomposition H l).M = D.rootDatum.T) :
    let L := RationalParabolic.decomposition H l
    letI : IsMulCommutative (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup) := by sorry
    let B := MonoidAlgebra ℂ (L.M ⧸ SmoothRep.compactlyGeneratedSubgroup)
    let J := (SmoothRep.compactlyGeneratedSubgroup.comap L.projection).map L.P.subtype
    let W := SmoothRep.universalUnramifiedTwist L (RationalParabolic.halfModulus H l)
      (RationalParabolic.halfModulus_smooth H l) (SmoothRep.trivial (ModuleCat.of ℂ ℂ))
    ∃ e : (SmoothRep.restrictScalars (A := ℂ) (B := B)).obj W ≅
      SmoothRep.cInd J (SmoothRep.trivial (ModuleCat.of ℂ ℂ)),
      ∀ (m : L.M) (v : W.obj.V) (g : RationalParabolic.Points H),
        (e.hom.hom.hom ((MonoidAlgebra.single (QuotientGroup.mk m) 1 : B) • v)).val.val g =
          ((RationalParabolic.halfModulusM H l m : ℂ)⁻¹) *
            (e.hom.hom.hom v).val.val (m.val * g) := sorry
end UniversalPrincipalSeries

section OrbitCharacterCheck
open CategoryTheory

theorem SmoothRep.orbitRepresentation_weyl (p : ℕ) [Fact p.Prime]
    (χ : PadicGL2.diagonal p →* ℂˣ) (hχ : IsSmoothCharacter χ) (a d : ℚ_[p]ˣ) :
    let w : PadicGL2.Group p :=
      { val := !![0, 1; 1, 0]
        inv := !![0, 1; 1, 0]
        val_inv := by sorry
        inv_val := by sorry }
    let V := SmoothRep.orbitRepresentation (PadicGL2.diagonal p) (PadicGL2.diagonal p) w
      (SmoothRep.ofCharacter χ hχ)
    V.obj.ρ ⟨PadicGL2.diag p a d, by sorry⟩ (1 : ℂ) = (χ (PadicGL2.diag p d a) : ℂ) := sorry
/- Check `SmoothRep.orbitRepresentation_weyl`: the nontrivial GL₂ Weyl element exchanges the two inducing characters. -/
example (p : ℕ) [Fact p.Prime] (χ : PadicGL2.diagonal p →* ℂˣ)
    (hχ : IsSmoothCharacter χ) (a d : ℚ_[p]ˣ) :
    let w : PadicGL2.Group p :=
      { val := !![0, 1; 1, 0]
        inv := !![0, 1; 1, 0]
        val_inv := by sorry
        inv_val := by sorry }
    let V := SmoothRep.orbitRepresentation (PadicGL2.diagonal p) (PadicGL2.diagonal p) w
      (SmoothRep.ofCharacter χ hχ)
    V.obj.ρ ⟨PadicGL2.diag p a d, by sorry⟩ (1 : ℂ) = (χ (PadicGL2.diag p d a) : ℂ) := sorry
end OrbitCharacterCheck

section JacquetOperators
open CategoryTheory
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

/-- The characteristic-double-coset operator for volume(K)=1, acting on K-invariants. -/
def SmoothRep.heckeOperator (K : OpenSubgroup G) (hc : _root_.IsCompact (K : Set G))
    (V : SmoothRep ℂ G) (g : G) : Module.End ℂ (SmoothRep.invariants K.toSubgroup V) where
  toFun v := ⟨(Nat.card (K ⧸ (K.toSubgroup.map (MulAut.conj g).toMonoidHom).comap
      K.toSubgroup.subtype) : ℂ) •
    Representation.averaging V.obj.ρ V.property K hc (by sorry) (V.obj.ρ g v.val), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- The quotient map restricted to K-invariants lands in the K∩M-invariants. -/
def SmoothRep.jacquetProjection (L : LeviDecomposition (G := G)) (K : Subgroup G)
    (V : SmoothRep ℂ G) : SmoothRep.invariants K V →ₗ[ℂ]
      SmoothRep.invariants (K.comap L.M.subtype) (SmoothRep.jacquet L V) where
  toFun v := ⟨Representation.Coinvariants.mk (V.obj.ρ.comp L.N.subtype) v.val, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

theorem SmoothRep.heckeOperator_identity (K : OpenSubgroup G)
    (hc : _root_.IsCompact (K : Set G)) (V : SmoothRep ℂ G) :
    SmoothRep.heckeOperator K hc V 1 = 1 := sorry
/- Check `SmoothRep.heckeOperator_identity`: the level subgroup acts by the identity projector. -/
example (K : OpenSubgroup G) (hc : _root_.IsCompact (K : Set G)) (V : SmoothRep ℂ G) :
    SmoothRep.heckeOperator K hc V 1 = 1 := sorry

theorem SmoothRep.heckeOperator_normalizer (K : OpenSubgroup G)
    (hc : _root_.IsCompact (K : Set G)) (V : SmoothRep ℂ G)
    (g : Subgroup.normalizer (K : Set G)) (v : SmoothRep.invariants K.toSubgroup V) :
    (SmoothRep.heckeOperator K hc V g.val v).val = V.obj.ρ g.val v.val := sorry
/- Check `SmoothRep.heckeOperator_normalizer`: a normalizing coset has one right coset and no extra index factor. -/
example (K : OpenSubgroup G) (hc : _root_.IsCompact (K : Set G)) (V : SmoothRep ℂ G)
    (g : Subgroup.normalizer (K : Set G)) (v : SmoothRep.invariants K.toSubgroup V) :
    (SmoothRep.heckeOperator K hc V g.val v).val = V.obj.ρ g.val v.val := sorry

theorem SmoothRep.heckeOperator_trivial (K : OpenSubgroup G)
    (hc : _root_.IsCompact (K : Set G)) (g : G) :
    (SmoothRep.heckeOperator K hc (SmoothRep.trivial (ModuleCat.of ℂ ℂ)) g ⟨1, by sorry⟩).val =
      (Nat.card (K ⧸ (K.toSubgroup.map (MulAut.conj g).toMonoidHom).comap
        K.toSubgroup.subtype) : ℂ) := sorry
/- Check `SmoothRep.heckeOperator_trivial`: on the trivial line the eigenvalue is the number of right cosets. -/
example (K : OpenSubgroup G) (hc : _root_.IsCompact (K : Set G)) (g : G) :
    (SmoothRep.heckeOperator K hc (SmoothRep.trivial (ModuleCat.of ℂ ℂ)) g ⟨1, by sorry⟩).val =
      (Nat.card (K ⧸ (K.toSubgroup.map (MulAut.conj g).toMonoidHom).comap
        K.toSubgroup.subtype) : ℂ) := sorry

theorem SmoothRep.jacquetProjection_self (K : Subgroup G) (V : SmoothRep ℂ G) :
    Function.Bijective (SmoothRep.jacquetProjection (LeviDecomposition.self) K V) := sorry
/- Check `SmoothRep.jacquetProjection_self`: the whole-group parabolic loses no invariant vector. -/
example (K : Subgroup G) (V : SmoothRep ℂ G) :
    Function.Bijective (SmoothRep.jacquetProjection (LeviDecomposition.self) K V) := sorry

theorem SmoothRep.jacquetProjection_trivial (L : LeviDecomposition (G := G)) (K : Subgroup G) :
    Function.Bijective (SmoothRep.jacquetProjection L K (SmoothRep.trivial (ModuleCat.of ℂ ℂ))) := sorry
/- Check `SmoothRep.jacquetProjection_trivial`: a trivial line survives every radical. -/
example (L : LeviDecomposition (G := G)) (K : Subgroup G) :
    Function.Bijective (SmoothRep.jacquetProjection L K (SmoothRep.trivial (ModuleCat.of ℂ ℂ))) := sorry

theorem SmoothRep.jacquetProjection_zero (L : LeviDecomposition (G := G)) (K : Subgroup G)
    (V : SmoothRep ℂ G) (hV : Subsingleton (SmoothRep.jacquet L V).obj.V) :
    SmoothRep.jacquetProjection L K V = 0 := sorry
/- Check `SmoothRep.jacquetProjection_zero`: a vanishing Jacquet module forces the projection to vanish. -/
example (L : LeviDecomposition (G := G)) (K : Subgroup G) (V : SmoothRep ℂ G)
    (hV : Subsingleton (SmoothRep.jacquet L V).obj.V) : SmoothRep.jacquetProjection L K V = 0 := sorry
end JacquetOperators

section RationalStabilization
open CategoryTheory ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)
  (hH : TauCeti.reductiveCommHopfAlgProperty F H)
  (l : RationalParabolic.Cocharacter H)
  (K : OpenSubgroup (RationalParabolic.Points H))
  (hc : IsCompact (K : Set (RationalParabolic.Points H)))
  (hgood : HasIwahoriDecomposition K.toSubgroup (RationalParabolic.decomposition H l).M
    (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N)

include hH hgood in
theorem RationalParabolic.stabilization :
    ∃ c : ℕ, 0 < c ∧
      (∀ V : SmoothRep ℂ (RationalParabolic.Points H), Representation.IsIrreducible V.obj.ρ →
        Module.finrank ℂ (SmoothRep.invariants K.toSubgroup V) ≤ c) ∧
      ∀ (V : SmoothRep ℂ (RationalParabolic.Points H))
        (a : (RationalParabolic.decomposition H l).M),
        IsStronglyPositive K.toSubgroup (RationalParabolic.decomposition H l).M
          (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N a →
        ∀ n ≥ c,
          let T := SmoothRep.heckeOperator K hc V a.val
          IsCompl (LinearMap.ker (T^n)) (LinearMap.range (T^n)) ∧
          LinearMap.ker (T^n) = LinearMap.ker (T^(n+1)) ∧
          LinearMap.range (T^n) = LinearMap.range (T^(n+1)) ∧
          LinearMap.ker (T^n) = LinearMap.ker
            (SmoothRep.jacquetProjection (RationalParabolic.decomposition H l) K.toSubgroup V) ∧
          ∃ e : LinearMap.range (T^n) ≃ₗ[ℂ]
            SmoothRep.invariants (K.toSubgroup.comap (RationalParabolic.decomposition H l).M.subtype)
              (SmoothRep.jacquet (RationalParabolic.decomposition H l) V),
            ∀ v, e v = SmoothRep.jacquetProjection (RationalParabolic.decomposition H l)
              K.toSubgroup V v.val := sorry

include hH hc hgood in
theorem RationalParabolic.jacquet_surjective (V : SmoothRep ℂ (RationalParabolic.Points H)) :
    Function.Surjective (SmoothRep.jacquetProjection (RationalParabolic.decomposition H l)
      K.toSubgroup V) := sorry

include hH hgood in
theorem RationalParabolic.jacquet_canonical_lifting :
    ∃ sectionMap : ∀ V : SmoothRep ℂ (RationalParabolic.Points H),
      SmoothRep.invariants (K.toSubgroup.comap (RationalParabolic.decomposition H l).M.subtype)
        (SmoothRep.jacquet (RationalParabolic.decomposition H l) V) →ₗ[ℂ]
          SmoothRep.invariants K.toSubgroup V,
      (∀ V, (SmoothRep.jacquetProjection (RationalParabolic.decomposition H l) K.toSubgroup V).comp
        (sectionMap V) = LinearMap.id) ∧
      (∀ (V W : SmoothRep ℂ (RationalParabolic.Points H)) (f : V ⟶ W) v,
        f.hom.hom (sectionMap V v).val =
          (sectionMap W ⟨((SmoothRep.jacquetFunctor (RationalParabolic.decomposition H l)).map f).hom.hom
            v.val, by sorry⟩).val) ∧
      ∀ (V : SmoothRep ℂ (RationalParabolic.Points H))
        (a : (RationalParabolic.decomposition H l).M),
        IsStronglyPositive K.toSubgroup (RationalParabolic.decomposition H l).M
          (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N a →
        ∃ n : ℕ, ∀ m ≥ n,
          LinearMap.range (sectionMap V) = LinearMap.range ((SmoothRep.heckeOperator K hc V a.val)^m) := sorry

include hH hgood in
theorem RationalParabolic.jacquet_hecke (V : SmoothRep ℂ (RationalParabolic.Points H))
    (a : (RationalParabolic.decomposition H l).M)
    (ha : a ∈ positiveMonoid K.toSubgroup (RationalParabolic.decomposition H l).M
      (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N)
    (hcentral : a ∈ Subgroup.center (RationalParabolic.decomposition H l).M)
    (v : SmoothRep.invariants K.toSubgroup V) :
    (SmoothRep.jacquetProjection (RationalParabolic.decomposition H l) K.toSubgroup V
      (SmoothRep.heckeOperator K hc V a.val v)).val =
      ((RationalParabolic.halfModulusM H l a : ℂ)^2)⁻¹ •
        (SmoothRep.jacquet (RationalParabolic.decomposition H l) V).obj.ρ a
          (SmoothRep.jacquetProjection (RationalParabolic.decomposition H l) K.toSubgroup V v).val := sorry
end RationalStabilization

section CasselmanPairing
open CategoryTheory ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)

set_option maxHeartbeats 1600000 in
theorem RationalParabolic.casselman_pairing (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : RationalParabolic.Cocharacter H)
    (K : OpenSubgroup (RationalParabolic.Points H))
    (hc : IsCompact (K : Set (RationalParabolic.Points H)))
    (hgood : HasIwahoriDecomposition K.toSubgroup (RationalParabolic.decomposition H l).M
      (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N)
    (V : SmoothRep ℂ (RationalParabolic.Points H)) (ha : Representation.IsAdmissible V.obj.ρ) :
    let L := RationalParabolic.decomposition H l
    let Lbar := RationalParabolic.oppositeDecomposition H l
    let rho := V.obj.ρ
    let rhoDual := (SmoothRep.smoothDual V).obj.ρ
    let p := Representation.Coinvariants.mk (rho.comp L.N.subtype)
    let pbar := Representation.Coinvariants.mk (rhoDual.comp Lbar.N.subtype)
    ∃! B : Representation.Coinvariants (rho.comp L.N.subtype) →ₗ[ℂ]
        (Representation.Coinvariants (rhoDual.comp Lbar.N.subtype) →ₗ[ℂ] ℂ),
      (∀ a : L.M, IsStronglyPositive K.toSubgroup L.M L.N Lbar.N a →
        ∀ (v : V.obj.V) (ell : (SmoothRep.smoothDual V).obj.V),
          ∀ᶠ n : ℕ in Filter.atTop,
            B (p (rho (a.val^n) v)) (pbar ell) = ell.val (rho (a.val^n) v)) ∧
      (∀ (m : L.M) (v : V.obj.V) (ell : (SmoothRep.smoothDual V).obj.V),
        B (p (rho m.val v)) (pbar (rhoDual m.val ell)) = B (p v) (pbar ell)) ∧
      (∀ u, (∀ v, B u v = 0) → u = 0) ∧
      (∀ v, (∀ u, B u v = 0) → v = 0) := sorry

end CasselmanPairing

section CompactIntertwining
open CategoryTheory
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

/-- Intertwining is a nonzero map over K∩g⁻¹Kg with the transported action. -/
def SmoothRep.intertwiningSet (K : Subgroup G) (V : SmoothRep ℂ K) : Set G :=
  {g | ∃ f : (SmoothRep.res (SmoothRep.orbitStabilizer K K g).subtype
      continuous_subtype_val).obj V ⟶ SmoothRep.orbitRepresentation K K g V, f ≠ 0}

theorem SmoothRep.intertwiningSet_zero (K : Subgroup G) (V : SmoothRep ℂ K)
    (hV : Limits.IsZero V) : SmoothRep.intertwiningSet K V = ∅ := sorry
/- Check `SmoothRep.intertwiningSet_zero`: zero has no nonzero intertwiner. -/
example (K : Subgroup G) (V : SmoothRep ℂ K) (hV : Limits.IsZero V) :
    SmoothRep.intertwiningSet K V = ∅ := sorry

theorem SmoothRep.intertwiningSet_identity (K : Subgroup G) (V : SmoothRep ℂ K)
    (hV : Nontrivial V.obj.V) : (K : Set G) ⊆ SmoothRep.intertwiningSet K V := sorry
/- Check `SmoothRep.intertwiningSet_identity`: every element of K intertwines a nonzero representation. -/
example (K : Subgroup G) (V : SmoothRep ℂ K) (hV : Nontrivial V.obj.V) :
    (K : Set G) ⊆ SmoothRep.intertwiningSet K V := sorry

theorem SmoothRep.intertwiningSet_trivial (K : Subgroup G) :
    SmoothRep.intertwiningSet K (SmoothRep.trivial (ModuleCat.of ℂ ℂ)) = Set.univ := sorry
/- Check `SmoothRep.intertwiningSet_trivial`: the trivial line intertwines across every double coset. -/
example (K : Subgroup G) :
    SmoothRep.intertwiningSet K (SmoothRep.trivial (ModuleCat.of ℂ ℂ)) = Set.univ := sorry

theorem SmoothRep.compact_induction_criterion
    (huni : MeasureTheory.Measure.modularCharacter (G := G) = 1)
    (hcount : ∀ U : OpenSubgroup G, _root_.IsCompact (U : Set G) → Countable (G ⧸ U.toSubgroup))
    (hadm : ∀ V : SmoothRep ℂ G, Representation.IsIrreducible V.obj.ρ →
      Representation.IsAdmissible V.obj.ρ)
    (K : OpenSubgroup G) (hZ : Subgroup.center G ≤ K.toSubgroup)
    (hcompact : _root_.IsCompact ((QuotientGroup.mk : G → G ⧸ Subgroup.center G) '' (K : Set G)))
    (V : SmoothRep ℂ K) (hV : Representation.IsIrreducible V.obj.ρ) :
    (Representation.IsIrreducible (SmoothRep.cInd K.toSubgroup V).obj.ρ ↔
      SmoothRep.intertwiningSet K.toSubgroup V = (K : Set G)) ∧
    (SmoothRep.intertwiningSet K.toSubgroup V = (K : Set G) →
      SmoothRep.IsCompactModuloCenter (SmoothRep.cInd K.toSubgroup V)) := sorry
end CompactIntertwining

section PositiveHeckeCarriers
open CategoryTheory
open scoped MonoidAlgebra
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [TotallyDisconnectedSpace G] [T2Space G]

/-- The characteristic double coset, in the existing permutation-endomorphism algebra. -/
def HeckeAlgebraLevel.doubleCoset (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
    (g : G) : HeckeAlgebraLevel ℤ G U.toSubgroup := by
  letI : IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup := by sorry
  exact (HeckeAlgebraLevel.equivHeckeRing U).symm
    (HeckeCosetModule.of (Finsupp.single
      (HeckeCoset.mk U.toSubgroup U.toSubgroup (⟨g, trivial⟩ : (⊤ : Submonoid G))) 1))

theorem HeckeAlgebraLevel.doubleCoset_coefficient
    (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) (g x : G) :
    let P := Representation.ofMulAction ℤ G (G ⧸ U.toSubgroup)
    (P.asModuleEquiv (HeckeAlgebraLevel.doubleCoset U hc g
      (HeckeAlgebraLevel.basis U.toSubgroup 1))).coeff (QuotientGroup.mk x⁻¹) =
        @ite ℤ (∃ u v : U, x = u.val * g * v.val) (Classical.propDecidable _) 1 0 := sorry

theorem HeckeAlgebraLevel.doubleCoset_identity (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) : HeckeAlgebraLevel.doubleCoset U hc 1 = 1 := sorry
/- Check `HeckeAlgebraLevel.doubleCoset_identity`: the subgroup coset is the unit. -/
example (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) :
    HeckeAlgebraLevel.doubleCoset U hc 1 = 1 := sorry

theorem HeckeAlgebraLevel.doubleCoset_normal (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) [U.toSubgroup.Normal] (g h : G) :
    HeckeAlgebraLevel.doubleCoset U hc g * HeckeAlgebraLevel.doubleCoset U hc h =
      HeckeAlgebraLevel.doubleCoset U hc (g * h) := sorry
/- Check `HeckeAlgebraLevel.doubleCoset_normal`: a normal level recovers group-algebra multiplication. -/
example (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) [U.toSubgroup.Normal] (g h : G) :
    HeckeAlgebraLevel.doubleCoset U hc g * HeckeAlgebraLevel.doubleCoset U hc h =
      HeckeAlgebraLevel.doubleCoset U hc (g * h) := sorry

theorem HeckeAlgebraLevel.doubleCoset_index (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (g : G) :
    let P := Representation.ofMulAction ℤ G (G ⧸ U.toSubgroup)
    (P.asModuleEquiv (HeckeAlgebraLevel.doubleCoset U hc g
      (HeckeAlgebraLevel.basis U.toSubgroup 1))).coeff.sum (fun _ n => n) =
        Nat.card (U ⧸ (U.toSubgroup.map (MulAut.conj g⁻¹).toMonoidHom).comap U.toSubgroup.subtype) := sorry
/- Check `HeckeAlgebraLevel.doubleCoset_index`: augmentation counts the right cosets, not their inverses with multiplicity. -/
example (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) (g : G) :
    let P := Representation.ofMulAction ℤ G (G ⧸ U.toSubgroup)
    (P.asModuleEquiv (HeckeAlgebraLevel.doubleCoset U hc g
      (HeckeAlgebraLevel.basis U.toSubgroup 1))).coeff.sum (fun _ n => n) =
        Nat.card (U ⧸ (U.toSubgroup.map (MulAut.conj g⁻¹).toMonoidHom).comap U.toSubgroup.subtype) := sorry

/-- The subalgebra generated by the indicated double cosets. -/
def HeckeAlgebraLevel.supportAlgebra (U : OpenSubgroup G) (hc : IsCompact (U : Set G))
    (S : Set G) : Subalgebra ℤ (HeckeAlgebraLevel ℤ G U.toSubgroup) :=
  Algebra.adjoin ℤ (HeckeAlgebraLevel.doubleCoset U hc '' S)

theorem HeckeAlgebraLevel.supportAlgebra_empty (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) : HeckeAlgebraLevel.supportAlgebra U hc ∅ = ⊥ := sorry
/- Check `HeckeAlgebraLevel.supportAlgebra_empty`: no generators gives the scalar algebra. -/
example (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) :
    HeckeAlgebraLevel.supportAlgebra U hc ∅ = ⊥ := sorry

theorem HeckeAlgebraLevel.supportAlgebra_subgroup (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) : HeckeAlgebraLevel.supportAlgebra U hc (U : Set G) = ⊥ := sorry
/- Check `HeckeAlgebraLevel.supportAlgebra_subgroup`: elements of the level subgroup add only the unit. -/
example (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) :
    HeckeAlgebraLevel.supportAlgebra U hc (U : Set G) = ⊥ := sorry

theorem HeckeAlgebraLevel.supportAlgebra_full (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) : HeckeAlgebraLevel.supportAlgebra U hc Set.univ = ⊤ := sorry
/- Check `HeckeAlgebraLevel.supportAlgebra_full`: all double cosets span the full algebra. -/
example (U : OpenSubgroup G) (hc : IsCompact (U : Set G)) :
    HeckeAlgebraLevel.supportAlgebra U hc Set.univ = ⊤ := sorry
end PositiveHeckeCarriers

section PositiveHeckeHomomorphism
open CategoryTheory ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology Pointwise
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)
  (hH : TauCeti.reductiveCommHopfAlgProperty F H) (l : RationalParabolic.Cocharacter H)
  (U : OpenSubgroup (RationalParabolic.Points H))
  (hc : IsCompact (U : Set (RationalParabolic.Points H)))
  (hgood : HasIwahoriDecomposition U.toSubgroup (RationalParabolic.decomposition H l).M
    (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N)

include hH hgood in
theorem doubleCoset_mul_of_positive
    (m m' : (RationalParabolic.decomposition H l).M)
    (hm : m ∈ positiveMonoid U.toSubgroup (RationalParabolic.decomposition H l).M
      (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N)
    (hm' : m' ∈ positiveMonoid U.toSubgroup (RationalParabolic.decomposition H l).M
      (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N) :
    (U : Set (RationalParabolic.Points H)) * {m.val} * (U : Set (RationalParabolic.Points H)) *
      {m'.val} * (U : Set (RationalParabolic.Points H)) =
    (U : Set (RationalParabolic.Points H)) * {m.val} *
      ((U.toSubgroup ⊓ (RationalParabolic.decomposition H l).M) : Set (RationalParabolic.Points H)) *
      {m'.val} * (U : Set (RationalParabolic.Points H)) := sorry

include hH hgood in
theorem positiveHeckeHom :
    let L := RationalParabolic.decomposition H l
    let Δ := positiveMonoid U.toSubgroup L.M L.N (RationalParabolic.oppositeDecomposition H l).N
    let UM : OpenSubgroup L.M := U.comap L.M.subtype continuous_subtype_val
    let hcM : IsCompact (UM : Set L.M) := by sorry
    ∃ t : HeckeAlgebraLevel.supportAlgebra UM hcM (Δ : Set L.M) →ₐ[ℤ]
      HeckeAlgebraLevel.supportAlgebra U hc (L.M.subtype '' (Δ : Set L.M)),
      Function.Injective t ∧
      ∀ m : Δ, (t ⟨HeckeAlgebraLevel.doubleCoset UM hcM m.val, by sorry⟩).val =
        HeckeAlgebraLevel.doubleCoset U hc m.val.val := sorry

include hH hgood in
theorem positiveHeckeHom_span :
    let L := RationalParabolic.decomposition H l
    let Δ := positiveMonoid U.toSubgroup L.M L.N (RationalParabolic.oppositeDecomposition H l).N
    (HeckeAlgebraLevel.supportAlgebra U hc (L.M.subtype '' (Δ : Set L.M))).toSubmodule =
      Submodule.span ℤ (HeckeAlgebraLevel.doubleCoset U hc '' (L.M.subtype '' (Δ : Set L.M))) := sorry

include hH hc hgood in
theorem IsStronglyPositive.cofinal (z : (RationalParabolic.decomposition H l).M)
    (hz : IsStronglyPositive U.toSubgroup (RationalParabolic.decomposition H l).M
      (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N z)
    (m : (RationalParabolic.decomposition H l).M) :
    ∃ n : ℕ, m * z^n ∈ positiveMonoid U.toSubgroup (RationalParabolic.decomposition H l).M
      (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N := sorry
include hH hgood in
theorem positiveHeckeHom_injective :
    let L := RationalParabolic.decomposition H l
    let Δ := positiveMonoid U.toSubgroup L.M L.N (RationalParabolic.oppositeDecomposition H l).N
    let UM : OpenSubgroup L.M := U.comap L.M.subtype continuous_subtype_val
    let hcM : IsCompact (UM : Set L.M) := by sorry
    ∀ t : HeckeAlgebraLevel.supportAlgebra UM hcM (Δ : Set L.M) →ₐ[ℤ]
      HeckeAlgebraLevel.supportAlgebra U hc (L.M.subtype '' (Δ : Set L.M)),
      (∀ m : Δ, (t ⟨HeckeAlgebraLevel.doubleCoset UM hcM m.val, by sorry⟩).val =
        HeckeAlgebraLevel.doubleCoset U hc m.val.val) → Function.Injective t := sorry

include hH hgood in
theorem positiveHeckeHom_comp_restrict :
    let L := RationalParabolic.decomposition H l
    let Δ := positiveMonoid U.toSubgroup L.M L.N (RationalParabolic.oppositeDecomposition H l).N
    let UM : OpenSubgroup L.M := U.comap L.M.subtype continuous_subtype_val
    let hcM : IsCompact (UM : Set L.M) := by sorry
    let N₀ := U.toSubgroup ⊓ L.N
    let HM := HeckeAlgebraLevel.supportAlgebra UM hcM (Δ : Set L.M)
    let HG := HeckeAlgebraLevel.supportAlgebra U hc (L.M.subtype '' (Δ : Set L.M))
    let bM : Δ → HM := fun m => ⟨HeckeAlgebraLevel.doubleCoset UM hcM m.val, by sorry⟩
    let bG : Δ → HG := fun m => ⟨HeckeAlgebraLevel.doubleCoset U hc m.val.val, by sorry⟩
    let c : Δ → ℤ := fun m => Nat.card (N₀ ⧸ (N₀.map
      (MulAut.conj m.val.val).toMonoidHom).comap N₀.subtype)
    ∃ (t : HM →ₐ[ℤ] HG) (S : HG →ₗ[ℤ] HM),
      Function.Injective t ∧ (∀ m, t (bM m) = bG m) ∧
      (∀ m, S (bG m) = c m • bM m) ∧
      (∀ m, t (S (bG m)) = c m • bG m) ∧
      (∀ m, S (t (bM m)) = c m • bM m) := sorry

end PositiveHeckeHomomorphism

section BernsteinSubobjects
open CategoryTheory ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)

theorem SmoothRep.bernstein_subrepresentations (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (V : SmoothRep ℂ (RationalParabolic.Points H)) :
    ∃! S : SmoothRep.InertialClass (RationalParabolic.family H) → Subrepresentation V.obj.ρ,
      (⨆ s, (S s).toSubmodule) = ⊤ ∧ iSupIndep (fun s => (S s).toSubmodule) ∧
      ∀ s, ∃ W : SmoothRep.BernsteinBlock (RationalParabolic.family H) s,
        Nonempty (W.obj.obj ≅ Rep.of (S s).toRepresentation) := sorry

/-- A nonempty principal open of the unramified character torus consists of irreducible inductions. -/
theorem SmoothRep.generic_irreducibility (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (l : RationalParabolic.Cocharacter H)
    (σ : SmoothRep ℂ (RationalParabolic.decomposition H l).M)
    (hi : Representation.IsIrreducible σ.obj.ρ) (hc : SmoothRep.IsCompactModuloCenter σ) :
    let M := (RationalParabolic.decomposition H l).M
    ∃ f : MonoidAlgebra ℂ (M ⧸ SmoothRep.compactlyGeneratedSubgroup),
      f ≠ 0 ∧ (∃ χ : SmoothRep.unramifiedCharacters (G := M) ℂ,
        SmoothRep.unramifiedEvaluation χ f ≠ 0) ∧
      (∀ χ : SmoothRep.unramifiedCharacters (G := M) ℂ,
        SmoothRep.unramifiedEvaluation χ f ≠ 0 →
        Representation.IsIrreducible ((RationalParabolic.induction H l).obj
          (SmoothRep.twist σ (SmoothRep.unramifiedCharacter χ)
            (SmoothRep.unramifiedCharacters_isSmoothCharacter χ))).obj.ρ) ∧
      ∀ z : SmoothCentre ℂ (RationalParabolic.Points H),
        ∃ fz : MonoidAlgebra ℂ (M ⧸ SmoothRep.compactlyGeneratedSubgroup),
          ∀ χ : SmoothRep.unramifiedCharacters (G := M) ℂ,
            let W := (RationalParabolic.induction H l).obj
              (SmoothRep.twist σ (SmoothRep.unramifiedCharacter χ)
                (SmoothRep.unramifiedCharacters_isSmoothCharacter χ))
            ∀ v : W.obj.V, (z.app W).hom.hom v = SmoothRep.unramifiedEvaluation χ fz • v := sorry

end BernsteinSubobjects

section CentreInnerAction
open CategoryTheory
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

theorem SmoothRep.innerRestriction (g : G) :
    ∃ e : 𝟭 (SmoothRep A G) ≅ SmoothRep.res (MulAut.conj g).toMonoidHom (by sorry),
      ∀ V v, (e.hom.app V).hom.hom v = V.obj.ρ g v := sorry

theorem SmoothCentre.innerAction (g : G) (z : SmoothCentre A G) (V : SmoothRep A G) :
    (z.app ((SmoothRep.res (MulAut.conj g).toMonoidHom (by sorry)).obj V)).hom.hom.toLinearMap =
      (z.app V).hom.hom.toLinearMap := sorry

variable {J : Type u} [Group J] [TopologicalSpace J] [IsTopologicalGroup J]

theorem SmoothCentre.transport (e : G ≃ₜ* J) :
    ∃ Z : SmoothCentre A G ≃+* SmoothCentre A J,
      ∀ (z : SmoothCentre A G) (V : SmoothRep A J),
        ((Z z).app V).hom.hom.toLinearMap =
          (z.app ((SmoothRep.res e.toMonoidHom e.continuous).obj V)).hom.hom.toLinearMap := sorry
end CentreInnerAction

section WhittakerDomination
open CategoryTheory
open scoped TensorProduct MonoidAlgebra
variable (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (hpℓ : p ≠ ℓ)
  {F k A V : Type} [Field F] [TopologicalSpace F] [ValuativeRel F]
  [IsNonarchimedeanLocalField F] [hAlg : Algebra ℚ_[p] F]
  [hfin : FiniteDimensional ℚ_[p] F] [hcont : ContinuousSMul ℚ_[p] F]
  [Field k] [hkChar : CharP k ℓ] [hkClosed : IsAlgClosed k] [hkPerfect : PerfectRing k ℓ]
  [CommRing A] [IsNoetherianRing A] [hA : Algebra (WittVector ℓ k) A]
  [AddCommGroup V] [Module A V]

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect hA in
/-- Every equivariant operator after tensoring acts on the coefficient factor alone. -/
theorem CoWhittaker.tensorEndomorphisms (n : ℕ) (ψ : Multiplicative F →* Aˣ)
    (hψ : BZDerivative.IsGenericCharacter ψ)
    (ρ : Representation A (GL (Fin (n + 1)) F) V)
    (h : CoWhittaker ρ (BZDerivative.unipotent (n + 1) (n + 1))
      (BZDerivative.character (n + 1) (n + 1) ψ))
    (M : Type) [AddCommGroup M] [Module A M] :
    let σ := (Representation.trivial A (GL (Fin (n + 1)) F) M).tprod ρ
    ∃ e : Module.End A M ≃ₐ[A] Module.End A[GL (Fin (n + 1)) F] σ.asModule,
      ∀ f m v, e f (m ⊗ₜ[A] v) = f m ⊗ₜ[A] v := sorry

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect hA in
/-- The centre character is determined by its scalar action on a co-Whittaker family. -/
theorem CoWhittaker.centerCharacter (n : ℕ)
    (ψ : Multiplicative F →* (WittVector ℓ k)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    (W : SmoothRep A (GL (Fin (n + 1)) F))
    (hW : CoWhittaker W.obj.ρ (BZDerivative.unipotent (n + 1) (n + 1))
      (BZDerivative.character (n + 1) (n + 1)
        ((Units.map (algebraMap (WittVector ℓ k) A).toMonoidHom).comp ψ)))
    (he : e.idempotent.app ((SmoothRep.restrictScalars (A := WittVector ℓ k)).obj W) = 𝟙 _) :
    ∃! φ : SmoothRep.blockCentre e →+* A,
      φ.comp (UniversalWhittaker.coefficientMap ℓ n e) = algebraMap (WittVector ℓ k) A ∧
      ∀ z, z.val.app ((SmoothRep.restrictScalars (A := WittVector ℓ k)).obj W) =
        (SmoothRep.restrictScalars (A := WittVector ℓ k)).map (φ z • 𝟙 W) := sorry

include hpℓ hAlg hfin hcont hkChar hkClosed hkPerfect in
/-- Scalar extension of the universal generic projective dominates all families with its character. -/
theorem UniversalWhittaker.domination (n : ℕ)
    (ψ : Multiplicative F →* (WittVector ℓ k)ˣ) (hψ : BZDerivative.IsGenericCharacter ψ)
    (e : SmoothRep.CentralBlock (A := WittVector ℓ k) (G := GL (Fin (n + 1)) F))
    [Algebra (SmoothRep.blockCentre e) A]
    (hcompat : (algebraMap (SmoothRep.blockCentre e) A).comp
      (UniversalWhittaker.coefficientMap ℓ n e) = algebraMap (WittVector ℓ k) A) :
    let ψA := (Units.map (algebraMap (WittVector ℓ k) A).toMonoidHom).comp ψ
    let U := BZDerivative.unipotent (n + 1) (n + 1) (F := F)
    let χ := BZDerivative.character (n + 1) (n + 1) ψA
    let ρ := _root_.Representation.baseChange A (UniversalWhittaker.centerRepresentation ℓ n ψ hψ e)
    CoWhittaker ρ U χ ∧ ∀ W : SmoothRep A (GL (Fin (n + 1)) F),
      CoWhittaker W.obj.ρ U χ →
      (∀ z, z.val.app ((SmoothRep.restrictScalars (A := WittVector ℓ k)).obj W) =
        (SmoothRep.restrictScalars (A := WittVector ℓ k)).map
          (algebraMap (SmoothRep.blockCentre e) A z • 𝟙 W)) →
      ∃ f : Representation.IntertwiningMap ρ W.obj.ρ, Function.Surjective f := sorry
end WhittakerDomination

section CuspidalLevelFiniteness
open CategoryTheory ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)
  (hH : TauCeti.reductiveCommHopfAlgProperty F H)
include hH

/-- At fixed level there are finitely many cuspidal classes modulo unramified twist. -/
theorem SmoothRep.cuspidalComponents_finite (K : OpenSubgroup (RationalParabolic.Points H))
    (hK : _root_.IsCompact (K : Set (RationalParabolic.Points H))) :
    ∃ (n : ℕ) (σ : Fin n → SmoothRep ℂ (RationalParabolic.Points H)),
      (∀ i, Representation.IsIrreducible (σ i).obj.ρ ∧ SmoothRep.IsCompactModuloCenter (σ i)) ∧
      ∀ V : SmoothRep ℂ (RationalParabolic.Points H), Representation.IsIrreducible V.obj.ρ →
        SmoothRep.IsCompactModuloCenter V → Nontrivial (SmoothRep.invariants K.toSubgroup V) →
        ∃ i χ, Nonempty (V ≅ SmoothRep.twist (σ i) (SmoothRep.unramifiedCharacter χ)
          (SmoothRep.unramifiedCharacters_isSmoothCharacter χ)) := sorry

/-- On G° the fixed-level cuspidal list is finite without quotienting by unramified twists. -/
theorem SmoothRep.cuspidalRestriction_finite
    (K : OpenSubgroup (RationalParabolic.Points H))
    (hK : _root_.IsCompact (K : Set (RationalParabolic.Points H))) :
    let G₀ := SmoothRep.compactlyGeneratedSubgroup (G := RationalParabolic.Points H)
    ∃ (n : ℕ) (σ : Fin n → SmoothRep ℂ G₀),
      ∀ V : SmoothRep ℂ G₀, Representation.IsIrreducible V.obj.ρ →
        SmoothRep.IsCompact V → Nontrivial (SmoothRep.invariants (K.toSubgroup.comap G₀.subtype) V) →
        ∃ i, Nonempty (V ≅ σ i) := sorry
end CuspidalLevelFiniteness

section LevelCategories
open CategoryTheory
variable {A G : Type} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Generation by the translates of the actual fixed-vector submodule. -/
def SmoothRep.GeneratedByInvariants (K : Subgroup G) (V : SmoothRep A G) : Prop :=
  Submodule.span A {v | ∃ (g : G) (w : SmoothRep.invariants K V), v = V.obj.ρ g w.val} = ⊤

abbrev SmoothRep.LevelCategory (A : Type) [CommRing A] (G : Type) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] (K : Subgroup G) :=
  CategoryTheory.ObjectProperty.FullSubcategory (SmoothRep.GeneratedByInvariants (A := A) K)

theorem SmoothRep.GeneratedByInvariants_zero (K : Subgroup G) (V : SmoothRep A G)
    (hV : Subsingleton V.obj.V) : SmoothRep.GeneratedByInvariants K V := sorry
/- Check `SmoothRep.GeneratedByInvariants_zero`: the empty span generates a zero representation. -/
example (K : Subgroup G) (V : SmoothRep A G) (hV : Subsingleton V.obj.V) :
    SmoothRep.GeneratedByInvariants K V := sorry

theorem SmoothRep.GeneratedByInvariants_trivial (K : Subgroup G) (M : ModuleCat A) :
    SmoothRep.GeneratedByInvariants K (SmoothRep.trivial M) := sorry
/- Check `SmoothRep.GeneratedByInvariants_trivial`: all vectors of a trivial module are fixed. -/
example (K : Subgroup G) (M : ModuleCat A) :
    SmoothRep.GeneratedByInvariants K (SmoothRep.trivial M) := sorry

theorem SmoothRep.GeneratedByInvariants_vanishing (K : Subgroup G) (V : SmoothRep A G)
    (hK : Subsingleton (SmoothRep.invariants K V)) :
    SmoothRep.GeneratedByInvariants K V ↔ Subsingleton V.obj.V := sorry
/- Check `SmoothRep.GeneratedByInvariants_vanishing`: a nonzero representation with no fixed vectors is excluded. -/
example (K : Subgroup G) (V : SmoothRep A G) (hK : Subsingleton (SmoothRep.invariants K V)) :
    SmoothRep.GeneratedByInvariants K V ↔ Subsingleton V.obj.V := sorry
end LevelCategories

section IwahoriCategory
open CategoryTheory ValuativeRel
open TauCetiRoadmap.ReductiveGroupsPartII BruhatTits
open scoped PointTopology
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] [ModelField F]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F}
  (D : LocalRootData F H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
  (a : BaseAlcove D φ) (l : RationalParabolic.Cocharacter H)
  (hl : RationalParabolic.IsMinimal H l)
  (hT : (RationalParabolic.decomposition H l).M = D.rootDatum.T)
  (hgood : HasIwahoriDecomposition a.iwahori (RationalParabolic.decomposition H l).M
    (RationalParabolic.decomposition H l).N (RationalParabolic.oppositeDecomposition H l).N)

include hl hT hgood in
theorem SmoothRep.iwahori_jacquet (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hV : Representation.IsAdmissible V.obj.ρ) :
    Function.Bijective (SmoothRep.jacquetProjection (RationalParabolic.decomposition H l)
      a.iwahori V) := sorry

include hl hT hgood in
theorem SmoothRep.iwahori_equivalence :
    let I : OpenSubgroup (RationalParabolic.Points H) := ⟨a.iwahori, by sorry⟩
    ∃ E : SmoothRep.LevelCategory ℂ (RationalParabolic.Points H) a.iwahori ≌
        ModuleCat (HeckeAlgebraLevel ℂ (RationalParabolic.Points H) a.iwahori)ᵐᵒᵖ,
      Nonempty (E.functor ≅
        ObjectProperty.ι (SmoothRep.GeneratedByInvariants (A := ℂ) a.iwahori) ⋙ SmoothRep.cornerFunctor I) := sorry

include hl hT hgood in
theorem SmoothRep.iwahori_subobjects (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hV : SmoothRep.GeneratedByInvariants a.iwahori V) (S : Subrepresentation V.obj.ρ) :
    SmoothRep.GeneratedByInvariants a.iwahori
      (⟨Rep.of S.toRepresentation, by sorry⟩ : SmoothRep ℂ (RationalParabolic.Points H)) := sorry

include hl hT hgood in
theorem SmoothRep.iwahori_principalSeries (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hV : Representation.IsIrreducible V.obj.ρ) :
    Nontrivial (SmoothRep.invariants a.iwahori V) ↔
      ∃ χ : SmoothRep.unramifiedCharacters (G := (RationalParabolic.decomposition H l).M) ℂ,
        ∃ f : V ⟶ (RationalParabolic.induction H l).obj
          (SmoothRep.ofCharacter (SmoothRep.unramifiedCharacter χ)
            (SmoothRep.unramifiedCharacters_isSmoothCharacter χ)), Mono f := sorry

include hl hT hgood in
theorem SmoothRep.iwahori_finite (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hV : Representation.IsAdmissible V.obj.ρ) :
    Module.Finite ℂ (SmoothRep.invariants a.iwahori V) := sorry
end IwahoriCategory

section RationalExponentCones
open CategoryTheory ValuativeRel
open TauCetiRoadmap.ReductiveGroupsPartII BruhatTits
open scoped PointTopology NNReal
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)
  (hH : TauCeti.reductiveCommHopfAlgProperty F H)

/-- The maximal split subtorus contained in the centre of this rational Levi. -/
def RationalParabolic.splitCenter (l : RationalParabolic.Cocharacter H) : TauCeti.HopfIdeal F H := sorry

include hH in
theorem RationalParabolic.splitCenter_characterization (l : RationalParabolic.Cocharacter H) :
    Minimal (fun S : TauCeti.HopfIdeal F H =>
      TauCeti.splitTorusCommHopfAlgProperty F (TauCeti.FiniteTypeCommHopfAlgCat.quotient H S) ∧
      subgroupPoints S F ≤ ((Subgroup.center (RationalParabolic.decomposition H l).M).map
        (RationalParabolic.decomposition H l).M.subtype)) (RationalParabolic.splitCenter H l) := sorry

include hH in
theorem RationalParabolic.splitCenter_torus (hT : TauCeti.splitTorusCommHopfAlgProperty F H)
    (l : RationalParabolic.Cocharacter H) : RationalParabolic.splitCenter H l = ⊥ := sorry
include hH in
/- Check `RationalParabolic.splitCenter_torus`: for a split torus the whole group is its split centre. -/
example (hT : TauCeti.splitTorusCommHopfAlgProperty F H) (l : RationalParabolic.Cocharacter H) :
    RationalParabolic.splitCenter H l = ⊥ := sorry

include hH in
theorem RationalParabolic.splitCenter_finite (l : RationalParabolic.Cocharacter H)
    (hf : Finite (Subgroup.center (RationalParabolic.decomposition H l).M)) :
    subgroupPoints (RationalParabolic.splitCenter H l) F = ⊥ := sorry
include hH in
/- Check `RationalParabolic.splitCenter_finite`: a Levi with finite centre has no nontrivial split central torus. -/
example (l : RationalParabolic.Cocharacter H)
    (hf : Finite (Subgroup.center (RationalParabolic.decomposition H l).M)) :
    subgroupPoints (RationalParabolic.splitCenter H l) F = ⊥ := sorry

include hH in
theorem RationalParabolic.splitCenter_minimal (D : LocalRootData F H)
    (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
    (l : RationalParabolic.Cocharacter H)
    (hM : (RationalParabolic.decomposition H l).M = D.rootDatum.T) :
    subgroupPoints (RationalParabolic.splitCenter H l) F = (RationalParabolic.decomposition H l).M := sorry
include hH in
/- Check `RationalParabolic.splitCenter_minimal`: the minimal Levi of a split group is its own split centre. -/
example (D : LocalRootData F H)
    (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
    (l : RationalParabolic.Cocharacter H)
    (hM : (RationalParabolic.decomposition H l).M = D.rootDatum.T) :
    subgroupPoints (RationalParabolic.splitCenter H l) F = (RationalParabolic.decomposition H l).M := sorry

/-- All proper rational parabolics, with positive relative roots of their radicals.
Testing all conjugates is equivalent to choosing standard parabolics. -/
def RationalParabolic.casselmanData : CasselmanData (G := RationalParabolic.Points H) where
  Index := {l : RationalParabolic.Cocharacter H // (RationalParabolic.decomposition H l).P ≠ ⊤}
  levi i := RationalParabolic.decomposition H i.val
  splitCentre i := (subgroupPoints (RationalParabolic.splitCenter H i.val) F).subgroupOf
    (RationalParabolic.decomposition H i.val).M
  central := by sorry
  halfModulus i := RationalParabolic.halfModulusM H i.val
  smooth_half := by sorry
  roots i := by
    classical
    let S := RationalParabolic.splitCenter H i.val
    letI : Fintype (GeometricRoots.Root S) := by sorry
    let J := (Finset.univ : Finset (GeometricRoots.Root S)).filter
      (fun α => subgroupPoints (GeometricRoots.rootSubgroup S α) F ≤
        (RationalParabolic.decomposition H i.val).N)
    exact J.image fun α =>
      { toFun := fun t =>
          (Nat.card 𝓀[F] : ℝ≥0) ^ (-Multiplicative.toAdd (normalizedOrder (K := F)
            (GeometricRoots.characterValue S α.val F ⟨t.val.val, t.property⟩)))
        map_one' := by sorry
        map_mul' := by sorry }

include hH in
theorem RationalParabolic.casselmanData_cone (i : (RationalParabolic.casselmanData H).Index)
    (a : (RationalParabolic.casselmanData H).splitCentre i) :
    a ∈ (RationalParabolic.casselmanData H).negativeCone i ↔
      ∀ α : GeometricRoots.Root (RationalParabolic.splitCenter H i.val),
        subgroupPoints (GeometricRoots.rootSubgroup _ α) F ≤
          (RationalParabolic.decomposition H i.val).N →
        0 ≤ Multiplicative.toAdd (normalizedOrder (K := F)
          (GeometricRoots.characterValue _ α.val F ⟨a.val.val, a.property⟩)) := sorry

include hH in
theorem RationalParabolic.casselmanData_torus (hT : TauCeti.torusCommHopfAlgProperty F H) :
    IsEmpty (RationalParabolic.casselmanData H).Index := sorry
include hH in
/- Check `RationalParabolic.casselmanData_torus`: an anisotropic or split torus has no proper parabolic test. -/
example (hT : TauCeti.torusCommHopfAlgProperty F H) :
    IsEmpty (RationalParabolic.casselmanData H).Index := sorry

include hH in
theorem RationalParabolic.casselmanData_unit (i : (RationalParabolic.casselmanData H).Index) :
    1 ∈ (RationalParabolic.casselmanData H).negativeCone i ∧
      1 ∈ (RationalParabolic.casselmanData H).compactCentral i := sorry
include hH in
/- Check `RationalParabolic.casselmanData_unit`: the identity is on the cone but excluded from strict testing. -/
example (i : (RationalParabolic.casselmanData H).Index) :
    1 ∈ (RationalParabolic.casselmanData H).negativeCone i ∧
      1 ∈ (RationalParabolic.casselmanData H).compactCentral i := sorry

include hH in
theorem RationalParabolic.casselmanData_expanding (i : (RationalParabolic.casselmanData H).Index)
    (a : (RationalParabolic.casselmanData H).splitCentre i)
    (α : GeometricRoots.Root (RationalParabolic.splitCenter H i.val))
    (hα : subgroupPoints (GeometricRoots.rootSubgroup _ α) F ≤
      (RationalParabolic.decomposition H i.val).N)
    (ha : Multiplicative.toAdd (normalizedOrder (K := F)
      (GeometricRoots.characterValue _ α.val F ⟨a.val.val, a.property⟩)) < 0) :
    a ∉ (RationalParabolic.casselmanData H).negativeCone i := sorry
include hH in
/- Check `RationalParabolic.casselmanData_expanding`: an expanding radical root excludes the element. -/
example (i : (RationalParabolic.casselmanData H).Index)
    (a : (RationalParabolic.casselmanData H).splitCentre i)
    (α : GeometricRoots.Root (RationalParabolic.splitCenter H i.val))
    (hα : subgroupPoints (GeometricRoots.rootSubgroup _ α) F ≤
      (RationalParabolic.decomposition H i.val).N)
    (ha : Multiplicative.toAdd (normalizedOrder (K := F)
      (GeometricRoots.characterValue _ α.val F ⟨a.val.val, a.property⟩)) < 0) :
    a ∉ (RationalParabolic.casselmanData H).negativeCone i := sorry

include hH in
theorem RationalParabolic.casselman_criterion (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hV : Representation.IsAdmissible V.obj.ρ) :
    SmoothRep.IsSquareIntegrable V ↔ (RationalParabolic.casselmanData H).StrictExponentBound V := sorry

include hH in
theorem SmoothRep.IsSquareIntegrable.isTempered (V : SmoothRep ℂ (RationalParabolic.Points H))
    (hV : SmoothRep.IsSquareIntegrable V) :
    SmoothRep.IsTempered (RationalParabolic.casselmanData H) V := sorry
end RationalExponentCones

section PrincipalSeriesJacquet
open CategoryTheory ValuativeRel
open TauCetiRoadmap.ReductiveGroupsPartII BruhatTits
open scoped PointTopology MonoidAlgebra DirectSum
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] [ModelField F]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F}
  (D : LocalRootData F H) (l : RationalParabolic.Cocharacter H)
  (hl : RationalParabolic.IsMinimal H l)
  (hT : (RationalParabolic.decomposition H l).M = D.rootDatum.T)
  (hqs : TauCeti.torusCommHopfAlgProperty F
    (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (GeometricRoots.centralizerIdeal D.splitTorus)))
  (n : ℕ) (r : Fin n → D.normalizer)
  (hr : Function.Bijective (fun i =>
    (QuotientGroup.mk (r i) : IwahoriWeylGroup.RelativeWeylGroup D)))
  (e : Fin n → ((RationalParabolic.decomposition H l).M ≃ₜ*
    (RationalParabolic.decomposition H l).M))
  (he : ∀ i m, (e i m).val = (r i).val⁻¹ * m.val * (r i).val)
  (χ : (RationalParabolic.decomposition H l).M →* ℂˣ) (hχ : IsSmoothCharacter χ)

include hl hT hqs hr he in
theorem SmoothRep.principalSeries_jacquet_filtration :
    let V := (RationalParabolic.induction H l).obj (SmoothRep.ofCharacter χ hχ)
    ∃ F : SmoothRep.Filtration ((RationalParabolic.restriction H l).obj V) n,
      ∃ s : Equiv.Perm (Fin n), ∀ i,
        Nonempty (F.graded i ≅ SmoothRep.ofCharacter
          (χ.comp (e (s i)).toMonoidHom) (by sorry)) := sorry

include hl hT hqs hr he in
theorem SmoothRep.principalSeries_jacquet_regular
    (hreg : Function.Injective (fun i => χ.comp (e i).toMonoidHom)) :
    let V := (RationalParabolic.induction H l).obj (SmoothRep.ofCharacter χ hχ)
    Nonempty (((RationalParabolic.restriction H l).obj V).obj ≅
      Rep.of (Representation.directSum (fun i : Fin n =>
        Representation.ofLinearCharacter (χ.comp (e i).toMonoidHom)))) := sorry

include hl hT hqs hr he in
theorem SmoothRep.principalSeries_subquotient
    (π : SmoothRep ℂ (RationalParabolic.Points H)) (hπ : Representation.IsIrreducible π.obj.ρ)
    (hsub : SmoothRep.IsSubquotient π
      ((RationalParabolic.induction H l).obj (SmoothRep.ofCharacter χ hχ))) :
    let J := (RationalParabolic.restriction H l).obj π
    Nontrivial J.obj.V ∧
      (∃ (m : ℕ) (j : Fin m ↪ Fin n) (F : SmoothRep.Filtration J m),
        ∀ i, Nonempty (F.graded i ≅
          SmoothRep.ofCharacter (χ.comp (e (j i)).toMonoidHom) (by sorry))) ∧
      ∃ i, ∃ f : π ⟶ (RationalParabolic.induction H l).obj
        (SmoothRep.ofCharacter (χ.comp (e i).toMonoidHom) (by sorry)), Mono f := sorry

include hl hT hqs hr he in
theorem SmoothRep.principalSeries_length :
    Module.length ℂ[RationalParabolic.Points H]
      ((RationalParabolic.induction H l).obj (SmoothRep.ofCharacter χ hχ)).obj.ρ.asModule ≤ n := sorry
end PrincipalSeriesJacquet

section RationalGeometricLemma
open CategoryTheory ValuativeRel
open scoped TauCetiRoadmap.ReductiveGroupsPartII.PointTopology Pointwise
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] (H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F)

/-- The intersections determine the smaller parabolic functors; the orbit order determines
an invariant filtration, functorial in the inducing representation. -/
theorem SmoothRep.geometric_lemma (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (p q : RationalParabolic.Cocharacter H) (n : ℕ)
    (x : Fin n → RationalParabolic.Points H)
    (hdisjoint : Pairwise fun i j => Disjoint
      (((RationalParabolic.decomposition H p).P : Set (RationalParabolic.Points H)) * {(x i)⁻¹} *
        ((RationalParabolic.decomposition H q).P : Set (RationalParabolic.Points H)))
      (((RationalParabolic.decomposition H p).P : Set (RationalParabolic.Points H)) * {(x j)⁻¹} *
        ((RationalParabolic.decomposition H q).P : Set (RationalParabolic.Points H))))
    (hcover : (⋃ i, (((RationalParabolic.decomposition H p).P : Set (RationalParabolic.Points H)) * {(x i)⁻¹} *
      ((RationalParabolic.decomposition H q).P : Set (RationalParabolic.Points H)))) = Set.univ)
    (hopen : ∀ i : Fin (n + 1), IsOpen (⋃ j : {j : Fin n // j.val < i.val},
      (((RationalParabolic.decomposition H p).P : Set (RationalParabolic.Points H)) * {(x j.val)⁻¹} *
        ((RationalParabolic.decomposition H q).P : Set (RationalParabolic.Points H)))))
    (S : Fin n → LeviDecomposition (G := (RationalParabolic.decomposition H q).M))
    (T : Fin n → LeviDecomposition (G := (RationalParabolic.decomposition H p).M))
    (hS : ∀ i,
      (S i).P = (RationalParabolic.decomposition H p).P.comap
        ((MulAut.conj (x i)⁻¹).toMonoidHom.comp (RationalParabolic.decomposition H q).M.subtype) ∧
      (S i).M = (RationalParabolic.decomposition H p).M.comap
        ((MulAut.conj (x i)⁻¹).toMonoidHom.comp (RationalParabolic.decomposition H q).M.subtype) ∧
      (S i).N = (RationalParabolic.decomposition H p).N.comap
        ((MulAut.conj (x i)⁻¹).toMonoidHom.comp (RationalParabolic.decomposition H q).M.subtype))
    (hT : ∀ i,
      (T i).P = (RationalParabolic.decomposition H q).P.comap
        ((MulAut.conj (x i)).toMonoidHom.comp (RationalParabolic.decomposition H p).M.subtype) ∧
      (T i).M = (RationalParabolic.decomposition H q).M.comap
        ((MulAut.conj (x i)).toMonoidHom.comp (RationalParabolic.decomposition H p).M.subtype) ∧
      (T i).N = (RationalParabolic.decomposition H q).N.comap
        ((MulAut.conj (x i)).toMonoidHom.comp (RationalParabolic.decomposition H p).M.subtype))
    (e : ∀ i, (S i).M ≃ₜ* (T i).M)
    (he : ∀ i m, (e i m).val.val = (x i)⁻¹ * m.val.val * x i) :
    let J := RationalParabolic.induction H p ⋙ RationalParabolic.restriction H q
    ∃ E : ∀ σ : SmoothRep ℂ (RationalParabolic.decomposition H p).M,
        SmoothRep.Filtration (J.obj σ) n,
      (∀ (σ τ : SmoothRep ℂ (RationalParabolic.decomposition H p).M) (f : σ ⟶ τ)
        i v, v ∈ (E σ).step i → (J.map f).hom.hom v ∈ (E τ).step i) ∧
      ∀ σ i, Nonempty ((E σ).graded i ≅
        (SmoothRep.parabolicIndFunctor (S i) (complexHalfModulus (S i))
          (complexHalfModulus_smooth (S i))).obj
          ((SmoothRep.res (e i).toMonoidHom (e i).continuous).obj
            ((SmoothRep.normalizedJacquetFunctor (T i)
              ((complexHalfModulus (T i)).comp (Subgroup.inclusion (T i).m_le))
              (by sorry)).obj σ))) := sorry
end RationalGeometricLemma

section ConstantTermStages
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [T2Space G]
  (L : LeviDecomposition (G := G)) [LocallyCompactSpace L.M]
  (S : LeviDecomposition (G := L.M)) (R : LeviDecomposition (G := G))
  (e : R.M ≃ₜ* S.M) (he : ∀ m, (e m).val.val = m.val)
  (j : R.N ≃ₜ (S.N × L.N)) (hj : ∀ n, n.val = (j n).1.val.val * (j n).2.val)
  (μ : HaarMeasureWithValues G A) (μL : HaarMeasureWithValues L.M A)
  (νL : HaarMeasureWithValues L.N A) (νS : HaarMeasureWithValues S.N A)
  (νR : HaarMeasureWithValues R.N A)
  (hprod : ∀ f : LocallyConstantCompact R.N A,
    νR.integrate f = (νS.prod νL).integrate
      { toFun := ⟨fun y => f.toFun (j.symm y), by sorry⟩
        isCompact_closure_support := by sorry })

include he hj hprod in
/-- Nested normalized constant terms use the product radical measure and product modulus half. -/
theorem parabolicDescent.stages
    (δL : L.M →* Aˣ) (hδL : IsSmoothCharacter δL)
    (hδN : ∀ n : S.N, δL n.val = 1)
    (δS : S.M →* Aˣ) (hδS : IsSmoothCharacter δS)
    (δR : R.M →* Aˣ) (hδR : IsSmoothCharacter δR)
    (hδ : ∀ m, δR m = δL (e m).val * δS (e m))
    (f : HeckeAlgebra μ) (m : R.M) :
    (parabolicDescent R μ νR δR hδR f).toFun m =
      (parabolicDescent S μL νS δS hδS
        (parabolicDescent L μ νL δL hδL f)).toFun (e m) := sorry

include he hj hprod in
/-- On a common torus lattice, dual-Levi restriction is the inclusion of invariant functions. -/
theorem parabolicDescent.satake {Λ : Type u} [CommGroup Λ]
    (K : OpenSubgroup G) (KM : OpenSubgroup L.M)
    (dG : SatakeDatum A R K Λ) (dM : SatakeDatum A S KM Λ)
    (hlattice : ∀ m, dG.lattice m = dM.lattice (e m))
    (hhaarG : dG.haar = νR) (hhaarM : dM.haar = νS)
    (δL : L.M →* Aˣ) (hδL : IsSmoothCharacter δL)
    (hδN : ∀ n : S.N, δL n.val = 1)
    (θG θM : Λ →* Aˣ)
    (hθ : ∀ m, θG (dG.lattice m) = δL (e m).val * θM (dM.lattice (e m)))
    (f : SphericalHeckeFunctions μ K) (fM : SphericalHeckeFunctions μL KM)
    (hfM : fM.val = parabolicDescent L μ νL δL hδL f.val) :
    normalizeSatake θG (satakeTransform R K dG μ f) =
      normalizeSatake θM (satakeTransform S KM dM μL fM) := sorry
end ConstantTermStages

section InvariantPermutationMatrices
open scoped MonoidAlgebra
attribute [local instance] Classical.propDecidable
variable (A G S : Type u) [CommRing A] [Group G] [MulAction G S]

/-- Diagonally invariant matrices supported on finitely many diagonal orbits. -/
def FunG : Submodule A (S → S → A) where
  carrier := {f | (∀ (g : G) (x y : S), f (g • x) (g • y) = f x y) ∧
    Set.Finite ((Quotient.mk'' : S × S → MulAction.orbitRel.Quotient G (S × S)) ''
      {p | f p.1 p.2 ≠ 0})}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

variable [TopologicalSpace G] [IsTopologicalGroup G]
  [Fact (∀ s : S, IsCompact (MulAction.stabilizer G s : Set G) ∧
    IsOpen (MulAction.stabilizer G s : Set G))]

instance FunG.nonUnitalRing : NonUnitalRing (FunG A G S) where
  toAddCommGroup := inferInstance
  mul f g := ⟨fun x z => ∑ᶠ y : S, f.val x y * g.val y z, by sorry⟩
  mul_assoc := by sorry
  zero_mul := by sorry
  mul_zero := by sorry
  left_distrib := by sorry
  right_distrib := by sorry

theorem FunG.add_apply (f g : FunG A G S) (x y : S) :
    (f + g).val x y = f.val x y + g.val x y := sorry

theorem FunG.mul_apply (f g : FunG A G S) (x z : S) :
    (f * g).val x z = ∑ᶠ y : S, f.val x y * g.val y z := sorry

/-- The same matrix acts on finitely supported column vectors. -/
def FunG.actPermutation : FunG A G S →ₗ[A] Module.End A (S →₀ A) := sorry

theorem FunG.actPermutation_apply (f : FunG A G S) (v : S →₀ A) (x : S) :
    FunG.actPermutation A G S f v x = v.sum (fun y a => f.val x y * a) := sorry

instance FunG.ring [Finite (MulAction.orbitRel.Quotient G S)] : Ring (FunG A G S) :=
  { FunG.nonUnitalRing A G S with
    one := ⟨fun x y => if x = y then 1 else 0, by sorry⟩
    one_mul := by sorry
    mul_one := by sorry }
instance FunG.algebra [Finite (MulAction.orbitRel.Quotient G S)] : Algebra A (FunG A G S) := by sorry

theorem FunG.algebraMap_apply [Finite (MulAction.orbitRel.Quotient G S)] (a : A) (x y : S) :
    (algebraMap A (FunG A G S) a).val x y = if x = y then a else 0 := sorry

theorem FunG.one_apply [Finite (MulAction.orbitRel.Quotient G S)] (x y : S) :
    (1 : FunG A G S).val x y = if x = y then 1 else 0 := sorry

theorem FunG.equivEnd [Finite (MulAction.orbitRel.Quotient G S)] :
    ∃ e : FunG A G S ≃ₐ[A] Module.End A[G] (Representation.ofMulAction A G S).asModule,
      ∀ f v, ((Representation.ofMulAction A G S).asModuleEquiv (e f v)).coeff =
        FunG.actPermutation A G S f ((Representation.ofMulAction A G S).asModuleEquiv v).coeff := sorry

theorem FunG_empty [IsEmpty S] : Subsingleton (FunG A G S) := sorry
/- Check `FunG_empty`: the empty permutation set has only the zero matrix. -/
example [IsEmpty S] : Subsingleton (FunG A G S) := sorry

theorem FunG_point [Subsingleton S] (s : S) :
    ∃ e : FunG A G S ≃ₗ[A] A, ∀ f, e f = f.val s s := sorry
/- Check `FunG_point`: a one-point set recovers the coefficient module. -/
example [Subsingleton S] (s : S) :
    ∃ e : FunG A G S ≃ₗ[A] A, ∀ f, e f = f.val s s := sorry

theorem FunG_orbit (x y : S) :
    ∃ f : FunG A G S, ∀ a b, f.val a b =
      if (Quotient.mk'' (a,b) : MulAction.orbitRel.Quotient G (S × S)) =
        Quotient.mk'' (x,y) then 1 else 0 := sorry
/- Check `FunG_orbit`: every individual diagonal orbit has its characteristic matrix. -/
example (x y : S) :
    ∃ f : FunG A G S, ∀ a b, f.val a b =
      if (Quotient.mk'' (a,b) : MulAction.orbitRel.Quotient G (S × S)) =
        Quotient.mk'' (x,y) then 1 else 0 := sorry

theorem FunG.actPermutation_zero : FunG.actPermutation A G S 0 = 0 := sorry
/- Check `FunG.actPermutation_zero`: the zero matrix annihilates every vector. -/
example : FunG.actPermutation A G S 0 = 0 := sorry

theorem FunG.actPermutation_point [Subsingleton S] (s : S) (f : FunG A G S) :
    FunG.actPermutation A G S f (Finsupp.single s 1) s = f.val s s := sorry
/- Check `FunG.actPermutation_point`: a scalar matrix acts by its scalar. -/
example [Subsingleton S] (s : S) (f : FunG A G S) :
    FunG.actPermutation A G S f (Finsupp.single s 1) s = f.val s s := sorry

theorem FunG.actPermutation_column (f : FunG A G S) (x y : S) :
    FunG.actPermutation A G S f (Finsupp.single y 1) x = f.val x y := sorry
/- Check `FunG.actPermutation_column`: the coefficient at x of the image of delta_y is f(x,y), not f(y,x). -/
example (f : FunG A G S) (x y : S) :
    FunG.actPermutation A G S f (Finsupp.single y 1) x = f.val x y := sorry
end InvariantPermutationMatrices

section GenericRootCharacters
variable {A U : Type u} [CommRing A] [Group U] [TopologicalSpace U]

/-- Genericity relative to the supplied simple-root subgroups of the unipotent radical. -/
def IsGenericCharacter (simpleRoots : Set (Subgroup U)) (ψ : U →* Aˣ) : Prop :=
  IsSmoothCharacter ψ ∧ ∀ R ∈ simpleRoots, ψ.comp R.subtype ≠ 1

theorem IsGenericCharacter_empty (ψ : U →* Aˣ) :
    IsGenericCharacter ∅ ψ ↔ IsSmoothCharacter ψ := sorry
/- Check `IsGenericCharacter_empty`: a torus has no root nontriviality tests. -/
example (ψ : U →* Aˣ) : IsGenericCharacter ∅ ψ ↔ IsSmoothCharacter ψ := sorry

theorem IsGenericCharacter_trivial (simpleRoots : Set (Subgroup U)) (h : simpleRoots.Nonempty) :
    ¬ IsGenericCharacter simpleRoots (1 : U →* Aˣ) := sorry
/- Check `IsGenericCharacter_trivial`: a trivial character fails whenever there is a simple root. -/
example (simpleRoots : Set (Subgroup U)) (h : simpleRoots.Nonempty) :
    ¬ IsGenericCharacter simpleRoots (1 : U →* Aˣ) := sorry

theorem IsGenericCharacter_rankOne (ψ : U →* Aˣ) :
    IsGenericCharacter {⊤} ψ ↔ IsSmoothCharacter ψ ∧ ψ ≠ 1 := sorry
/- Check `IsGenericCharacter_rankOne`: a single root group requires precisely a smooth nontrivial character. -/
example (ψ : U →* Aˣ) :
    IsGenericCharacter {⊤} ψ ↔ IsSmoothCharacter ψ ∧ ψ ≠ 1 := sorry
end GenericRootCharacters

section BernsteinPresentation
open ValuativeRel
open TauCetiRoadmap.ReductiveGroupsPartII BruhatTits
open scoped PointTopology MonoidAlgebra TensorProduct
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] [ModelField F]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F}
  (D : LocalRootData F H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
  (a : BaseAlcove D φ)
  (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
  (A : Type) [CommRing A] (qhalf : Aˣ)
  (hq : (qhalf : A)^2 = (Nat.card (𝓀[F]) : A))
  (v : D.V) (hv : IsRegularVector D v)

/-- The normalized translation embedding is determined on the dominant monoid by its
Iwahori double-coset values; its source is the pinned translation lattice. -/
def HeckeAlgebraLevel.bernsteinEmbedding (qhalf : Aˣ) (v : D.V) :
    MonoidAlgebra A (IwahoriWeylGroup.translations D) →ₐ[A]
      HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori := by sorry

include hsplit hq hv in
theorem HeckeAlgebraLevel.bernsteinEmbedding_dominant
    (t : IwahoriWeylGroup.translations D) (ht : Coinvariants.IsDominant φ v t) :
    HeckeAlgebraLevel.bernsteinEmbedding D φ a A qhalf v (MonoidAlgebra.single t 1) =
      ((qhalf⁻¹ : Aˣ) : A) ^ IwahoriWeylGroup.length a t •
        HeckeAlgebraLevel.iwahoriBasis D φ a A t := sorry

include hsplit hq hv in
/- Check `HeckeAlgebraLevel.bernsteinEmbedding_dominant`: normalization records the full translation length. -/
example (t : IwahoriWeylGroup.translations D) (ht : Coinvariants.IsDominant φ v t) :
    HeckeAlgebraLevel.bernsteinEmbedding D φ a A qhalf v (MonoidAlgebra.single t 1) =
      ((qhalf⁻¹ : Aˣ) : A) ^ IwahoriWeylGroup.length a t •
        HeckeAlgebraLevel.iwahoriBasis D φ a A t := sorry

theorem HeckeAlgebraLevel.bernsteinEmbedding_identity :
    HeckeAlgebraLevel.bernsteinEmbedding D φ a A qhalf v (MonoidAlgebra.single 1 1) = 1 := sorry
/- Check `HeckeAlgebraLevel.bernsteinEmbedding_identity`: the zero cocharacter is the Hecke identity. -/
example : HeckeAlgebraLevel.bernsteinEmbedding D φ a A qhalf v
    (MonoidAlgebra.single 1 1) = 1 := sorry

theorem HeckeAlgebraLevel.bernsteinEmbedding_inverse (t : IwahoriWeylGroup.translations D) :
    let θ := HeckeAlgebraLevel.bernsteinEmbedding D φ a A qhalf v
    θ (MonoidAlgebra.single t 1) * θ (MonoidAlgebra.single t⁻¹ 1) = 1 := sorry
/- Check `HeckeAlgebraLevel.bernsteinEmbedding_inverse`: opposite translations give inverse units. -/
example (t : IwahoriWeylGroup.translations D) :
    let θ := HeckeAlgebraLevel.bernsteinEmbedding D φ a A qhalf v
    θ (MonoidAlgebra.single t 1) * θ (MonoidAlgebra.single t⁻¹ 1) = 1 := sorry

include hsplit hq hv in
theorem HeckeAlgebraLevel.bernsteinEmbedding_injective :
    Function.Injective (HeckeAlgebraLevel.bernsteinEmbedding D φ a A qhalf v) := sorry

include hsplit hq hv in
theorem HeckeAlgebraLevel.bernstein_tensor (x : Apartment φ)
    (hx : Facet.IsSpecial x) (hax : x ∈ a.closure)
    (hvx : v = a.basePoint -ᵥ x) :
    let W := IwahoriWeylGroup.pointStabilizer D φ x ⊓ IwahoriWeylGroup.affineWeyl D φ
    let T := HeckeAlgebraLevel.iwahoriBasis D φ a A
    let HW := Submodule.span A {z | ∃ w : W, z = T w.val}
    ∃ e : (MonoidAlgebra A (IwahoriWeylGroup.translations D) ⊗[A] HW) ≃ₗ[A]
        HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori,
      ∀ f z, e (f ⊗ₜ[A] z) = HeckeAlgebraLevel.bernsteinEmbedding D φ a A qhalf v f * z.val := sorry

include hsplit hq hv in
/-- The integral finite geometric sum specifies the quotient in the Bernstein relation,
including negative coroot pairings; there is no division in the coefficient ring. -/
theorem HeckeAlgebraLevel.bernstein_relation
    (x : Apartment φ) (hx : Facet.IsSpecial x) (hax : x ∈ a.closure)
    (hvx : v = a.basePoint -ᵥ x)
    (s : IwahoriWeylGroup D) (hs : s ∈ IwahoriWeylGroup.simpleReflections a)
    (hsx : s ∈ IwahoriWeylGroup.pointStabilizer D φ x)
    (coroot : IwahoriWeylGroup.translations D)
    (pairing : IwahoriWeylGroup.translations D →* Multiplicative ℤ)
    (hcoroot : Multiplicative.toAdd (pairing coroot) = 2)
    (hpositive : ∀ t, Coinvariants.IsDominant φ v t → 0 ≤ Multiplicative.toAdd (pairing t))
    (hreflection : ∀ t : IwahoriWeylGroup.translations D,
      s * t.val * s⁻¹ = t.val * coroot.val ^ (-Multiplicative.toAdd (pairing t)))
    (t : IwahoriWeylGroup.translations D) :
    let k := Multiplicative.toAdd (pairing t)
    let t' := t * coroot ^ (-k)
    let θ := fun z => HeckeAlgebraLevel.bernsteinEmbedding D φ a A qhalf v
      (MonoidAlgebra.single z 1)
    let quotient := if 0 ≤ k then
      ∑ j ∈ Finset.range k.toNat, θ (t * coroot ^ (-(j : ℤ)))
      else -∑ j ∈ Finset.range (-k).toNat, θ (t' * coroot ^ (-(j : ℤ)))
    HeckeAlgebraLevel.iwahoriBasis D φ a A s * θ t -
      θ t' * HeckeAlgebraLevel.iwahoriBasis D φ a A s =
        ((Nat.card (𝓀[F]) : A) - 1) • quotient := sorry

include hsplit hq hv in
/-- The invariant condition is coefficientwise conjugacy by the actual normalizer quotient.
This arbitrary-ring signature includes the separate integral centre proof obligation. -/
theorem HeckeAlgebraLevel.bernstein_center :
    let θ := HeckeAlgebraLevel.bernsteinEmbedding D φ a A qhalf v
    ∀ z : HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori,
      z ∈ Subalgebra.center A (HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori) ↔
        ∃ f : MonoidAlgebra A (IwahoriWeylGroup.translations D), θ f = z ∧
          ∀ (w : IwahoriWeylGroup D) (t t' : IwahoriWeylGroup.translations D),
            t'.val = w * t.val * w⁻¹ → f.coeff t' = f.coeff t := sorry

include hsplit hq hv in
theorem HeckeAlgebraLevel.bernstein_center_finite :
    Module.Finite
      (Subalgebra.center A (HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori))
      (HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori) := sorry
end BernsteinPresentation

section GenericIwahoriAlgebra
attribute [local instance] Classical.propDecidable
open ValuativeRel
open TauCetiRoadmap.ReductiveGroupsPartII BruhatTits
open scoped PointTopology MonoidAlgebra TensorProduct
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] [ModelField F]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F}
  (D : LocalRootData F H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
  (a : BaseAlcove D φ) (A : Type) [CommRing A] (q : A)

/-- The integral presentation uses the free associative algebra, imposing the identity,
length-additive products and equal-parameter quadratic relations. In particular it makes
sense over the Laurent coefficient ring before specialization to a residue cardinality. -/
def GenericIwahoriHecke :=
  RingQuot (fun x y : FreeAlgebra A (IwahoriWeylGroup D) =>
    (x = FreeAlgebra.ι A 1 ∧ y = 1) ∨
    (∃ w v : IwahoriWeylGroup D,
      IwahoriWeylGroup.length a (w * v) = IwahoriWeylGroup.length a w + IwahoriWeylGroup.length a v ∧
      x = FreeAlgebra.ι A w * FreeAlgebra.ι A v ∧ y = FreeAlgebra.ι A (w * v)) ∨
    (∃ s ∈ IwahoriWeylGroup.simpleReflections a,
      x = (FreeAlgebra.ι A s - algebraMap A _ q) * (FreeAlgebra.ι A s + 1) ∧ y = 0))

instance : Ring (GenericIwahoriHecke D φ a A q) := inferInstanceAs (Ring (RingQuot _))
instance : Algebra A (GenericIwahoriHecke D φ a A q) := inferInstanceAs (Algebra A (RingQuot _))

/-- Each generator is the image of the corresponding free-algebra variable. -/
abbrev GenericIwahoriHecke.generator (w : IwahoriWeylGroup D) : GenericIwahoriHecke D φ a A q :=
  RingQuot.mkAlgHom A _ (FreeAlgebra.ι A w)

theorem GenericIwahoriHecke_identity : GenericIwahoriHecke.generator D φ a A q 1 = 1 := sorry
/- Check `GenericIwahoriHecke_identity`: the identity variable is identified with the ring unit. -/
example : GenericIwahoriHecke.generator D φ a A q 1 = 1 := sorry

theorem GenericIwahoriHecke_reflection (s : IwahoriWeylGroup D)
    (hs : s ∈ IwahoriWeylGroup.simpleReflections a) :
    let T := GenericIwahoriHecke.generator D φ a A q s
    T * T = (q - 1) • T + q • 1 := sorry
/- Check `GenericIwahoriHecke_reflection`: the parameter occurs in both quadratic coefficients. -/
example (s : IwahoriWeylGroup D) (hs : s ∈ IwahoriWeylGroup.simpleReflections a) :
    let T := GenericIwahoriHecke.generator D φ a A q s
    T * T = (q - 1) • T + q • 1 := sorry

theorem GenericIwahoriHecke_residueOne :
    ∃ e : GenericIwahoriHecke D φ a A 1 ≃ₐ[A] MonoidAlgebra A (IwahoriWeylGroup D),
      ∀ w, e (GenericIwahoriHecke.generator D φ a A 1 w) = MonoidAlgebra.single w 1 := sorry
/- Check `GenericIwahoriHecke_residueOne`: parameter one gives the actual group algebra. -/
example :
    ∃ e : GenericIwahoriHecke D φ a A 1 ≃ₐ[A] MonoidAlgebra A (IwahoriWeylGroup D),
      ∀ w, e (GenericIwahoriHecke.generator D φ a A 1 w) = MonoidAlgebra.single w 1 := sorry

theorem GenericIwahoriHecke.basis :
    ∃ b : Module.Basis (IwahoriWeylGroup D) A (GenericIwahoriHecke D φ a A q),
      ∀ w, b w = GenericIwahoriHecke.generator D φ a A q w := sorry

theorem GenericIwahoriHecke.baseChange (B : Type) [CommRing B] [Algebra A B] :
    ∃ e : B ⊗[A] GenericIwahoriHecke D φ a A q ≃ₐ[B]
        GenericIwahoriHecke D φ a B (algebraMap A B q),
      ∀ b w, e (b ⊗ₜ[A] GenericIwahoriHecke.generator D φ a A q w) =
        b • GenericIwahoriHecke.generator D φ a B (algebraMap A B q) w := sorry

theorem GenericIwahoriHecke.specialization
    (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
    (hq : q = (Nat.card (𝓀[F]) : A)) :
    ∃ e : GenericIwahoriHecke D φ a A q ≃ₐ[A]
        HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori,
      ∀ w, e (GenericIwahoriHecke.generator D φ a A q w) =
        HeckeAlgebraLevel.iwahoriBasis D φ a A w := sorry

theorem GenericIwahoriHecke.bernstein
    (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
    (qhalf : Aˣ) (hq : (qhalf : A)^2 = q)
    (v : D.V) (hv : IsRegularVector D v)
    (x : Apartment φ) (hx : Facet.IsSpecial x) (hax : x ∈ a.closure)
    (hvx : v = a.basePoint -ᵥ x) :
    let Λ := IwahoriWeylGroup.translations D
    let W := IwahoriWeylGroup.pointStabilizer D φ x ⊓ IwahoriWeylGroup.affineWeyl D φ
    let T := GenericIwahoriHecke.generator D φ a A q
    let HW := Submodule.span A {z | ∃ w : W, z = T w.val}
    ∃ θ : MonoidAlgebra A Λ →ₐ[A] GenericIwahoriHecke D φ a A q,
      Function.Injective θ ∧
      (∀ t : Λ, Coinvariants.IsDominant φ v t →
        θ (MonoidAlgebra.single t 1) = ((qhalf⁻¹ : Aˣ) : A) ^ IwahoriWeylGroup.length a t • T t) ∧
      (∃ e : (MonoidAlgebra A Λ ⊗[A] HW) ≃ₗ[A] GenericIwahoriHecke D φ a A q,
        ∀ f z, e (f ⊗ₜ[A] z) = θ f * z.val) ∧
      (∀ z : GenericIwahoriHecke D φ a A q,
        z ∈ Subalgebra.center A (GenericIwahoriHecke D φ a A q) ↔
          ∃ f : MonoidAlgebra A Λ, θ f = z ∧
            ∀ (w : IwahoriWeylGroup D) (t t' : Λ),
              t'.val = w * t.val * w⁻¹ → f.coeff t' = f.coeff t) ∧
      Module.Finite (Subalgebra.center A (GenericIwahoriHecke D φ a A q))
        (GenericIwahoriHecke D φ a A q) := sorry

theorem GenericIwahoriHecke.center_basis
    (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
    (qhalf : Aˣ) (hq : (qhalf : A)^2 = q)
    (v : D.V) (hv : IsRegularVector D v)
    (θ : MonoidAlgebra A (IwahoriWeylGroup.translations D) →ₐ[A]
      GenericIwahoriHecke D φ a A q)
    (hθ : ∀ t : IwahoriWeylGroup.translations D, Coinvariants.IsDominant φ v t →
      θ (MonoidAlgebra.single t 1) = ((qhalf⁻¹ : Aˣ) : A) ^ IwahoriWeylGroup.length a t •
        GenericIwahoriHecke.generator D φ a A q t) :
    ∃ b : Module.Basis {t : IwahoriWeylGroup.translations D // Coinvariants.IsDominant φ v t}
        A (Subalgebra.center A (GenericIwahoriHecke D φ a A q)),
      ∀ t, ∃ f : MonoidAlgebra A (IwahoriWeylGroup.translations D),
        θ f = (b t).val ∧ ∀ z : IwahoriWeylGroup.translations D,
          f.coeff z = if ∃ w : IwahoriWeylGroup D, z.val = w * t.val.val * w⁻¹ then 1 else 0 := sorry

theorem GenericIwahoriHecke.translation_basis
    (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
    (qhalf : Aˣ) (hq : (qhalf : A)^2 = q)
    (v : D.V) (hv : IsRegularVector D v)
    (x : Apartment φ) (hx : Facet.IsSpecial x) (hax : x ∈ a.closure)
    (hvx : v = a.basePoint -ᵥ x)
    (θ : MonoidAlgebra A (IwahoriWeylGroup.translations D) →ₐ[A]
      GenericIwahoriHecke D φ a A q)
    (hθ : ∀ t : IwahoriWeylGroup.translations D, Coinvariants.IsDominant φ v t →
      θ (MonoidAlgebra.single t 1) = ((qhalf⁻¹ : Aˣ) : A) ^ IwahoriWeylGroup.length a t •
        GenericIwahoriHecke.generator D φ a A q t) :
    let W := IwahoriWeylGroup.pointStabilizer D φ x ⊓ IwahoriWeylGroup.affineWeyl D φ
    ∃ b : Module.Basis W θ.range (GenericIwahoriHecke D φ a A q),
      ∀ w, b w = GenericIwahoriHecke.generator D φ a A q w.val := sorry

theorem GenericIwahoriHecke.bernstein_relation
    (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
    (qhalf : Aˣ) (hq : (qhalf : A)^2 = q)
    (v : D.V) (hv : IsRegularVector D v)
    (x : Apartment φ) (hx : Facet.IsSpecial x) (hax : x ∈ a.closure)
    (hvx : v = a.basePoint -ᵥ x)
    (θ : MonoidAlgebra A (IwahoriWeylGroup.translations D) →ₐ[A]
      GenericIwahoriHecke D φ a A q)
    (hθ : ∀ t : IwahoriWeylGroup.translations D, Coinvariants.IsDominant φ v t →
      θ (MonoidAlgebra.single t 1) = ((qhalf⁻¹ : Aˣ) : A) ^ IwahoriWeylGroup.length a t •
        GenericIwahoriHecke.generator D φ a A q t)
    (s : IwahoriWeylGroup D) (hs : s ∈ IwahoriWeylGroup.simpleReflections a)
    (hsx : s ∈ IwahoriWeylGroup.pointStabilizer D φ x)
    (coroot : IwahoriWeylGroup.translations D)
    (pairing : IwahoriWeylGroup.translations D →* Multiplicative ℤ)
    (hcoroot : Multiplicative.toAdd (pairing coroot) = 2)
    (hpositive : ∀ t, Coinvariants.IsDominant φ v t → 0 ≤ Multiplicative.toAdd (pairing t))
    (hreflection : ∀ t : IwahoriWeylGroup.translations D,
      s * t.val * s⁻¹ = t.val * coroot.val ^ (-Multiplicative.toAdd (pairing t)))
    (t : IwahoriWeylGroup.translations D) :
    let k := Multiplicative.toAdd (pairing t)
    let t' := t * coroot ^ (-k)
    let e := fun z => θ (MonoidAlgebra.single z 1)
    let quotient := if 0 ≤ k then
      ∑ j ∈ Finset.range k.toNat, e (t * coroot ^ (-(j : ℤ)))
      else -∑ j ∈ Finset.range (-k).toNat, e (t' * coroot ^ (-(j : ℤ)))
    GenericIwahoriHecke.generator D φ a A q s * e t -
      e t' * GenericIwahoriHecke.generator D φ a A q s = (q - 1) • quotient := sorry


theorem HeckeAlgebraLevel.iwahoriBasis_index
    (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
    (n : D.normalizer) :
    (a.iwahori ⊓ a.iwahori.map (MulAut.conj n.val).toMonoidHom).relIndex a.iwahori =
      Nat.card (𝓀[F]) ^ IwahoriWeylGroup.length a (IwahoriWeylGroup.mk D n) := sorry

theorem HeckeAlgebraLevel.iwahoriBasis_baseChange
    (B : Type) [CommRing B] [Algebra A B] :
    ∃ e : B ⊗[A] HeckeAlgebraLevel A (RationalParabolic.Points H) a.iwahori ≃ₐ[B]
        HeckeAlgebraLevel B (RationalParabolic.Points H) a.iwahori,
      ∀ b w, e (b ⊗ₜ[A] HeckeAlgebraLevel.iwahoriBasis D φ a A w) =
        b • HeckeAlgebraLevel.iwahoriBasis D φ a B w := sorry

end GenericIwahoriAlgebra

section SemidirectLatticeCentre
open scoped MonoidAlgebra
variable {A Λ W : Type u} [CommRing A] [CommGroup Λ] [IsMulTorsionFree Λ]
  [Group W] [Finite W]

/-- The parameter-one centre is calculated directly in the semidirect-product group algebra.
Faithfulness and torsion freeness exclude finite conjugacy classes outside the lattice. -/
theorem HeckeAlgebraLevel.latticeSemidirect_center (a : W →* MulAut Λ)
    (ha : Function.Injective a) (f : MonoidAlgebra A (SemidirectProduct Λ W a)) :
    f ∈ Subalgebra.center A (MonoidAlgebra A (SemidirectProduct Λ W a)) ↔
      (∀ g : SemidirectProduct Λ W a, g.right ≠ 1 → f.coeff g = 0) ∧
      ∀ (w : W) (t : Λ),
        f.coeff (SemidirectProduct.inl (a w t)) = f.coeff (SemidirectProduct.inl t) := sorry
end SemidirectLatticeCentre

namespace Klingen
open scoped Matrix MonoidAlgebra
open TauCetiRoadmap.ReductiveGroupsPartII
variable (p : ℕ) [Fact p.Prime]

/-- Similitudes of the antidiagonal alternating form used for the Klingen parahoric. -/
def similitudeGroup : Subgroup (GL (Fin 4) ℚ_[p]) where
  carrier := {g | ∃ ν : ℚ_[p]ˣ,
    (g : Matrix (Fin 4) (Fin 4) ℚ_[p]).transpose *
      !![0,0,0,1; 0,0,1,0; 0,-1,0,0; -1,0,0,0] * (g : Matrix (Fin 4) (Fin 4) ℚ_[p]) =
        (ν : ℚ_[p]) • (!![0,0,0,1; 0,0,1,0; 0,-1,0,0; -1,0,0,0] : Matrix (Fin 4) (Fin 4) ℚ_[p])}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

instance : LocallyCompactSpace (similitudeGroup p) := by sorry

/-- The first column reduces to the line spanned by the first coordinate vector. -/
def parahoric : OpenSubgroup (similitudeGroup p) where
  carrier := {g | g.val ∈ LevelSubgroups.integralGL ℚ_[p] 4 ∧
    ∀ i : Fin 4, i ≠ 0 → ‖(g.val : Matrix (Fin 4) (Fin 4) ℚ_[p]) i 0‖ < 1}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
  isOpen' := by sorry

theorem parahoric_compact : IsCompact (parahoric p : Set (similitudeGroup p)) := sorry

theorem similitudeGroup_identity : (1 : GL (Fin 4) ℚ_[p]) ∈ similitudeGroup p := sorry
/- Check `Klingen.similitudeGroup_identity`: the identity preserves the form. -/
example : (1 : GL (Fin 4) ℚ_[p]) ∈ similitudeGroup p := sorry

theorem similitudeGroup_diagonal (g : GL (Fin 4) ℚ_[p]) (a : Fin 4 → ℚ_[p]ˣ)
    (hg : (g : Matrix (Fin 4) (Fin 4) ℚ_[p]) = Matrix.diagonal (fun i => (a i : ℚ_[p]))) :
    g ∈ similitudeGroup p ↔ a 0 * a 3 = a 1 * a 2 := sorry
/- Check `Klingen.similitudeGroup_diagonal`: the paired diagonal products must agree. -/
example (g : GL (Fin 4) ℚ_[p]) (a : Fin 4 → ℚ_[p]ˣ)
    (hg : (g : Matrix (Fin 4) (Fin 4) ℚ_[p]) = Matrix.diagonal (fun i => (a i : ℚ_[p]))) :
    g ∈ similitudeGroup p ↔ a 0 * a 3 = a 1 * a 2 := sorry

theorem similitudeGroup_unbalanced (g : GL (Fin 4) ℚ_[p])
    (hg : (g : Matrix (Fin 4) (Fin 4) ℚ_[p]) = Matrix.diagonal ![(p : ℚ_[p]),1,1,1]) :
    g ∉ similitudeGroup p := sorry
/- Check `Klingen.similitudeGroup_unbalanced`: changing only one paired coordinate is not a similitude. -/
example (g : GL (Fin 4) ℚ_[p])
    (hg : (g : Matrix (Fin 4) (Fin 4) ℚ_[p]) = Matrix.diagonal ![(p : ℚ_[p]),1,1,1]) :
    g ∉ similitudeGroup p := sorry

theorem parahoric_identity : (1 : similitudeGroup p) ∈ parahoric p := sorry
/- Check `Klingen.parahoric_identity`: the first residue line is fixed by the identity. -/
example : (1 : similitudeGroup p) ∈ parahoric p := sorry

theorem parahoric_upper (g : similitudeGroup p) (x : ℚ_[p]) (hx : ‖x‖ ≤ 1)
    (hg : (g.val : Matrix (Fin 4) (Fin 4) ℚ_[p]) = 1 + Matrix.single 0 3 x) :
    g ∈ parahoric p := sorry
/- Check `Klingen.parahoric_upper`: integral upper highest-root elements preserve the residue line. -/
example (g : similitudeGroup p) (x : ℚ_[p]) (hx : ‖x‖ ≤ 1)
    (hg : (g.val : Matrix (Fin 4) (Fin 4) ℚ_[p]) = 1 + Matrix.single 0 3 x) :
    g ∈ parahoric p := sorry

theorem parahoric_lower (g : similitudeGroup p) (x : ℚ_[p]) (hx : ‖x‖ = 1)
    (hg : (g.val : Matrix (Fin 4) (Fin 4) ℚ_[p]) = 1 + Matrix.single 3 0 x) :
    g ∉ parahoric p := sorry
/- Check `Klingen.parahoric_lower`: a lower highest-root unit moves the residue line. -/
example (g : similitudeGroup p) (x : ℚ_[p]) (hx : ‖x‖ = 1)
    (hg : (g.val : Matrix (Fin 4) (Fin 4) ℚ_[p]) = 1 + Matrix.single 3 0 x) :
    g ∉ parahoric p := sorry

/-- The three positive diagonal similitudes, with no inverse central generator. -/
def generator (i : Fin 3) : similitudeGroup p :=
  let d : Fin 4 → ℚ_[p] := if i = 0 then ![p,p,p,p]
    else if i = 1 then ![(p : ℚ_[p])^2,p,p,1] else ![p,p,1,1]
  ⟨{ val := Matrix.diagonal d
     inv := Matrix.diagonal (fun j => (d j)⁻¹)
     val_inv := by sorry
     inv_val := by sorry }, by sorry⟩

theorem generator_scalar :
    ((generator p 0).val : Matrix (Fin 4) (Fin 4) ℚ_[p]) = (p : ℚ_[p]) • 1 := sorry
/- Check `Klingen.generator_scalar`: the first generator scales all four coordinates. -/
example : ((generator p 0).val : Matrix (Fin 4) (Fin 4) ℚ_[p]) = (p : ℚ_[p]) • 1 := sorry

theorem generator_klingen :
    ((generator p 1).val : Matrix (Fin 4) (Fin 4) ℚ_[p]) = Matrix.diagonal ![(p : ℚ_[p])^2,p,p,1] := sorry
/- Check `Klingen.generator_klingen`: the second generator has exponents (2,1,1,0). -/
example : ((generator p 1).val : Matrix (Fin 4) (Fin 4) ℚ_[p]) = Matrix.diagonal ![(p : ℚ_[p])^2,p,p,1] := sorry

theorem generator_siegel :
    ((generator p 2).val : Matrix (Fin 4) (Fin 4) ℚ_[p]) = Matrix.diagonal ![(p : ℚ_[p]),p,1,1] := sorry
/- Check `Klingen.generator_siegel`: the third generator has exponents (1,1,0,0). -/
example : ((generator p 2).val : Matrix (Fin 4) (Fin 4) ℚ_[p]) = Matrix.diagonal ![(p : ℚ_[p]),p,1,1] := sorry

def operator (i : Fin 3) : HeckeAlgebraLevel ℤ (similitudeGroup p) (parahoric p).toSubgroup :=
  HeckeAlgebraLevel.doubleCoset (parahoric p) (parahoric_compact p) (generator p i)

theorem operator_atGenerator (i : Fin 3) :
    let P := Representation.ofMulAction ℤ (similitudeGroup p)
      (similitudeGroup p ⧸ (parahoric p).toSubgroup)
    (P.asModuleEquiv (operator p i (HeckeAlgebraLevel.basis (parahoric p).toSubgroup 1))).coeff
      (QuotientGroup.mk (generator p i)⁻¹) = 1 := sorry
/- Check `Klingen.operator_atGenerator`: the selected double coset has coefficient one. -/
example (i : Fin 3) :
    let P := Representation.ofMulAction ℤ (similitudeGroup p)
      (similitudeGroup p ⧸ (parahoric p).toSubgroup)
    (P.asModuleEquiv (operator p i (HeckeAlgebraLevel.basis (parahoric p).toSubgroup 1))).coeff
      (QuotientGroup.mk (generator p i)⁻¹) = 1 := sorry

theorem operator_nonidentity (i : Fin 3) :
    let P := Representation.ofMulAction ℤ (similitudeGroup p)
      (similitudeGroup p ⧸ (parahoric p).toSubgroup)
    (P.asModuleEquiv (operator p i (HeckeAlgebraLevel.basis (parahoric p).toSubgroup 1))).coeff
      (QuotientGroup.mk 1) = 0 := sorry
/- Check `Klingen.operator_nonidentity`: all three positive cosets miss the identity coset. -/
example (i : Fin 3) :
    let P := Representation.ofMulAction ℤ (similitudeGroup p)
      (similitudeGroup p ⧸ (parahoric p).toSubgroup)
    (P.asModuleEquiv (operator p i (HeckeAlgebraLevel.basis (parahoric p).toSubgroup 1))).coeff
      (QuotientGroup.mk 1) = 0 := sorry

theorem operator_scalar (g : similitudeGroup p) :
    operator p 0 * HeckeAlgebraLevel.doubleCoset (parahoric p) (parahoric_compact p) g =
      HeckeAlgebraLevel.doubleCoset (parahoric p) (parahoric_compact p) (generator p 0 * g) := sorry
/- Check `Klingen.operator_scalar`: the central coset translates a double coset without an index factor. -/
example (g : similitudeGroup p) :
    operator p 0 * HeckeAlgebraLevel.doubleCoset (parahoric p) (parahoric_compact p) g =
      HeckeAlgebraLevel.doubleCoset (parahoric p) (parahoric_compact p) (generator p 0 * g) := sorry

theorem operator_commute (i j : Fin 3) : Commute (operator p i) (operator p j) := sorry

theorem positive_polynomial :
    ∃ f : MvPolynomial (Fin 3) ℤ →ₐ[ℤ]
        HeckeAlgebraLevel ℤ (similitudeGroup p) (parahoric p).toSubgroup,
      Function.Injective f ∧ ∀ i, f (MvPolynomial.X i) = operator p i := sorry
end Klingen

section HeckeCoefficientChange
open scoped MonoidAlgebra
variable {A B C G : Type u} [CommRing A] [CommRing B] [CommRing C]
  [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (U : OpenSubgroup G) (hc : IsCompact (U : Set G))

/-- Coefficient extension of finite double-coset matrices. -/
def HeckeAlgebraLevel.map (f : A →+* B) :
    HeckeAlgebraLevel A G U.toSubgroup →+* HeckeAlgebraLevel B G U.toSubgroup := by sorry

theorem HeckeAlgebraLevel.map_coefficient (f : A →+* B)
    (T : HeckeAlgebraLevel A G U.toSubgroup) (x : G) :
    let PA := Representation.ofMulAction A G (G ⧸ U.toSubgroup)
    let PB := Representation.ofMulAction B G (G ⧸ U.toSubgroup)
    (PB.asModuleEquiv (HeckeAlgebraLevel.map U f T
      (HeckeAlgebraLevel.basis U.toSubgroup 1))).coeff (QuotientGroup.mk x) =
      f ((PA.asModuleEquiv (T (HeckeAlgebraLevel.basis U.toSubgroup 1))).coeff (QuotientGroup.mk x)) := sorry

theorem HeckeAlgebraLevel.map_identity :
    HeckeAlgebraLevel.map U (RingHom.id A) = RingHom.id (HeckeAlgebraLevel A G U.toSubgroup) := sorry
/- Check `HeckeAlgebraLevel.map_identity`: identity coefficients leave every matrix unchanged. -/
example : HeckeAlgebraLevel.map U (RingHom.id A) = RingHom.id (HeckeAlgebraLevel A G U.toSubgroup) := sorry

theorem HeckeAlgebraLevel.map_comp (f : A →+* B) (g : B →+* C) :
    HeckeAlgebraLevel.map U (g.comp f) =
      (HeckeAlgebraLevel.map U g).comp (HeckeAlgebraLevel.map U f) := sorry
/- Check `HeckeAlgebraLevel.map_comp`: successive coefficient extensions compose. -/
example (f : A →+* B) (g : B →+* C) :
    HeckeAlgebraLevel.map U (g.comp f) =
      (HeckeAlgebraLevel.map U g).comp (HeckeAlgebraLevel.map U f) := sorry

theorem HeckeAlgebraLevel.map_zeroRing [Subsingleton B] (f : A →+* B)
    (T : HeckeAlgebraLevel A G U.toSubgroup) : HeckeAlgebraLevel.map U f T = 0 := sorry
/- Check `HeckeAlgebraLevel.map_zeroRing`: a zero coefficient ring kills every double coset. -/
example [Subsingleton B] (f : A →+* B) (T : HeckeAlgebraLevel A G U.toSubgroup) :
    HeckeAlgebraLevel.map U f T = 0 := sorry
end HeckeCoefficientChange

section ProIwahoriTorus
open ValuativeRel
open TauCetiRoadmap.ReductiveGroupsPartII BruhatTits
open scoped PointTopology MonoidAlgebra
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] [ModelField F]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F}
  (D : LocalRootData F H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
  (a : BaseAlcove D φ)
  (hsplit : GeometricRoots.centralizerIdeal D.splitTorus = D.splitTorus)
  (l : RationalParabolic.Cocharacter H)
  (hT : (RationalParabolic.decomposition H l).M = D.rootDatum.T)
  (U : OpenSubgroup (RationalParabolic.Points H))
  (hc : IsCompact (U : Set (RationalParabolic.Points H)))
  (A : Type) [CommRing A] [Nontrivial A]

include hsplit hT in
/-- This includes the integral-basis extension to nonzero coefficient rings with q invertible.
For the coefficient DVR in the roadmap it is applied after inverting the residue prime. -/
theorem HeckeAlgebraLevel.proIwahori_torus
    (hU : letI : Fact ({a.basePoint} : Finset (Apartment φ)).Nonempty := ⟨by simp⟩
      U.toSubgroup = Parahoric.proUnipotentRadical D φ {a.basePoint})
    [LocallyCompactSpace (RationalParabolic.decomposition H l).N]
    (d : ResidueModulus (RationalParabolic.decomposition H l) (Nat.card (𝓀[F])))
    (sqrtQ : Aˣ) (hsqrt : (sqrtQ : A)^2 = (Nat.card (𝓀[F]) : A)) :
    let L := RationalParabolic.decomposition H l
    let Δ := positiveMonoid U.toSubgroup L.M L.N (RationalParabolic.oppositeDecomposition H l).N
    let T := fun m : L.M => HeckeAlgebraLevel.map U (Int.castRingHom A)
      (HeckeAlgebraLevel.doubleCoset U hc m.val)
    let δ := (modulusCharacterSqrt d sqrtQ hsqrt).comp (Subgroup.inclusion L.m_le)
    (∀ (x y : Δ), T x.val * T y.val = T (x.val * y.val)) ∧
      (∀ x : Δ, IsUnit (T x.val)) ∧
      (∃! θ : L.M →* (HeckeAlgebraLevel A (RationalParabolic.Points H) U.toSubgroup)ˣ,
        θ.ker = U.toSubgroup.comap L.M.subtype ∧
        ∀ (x y : Δ), (θ (x.val * y.val⁻¹) : HeckeAlgebraLevel A (RationalParabolic.Points H) U.toSubgroup) *
          T y.val = (δ (x.val * y.val⁻¹) : A) • T x.val) := sorry
end ProIwahoriTorus

section FiniteHeckeDecomposition
open ValuativeRel
open TauCetiRoadmap.ReductiveGroupsPartII BruhatTits
open scoped PointTopology Pointwise
variable {F : Type} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F] [ModelField F]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{0,0} F}
  (D : LocalRootData F H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
  (l : RationalParabolic.Cocharacter H)
  (hmin : RationalParabolic.IsMinimal H l)
  (hT : (RationalParabolic.decomposition H l).M = D.rootDatum.T)
  (x : Apartment φ) (hx : Facet.IsSpecial x)
  (K₀ K : OpenSubgroup (RationalParabolic.Points H))
  (hK₀ : K₀.toSubgroup = Fixer.pointwise D φ {apartmentEmbedding D φ x})
  (hc₀ : IsCompact (K₀ : Set (RationalParabolic.Points H)))
  (hc : IsCompact (K : Set (RationalParabolic.Points H))) (hle : K ≤ K₀)
  (hnormal : (K.toSubgroup.subgroupOf K₀.toSubgroup).Normal)
  (hgood : ∀ r : RationalParabolic.Cocharacter H,
    (RationalParabolic.decomposition H l).P ≤ (RationalParabolic.decomposition H r).P →
      HasIwahoriDecomposition K.toSubgroup (RationalParabolic.decomposition H r).M
        (RationalParabolic.decomposition H r).N (RationalParabolic.oppositeDecomposition H r).N)

include hmin hT hx hK₀ hc₀ hle hnormal hgood in
/-- The central lattice has finite index, and only that lattice is lifted homomorphically.
The finite set of other representatives is recorded separately from the commutative algebra. -/
theorem HeckeAlgebraLevel.finite_decomposition :
    let L := RationalParabolic.decomposition H l
    let Λ := L.M ⧸ SmoothRep.compactlyGeneratedSubgroup
    let π : L.M →* Λ := QuotientGroup.mk' _
    let ΛZ := (Subgroup.center L.M).map π
    let Δ := positiveMonoid K.toSubgroup L.M L.N (RationalParabolic.oppositeDecomposition H l).N
    let b := fun g => HeckeAlgebraLevel.map K (Int.castRingHom ℂ)
      (HeckeAlgebraLevel.doubleCoset K hc g)
    let H₀ := Submodule.span ℂ (b '' (K₀ : Set (RationalParabolic.Points H)))
    ΛZ.index ≠ 0 ∧ Module.Finite ℂ H₀ ∧
    ∃ lift : ΛZ →* Subgroup.center L.M,
      (∀ z, π (lift z).val = z.val) ∧
      ∃ representatives : Finset L.M,
        (∀ m : L.M, ∃ r ∈ representatives, ∃ z : ΛZ, π m = π r * z.val) ∧
        ∃ C : Subalgebra ℂ (HeckeAlgebraLevel ℂ (RationalParabolic.Points H) K.toSubgroup),
          C.toSubmodule = Submodule.span ℂ {z | ∃ m : L.M, z = b m.val ∧
            ∃ z : ΛZ, m = (lift z).val ∧ π m ∈ π '' (Δ : Set L.M)} ∧
          (∀ c d : C, c * d = d * c) ∧ Algebra.FiniteType ℂ C ∧
          H₀ * Submodule.span ℂ {b m.val | m ∈ representatives} * C.toSubmodule * H₀ = ⊤ := sorry
end FiniteHeckeDecomposition

end

end TauCetiRoadmap.SmoothRepresentationsOfLocalGroups
