import Mathlib

open CategoryTheory Limits

/-!
# Stable reduction of curves and stable maps: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here will suggest Lean forms for particular milestones so that
contributors and reviewers converge on names and signatures; discharging all of them will
finish neither a layer nor the roadmap.

At this roadmap repository's pinned Mathlib commit
`05ae0103f49b1ad1248f6039bbbad43d8aeb52a9`, the scheme-level vocabulary needed to state
many targets faithfully does not exist: families of curves, at-worst-nodal morphisms,
relative dualizing sheaves, stable pointed families, stable maps, and finite DVR extensions
are all roadmap targets. Introducing placeholder `Prop` definitions here would make the
summit vacuous. The model interface and the purely combinatorial dual-graph and numerical-
type data can already be pinned without placeholders, so they are compiled below.

The narrative roadmap fixes the mathematical statements, conventions, proof route,
dependency layers, acceptance examples, stable-map API, and boundary with moduli spaces.
-/

namespace TauCetiRoadmap.StableReduction

universe u

noncomputable section

open AlgebraicGeometry

private abbrev genericPointMap (R K : Type u) [CommRing R] [Field K] [Algebra R K] :
    Spec (.of K) ⟶ Spec (.of R) :=
  Spec.map (CommRingCat.ofHom (algebraMap R K))

/-- The base change of a model to its specified fraction field, as an object over `Spec K`. -/
def genericFiber (R K : Type u) [CommRing R] [Field K] [Algebra R K]
    {X : Scheme.{u}} (toBase : X ⟶ Spec (.of R)) : Over (Spec (.of K)) :=
  Over.mk (pullback.snd toBase (genericPointMap R K))

/-- Suggested Layer 0 package for a chosen finite separable extension of a DVR.

The local ring is identified with the localization of the integral closure at the chosen maximal
ideal, rather than pretending that the whole integral closure is local. -/
structure FiniteDVRExtension (R K : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K] where
  extensionField : Type u
  [extensionFieldInst : Field extensionField]
  [extensionAlgebra : Algebra K extensionField]
  [extensionFinite : FiniteDimensional K extensionField]
  [extensionSeparable : Algebra.IsSeparable K extensionField]
  [extensionBaseAlgebra : Algebra R extensionField]
  [extensionTower : IsScalarTower R K extensionField]
  prime : Ideal (integralClosure R extensionField)
  prime_isMaximal : prime.IsMaximal
  localRing : Type u
  [localRingInst : CommRing localRing]
  [localRingDomain : IsDomain localRing]
  [localRingDVR : IsDiscreteValuationRing localRing]
  [localRingAlgebra : Algebra R localRing]
  [localRingDominates : IsLocalHom (algebraMap R localRing)]
  prime_liesOver : prime.comap (algebraMap R (integralClosure R extensionField)) =
    IsLocalRing.maximalIdeal R
  localizationEquiv : localRing ≃ₐ[R] Localization.AtPrime prime
  [localizationFractionAlgebra : Algebra (Localization.AtPrime prime) extensionField]
  [localizationFractionTower : IsScalarTower (integralClosure R extensionField)
    (Localization.AtPrime prime) extensionField]
  [fractionAlgebra : Algebra localRing extensionField]
  [fractionTower : IsScalarTower R localRing extensionField]
  fraction_commutes : algebraMap localRing extensionField =
    (algebraMap (Localization.AtPrime prime) extensionField).comp
      localizationEquiv.toRingEquiv.toRingHom
  [fractionIdentification : IsFractionRing localRing extensionField]

/-- Suggested Layer 0 shape for a model with its generic-fibre identification. -/
structure Model (R K : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Field K] [Algebra R K] [IsFractionRing R K]
    (C : Scheme.{u}) (toK : C ⟶ Spec (.of K)) where
  total : Scheme.{u}
  toBase : total ⟶ Spec (.of R)
  flat : Flat toBase
  locallyOfFinitePresentation : LocallyOfFinitePresentation toBase
  quasiCompact : QuasiCompact toBase
  genericFiberIso : genericFiber R K toBase ≅ Over.mk toK

namespace Model

variable {R K : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
variable [Field K] [Algebra R K] [IsFractionRing R K]
variable {C : Scheme.{u}} {toK : C ⟶ Spec (.of K)}

/-- The morphism on generic fibres induced by a morphism over the base. -/
def baseChangeHom {M N : Model R K C toK} (f : M.total ⟶ N.total)
    (over_base : f ≫ N.toBase = M.toBase) :
    pullback M.toBase (genericPointMap R K) ⟶ pullback N.toBase (genericPointMap R K) :=
  pullback.lift (pullback.fst _ _ ≫ f) (pullback.snd _ _) (by
    rw [Category.assoc, over_base]
    exact pullback.condition)

/-- Suggested Layer 0 shape for morphisms of models. -/
structure Hom (M N : Model R K C toK) where
  hom : M.total ⟶ N.total
  over_base : hom ≫ N.toBase = M.toBase
  genericFiber :
    baseChangeHom (R := R) (K := K) hom over_base ≫ N.genericFiberIso.hom.left =
      M.genericFiberIso.hom.left

instance (M : Model R K C toK) : Flat M.toBase := M.flat

instance (M : Model R K C toK) : LocallyOfFinitePresentation M.toBase :=
  M.locallyOfFinitePresentation

instance (M : Model R K C toK) : QuasiCompact M.toBase := M.quasiCompact

/-- Properness is an additional property of a model, not part of its bundled data. -/
abbrev IsProper (M : Model R K C toK) : Prop := AlgebraicGeometry.IsProper M.toBase

@[ext]
lemma Hom.ext {M N : Model R K C toK} {f g : Hom M N} (h : f.hom = g.hom) : f = g := by
  cases f
  cases g
  cases h
  rfl

@[simp]
lemma baseChangeHom_id (M : Model R K C toK) :
    baseChangeHom (R := R) (K := K) (𝟙 M.total) (by simp) = 𝟙 _ := by
  apply pullback.hom_ext
  · simp [baseChangeHom]
  · simp [baseChangeHom]

lemma baseChangeHom_comp {M N P : Model R K C toK} (f : Hom M N) (g : Hom N P) :
    baseChangeHom (R := R) (K := K) (f.hom ≫ g.hom) (by
      rw [Category.assoc, g.over_base, f.over_base]) =
      baseChangeHom (R := R) (K := K) f.hom f.over_base ≫
        baseChangeHom (R := R) (K := K) g.hom g.over_base := by
  apply pullback.hom_ext
  · simp only [baseChangeHom, pullback.lift_fst, pullback.lift_fst_assoc, Category.assoc]
  · simp only [baseChangeHom, pullback.lift_snd, Category.assoc]

/-- Models of a fixed generic fibre form a category. -/
instance : Category (Model R K C toK) where
  Hom := Hom
  id M :=
    { hom := 𝟙 M.total
      over_base := by simp
      genericFiber := by
        dsimp only [genericFiber]
        rw [baseChangeHom_id, Category.id_comp] }
  comp f g :=
    { hom := f.hom ≫ g.hom
      over_base := by rw [Category.assoc, g.over_base, f.over_base]
      genericFiber := by
        dsimp only [genericFiber] at f g ⊢
        rw [baseChangeHom_comp, Category.assoc, g.genericFiber, f.genericFiber] }
  id_comp f := by ext; simp
  comp_id f := by ext; simp
  assoc f g h := by ext; simp

/-- Isomorphisms of models are categorical isomorphisms. -/
abbrev Iso (M N : Model R K C toK) := M ≅ N

end Model

/-- Minimal compiled shape of the dual graph of a geometric nodal curve.

An edge has two half-edges even when both endpoints agree, so loops contribute two to valence. -/
structure DualGraph where
  Vertex : Type u
  [vertexFintype : Fintype Vertex]
  [vertexDecidableEq : DecidableEq Vertex]
  [vertexNonempty : Nonempty Vertex]
  Edge : Type u
  [edgeFintype : Fintype Edge]
  [edgeDecidableEq : DecidableEq Edge]
  endpoint : Edge → Fin 2 → Vertex
  genus : Vertex → ℕ
  connected : ∀ v w, Relation.ReflTransGen
    (fun v w ↦ ∃ e, (endpoint e 0 = v ∧ endpoint e 1 = w) ∨
      (endpoint e 0 = w ∧ endpoint e 1 = v)) v w

namespace DualGraph

instance (G : DualGraph) : Fintype G.Vertex := G.vertexFintype
instance (G : DualGraph) : DecidableEq G.Vertex := G.vertexDecidableEq
instance (G : DualGraph) : Nonempty G.Vertex := G.vertexNonempty
instance (G : DualGraph) : Fintype G.Edge := G.edgeFintype
instance (G : DualGraph) : DecidableEq G.Edge := G.edgeDecidableEq

/-- Half-edges make the loop-counting convention explicit in the data. -/
abbrev HalfEdge (G : DualGraph) := G.Edge × Fin 2

/-- The vertex incident to a half-edge. -/
def HalfEdge.vertex (G : DualGraph) (h : G.HalfEdge) : G.Vertex := G.endpoint h.1 h.2

/-- The first Betti number of the connected dual graph, by Euler characteristic. -/
def firstBetti (G : DualGraph) : ℕ := Fintype.card G.Edge + 1 - Fintype.card G.Vertex

/-- The arithmetic genus encoded by a connected weighted dual graph. -/
def arithmeticGenus (G : DualGraph) : ℕ := ∑ v, G.genus v + G.firstBetti

end DualGraph

/-- A numerical type in the sense of Stacks tag 0C6Z.

For a regular model, `weight i` is the degree of the constant field of its component over
the residue field. The component genus is computed over that constant field. -/
structure NumericalType where
  Component : Type u
  [componentFintype : Fintype Component]
  [componentDecidableEq : DecidableEq Component]
  [componentNonempty : Nonempty Component]
  multiplicity : Component → ℕ+
  weight : Component → ℕ+
  intersection : Matrix Component Component ℤ
  intersection_symm : ∀ i j, intersection i j = intersection j i
  offDiagonal_nonnegative : ∀ i j, i ≠ j → 0 ≤ intersection i j
  connected : ∀ i j, Relation.ReflTransGen
    (fun i j ↦ i ≠ j ∧ 0 < intersection i j) i j
  fiber_relation : ∀ i, ∑ j, (multiplicity j : ℤ) * intersection i j = 0
  weight_dvd : ∀ i j, (weight i : ℤ) ∣ intersection i j
  genus : Component → ℕ

namespace NumericalType

instance (T : NumericalType) : Fintype T.Component := T.componentFintype
instance (T : NumericalType) : DecidableEq T.Component := T.componentDecidableEq
instance (T : NumericalType) : Nonempty T.Component := T.componentNonempty

/-- The signed genus of a numerical type (Stacks tags 0C71–0C72).

The entire diagonal sum is even; individual summands need not be. Layer 6 proves this
integrality statement and the equality with `1 + ∑ mᵢ (wᵢ (gᵢ - 1) - aᵢᵢ / 2)` in `ℚ`.
Abstract numerical types can have negative genus, so the codomain is `ℤ`, not `ℕ`. -/
def arithmeticGenus (T : NumericalType) : ℤ :=
  1 + (∑ i, (T.multiplicity i : ℤ) * (T.weight i : ℤ) * ((T.genus i : ℤ) - 1)) -
    (∑ i, (T.multiplicity i : ℤ) * T.intersection i i) / 2

/-- Divisors supported on the components of a numerical type. -/
abbrev Divisor (T : NumericalType) := T.Component → ℤ

/-- The relation associated to `eᵢ`, with `j`th coordinate `aᵢⱼ / wⱼ` (Stacks tag 0C7H). -/
def principalDivisor (T : NumericalType) (i : T.Component) : T.Divisor :=
  fun j ↦ T.intersection i j / (T.weight j : ℤ)

/-- Symmetry and weight divisibility make the coordinate division exact. -/
lemma principalDivisor_mul_weight (T : NumericalType) (i j : T.Component) :
    T.principalDivisor i j * (T.weight j : ℤ) = T.intersection i j := by
  apply Int.ediv_mul_cancel
  rw [T.intersection_symm i j]
  exact T.weight_dvd j i

/-- The subgroup generated by the weighted relations, not the raw intersection rows. -/
def principalDivisors (T : NumericalType) : AddSubgroup T.Divisor :=
  AddSubgroup.closure (Set.range T.principalDivisor)

/-- The Picard group of a numerical type, as the cokernel of its weighted relations. -/
abbrev Pic (T : NumericalType) := T.Divisor ⧸ T.principalDivisors

/-- The `ℓ`-torsion subgroup of the Picard group of a numerical type. -/
def torsion (T : NumericalType) (ℓ : ℕ) : AddSubgroup T.Pic :=
  AddSubgroup.torsionBy T.Pic (ℓ : ℤ)

/-- A genus-three type whose raw matrix cokernel has spurious two-torsion. -/
private abbrev weightedExample : NumericalType.{0} where
  Component := Fin 2
  multiplicity := fun _ ↦ 1
  weight := fun _ ↦ 2
  intersection := !![-2, 2; 2, -2]
  intersection_symm := by intro i j; fin_cases i <;> fin_cases j <;> norm_num
  offDiagonal_nonnegative := by
    intro i j h
    fin_cases i <;> fin_cases j <;> norm_num at *
  connected := by
    intro i j
    by_cases h : i = j
    · subst j
      exact Relation.ReflTransGen.refl
    · apply Relation.ReflTransGen.single
      exact ⟨h, by fin_cases i <;> fin_cases j <;> norm_num at *⟩
  fiber_relation := by intro i; fin_cases i <;> norm_num [Fin.sum_univ_two]
  weight_dvd := by intro i j; fin_cases i <;> fin_cases j <;> norm_num
  genus := fun _ ↦ 1

example : weightedExample.arithmeticGenus = 3 := by
  decide

example : weightedExample.principalDivisor 0 = ![-1, 1] := by
  ext j
  fin_cases j <;> norm_num [principalDivisor, weightedExample]

example : weightedExample.principalDivisor 1 = ![1, -1] := by
  ext j
  fin_cases j <;> norm_num [principalDivisor, weightedExample]

private abbrev mixedWeightExample : NumericalType.{0} :=
  { weightedExample with
    weight := ![1, 2]
    weight_dvd := by
      intro i j
      fin_cases i <;> fin_cases j <;> norm_num [weightedExample] }

example : mixedWeightExample.principalDivisor 0 = ![-2, 1] := by
  ext j
  fin_cases j <;> norm_num [principalDivisor, mixedWeightExample, weightedExample]

private abbrev oddDiagonalExample : NumericalType.{0} where
  Component := Fin 2
  multiplicity := fun _ ↦ 1
  weight := fun _ ↦ 1
  intersection := !![-1, 1; 1, -1]
  intersection_symm := by intro i j; fin_cases i <;> fin_cases j <;> norm_num
  offDiagonal_nonnegative := by
    intro i j h
    fin_cases i <;> fin_cases j <;> norm_num at *
  connected := by
    intro i j
    by_cases h : i = j
    · subst j
      exact Relation.ReflTransGen.refl
    · apply Relation.ReflTransGen.single
      exact ⟨h, by fin_cases i <;> fin_cases j <;> norm_num at *⟩
  fiber_relation := by intro i; fin_cases i <;> norm_num [Fin.sum_univ_two]
  weight_dvd := by intro i j; exact one_dvd _
  genus := fun _ ↦ 1

example : oddDiagonalExample.arithmeticGenus = 2 := by
  decide

example : ({ weightedExample with genus := fun _ ↦ 0 } : NumericalType).arithmeticGenus = -1 := by
  decide

end NumericalType

end

end TauCetiRoadmap.StableReduction
