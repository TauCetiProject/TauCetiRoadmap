import Mathlib
import TauCeti.RepresentationTheory.ClassicalGroups.Rational
import TauCeti.Geometry.Lie.Exponential.Units.Basic
import TauCeti.RepresentationTheory.ClassicalGroups.WeylModule.Rational
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.BlockSucc
import TauCeti.RepresentationTheory.ClassicalGroups.GelfandTsetlin.Basic
import TauCeti.RepresentationTheory.ClassicalGroups.WeylDimension.Basic
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Basic

/-!
# Finite-dimensional representations of the classical groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, with admissions for their proofs.

The headlines are rational complete reducibility and unique GL classification;
the Schur-module isomorphism; representation-level GL branching; SO/Sp rational classification and character formulas; normalized
GL/SO/Sp GT bases and their operator formulas; and diagonal-overgroup classification
with restriction of external tensor products. The tensor-square isomorphism
and signed-pattern count are consumed from the native declarations listed in
README.md. The full Schur-character and rational Weyl-dimension comparisons
are acceptance theorems here.

The normalized GT basis and Capelli-action theorems cannot yet be stated on the
specified operators: the pins lack the differentiated action on the rational Weyl
models and the source-normalized lowering construction. The SO/Sp classification,
character and branching statements lack their rational highest-weight models and
the comparison from group differentiation to the abstract Lie modules; the
symplectic multiplicity basis additionally lacks the Mickelsson operators on those
models. The generic rational group/Lie bridge lacks the compatible bundled
rational-action/differentiation interface. These constructions remain README
targets; no unspecified representation, vector or endomorphism replaces them.
The tensor-multiplicity theorem of Layer 4 is stated on the native Schur images
and Schur polynomials: the multiplicity of a Schur module in a tensor product of
two Schur modules is the coefficient of its Schur polynomial in the product of
theirs; the tableau formula for that coefficient is not stated here.
-/

namespace TauCetiRoadmap.RepresentationTheory.ClassicalGroups

open Matrix CategoryTheory
open scoped TensorProduct

universe u

/-! ## Layer 0: rational representations -/

/-- Every finite-dimensional rational complex GL representation is semisimple. -/
theorem rationalRep_isSemisimple {n : ℕ} {W : Type u} [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (ρ : Representation ℂ (GL (Fin n) ℂ) W)
    (h : TauCeti.IsRationalRep ρ) :
    IsSemisimpleModule (MonoidAlgebra ℂ (GL (Fin n) ℂ)) ρ.asModule := sorry

/-! ## Layer 3: highest-weight classification -/

/-- Every simple rational GL module has exactly one dominant integer highest weight,
including all integer characters in rank one and the empty weight in rank zero. -/
theorem rational_irreducible_classification (n : ℕ) (W : FDRep ℂ (GL (Fin n) ℂ))
    [Simple W] (hW : TauCeti.IsRationalRep W.ρ) :
    ∃! l : TauCeti.DominantWeight n, Nonempty (W ≅ TauCeti.rationalWeylFDRep ℂ n l) := sorry

/-- A Schur module of admissible height is the rational Weyl module of its row weight. -/
theorem schurFunctor_iso_irreducible (n : ℕ) (μ : YoungDiagram) (hμ : μ.colLen 0 ≤ n) :
    Nonempty (TauCeti.schurFunctor n μ ≅
      TauCeti.rationalWeylFDRep ℂ n (TauCeti.weightOfShape n μ)) := sorry

/-! ## Layer 4: characters and Schur polynomials -/

/-- The character of every Schur image on the diagonal torus is its Schur
polynomial, including shapes taller than the dimension, when both sides vanish. -/
theorem schur_character (n : ℕ) (μ : YoungDiagram) (t : Fin n → ℂˣ) :
    (TauCeti.schurFunctor n μ).character (TauCeti.diagGL t) =
      MvPolynomial.eval (fun i => (t i : ℂ))
        (TauCeti.diagramSchurPoly n ℂ μ) := sorry

section TensorMultiplicity
open scoped MonoidalCategory

/-- The multiplicity of the Schur module of shape ν in the tensor product of the Schur
modules of shapes λ and μ is the coefficient of its Schur polynomial in the expansion of
the product of theirs over shapes of height at most n. Shapes taller than n have zero
Schur polynomial and zero Schur module, so the support bound makes the coefficients
unique; the hypothesis fixes them without choosing a formula for them. -/
theorem schurFunctor_tensor_multiplicity (n : ℕ) (l m : YoungDiagram)
    (c : YoungDiagram →₀ ℕ) (hsupp : ∀ ν ∈ c.support, ν.colLen 0 ≤ n)
    (hc : TauCeti.diagramSchurPoly n ℂ l * TauCeti.diagramSchurPoly n ℂ m =
      c.sum (fun ν k => (k : ℂ) • TauCeti.diagramSchurPoly n ℂ ν))
    (ν : YoungDiagram) :
    Module.finrank ℂ
      (TauCeti.schurFunctor n ν ⟶ TauCeti.schurFunctor n l ⊗ TauCeti.schurFunctor n m) =
      c ν := sorry

end TensorMultiplicity

/-! ## Layer 5: the Weyl dimension formula -/

/-- Every rational Weyl module has the Weyl product dimension, for all dominant
integer weights; common determinant shifts leave this dimension unchanged. -/
theorem rational_dimension (n : ℕ) (l : TauCeti.DominantWeight n) :
    Module.finrank ℂ (TauCeti.rationalWeylFDRep ℂ n l) =
      TauCeti.weylDimension l := sorry

/-! ## Layer 6: branching and Gelfand–Tsetlin dimensions -/

/-- Restriction along the upper-left block is the direct sum of all interlacing
rational Weyl modules, each once, including negative determinant weights. -/
theorem rationalWeyl_branching (n : ℕ) (l : TauCeti.DominantWeight (n + 1)) :
    Nonempty (Representation.Equiv
      ((TauCeti.rationalWeylFDRep ℂ (n + 1) l).ρ.comp (TauCeti.glBlockSucc ℂ n))
      (Representation.directSum
        (fun m : {m : TauCeti.DominantWeight n // TauCeti.Interlaces l.1 m.1} =>
          (TauCeti.rationalWeylFDRep ℂ n m.1).ρ))) := sorry

/-! ## Layer 6A: diagonal overgroups and restriction -/

namespace DiagonalOvergroups
open scoped Matrix.Norms.Operator
attribute [local instance] TauCeti.normedAlgebraRatOfReal

/-- The complex general linear group in rank n. -/
abbrev G (n : ℕ) := Matrix.GeneralLinearGroup (Fin n) ℂ

/-- The product of two copies of the complex general linear group. -/
abbrev P (n : ℕ) := G n × G n

/-- The diagonal homomorphism g ↦ (g,g). -/
def diagonalMap (n : ℕ) : G n →* P n :=
  (MonoidHom.id (G n)).prod (MonoidHom.id (G n))

/-- The diagonal subgroup, the image of the diagonal homomorphism. -/
def diagonal (n : ℕ) : Subgroup (P n) := (diagonalMap n).range

/-- The determinant ratio (g,h) ↦ det(g)/det(h). -/
def determinantRatio (n : ℕ) : P n →* ℂˣ where
  toFun p := Matrix.GeneralLinearGroup.det p.1 / Matrix.GeneralLinearGroup.det p.2
  map_one' := by simp
  map_mul' x y := by simp [div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm]

/-- The subgroup of pairs with equal determinant. -/
def determinantEqual (n : ℕ) : Subgroup (P n) := (determinantRatio n).ker

/-- The homomorphism (g,u) ↦ (u g,g), using the central scalar action. -/
def scalarDiagonalMap (n : ℕ) : (G n × ℂˣ) →* P n where
  toFun p := (Matrix.GeneralLinearGroup.scalar (Fin n) p.2 * p.1, p.1)
  map_one' := by simp
  map_mul' := by
    intro x y
    apply Prod.ext
    · change Matrix.GeneralLinearGroup.scalar (Fin n) (x.2*y.2) * (x.1*y.1) =
        (Matrix.GeneralLinearGroup.scalar (Fin n) x.2 * x.1) *
          (Matrix.GeneralLinearGroup.scalar (Fin n) y.2 * y.1)
      rw [map_mul]
      calc
        _ = Matrix.GeneralLinearGroup.scalar (Fin n) x.2 *
            ((Matrix.GeneralLinearGroup.scalar (Fin n) y.2 * x.1) * y.1) := by group
        _ = Matrix.GeneralLinearGroup.scalar (Fin n) x.2 *
            ((x.1 * Matrix.GeneralLinearGroup.scalar (Fin n) y.2) * y.1) := by
              rw [Matrix.GeneralLinearGroup.scalar_commute y.2 x.1]
        _ = _ := by group
    · rfl

/-- The subgroup of pairs differing by a central scalar. -/
def scalarDiagonal (n : ℕ) : Subgroup (P n) := (scalarDiagonalMap n).range

/-- The product of the two native matrix exponentials, valued in GL × GL. -/
noncomputable def pairExp {n : ℕ} (X : Matrix (Fin n) (Fin n) ℂ × Matrix (Fin n) (Fin n) ℂ) : P n :=
  (TauCeti.expUnit X.1, TauCeti.expUnit X.2)

/-- The pairs of matrices whose entire real one-parameter subgroup lies in H. -/
def realDirections {n : ℕ} (H : Subgroup (P n)) : Set (Matrix (Fin n) (Fin n) ℂ × Matrix (Fin n) (Fin n) ℂ) :=
  {X | ∀ t : ℝ, pairExp (t • X) ∈ H}

/-- Every closed connected complex diagonal overgroup is one of the diagonal,
scalar-diagonal, determinant-equal, or full product groups. In rank at least two the
four are distinct; in rank one the determinant-equal group is the diagonal and the
scalar-diagonal group is the product, and in rank zero all four are trivial. -/
theorem connected_complex_overgroup (n : ℕ) (H : Subgroup (P n))
    (hd : diagonal n ≤ H) (hc : IsClosed (H : Set (P n)))
    (hconn : IsPreconnected (H : Set (P n)))
    (hcomplex : ∀ X ∈ realDirections H, ∀ z : ℂ, pairExp (z • X) ∈ H) :
    H = diagonal n ∨ H = scalarDiagonal n ∨ H = determinantEqual n ∨ H = ⊤ := by sorry

section Restriction
variable {V W : Type*} [AddCommGroup V] [Module ℂ V]
  [AddCommGroup W] [Module ℂ W]

/-- The external tensor product on GL × GL, with the two factors acting separately. -/
noncomputable def external {n : ℕ} (ρ : Representation ℂ (G n) V)
    (σ : Representation ℂ (G n) W) : Representation ℂ (P n) (V ⊗[ℂ] W) :=
  Representation.tprod (ρ.comp (MonoidHom.fst (G n) (G n)))
    (σ.comp (MonoidHom.snd (G n) (G n)))

/-- For a factor with scalar central character, restriction to the scalar-diagonal
subgroup and to the diagonal have the same subrepresentation lattice, on the same subspaces. -/
theorem scalarRestriction_exists_orderIso {n : ℕ}
    (ρ : Representation ℂ (G n) V) (σ : Representation ℂ (G n) W) (a : ℤ)
    (hρ : ∀ u : ℂˣ, ρ (Matrix.GeneralLinearGroup.scalar (Fin n) u) =
      ((u^a : ℂˣ) : ℂ) • (1 : Module.End ℂ V)) :
    ∃ e : Subrepresentation ((external ρ σ).comp (scalarDiagonal n).subtype) ≃o
        Subrepresentation (ρ.tprod σ),
      ∀ S, (e S).toSubmodule = S.toSubmodule := sorry

/-- Restriction of a finite-dimensional irreducible GL module to SL is irreducible:
scalar matrices act by scalars (Schur's lemma) and GL is generated by SL and the scalars.
No rationality is needed, so none is assumed. -/
theorem restrict_specialLinear_irreducible {n : ℕ} [FiniteDimensional ℂ V]
    (ρ : Representation ℂ (G n) V) [Representation.IsIrreducible ρ] :
    Representation.IsIrreducible (ρ.comp Matrix.SpecialLinearGroup.toGL) := by sorry

/-- The external tensor product of two finite-dimensional irreducible GL modules remains
irreducible on the subgroup of pairs with equal determinant, which contains SL × SL;
no rationality is needed, so none is assumed. -/
theorem external_determinantEqual_irreducible {n : ℕ} [FiniteDimensional ℂ V]
    [FiniteDimensional ℂ W] (ρ : Representation ℂ (G n) V)
    (σ : Representation ℂ (G n) W)
    [Representation.IsIrreducible ρ] [Representation.IsIrreducible σ] :
    Representation.IsIrreducible ((external ρ σ).comp (determinantEqual n).subtype) := by sorry

end Restriction
end DiagonalOvergroups

end TauCetiRoadmap.RepresentationTheory.ClassicalGroups
