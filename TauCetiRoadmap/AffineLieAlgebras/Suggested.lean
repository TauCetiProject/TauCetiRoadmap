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
import TauCeti.Algebra.Lie.UniversalEnveloping.Basic
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Injective
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Embedding

/-!
These are suggested forms, not an exhaustive checklist. The README is the
 definitive specification. Proof placeholders denote targets, not implemented
 mathematics. Native polynomial loops, cochains, enveloping algebras, PBW,
 left-module quotients and heterogeneous vertex operators are consumed directly.
  Full vertex laws are targets of README A6. The README's final oper
  isomorphism consumes FormalConnectionsOpers' function-algebra/DS suppliers.
  These illustrative signatures retain the native current, module, Sugawara
  and loop interfaces; that complete oper comparison is specified in the README.
-/

noncomputable section
open scoped TensorProduct
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

end TauCetiRoadmap.AffineLieAlgebras
