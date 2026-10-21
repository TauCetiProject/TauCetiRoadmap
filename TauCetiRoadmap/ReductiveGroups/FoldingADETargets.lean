import TauCetiRoadmap.ReductiveGroups.SignedADETargets
import TauCeti.Algebra.Lie.Presentation.Serre.Automorphism
import TauCeti.LinearAlgebra.RootSystem.GeckConstruction.Symmetry
import TauCeti.LinearAlgebra.RootSystem.DiagramPermutations
import Mathlib.LinearAlgebra.FixedSubmodule
import Mathlib.Algebra.Lie.BaseChange
import Mathlib.Algebra.Lie.Classical
import Mathlib.Algebra.Group.Subgroup.ZPowers.Basic
import Mathlib.GroupTheory.GroupAction.Basic
import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs

/-!
# Fixed Lie algebras and signed ADE folding: target forms for RG9A.1b

**This file is not the roadmap and is not exhaustive.** README.md is definitive.
These declarations suggest native interfaces. Defined finite sums and maps retain
the actual diagram, order and action. Admitted laws, spanning and comparisons
are construction targets, not implemented proofs. In particular the integral
fixed basis and a normalized rational folded frame are different objects.
-/

noncomputable section
open scoped TensorProduct
namespace TauCetiRoadmap.ReductiveGroups.FoldingADE

universe u v w

section FixedLie
variable (R : Type u) (L : Type v) [CommRing R] [LieRing L] [LieAlgebra R L]

/-- Native fixed submodule with its single additional bracket-closure field. -/
def fixedLieSubalgebra (φ : L ≃ₗ⁅R⁆ L) : LieSubalgebra R L where
  toSubmodule := φ.toLinearMap.fixedSubmodule
  lie_mem' := by
    intro x y hx hy
    change φ ⁅x, y⁆ = ⁅x, y⁆
    change φ x = x at hx
    change φ y = y at hy
    rw [φ.map_lie, hx, hy]

@[simp] theorem mem_fixedLieSubalgebra (φ : L ≃ₗ⁅R⁆ L) (x : L) :
    x ∈ fixedLieSubalgebra R L φ ↔ φ x = x := Iff.rfl

theorem fixedLieSubalgebra_toSubmodule (φ : L ≃ₗ⁅R⁆ L) :
    (fixedLieSubalgebra R L φ).toSubmodule =
      LinearMap.ker (φ.toLinearMap - LinearMap.id) :=
  LinearMap.fixedSubmodule_eq_ker φ.toLinearMap

/-- Restrict an actual intertwining homomorphism, including native pinning comparisons. -/
def mapFixed {M : Type w} [LieRing M] [LieAlgebra R M]
    (φ : L ≃ₗ⁅R⁆ L) (ψ : M ≃ₗ⁅R⁆ M) (f : L →ₗ⁅R⁆ M)
    (hf : ∀ x, f (φ x) = ψ (f x)) :
    fixedLieSubalgebra R L φ →ₗ⁅R⁆ fixedLieSubalgebra R M ψ where
  toFun x := ⟨f x.val, by
    change ψ (f x.val) = f x.val
    rw [← hf]
    exact congrArg f x.property⟩
  map_add' := by intro x y; apply Subtype.ext; exact f.map_add x.val y.val
  map_smul' := by intro t x; apply Subtype.ext; exact f.toLinearMap.map_smul t x.val
  map_lie' := by intro x y; apply Subtype.ext; exact f.map_lie x.val y.val
end FixedLie

open SignedADE
variable {I : Type u} [Fintype I] [DecidableEq I]

/-- Forward permutation of simple-root coordinates. -/
def permQ (σ : Equiv.Perm I) : SignedADE.Lattice I ≃ₗ[ℤ] SignedADE.Lattice I :=
  LinearEquiv.funCongrLeft ℤ ℤ σ.symm

theorem pairing_perm (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (a b : SignedADE.Lattice I) :
    pairing D (permQ σ a) (permQ σ b) = pairing D a b := by sorry

/-- Actual root-index equivalence, not an unsigned action on root vectors. -/
def rootAction (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) : Equiv.Perm (Root D) where
  toFun a := ⟨permQ σ a.val, by rw [pairing_perm D σ hσ]; exact a.property⟩
  invFun a := ⟨permQ σ.symm a.val, by
    rw [pairing_perm D σ.symm (TauCeti.submatrix_perm_symm hσ)]
    exact a.property⟩
  left_inv := by sorry
  right_inv := by sorry

/-- Exactly the bond edges whose order is reversed by σ contribute. -/
def reversalExponent (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (a : SignedADE.Lattice I) : ℤ := by
  letI := o
  exact ∑ i, ∑ j, if i < j ∧ σ j < σ i then (-D.gram i j) * a i * a j else 0

def actionSign (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (a : SignedADE.Lattice I) : ℤˣ := (-1 : ℤˣ) ^ reversalExponent o D σ a

theorem epsilon_action (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (a b : SignedADE.Lattice I) :
    epsilon o D a b * actionSign o D σ (a+b) =
      actionSign o D σ a * actionSign o D σ b *
        epsilon o D (permQ σ a) (permQ σ b) := by sorry

def coverLift (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (e : Cover o D) : Cover o D :=
  ⟨permQ σ e.lattice, e.sign * actionSign o D σ e.lattice⟩

theorem coverLift_mul (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (e f : Cover o D) :
    coverLift o D σ (e*f) = coverLift o D σ e * coverLift o D σ f := by sorry

theorem coverLift_simple (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I) (i : I) :
    coverLift o D σ (sectionLift o D (Pi.single i 1)) =
      sectionLift o D (Pi.single (σ i) 1) := by sorry

theorem coverLift_comp (o : LinearOrder I) (D : Datum I) (σ τ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram)
    (hτ : D.gram.submatrix τ τ = D.gram) (e : Cover o D) :
    coverLift o D σ (coverLift o D τ e) = coverLift o D (σ * τ) e := by sorry

theorem coverLift_iterate (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (k : ℕ) (hk : σ^k = 1) :
    (coverLift o D σ)^[k] = id := by sorry

/-- Defined signed forward action on the actual integral carrier. -/
def signedLinearMap (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) : Carrier D →ₗ[ℤ] Carrier D where
  toFun z := (permQ σ z.1, z.2.sum fun a n =>
    Finsupp.single (rootAction D σ hσ a) (n * (actionSign o D σ a.val : ℤ)))
  map_add' := by sorry
  map_smul' := by sorry

def signedLinearEquiv (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) : Carrier D ≃ₗ[ℤ] Carrier D :=
  { signedLinearMap o D σ hσ with
    invFun := signedLinearMap o D σ.symm (TauCeti.submatrix_perm_symm hσ)
    left_inv := by sorry
    right_inv := by sorry }

theorem signedLinearMap_root (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (a : Root D) :
    signedLinearMap o D σ hσ (rootVector D a) =
      (actionSign o D σ a.val : ℤ) • rootVector D (rootAction D σ hσ a) := by sorry

theorem signedLinearMap_bracket (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (x y : Carrier D) :
    signedLinearMap o D σ hσ (bracket o D x y) =
      bracket o D (signedLinearMap o D σ hσ x) (signedLinearMap o D σ hσ y) := by sorry

def signedLieEquiv (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) :
    letI := lieRing o D
    letI := lieAlgebra o D
    Carrier D ≃ₗ⁅ℤ⁆ Carrier D := by
  letI := lieRing o D
  letI := lieAlgebra o D
  exact { signedLinearEquiv o D σ hσ with
    map_lie' := by intro x y; exact signedLinearMap_bracket o D σ hσ x y }

theorem signedLinearMap_iterate (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (k : ℕ) (hk : σ^k = 1) :
    (signedLinearMap o D σ hσ : Carrier D → Carrier D)^[k] = id := by sorry

abbrev VertexOrbit (σ : Equiv.Perm I) :=
  MulAction.orbitRel.Quotient (Subgroup.zpowers σ) I

def orbitVertices (σ : Equiv.Perm I) (O : VertexOrbit σ) : Finset I :=
  (Set.toFinite O.orbit).toFinset

abbrev RootOrbit (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) :=
  MulAction.orbitRel.Quotient (Subgroup.zpowers (rootAction D σ hσ)) (Root D)

def cycleCoefficient (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (a : Root D) (r : ℕ) : ℤˣ :=
  ∏ j ∈ Finset.range r, actionSign o D σ (((rootAction D σ hσ)^[j]) a).val

theorem cycleCoefficient_succ (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (a : Root D) (r : ℕ) :
    cycleCoefficient o D σ hσ a (r+1) = cycleCoefficient o D σ hσ a r *
      actionSign o D σ (((rootAction D σ hσ)^[r]) a).val := by sorry

def monodromy (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (C : RootOrbit D σ hσ) : ℤˣ :=
  cycleCoefficient o D σ hσ C.out (Nat.card C.orbit)

def orbitRootVector (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (C : RootOrbit D σ hσ) : Carrier D :=
  ∑ r ∈ Finset.range (Nat.card C.orbit),
    (cycleCoefficient o D σ hσ C.out r : ℤ) • rootVector D (((rootAction D σ hσ)^[r]) C.out)

/-- All data-bearing inputs are inside this admitted whole function family. -/
def fixedIntegralBasis : {I : Type u} → [Fintype I] → [DecidableEq I] →
    (o : LinearOrder I) → (D : Datum I) → (σ : Equiv.Perm I) →
    (hσ : D.gram.submatrix σ σ = D.gram) →
    Module.Basis (VertexOrbit σ ⊕ {C : RootOrbit D σ hσ // monodromy o D σ hσ C = 1}) ℤ
      (signedLinearMap o D σ hσ).fixedSubmodule := by sorry

theorem fixedIntegralBasis_cartan (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (O : VertexOrbit σ) :
    (fixedIntegralBasis o D σ hσ (Sum.inl O) : Carrier D) =
      ∑ i ∈ orbitVertices σ O, cartan D (Pi.single i 1) := by sorry

theorem fixedIntegralBasis_root (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (C : RootOrbit D σ hσ)
    (hC : monodromy o D σ hσ C = 1) :
    (fixedIntegralBasis o D σ hσ (Sum.inr ⟨C,hC⟩) : Carrier D) =
      orbitRootVector o D σ hσ C := by sorry

/-- A generic signed permutation module, using its actual native fixed submodule. -/
def signedPermutation {J : Type v} [Fintype J] (A : Type w) [CommRing A]
    (ρ : Equiv.Perm J) (s : J → ℤˣ) : (J → A) →ₗ[A] (J → A) where
  toFun f j := ((s (ρ.symm j) : ℤ) : A) * f (ρ.symm j)
  map_add' := by intros; ext; simp [mul_add]
  map_smul' := by intros; ext; simp [mul_left_comm]

theorem signedPermutation_fixed_iff {J : Type v} [Fintype J]
    (A : Type w) [CommRing A] (ρ : Equiv.Perm J) (s : J → ℤˣ) (f : J → A) :
    f ∈ (signedPermutation A ρ s).fixedSubmodule ↔
      ∀ j, f (ρ j) = ((s j : ℤ) : A) * f j := by sorry

def cycleDefect {J : Type v} [Fintype J] (A : Type w) [CommRing A]
    (s : J → ℤˣ) : A := ((((∏ j, s j) : ℤˣ) : ℤ) : A) - 1

/-- For one actual orbit, evaluation at j₀ identifies fixed tuples with its monodromy kernel. -/
def signedCycleEquiv : {J : Type v} → [Fintype J] →
    (A : Type w) → [CommRing A] → (ρ : Equiv.Perm J) → (s : J → ℤˣ) →
    (j₀ : J) → (htrans : ∀ j, ∃ r : ℕ, (ρ^[r]) j₀ = j) →
    (signedPermutation A ρ s).fixedSubmodule ≃ₗ[A]
      LinearMap.ker (cycleDefect A s • (LinearMap.id : A →ₗ[A] A)) := by sorry

theorem signedCycleEquiv_eval {J : Type v} [Fintype J]
    (A : Type w) [CommRing A] (ρ : Equiv.Perm J) (s : J → ℤˣ)
    (j₀ : J) (htrans : ∀ j, ∃ r : ℕ, (ρ^[r]) j₀ = j)
    (f : (signedPermutation A ρ s).fixedSubmodule) :
    (signedCycleEquiv A ρ s j₀ htrans f : A) = f.val j₀ := by sorry

def orbitD (D : Datum I) (σ : Equiv.Perm I) (O : VertexOrbit σ) : ℤ :=
  ∑ j ∈ orbitVertices σ O, D.gram j O.out

def orbitFactor (D : Datum I) (σ : Equiv.Perm I) (O : VertexOrbit σ) : ℤ :=
  if orbitD D σ O = 2 then 1 else 2

def foldedCartan (D : Datum I) (σ : Equiv.Perm I) : Matrix (VertexOrbit σ) (VertexOrbit σ) ℤ :=
  fun O P => orbitFactor D σ O * ∑ i ∈ orbitVertices σ O, D.gram i P.out

theorem orbitD_eq_one_or_two (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (O : VertexOrbit σ) :
    orbitD D σ O = 1 ∨ orbitD D σ O = 2 := by sorry

def simpleRoot (D : Datum I) (i : I) : Root D := ⟨Pi.single i 1, by sorry⟩

def foldedH (D : Datum I) (σ : Equiv.Perm I) (O : VertexOrbit σ) : Carrier D :=
  orbitFactor D σ O • ∑ i ∈ orbitVertices σ O, cartan D (Pi.single i 1)

def foldedE (D : Datum I) (σ : Equiv.Perm I) (O : VertexOrbit σ) : Carrier D :=
  ∑ i ∈ orbitVertices σ O, rootVector D (simpleRoot D i)

def foldedF (D : Datum I) (σ : Equiv.Perm I) (O : VertexOrbit σ) : Carrier D :=
  orbitFactor D σ O • ∑ i ∈ orbitVertices σ O, rootVector D (negRoot D (simpleRoot D i))

theorem folded_HE (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (O P : VertexOrbit σ) :
    bracket o D (foldedH D σ O) (foldedE D σ P) =
      foldedCartan D σ O P • foldedE D σ P := by sorry

section Rational
variable [o : LinearOrder I] (D : Datum I)
local instance : LieRing (Carrier D) := lieRing o D
local instance : LieAlgebra ℤ (Carrier D) := lieAlgebra o D

def rationalLieEquiv (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    (ℚ ⊗[ℤ] Carrier D) ≃ₗ⁅ℚ⁆ (ℚ ⊗[ℤ] Carrier D) :=
  { (signedLinearEquiv o D σ hσ).baseChange ℤ ℚ (Carrier D) (Carrier D) with
    map_lie' := by sorry }

abbrev FixedQ (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :=
  ↥(fixedLieSubalgebra ℚ (ℚ ⊗[ℤ] Carrier D) (rationalLieEquiv (o := o) D σ hσ))

def fixedH (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) : FixedQ (o := o) D σ hσ := ⟨1 ⊗ₜ[ℤ] foldedH D σ O, by sorry⟩
def fixedE (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) : FixedQ (o := o) D σ hσ := ⟨1 ⊗ₜ[ℤ] foldedE D σ O, by sorry⟩
def fixedF (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) : FixedQ (o := o) D σ hσ := ⟨1 ⊗ₜ[ℤ] foldedF D σ O, by sorry⟩

local instance (σ : Equiv.Perm I) : DecidableEq (VertexOrbit σ) := Classical.decEq _

theorem foldedSystem (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    TauCeti.IsSerreSystem ℚ (foldedCartan D σ)
      (fixedH (o := o) D σ hσ) (fixedE (o := o) D σ hσ) (fixedF (o := o) D σ hσ) := by sorry

/-- Actual native universal map from the established generator system. -/
def foldedMap (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    Matrix.ToLieAlgebra ℚ (foldedCartan D σ) →ₗ⁅ℚ⁆ FixedQ (o := o) D σ hσ :=
  TauCeti.serreLift (foldedSystem (o := o) D σ hσ)

theorem foldedMap_E (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) :
    foldedMap (o := o) D σ hσ (TauCeti.serreE ℚ (foldedCartan D σ) O) = fixedE (o := o) D σ hσ O :=
  TauCeti.serreLift_serreE (foldedSystem (o := o) D σ hσ) O

theorem foldedMap_H (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) :
    foldedMap (o := o) D σ hσ (TauCeti.serreH ℚ (foldedCartan D σ) O) = fixedH (o := o) D σ hσ O :=
  TauCeti.serreLift_serreH (foldedSystem (o := o) D σ hσ) O

theorem foldedMap_F (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram)
    (O : VertexOrbit σ) :
    foldedMap (o := o) D σ hσ (TauCeti.serreF ℚ (foldedCartan D σ) O) = fixedF (o := o) D σ hσ O :=
  TauCeti.serreLift_serreF (foldedSystem (o := o) D σ hσ) O

/-- Uniform matrix and exceptional exact-word certificates are required by this target. -/
theorem foldedMap_surjective (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    Function.Surjective (foldedMap (o := o) D σ hσ) := by sorry

/-- Uses constructed Cartan/Killing/triangular/simple components and LHW7, not surjectivity alone. -/
theorem foldedMap_injective (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    Function.Injective (foldedMap (o := o) D σ hσ) := by sorry

def foldedEquiv (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) :
    Matrix.ToLieAlgebra ℚ (foldedCartan D σ) ≃ₗ⁅ℚ⁆ FixedQ (o := o) D σ hσ :=
  LieEquiv.ofBijective (foldedMap (o := o) D σ hσ)
    ⟨foldedMap_injective (o := o) D σ hσ, foldedMap_surjective (o := o) D σ hσ⟩
end Rational

section FullCartan
variable {Y : Type v} [AddCommGroup Y] [Module ℤ Y]

def fixedCartan (γY : Y ≃ₗ[ℤ] Y) : Submodule ℤ Y := γY.toLinearMap.fixedSubmodule

theorem fixedCartan_eq_kernel (γY : Y ≃ₗ[ℤ] Y) :
    fixedCartan γY = LinearMap.ker (γY.toLinearMap - LinearMap.id) :=
  LinearMap.fixedSubmodule_eq_ker γY.toLinearMap

/-- Defined full action; the bracket's pairing/coroot data occurs in the covariance theorem. -/
def fullAction (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (γY : Y ≃ₗ[ℤ] Y) :
    FullCarrier D Y →ₗ[ℤ] FullCarrier D Y where
  toFun z := (γY z.1, z.2.sum fun a n =>
    Finsupp.single (rootAction D σ hσ a) (n * (actionSign o D σ a.val : ℤ)))
  map_add' := by sorry
  map_smul' := by sorry

theorem fullAction_bracket (o : LinearOrder I) (D : Datum I) (C : FullCartanData D Y)
    (σ : Equiv.Perm I) (hσ : D.gram.submatrix σ σ = D.gram) (γY : Y ≃ₗ[ℤ] Y)
    (hc : ∀ a, γY (C.coroot a) = C.coroot (permQ σ a))
    (hw : ∀ a y, C.rootWeight (permQ σ a) (γY y) = C.rootWeight a y)
    (x y : FullCarrier D Y) :
    fullAction o D σ hσ γY (fullBracket o D C x y) =
      fullBracket o D C (fullAction o D σ hσ γY x) (fullAction o D σ hσ γY y) := by sorry

theorem fullAction_iterate (o : LinearOrder I) (D : Datum I) (σ : Equiv.Perm I)
    (hσ : D.gram.submatrix σ σ = D.gram) (γY : Y ≃ₗ[ℤ] Y)
    (k : ℕ) (hQ : σ^k = 1) (hY : (γY : Y → Y)^[k] = id) :
    (fullAction o D σ hσ γY : FullCarrier D Y → FullCarrier D Y)^[k] = id := by sorry
end FullCartan

/-- Singular maps included; the diagonal is not claimed canonically ordered. -/
theorem exists_map_diagonalization (n : ℕ) (S : Matrix (Fin n) (Fin n) ℤ) :
    ∃ (U V : Matrix.GeneralLinearGroup (Fin n) ℤ) (d : Fin n → ℤ),
      (U : Matrix _ _ ℤ) * S * (V : Matrix _ _ ℤ) = Matrix.diagonal d := by sorry

/-- All zero diagonal positions remain present; no ordered invariant-factor claim is assumed. -/
def smithKernelEquiv : (A : Type v) → [CommRing A] → (n : ℕ) →
    (S : Matrix (Fin n) (Fin n) ℤ) →
    (U V : Matrix.GeneralLinearGroup (Fin n) ℤ) → (d : Fin n → ℤ) →
    (h : (U : Matrix _ _ ℤ) * S * (V : Matrix _ _ ℤ) = Matrix.diagonal d) →
    LinearMap.ker (S.map (Int.castRingHom A)).mulVecLin ≃ₗ[A]
      ((i : Fin n) → LinearMap.ker ((d i : A) • (LinearMap.id : A →ₗ[A] A))) := by sorry

theorem smithKernelEquiv_reconstruct (A : Type v) [CommRing A] (n : ℕ)
    (S : Matrix (Fin n) (Fin n) ℤ) (U V : Matrix.GeneralLinearGroup (Fin n) ℤ)
    (d : Fin n → ℤ) (h : (U : Matrix _ _ ℤ) * S * (V : Matrix _ _ ℤ) = Matrix.diagonal d)
    (x : LinearMap.ker (S.map (Int.castRingHom A)).mulVecLin) :
    Matrix.mulVec ((V : Matrix (Fin n) (Fin n) ℤ).map (Int.castRingHom A))
      (fun i => (smithKernelEquiv A n S U V d h x i : A)) = x.val := by sorry

end TauCetiRoadmap.ReductiveGroups.FoldingADE
