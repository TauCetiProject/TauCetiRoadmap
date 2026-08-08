import Mathlib

open CategoryTheory Limits

/-!
# Stable reduction of curves and stable maps: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here will suggest Lean forms for particular milestones so that
contributors and reviewers converge on names and signatures; discharging all of them will
finish neither a layer nor the roadmap.

At this roadmap repository's pinned Mathlib commit
`9caeba1000ef8f302920981f4a08651d325abc81`, the scheme-level vocabulary needed to state
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
  localizationEquiv : localRing ≃+* Localization.AtPrime prime
  [fractionAlgebra : Algebra localRing extensionField]
  [fractionIdentification : IsFractionRing localRing extensionField]

/-- Suggested Layer 0 shape for a model with its generic-fibre identification. -/
structure Model (R K : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Field K] [Algebra R K] [IsFractionRing R K]
    (C : Scheme.{u}) (toK : C ⟶ Spec (.of K)) where
  total : Scheme.{u}
  toBase : total ⟶ Spec (.of R)
  flat : Flat toBase
  locallyOfFinitePresentation : LocallyOfFinitePresentation toBase
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
      genericFiber := by simp }
  comp f g :=
    { hom := f.hom ≫ g.hom
      over_base := by rw [Category.assoc, g.over_base, f.over_base]
      genericFiber := by
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
  Edge : Type u
  [edgeFintype : Fintype Edge]
  [edgeDecidableEq : DecidableEq Edge]
  endpoint : Edge → Fin 2 → Vertex
  genus : Vertex → ℕ

namespace DualGraph

instance (G : DualGraph) : Fintype G.Vertex := G.vertexFintype
instance (G : DualGraph) : DecidableEq G.Vertex := G.vertexDecidableEq
instance (G : DualGraph) : Fintype G.Edge := G.edgeFintype
instance (G : DualGraph) : DecidableEq G.Edge := G.edgeDecidableEq

/-- Half-edges make the loop-counting convention explicit in the data. -/
abbrev HalfEdge (G : DualGraph) := G.Edge × Fin 2

/-- The vertex incident to a half-edge. -/
def HalfEdge.vertex (G : DualGraph) (h : G.HalfEdge) : G.Vertex := G.endpoint h.1 h.2

/-- The first Betti number of the intended connected dual graph, by Euler characteristic. -/
def firstBetti (G : DualGraph) : ℕ := Fintype.card G.Edge + 1 - Fintype.card G.Vertex

/-- The arithmetic genus encoded by a connected weighted dual graph. -/
def arithmeticGenus (G : DualGraph) : ℕ := ∑ v, G.genus v + G.firstBetti

end DualGraph

/-- Minimal compiled shape of the numerical type of a regular model. -/
structure NumericalType where
  Component : Type u
  [componentFintype : Fintype Component]
  [componentDecidableEq : DecidableEq Component]
  multiplicity : Component → ℕ+
  intersection : Matrix Component Component ℤ
  intersection_symm : ∀ i j, intersection i j = intersection j i
  offDiagonal_nonnegative : ∀ i j, i ≠ j → 0 ≤ intersection i j
  fiber_relation : ∀ i, ∑ j, (multiplicity j : ℤ) * intersection i j = 0
  genus : Component → ℕ

namespace NumericalType

instance (T : NumericalType) : Fintype T.Component := T.componentFintype
instance (T : NumericalType) : DecidableEq T.Component := T.componentDecidableEq

/-- Divisors supported on the components of a numerical type. -/
abbrev Divisor (T : NumericalType) := T.Component → ℤ

/-- The subgroup generated by the rows of the intersection matrix. -/
def principalDivisors (T : NumericalType) : AddSubgroup T.Divisor :=
  AddSubgroup.closure (Set.range T.intersection)

/-- The Picard group of a numerical type, as the cokernel of its intersection pairing. -/
abbrev Pic (T : NumericalType) := T.Divisor ⧸ T.principalDivisors

/-- The `ℓ`-torsion subgroup of the Picard group of a numerical type. -/
def torsion (T : NumericalType) (ℓ : ℕ) : AddSubgroup T.Pic :=
  AddSubgroup.torsionBy T.Pic (ℓ : ℤ)

end NumericalType

end

end TauCetiRoadmap.StableReduction
