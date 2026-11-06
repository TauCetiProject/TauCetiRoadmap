import Mathlib
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct
import TauCeti.AlgebraicGeometry.Modules.GlobalSections
import TauCeti.GroupTheory.Coxeter.Geometric
import TauCeti.LinearAlgebra.IntegralLattice.Basic

/-!
# Enriques surfaces: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: general Coxeter geometric faithfulness,
its T246 realization and the full image of the mod-two T246 reflection action.

The remaining headlines are not statable at the pins with a few simple definitions.
Layer 1's canonical K3 cover, Picard specialization and integral numerical-lattice
isometry need the Enriques predicate, surface numerical quotient and specialization
maps. Its coefficient comparisons additionally need integral étale cycle maps.
Layer 2's hyperelliptic classification and double-plane theorem need half-fibres,
complete linear systems and their resolved presentation carrier. Layer 3's equivalence
needs that presentation groupoid. Layer 4's Reye-family theorem needs the universal
web degeneracy family and its parameter quotient. Layer 5's normal-closure and
integral overlattice comparisons need the geometric Reye lattice and its marking
adapter; the statable representation headlines below are retained.
Layer 6's nodal automorphism and curve-transitivity theorems need the Reye open locus
and its surface action. Its unnodal lifting criterion, very-general automorphism
theorem and algebraic generic-open theorem need canonical-cover markings, Hodge
isometries, period families and relative Jacobian deformations. Layer 7's model
counts need the source's presentation equivalence relation and its comparison with
the intrinsic groupoid. No formal placeholder for any of these objects is introduced.
-/

namespace TauCetiRoadmap.EnriquesSurfaces

/-! ## Layer 5: the two lattices and the faithful reflection action -/

/-- The standard real geometric representation of any Coxeter system is faithful,
including systems with infinite exponents or degenerate or indefinite standard form
(Davis, second edition, Corollary D.1.2). -/
theorem coxeterGeometricFaithful {I W : Type*} [Group W] {M : CoxeterMatrix I}
    (cs : CoxeterSystem M W) : Function.Injective cs.geometricRepresentation := by
  sorry

/-- The T246 graph has chain 1--9 and the extra edge 0--4. -/
def reyeAdjacent (i j : Fin 10) : Prop :=
  (i.val > 0 ∧ j.val > 0 ∧ (i.val + 1 = j.val ∨ j.val + 1 = i.val)) ∨
  (i = 0 ∧ j = 4) ∨ (i = 4 ∧ j = 0)

/-- Adjacency in this finite graph is decidable. -/
instance reyeAdjacentDecidable (i j : Fin 10) : Decidable (reyeAdjacent i j) := by
  unfold reyeAdjacent
  infer_instance

/-- Coxeter exponents are 1 on the diagonal, 3 on edges and 2 elsewhere. -/
def reyeCoxeterEntry : Matrix (Fin 10) (Fin 10) ℕ :=
  fun i j ↦ if i = j then 1 else if reyeAdjacent i j then 3 else 2

/-- The abstract T246 Coxeter matrix, with its actual entries. -/
def reyeDiagram : CoxeterMatrix (Fin 10) where
  M := reyeCoxeterEntry
  isSymm := by decide +kernel
  diagonal i := by simp [reyeCoxeterEntry]
  off_diagonal i j h := by
    simp only [reyeCoxeterEntry, h, ite_false]
    split_ifs <;> decide

/-- The simple-root coordinates of the Reye lattice modulo twice that lattice. -/
abbrev ReyeReduction := Fin 10 → ZMod 2

/-- Half the even integral norm modulo two; each unoriented edge occurs once. -/
def reyeQuadratic (x : ReyeReduction) : ZMod 2 :=
  (∑ i, x i) + ∑ i, ∑ j,
    if i.val < j.val ∧ reyeAdjacent i j then x i * x j else 0

/-- The polar pairing of the half-norm quadratic form. -/
def reyePolar (x y : ReyeReduction) : ZMod 2 :=
  reyeQuadratic (x + y) - reyeQuadratic x - reyeQuadratic y

/-- The positive T246 root form: diagonal two, minus one along an edge. -/
def reyeRealPairing (x y : Fin 10 → ℝ) : ℝ :=
  2 * (∑ i, x i * y i) - ∑ i, ∑ j,
    if i.val < j.val ∧ reyeAdjacent i j then x i * y j + x j * y i else 0

/-- The actual T246 simple reflections extend to a faithful real representation. -/
theorem reyeGeometricFaithful :
    ∃ ρ : reyeDiagram.Group →* Module.End ℝ (Fin 10 → ℝ),
      Function.Injective ρ ∧
      ∀ i x, ρ (reyeDiagram.toCoxeterSystem.simple i) x =
        x - reyeRealPairing x (Pi.single i 1) • Pi.single i 1 := by
  sorry

/-- The mod-two simple reflections generate exactly the quadratic isometries
fixing the polar radical pointwise, including the nontrivial shear subgroup. -/
theorem reyeReductionImage :
    ∃ ρ : reyeDiagram.Group →* Module.End (ZMod 2) ReyeReduction,
      (∀ i x, ρ (reyeDiagram.toCoxeterSystem.simple i) x =
        x + reyePolar x (Pi.single i 1) • Pi.single i 1) ∧
      ∀ g : ReyeReduction ≃ₗ[ZMod 2] ReyeReduction,
        ((∀ x, reyeQuadratic (g x) = reyeQuadratic x) ∧
          ∀ x, (∀ y, reyePolar x y = 0) → g x = x) ↔
        ∃ w, ∀ x, ρ w x = g x := by
  sorry

section LatticeTargets

/-!
## Lattice targets

Illustrative targets for EnriquesSurfaces E5. The README is definitive; these
signatures are suggestions, not an exhaustive specification. The integral
carrier and its pairing come from the native embedded integral lattice API.
The ordered coordinates are f₁,…,f₉,δ, with geometric intersection signs.
-/

open scoped BigOperators
open Module

abbrev Index := Fin 10
abbrev Ambient := Index → ℚ

/-- Intersection matrix on the ordered integral basis f₁,…,f₉,δ. -/
def gram : Matrix Index Index ℤ := fun i j ↦
  if i = 9 then (if j = 9 then 10 else 3)
  else if j = 9 then 3 else if i = j then 0 else 1

theorem gram_isSymm : gram.IsSymm := by decide +kernel

/-- The actual integral lattice in a fixed rational ambient space. -/
noncomputable def model : TauCeti.IntegralLattice Ambient :=
  TauCeti.IntegralLattice.ofGramMatrix (Pi.basisFun ℚ Index) gram gram_isSymm

noncomputable def modelBasis : Basis Index ℤ model :=
  TauCeti.IntegralLattice.ofGramMatrix.basis (Pi.basisFun ℚ Index) gram gram_isSymm

/-- Coordinates are integral combinations of the native carrier basis. -/
noncomputable def vector (v : Index → ℤ) : model := ∑ i, v i • modelBasis i

def f10Coordinates : Index → ℤ := fun i ↦ if i = 9 then 3 else -1

def betaCoordinates (i : Index) : Index → ℤ :=
  if i = 0 then fun j ↦ if j = 9 then 1 else if j.val < 4 then -1 else 0
  else if i = 9 then Pi.single 8 1 - f10Coordinates
  else Pi.single ⟨i.val - 1, by omega⟩ 1 - Pi.single i 1

def rCoordinates : Index → ℤ := Pi.single 9 1 - 2 • f10Coordinates

noncomputable def beta (i : Index) : model := vector (betaCoordinates i)
noncomputable def r : model := vector rCoordinates

/-- The parity map uses the integral pairing on M, not rational membership tests. -/
noncomputable def parity : model →ₗ[ℤ] ZMod 2 where
  toFun x := (model.integralForm r x : ZMod 2)
  map_add' x y := by simp
  map_smul' n x := by simp

/-- R lives as a submodule of the same rational ambient as M. -/
noncomputable def reyeCarrier : Submodule ℤ Ambient :=
  parity.ker.map model.carrier.subtype

/-- The beta span is specified independently of the parity kernel. -/
noncomputable def betaSpan : Submodule ℤ Ambient :=
  Submodule.span ℤ (Set.range fun i ↦ (beta i : Ambient))

/-- A square minus two root acts by x ↦ x + (β,x)β. -/
noncomputable def simpleReflection (i : Index) : Module.End ℤ model :=
  LinearMap.id + LinearMap.smulRight (model.integralForm (beta i)) (beta i)

def adjacent (i j : Index) : Prop :=
  (i.val > 0 ∧ j.val > 0 ∧ (i.val + 1 = j.val ∨ j.val + 1 = i.val)) ∨
  (i = 0 ∧ j = 4) ∨ (i = 4 ∧ j = 0)

instance (i j : Index) : Decidable (adjacent i j) := by
  unfold adjacent
  infer_instance

/-- The ambient unimodular model is not the index two root sublattice. -/
theorem gram_det : gram.det = -1 := by sorry

theorem beta_pairing (i j : Index) :
    model.integralForm (beta i) (beta j) =
      if i = j then -2 else if adjacent i j then 1 else 0 := by sorry

theorem r_square : model.integralForm r r = -2 := by sorry

theorem r_beta_pairing (i : Index) :
    model.integralForm r (beta i) = if i = 9 then -2 else 0 := by sorry

/-- Proving inclusion alone does not establish the index or equality. -/
theorem betaSpan_eq_reyeCarrier : betaSpan = reyeCarrier := by sorry

theorem parity_surjective : Function.Surjective parity := by sorry

theorem simpleReflection_involutive (i : Index) :
    Function.Involutive (simpleReflection i) := by sorry

theorem simpleReflection_isometry (i : Index) (x y : model) :
    model.integralForm (simpleReflection i x) (simpleReflection i y) =
      model.integralForm x y := by sorry

theorem simpleReflection_preserves_parity (i : Index) (x : model) :
    parity (simpleReflection i x) = parity x := by sorry

end LatticeTargets

section ReflectionTargets

/-!
## Reflection targets

Suggested interfaces for EnriquesSurfaces E5; the README is definitive and this
section is nonexhaustive. The standard real form is compared with the negative
geometric intersection form, including its factor of two. No finite-root
positive-definiteness assumption is made for this indefinite Coxeter diagram.
-/

def t246Entries : Matrix Index Index ℕ :=
  fun i j ↦ if i = j then 1 else if adjacent i j then 3 else 2

def t246 : CoxeterMatrix Index where
  M := t246Entries
  isSymm := by decide +kernel
  diagonal i := by simp [t246Entries]
  off_diagonal i j h := by simp only [t246Entries, h, ite_false]; split_ifs <;> decide

noncomputable def realRoot (i : Index) : Index → ℝ :=
  fun j ↦ (betaCoordinates i j : ℝ)

/-- Scalar extension followed by the actual beta coordinate map. -/
noncomputable def rootMap : (Index →₀ ℝ) →ₗ[ℝ] (Index → ℝ) :=
  Finsupp.linearCombination ℝ realRoot

noncomputable def realIntersection : LinearMap.BilinForm ℝ (Index → ℝ) :=
  Matrix.toBilin (Pi.basisFun ℝ Index) (gram.map (Int.castRingHom ℝ))

noncomputable def realReflection (i : Index) : Module.End ℝ (Index → ℝ) :=
  LinearMap.id + LinearMap.smulRight (realIntersection (realRoot i)) (realRoot i)

theorem rootMap_bijective : Function.Bijective rootMap := by sorry

/-- Native standard B has diagonal 1, whereas geometric intersection has -2. -/
theorem rootMap_form (u v : Index →₀ ℝ) :
    -(realIntersection (rootMap u) (rootMap v)) = 2 * t246.geometricForm u v := by sorry

theorem rootMap_reflection (i : Index) :
    rootMap.comp (t246.geometricReflection i) = (realReflection i).comp rootMap := by sorry

end ReflectionTargets

section SheafTargets

/-!
## Sheaf targets

Illustrative interfaces for EnriquesSurfaces E0/E3. The README is definitive;
these suggestions do not exhaust it. Schemes, sheaves, sections, tensor products
and scalar actions below are native objects. The evaluation is attached to the
actual chosen sections; it is not asserted surjective at a base point.
-/

open CategoryTheory AlgebraicGeometry Opposite
open TauCeti.AlgebraicGeometry

universe u

/-- The base-field map records the actual structure morphism. -/
noncomputable def baseGlobal (k : Type u) [Field k] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of k)) : k →+* Γ(X, ⊤) :=
  ((Scheme.ΓSpecIso (CommRingCat.of k)).inv ≫ f.appTop).hom

/-- Scalar arrows before rigidification, on the actual sheaf representative. -/
noncomputable def scalarAut (k : Type u) [Field k] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of k)) (L : InvertibleSheaf X) (a : kˣ) : Aut L.obj :=
  asIso (Scheme.Modules.globalSectionsSmul L.obj
    ((Units.map (baseGlobal k X f).toMonoidHom a : Γ(X, ⊤)ˣ) : Γ(X, ⊤)))

/-- The free-sheaf evaluation map of an explicit finite section family. -/
noncomputable def sectionEvaluation {X : Scheme.{u}} (L : InvertibleSheaf X)
    (n : ℕ) (s : Fin n → L.obj.sections) :
    SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin n)) ⟶ L.obj :=
  (SheafOfModules.freeHomEquiv L.obj).symm (fun i ↦ s i.down)

/-- A square trivialization belongs to the actual line bundle, not its class alone. -/
abbrev SquareTrivialization {X : Scheme.{u}} (L : InvertibleSheaf X) :=
  InvertibleSheaf.tensorProduct L L ≅ InvertibleSheaf.trivial X

/-- Raw arrow over the identity surface map: theta is retained before quotienting
scalars. The induced plane map is its projectivized section map in E3. -/
abbrev RawFixedSurfaceArrow {X : Scheme.{u}} (L L' : InvertibleSheaf X) := L ≅ L'

/-- The class equation is a theorem about any chosen square trivialization. -/
theorem class_square_eq_one {X : Scheme.{u}} (L : InvertibleSheaf X)
    (tau : SquareTrivialization L) : LineBundleClass.mk L ^ 2 = 1 := by
  rw [pow_two, ← LineBundleClass.mk_tensorProduct]
  have h : LineBundleClass.mk (InvertibleSheaf.tensorProduct L L) =
      LineBundleClass.mk (InvertibleSheaf.trivial X) :=
    LineBundleClass.mk_eq_mk_iff.mpr
      ⟨(TauCeti.AlgebraicGeometry.SheafOfModules.isInvertible X).ι.mapIso tau⟩
  exact h.trans LineBundleClass.mk_trivial

/-- Scalar multiplication is natural on the actual source and target sheaves. -/
theorem scalar_naturality (k : Type u) [Field k] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of k)) (L L' : InvertibleSheaf X)
    (theta : L.obj ⟶ L'.obj) (a : k) :
    Scheme.Modules.globalSectionsSmul L.obj (baseGlobal k X f a) ≫ theta =
      theta ≫ Scheme.Modules.globalSectionsSmul L'.obj (baseGlobal k X f a) :=
  Scheme.Modules.globalSectionsSmul_naturality theta (baseGlobal k X f a)

end SheafTargets

end TauCetiRoadmap.EnriquesSurfaces
