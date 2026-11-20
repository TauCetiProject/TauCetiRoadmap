import Mathlib
import TauCeti.RepresentationTheory.Invariants
import TauCeti.RepresentationTheory.Induction.Mackey.Decomposition
import TauCeti.RepresentationTheory.Induction.Clifford.Equivalence
import TauCeti.RepresentationTheory.Induction.Clifford.Correspondence
import TauCeti.RepresentationTheory.Induction.Clifford.Obstruction
import TauCeti.RepresentationTheory.ProjectiveRepresentation.Basic
import TauCeti.GroupTheory.GroupExtension.Of.FactorSet

/-!
# Induction, restriction and Mackey theory for finite groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need.

The headline theorems are:
* the Mackey decomposition as a finite biproduct of induced conjugates (README §3.1,
  `isIso_biproductDesc_mackeyInclusion`);
* Clifford's theorem over every field, in structural and in character form (README §5.2,
  `exists_resFDRep_iso_cliffordSum`, `clifford_restrict_character`);
* the Clifford correspondence over a field in which `|G|` is invertible and which splits `G`
  (README §5.3, `clifford_correspondence_of_scalarSchur`);
* the universal central extension `[F, F] / [F, R]` of a perfect group and its kernel
  `(R ∩ [F, F]) / [F, R]` (README §7.1, namespace `AbstractUCE`);
* the scalar Clifford obstruction over an arbitrary field (README §7.5).

Two headline theorems are not stated: the equivalence between representations of the inertia
group whose restriction to `N` is isotypic of type `V` and modules over the crossed-product
algebra of the division crossed system (README §7.7), and its compatibility with restriction and
induction between intermediate subgroups (README §7.8). Both have as their source the full
subcategory of `V`-isotypic representations of the inertia group, which the pins do not define.

The remaining declarations are the adapters of README §2.1 and §7.2–§7.4. Everything this roadmap
consumes from Mathlib and Tau Ceti is listed under "Exact supplier contracts" in the README.
-/

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction

open CategoryTheory Limits
open scoped Pointwise Classical

universe u

/-! ## Layer 2: induced characters and Frobenius reciprocity -/

namespace Gassmann

variable {k G D V W : Type*} [CommRing k] [Group G] [Group D]
  [AddCommGroup V] [Module k V] [AddCommGroup W] [Module k W]
  {ρ : Representation k G V} {σ : Representation k G W}

/-- An equivalence of representations of `G` restricts, along a group homomorphism `f : D →* G`,
to an equivalence of the restricted representations of `D` (README §2.1). -/
def restrictEquiv (e : ρ.Equiv σ) (f : D →* G) :
    Representation.Equiv (ρ.comp f) (σ.comp f) :=
  Representation.Equiv.mk e.toLinearEquiv (fun d ↦ e.isIntertwining' (f d))

/-- An equivalence of representations of `G` induces, for a normal subgroup `I`, an equivalence of
the representations of `G ⧸ I` on the `I`-invariants (README §2.1). -/
noncomputable def normalInvariantEquiv (e : ρ.Equiv σ) (I : Subgroup G) [I.Normal] :
    (ρ.quotientToInvariants I).Equiv (σ.quotientToInvariants I) :=
  Representation.Equiv.mk (restrictEquiv e I.subtype).invariantsLinearEquiv (by
    intro q
    refine QuotientGroup.induction_on q ?_
    intro g
    apply LinearMap.ext
    intro x
    apply Subtype.ext
    exact congrArg (fun t : V →ₗ[k] W ↦ t (x : V)) (e.isIntertwining' g))

end Gassmann

/-! ## Layer 3: the Mackey decomposition formula -/

/-- **The Mackey decomposition as a finite biproduct** (README §3.1). For subgroups `H`, `K` of `G`
with finitely many double cosets `K \ G / H` and a representation `A` of `H` over a commutative
ring, the morphism out of the biproduct of the Mackey summands
`Ind_{K ⊓ sHs⁻¹}^K (Res {}^s A)`, one for each double coset with its chosen representative `s`,
whose component at `s` is the embedding `⟦u ⊗ a⟧ ↦ ⟦s⁻¹ u ⊗ a⟧` into `Res_K (Ind_H^G A)`, is an
isomorphism (Curtis–Reiner §10–11; Mackey 1951). -/
theorem isIso_biproductDesc_mackeyInclusion {k G : Type u} [CommRing k] [Group G]
    {H K : Subgroup G} [Finite (DoubleCoset.Quotient (K : Set G) (H : Set G))]
    [HasFiniteBiproducts (Rep k K)] (A : Rep k H) :
    IsIso (biproduct.desc fun D : DoubleCoset.Quotient (K : Set G) (H : Set G) =>
      Rep.mackeyInclusion K D.out A) := by
  sorry

/-! ## Layer 5: Clifford theory over a normal subgroup -/

/-- **Clifford's theorem over every field** (README §5.2). For a finite group `G`, a normal
subgroup `N`, a field `k` and a simple finite-dimensional representation `W` of `G`, there are a
simple representation `V` of `N` and `e ≠ 0` such that the restriction of `W` to `N` is the direct
sum of `e` copies of each conjugate `{}^q V`, `q` running over the cosets of the inertia group of
`V` (Isaacs, Ch. 6; Curtis–Reiner §11). No invertibility of `|G|` in `k` is assumed. -/
theorem exists_resFDRep_iso_cliffordSum {k : Type u} {G : Type u} [Field k] [Group G] [Finite G]
    {N : Subgroup G} [N.Normal] (W : FDRep k G) [Simple W] :
    ∃ (V : FDRep k N) (_ : Simple V) (hfinite : Finite (G ⧸ TauCeti.inertia V)),
      let _ := hfinite
      ∃ e : ℕ, e ≠ 0 ∧ Nonempty (Subgroup.resFDRep N W ≅ V.cliffordSum e) := by
  sorry

/-- **Clifford's theorem, character form, over every field** (README §5.2). For a simple
finite-dimensional `W`, there are a simple `V` of `N`, a natural multiplicity `e ≠ 0` and a left
transversal `reps` of the inertia group of `V` such that on `N` the character of `W` is `e` times
the sum of the characters of the conjugates `{}^g V`, `g ∈ reps`. In positive characteristic the
identity sees only `(e : k)`. -/
theorem clifford_restrict_character {k : Type u} {G : Type u} [Field k] [Group G]
    {N : Subgroup G} [N.Normal] [Fintype G] (W : FDRep k G) [Simple W] :
    ∃ (V : FDRep k N) (_ : Simple V) (e : ℕ) (reps : Finset G),
      e ≠ 0 ∧
      (∀ g : G, ∃! r, r ∈ reps ∧ g⁻¹ * r ∈ TauCeti.inertia V) ∧
      ∀ n : N, W.character (n : G)
        = (e : k) * ∑ g ∈ reps, (TauCeti.conjNormalFDRep g V).character n := by
  sorry

/-- **The Clifford correspondence over a splitting field** (README §5.3). Let `G` be finite, `N`
normal, `V` a simple representation of `N` with inertia group `T`, and `k` a field in which `|G|`
is invertible and over which every simple finite-dimensional representation of `G` has
one-dimensional endomorphism algebra. Then induction from `T` to `G` sends simple representations
of `T` lying over `V` to simple representations of `G` lying over `V`, every simple representation
of `G` lying over `V` arises so, and it determines the representation of `T` up to isomorphism
(Isaacs, Ch. 6; Curtis–Reiner §11). -/
theorem clifford_correspondence_of_scalarSchur {k : Type u} {G : Type u} [Field k] [Group G]
    [Finite G] {N : Subgroup G} [N.Normal] (hG : IsUnit (Nat.card G : k))
    (hSplitG : ∀ W : FDRep k G, Simple W → Module.finrank k (W ⟶ W) = 1)
    (V : FDRep k N) [Simple V] :
    (∀ U : FDRep k (TauCeti.inertia V), Simple U →
        U.LiesOver (Subgroup.inclusion (TauCeti.le_inertia V)) V →
          Simple (TauCeti.indFDRep U) ∧ (TauCeti.indFDRep U).LiesOver N.subtype V) ∧
    (∀ W : FDRep k G, Simple W → W.LiesOver N.subtype V →
        ∃ U : FDRep k (TauCeti.inertia V), Simple U ∧
          U.LiesOver (Subgroup.inclusion (TauCeti.le_inertia V)) V ∧
          Nonempty (TauCeti.indFDRep U ≅ W)) ∧
    (∀ U U' : FDRep k (TauCeti.inertia V), Simple U → Simple U' →
        U.LiesOver (Subgroup.inclusion (TauCeti.le_inertia V)) V →
        U'.LiesOver (Subgroup.inclusion (TauCeti.le_inertia V)) V →
        Nonempty (TauCeti.indFDRep U ≅ TauCeti.indFDRep U') → Nonempty (U ≅ U')) := by
  sorry

end TauCetiRoadmap.RepresentationTheory.InductionRestriction

/-! ## Layer 7: projective representations, factor sets, and the Schur multiplier -/

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction.AbstractUCE

universe v w

variable (G : Type w) [Group G]

/-- A central extension of `G` is a surjective homomorphism onto `G` whose kernel lies in the
centre (README §7.1). -/
def IsCentralExtension {E : Type v} [Group E] (p : E →* G) : Prop :=
  Function.Surjective p ∧ p.ker ≤ Subgroup.center E

/-- The canonical free presentation `F → G`, sending the generator indexed by `g` to `g`. -/
abbrev presentation : FreeGroup G →* G := FreeGroup.prod

/-- The relation subgroup `R`, the kernel of the canonical free presentation. -/
abbrev relations : Subgroup (FreeGroup G) := (presentation G).ker

/-- The commutator subgroup `[F, F]` of the free group. -/
abbrev derived : Subgroup (FreeGroup G) := commutator (FreeGroup G)

/-- The normal subgroup `[F, R]`. -/
abbrev relationCommutators : Subgroup (FreeGroup G) :=
  ⁅(⊤ : Subgroup (FreeGroup G)), relations G⁆

/-- `[F, R]` is contained in `[F, F]`. -/
theorem relationCommutators_le_derived : relationCommutators G ≤ derived G :=
  Subgroup.commutator_mono le_rfl le_top

/-- `[F, R]` is contained in `R`, since `R` is normal. -/
theorem relationCommutators_le_relations : relationCommutators G ≤ relations G :=
  Subgroup.commutator_le_right ⊤ (relations G)

/-- `[F, R]`, as a subgroup of `[F, F]`. -/
abbrev relationsInsideDerived : Subgroup (derived G) :=
  (relationCommutators G).subgroupOf (derived G)

/-- The group `U = [F, F] / [F, R]`. -/
abbrev Cover : Type w := derived G ⧸ relationsInsideDerived G

/-- The homomorphism `U → G` induced by the free presentation. -/
def projection : Cover G →* G :=
  QuotientGroup.lift (relationsInsideDerived G)
    ((presentation G).comp (derived G).subtype) (by
      intro x hx
      exact relationCommutators_le_relations G hx)

/-- On the class of `x ∈ [F, F]` the projection is the free evaluation of `x`. -/
@[simp] theorem projection_mk (x : derived G) :
    projection G (QuotientGroup.mk' (relationsInsideDerived G) x) = presentation G x :=
  rfl

/-- For a perfect group the projection `U → G` is surjective. -/
theorem projection_surjective [Group.IsPerfect G] :
    Function.Surjective (projection G) := by
  sorry

/-- The kernel of the projection `U → G` is central in `U`. -/
theorem ker_projection_le_center :
    (projection G).ker ≤ Subgroup.center (Cover G) := by
  sorry

/-- The kernel of the projection is the image of `R ∩ [F, F]` in `U`. -/
theorem ker_projection_eq_map :
    (projection G).ker = ((relations G).subgroupOf (derived G)).map
      (QuotientGroup.mk' (relationsInsideDerived G)) := by
  sorry

/-- The canonical homomorphism `(R ∩ [F, F]) / [F, R] → ker (U → G)`, sending the class of `x`
to the class of `x` in `U`. -/
def kernelMap :
    (↥(relations G ⊓ derived G) ⧸
      (relationCommutators G).subgroupOf (relations G ⊓ derived G)) →* (projection G).ker :=
  QuotientGroup.lift _
    { toFun := fun x => ⟨QuotientGroup.mk' (relationsInsideDerived G) ⟨x.1, x.2.2⟩, by
        rw [MonoidHom.mem_ker, projection_mk]
        exact x.2.1⟩
      map_one' := rfl
      map_mul' := fun _ _ => rfl }
    (by
      intro x hx
      apply Subtype.ext
      change QuotientGroup.mk' (relationsInsideDerived G) ⟨x.1, x.2.2⟩ = 1
      rw [QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff]
      exact hx)

/-- **The Hopf formula for the kernel** (README §7.1): the canonical homomorphism from
`(R ∩ [F, F]) / [F, R]` to the kernel of `U → G` is bijective. -/
theorem kernelMap_bijective : Function.Bijective (kernelMap G) := by
  sorry

/-- The projection `U → G` of a perfect group is a central extension. -/
theorem projection_isCentralExtension [Group.IsPerfect G] :
    IsCentralExtension G (projection G) :=
  ⟨projection_surjective G, ker_projection_le_center G⟩

/-- `U` is perfect when `G` is; the free commutator subgroup `[F, F]` itself is not. -/
theorem cover_isPerfect [Group.IsPerfect G] : Group.IsPerfect (Cover G) := by
  sorry

/-- **The universal central extension of a perfect group** (README §7.1). For a perfect group
`G` and every surjective homomorphism `p : E → G` with central kernel, in any universe, there is
exactly one homomorphism `f : U → E` with `p ∘ f` the projection `U → G`. -/
theorem universal [Group.IsPerfect G] {E : Type v} [Group E]
    (p : E →* G) (hp : Function.Surjective p)
    (hcentral : p.ker ≤ Subgroup.center E) :
    ∃! f : Cover G →* E, p.comp f = projection G := by
  sorry

end TauCetiRoadmap.RepresentationTheory.InductionRestriction.AbstractUCE

namespace TauCetiRoadmap.RepresentationTheory.InductionRestriction

open CategoryTheory

section Projective

variable {k : Type} [Field k] {G : Type} [Group G]

attribute [local instance] TauCeti.trivialMulDistribMulAction

/-- **A factor set is a `2`-cocycle** (README §7.2). For the trivial action of `G` on `kˣ`, a
function `α : G × G → kˣ` satisfying the multiplicative cocycle identity lies, written additively,
in `groupCohomology.cocycles₂` of the trivial module `Additive kˣ`. -/
theorem factorSet_mem_cocycles₂ (α : G × G → kˣ)
    (hα : ∀ g h j : G, α (g * h, j) * α (g, h) = α (h, j) * α (g, h * j)) :
    (fun p : G × G => Additive.ofMul (α p)) ∈
      groupCohomology.cocycles₂ (Rep.trivial ℤ G (Additive kˣ)) := sorry

/-- The twisted product on `G →₀ k`, `e_g * e_h = α(g, h) • e_{g h}`, extended bilinearly
(README §7.3). -/
noncomputable def twistedMul (α : G × G → kˣ) : (G →₀ k) → (G →₀ k) → (G →₀ k) := fun f g ↦
  f.sum fun x a ↦ g.sum fun y b ↦ Finsupp.single (x * y) (a * b * (α (x, y) : k))

/-- On basis vectors the twisted product is `α(g, h) • e_{g h}`; no cocycle condition is needed. -/
theorem twistedMul_single (α : G × G → kˣ) (x y : G) (a b : k) :
    twistedMul α (Finsupp.single x a) (Finsupp.single y b) =
      Finsupp.single (x * y) (a * b * (α (x, y) : k)) := by
  classical
  simp [twistedMul]

/-- The coordinate identification of `G →₀ k` with Tau Ceti's twisted group algebra, through its
basis indexed by `G` (README §7.3). -/
noncomputable def twistedCoordinateEquiv (α : G × G → kˣ)
    [TauCeti.IsFactorSet (Function.curry α)] :
    (G →₀ k) ≃ₗ[k] TauCeti.twistedMonoidAlgebra k G (Function.curry α) :=
  (TauCeti.TwistedMonoidAlgebra.basis k G (Function.curry α)).repr.symm

/-- The coordinate identification carries the twisted product on `G →₀ k` to the product of the
twisted group algebra (README §7.3). -/
theorem twistedCoordinateEquiv_mul (α : G × G → kˣ)
    [TauCeti.IsFactorSet (Function.curry α)] (f g : G →₀ k) :
    twistedCoordinateEquiv α (twistedMul α f g) =
      twistedCoordinateEquiv α f * twistedCoordinateEquiv α g := by
  sorry

/-- The carrier `kˣ × G` of the central extension `1 → kˣ → E_α → G → 1` of a normalized factor
set `α` (README §7.4); its group structure is `factorSetExtensionGroup` below. The cocycle identity
`hα` and the normalization `hα₁` are part of the data. -/
def centralExtensionOfFactorSet (α : G × G → kˣ)
    (_hα : ∀ g h j : G, α (g * h, j) * α (g, h) = α (h, j) * α (g, h * j))
    (_hα₁ : ∀ g : G, α (1, g) = 1 ∧ α (g, 1) = 1) : Type := kˣ × G

/-- **Existence of a compatible projective extension, scalar case** (README §7.5). Over any field,
a simple finite-dimensional representation `V` of a normal subgroup `N` whose endomorphisms are
scalars extends to a projective representation of its inertia group, agreeing with `V` on `N`,
with factor set pulled back from the quotient by `N`. -/
theorem exists_scalarProjectiveInertiaExtension {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    ∃ ρ β, TauCeti.IsProjectiveInertiaExtension V ρ β := by
  sorry

/-- Any two compatible projective extensions of a simple `V` with scalar endomorphisms have
cohomologous quotient factor sets (README §7.5). -/
theorem scalarProjectiveInertiaExtension_class_eq {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V)
    {ρ ρ' : TauCeti.inertia V → V ≃ₗ[k] V}
    {β β' : TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) →
      TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) → kˣ}
    (h : TauCeti.IsProjectiveInertiaExtension V ρ β)
    (h' : TauCeti.IsProjectiveInertiaExtension V ρ' β') :
    h.factorSet.cohomologyClass = h'.factorSet.cohomologyClass := by
  sorry

/-- **The scalar Clifford obstruction** (README §7.5): the class in `H²(T ⧸ N, kˣ)`, `T` the
inertia group, of the factor set of any compatible projective extension of a simple `V` with
scalar endomorphisms. -/
noncomputable def cliffordObstruction {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    TauCeti.schurMultiplier k (TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V)) :=
  (exists_scalarProjectiveInertiaExtension V hScalar).choose_spec.choose_spec.factorSet.cohomologyClass

/-- Every compatible projective extension represents the obstruction class. -/
theorem scalarProjectiveInertiaExtension_class_eq_obstruction {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V)
    {ρ : TauCeti.inertia V → V ≃ₗ[k] V}
    {β : TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) →
      TauCeti.inertia V ⧸ N.subgroupOf (TauCeti.inertia V) → kˣ}
    (h : TauCeti.IsProjectiveInertiaExtension V ρ β) :
    h.factorSet.cohomologyClass = cliffordObstruction V hScalar := by
  unfold cliffordObstruction
  exact scalarProjectiveInertiaExtension_class_eq V hScalar h
    (exists_scalarProjectiveInertiaExtension V hScalar).choose_spec.choose_spec

/-- **The obstruction criterion** (README §7.5): the scalar obstruction vanishes exactly when the
action of `N` on `V` extends to an ordinary representation of the inertia group on the same
space. -/
theorem cliffordObstruction_eq_zero_iff {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    cliffordObstruction V hScalar = 0 ↔
      ∃ σ : Representation k (TauCeti.inertia V) V,
        σ.comp (Subgroup.inclusion (TauCeti.le_inertia V)) = V.ρ := by
  sorry

/-- Over an algebraically closed field the scalar obstruction is Tau Ceti's
`TauCeti.cliffordObstruction`. -/
theorem cliffordObstruction_eq_native [IsAlgClosed k] {N : Subgroup G} [N.Normal]
    (V : FDRep k N) [Simple V]
    (hScalar : ∀ f : V ⟶ V, ∃ c : k, f = c • 𝟙 V) :
    cliffordObstruction V hScalar = TauCeti.cliffordObstruction V := by
  unfold cliffordObstruction
  exact TauCeti.IsProjectiveInertiaExtension.cohomologyClass_factorSet_eq_cliffordObstruction
    (exists_scalarProjectiveInertiaExtension V hScalar).choose_spec.choose_spec

end Projective

section FactorSetCentralExtension

variable {k G : Type} [Field k] [Group G]
variable (α : G × G → kˣ)
variable (hα : ∀ g h j : G, α (g * h, j) * α (g, h) = α (h, j) * α (g, h * j))
variable (hα₁ : ∀ g : G, α (1, g) = 1 ∧ α (g, 1) = 1)

attribute [local instance] TauCeti.trivialMulDistribMulAction

/-- The normalized factor set `α`, bundled as Tau Ceti's `TauCeti.FactorSet` for the trivial
action. -/
def normalizedFactorSet : TauCeti.FactorSet G kˣ where
  toFun := α
  isMulCocycle₂' g h j := by simpa using hα g h j
  map_one_one' := (hα₁ 1).1

/-- The product carrier `kˣ × G` is the carrier of Tau Ceti's extension of the factor set. -/
def factorSetNativeEquiv : centralExtensionOfFactorSet α hα hα₁ ≃
    (normalizedFactorSet α hα hα₁).Extension :=
  (TauCeti.FactorSet.Extension.equivProd (normalizedFactorSet α hα hα₁)).symm

/-- The group structure on `kˣ × G`, transported from Tau Ceti's extension. -/
instance factorSetExtensionGroup : Group (centralExtensionOfFactorSet α hα hα₁) :=
  (factorSetNativeEquiv α hα hα₁).group

/-- The identification of `kˣ × G` with Tau Ceti's extension is multiplicative. -/
def factorSetNativeMulEquiv : centralExtensionOfFactorSet α hα hα₁ ≃*
    (normalizedFactorSet α hα hα₁).Extension where
  toEquiv := factorSetNativeEquiv α hα hα₁
  map_mul' _ _ := rfl

/-- The twisted multiplication `(a, g)(b, h) = (a b α(g, h), g h)`. -/
@[simp] theorem factorSetExtension_mul
    (x y : centralExtensionOfFactorSet α hα hα₁) :
    x * y = (x.1 * y.1 * α (x.2, y.2), x.2 * y.2) := rfl

/-- The projection `(a, g) ↦ g`. -/
def factorSetProjection : centralExtensionOfFactorSet α hα hα₁ →* G where
  toFun x := x.2
  map_one' := rfl
  map_mul' _ _ := rfl

/-- The scalar inclusion `a ↦ (a, 1)`. -/
def factorSetScalarInclusion : kˣ →* centralExtensionOfFactorSet α hα hα₁ where
  toFun a := (a, 1)
  map_one' := rfl
  map_mul' a b := by
    change (a * b, (1 : G)) = (a * b * α (1, 1), (1 : G) * 1)
    simp [(hα₁ 1).1]

/-- The projection `kˣ × G → G` is surjective. -/
theorem factorSetProjection_surjective : Function.Surjective (factorSetProjection α hα hα₁) := by
  intro g
  exact ⟨(1, g), rfl⟩

/-- The image of the scalar inclusion is the kernel of the projection (README §7.4). -/
theorem factorSetScalarRange_eq_kernel :
    (factorSetScalarInclusion α hα hα₁).range = (factorSetProjection α hα hα₁).ker := by
  sorry

/-- The projection `kˣ × G → G` is a central extension in the sense of §7.1 (README §7.4). -/
theorem factorSetProjection_isCentralExtension :
    AbstractUCE.IsCentralExtension G (factorSetProjection α hα hα₁) := by
  refine ⟨factorSetProjection_surjective α hα hα₁, ?_⟩
  sorry

/-- The extension `1 → kˣ → kˣ × G → G → 1` as a Mathlib `GroupExtension`. -/
def factorSetGroupExtension :
    GroupExtension kˣ (centralExtensionOfFactorSet α hα hα₁) G where
  inl := factorSetScalarInclusion α hα hα₁
  rightHom := factorSetProjection α hα hα₁
  inl_injective := by
    intro a b h
    exact congrArg Prod.fst h
  range_inl_eq_ker_rightHom := factorSetScalarRange_eq_kernel α hα hα₁
  rightHom_surjective := factorSetProjection_surjective α hα hα₁

end FactorSetCentralExtension

end TauCetiRoadmap.RepresentationTheory.InductionRestriction
