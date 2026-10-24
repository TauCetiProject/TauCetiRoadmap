import TauCetiRoadmap.McKaySkewGroup.Suggested
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Simple
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Matrix.ToLin

/-!
Concrete trace controls for the two CBH parameter normalizations. README.md is definitive.
Hard new constructions are targets. Existing native module/path/quotient carriers are reused.
The obstruction concerns abstract complex algebra isomorphisms, not merely vertex-compatible ones.
-/
namespace TauCetiRoadmap.McKaySkewGroup.CBHTraceControls

open CategoryTheory
open scoped Matrix MatrixGroups MonoidalCategory Classical
universe u v

/-- Actual scalar restriction; no second module object or action is postulated. -/
noncomputable abbrev complexModule {A : Type u} [Ring A] [Algebra ℂ A] (M : ModuleCat.{v} A) :
    ModuleCat.{v} ℂ := (ModuleCat.restrictScalars (algebraMap ℂ A)).obj M

/-- A genuine module-theoretic property, invariant under complex algebra isomorphism. -/
def HasSimpleDimension (A : Type u) [Ring A] [Algebra ℂ A] (d : ℕ) : Prop :=
  ∃ M : ModuleCat.{0} A, IsSimpleModule A M ∧
    Module.Finite ℂ (complexModule M) ∧ Module.finrank ℂ (complexModule M) = d

/-- Native restriction along an algebra isomorphism preserves simplicity and complex dimension.
Use restrictScalarsEquivalenceOfRingEquiv and the scalar identity from AlgHom.commutes. -/
theorem hasSimpleDimension_algEquiv_iff {A : Type u} {B : Type v}
    [Ring A] [Ring B] [Algebra ℂ A] [Algebra ℂ B] (e : A ≃ₐ[ℂ] B) (d : ℕ) :
    HasSimpleDimension A d ↔ HasSimpleDimension B d := sorry

/-- The actual scalar-restricted action is complex-linear because the scalar image is central. -/
noncomputable def actionLinear {A : Type u} [Ring A] [Algebra ℂ A] (M : ModuleCat.{v} A) (a : A) :
    Module.End ℂ (complexModule M) where
  toFun m := a • m
  map_add' x y := smul_add a x y
  map_smul' c m := by
    change a • ((algebraMap ℂ A c) • (show M from m)) =
      (algebraMap ℂ A c) • (a • (show M from m))
    rw [smul_smul, smul_smul]
    exact congrArg (fun b : A => b • (show M from m)) (Algebra.commutes c a).symm

noncomputable def quotientVertex (Q : Type u) [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)] (weight : Q → ℂ) (i : Q) :
    DeformedPreprojectiveAlgebra ℂ Q weight :=
  (Ideal.Quotient.mkₐ ℂ (deformedPreprojectiveIdeal ℂ Q weight).asIdeal)
    (TauCeti.PathAlgebra.vertexIdempotent ℂ (show Quiver.Symmetrify Q from i))

noncomputable def vertexSpace (Q : Type u) [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)] (weight : Q → ℂ)
    (M : ModuleCat.{v} (DeformedPreprojectiveAlgebra ℂ Q weight)) (i : Q) :
    Submodule ℂ (complexModule M) := LinearMap.range (actionLinear M (quotientVertex Q weight i))

noncomputable def vertexDimension (Q : Type u) [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)] (weight : Q → ℂ)
    (M : ModuleCat.{v} (DeformedPreprojectiveAlgebra ℂ Q weight)) (i : Q) : ℕ :=
  Module.finrank ℂ (vertexSpace Q weight M i)

/-- Orthogonal vertex idempotents sum to one in the actual finite path quotient. -/
theorem sum_vertexDimension (Q : Type u) [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)] (weight : Q → ℂ)
    (M : ModuleCat.{v} (DeformedPreprojectiveAlgebra ℂ Q weight))
    (hfin : Module.Finite ℂ (complexModule M)) :
    ∑ i, vertexDimension Q weight M i = Module.finrank ℂ (complexModule M) := sorry

/-- Sum the actual vertex relations and take the trace. Each opposite-arrow commutator has
trace zero; the vertex idempotent trace is its image dimension. -/
theorem deformedPreprojective_finiteModule_trace (Q : Type u) [Quiver Q] [Fintype Q]
    [∀ i j : Q, Fintype (i ⟶ j)] (weight : Q → ℂ)
    (M : ModuleCat.{v} (DeformedPreprojectiveAlgebra ℂ Q weight))
    (hfin : Module.Finite ℂ (complexModule M)) :
    ∑ i, weight i * (vertexDimension Q weight M i : ℂ) = 0 := sorry

/-! ## A separated explicit four-leaf star -/

structure D4StarVertex where
  val : Fin 5
  deriving DecidableEq

def D4StarVertex.finEquiv : D4StarVertex ≃ Fin 5 where
  toFun := D4StarVertex.val
  invFun := D4StarVertex.mk
  left_inv := by intro x; cases x; rfl
  right_inv := by intro x; rfl

instance : Fintype D4StarVertex := Fintype.ofEquiv (Fin 5) D4StarVertex.finEquiv.symm

def center : D4StarVertex := ⟨0⟩
def leaf (j : Fin 4) : D4StarVertex := ⟨j.succ⟩

instance : Quiver D4StarVertex where
  Hom i j := PLift (i = center ∧ ∃ l : Fin 4, j = leaf l)

noncomputable instance (i j : D4StarVertex) : Fintype (i ⟶ j) := PLift.fintypeProp _

def starArrow (j : Fin 4) : center ⟶ leaf j := ⟨⟨rfl, ⟨j, rfl⟩⟩⟩

def scalarWeight (chosen : Fin 4) (i : D4StarVertex) : ℂ :=
  if i = center then -1 else if i = leaf chosen then 1 else 0

def traceWeight (chosen : Fin 4) (i : D4StarVertex) : ℂ :=
  if i = center then -2 else if i = leaf chosen then 1 else 0

noncomputable abbrev ScalarStarAlgebra (chosen : Fin 4) :=
  DeformedPreprojectiveAlgebra ℂ D4StarVertex (scalarWeight chosen)
noncomputable abbrev TraceStarAlgebra (chosen : Fin 4) :=
  DeformedPreprojectiveAlgebra ℂ D4StarVertex (traceWeight chosen)

noncomputable def positiveArrow (weight : D4StarVertex → ℂ) (j : Fin 4) :
    DeformedPreprojectiveAlgebra ℂ D4StarVertex weight :=
  (Ideal.Quotient.mkₐ ℂ (deformedPreprojectiveIdeal ℂ D4StarVertex weight).asIdeal)
    (TauCeti.PathAlgebra.ofArrow (starArrow j).toPos)

noncomputable def negativeArrow (weight : D4StarVertex → ℂ) (j : Fin 4) :
    DeformedPreprojectiveAlgebra ℂ D4StarVertex weight :=
  (Ideal.Quotient.mkₐ ℂ (deformedPreprojectiveIdeal ℂ D4StarVertex weight).asIdeal)
    (TauCeti.PathAlgebra.ofArrow (starArrow j).toNeg)

def vertexMatrix (chosen : Fin 4) (i : D4StarVertex) : Matrix (Fin 2) (Fin 2) ℂ :=
  if i = center then Matrix.single 0 0 1 else
    if i = leaf chosen then Matrix.single 1 1 1 else 0

def positiveMatrix (chosen j : Fin 4) : Matrix (Fin 2) (Fin 2) ℂ :=
  if j = chosen then Matrix.single 1 0 1 else 0

def negativeMatrix (chosen j : Fin 4) : Matrix (Fin 2) (Fin 2) ℂ :=
  if j = chosen then Matrix.single 0 1 1 else 0

/-- Build the path-algebra map from the displayed matrix units and descend through the actual
relator. aa*−a*a=E11−E00, so both arrows at the chosen edge are nonzero. -/
noncomputable def scalarStarRepresentation : ∀ (chosen : Fin 4),
    ScalarStarAlgebra chosen →ₐ[ℂ] Module.End ℂ (Fin 2 → ℂ) := sorry

theorem scalarStarRepresentation_vertex (chosen : Fin 4) (i : D4StarVertex) :
    scalarStarRepresentation chosen (quotientVertex D4StarVertex (scalarWeight chosen) i) =
      Matrix.toLinAlgEquiv' (vertexMatrix chosen i) := sorry

theorem scalarStarRepresentation_positive (chosen j : Fin 4) :
    scalarStarRepresentation chosen (positiveArrow (scalarWeight chosen) j) =
      Matrix.toLinAlgEquiv' (positiveMatrix chosen j) := sorry

theorem scalarStarRepresentation_negative (chosen j : Fin 4) :
    scalarStarRepresentation chosen (negativeArrow (scalarWeight chosen) j) =
      Matrix.toLinAlgEquiv' (negativeMatrix chosen j) := sorry

noncomputable def scalarStarModule (chosen : Fin 4) : ModuleCat.{0} (ScalarStarAlgebra chosen) :=
  letI := Module.compHom (Fin 2 → ℂ) (scalarStarRepresentation chosen).toRingHom
  ModuleCat.of (ScalarStarAlgebra chosen) (Fin 2 → ℂ)

/-- The actual two-dimensional underlying complex carrier, with the scalar compatibility visible. -/
noncomputable def scalarStarModuleComplexEquiv (chosen : Fin 4) :
    complexModule (scalarStarModule chosen) ≃ₗ[ℂ] (Fin 2 → ℂ) where
  toFun x := x
  invFun x := x
  left_inv := fun _ => rfl
  right_inv := fun _ => rfl
  map_add' := fun _ _ => rfl
  map_smul' c x := by
    change scalarStarRepresentation chosen (algebraMap ℂ (ScalarStarAlgebra chosen) c)
        (show Fin 2 → ℂ from x) =
      (c • (show Fin 2 → ℂ from x) : Fin 2 → ℂ)
    rw [(scalarStarRepresentation chosen).commutes c]
    rfl

/-- E00,E11,E10,E01 preserve no nontrivial common subspace. -/
theorem scalarStarModule_simple (chosen : Fin 4) :
    IsSimpleModule (ScalarStarAlgebra chosen) (scalarStarModule chosen) := sorry

theorem scalarStar_hasSimpleDimension_two (chosen : Fin 4) :
    HasSimpleDimension (ScalarStarAlgebra chosen) 2 := by
  refine ⟨scalarStarModule chosen, scalarStarModule_simple chosen,
    Module.Finite.equiv (scalarStarModuleComplexEquiv chosen).symm, ?_⟩
  simpa using (scalarStarModuleComplexEquiv chosen).finrank_eq

/-- b=2a and a+b≤2 force a=b=0. No simplicity hypothesis is needed here. -/
theorem traceStar_dimension_two_center_leaf_zero (chosen : Fin 4)
    (M : ModuleCat.{0} (TraceStarAlgebra chosen))
    (hfin : Module.Finite ℂ (complexModule M))
    (hd : Module.finrank ℂ (complexModule M) = 2) :
    vertexDimension D4StarVertex (traceWeight chosen) M center = 0 ∧
      vertexDimension D4StarVertex (traceWeight chosen) M (leaf chosen) = 0 := sorry

/-- With the center zero, the vertex relations also kill the chosen leaf. Every arrow acts by
zero; a simple remaining module is supported on just one of the other three leaves and is ℂ. -/
theorem traceStar_simple_center_zero_dimension_one (chosen : Fin 4)
    (M : ModuleCat.{0} (TraceStarAlgebra chosen))
    (hfin : Module.Finite ℂ (complexModule M))
    (hs : IsSimpleModule (TraceStarAlgebra chosen) M)
    (hc : vertexDimension D4StarVertex (traceWeight chosen) M center = 0) :
    Module.finrank ℂ (complexModule M) = 1 := sorry

theorem traceStar_noSimpleDimension_two (chosen : Fin 4) :
    ¬ HasSimpleDimension (TraceStarAlgebra chosen) 2 := by
  rintro ⟨M, hs, hfin, hd⟩
  have hc := (traceStar_dimension_two_center_leaf_zero chosen M hfin hd).1
  have h1 := traceStar_simple_center_zero_dimension_one chosen M hfin hs hc
  omega

theorem scalar_trace_not_algEquiv (chosen : Fin 4) :
    ¬ Nonempty (ScalarStarAlgebra chosen ≃ₐ[ℂ] TraceStarAlgebra chosen) := by
  rintro ⟨e⟩
  exact traceStar_noSimpleDimension_two chosen
    ((hasSimpleDimension_algEquiv_iff e 2).mp (scalarStar_hasSimpleDimension_two chosen))

/-! ## The actual named Q8 central element and the positive CBH trace comparison -/

instance q8Finite : Finite (binaryDihedral 2) :=
  Nat.finite_of_card_ne_zero (by rw [card_binaryDihedral 2 (by decide)]; decide)
noncomputable instance q8Fintype : Fintype (binaryDihedral 2) := Fintype.ofFinite _

noncomputable abbrev q8Family := binaryDihedralIrreps 2
noncomputable abbrev q8Action := unitQuaternionDefiningRepresentation (binaryDihedral 2)
abbrev q8Tag : NamedAffineADE := .binaryDihedral 2 (Nat.le_refl 2)
noncomputable abbrev q8McKay := binaryDihedralMcKayD 2 (Nat.le_refl 2)

/-- Named indices0,1,2,3,4 go to star values1,2,0,3,4; named center2 is native D4 node1. -/
def q8D4Relabel : Fin q8Tag.vertexCount ≃ D4StarVertex :=
  ((Equiv.swap (0 : Fin 5) 1).trans (Equiv.swap 0 2)).trans D4StarVertex.finEquiv.symm

theorem q8D4Relabel_named_center : q8D4Relabel (2 : Fin 5) = center := by
  decide

/-- The source-facing named center2 is the actual native affine D4 center1. -/
theorem q8_named_center_native :
    q8Tag.nativeIndex (2 : Fin 5) = (1 : Fin 5) := by
  apply Fin.ext
  change ((NamedAffineADE.dihedralNativeIndex 2 (Nat.le_refl 2)) (2 : Fin 5)).val = 1
  simpa using
    (NamedAffineADE.dihedralNativeIndex_val 2 (Nat.le_refl 2) (2 : Fin 5))

theorem q8D4Relabel_graph (i j : Fin q8Tag.vertexCount) :
    q8Tag.standardGraph.Adj i j ↔
      (q8D4Relabel i = center ∧ ∃ l : Fin 4, q8D4Relabel j = leaf l) ∨
      (q8D4Relabel j = center ∧ ∃ l : Fin 4, q8D4Relabel i = leaf l) := sorry

/-- Relabel and reverse only the two old incoming edges. Old a↦new a*, old a*↦−new a
on those edges preserves aa*−a*a. The two old outgoing edges keep both arrows unchanged. -/
noncomputable def q8StarOrientationEquiv : ∀ (weight : D4StarVertex → ℂ),
    DeformedPreprojectiveAlgebra ℂ (StandardADEOrientation q8Tag)
      (fun i => weight (q8D4Relabel i)) ≃ₐ[ℂ]
      DeformedPreprojectiveAlgebra ℂ D4StarVertex weight := sorry

theorem q8StarOrientationEquiv_vertex (weight : D4StarVertex → ℂ)
    (i : Fin q8Tag.vertexCount) :
    q8StarOrientationEquiv weight
      (quotientVertex (StandardADEOrientation q8Tag) (fun j => weight (q8D4Relabel j)) i) =
        quotientVertex D4StarVertex weight (q8D4Relabel i) := sorry

/-- Pin the OLD center equivalence to actual block scalars before taking its inverse. -/
theorem centerEquivBlockScalars_apply {G : Type u} [Group G] [Finite G]
    (D : IrrepFamily ℂ G) (z : Subalgebra.center ℂ (MonoidAlgebra ℂ G)) (i : D.ι) :
    centerEquivBlockScalars D z i = cbhCentralScalar D z i := sorry

noncomputable def q8CentralBlock (chosen : Fin 4) :
    Subalgebra.center ℂ (MonoidAlgebra ℂ (binaryDihedral 2)) :=
  (centerEquivBlockScalars q8Family).symm
    (fun i => scalarWeight chosen (q8D4Relabel (q8McKay.relabel i)))

theorem q8CentralBlock_commutes (chosen : Fin 4) (a : MonoidAlgebra ℂ (binaryDihedral 2)) :
    (q8CentralBlock chosen : MonoidAlgebra ℂ (binaryDihedral 2)) * a =
      a * (q8CentralBlock chosen : MonoidAlgebra ℂ (binaryDihedral 2)) :=
  ((Subalgebra.mem_center_iff.mp (q8CentralBlock chosen).property) a).symm

theorem q8CentralBlock_scalar (chosen : Fin 4) (i : q8Family.ι) :
    cbhCentralScalar q8Family (q8CentralBlock chosen) i =
      scalarWeight chosen (q8D4Relabel (q8McKay.relabel i)) := by
  have h := congrFun ((centerEquivBlockScalars q8Family).apply_symm_apply
    (fun j => scalarWeight chosen (q8D4Relabel (q8McKay.relabel j)))) i
  simpa only [q8CentralBlock, centerEquivBlockScalars_apply] using h

theorem q8_dimensions (i : q8Family.ι) :
    q8Family.dimension i = if q8D4Relabel (q8McKay.relabel i) = center then 2 else 1 := sorry

theorem q8ScalarWeights (chosen : Fin 4) :
    (fun i : Fin q8Tag.vertexCount =>
      cbhCentralScalar q8Family (q8CentralBlock chosen) (q8McKay.relabel.symm i)) =
        fun i => scalarWeight chosen (q8D4Relabel i) := by
  funext i
  simpa using q8CentralBlock_scalar chosen (q8McKay.relabel.symm i)

theorem q8TraceWeights (chosen : Fin 4) :
    (fun i : Fin q8Tag.vertexCount =>
      cbhVertexWeight q8Family (q8CentralBlock chosen) (q8McKay.relabel.symm i)) =
        fun i => traceWeight chosen (q8D4Relabel i) := sorry

noncomputable def q8PrimitiveIdempotents :
    PrimitiveMatrixIdempotents ℂ (binaryDihedral 2) q8Family := sorry

noncomputable abbrev q8Corner (chosen : Fin 4) :=
  Corner (CBHSkewDeformation ℂ (binaryDihedral 2) (Fin 2 → ℂ) q8Action
      (standardCoordinateVector 0) (standardCoordinateVector 1) (q8CentralBlock chosen))
    (cbhBasicIdempotent ℂ (binaryDihedral 2) (Fin 2 → ℂ) q8Action
      (standardCoordinateVector 0) (standardCoordinateVector 1) (q8CentralBlock chosen)
      q8PrimitiveIdempotents)

/-- The positive TRACE-parameter CBH equivalence is the proof premise, not its scalar variant. -/
noncomputable def q8TraceCornerEquiv (chosen : Fin 4) :
    q8Corner chosen ≃ₐ[ℂ] TraceStarAlgebra chosen := by
  let e := cbhCornerEquivDeformedPreprojective q8Family q8Action q8McKay (by trivial)
    q8PrimitiveIdempotents (q8CentralBlock chosen) (q8CentralBlock_commutes chosen)
  rw [q8TraceWeights chosen] at e
  exact e.trans (q8StarOrientationEquiv (traceWeight chosen))

/-- This rules out ALL complex algebra equivalences, without a vertex-compatibility premise. -/
theorem q8Corner_scalar_no_equiv (chosen : Fin 4) :
    ¬ Nonempty (q8Corner chosen ≃ₐ[ℂ]
      DeformedPreprojectiveAlgebra ℂ (StandardADEOrientation q8Tag)
        (fun i => cbhCentralScalar q8Family (q8CentralBlock chosen) (q8McKay.relabel.symm i))) := by
  rintro ⟨e⟩
  rw [q8ScalarWeights chosen] at e
  have s := e.trans (q8StarOrientationEquiv (scalarWeight chosen))
  exact scalar_trace_not_algEquiv chosen ⟨s.symm.trans (q8TraceCornerEquiv chosen)⟩

/-- The exact old strong universal negative, now derived from the explicit Q8 witness.
The old declaration remains in Suggested; no backwards import is introduced. -/
theorem cbh_scalar_weights_strong_negative :
    ¬ ∀ (G : Type) (_ : Group G) (_ : Fintype G) (D : IrrepFamily ℂ G)
        (Vρ : Representation ℂ G (Fin 2 → ℂ)) (tag : NamedAffineADE)
        (M : NamedMcKayIdentification D (FDRep.of Vρ) tag) (_binary : tag.IsBinary)
        (E : PrimitiveMatrixIdempotents ℂ G D) (z : MonoidAlgebra ℂ G)
        (_central : ∀ a, z * a = a * z),
      Nonempty
        (Corner (CBHSkewDeformation ℂ G (Fin 2 → ℂ) Vρ
            (standardCoordinateVector 0) (standardCoordinateVector 1) z)
          (cbhBasicIdempotent ℂ G (Fin 2 → ℂ) Vρ
            (standardCoordinateVector 0) (standardCoordinateVector 1) z E) ≃ₐ[ℂ]
          DeformedPreprojectiveAlgebra ℂ (StandardADEOrientation tag)
            (fun i ↦ cbhCentralScalar D z (M.relabel.symm i)))  := by
  intro h
  apply q8Corner_scalar_no_equiv (0 : Fin 4)
  exact h (binaryDihedral 2) inferInstance inferInstance q8Family q8Action q8Tag q8McKay
    (by trivial) q8PrimitiveIdempotents (q8CentralBlock 0) (q8CentralBlock_commutes 0)

end TauCetiRoadmap.McKaySkewGroup.CBHTraceControls
