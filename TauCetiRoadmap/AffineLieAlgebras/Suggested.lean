import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import Mathlib.Algebra.Lie.Classical
import Mathlib.Topology.Algebra.Algebra.Equiv
import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.Algebra.Lie.Loop
import Mathlib.Algebra.Lie.BaseChange
import Mathlib.Algebra.Lie.Extension
import Mathlib.Algebra.Lie.Semisimple.Defs
import Mathlib.Algebra.Lie.TraceForm
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.TwoSidedIdeal.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Algebra.Vertex.HVertexOperator
import Mathlib.LinearAlgebra.SymmetricAlgebra.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.Algebra.DirectSum.Module
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.RingTheory.Flat.Basic
import Mathlib.Algebra.Vertex.VertexOperator
import Mathlib.RingTheory.Binomial
import Mathlib.Algebra.DirectSum.Decomposition
import TauCeti.LinearAlgebra.IntegralLattice.Even
import TauCeti.LinearAlgebra.IntegralLattice.Signature
import TauCeti.LinearAlgebra.IntegralLattice.PosDef.Finite
import TauCetiRoadmap.ReductiveGroups.SignedADETargets
import TauCeti.Algebra.Lie.UniversalEnveloping.Basic
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Injective
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Embedding

/-!
These are suggested forms, not an exhaustive checklist. The README is the
 definitive specification. Proof placeholders denote targets, not implemented
 mathematics. Native polynomial loops, cochains, enveloping algebras, PBW,
 left-module quotients and heterogeneous vertex operators are consumed directly.
 C7 additionally consumes the embedded integral-lattice and signed-ADE carriers,
 then states its own cocycle, Fock, field, grading, and degree-one targets.
  Full vertex laws are targets of README A6. The README's final oper
  isomorphism consumes FormalConnectionsOpers' function-algebra/DS suppliers.
  These illustrative signatures retain the native current, module, Sugawara
  and loop interfaces; that complete oper comparison is specified in the README.
-/

noncomputable section
open scoped TensorProduct DirectSum
namespace TauCetiRoadmap.AffineLieAlgebras
open CategoryTheory

universe u v

/-- Generic A5 smooth-module property: an actual left-ideal annihilator condition. -/
def genericSmoothProperty (A : Type u) [Ring A]
    (J : ℕ+ → Submodule A A) : ObjectProperty (ModuleCat.{v} A) :=
  fun M => ∀ m : M, ∃ N : ℕ+, ∀ a ∈ J N, a • m = 0

/-- Generic A5 discrete continuous action, independently of affine generators. -/
def genericContinuousProperty (A : Type u) [Ring A] [TopologicalSpace A] :
    ObjectProperty (ModuleCat.{v} A) :=
  fun M => ∀ m : M,
    letI : TopologicalSpace M := ⊥
    Continuous (fun a : A => a • m)

/-- The generic adapter requires the actual zero-neighborhood filter basis. -/
theorem genericSmooth_iff_continuous (A : Type u) [Ring A]
    [TopologicalSpace A] [IsTopologicalAddGroup A]
    (J : ℕ+ → Submodule A A)
    (hJ : (nhds (0 : A)).HasBasis (fun _ : ℕ+ => True)
      (fun N => (J N : Set A))) (M : ModuleCat.{v} A) :
    genericSmoothProperty A J M ↔ genericContinuousProperty A M := by
  sorry

/-- The continuous submodule of native coextension; its A-action is already
 (b • f)(a) = f(a*b). The module universe is closed under Hom(A,-). -/
def continuousCoinductionCarrier (A : Type u) [Ring A] [Algebra ℂ A]
    [TopologicalSpace A] [IsTopologicalRing A]
    (V : Type (max u v)) [AddCommGroup V] [Module ℂ V] :
    Submodule A ((ModuleCat.coextendScalars (algebraMap ℂ A)).obj
      (ModuleCat.of ℂ V)) := by
  letI : TopologicalSpace V := ⊥
  exact {
    carrier := {f | Continuous (fun a : A => f a)}
    zero_mem' := by sorry
    add_mem' := by sorry
    smul_mem' := by sorry }

/-- The native coextension smooth part equals the continuous submodule. -/
theorem continuousCoinductionCarrier_iff (A : Type u) [Ring A] [Algebra ℂ A]
    [TopologicalSpace A] [IsTopologicalRing A]
    (V : Type (max u v)) [AddCommGroup V] [Module ℂ V]
    (J : ℕ+ → Submodule A A)
    (hJ : (nhds (0 : A)).HasBasis (fun _ : ℕ+ => True)
      (fun N => (J N : Set A)))
    (f : (ModuleCat.coextendScalars (algebraMap ℂ A)).obj (ModuleCat.of ℂ V)) :
    f ∈ continuousCoinductionCarrier A V ↔
      ∃ N : ℕ+, ∀ b ∈ J N, b • f = 0 := by
  sorry

variable (g : Type u) [LieRing g] [LieAlgebra ℂ g]

abbrev PolynomialCurrent := LieAlgebra.loopAlgebra ℂ ℤ g
local instance : Algebra ℂ (LaurentSeries ℂ) := HahnSeries.instAlgebra

abbrev FormalCurrent := LaurentSeries ℂ ⊗[ℂ] g

/-- The native Laurent coefficient order filtration. -/
def scalarOrderSubspace (N : ℤ) : Submodule ℂ (LaurentSeries ℂ) where
  carrier := {f | ∀ n : ℤ, n < N → f.coeff n = 0}
  zero_mem' := by simp
  add_mem' := by
    intro f h hf hh n hn
    simp [hf n hn, hh n hn]
  smul_mem' := by
    intro c f hf n hn
    simp [hf n hn]

/-- The actual base-change order subspace t^N O⊗g, using native tensor maps. -/
def orderSubspace (N : ℤ) : Submodule ℂ (FormalCurrent g) :=
  LinearMap.range (LinearMap.rTensor g (scalarOrderSubspace N).subtype)

/-- The topology is uniquely pinned by the group and neighborhood-basis targets. -/
def currentTopology [Module.Finite ℂ g] : TopologicalSpace (FormalCurrent g) := by
  sorry

theorem currentTopology_addGroup [Module.Finite ℂ g] :
    letI := currentTopology g
    IsTopologicalAddGroup (FormalCurrent g) := by
  sorry

theorem currentTopology_nhds [Module.Finite ℂ g] :
    letI := currentTopology g
    (nhds (0 : FormalCurrent g)).HasBasis (fun _ : ℤ => True)
      (fun N => (orderSubspace g N : Set (FormalCurrent g))) := by
  sorry

/-- Formal monomial current. -/
def mode (x : g) (n : ℤ) : FormalCurrent g :=
  HahnSeries.single n (1 : ℂ) ⊗ₜ[ℂ] x

/-- Current base-change bracket estimates. -/
theorem bracket_order (M N : ℤ) (a b : FormalCurrent g)
    (ha : a ∈ orderSubspace g M) (hb : b ∈ orderSubspace g N) :
    ⁅a, b⁆ ∈ orderSubspace g (M + N) := by
  sorry

/-- Sign adapter: the source level form is the negative of Mathlib's form. -/
def polynomialCocycle (κ : LinearMap.BilinForm ℂ g)
    (hinv : κ.lieInvariant g) (hsymm : κ.IsSymm) :
    LieModule.Cohomology.twoCocycle ℂ (PolynomialCurrent g)
      (TrivialLieModule ℂ (PolynomialCurrent g) ℂ) :=
  LieAlgebra.LoopAlgebra.twoCocycleOfBilinear ℂ ℤ g (-κ) (by sorry) (by sorry)

/-- Formal extension of the same cocycle. -/
def formalCocycle :
    (κ : LinearMap.BilinForm ℂ g) →
    (hinv : κ.lieInvariant g) → (hsymm : κ.IsSymm) →
    LieModule.Cohomology.twoCocycle ℂ (FormalCurrent g)
      (TrivialLieModule ℂ (FormalCurrent g) ℂ) := by
  sorry

theorem formalCocycle_mode (κ : LinearMap.BilinForm ℂ g)
    (hi : κ.lieInvariant g) (hs : κ.IsSymm) (x y : g) (m n : ℤ) :
    (TrivialLieModule.equiv ℂ (FormalCurrent g) ℂ)
      ((formalCocycle g κ hi hs).val (mode g x m) (mode g y n)) =
        if m + n = 0 then (m : ℂ) * κ x y else 0 := by
  sorry

theorem formalCocycle_continuous [Module.Finite ℂ g]
    (κ : LinearMap.BilinForm ℂ g) (hi : κ.lieInvariant g) (hs : κ.IsSymm) :
    letI := currentTopology g
    letI : TopologicalSpace ℂ := ⊥
    Continuous (fun p : FormalCurrent g × FormalCurrent g =>
      (TrivialLieModule.equiv ℂ (FormalCurrent g) ℂ)
        ((formalCocycle g κ hi hs).val p.1 p.2)) := by
  sorry

/-- Continuous cocycles use the native bilinear-map carrier and CE equations.  This
local topology on ℂ is discrete; it does not mutate the usual complex topology. -/
def continuousCocycles [Module.Finite ℂ g] :
    Submodule ℂ (FormalCurrent g →ₗ[ℂ] FormalCurrent g →ₗ[ℂ]
      TrivialLieModule ℂ (FormalCurrent g) ℂ) := by
  letI : TopologicalSpace (FormalCurrent g) := currentTopology g
  letI : TopologicalSpace ℂ := ⊥
  exact {
    carrier := {c | Continuous (fun p : FormalCurrent g × FormalCurrent g =>
      (TrivialLieModule.equiv ℂ (FormalCurrent g) ℂ) (c p.1 p.2)) ∧
      (∀ a, c a a = 0) ∧
      ∀ x y z, c x ⁅y, z⁆ = c ⁅x, y⁆ z + c y ⁅x, z⁆}
    zero_mem' := by sorry
    add_mem' := by sorry
    smul_mem' := by sorry }

/-- Native cocycle adapter: the CE laws are the existing trivial-coefficient laws. -/
def toNativeCocycle [Module.Finite ℂ g] (c : continuousCocycles g) :
    LieModule.Cohomology.twoCocycle ℂ (FormalCurrent g)
      (TrivialLieModule ℂ (FormalCurrent g) ℂ) := by
  refine ⟨⟨c.val, c.property.2.1⟩, ?_⟩
  exact (LieModule.Cohomology.mem_twoCocycle_iff_of_trivial _ _ _ _).mpr c.property.2.2

/-- Continuous coboundaries use continuous 1-cochains, not arbitrary algebraic ones. -/
def continuousBoundaries [Module.Finite ℂ g] :
    Submodule ℂ (continuousCocycles g) := by
  sorry

theorem mem_continuousBoundaries [Module.Finite ℂ g]
    (c : continuousCocycles g) :
    c ∈ continuousBoundaries g ↔
      ∃ f : LieModule.Cohomology.oneCochain ℂ (FormalCurrent g)
        (TrivialLieModule ℂ (FormalCurrent g) ℂ),
        (letI : TopologicalSpace (FormalCurrent g) := currentTopology g
         letI : TopologicalSpace ℂ := ⊥
         Continuous (fun a => (TrivialLieModule.equiv ℂ (FormalCurrent g) ℂ) (f a))) ∧
          (LieModule.Cohomology.d₁₂ ℂ (FormalCurrent g)
            (TrivialLieModule ℂ (FormalCurrent g) ℂ) f).val = c.1 := by
  sorry

local instance continuousCocycleQuotient [Module.Finite ℂ g] :
    HasQuotient (continuousCocycles g) (Submodule ℂ (continuousCocycles g)) :=
  @Submodule.hasQuotient ℂ (continuousCocycles g) _ _ _

abbrev ContinuousH2 [Module.Finite ℂ g] :=
  (continuousCocycles g : Type _) ⧸ continuousBoundaries g

/-- The actual finite invariant/symmetric-form space. -/
def invariantForms : Submodule ℂ (LinearMap.BilinForm ℂ g) := by
  exact {
    carrier := {κ | κ.lieInvariant g ∧ κ.IsSymm}
    zero_mem' := by sorry
    add_mem' := by sorry
    smul_mem' := by sorry }

/-- Classification is linear, continuous and restricted to complex simple g. -/
def continuousH2Equiv [Module.Finite ℂ g] [LieAlgebra.IsSimple ℂ g] :
    invariantForms g ≃ₗ[ℂ] ContinuousH2 g := by
  sorry

/-- The specified classification map, using the actual residue cocycle. -/
def residueClass [Module.Finite ℂ g] (κ : invariantForms g) : ContinuousH2 g :=
  Submodule.Quotient.mk
    (⟨(formalCocycle g κ.val κ.property.1 κ.property.2).val.val, by sorry⟩ :
      continuousCocycles g)

theorem continuousH2Equiv_residue [Module.Finite ℂ g] [LieAlgebra.IsSimple ℂ g]
    (κ : invariantForms g) : continuousH2Equiv g κ = residueClass g κ := by
  sorry

/-- The distinguished critical sign uses the existing trace/Killing form. -/
def criticalForm : LinearMap.BilinForm ℂ g :=
  (-(1 / 2 : ℂ)) • killingForm ℂ g

variable (κ : LinearMap.BilinForm ℂ g) (hi : κ.lieInvariant g) (hs : κ.IsSymm)

/-- Consume Mathlib's actual cocycle extension, with its inherited Lie structure. -/
abbrev AtLevel := LieAlgebra.ofTwoCocycle (formalCocycle g κ hi hs)

def centralGenerator : AtLevel g κ hi hs :=
  LieAlgebra.ofProd (formalCocycle g κ hi hs)
    (0, (TrivialLieModule.equiv ℂ (FormalCurrent g) ℂ).symm 1)

/-- Mathlib's native linear section of its cocycle extension. -/
def currentLift : FormalCurrent g →ₗ[ℂ] AtLevel g κ hi hs where
  toFun a := LieAlgebra.ofProd (formalCocycle g κ hi hs) (a, 0)
  map_add' := by sorry
  map_smul' := by sorry

theorem affine_bracket (a b : FormalCurrent g) :
    ⁅currentLift g κ hi hs a, currentLift g κ hi hs b⁆ =
      currentLift g κ hi hs ⁅a, b⁆ +
        (TrivialLieModule.equiv ℂ (FormalCurrent g) ℂ)
          ((formalCocycle g κ hi hs).val a b) • centralGenerator g κ hi hs := by
  sorry

/-- Central level quotient uses the native noncommutative ring congruence. -/
def levelCongruence : RingCon (UniversalEnvelopingAlgebra ℂ (AtLevel g κ hi hs)) :=
  ringConGen (fun a b =>
    a = UniversalEnvelopingAlgebra.ι ℂ (centralGenerator g κ hi hs) ∧ b = 1)

abbrev LevelUEA := (levelCongruence g κ hi hs).Quotient
def toLevelUEA : UniversalEnvelopingAlgebra ℂ (AtLevel g κ hi hs) →ₐ[ℂ]
    LevelUEA g κ hi hs := (levelCongruence g κ hi hs).mkₐ ℂ

theorem centralRelation :
    toLevelUEA g κ hi hs
      (UniversalEnvelopingAlgebra.ι ℂ (centralGenerator g κ hi hs)) = 1 := by
  sorry

def currentGenerator : FormalCurrent g →ₗ[ℂ] LevelUEA g κ hi hs := by
  letI : LieRing (UniversalEnvelopingAlgebra ℂ (AtLevel g κ hi hs)) := LieRing.ofAssociativeRing
  exact (toLevelUEA g κ hi hs).toLinearMap.comp
    ((UniversalEnvelopingAlgebra.ι ℂ (L := AtLevel g κ hi hs)).toLinearMap.comp (currentLift g κ hi hs))

/-- Left ideal as a native submodule of the left regular module. -/
def leftNeighborhood (N : ℕ+) :
    Submodule (LevelUEA g κ hi hs) (LevelUEA g κ hi hs) :=
  Submodule.span (LevelUEA g κ hi hs)
    (currentGenerator g κ hi hs '' (orderSubspace g (N : ℕ) : Set (FormalCurrent g)))

abbrev QuotientModule (N : ℕ+) :=
  LevelUEA g κ hi hs ⧸ leftNeighborhood g κ hi hs N

theorem leftNeighborhood_antitone : Antitone (leftNeighborhood g κ hi hs) := by
  sorry

def quotientTransition (M N : ℕ+) (h : N ≤ M) :
    QuotientModule g κ hi hs M →ₗ[LevelUEA g κ hi hs] QuotientModule g κ hi hs N :=
  (leftNeighborhood g κ hi hs M).mapQ (leftNeighborhood g κ hi hs N) (LinearMap.id)
    (by simpa using leftNeighborhood_antitone g κ hi hs h)

/-- Compatible families form a native submodule, hence addition/scalars are coordinatewise. -/
def compatibleFamilies : Submodule ℂ (∀ N : ℕ+, QuotientModule g κ hi hs N) where
  carrier := {a | ∀ (M N : ℕ+) (h : N ≤ M), quotientTransition g κ hi hs M N h (a M) = a N}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

abbrev CompletedUEA := compatibleFamilies g κ hi hs

def completedProjection (N : ℕ+) : CompletedUEA g κ hi hs → QuotientModule g κ hi hs N :=
  fun a => a.1 N

/-- Canonical dense map with its actual coordinate values. -/
def toCompletedLinear : LevelUEA g κ hi hs →ₗ[ℂ] CompletedUEA g κ hi hs where
  toFun u := ⟨fun _ => Submodule.Quotient.mk u, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

theorem completedProjection_toCompletedLinear (u : LevelUEA g κ hi hs) (N : ℕ+) :
    completedProjection g κ hi hs N (toCompletedLinear g κ hi hs u) =
      (Submodule.Quotient.mk u : QuotientModule g κ hi hs N) := rfl

/-- This estimate supplies smoothness of every quotient module. -/
theorem right_shift (b : LevelUEA g κ hi hs) (N : ℕ+) :
    ∃ M : ℕ+, ∀ a ∈ leftNeighborhood g κ hi hs M,
      a * b ∈ leftNeighborhood g κ hi hs N := by
  sorry

/-- The product topology has discrete MODULE quotients as coordinates. -/
def completionTopology : TopologicalSpace (CompletedUEA g κ hi hs) := by
  letI (N : ℕ+) : TopologicalSpace (QuotientModule g κ hi hs N) := ⊥
  exact TopologicalSpace.induced Subtype.val inferInstance

theorem toCompletedLinear_dense :
    letI := completionTopology g κ hi hs
    DenseRange (toCompletedLinear g κ hi hs) := by
  sorry

/-- Extension of the left action on Q_N, built before the multiplication on the limit. -/
def quotientAction (N : ℕ+) :
    CompletedUEA g κ hi hs →ₗ[ℂ] Module.End ℂ (QuotientModule g κ hi hs N) := by
  sorry

theorem quotientAction_canonical (N : ℕ+) (u : LevelUEA g κ hi hs)
    (v : QuotientModule g κ hi hs N) :
    quotientAction g κ hi hs N (toCompletedLinear g κ hi hs u) v = u • v := by
  sorry

theorem quotientAction_pointwiseContinuous (N : ℕ+) (v : QuotientModule g κ hi hs N) :
    letI := completionTopology g κ hi hs
    letI : TopologicalSpace (QuotientModule g κ hi hs N) := ⊥
    Continuous (fun a => quotientAction g κ hi hs N a v) := by
  sorry

/-- Multiplication is constrained by the extended quotient-module action. -/
def completedMul : CompletedUEA g κ hi hs → CompletedUEA g κ hi hs →
    CompletedUEA g κ hi hs := by
  sorry

theorem completedMul_projection (a b : CompletedUEA g κ hi hs) (N : ℕ+) :
    completedProjection g κ hi hs N (completedMul g κ hi hs a b) =
      quotientAction g κ hi hs N a (completedProjection g κ hi hs N b) := by
  sorry

def completedOne : CompletedUEA g κ hi hs := toCompletedLinear g κ hi hs 1

/-- The additive structure is the native submodule structure; only new ring laws are targets. -/
instance completedRing : Ring (CompletedUEA g κ hi hs) :=
  { (compatibleFamilies g κ hi hs).addCommGroup with
    one := completedOne g κ hi hs
    mul := completedMul g κ hi hs
    natCast := fun n => n • completedOne g κ hi hs
    intCast := fun n => n • completedOne g κ hi hs
    natCast_zero := by sorry
    natCast_succ := by sorry
    intCast_ofNat := by sorry
    intCast_negSucc := by sorry
    mul_assoc := by sorry
    one_mul := by sorry
    mul_one := by sorry
    zero_mul := by sorry
    mul_zero := by sorry
    left_distrib := by sorry
    right_distrib := by sorry }

/-- Algebra.ofModule preserves the native coordinatewise scalar action. -/
instance completedAlgebra : Algebra ℂ (CompletedUEA g κ hi hs) :=
  Algebra.ofModule (by sorry) (by sorry)

/-- The algebra map has the specified underlying canonical compatible family. -/
def toCompleted : LevelUEA g κ hi hs →ₐ[ℂ] CompletedUEA g κ hi hs := by
  sorry

theorem toCompleted_apply (u : LevelUEA g κ hi hs) :
    toCompleted g κ hi hs u = toCompletedLinear g κ hi hs u := by
  sorry

theorem completedProjection_toCompleted (u : LevelUEA g κ hi hs) (N : ℕ+) :
    completedProjection g κ hi hs N (toCompleted g κ hi hs u) =
      (Submodule.Quotient.mk u : QuotientModule g κ hi hs N) := by
  rw [toCompleted_apply]
  rfl

theorem completed_mul_def (a b : CompletedUEA g κ hi hs) :
    a * b = completedMul g κ hi hs a b := rfl

theorem completedMul_continuous :
    letI := completionTopology g κ hi hs
    Continuous (fun p : CompletedUEA g κ hi hs × CompletedUEA g κ hi hs => p.1 * p.2) := by
  sorry

/-- Completed left neighborhoods are the actual coordinate kernels. -/
def completedNeighborhood (N : ℕ+) :
    Submodule (CompletedUEA g κ hi hs) (CompletedUEA g κ hi hs) where
  carrier := {a | completedProjection g κ hi hs N a = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

theorem completionTopology_addGroup :
    letI := completionTopology g κ hi hs
    IsTopologicalAddGroup (CompletedUEA g κ hi hs) := by
  sorry

theorem completionTopology_nhds :
    letI := completionTopology g κ hi hs
    (nhds (0 : CompletedUEA g κ hi hs)).HasBasis (fun _ : ℕ+ => True)
      (fun N => (completedNeighborhood g κ hi hs N : Set (CompletedUEA g κ hi hs))) := by
  sorry

/-- The smoothness predicate retains the vector-dependent order. -/
def IsSmooth (V : Type v) [AddCommGroup V] [Module ℂ V]
    [LieRingModule (AtLevel g κ hi hs) V] [LieModule ℂ (AtLevel g κ hi hs) V] : Prop :=
  ∀ v : V, ∃ N : ℕ+, ∀ a ∈ orderSubspace g (N : ℕ),
    ⁅currentLift g κ hi hs a, v⁆ = 0

def HasLevelOne (V : Type v) [AddCommGroup V] [Module ℂ V]
    [LieRingModule (AtLevel g κ hi hs) V] : Prop :=
  ∀ v : V, ⁅centralGenerator g κ hi hs, v⁆ = v

/-- The module extension is an actual algebra representation on the native End carrier. -/
def extendSmoothAction (V : Type v) [AddCommGroup V] [Module ℂ V] :
    (action : LieRingModule (AtLevel g κ hi hs) V) →
    letI : LieRingModule (AtLevel g κ hi hs) V := action
    (compatibility : LieModule ℂ (AtLevel g κ hi hs) V) →
    letI : LieModule ℂ (AtLevel g κ hi hs) V := compatibility
    (hV : IsSmooth g κ hi hs V) → (hK : HasLevelOne g κ hi hs V) →
    CompletedUEA g κ hi hs →ₐ[ℂ] Module.End ℂ V := by
  sorry

theorem extendedAction_pointwiseContinuous (V : Type v) [AddCommGroup V] [Module ℂ V]
    [action : LieRingModule (AtLevel g κ hi hs) V]
    [compatibility : LieModule ℂ (AtLevel g κ hi hs) V]
    (hV : IsSmooth g κ hi hs V) (hK : HasLevelOne g κ hi hs V) (v : V) :
    letI := completionTopology g κ hi hs
    letI : TopologicalSpace V := ⊥
    Continuous (fun a => extendSmoothAction g κ hi hs V action compatibility hV hK a v) := by
  sorry

theorem extendedAction_generator (V : Type v) [AddCommGroup V] [Module ℂ V]
    [action : LieRingModule (AtLevel g κ hi hs) V]
    [compatibility : LieModule ℂ (AtLevel g κ hi hs) V]
    (hV : IsSmooth g κ hi hs V) (hK : HasLevelOne g κ hi hs V)
    (a : FormalCurrent g) (v : V) :
    extendSmoothAction g κ hi hs V action compatibility hV hK
      (toCompleted g κ hi hs (currentGenerator g κ hi hs a)) v =
        ⁅currentLift g κ hi hs a, v⁆ := by
  sorry

/-- The nonspecialized completed center theorem includes every noncritical form. -/
theorem noncritical_center [Module.Finite ℂ g] [LieAlgebra.IsSimple ℂ g]
    (hk : κ ≠ criticalForm g) (z : CompletedUEA g κ hi hs) :
    z ∈ Subalgebra.center ℂ (CompletedUEA g κ hi hs) ↔
      ∃ a : ℂ, z = algebraMap ℂ (CompletedUEA g κ hi hs) a := by
  sorry

/-- A3/A5 category exports use existing module categories and full subcategories. -/
def smoothModuleProperty :
    ObjectProperty (ModuleCat.{max u v} (LevelUEA g κ hi hs)) :=
  genericSmoothProperty (LevelUEA g κ hi hs) (leftNeighborhood g κ hi hs)

theorem smoothModuleProperty_generators (M : ModuleCat.{max u v} (LevelUEA g κ hi hs)) :
    smoothModuleProperty g κ hi hs M ↔
      ∀ v : M, ∃ N : ℕ+, ∀ a ∈ orderSubspace g (N : ℕ),
        currentGenerator g κ hi hs a • v = 0 := by
  sorry

abbrev SmoothModuleCategory := (smoothModuleProperty.{u, v} g κ hi hs).FullSubcategory

def continuousModuleProperty :
    ObjectProperty (ModuleCat.{max u v} (CompletedUEA g κ hi hs)) :=
  letI := completionTopology g κ hi hs
  genericContinuousProperty (CompletedUEA g κ hi hs)

abbrev ContinuousModuleCategory := (continuousModuleProperty.{u, v} g κ hi hs).FullSubcategory

def smoothCompletedEquivalence :
    SmoothModuleCategory.{u, v} g κ hi hs ≌ ContinuousModuleCategory.{u, v} g κ hi hs := by
  sorry

/-- The inverse comparison is the native restriction-of-scalars functor. -/
def completedRestriction : ContinuousModuleCategory.{u, v} g κ hi hs ⥤
    ModuleCat.{max u v} (LevelUEA g κ hi hs) :=
  (continuousModuleProperty.{u, v} g κ hi hs).ι ⋙
    ModuleCat.restrictScalars (toCompleted g κ hi hs).toRingHom

theorem smoothCompletedEquivalence_inverse :
    (smoothCompletedEquivalence.{u, v} g κ hi hs).inverse ⋙
      (smoothModuleProperty.{u, v} g κ hi hs).ι =
        completedRestriction.{u, v} g κ hi hs := by
  sorry

/-- Central characters are actual scalar-action equations on the continuous category. -/
def centralCharacterProperty
    (χ : Subalgebra.center ℂ (CompletedUEA g κ hi hs) →ₐ[ℂ] ℂ) :
    CategoryTheory.ObjectProperty (ContinuousModuleCategory.{u, v} g κ hi hs) :=
  fun M => ∀ z : Subalgebra.center ℂ (CompletedUEA g κ hi hs), ∀ v : M.obj,
    (z : CompletedUEA g κ hi hs) • v =
      algebraMap ℂ (CompletedUEA g κ hi hs) (χ z) • v

abbrev CentralCharacterCategory
    (χ : Subalgebra.center ℂ (CompletedUEA g κ hi hs) →ₐ[ℂ] ℂ) :=
  (centralCharacterProperty.{u, v} g κ hi hs χ).FullSubcategory

/-- Native operator carrier used by the vacuum reconstruction targets. -/
def currentField (V : Type v) [AddCommGroup V] [Module ℂ V] :
    (action : LieRingModule (AtLevel g κ hi hs) V) →
    letI : LieRingModule (AtLevel g κ hi hs) V := action
    (compatibility : LieModule ℂ (AtLevel g κ hi hs) V) →
    letI : LieModule ℂ (AtLevel g κ hi hs) V := compatibility
    (hV : IsSmooth g κ hi hs V) → (x : g) → HVertexOperator ℤ ℂ V V := by
  sorry

theorem currentField_coefficient (V : Type v) [AddCommGroup V] [Module ℂ V]
    [action : LieRingModule (AtLevel g κ hi hs) V]
    [compatibility : LieModule ℂ (AtLevel g κ hi hs) V]
    (hV : IsSmooth g κ hi hs V) (x : g) (n : ℤ) (v : V) :
    HVertexOperator.coeff (currentField g κ hi hs V action compatibility hV x) (-n - 1) v =
      ⁅currentLift g κ hi hs (mode g x n), v⁆ := by
  sorry

/-- Independent PBW foundation is consumed directly, not restated as a private map. -/
example : Function.Injective (UniversalEnvelopingAlgebra.ι ℂ : g →
    UniversalEnvelopingAlgebra ℂ g) :=
  TauCeti.UniversalEnvelopingAlgebra.ι_injective ℂ g

namespace RankOne

abbrev Sl2 := LieAlgebra.SpecialLinear.sl (Fin 2) ℂ
abbrev OriginalSL2Loops := Matrix.SpecialLinearGroup (Fin 2) (LaurentSeries ℂ)

abbrev OriginalSL2HopfLoops := TauCeti.HopfAlgebra.points
  (H := TauCeti.SpecialLinear.coordinateHopfAlgebra ℂ 2)
  (CommAlgCat.of ℂ (LaurentSeries ℂ))

/-- The existing point dictionary identifies F3's carrier with the matrix loop group. -/
def originalLoopsEquiv : OriginalSL2HopfLoops ≃* OriginalSL2Loops := by
  -- Normalize the coefficient-algebra scalar-tower instance, then use
  -- TauCeti.SpecialLinear.pointsMulEquiv on the identical Laurent carrier.
  sorry

/-- Pin the dictionary entrywise on the native localized generic matrix. -/
theorem originalLoopsEquiv_entry (g : OriginalSL2HopfLoops) (i j : Fin 2) :
    (originalLoopsEquiv g : Matrix (Fin 2) (Fin 2) (LaurentSeries ℂ)) i j =
      g.ofConv ((TauCeti.SpecialLinear.coordinateMap ℂ 2).hom
        (TauCeti.GeneralLinear.genericMatrix ℂ 2 i j)) := by sorry

theorem criticalInvariant : (criticalForm Sl2).lieInvariant Sl2 := by sorry
theorem criticalSymm : (criticalForm Sl2).IsSymm := by sorry

abbrev CriticalAlgebra := CompletedUEA Sl2 (criticalForm Sl2) criticalInvariant criticalSymm
abbrev CriticalCenter := Subalgebra.center ℂ CriticalAlgebra

def e : Sl2 := LieAlgebra.SpecialLinear.single (0 : Fin 2) 1 (by decide) 1
def f : Sl2 := LieAlgebra.SpecialLinear.single (1 : Fin 2) 0 (by decide) 1
def h : Sl2 := LieAlgebra.SpecialLinear.singleSubSingle (0 : Fin 2) 1 1

def completedCurrent (x : Sl2) (m : ℤ) : CriticalAlgebra :=
  toCompleted Sl2 (criticalForm Sl2) criticalInvariant criticalSymm
    (currentGenerator Sl2 (criticalForm Sl2) criticalInvariant criticalSymm (mode Sl2 x m))

def normalOrderedPair (x y : Sl2) (m n : ℤ) : CriticalAlgebra :=
  if m < 0 then completedCurrent x m * completedCurrent y n
    else completedCurrent y n * completedCurrent x m

def sugawaraPartial (n : ℤ) (M : ℕ) : CriticalAlgebra :=
  ∑ m ∈ Finset.Icc (-(M : ℤ)) (M : ℤ),
    ((1 / 2 : ℂ) • (normalOrderedPair e f m (n-m) + normalOrderedPair f e m (n-m)) +
      (1 / 4 : ℂ) • normalOrderedPair h h m (n-m))

def sugawaraMode : (n : ℤ) → CriticalCenter := by sorry

theorem sugawaraMode_projection (n : ℤ) (N : ℕ+) :
    ∃ M₀ : ℕ, ∀ M ≥ M₀,
      completedProjection Sl2 (criticalForm Sl2) criticalInvariant criticalSymm N
        (sugawaraPartial n M) =
      completedProjection Sl2 (criticalForm Sl2) criticalInvariant criticalSymm N
        (sugawaraMode n) := by sorry

def formalCurrentMatrix : FormalCurrent Sl2 →ₗ[ℂ]
    Matrix (Fin 2) (Fin 2) (LaurentSeries ℂ) := by sorry

theorem formalCurrentMatrix_tmul (z : LaurentSeries ℂ) (x : Sl2) :
    formalCurrentMatrix (z ⊗ₜ[ℂ] x) =
      fun i j => z * HahnSeries.C (x.val i j) := by sorry

theorem formalCurrentMatrix_injective : Function.Injective formalCurrentMatrix := by sorry

def currentAdjoint : (g : OriginalSL2Loops) → FormalCurrent Sl2 →ₗ[ℂ] FormalCurrent Sl2 := by sorry

theorem currentAdjoint_matrix (g : OriginalSL2Loops) (A : FormalCurrent Sl2) :
    formalCurrentMatrix (currentAdjoint g A) =
      (g : Matrix (Fin 2) (Fin 2) (LaurentSeries ℂ)) * formalCurrentMatrix A *
        (g⁻¹ : Matrix (Fin 2) (Fin 2) (LaurentSeries ℂ)) := by sorry

/-- κc=-2 trace fixes the Maurer–Cartan scalar in the A2 affine lift. -/
def affineCentralCorrection (g : OriginalSL2Loops) (A : FormalCurrent Sl2) : ℂ :=
  -2 * (Matrix.trace
    ((g⁻¹ : Matrix (Fin 2) (Fin 2) (LaurentSeries ℂ)) *
      (Matrix.of (fun i j => LaurentSeries.derivative ℂ
        ((g : Matrix (Fin 2) (Fin 2) (LaurentSeries ℂ)) i j)) :
          Matrix (Fin 2) (Fin 2) (LaurentSeries ℂ)) * formalCurrentMatrix A)).coeff (-1)

def loopAutomorphism : OriginalSL2Loops →* (CriticalAlgebra ≃ₐ[ℂ] CriticalAlgebra) := by sorry

theorem loopAutomorphism_generator (g : OriginalSL2Loops) (A : FormalCurrent Sl2) :
    loopAutomorphism g
      (toCompleted Sl2 (criticalForm Sl2) criticalInvariant criticalSymm
        (currentGenerator Sl2 (criticalForm Sl2) criticalInvariant criticalSymm A)) =
    toCompleted Sl2 (criticalForm Sl2) criticalInvariant criticalSymm
      (currentGenerator Sl2 (criticalForm Sl2) criticalInvariant criticalSymm (currentAdjoint g A)) +
        algebraMap ℂ CriticalAlgebra (affineCentralCorrection g A) := by sorry

def continuousLoopAutomorphism (g : OriginalSL2Loops) :
    letI := completionTopology Sl2 (criticalForm Sl2) criticalInvariant criticalSymm
    CriticalAlgebra ≃A[ℂ] CriticalAlgebra := by
  letI := completionTopology Sl2 (criticalForm Sl2) criticalInvariant criticalSymm
  exact { loopAutomorphism g with
    continuous_toFun := by sorry
    continuous_invFun := by sorry }

theorem loopAutomorphism_center (g : OriginalSL2Loops) (z : CriticalCenter) :
    loopAutomorphism g (z : CriticalAlgebra) = z := by sorry

end RankOne


/-! ## C7. Lattice vertex algebras and the ADE degree-one comparison -/

namespace VertexFoundations

/-- Operator covariance is an equation on the actual coefficient endomorphisms.
It is independent of the state-derivative equation Y(Ta)=∂Y(a). -/
def FieldTranslationCovariant {V : Type u} [AddCommGroup V] [Module ℂ V]
    (T : Module.End ℂ V) (A : HVertexOperator ℤ ℂ V V) : Prop :=
  ∀ n : ℤ,
    T * HVertexOperator.coeff A (-n - 1) - HVertexOperator.coeff A (-n - 1) * T =
      -(n : ℂ) • HVertexOperator.coeff A (-(n - 1) - 1)

/-- Covariant fields form a linear subspace; a spanning family of covariant
states therefore suffices. This lemma assumes no vertex-algebra axioms. -/
theorem fieldTranslationCovariant_of_span_top {V : Type u}
    [AddCommGroup V] [Module ℂ V] (T : Module.End ℂ V)
    (Y : V →ₗ[ℂ] HVertexOperator ℤ ℂ V V) (S : Set V)
    (hspan : Submodule.span ℂ S = ⊤)
    (hS : ∀ a ∈ S, FieldTranslationCovariant T (Y a)) :
    ∀ a, FieldTranslationCovariant T (Y a) := by
  sorry


/-- Generic formal vertex-algebra data on the native heterogeneous Hahn
field carrier. This foundation has no ADE or affine-vacuum input. -/
structure FormalVertexAxioms (V : Type u) [AddCommGroup V] [Module ℂ V] where
  field : V →ₗ[ℂ] HVertexOperator ℤ ℂ V V
  vacuum : V
  translation : V →ₗ[ℂ] V
  translation_vacuum : translation vacuum = 0
  vacuum_coeff : ∀ a n,
    HVertexOperator.coeff (field vacuum) (-n - 1) a =
      (if n = -1 then a else 0)
  creation : ∀ a (n : ℕ),
    HVertexOperator.coeff (field a) (n : ℤ) vacuum =
      (Nat.factorial n : ℂ)⁻¹ • ((translation ^ n) a)
  creation_no_poles : ∀ a (n : ℕ),
    HVertexOperator.coeff (field a) (-(n : ℤ) - 1) vacuum = 0
  translation_coeff : ∀ a n,
    HVertexOperator.coeff (field (translation a)) (-n - 1) =
      -(n : ℂ) • HVertexOperator.coeff (field a) (-n)
  /-- The operator law is a separate axiom, not inferred from state derivative. -/
  operator_translation_coeff : ∀ a n,
    translation * HVertexOperator.coeff (field a) (-n - 1) -
        HVertexOperator.coeff (field a) (-n - 1) * translation =
      -(n : ℂ) • HVertexOperator.coeff (field a) (-(n - 1) - 1)
  truncation : ∀ a b, ∃ N : ℤ, ∀ n, N ≤ n →
    HVertexOperator.coeff (field a) (-n - 1) b = 0
  locality : ∀ a b, ∃ N : ℕ, ∀ m n c,
    ∑ i ∈ Finset.range (N + 1),
      (((-1 : ℂ) ^ i) * (Nat.choose N i : ℂ)) •
        (HVertexOperator.coeff (field a) (-(m + N - (i : ℤ)) - 1)
          (HVertexOperator.coeff (field b) (-(n + (i : ℤ)) - 1) c) -
         HVertexOperator.coeff (field b) (-(n + (i : ℤ)) - 1)
          (HVertexOperator.coeff (field a) (-(m + N - (i : ℤ)) - 1) c)) = 0

def formalMode {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : FormalVertexAxioms V) (a : V) (n : ℤ) : Module.End ℂ V :=
  HVertexOperator.coeff (A.field a) (-n - 1)

/-- Operator covariance projects the genuine independent axiom.
Multiplication is native composition; no implication from weaker laws is asserted. -/
theorem formalVertex_translation_covariance {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : FormalVertexAxioms V) (a : V) (n : ℤ) :
    A.translation * formalMode A a n - formalMode A a n * A.translation =
      -(n : ℂ) • formalMode A a (n - 1) := by
  exact A.operator_translation_coeff a n

/-- The generic coefficient form of Borcherds' identity, with all states and
integer mode indices retained. -/
theorem formalVertex_borcherds {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : FormalVertexAxioms V) (a b c : V) (m n r : ℤ) :
    ∃ N : ℕ,
      (∀ i, N ≤ i → formalMode A (formalMode A a (n + i) b) (m + r - i) c = 0) ∧
      (∀ i, N ≤ i →
        formalMode A a (m + n - i) (formalMode A b (r + i) c) = 0 ∧
        formalMode A b (n + r - i) (formalMode A a (m + i) c) = 0) ∧
      (∑ i ∈ Finset.range N,
        ((Ring.choose m i : ℤ) : ℂ) •
          formalMode A (formalMode A a (n + i) b) (m + r - i) c) =
      ∑ i ∈ Finset.range N,
        (((-1 : ℂ) ^ i) * (((Ring.choose n i : ℤ) : ℂ)) ) •
          (formalMode A a (m + n - i) (formalMode A b (r + i) c) -
            (-1 : ℂ) ^ n •
              formalMode A b (n + r - i) (formalMode A a (m + i) c)) := by
  sorry

/-- A grading records the actual degree-zero vacuum and the mode-degree rule.
The integer coefficient index is normalized by Y(a,z)=Σ a_(n)z^(-n-1). -/
structure GradedFormalVertexAxioms (V : Type u) [AddCommGroup V] [Module ℂ V]
    extends FormalVertexAxioms V where
  weightSpace : ℕ → Submodule ℂ V
  /-- The grading is an actual algebraic direct sum, not just a collection of
  subspaces with negative-degree vanishing. -/
  isInternal : DirectSum.IsInternal weightSpace
  vacuum_weight_zero : weightSpace 0 = ℂ ∙ vacuum
  mode_degree : ∀ (p q : ℕ) (n : ℤ),
    n + 1 ≤ (p + q : ℤ) →
      ∀ a ∈ weightSpace p, ∀ b ∈ weightSpace q,
        HVertexOperator.coeff (field (a : V)) (-n - 1) b ∈
          weightSpace (Int.toNat ((p + q : ℤ) - (n + 1)))
  negative_weight_mode_vanishes : ∀ (p q : ℕ) (n : ℤ),
    (p + q : ℤ) < n + 1 →
      ∀ a ∈ weightSpace p, ∀ b ∈ weightSpace q,
        HVertexOperator.coeff (field (a : V)) (-n - 1) b = 0

namespace GradedFormalVertexAxioms

/-- The inverse is the actual sum of the component inclusions. -/
noncomputable def gradedDecomposition {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) : V ≃ₗ[ℂ] (⨁ n : ℕ, A.weightSpace n) :=
  (LinearEquiv.ofBijective (DirectSum.coeLinearMap A.weightSpace) A.isInternal).symm

@[simp] theorem gradedDecomposition_symm_of {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (n : ℕ)
    (x : A.weightSpace n) :
    A.gradedDecomposition.symm (DirectSum.of _ n x) = (x : V) := by
  change DirectSum.coeLinearMap A.weightSpace (DirectSum.of _ n x) = (x : V)
  simp

@[simp] theorem gradedDecomposition_apply_mem {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) {n : ℕ} {x : V}
    (hx : x ∈ A.weightSpace n) :
    A.gradedDecomposition x = DirectSum.of _ n ⟨x, hx⟩ := by
  let e := LinearEquiv.ofBijective (DirectSum.coeLinearMap A.weightSpace) A.isInternal
  apply e.injective
  change e (e.symm x) = e (DirectSum.of _ n ⟨x, hx⟩)
  rw [LinearEquiv.apply_symm_apply]
  change x = DirectSum.coeLinearMap A.weightSpace (DirectSum.of _ n ⟨x, hx⟩)
  simp

theorem gradedDecomposition_symm_eq_inclusion {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) :
    A.gradedDecomposition.symm.toLinearMap = DirectSum.coeLinearMap A.weightSpace := rfl

theorem weightSpace_spans {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) : iSup A.weightSpace = ⊤ :=
  DirectSum.IsInternal.submodule_iSup_eq_top A.isInternal

theorem weightSpace_independent {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) : iSupIndep A.weightSpace :=
  DirectSum.IsInternal.submodule_iSupIndep A.isInternal

end GradedFormalVertexAxioms

/-- Closure uses the actual degree rule on the actual field coefficient. -/
theorem weightOneZeroProduct_mem {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) (x y : A.weightSpace 1) :
    HVertexOperator.coeff (A.field (x : V)) (-1) (y : V) ∈ A.weightSpace 1 := by
  have h := A.mode_degree 1 1 (0 : ℤ) (by norm_num)
    (x : V) x.property (y : V) y.property
  simpa using h

/-- This bilinear operation is defined from A.field, not an admitted fixed value. -/
noncomputable def weightOneZeroProduct {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) :
    A.weightSpace 1 →ₗ[ℂ] A.weightSpace 1 →ₗ[ℂ] A.weightSpace 1 where
  toFun x :=
    { toFun := fun y => ⟨HVertexOperator.coeff (A.field (x : V)) (-1) (y : V),
        weightOneZeroProduct_mem A x y⟩
      map_add' := by intro y z; apply Subtype.ext; simp
      map_smul' := by intro c y; apply Subtype.ext; simp }
  map_add' := by
    intro x y
    apply LinearMap.ext
    intro z
    apply Subtype.ext
    simp
  map_smul' := by
    intro c x
    apply LinearMap.ext
    intro y
    apply Subtype.ext
    simp

theorem weightOneZeroProduct_apply {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V)
    (x y : A.weightSpace 1) :
    (weightOneZeroProduct A x y : V) =
      HVertexOperator.coeff (A.field (x : V)) (-1) (y : V) := rfl

theorem weightOneZeroProduct_is_actual_zero_mode {V : Type u}
    [AddCommGroup V] [Module ℂ V] (A : GradedFormalVertexAxioms V)
    (x y : A.weightSpace 1) :
    (weightOneZeroProduct A x y : V) = formalMode A.toFormalVertexAxioms x 0 y := rfl

/-- Genuine vertex-theoretic obligations in the original submodule addition. -/
theorem weightOneZeroProduct_alternating {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (x : A.weightSpace 1) :
    weightOneZeroProduct A x x = 0 := by
  sorry

theorem weightOneZeroProduct_skew {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (x y : A.weightSpace 1) :
    weightOneZeroProduct A x y + weightOneZeroProduct A y x = 0 := by
  have h := weightOneZeroProduct_alternating A (x + y)
  simpa only [map_add, LinearMap.add_apply, weightOneZeroProduct_alternating,
    zero_add, add_zero, add_comm] using h

theorem weightOneZeroProduct_leibniz {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (x y z : A.weightSpace 1) :
    weightOneZeroProduct A x (weightOneZeroProduct A y z) =
      weightOneZeroProduct A (weightOneZeroProduct A x y) z +
        weightOneZeroProduct A y (weightOneZeroProduct A x z) := by
  sorry

/-- The literal record extends the OLD submodule additive group. -/
@[instance_reducible]
noncomputable def weightOneLieRing {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) : LieRing (A.weightSpace 1) :=
  { (inferInstance : AddCommGroup (A.weightSpace 1)) with
    bracket := fun x y => weightOneZeroProduct A x y
    add_lie := by
      intro x y z
      exact congrArg (fun f : A.weightSpace 1 →ₗ[ℂ] A.weightSpace 1 => f z)
        ((weightOneZeroProduct A).map_add x y)
    lie_add := fun x y z => (weightOneZeroProduct A x).map_add y z
    lie_self := weightOneZeroProduct_alternating A
    leibniz_lie := weightOneZeroProduct_leibniz A }

theorem weightOneLieRing_parent {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) :
    (weightOneLieRing A).toAddCommGroup =
      (inferInstance : AddCommGroup (A.weightSpace 1)) := rfl

/-- Capture the old module before installing the compatible Lie ring. -/
@[instance_reducible]
noncomputable def weightOneLieAlgebra {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) :
    @LieAlgebra ℂ (A.weightSpace 1) _ (weightOneLieRing A) := by
  let oldModule : Module ℂ (A.weightSpace 1) := inferInstance
  letI : LieRing (A.weightSpace 1) := weightOneLieRing A
  exact { oldModule with
    lie_smul := fun c x y => (weightOneZeroProduct A x).map_smul c y }

theorem weightOneLieAlgebra_parent {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) :
    (weightOneLieAlgebra A).toModule =
      (inferInstance : Module ℂ (A.weightSpace 1)) := rfl

/-- The old existence endpoint now has the specified coherent witness. -/
theorem weightOneZeroProduct_isLie {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) :
    ∃ inst : LieRing (A.weightSpace 1),
      (letI : LieRing (A.weightSpace 1) := inst
       ∀ x y, ⁅x, y⁆ = weightOneZeroProduct A x y) := by
  refine ⟨weightOneLieRing A, ?_⟩
  intro x y
  rfl

theorem weightOneZeroProduct_jacobi {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (x y z : A.weightSpace 1) :
    weightOneZeroProduct A x (weightOneZeroProduct A y z) +
      weightOneZeroProduct A y (weightOneZeroProduct A z x) +
        weightOneZeroProduct A z (weightOneZeroProduct A x y) = 0 := by
  letI := weightOneLieRing A
  exact lie_jacobi x y z

/-- The loop-mode carrier is the actual finitely supported abelian loop space
plus its one-dimensional central coordinate. -/
abbrev AbelianHeisenbergCarrier (H : Type u) [Zero H] := (ℤ →₀ H) × ℂ

def abelianHeisenbergLoopMode {H : Type u} [AddCommGroup H]
    (n : ℤ) (h : H) : AbelianHeisenbergCarrier H := (Finsupp.single n h, 0)

def abelianHeisenbergCentral {H : Type u} [Zero H] (c : ℂ) :
    AbelianHeisenbergCarrier H := (0, c)

/-- The standard finite-sum cocycle on loop modes. The coefficient at mode `m`
is `m B(x_m,y_{-m})`; finite support makes the sum finite. -/
def abelianHeisenbergBracket {H : Type u} [AddCommGroup H] [Module ℂ H]
    (B : LinearMap.BilinForm ℂ H) (x y : AbelianHeisenbergCarrier H) :
    AbelianHeisenbergCarrier H :=
  (0, x.1.sum fun m h => (m : ℂ) * B h (y.1 (-m)))

theorem abelianHeisenbergBracket_skew {H : Type u} [AddCommGroup H]
    [Module ℂ H] (B : LinearMap.BilinForm ℂ H) (hB : B.IsSymm)
    (x y : AbelianHeisenbergCarrier H) :
    abelianHeisenbergBracket B x y + abelianHeisenbergBracket B y x = 0 := by
  sorry

theorem abelianHeisenbergBracket_jacobi {H : Type u} [AddCommGroup H]
    [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (x y z : AbelianHeisenbergCarrier H) :
    abelianHeisenbergBracket B x (abelianHeisenbergBracket B y z) +
      abelianHeisenbergBracket B y (abelianHeisenbergBracket B z x) +
      abelianHeisenbergBracket B z (abelianHeisenbergBracket B x y) = 0 := by
  sorry

theorem abelianHeisenbergBracket_single_modes {H : Type u}
    [AddCommGroup H] [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (m n : ℤ) (h k : H) :
    abelianHeisenbergBracket B
      (abelianHeisenbergLoopMode m h) (abelianHeisenbergLoopMode n k) =
      (0, if m + n = 0 then (m : ℂ) * B h k else 0) := by
  sorry

theorem abelianHeisenbergBracket_central_left {H : Type u}
    [AddCommGroup H] [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (c : ℂ) (x : AbelianHeisenbergCarrier H) :
    abelianHeisenbergBracket B (abelianHeisenbergCentral c) x = 0 := by
  sorry

theorem abelianHeisenbergBracket_central_right {H : Type u}
    [AddCommGroup H] [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (x : AbelianHeisenbergCarrier H) (c : ℂ) :
    abelianHeisenbergBracket B x (abelianHeisenbergCentral c) = 0 := by
  sorry

abbrev AbelianOscillatorFock (H : Type u) [AddCommGroup H] [Module ℂ H] :=
  SymmetricAlgebra ℂ (ℕ+ →₀ H)

/-- Creation, contraction, and zero modes on the symmetric Fock space of an
arbitrary complex bilinear space. Symmetry is needed for the oscillator
commutator to represent the skew loop cocycle. -/
noncomputable def abelianHeisenbergMode {H : Type u} [AddCommGroup H]
    [Module ℂ H] : (B : LinearMap.BilinForm ℂ H) → (hB : B.IsSymm) →
    (n : ℤ) → (h : H) → Module.End ℂ (AbelianOscillatorFock H) := by
  sorry

theorem abelianHeisenbergMode_creation {H : Type u} [AddCommGroup H]
    [Module ℂ H] (B : LinearMap.BilinForm ℂ H) (hB : B.IsSymm) (m : ℕ+)
    (h k : H) :
    abelianHeisenbergMode B hB (-(m : ℤ)) h
      (SymmetricAlgebra.ι ℂ (ℕ+ →₀ H) (Finsupp.single m k)) =
      (SymmetricAlgebra.ι ℂ (ℕ+ →₀ H) (Finsupp.single m h)) *
        (SymmetricAlgebra.ι ℂ (ℕ+ →₀ H) (Finsupp.single m k)) := by
  sorry

theorem abelianHeisenbergMode_contraction {H : Type u} [AddCommGroup H]
    [Module ℂ H] (B : LinearMap.BilinForm ℂ H) (hB : B.IsSymm) (m : ℕ+)
    (h k : H) :
    abelianHeisenbergMode B hB (m : ℤ) h
      (SymmetricAlgebra.ι ℂ (ℕ+ →₀ H) (Finsupp.single m k)) =
      ((m : ℂ) * B h k) • (1 : AbelianOscillatorFock H) := by
  sorry

theorem abelianHeisenbergMode_commutator {H : Type u} [AddCommGroup H]
    [Module ℂ H] (B : LinearMap.BilinForm ℂ H) (hB : B.IsSymm)
    (m n : ℤ) (h k : H) :
    ⁅abelianHeisenbergMode B hB m h, abelianHeisenbergMode B hB n k⁆ =
      (if m + n = 0 then (m : ℂ) * B h k else 0) •
        (1 : Module.End ℂ (AbelianOscillatorFock H)) := by
  sorry

theorem abelianHeisenbergMode_zero_on_vacuum {H : Type u}
    [AddCommGroup H] [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (hB : B.IsSymm) (h : H) :
    abelianHeisenbergMode B hB 0 h (1 : AbelianOscillatorFock H) = 0 := by
  sorry

/-- The oscillator and central operators assemble to a representation of the
full finite-support loop-plus-center carrier. -/
noncomputable def abelianHeisenbergAction {H : Type u}
    [AddCommGroup H] [Module ℂ H] :
    (B : LinearMap.BilinForm ℂ H) → (hB : B.IsSymm) →
    AbelianHeisenbergCarrier H →ₗ[ℂ]
      Module.End ℂ (AbelianOscillatorFock H) := by
  sorry

theorem abelianHeisenbergAction_loopMode {H : Type u}
    [AddCommGroup H] [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (hB : B.IsSymm) (n : ℤ) (h : H) :
    abelianHeisenbergAction B hB (abelianHeisenbergLoopMode n h) =
      abelianHeisenbergMode B hB n h := by
  sorry

theorem abelianHeisenbergAction_central {H : Type u}
    [AddCommGroup H] [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (hB : B.IsSymm) (c : ℂ) :
    abelianHeisenbergAction B hB (abelianHeisenbergCentral c) = c • 1 := by
  sorry

theorem abelianHeisenbergAction_bracket {H : Type u}
    [AddCommGroup H] [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (hB : B.IsSymm) (x y : AbelianHeisenbergCarrier H) :
    abelianHeisenbergAction B hB (abelianHeisenbergBracket B x y) =
      ⁅abelianHeisenbergAction B hB x, abelianHeisenbergAction B hB y⁆ := by
  sorry

end VertexFoundations

namespace LatticeVOA

universe w

/-- An input uses the existing embedded lattice and carries finite-free, even,
positive-definite hypotheses explicitly. Unimodularity is not assumed. -/
structure PositiveEvenLattice (V : Type u) [AddCommGroup V] [Module ℚ V] where
  lattice : TauCeti.IntegralLattice V
  finiteDimensional : Module.Finite ℤ lattice.carrier
  ambientFiniteDimensional : FiniteDimensional ℚ V
  free : Module.Free ℤ lattice.carrier
  even : lattice.IsEven
  positive : lattice.IsPosDef

instance carrierModuleFinite {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) : Module.Finite ℤ D.lattice.carrier := D.finiteDimensional

instance carrierModuleFree {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) : Module.Free ℤ D.lattice.carrier := D.free

/-- Bounded charge sets use the existing native positive-definite lattice
finiteness theorem; the lattice roadmap supplies its mathematical contract. -/
theorem positiveEvenLattice_bounded_vectors_finite {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V) (C : ℚ) :
    {x : D.lattice.carrier | D.lattice.norm x ≤ C}.Finite :=
  D.positive.finite_setOf_norm_le C

theorem positiveEvenLattice_ambientFiniteDimensional
    {V : Type u} [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V) :
    FiniteDimensional ℚ V := D.ambientFiniteDimensional

local instance instDecidableEqLatticeCarrier {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) : DecidableEq D.lattice.carrier :=
  Classical.decEq _

abbrev ComplexAmbient (V : Type u) [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) := ℂ ⊗[ℚ] V

/-- The bilinear form transported to the actual complexified ambient space. -/
noncomputable def complexLatticeForm {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) :
    LinearMap.BilinForm ℂ (ComplexAmbient V D) :=
  LinearMap.BilinForm.baseChange ℂ D.lattice.form

theorem complexLatticeForm_tmul {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (c d : ℂ) (x y : V) :
    complexLatticeForm D (c ⊗ₜ[ℚ] x) (d ⊗ₜ[ℚ] y) =
      c * d * (D.lattice.form x y : ℚ) := by
  change (D.lattice.form x y) • (c * d) =
    (c * d) * algebraMap ℚ ℂ (D.lattice.form x y)
  rw [Algebra.smul_def, mul_comm]

/-- Reuse the signed ADE integral lattice, retaining its real carrier and Gram
form rather than defining a second root lattice. -/
noncomputable def signedRootLattice {I : Type v} [Fintype I] [DecidableEq I]
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) :
    PositiveEvenLattice (ℚ ⊗[ℤ] TauCetiRoadmap.ReductiveGroups.SignedADE.Lattice I) := by
  refine ⟨TauCetiRoadmap.ReductiveGroups.SignedADE.integralLattice D, ?_, ?_, ?_, ?_, ?_⟩
  all_goals sorry

abbrev OscillatorGenerators (V : Type u) [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) := ℕ+ →₀ ComplexAmbient V D

/-- A sign cocycle on the actual lattice carrier, with the commutator fixed by
its integral form. The cocycle remains an explicit input to all subsequent data. -/
structure NormalizedSignCocycle {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) where
  epsilon : D.lattice.carrier → D.lattice.carrier → ℤˣ
  signValued : ∀ a b, epsilon a b = 1 ∨ epsilon a b = -1
  epsilon_zero_left : ∀ b, epsilon 0 b = 1
  epsilon_zero_right : ∀ a, epsilon a 0 = 1
  cocycle : ∀ a b c,
    epsilon a b * epsilon (a + b) c = epsilon b c * epsilon a (b + c)
  commutator : ∀ a b,
    epsilon a b * (epsilon b a)⁻¹ =
      (-1 : ℤˣ) ^ D.lattice.integralForm a b

/-- The actual central-extension carrier, with sign restricted to `{±1}`. -/
structure LatticeCoverElement {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) where
  charge : D.lattice.carrier
  sign : {s : ℤˣ // s = 1 ∨ s = -1}

noncomputable def latticeCoverMul {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x y : LatticeCoverElement D) : LatticeCoverElement D := by
  refine ⟨x.charge + y.charge, ⟨x.sign.1 * y.sign.1 * C.epsilon x.charge y.charge, ?_⟩⟩
  rcases x.sign.2 with hx | hx <;> rcases y.sign.2 with hy | hy <;>
    rcases C.signValued x.charge y.charge with he | he <;> simp [hx, hy, he]

def latticeCoverOne {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) : LatticeCoverElement D :=
  ⟨0, ⟨1, Or.inl rfl⟩⟩

def latticeCoverProjection {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (x : LatticeCoverElement D) : D.lattice.carrier :=
  x.charge

def latticeCoverSection {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (a : D.lattice.carrier) : LatticeCoverElement D :=
  ⟨a, ⟨1, Or.inl rfl⟩⟩

def latticeCoverCentralInvolution {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) : LatticeCoverElement D :=
  ⟨0, ⟨-1, Or.inr rfl⟩⟩

theorem latticeCoverProjection_mul {V : Type u} [AddCommGroup V]
    [Module ℚ V] {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x y : LatticeCoverElement D) :
    latticeCoverProjection (latticeCoverMul C x y) =
      latticeCoverProjection x + latticeCoverProjection y := rfl

theorem latticeCoverSection_projection {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (a : D.lattice.carrier) :
    latticeCoverProjection (latticeCoverSection D a) = a := rfl

theorem latticeCover_centralInvolution_commutes {V : Type u}
    [AddCommGroup V] [Module ℚ V] {D : PositiveEvenLattice V}
    (C : NormalizedSignCocycle D) (x : LatticeCoverElement D) :
    latticeCoverMul C (latticeCoverCentralInvolution D) x =
      latticeCoverMul C x (latticeCoverCentralInvolution D) := by
  sorry

theorem latticeCoverMul_assoc {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x y z : LatticeCoverElement D) :
    latticeCoverMul C (latticeCoverMul C x y) z =
      latticeCoverMul C x (latticeCoverMul C y z) := by
  sorry

theorem latticeCover_one_mul {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x : LatticeCoverElement D) : latticeCoverMul C (latticeCoverOne D) x = x := by
  sorry

theorem latticeCover_mul_one {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x : LatticeCoverElement D) : latticeCoverMul C x (latticeCoverOne D) = x := by
  sorry

theorem latticeCover_inv_exists {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x : LatticeCoverElement D) : ∃ y,
      latticeCoverMul C x y = latticeCoverOne D ∧
      latticeCoverMul C y x = latticeCoverOne D := by
  sorry

/-- The exponent of the selected ordered-basis sign cocycle. The finite sum
uses the actual `LinearOrder` instance. -/
def orderedSignExponent {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) {I : Type v} [Fintype I] [LinearOrder I]
    (b : Module.Basis I ℤ D.lattice.carrier)
    (a c : D.lattice.carrier) : ℤ :=
  ∑ i : I, ∑ j : I,
    if j < i then
      D.lattice.integralForm (b i) (b j) * b.repr a i * b.repr c j
    else 0

/-- The ordered-basis cocycle is explicitly the parity of the strict
lower-triangular Gram sum. -/
noncomputable def orderedSignCocycle {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) {I : Type v} [Fintype I] [LinearOrder I]
    (b : Module.Basis I ℤ D.lattice.carrier) : NormalizedSignCocycle D where
  epsilon a c := (-1 : ℤˣ) ^ orderedSignExponent D b a c
  signValued := by sorry
  epsilon_zero_left := by sorry
  epsilon_zero_right := by sorry
  cocycle := by sorry
  commutator := by sorry

theorem orderedSignCocycle_formula {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) {I : Type v} [Fintype I] [LinearOrder I]
    (b : Module.Basis I ℤ D.lattice.carrier) (a c : D.lattice.carrier) :
    (orderedSignCocycle D b).epsilon a c =
      (-1 : ℤˣ) ^ (∑ i : I, ∑ j : I,
        if j < i then
          D.lattice.integralForm (b i) (b j) * b.repr a i * b.repr c j
        else 0) := by
  rfl

/-- The carrier of the twisted lattice group algebra. Its product is defined
from the cocycle below, not the untwisted pointwise product. -/
abbrev TwistedGroupAlgebraCarrier {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) := D.lattice.carrier →₀ ℂ

noncomputable def twistedGroupAlgebraMul {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (f g : TwistedGroupAlgebraCarrier D) : TwistedGroupAlgebraCarrier D := by
  classical
  exact f.sum fun a r => g.sum fun b s =>
    Finsupp.single (a + b) (r * s * ((C.epsilon a b : ℤ) : ℂ))

def twistedGroupAlgebraOne {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) : TwistedGroupAlgebraCarrier D :=
  Finsupp.single 0 1

theorem twistedGroupAlgebraMul_assoc {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (f g h : TwistedGroupAlgebraCarrier D) :
    twistedGroupAlgebraMul D C (twistedGroupAlgebraMul D C f g) h =
      twistedGroupAlgebraMul D C f (twistedGroupAlgebraMul D C g h) := by
  sorry

theorem twistedGroupAlgebraOne_mul {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (f : TwistedGroupAlgebraCarrier D) :
    twistedGroupAlgebraMul D C (twistedGroupAlgebraOne D) f = f := by
  sorry

theorem twistedGroupAlgebraMul_one {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (f : TwistedGroupAlgebraCarrier D) :
    twistedGroupAlgebraMul D C f (twistedGroupAlgebraOne D) = f := by
  sorry

/-- The oscillator part is the symmetric algebra on the finite-support sum of
all negative modes. -/
abbrev FockSpace {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :=
  SymmetricAlgebra ℂ (OscillatorGenerators V D) ⊗[ℂ]
    TwistedGroupAlgebraCarrier D

def vacuumState {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) : FockSpace D C :=
  1 ⊗ₜ[ℂ] twistedGroupAlgebraOne D

/-- A charge basis vector, declared before any action law that evaluates it. -/
def chargeState {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a : D.lattice.carrier) : FockSpace D C :=
  1 ⊗ₜ[ℂ] Finsupp.single a 1

/-- The central involution acts by minus identity in the genuine Fock
representation of the extension. -/
noncomputable def latticeCoverAction {V : Type u} [AddCommGroup V] [Module ℚ V]
    : (D : PositiveEvenLattice V) → (C : NormalizedSignCocycle D) →
      LatticeCoverElement D → Module.End ℂ (FockSpace D C) := by
  sorry

theorem latticeCoverAction_mul {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (x y : LatticeCoverElement D) :
    latticeCoverAction D C (latticeCoverMul C x y) =
      latticeCoverAction D C x * latticeCoverAction D C y := by
  sorry

/-- Evaluation on an actual charge basis vector records both the cocycle and
the central sign; the carrier alone does not determine this action. -/
theorem latticeCoverAction_charge {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (x : LatticeCoverElement D) (a : D.lattice.carrier) :
    latticeCoverAction D C x (chargeState D C a) =
      (((x.sign.1 : ℤ) : ℂ) * ((C.epsilon x.charge a : ℤ) : ℂ)) •
        chargeState D C (x.charge + a) := by
  sorry

theorem latticeCoverAction_one {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    latticeCoverAction D C (latticeCoverOne D) = 1 := by
  sorry

theorem latticeCover_centralInvolution_action {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) :
    latticeCoverAction D C (latticeCoverCentralInvolution D) = -1 := by
  sorry


def oscillatorGenerator {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (n : ℕ+)
    (h : ComplexAmbient V D) : OscillatorGenerators V D :=
  Finsupp.single n h

/-- Shift each negative oscillator generator by its positive mode label.
This is the generator map h(-m) ↦ m h(-(m+1)), before any vertex axiom. -/
noncomputable def oscillatorTranslationShift {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) :
    OscillatorGenerators V D →ₗ[ℂ] OscillatorGenerators V D where
  toFun x := x.sum fun m h =>
    (m.1 : ℂ) • Finsupp.single ⟨m.1 + 1, Nat.succ_pos m.1⟩ h
  map_add' := by sorry
  map_smul' := by sorry

/-- Send a generator g to ι(g)+ε ι(shift g) in the actual square-zero algebra.
The symmetric-algebra lift therefore fixes the derivation, not just its carrier. -/
noncomputable def oscillatorTranslationLiftGenerator {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V) :
    OscillatorGenerators V D →ₗ[ℂ]
      TrivSqZeroExt (SymmetricAlgebra ℂ (OscillatorGenerators V D))
        (SymmetricAlgebra ℂ (OscillatorGenerators V D)) where
  toFun g := (SymmetricAlgebra.ι ℂ (OscillatorGenerators V D) g,
    SymmetricAlgebra.ι ℂ (OscillatorGenerators V D) (oscillatorTranslationShift D g))
  map_add' := by sorry
  map_smul' := by sorry

noncomputable def oscillatorTranslationLift {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) :
    SymmetricAlgebra ℂ (OscillatorGenerators V D) →ₐ[ℂ]
      TrivSqZeroExt (SymmetricAlgebra ℂ (OscillatorGenerators V D))
        (SymmetricAlgebra ℂ (OscillatorGenerators V D)) :=
  SymmetricAlgebra.lift (oscillatorTranslationLiftGenerator D)

/-- The constant component of the dual-number lift is the identity. -/
theorem oscillatorTranslationLift_fst {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V)
    (u : SymmetricAlgebra ℂ (OscillatorGenerators V D)) :
    TrivSqZeroExt.fst (oscillatorTranslationLift D u) = u := by
  sorry

/-- δ is concretely the ε coefficient of the symmetric-algebra lift.
Its Leibniz proof uses multiplication in the square-zero extension. -/
noncomputable def oscillatorTranslationDerivation {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V) :
    Derivation ℂ (SymmetricAlgebra ℂ (OscillatorGenerators V D))
      (SymmetricAlgebra ℂ (OscillatorGenerators V D)) where
  toLinearMap := {
    toFun := fun u => TrivSqZeroExt.snd (oscillatorTranslationLift D u)
    map_add' := by sorry
    map_smul' := by sorry }
  map_one_eq_zero' := by sorry
  leibniz' := by sorry

theorem oscillatorTranslationDerivation_generator {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (m : ℕ+) (h : ComplexAmbient V D) :
    oscillatorTranslationDerivation D
        (SymmetricAlgebra.ι ℂ (OscillatorGenerators V D) (oscillatorGenerator D m h)) =
      (m.1 : ℂ) • SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
        (oscillatorGenerator D ⟨m.1 + 1, Nat.succ_pos m.1⟩ h) := by
  sorry

theorem oscillatorTranslationDerivation_one {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) :
    oscillatorTranslationDerivation D 1 = 0 :=
  (oscillatorTranslationDerivation D).map_one_eq_zero

theorem oscillatorTranslationDerivation_mul {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V)
    (u v : SymmetricAlgebra ℂ (OscillatorGenerators V D)) :
    oscillatorTranslationDerivation D (u * v) =
      u * oscillatorTranslationDerivation D v + v * oscillatorTranslationDerivation D u := by
  simpa only [smul_eq_mul] using (oscillatorTranslationDerivation D).leibniz u v

/-- Concrete charged translation, extended bilinearly from every pure tensor.
It is defined before generator covariance and uses no generic vertex structure. -/
def latticeTranslation {V : Type u} [AddCommGroup V] [Module ℚ V]
    : (D : PositiveEvenLattice V) → (C : NormalizedSignCocycle D) →
      FockSpace D C →ₗ[ℂ] FockSpace D C := fun D C =>
  TensorProduct.lift {
    toFun := fun u => {
      toFun := fun f => f.sum fun a c =>
        c • ((oscillatorTranslationDerivation D u + u *
          SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
            (oscillatorGenerator D 1 ((1 : ℂ) ⊗ₜ[ℚ] (a : V)))) ⊗ₜ[ℂ]
          (Finsupp.single a 1 : TwistedGroupAlgebraCarrier D))
      map_add' := by sorry
      map_smul' := by sorry }
    map_add' := by sorry
    map_smul' := by sorry }

theorem latticeTranslation_pure_tensor {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (u : SymmetricAlgebra ℂ (OscillatorGenerators V D)) (a : D.lattice.carrier) :
    latticeTranslation D C (u ⊗ₜ[ℂ] (Finsupp.single a 1 : TwistedGroupAlgebraCarrier D)) =
      (oscillatorTranslationDerivation D u + u *
        SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
          (oscillatorGenerator D 1 ((1 : ℂ) ⊗ₜ[ℚ] (a : V)))) ⊗ₜ[ℂ]
        (Finsupp.single a 1 : TwistedGroupAlgebraCarrier D) := by
  sorry

theorem latticeTranslation_chargeState {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a : D.lattice.carrier) :
    latticeTranslation D C (chargeState D C a) =
      (SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
        (oscillatorGenerator D 1 ((1 : ℂ) ⊗ₜ[ℚ] (a : V)))) ⊗ₜ[ℂ]
        (Finsupp.single a 1 : TwistedGroupAlgebraCarrier D) := by
  sorry

theorem latticeTranslation_vacuum {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    latticeTranslation D C (vacuumState D C) = 0 := by
  sorry

/-- The actual Heisenberg mode endomorphisms on the oscillator-and-charge
space. -/
noncomputable def heisenbergMode {V : Type u} [AddCommGroup V] [Module ℚ V]
    : (D : PositiveEvenLattice V) → (C : NormalizedSignCocycle D) →
      (n : ℤ) → (h : ComplexAmbient V D) → Module.End ℂ (FockSpace D C) := by
  sorry

theorem heisenbergMode_commutator {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (m n : ℤ) (h k : ComplexAmbient V D) :
    ⁅heisenbergMode D C m h, heisenbergMode D C n k⁆ =
      (if m + n = 0 then (m : ℂ) * complexLatticeForm D h k else 0) •
        (1 : Module.End ℂ (FockSpace D C)) := by
  sorry

theorem heisenbergMode_negative_on_charge {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (m : ℕ+) (h : ComplexAmbient V D) (a : D.lattice.carrier) :
    heisenbergMode D C (-(m : ℤ)) h (chargeState D C a) =
      (SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
        (oscillatorGenerator D m h)) ⊗ₜ[ℂ] Finsupp.single a 1 := by
  sorry

theorem heisenbergMode_positive_on_generator {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (m : ℕ+)
    (h k : ComplexAmbient V D) (a : D.lattice.carrier) :
    heisenbergMode D C (m : ℤ) h
      ((SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
          (oscillatorGenerator D m k)) ⊗ₜ[ℂ] Finsupp.single a 1) =
      ((m : ℂ) * complexLatticeForm D h k) • chargeState D C a := by
  sorry

theorem heisenbergMode_zero_on_charge {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (h : ComplexAmbient V D) (a : D.lattice.carrier) :
    heisenbergMode D C 0 h (chargeState D C a) =
      complexLatticeForm D h (1 ⊗ₜ[ℚ] (a : V)) • chargeState D C a := by
  sorry

/-- Independent all-integer Heisenberg covariance. The n=1 charge term
produces -h(0); negative modes use δ, and n=0 commutes. No vertex bundle is used. -/
theorem latticeTranslation_heisenbergMode {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (n : ℤ) (h : ComplexAmbient V D) :
    latticeTranslation D C * heisenbergMode D C n h -
      heisenbergMode D C n h * latticeTranslation D C =
      -(n : ℂ) • heisenbergMode D C (n - 1) h := by
  sorry

/-- Embed the uncharged symmetric oscillator sector into the lattice Fock
space using its actual charge-zero basis vector. -/
noncomputable def latticeOscillatorEmbedding {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) :
    VertexFoundations.AbelianOscillatorFock (ComplexAmbient V D) →ₗ[ℂ]
      FockSpace D C :=
  (TensorProduct.mk ℂ
    (VertexFoundations.AbelianOscillatorFock (ComplexAmbient V D))
    (TwistedGroupAlgebraCarrier D)).flip (Finsupp.single 0 1)

/-- The lattice Heisenberg action restricts to the generic symmetric-Fock
representation on the uncharged sector, including the zero mode. -/
theorem latticeHeisenbergMode_specializes_abelian {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (n : ℤ)
    (h : ComplexAmbient V D)
    (x : VertexFoundations.AbelianOscillatorFock (ComplexAmbient V D)) :
    heisenbergMode D C n h (latticeOscillatorEmbedding D C x) =
      latticeOscillatorEmbedding D C
        (VertexFoundations.abelianHeisenbergMode (complexLatticeForm D)
          (by sorry) n h x) := by
  sorry

/-- Native heterogeneous Hahn-series fields are the target carrier; the new
state-field map retains the lattice and cocycle as explicit parameters. -/
noncomputable def latticeStateField {V : Type u} [AddCommGroup V] [Module ℚ V]
    : (D : PositiveEvenLattice V) → (C : NormalizedSignCocycle D) →
      FockSpace D C →ₗ[ℂ] HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C) := by
  sorry

/-- The one-oscillator state whose field is the Heisenberg current. -/
def latticeHeisenbergState {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (h : ComplexAmbient V D) : FockSpace D C :=
  (SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
    (oscillatorGenerator D 1 h)) ⊗ₜ[ℂ] Finsupp.single 0 1

/-- The current field's coefficients are the actual oscillator-mode operators. -/
theorem latticeStateField_heisenbergMode {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (h : ComplexAmbient V D) (n : ℤ) :
    HVertexOperator.coeff
        (latticeStateField D C (latticeHeisenbergState D C h)) (-n - 1) =
      heisenbergMode D C n h := by
  sorry

/-- The current coefficient dictionary transfers the independent oscillator law. -/
theorem latticeHeisenbergField_translation_covariant {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (h : ComplexAmbient V D) :
    VertexFoundations.FieldTranslationCovariant (latticeTranslation D C)
      (latticeStateField D C (latticeHeisenbergState D C h)) := by
  intro n
  simpa only [latticeStateField_heisenbergMode] using
    latticeTranslation_heisenbergMode D C n h

def latticeMode {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a : FockSpace D C) (n : ℤ) : Module.End ℂ (FockSpace D C) :=
  HVertexOperator.coeff (latticeStateField D C a) (-n - 1)

theorem latticeMode_coefficient {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a : FockSpace D C) (n : ℤ) :
    latticeMode D C a n =
      HVertexOperator.coeff (latticeStateField D C a) (-n - 1) := rfl

theorem latticeVacuum_mode {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) (n : ℤ) :
    latticeMode D C (vacuumState D C) n =
      (if n = -1 then 1 else 0 : ℂ) • (1 : Module.End ℂ (FockSpace D C)) := by
  sorry

theorem latticeState_creation {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a : FockSpace D C) :
    (latticeMode D C a (-1)) (vacuumState D C) = a := by
  sorry

theorem latticeState_truncation {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a b : FockSpace D C) :
    ∃ N : ℤ, ∀ n, N ≤ n → (latticeMode D C a n) b = 0 := by
  sorry

theorem latticeFields_local {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a b : FockSpace D C) :
    ∃ N : ℕ, ∀ (m n : ℤ) (v : FockSpace D C),
      ∑ i ∈ Finset.range (N + 1),
        (((-1 : ℂ) ^ i) * (Nat.choose N i : ℂ)) •
          ((latticeMode D C a (m + N - (i : ℤ))
              ((latticeMode D C b (n + (i : ℤ))) v)) -
            (latticeMode D C b (n + (i : ℤ)))
              ((latticeMode D C a (m + N - (i : ℤ))) v)) = 0 := by
  sorry

theorem latticeBorcherds_identity {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a b c : FockSpace D C) (m n r : ℤ) :
    ∃ N : ℕ,
      (∀ i, N ≤ i →
        (latticeMode D C ((latticeMode D C a (n + i)) b) (m + r - i)) c = 0) ∧
      (∀ i, N ≤ i →
        ((latticeMode D C a (m + n - i))
            ((latticeMode D C b (r + i)) c) = 0 ∧
         (latticeMode D C b (n + r - i))
            ((latticeMode D C a (m + i)) c) = 0)) ∧
      (∑ i ∈ Finset.range N,
          ((Ring.choose m i : ℤ) : ℂ) •
            (latticeMode D C ((latticeMode D C a (n + i)) b) (m + r - i)) c) =
        ∑ i ∈ Finset.range N,
          (((-1 : ℂ) ^ i) * (((Ring.choose n i : ℤ) : ℂ)) ) •
            ((latticeMode D C a (m + n - i))
                ((latticeMode D C b (r + i)) c) -
              (-1 : ℂ) ^ n •
                (latticeMode D C b (n + r - i))
                  ((latticeMode D C a (m + i)) c)) := by
  sorry





theorem lattice_skew_symmetry_coefficient {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (a b : FockSpace D C) (n : ℤ) :
    ∃ N : ℕ,
      (∀ j, N ≤ j → (latticeMode D C b (n + j)) a = 0) ∧
      (latticeMode D C a n) b =
        ∑ j ∈ Finset.range N,
          (((-1 : ℂ) ^ (n + j + 1)) / (Nat.factorial j : ℂ)) •
            (latticeTranslation D C ^ j) ((latticeMode D C b (n + j)) a) := by
  sorry


theorem latticeTranslation_mode {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a : FockSpace D C) (n : ℤ) :
    latticeMode D C (latticeTranslation D C a) n =
      -(n : ℂ) • latticeMode D C a (n - 1) := by
  sorry

/-- Finite orthonormal basis data for the conformal-vector construction. -/
structure OrthonormalComplexBasis {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) where
  Index : Type v
  finite : Fintype Index
  basis : Module.Basis Index ℂ (ComplexAmbient V D)
  orthonormal : ∀ i j,
    complexLatticeForm D (basis i) (basis j) =
      (by classical exact if i = j then (1 : ℂ) else 0)

/-- The conformal vector is built from the complex-bilinear extension and the
specified orthonormal basis; basis independence is a separate target. -/
noncomputable def latticeConformalVector {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (B : OrthonormalComplexBasis D) : FockSpace D C := by
  classical
  letI : Fintype B.Index := B.finite
  exact (1 / 2 : ℂ) • ∑ i : B.Index,
    heisenbergMode D C (-1) (B.basis i)
      (heisenbergMode D C (-1) (B.basis i) (vacuumState D C))

theorem latticeConformalVector_basis_independent {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (B B' : OrthonormalComplexBasis D) :
    latticeConformalVector D C B = latticeConformalVector D C B' := by
  sorry

/-- The charge exponential retains both the Heisenberg action and the
specified group-algebra lift. -/
def latticeChargeField {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a : D.lattice.carrier) : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C) :=
  latticeStateField D C (chargeState D C a)

theorem latticeStateField_chargeState {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a : D.lattice.carrier) :
    latticeStateField D C (chargeState D C a) = latticeChargeField D C a := by
  rfl

/-- The actual homogeneous component indexed by oscillator degree plus the
lattice energy q(alpha)=B(alpha,alpha)/2. -/
def oscillatorWordMonomial {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) :
    List (ℕ+ × ComplexAmbient V D) → SymmetricAlgebra ℂ (OscillatorGenerators V D)
  | [] => 1
  | (n, h) :: tail =>
      SymmetricAlgebra.ι ℂ (OscillatorGenerators V D) (oscillatorGenerator D n h) *
        oscillatorWordMonomial D tail

def latticeFockMonomial {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (word : List (ℕ+ × ComplexAmbient V D)) (a : D.lattice.carrier) :
    FockSpace D C :=
  oscillatorWordMonomial D word ⊗ₜ[ℂ] Finsupp.single a 1

/-- Spanning is a symmetric-algebra/tensor fact, independent of vertex axioms. -/
theorem latticeFockMonomials_span {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    Submodule.span ℂ {x | ∃ (word : List (ℕ+ × ComplexAmbient V D))
      (a : D.lattice.carrier), x = latticeFockMonomial D C word a} = ⊤ := by
  sorry

/-- The normalized divided derivative of the actual current field indexed by
the mode and vector. -/
noncomputable def dividedHeisenbergCurrentField {V : Type u}
    [AddCommGroup V] [Module ℚ V] :
    (D : PositiveEvenLattice V) → (C : NormalizedSignCocycle D) →
    (current : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C)) →
    (m : ℕ+) →
    HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C) := by
  sorry

def dividedDerivativeFactor (m : ℕ+) (k : ℤ) : ℂ :=
  let P : ℤ := Finset.prod (Finset.range (m.1 - 1))
    (fun j : ℕ => k + (j : ℤ) + 1)
  (P : ℂ) / (Nat.factorial (m.1 - 1) : ℂ)

theorem dividedHeisenbergCurrentField_coefficient {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (current : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (m : ℕ+) (k : ℤ) :
    HVertexOperator.coeff (dividedHeisenbergCurrentField D C current m) k =
      dividedDerivativeFactor m k •
        HVertexOperator.coeff current (k + (m.1 - 1 : ℕ)) := by
  sorry

/-- Normal ordering takes the ordered list of negative-current factors and
the actual charge-field base, placing creation modes to the left of
annihilation modes coefficientwise. -/
noncomputable def normalOrderedPair {V : Type u}
    [AddCommGroup V] [Module ℚ V] :
    (D : PositiveEvenLattice V) → (C : NormalizedSignCocycle D) →
    (current charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C)) →
    HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C) := by
  sorry

/-- Negative modes of the first field go left; its nonnegative modes go right. -/
def normalOrderedPairModeTerm {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (current charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (n i : ℤ) : Module.End ℂ (FockSpace D C) :=
  if i < 0 then
    (HVertexOperator.coeff current (-i - 1)).comp
      (HVertexOperator.coeff charge (-(n - 1 - i) - 1))
  else
    (HVertexOperator.coeff charge (-(n - 1 - i) - 1)).comp
      (HVertexOperator.coeff current (-i - 1))

theorem normalOrderedPairModeTerm_support {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (current charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (n : ℤ) (v : FockSpace D C) :
    ∃ N : ℕ, ∀ i : ℤ, (i < -(N : ℤ) ∨ (N : ℤ) < i) →
      normalOrderedPairModeTerm D C current charge n i v = 0 := by
  sorry

theorem normalOrderedPair_coefficient {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (current charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (n : ℤ) (v : FockSpace D C) :
    ∃ N : ℕ, ∀ M ≥ N,
      HVertexOperator.coeff (normalOrderedPair D C current charge) (-n - 1) v =
        ∑ i ∈ Finset.Icc (-(M : ℤ)) (M : ℤ),
          normalOrderedPairModeTerm D C current charge n i v := by
  sorry

/-- List order and the final charge field are retained by actual recursion. -/
noncomputable def normalOrderedProduct {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (currents : List (HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C)))
    (charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C)) :
    HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C) :=
  currents.foldr (normalOrderedPair D C) charge

@[simp] theorem normalOrderedProduct_nil {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C)) :
    normalOrderedProduct D C [] charge = charge := rfl

@[simp] theorem normalOrderedProduct_cons {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (current : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (tail : List (HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C)))
    (charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C)) :
    normalOrderedProduct D C (current :: tail) charge =
      normalOrderedPair D C current (normalOrderedProduct D C tail charge) := rfl

/-- Divided differentiation preserves operator covariance coefficientwise.
Use the actual dividedDerivativeFactor, including zero factors and all integer indices. -/
theorem dividedHeisenbergCurrentField_translation_covariant {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (T : Module.End ℂ (FockSpace D C))
    (current : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (m : ℕ+) (hcurrent : VertexFoundations.FieldTranslationCovariant T current) :
    VertexFoundations.FieldTranslationCovariant T
      (dividedHeisenbergCurrentField D C current m) := by
  sorry

/-- Normal-product covariance uses common finite cutoffs on v and T v,
then reindexes the two split sums; the i=0 boundary term has zero factor.
No generic vertex axiom or reconstructed lattice structure is a premise. -/
theorem normalOrderedPair_translation_covariant {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (T : Module.End ℂ (FockSpace D C))
    (current charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (hcurrent : VertexFoundations.FieldTranslationCovariant T current)
    (hcharge : VertexFoundations.FieldTranslationCovariant T charge) :
    VertexFoundations.FieldTranslationCovariant T
      (normalOrderedPair D C current charge) := by
  sorry

theorem normalOrderedProduct_translation_covariant {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (T : Module.End ℂ (FockSpace D C))
    (currents : List (HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C)))
    (charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (hcurrents : ∀ current ∈ currents,
      VertexFoundations.FieldTranslationCovariant T current)
    (hcharge : VertexFoundations.FieldTranslationCovariant T charge) :
    VertexFoundations.FieldTranslationCovariant T
      (normalOrderedProduct D C currents charge) := by
  induction currents with
  | nil => exact hcharge
  | cons current tail ih =>
      apply normalOrderedPair_translation_covariant D C T current
        (normalOrderedProduct D C tail charge)
      · exact hcurrents current (by simp)
      · apply ih
        intro A hA
        exact hcurrents A (by simp [hA])

/-- The normal-ordered field on a Fock monomial is assembled from its actual
divided-current derivatives and charge field. The list order and charge are
retained as data. -/
noncomputable def normalOrderedFockField {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (word : List (ℕ+ × ComplexAmbient V D)) (a : D.lattice.carrier) :
    HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C) :=
  normalOrderedProduct D C
    (word.map fun p => dividedHeisenbergCurrentField D C
      (latticeStateField D C (latticeHeisenbergState D C p.2)) p.1)
    (latticeChargeField D C a)

/-- The state-field map on every Fock monomial is the normal-ordered product
specified by its oscillator word and charge, not an independent family. -/
theorem latticeStateField_fockMonomial_normalOrdered {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (word : List (ℕ+ × ComplexAmbient V D)) (a : D.lattice.carrier) :
    latticeStateField D C (latticeFockMonomial D C word a) =
      normalOrderedFockField D C word a := by
  sorry

/-- The generator and normal-order equations determine the state-field map on
the spanning Fock monomials, hence uniquely on the whole state space. -/
theorem latticeStateField_unique_from_normalOrdered_generators {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (Y : FockSpace D C →ₗ[ℂ]
      HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (hY : ∀ (word : List (ℕ+ × ComplexAmbient V D))
      (a : D.lattice.carrier),
      Y (latticeFockMonomial D C word a) =
        normalOrderedFockField D C word a) :
    Y = latticeStateField D C := by
  sorry


/-- Finite multiplicity data for the coefficient of
`exp(Σ α(-n)z^n/n)` at degree `q`. Only modes `1,…,q` can occur, and every
multiplicity is at most `q`. -/
def EminusPartitionIndex (q : ℕ) :=
  {k : Fin q → Fin (q + 1) // ∑ i : Fin q, (i.val + 1) * (k i).val = q}

noncomputable instance instFintypeEminusPartitionIndex (q : ℕ) :
    Fintype (EminusPartitionIndex q) := by
  classical
  unfold EminusPartitionIndex
  infer_instance

/-- Symmetric-algebra monomial for one finite exponential partition. -/
def EminusPartitionMonomial {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (a : D.lattice.carrier) (q : ℕ)
    (k : EminusPartitionIndex q) : SymmetricAlgebra ℂ (OscillatorGenerators V D) :=
  ∏ i : Fin q,
    (SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
      (oscillatorGenerator D ⟨i.val + 1, Nat.succ_pos i.val⟩
        ((1 : ℂ) ⊗ₜ[ℚ] (a : V)))) ^ (k.1 i).val

/-- Explicit finite coefficient of the negative-mode exponential. -/
noncomputable def EminusCoefficient {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (a : D.lattice.carrier) (q : ℕ) :
    SymmetricAlgebra ℂ (OscillatorGenerators V D) := by
  classical
  exact ∑ k : EminusPartitionIndex q,
    (∏ i : Fin q,
      ((((i.val + 1 : ℕ) : ℂ) ^ (k.1 i).val) *
        (Nat.factorial (k.1 i).val : ℂ))⁻¹) •
      EminusPartitionMonomial D a q k

/-- Sum of mode labels at selected positions in an oscillator word. -/
def chargeWordModeSum {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (word : List (ℕ+ × ComplexAmbient V D))
    (J : Finset (Fin word.length)) : ℤ :=
  ∑ i ∈ J, ((word[i]).1.1 : ℤ)

/-- Product of contractions at the selected word positions. -/
def chargeWordContraction {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (a : D.lattice.carrier)
    (word : List (ℕ+ × ComplexAmbient V D)) (J : Finset (Fin word.length)) : ℂ :=
  ∏ i ∈ J, -complexLatticeForm D ((1 : ℂ) ⊗ₜ[ℚ] (a : V)) (word[i]).2

/-- Product of the oscillator factors left uncontracted. -/
def chargeWordUncontracted {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (word : List (ℕ+ × ComplexAmbient V D))
    (J : Finset (Fin word.length)) : SymmetricAlgebra ℂ (OscillatorGenerators V D) :=
  ∏ i : Fin word.length,
    if i ∈ J then 1 else
      SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
        (oscillatorGenerator D (word[i]).1 (word[i]).2)

/-- Finite normal-ordered charge-field coefficient on a Fock monomial. The
subset chooses oscillator contractions, and the remaining exponential degree
is a finite partition sum. -/
noncomputable def chargeModeMonomialFormula {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (word : List (ℕ+ × ComplexAmbient V D))
    (a b : D.lattice.carrier) (r : ℤ) : FockSpace D C := by
  classical
  exact Finset.univ.powerset.sum fun J =>
    let q : ℤ := -r - 1 - D.lattice.integralForm a b +
      chargeWordModeSum D word J
    if hq : 0 ≤ q then
      ((((C.epsilon a b : ℤ) : ℂ) * chargeWordContraction D a word J) •
        ((chargeWordUncontracted D word J *
          EminusCoefficient D a q.toNat) ⊗ₜ[ℂ] Finsupp.single (a + b) 1))
    else 0

/-- The normal-ordered exponential formula holds coefficientwise on every
oscillator monomial and retains the lattice charges, word, cocycle and mode. -/
theorem latticeChargeField_monomial_formula {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (word : List (ℕ+ × ComplexAmbient V D))
    (a b : D.lattice.carrier) (r : ℤ) :
    (latticeMode D C (chargeState D C a) r) (latticeFockMonomial D C word b) =
      chargeModeMonomialFormula D C word a b r := by
  sorry

/-- Independent charge covariance on every spanning monomial. Evaluate T by
its pure-tensor derivation equation and the actual finite subset/partition
formula, before any generic vertex structure is bundled. -/
theorem latticeTranslation_chargeModeMonomialFormula {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (word : List (ℕ+ × ComplexAmbient V D))
    (a b : D.lattice.carrier) (r : ℤ) :
    latticeTranslation D C (chargeModeMonomialFormula D C word a b r) -
      HVertexOperator.coeff (latticeChargeField D C a) (-r - 1)
        (latticeTranslation D C (latticeFockMonomial D C word b)) =
      -(r : ℂ) • chargeModeMonomialFormula D C word a b (r - 1) := by
  sorry

/-- Extend the independent monomial coefficient calculation by the actual
Fock spanning theorem. This must not invoke generic operator covariance. -/
theorem latticeChargeField_translation_covariant {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (a : D.lattice.carrier) :
    VertexFoundations.FieldTranslationCovariant (latticeTranslation D C)
      (latticeChargeField D C a) := by
  intro n
  apply LinearMap.ext_on (latticeFockMonomials_span D C)
  intro v hv
  rcases hv with ⟨word, b, rfl⟩
  change latticeTranslation D C
      (latticeMode D C (chargeState D C a) n (latticeFockMonomial D C word b)) -
    latticeMode D C (chargeState D C a) n
      (latticeTranslation D C (latticeFockMonomial D C word b)) =
    -(n : ℂ) • latticeMode D C (chargeState D C a) (n - 1)
      (latticeFockMonomial D C word b)
  have hcoef : HVertexOperator.coeff (latticeChargeField D C a) (-n - 1) =
      latticeMode D C (chargeState D C a) n := rfl
  simpa only [latticeChargeField_monomial_formula, hcoef] using
    latticeTranslation_chargeModeMonomialFormula D C word a b n

/-- Every normal-ordered oscillator word is covariant before reconstruction. -/
theorem normalOrderedFockField_translation_covariant {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (word : List (ℕ+ × ComplexAmbient V D)) (a : D.lattice.carrier) :
    VertexFoundations.FieldTranslationCovariant (latticeTranslation D C)
      (normalOrderedFockField D C word a) := by
  unfold normalOrderedFockField
  apply normalOrderedProduct_translation_covariant
  · intro current hcurrent
    rcases List.mem_map.mp hcurrent with ⟨p, hp, rfl⟩
    exact dividedHeisenbergCurrentField_translation_covariant D C
      (latticeTranslation D C) _ p.1
      (latticeHeisenbergField_translation_covariant D C p.2)
  · exact latticeChargeField_translation_covariant D C a

/-- General lattice covariance is obtained on the spanning normal-ordered
monomials before bundling. No generic covariance theorem is invoked here. -/
theorem latticeStateField_translation_covariant {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (a : FockSpace D C) :
    VertexFoundations.FieldTranslationCovariant (latticeTranslation D C)
      (latticeStateField D C a) := by
  exact VertexFoundations.fieldTranslationCovariant_of_span_top
    (latticeTranslation D C) (latticeStateField D C)
    {x | ∃ (word : List (ℕ+ × ComplexAmbient V D)) (b : D.lattice.carrier),
      x = latticeFockMonomial D C word b}
    (latticeFockMonomials_span D C)
    (by
      intro x hx
      rcases hx with ⟨word, b, rfl⟩
      rw [latticeStateField_fockMonomial_normalOrdered]
      exact normalOrderedFockField_translation_covariant D C word b) a

/-- Charge-on-charge coefficient, defined by the empty-word exponential
formula rather than by aliasing the same admitted field coefficient. -/
def chargeFieldCoefficient {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a b : D.lattice.carrier) (r : ℤ) : FockSpace D C :=
  chargeModeMonomialFormula D C [] a b r

theorem latticeChargeField_formula {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a b : D.lattice.carrier) (r : ℤ) :
    (latticeMode D C (chargeState D C a) r) (chargeState D C b) =
      chargeFieldCoefficient D C a b r := by
  simpa [chargeFieldCoefficient, latticeFockMonomial,
    oscillatorWordMonomial, chargeState] using
    latticeChargeField_monomial_formula D C [] a b r

/-- The oscillator degree plus even lattice energy is the actual monomial
weight. -/
def latticeFockMonomialWeight {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (word : List (ℕ+ × ComplexAmbient V D))
    (a : D.lattice.carrier) : ℕ :=
  word.foldr (fun p n => p.1.1 + n) 0 +
    Int.toNat (D.lattice.integralNorm a / 2)

/-- The homogeneous submodule is the span of exactly the Fock monomials with
the displayed oscillator-plus-lattice energy. -/
def latticeWeightSpace {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (r : ℕ) : Submodule ℂ (FockSpace D C) :=
  Submodule.span ℂ {x | ∃ (word : List (ℕ+ × ComplexAmbient V D))
      (a : D.lattice.carrier),
      x = latticeFockMonomial D C word a ∧
      latticeFockMonomialWeight D word a = r}

theorem latticeWeightSpace_contains_monomial {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (word : List (ℕ+ × ComplexAmbient V D))
    (a : D.lattice.carrier) :
    latticeFockMonomial D C word a ∈
      latticeWeightSpace D C (latticeFockMonomialWeight D word a) := by
  apply Submodule.subset_span
  exact ⟨word, a, rfl, rfl⟩

theorem latticeWeightSpace_zero {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    latticeWeightSpace D C 0 = ℂ ∙ vacuumState D C := by
  sorry

theorem latticeWeightSpace_finiteDimensional {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (r : ℕ) :
    Module.Finite ℂ (latticeWeightSpace D C r) := by
  sorry

/-- Native internality is about these actual monomial-span submodules. -/
theorem latticeWeightSpace_isInternal {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    DirectSum.IsInternal (latticeWeightSpace D C) := by
  sorry

noncomputable def latticeGradedDecomposition {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    FockSpace D C ≃ₗ[ℂ] (⨁ n : ℕ, latticeWeightSpace D C n) :=
  (LinearEquiv.ofBijective (DirectSum.coeLinearMap (latticeWeightSpace D C))
    (latticeWeightSpace_isInternal D C)).symm

@[simp] theorem latticeGradedDecomposition_symm_of {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (n : ℕ) (x : latticeWeightSpace D C n) :
    (latticeGradedDecomposition D C).symm (DirectSum.of _ n x) =
      (x : FockSpace D C) := by
  change DirectSum.coeLinearMap (latticeWeightSpace D C) (DirectSum.of _ n x) = _
  simp

@[simp] theorem latticeGradedDecomposition_apply_mem {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) {n : ℕ} {x : FockSpace D C}
    (hx : x ∈ latticeWeightSpace D C n) :
    latticeGradedDecomposition D C x = DirectSum.of _ n ⟨x, hx⟩ := by
  let e := LinearEquiv.ofBijective (DirectSum.coeLinearMap (latticeWeightSpace D C))
    (latticeWeightSpace_isInternal D C)
  apply e.injective
  change e (e.symm x) = e (DirectSum.of _ n ⟨x, hx⟩)
  rw [LinearEquiv.apply_symm_apply]
  change x = DirectSum.coeLinearMap (latticeWeightSpace D C) (DirectSum.of _ n ⟨x, hx⟩)
  simp

theorem latticeGradedDecomposition_symm_eq_inclusion {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) :
    (latticeGradedDecomposition D C).symm.toLinearMap =
      DirectSum.coeLinearMap (latticeWeightSpace D C) := rfl

theorem latticeGradedDecomposition_fockMonomial {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (word : List (ℕ+ × ComplexAmbient V D))
    (a : D.lattice.carrier) :
    latticeGradedDecomposition D C (latticeFockMonomial D C word a) =
      DirectSum.of _ (latticeFockMonomialWeight D word a)
        ⟨latticeFockMonomial D C word a,
          latticeWeightSpace_contains_monomial D C word a⟩ :=
  latticeGradedDecomposition_apply_mem D C (latticeWeightSpace_contains_monomial D C word a)

theorem latticeWeightSpace_spans {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    iSup (latticeWeightSpace D C) = ⊤ :=
  DirectSum.IsInternal.submodule_iSup_eq_top (latticeWeightSpace_isInternal D C)

theorem latticeWeightSpace_independent {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    iSupIndep (latticeWeightSpace D C) :=
  DirectSum.IsInternal.submodule_iSupIndep (latticeWeightSpace_isInternal D C)

/-- Weight one is the actual degree-one homogeneous component. -/
def latticeWeightOne {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    Submodule ℂ (FockSpace D C) := latticeWeightSpace D C 1

/-- The lattice construction supplies the generic formal vertex axioms using
its actual state-field map, vacuum, translation and monomial grading. -/
noncomputable def latticeGradedVertexAxioms {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) :
    VertexFoundations.GradedFormalVertexAxioms (FockSpace D C) := by
  refine {
    field := latticeStateField D C
    vacuum := vacuumState D C
    translation := latticeTranslation D C
    translation_vacuum := latticeTranslation_vacuum D C
    vacuum_coeff := by sorry
    creation := by sorry
    translation_coeff := by sorry
    operator_translation_coeff := fun a n => latticeStateField_translation_covariant D C a n
    truncation := by sorry
    locality := by sorry
    creation_no_poles := by sorry
    weightSpace := latticeWeightSpace D C
    isInternal := latticeWeightSpace_isInternal D C
    vacuum_weight_zero := by sorry
    mode_degree := by sorry
    negative_weight_mode_vanishes := by sorry }

theorem latticeTranslation_commutator_mode {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (a : FockSpace D C) (n : ℤ) :
    latticeTranslation D C * latticeMode D C a n -
      latticeMode D C a n * latticeTranslation D C =
        -(n : ℂ) • latticeMode D C a (n - 1) := by
  exact latticeStateField_translation_covariant D C a n

theorem latticeFormalVertex_borcherds {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a b c : FockSpace D C) (m n r : ℤ) :
    ∃ N : ℕ,
      (∀ i, N ≤ i →
        (latticeMode D C ((latticeMode D C a (n + i)) b) (m + r - i)) c = 0) ∧
      (∀ i, N ≤ i →
        ((latticeMode D C a (m + n - i))
            ((latticeMode D C b (r + i)) c) = 0 ∧
         (latticeMode D C b (n + r - i))
            ((latticeMode D C a (m + i)) c) = 0)) ∧
      (∑ i ∈ Finset.range N,
          ((Ring.choose m i : ℤ) : ℂ) •
            (latticeMode D C ((latticeMode D C a (n + i)) b) (m + r - i)) c) =
        ∑ i ∈ Finset.range N,
          (((-1 : ℂ) ^ i) * (((Ring.choose n i : ℤ) : ℂ)) ) •
            ((latticeMode D C a (m + n - i))
                ((latticeMode D C b (r + i)) c) -
              (-1 : ℂ) ^ n •
                (latticeMode D C b (n + r - i))
                  ((latticeMode D C a (m + i)) c)) := by
  sorry

@[instance_reducible]
noncomputable def latticeWeightOneLieRing {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    LieRing (latticeWeightOne D C) :=
  VertexFoundations.weightOneLieRing (latticeGradedVertexAxioms D C)

@[instance_reducible]
noncomputable def latticeWeightOneLieAlgebra {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    @LieAlgebra ℂ (latticeWeightOne D C) _ (latticeWeightOneLieRing D C) :=
  VertexFoundations.weightOneLieAlgebra (latticeGradedVertexAxioms D C)

theorem latticeWeightOneLieRing_parent {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    (latticeWeightOneLieRing D C).toAddCommGroup =
      (inferInstance : AddCommGroup (latticeWeightOne D C)) := rfl

theorem latticeWeightOneLieAlgebra_parent {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    (latticeWeightOneLieAlgebra D C).toModule =
      (inferInstance : Module ℂ (latticeWeightOne D C)) := rfl

theorem latticeWeightOne_zeroProduct_isLie {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) :
    ∃ inst : LieRing (latticeWeightOne D C),
      (letI : LieRing (latticeWeightOne D C) := inst
       ∀ a b : latticeWeightOne D C, ⁅a, b⁆ = VertexFoundations.weightOneZeroProduct
         (latticeGradedVertexAxioms D C) a b) := by
  refine ⟨latticeWeightOneLieRing D C, ?_⟩
  intro a b
  rfl

theorem latticeWeightOne_decomposition {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    Nonempty (latticeWeightOne D C ≃ₗ[ℂ]
      ComplexAmbient V D ×
        ({a : D.lattice.carrier // D.lattice.integralNorm a = 2} → ℂ)) := by
  sorry

/-- A change of normalized cocycle by a specified cochain gives the actual
basis-rescaling equivalence; the cochain equation is retained as data. -/
structure CocycleChange {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C C' : NormalizedSignCocycle D) where
  cochain : D.lattice.carrier → ℤˣ
  cochain_zero : cochain 0 = 1
  comparison : ∀ a b,
    C'.epsilon a b = C.epsilon a b *
      cochain (a + b) * (cochain a)⁻¹ * (cochain b)⁻¹

noncomputable def cocycleChange_equiv {V : Type u} [AddCommGroup V] [Module ℚ V]
    : {D : PositiveEvenLattice V} → {C C' : NormalizedSignCocycle D} →
      (χ : CocycleChange C C') →
      TwistedGroupAlgebraCarrier D ≃ₗ[ℂ] TwistedGroupAlgebraCarrier D := by
  sorry

theorem cocycleChange_equiv_charge {V : Type u} [AddCommGroup V]
    [Module ℚ V] {D : PositiveEvenLattice V} {C C' : NormalizedSignCocycle D}
    (χ : CocycleChange C C') (a : D.lattice.carrier) :
    cocycleChange_equiv χ (Finsupp.single a (1 : ℂ)) =
      Finsupp.single a ((χ.cochain a : ℤˣ) : ℂ) := by
  sorry

theorem cocycleChange_equiv_charge_inverse {V : Type u}
    [AddCommGroup V] [Module ℚ V] {D : PositiveEvenLattice V}
    {C C' : NormalizedSignCocycle D} (χ : CocycleChange C C')
    (a : D.lattice.carrier) :
    (cocycleChange_equiv χ).symm (Finsupp.single a (1 : ℂ)) =
      Finsupp.single a (((χ.cochain a)⁻¹ : ℤˣ) : ℂ) := by
  sorry

theorem cocycleChange_preserves_product {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} {C C' : NormalizedSignCocycle D}
    (χ : CocycleChange C C') (x y : TwistedGroupAlgebraCarrier D) :
    cocycleChange_equiv χ (twistedGroupAlgebraMul D C x y) =
      twistedGroupAlgebraMul D C' (cocycleChange_equiv χ x)
        (cocycleChange_equiv χ y) := by
  sorry

/-- Isometries act only after a chosen compatible lift of cocycle data. -/
structure LiftedLatticeIsometry {V W : Type u} [AddCommGroup V] [Module ℚ V]
    [AddCommGroup W] [Module ℚ W]
    (D : PositiveEvenLattice V) (E : PositiveEvenLattice W)
    (C : NormalizedSignCocycle D) (C' : NormalizedSignCocycle E) where
  linear : V ≃ₗ[ℚ] W
  mapsCarrier : ∀ x, x ∈ D.lattice.carrier → linear x ∈ E.lattice.carrier
  inverseMapsCarrier : ∀ y, y ∈ E.lattice.carrier → linear.symm y ∈ D.lattice.carrier
  preservesForm : ∀ x y, D.lattice.form x y = E.lattice.form (linear x) (linear y)
  chargeMap : D.lattice.carrier → E.lattice.carrier
  chargeMap_agrees : ∀ x hx, chargeMap x = ⟨linear x, mapsCarrier x hx⟩
  liftFactor : D.lattice.carrier → ℤˣ
  liftFactor_zero : liftFactor 0 = 1
  cocycle_lift : ∀ x y,
    C'.epsilon (chargeMap x) (chargeMap y) =
      C.epsilon x y * liftFactor (x + y) *
        (liftFactor x)⁻¹ * (liftFactor y)⁻¹

noncomputable def liftedIsometry_groupAlgebraEquiv {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    : {D : PositiveEvenLattice V} → {E : PositiveEvenLattice W} →
      {C : NormalizedSignCocycle D} → {C' : NormalizedSignCocycle E} →
      (f : LiftedLatticeIsometry D E C C') →
      TwistedGroupAlgebraCarrier D ≃ₗ[ℂ] TwistedGroupAlgebraCarrier E := by
  sorry

theorem liftedIsometry_groupAlgebraEquiv_charge {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    {D : PositiveEvenLattice V} {E : PositiveEvenLattice W}
    {C : NormalizedSignCocycle D} {C' : NormalizedSignCocycle E}
    (f : LiftedLatticeIsometry D E C C') (a : D.lattice.carrier) :
    liftedIsometry_groupAlgebraEquiv f (Finsupp.single a (1 : ℂ)) =
      Finsupp.single (f.chargeMap a) ((f.liftFactor a : ℤˣ) : ℂ) := by
  sorry

noncomputable def liftedIsometry_fockEquiv {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    : {D : PositiveEvenLattice V} → {E : PositiveEvenLattice W} →
      {C : NormalizedSignCocycle D} → {C' : NormalizedSignCocycle E} →
      (f : LiftedLatticeIsometry D E C C') → FockSpace D C ≃ₗ[ℂ] FockSpace E C' := by
  sorry

theorem liftedIsometry_intertwines_modes {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    {D : PositiveEvenLattice V} {E : PositiveEvenLattice W}
    {C : NormalizedSignCocycle D} {C' : NormalizedSignCocycle E}
    (f : LiftedLatticeIsometry D E C C') (a x : FockSpace D C) (n : ℤ) :
    liftedIsometry_fockEquiv f ((latticeMode D C a n) x) =
      (latticeMode E C' (liftedIsometry_fockEquiv f a) n)
        (liftedIsometry_fockEquiv f x) := by
  sorry

/-- All product carriers and cocycle data for an orthogonal sum are explicit. -/
structure OrthogonalSumData {V W : Type u} [AddCommGroup V] [Module ℚ V]
    [AddCommGroup W] [Module ℚ W]
    (D : PositiveEvenLattice V) (E : PositiveEvenLattice W)
    (C : NormalizedSignCocycle D) (C' : NormalizedSignCocycle E) where
  sumLattice : PositiveEvenLattice (V × W)
  sumCocycle : NormalizedSignCocycle sumLattice
  carrierEquiv : sumLattice.lattice.carrier ≃ₗ[ℤ]
    D.lattice.carrier × E.lattice.carrier
  carrierEquiv_val : ∀ x : sumLattice.lattice.carrier,
    (((carrierEquiv x).1 : V), ((carrierEquiv x).2 : W)) = (x : V × W)
  form_split : ∀ x y : V × W,
    sumLattice.lattice.form x y =
      D.lattice.form x.1 y.1 + E.lattice.form x.2 y.2
  cocycle_split : ∀ x y : sumLattice.lattice.carrier,
    sumCocycle.epsilon x y =
      C.epsilon (carrierEquiv x).1 (carrierEquiv y).1 *
        C'.epsilon (carrierEquiv x).2 (carrierEquiv y).2

/-- The product cocycle gives the canonical oscillator and charge-algebra maps. -/
theorem fock_orthogonal_directSum {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    {D : PositiveEvenLattice V} {E : PositiveEvenLattice W}
    {C : NormalizedSignCocycle D} {C' : NormalizedSignCocycle E}
    (S : OrthogonalSumData D E C C') :
    Nonempty (FockSpace S.sumLattice S.sumCocycle ≃ₗ[ℂ]
      FockSpace D C ⊗[ℂ] FockSpace E C') := by
  sorry

/-- Coefficient convolution for the tensor product state-field map. -/
noncomputable def tensorVertexMode {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    : (D : PositiveEvenLattice V) → (E : PositiveEvenLattice W) →
      (C : NormalizedSignCocycle D) → (C' : NormalizedSignCocycle E) →
      (a : FockSpace D C ⊗[ℂ] FockSpace E C') → (n : ℤ) →
      Module.End ℂ (FockSpace D C ⊗[ℂ] FockSpace E C') := by
  sorry

theorem tensorVertexMode_tmul {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    (D : PositiveEvenLattice V) (E : PositiveEvenLattice W)
    (C : NormalizedSignCocycle D) (C' : NormalizedSignCocycle E)
    (a : FockSpace D C) (b : FockSpace E C') (n : ℤ)
    (x : FockSpace D C) (y : FockSpace E C') :
    ∃ N : ℕ,
      tensorVertexMode D E C C' (a ⊗ₜ[ℂ] b) n (x ⊗ₜ[ℂ] y) =
        ∑ i ∈ Finset.Icc (-(N : ℤ)) (N : ℤ),
          ((latticeMode D C a i) x) ⊗ₜ[ℂ]
            ((latticeMode E C' b (n - 1 - i)) y) := by
  sorry

/-- Each tensor coefficient is finitely supported in the convolution index:
the first factor vanishes for sufficiently large indices and the second for
sufficiently negative indices. -/
theorem tensorVertexMode_tmul_support {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    (D : PositiveEvenLattice V) (E : PositiveEvenLattice W)
    (C : NormalizedSignCocycle D) (C' : NormalizedSignCocycle E)
    (a x : FockSpace D C) (b y : FockSpace E C') (n : ℤ) :
    ∃ N : ℕ, ∀ i : ℤ, (i < -(N : ℤ) ∨ (N : ℤ) < i) →
      ((latticeMode D C a i) x) ⊗ₜ[ℂ]
        ((latticeMode E C' b (n - 1 - i)) y) = 0 := by
  sorry

/-- Once the support bound is met, enlarging a symmetric convolution cutoff
does not change the tensor coefficient. -/
theorem tensorVertexMode_tmul_cutoff_independent {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    (D : PositiveEvenLattice V) (E : PositiveEvenLattice W)
    (C : NormalizedSignCocycle D) (C' : NormalizedSignCocycle E)
    (a x : FockSpace D C) (b y : FockSpace E C') (n : ℤ)
    (N M : ℕ) (hNM : N ≤ M)
    (hN : ∀ i : ℤ, (i < -(N : ℤ) ∨ (N : ℤ) < i) →
      ((latticeMode D C a i) x) ⊗ₜ[ℂ]
        ((latticeMode E C' b (n - 1 - i)) y) = 0) :
    (∑ i ∈ Finset.Icc (-(N : ℤ)) (N : ℤ),
      ((latticeMode D C a i) x) ⊗ₜ[ℂ]
        ((latticeMode E C' b (n - 1 - i)) y)) =
    (∑ i ∈ Finset.Icc (-(M : ℤ)) (M : ℤ),
      ((latticeMode D C a i) x) ⊗ₜ[ℂ]
        ((latticeMode E C' b (n - 1 - i)) y)) := by
  sorry

theorem fock_orthogonal_directSum_intertwines_modes {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    {D : PositiveEvenLattice V} {E : PositiveEvenLattice W}
    {C : NormalizedSignCocycle D} {C' : NormalizedSignCocycle E}
    (S : OrthogonalSumData D E C C') :
    ∃ e : FockSpace S.sumLattice S.sumCocycle ≃ₗ[ℂ]
        FockSpace D C ⊗[ℂ] FockSpace E C',
      ∀ a n x, e ((latticeMode S.sumLattice S.sumCocycle a n) x) =
        (tensorVertexMode D E C C' (e a) n) (e x) := by
  sorry

/-- The conformal operators are shifted one place from normalized state modes:
L_m = ω_(m+1). -/
def latticeConformalMode {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (ω : FockSpace D C) (m : ℤ) : Module.End ℂ (FockSpace D C) :=
  latticeMode D C ω (m + 1)

/-- The conformal operators satisfy Virasoro with central charge the lattice
rank. -/
theorem latticeVirasoro_relations {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (B : OrthonormalComplexBasis D) (ω : FockSpace D C)
    (hω : ω = latticeConformalVector D C B) :
    ∀ m n : ℤ,
      ⁅latticeConformalMode D C ω m, latticeConformalMode D C ω n⁆ =
        (m - n : ℂ) • latticeConformalMode D C ω (m + n) +
          (if m + n = 0 then ((Nat.cast (Module.finrank ℤ D.lattice.carrier)) : ℂ) *
            ((m ^ 3 - m) / 12 : ℂ) else 0) • 1 := by
  sorry

/-- The VOA zero product on the weight-one carrier is the (-1)-indexed
coefficient in this coefficient convention. -/
def latticeZeroProduct {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a b : latticeWeightOne D C) : latticeWeightOne D C :=
  ⟨(latticeMode D C (a : FockSpace D C) 0) (b : FockSpace D C), by
    exact VertexFoundations.weightOneZeroProduct_mem
      (latticeGradedVertexAxioms D C) a b⟩

theorem latticeZeroProduct_eq_genericZeroProduct {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (a b : latticeWeightOne D C) :
    latticeZeroProduct D C a b =
      VertexFoundations.weightOneZeroProduct (latticeGradedVertexAxioms D C) a b := by
  apply Subtype.ext
  rfl

theorem latticeZeroProduct_isLie {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    ∃ inst : LieRing (latticeWeightOne D C),
      (letI : LieRing (latticeWeightOne D C) := inst
       ∀ a b, ⁅a, b⁆ = latticeZeroProduct D C a b) := by
  refine ⟨latticeWeightOneLieRing D C, ?_⟩
  intro a b
  exact (latticeZeroProduct_eq_genericZeroProduct D C a b).symm

theorem latticeZeroProduct_jacobi {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (x y z : latticeWeightOne D C) :
    latticeZeroProduct D C x (latticeZeroProduct D C y z) +
      latticeZeroProduct D C y (latticeZeroProduct D C z x) +
        latticeZeroProduct D C z (latticeZeroProduct D C x y) = 0 := by
  change
    VertexFoundations.weightOneZeroProduct (latticeGradedVertexAxioms D C) x
        (VertexFoundations.weightOneZeroProduct (latticeGradedVertexAxioms D C) y z) +
      VertexFoundations.weightOneZeroProduct (latticeGradedVertexAxioms D C) y
        (VertexFoundations.weightOneZeroProduct (latticeGradedVertexAxioms D C) z x) +
      VertexFoundations.weightOneZeroProduct (latticeGradedVertexAxioms D C) z
        (VertexFoundations.weightOneZeroProduct (latticeGradedVertexAxioms D C) x y) = 0
  exact VertexFoundations.weightOneZeroProduct_jacobi (latticeGradedVertexAxioms D C) x y z

theorem signedRootLattice_normTwo_shell {I : Type v} [Fintype I]
    [DecidableEq I] (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) :
    Finite {a : (signedRootLattice D).lattice.carrier //
      (signedRootLattice D).lattice.integralNorm a = 2} := by
  sorry

noncomputable def signedADE_normTwoShellEquiv {I : Type v} [Fintype I]
    [DecidableEq I] : (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) →
    {a : (signedRootLattice D).lattice.carrier //
      (signedRootLattice D).lattice.integralNorm a = 2} ≃
      TauCetiRoadmap.ReductiveGroups.SignedADE.Root D := by
  sorry

noncomputable def signedADECarrierCoordinates {I : Type v} [Fintype I]
    [DecidableEq I] : (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) →
    (TauCetiRoadmap.ReductiveGroups.SignedADE.integralLattice D).carrier ≃ₗ[ℤ]
      TauCetiRoadmap.ReductiveGroups.SignedADE.Lattice I := by
  sorry

noncomputable def signedADEOrderedBasis {I : Type v} [Fintype I]
    [DecidableEq I] : (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) →
    Module.Basis I ℤ (TauCetiRoadmap.ReductiveGroups.SignedADE.integralLattice D).carrier := by
  sorry

/-- The Cartan oscillator state attached to an actual signed-lattice vector. -/
def signedADECartanState {I : Type v} [Fintype I] [DecidableEq I]
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (C : NormalizedSignCocycle (signedRootLattice D))
    (x : (signedRootLattice D).lattice.carrier) :
    latticeWeightOne (signedRootLattice D) C := by
  refine ⟨(SymmetricAlgebra.ι ℂ (OscillatorGenerators _ _)
      (oscillatorGenerator _ 1 (1 ⊗ₜ[ℚ] (x : ℚ ⊗[ℤ]
        TauCetiRoadmap.ReductiveGroups.SignedADE.Lattice I)))) ⊗ₜ[ℂ]
        twistedGroupAlgebraOne _, ?_⟩
  sorry

/-- A norm-two lattice charge vector is the root state selected by the actual
finite norm-two-shell equivalence. -/
def signedADERootState {I : Type v} [Fintype I] [DecidableEq I]
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (C : NormalizedSignCocycle (signedRootLattice D))
    (a : {x : (signedRootLattice D).lattice.carrier //
      (signedRootLattice D).lattice.integralNorm x = 2}) :
    latticeWeightOne (signedRootLattice D) C := by
  refine ⟨chargeState (signedRootLattice D) C a.1, ?_⟩
  sorry

theorem orderedSignCocycle_eq_signedADE {I : Type v} [Fintype I]
    [DecidableEq I] [o : LinearOrder I]
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) :
    ∀ a b,
      (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)).epsilon a b =
        TauCetiRoadmap.ReductiveGroups.SignedADE.epsilon o D
          (signedADECarrierCoordinates D a) (signedADECarrierCoordinates D b) := by
  sorry

/-- Use Mathlib's actual Lie-algebra scalar extension of the signed Lie carrier. -/
abbrev SignedADEComplexification {I : Type v} [Fintype I] [DecidableEq I]
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) :=
  ℂ ⊗[ℤ] TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D

/-- The raw bracket is extended bilinearly from the already-defined integral
`SignedADE.bracket`. This definition does not install or consume a LieRing or
LieAlgebra instance. -/
noncomputable def signedADEComplexBracket {I : Type v} [Fintype I] [DecidableEq I] :
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) →
    (o : LinearOrder I) → SignedADEComplexification D →ₗ[ℂ]
      SignedADEComplexification D →ₗ[ℂ] SignedADEComplexification D := by
  sorry

theorem signedADEComplexBracket_tmul {I : Type v} [Fintype I]
    [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (c d : ℂ) (x y : TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D) :
    signedADEComplexBracket D o (c ⊗ₜ[ℤ] x) (d ⊗ₜ[ℤ] y) =
      (c * d) ⊗ₜ[ℤ]
        TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D x y := by
  sorry

/-- The integral unit map uses the displayed free Cartan/root basis. The
`ℤ`-module carrier is flat, and the algebra map `ℤ → ℂ` is injective; these
are the hypotheses of `Module.Flat.tensorProduct_mk_injective`. This does not
assert that `ℂ` is flat over `ℤ`. -/
def signedADEUnitMap {I : Type v} [Fintype I] [DecidableEq I]
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) :
    TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D →ₗ[ℤ]
      SignedADEComplexification D :=
  TensorProduct.mk ℤ ℂ
    (TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D) (1 : ℂ)

theorem signedADEUnitMap_injective {I : Type v} [Fintype I]
    [DecidableEq I] (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) :
    Function.Injective (signedADEUnitMap D) := by
  letI : Module.Free ℤ (TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D) :=
    Module.Free.of_basis (TauCetiRoadmap.ReductiveGroups.SignedADE.integralBasis D)
  exact Module.Flat.tensorProduct_mk_injective
    (R := ℤ) (S := ℂ)
    (M := TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D)

/-- At ADE input the cocycle is literally the signed target's ordered
`epsilon`; the comparison is first made with its raw zero-mode bracket. -/
theorem ADE_latticeWeightOne_signedRawBracketComparison
    {I : Type v} [Fintype I] [DecidableEq I] [o : LinearOrder I]
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) :
    ∃ Φ : latticeWeightOne (signedRootLattice D)
        (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) →ₗ[ℂ]
        SignedADEComplexification D,
      Function.Bijective Φ ∧
      (∀ x : (signedRootLattice D).lattice.carrier,
        Φ (signedADECartanState D
          (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) x) =
          1 ⊗ₜ[ℤ] TauCetiRoadmap.ReductiveGroups.SignedADE.cartan D
            (signedADECarrierCoordinates D x)) ∧
      (∀ a : {x : (signedRootLattice D).lattice.carrier //
          (signedRootLattice D).lattice.integralNorm x = 2},
        Φ (signedADERootState D
          (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) a) =
          1 ⊗ₜ[ℤ] TauCetiRoadmap.ReductiveGroups.SignedADE.rootVector D
            (signedADE_normTwoShellEquiv D a)) ∧
      ∀ (a b : latticeWeightOne (signedRootLattice D)
          (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D))),
        Φ (latticeZeroProduct (signedRootLattice D)
          (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) a b) =
        signedADEComplexBracket D o (Φ a) (Φ b) := by
  sorry

/-- The native unit map intertwines the actual raw bilinear operations. -/
theorem signedADEUnitMap_bracket {I : Type v} [Fintype I]
    [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (x y : TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D) :
    signedADEUnitMap D (TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D x y) =
      signedADEComplexBracket D o (signedADEUnitMap D x) (signedADEUnitMap D y) := by
  change (1 : ℂ) ⊗ₜ[ℤ] TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D x y =
    signedADEComplexBracket D o ((1 : ℂ) ⊗ₜ[ℤ] x) ((1 : ℂ) ⊗ₜ[ℤ] y)
  simpa only [one_mul] using (signedADEComplexBracket_tmul o D 1 1 x y).symm

/-- Transport through the raw comparison in the OLD weight-one addition,
before installing any Lie instance on the signed carrier. -/
theorem signedADEComplexBracket_jacobi {I : Type v} [Fintype I]
    [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (x y z : SignedADEComplexification D) :
    signedADEComplexBracket D o x (signedADEComplexBracket D o y z) +
      signedADEComplexBracket D o y (signedADEComplexBracket D o z x) +
      signedADEComplexBracket D o z (signedADEComplexBracket D o x y) = 0 := by
  obtain ⟨Φ, hΦ, hCartan, hRoot, hBracket⟩ :=
    ADE_latticeWeightOne_signedRawBracketComparison (o := o) D
  obtain ⟨a, rfl⟩ := hΦ.2 x
  obtain ⟨b, rfl⟩ := hΦ.2 y
  obtain ⟨c, rfl⟩ := hΦ.2 z
  have h := congrArg Φ
    (latticeZeroProduct_jacobi (signedRootLattice D)
      (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) a b c)
  simpa only [map_add, map_zero, hBracket] using h

/-- Descend the complex Jacobi equation to the raw integral bracket using the
injective unit map. No pre-installed signed Lie structure is a premise. -/
theorem signedADERawBracket_jacobi {I : Type v} [Fintype I]
    [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (x y z : TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D) :
    TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D x
      (TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D y z) +
      TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D y
        (TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D z x) +
      TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D z
        (TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D x y) = 0 := by
  apply signedADEUnitMap_injective D
  simpa only [map_add, map_zero, signedADEUnitMap_bracket] using
    signedADEComplexBracket_jacobi o D
      (signedADEUnitMap D x) (signedADEUnitMap D y) (signedADEUnitMap D z)

/-- Extend the very same signed normalization to the complexification by the
native tensor-product base-change equivalence. -/
noncomputable def ADE_normalizationEquivComplex {I : Type v} [Fintype I]
    [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) :
    SignedADEComplexification D ≃ₗ[ℂ] SignedADEComplexification D :=
  LinearEquiv.baseChange ℤ ℂ
    (TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D)
    (TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D)
    (TauCetiRoadmap.ReductiveGroups.SignedADE.normalizationEquiv o D)

theorem ADE_normalizationEquivComplex_tmul {I : Type v} [Fintype I]
    [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (c : ℂ) (x : TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D) :
    ADE_normalizationEquivComplex o D (c ⊗ₜ[ℤ] x) =
      c ⊗ₜ[ℤ] TauCetiRoadmap.ReductiveGroups.SignedADE.normalizationEquiv o D x := by
  simp [ADE_normalizationEquivComplex]

theorem ADE_normalizationEquivComplex_symm_tmul {I : Type v} [Fintype I]
    [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (c : ℂ) (x : TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D) :
    (ADE_normalizationEquivComplex o D).symm (c ⊗ₜ[ℤ] x) =
      c ⊗ₜ[ℤ] (TauCetiRoadmap.ReductiveGroups.SignedADE.normalizationEquiv o D).symm x := by
  simp [ADE_normalizationEquivComplex]

/-- The normalized complex bracket transports both inputs and the output by
the same complexified diagonal equivalence. -/
noncomputable def ADE_normalizedComplexBracket {I : Type v} [Fintype I]
    [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (x y : SignedADEComplexification D) : SignedADEComplexification D :=
  ADE_normalizationEquivComplex o D
    (signedADEComplexBracket D o
      ((ADE_normalizationEquivComplex o D).symm x)
      ((ADE_normalizationEquivComplex o D).symm y))

theorem ADE_normalizedComplexBracket_transport {I : Type v}
    [Fintype I] [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (x y : SignedADEComplexification D) :
    ADE_normalizationEquivComplex o D (signedADEComplexBracket D o x y) =
      ADE_normalizedComplexBracket o D
        (ADE_normalizationEquivComplex o D x)
        (ADE_normalizationEquivComplex o D y) := by
  simp [ADE_normalizedComplexBracket]

/-- Compose the raw comparison with the same scalar-extended normalization. -/
noncomputable def ADE_composeNormalization {I : Type v} [Fintype I]
    [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    {W : Type w} [AddCommMonoid W] [Module ℂ W]
    (Φ : W →ₗ[ℂ] SignedADEComplexification D) :
    W →ₗ[ℂ] SignedADEComplexification D :=
  (ADE_normalizationEquivComplex o D).toLinearMap.comp Φ

/-- The normalized comparison is literally the complexified diagonal map
composed with a raw comparison. Both input arguments and output bracket are
transported by this same equivalence. -/
theorem ADE_normalizedComparison {I : Type v} [Fintype I] [DecidableEq I]
    [o : LinearOrder I] (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I) :
    ∃ Φraw : latticeWeightOne (signedRootLattice D)
        (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) →ₗ[ℂ]
        SignedADEComplexification D,
      Function.Bijective Φraw ∧
      (∀ x y, Φraw (latticeZeroProduct (signedRootLattice D)
        (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) x y) =
        signedADEComplexBracket D o (Φraw x) (Φraw y)) ∧
      (∀ x, Φraw (signedADECartanState D
        (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) x) =
        1 ⊗ₜ[ℤ] TauCetiRoadmap.ReductiveGroups.SignedADE.cartan D
          (signedADECarrierCoordinates D x)) ∧
      (∀ a : {x : (signedRootLattice D).lattice.carrier //
          (signedRootLattice D).lattice.integralNorm x = 2},
        Φraw (signedADERootState D
          (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) a) =
        1 ⊗ₜ[ℤ] TauCetiRoadmap.ReductiveGroups.SignedADE.rootVector D
          (signedADE_normTwoShellEquiv D a)) ∧
      Function.Bijective (ADE_composeNormalization o D Φraw) ∧
      (∀ x y, ADE_composeNormalization o D Φraw
          (latticeZeroProduct (signedRootLattice D)
            (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) x y) =
        ADE_normalizedComplexBracket o D
          (ADE_composeNormalization o D Φraw x)
          (ADE_composeNormalization o D Φraw y)) ∧
      (∀ x, ADE_composeNormalization o D Φraw
        (signedADECartanState D
          (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) x) =
        ADE_normalizationEquivComplex o D
          (1 ⊗ₜ[ℤ] TauCetiRoadmap.ReductiveGroups.SignedADE.cartan D
            (signedADECarrierCoordinates D x))) ∧
      (∀ a : {x : (signedRootLattice D).lattice.carrier //
          (signedRootLattice D).lattice.integralNorm x = 2},
        ADE_composeNormalization o D Φraw
          (signedADERootState D
            (orderedSignCocycle (signedRootLattice D) (signedADEOrderedBasis D)) a) =
        ADE_normalizationEquivComplex o D
          (1 ⊗ₜ[ℤ] TauCetiRoadmap.ReductiveGroups.SignedADE.rootVector D
            (signedADE_normTwoShellEquiv D a))) := by
  sorry

/-- The normalization is a basis change. Its transported bracket is defined
on both sides by that same equivalence, rather than by a one-sided rescaling. -/
noncomputable def ADE_normalizedBracket {I : Type v} [Fintype I]
    [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (x y : TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D) :
    TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D :=
  TauCetiRoadmap.ReductiveGroups.SignedADE.normalizationEquiv o D
    (TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D
      ((TauCetiRoadmap.ReductiveGroups.SignedADE.normalizationEquiv o D).symm x)
      ((TauCetiRoadmap.ReductiveGroups.SignedADE.normalizationEquiv o D).symm y))

theorem ADE_normalizedBracket_transport
    {I : Type v} [Fintype I] [DecidableEq I] (o : LinearOrder I)
    (D : TauCetiRoadmap.ReductiveGroups.SignedADE.Datum I)
    (x y : TauCetiRoadmap.ReductiveGroups.SignedADE.Carrier D) :
    TauCetiRoadmap.ReductiveGroups.SignedADE.normalizationEquiv o D
      (TauCetiRoadmap.ReductiveGroups.SignedADE.bracket o D x y) =
        ADE_normalizedBracket o D
          ((TauCetiRoadmap.ReductiveGroups.SignedADE.normalizationEquiv o D) x)
          ((TauCetiRoadmap.ReductiveGroups.SignedADE.normalizationEquiv o D) y) := by
  simp [ADE_normalizedBracket]

end LatticeVOA


end TauCetiRoadmap.AffineLieAlgebras
