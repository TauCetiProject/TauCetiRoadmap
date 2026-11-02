module

public import Mathlib
public import TauCeti.Topology.Circle.Degree

/-!
# Toeplitz operators: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, with real definitions on native carriers.
The headlines are the disk-boundary Hardy isometry and least-majorant norm, boundary
uniqueness, Brown–Halmos and symbol isometry, the Hankel product and compactness
theorems, scalar and matrix Fredholm/index theorems, Coburn's alternative, quotient
stability, stable-compression inverse convergence, and scalar/block two-limit stability.

The disk-boundary isometry and least-majorant norm lack the constructed analytic
Hardy-space carrier and its norm. The block Brown–Halmos, determinant-index and
block stability statements lack the constructed block multiplier/compression and
block finite-section algebra. The compatible-pair quotient representation and
bounded-product quotient stability lack the constructed closed finite-section
algebra, norm-null ideal and quotient C*-algebra. The essential-spectrum comparison
lacks the Calkin algebra and Hardy shift-algebra comparison. These constructions
and their full statements are README targets; no substitute predicates stand for them.
-/

public section

noncomputable section

namespace TauCetiRoadmap.ToeplitzOperators

open MeasureTheory Filter Topology
open scoped ENNReal InnerProductSpace

/-- Normalized Haar measure uses the positive period one. -/
instance circlePeriodPositive : Fact (0 < (1 : ℝ)) := ⟨zero_lt_one⟩

/-! ## Layer 1: Hardy space, multipliers and kernels -/

/-- Square-summable scalar sequences, with the Hilbert norm. -/
abbrev SequenceL2 := lp (fun _ : ℕ => ℂ) 2
/-- Square-integrable functions on the circle of period one and mass one. -/
abbrev CircleL2 := Lp ℂ 2 (AddCircle.haarAddCircle (T := 1))
/-- Essentially bounded scalar symbols, modulo almost-everywhere equality. -/
abbrev Symbol := Lp ℂ ∞ (AddCircle.haarAddCircle (T := 1))

/-- The closed span of the nonnegative Fourier monomials in circle L². -/
def hardySubspace : Submodule ℂ CircleL2 :=
  (Submodule.span ℂ (Set.range fun n : ℕ =>
    fourierBasis (T := 1) (n : ℤ))).topologicalClosure

/-- The boundary Hardy space is the native closed submodule. -/
abbrev HardySpace := hardySubspace

/-- The boundary Hardy space is complete because its defining span is closed. -/
instance hardyComplete : CompleteSpace HardySpace := by
  unfold HardySpace hardySubspace
  infer_instance

/-- The nonnegative Fourier monomial as an element of the Hardy submodule. -/
def hardyMonomial (n : ℕ) : HardySpace :=
  ⟨fourierBasis (T := 1) (n : ℤ),
    Submodule.le_topologicalClosure _ (Submodule.subset_span ⟨n, rfl⟩)⟩

/-- Multiplication by an L∞ symbol on native L², using the Hölder product. -/
def symbolMultiplier (a : Symbol) : CircleL2 →L[ℂ] CircleL2 :=
  ((ContinuousLinearMap.mul ℂ ℂ).holderL
    (AddCircle.haarAddCircle (T := 1)) ∞ 2 2) a

/-- Continuous functions determine their L∞ classes for normalized Haar measure. -/
def continuousSymbol (a : C(UnitAddCircle, ℂ)) : Symbol :=
  ContinuousMap.toLp ∞ (AddCircle.haarAddCircle (T := 1)) ℂ a

/-- A nonzero boundary Hardy function is nonzero almost everywhere. -/
theorem hardy_boundary_unique (x : HardySpace) (hx : x ≠ 0) :
    ∀ᵐ t ∂(AddCircle.haarAddCircle (T := 1)), (x : CircleL2) t ≠ 0 := by
  sorry

/-! ## Layer 2: bounded symbols and Toeplitz matrices -/

/-- Compression of multiplication to the actual Hardy submodule. -/
def toeplitz (a : Symbol) : HardySpace →L[ℂ] HardySpace :=
  hardySubspace.orthogonalProjectionOnto ∘L
    symbolMultiplier a ∘L hardySubspace.subtypeL

/-- Toeplitz matrix entries use Fourier coefficient i−j. -/
theorem toeplitz_matrix_coefficient (a : Symbol) (i j : ℕ) :
    ⟪hardyMonomial i, toeplitz a (hardyMonomial j)⟫_ℂ =
      fourierCoeff a ((i : ℤ) - (j : ℤ)) := by
  sorry

/-- The symbol map is isometric for the essential supremum norm. -/
theorem norm_toeplitz (a : Symbol) : ‖toeplitz a‖ = ‖a‖ := by
  sorry

/-- Brown–Halmos: shift-invariant matrices are precisely Toeplitz operators,
with a unique essentially bounded symbol. -/
theorem toeplitz_brownHalmos (T : HardySpace →L[ℂ] HardySpace) :
    let S := toeplitz (continuousSymbol (fourier (T := 1) 1))
    S.adjoint ∘L T ∘L S = T ↔ ∃! a : Symbol, toeplitz a = T := by
  sorry

/-- Hankel compression has the actual orthogonal complement as codomain. -/
def hankel (a : Symbol) : HardySpace →L[ℂ] hardySubspaceᗮ :=
  hardySubspaceᗮ.orthogonalProjectionOnto ∘L
    symbolMultiplier a ∘L hardySubspace.subtypeL

/-- The Toeplitz product defect is the negative Hankel product. -/
theorem toeplitz_hankel_product (a b : Symbol) :
    toeplitz a ∘L toeplitz b - toeplitz (a • b) =
      -((hankel (star a)).adjoint ∘L hankel b) := by
  sorry

/-- Continuous scalar symbols have compact Toeplitz product defects. -/
theorem toeplitz_semicommutator_compact (a b : C(UnitAddCircle, ℂ)) :
    IsCompactOperator (toeplitz (continuousSymbol a) ∘L toeplitz (continuousSymbol b) -
      toeplitz (continuousSymbol (a * b))) := by
  sorry

/-! ## Layer 3: the shift algebra and Fredholm symbols -/

/-- Normalization by the nonzero modulus gives a point of the unit circle. -/
def normalizedSymbolPoint (a : C(UnitAddCircle, ℂ)) (ha : ∀ x, a x ≠ 0)
    (x : UnitAddCircle) : _root_.Circle :=
  ⟨a x / (‖a x‖ : ℂ), by
    change a x / (‖a x‖ : ℂ) ∈ Metric.sphere (0 : ℂ) 1
    rw [Metric.mem_sphere, dist_zero_right]
    simpa only [norm_div, Complex.norm_real, norm_norm] using
      (div_self (norm_ne_zero_iff.mpr (ha x)))⟩

/-- The normalized symbol traversed along the positive period-one coordinate. -/
def symbolLoop (a : C(UnitAddCircle, ℂ)) (ha : ∀ x, a x ≠ 0) :
    Path (normalizedSymbolPoint a ha 0) (normalizedSymbolPoint a ha 0) where
  toFun t := normalizedSymbolPoint a ha ((t : ℝ) : UnitAddCircle)
  continuous_toFun := by
    apply Continuous.subtype_mk
    exact (a.continuous.comp (AddCircle.continuous_mk' 1 |>.comp continuous_subtype_val)).div
      (Complex.continuous_ofReal.comp
        (a.continuous.comp (AddCircle.continuous_mk' 1 |>.comp continuous_subtype_val)).norm)
      (fun t => Complex.ofReal_ne_zero.mpr (norm_ne_zero_iff.mpr (ha _)))
  source' := by simp
  target' := by
    change normalizedSymbolPoint a ha ((1 : ℝ) : UnitAddCircle) = _
    rw [show ((1 : ℝ) : UnitAddCircle) = 0 from (AddCircle.coe_eq_zero_iff (1 : ℝ)).mpr ⟨1, by simp⟩]

/-- The counterclockwise winding number of a nowhere-zero continuous symbol. -/
def symbolWinding (a : C(UnitAddCircle, ℂ)) (ha : ∀ x, a x ≠ 0) : ℤ :=
  _root_.Circle.degree (symbolLoop a ha)

/-- A continuous scalar symbol gives a Fredholm operator exactly when nowhere zero. -/
theorem toeplitz_fredholm_iff (a : C(UnitAddCircle, ℂ)) :
    (toeplitz (continuousSymbol a)).IsFredholm ↔ ∀ x, a x ≠ 0 := by
  sorry

/-- The index is negative winding; the forward shift has index −1. -/
theorem toeplitz_index (a : C(UnitAddCircle, ℂ)) (ha : ∀ x, a x ≠ 0) :
    LinearMap.index (toeplitz (continuousSymbol a)).toLinearMap =
      -symbolWinding a ha := by
  sorry

/-- Coburn's alternative holds for every nonzero L∞ scalar symbol. -/
theorem toeplitz_coburn (a : Symbol) (ha : a ≠ 0) :
    LinearMap.ker (toeplitz a).toLinearMap = ⊥ ∨
      LinearMap.ker (toeplitz a).adjoint.toLinearMap = ⊥ := by
  sorry

/-- Continuous scalar Toeplitz invertibility is nonvanishing with zero winding. -/
theorem toeplitz_isUnit_iff (a : C(UnitAddCircle, ℂ)) :
    IsUnit (toeplitz (continuousSymbol a)) ↔
      ∃ ha : ∀ x, a x ≠ 0, symbolWinding a ha = 0 := by
  sorry

/-! ## Layer 4: bounded products and stability -/

/-- The finite corner has n+1 coordinates and its Euclidean operator norm. -/
abbrev FiniteOperator (n : ℕ) :=
  EuclideanSpace ℂ (Fin (n + 1)) →L[ℂ] EuclideanSpace ℂ (Fin (n + 1))

/-- Stability means eventual invertibility with a common inverse-norm bound. -/
def StableSections {F : ℕ → Type*} [∀ n, NormedRing (F n)]
    (A : (n : ℕ) → F n) : Prop :=
  ∃ n₀ : ℕ, ∃ C : ℝ, 0 ≤ C ∧
    ∀ n ≥ n₀, IsUnit (A n) ∧ ‖Ring.inverse (A n)‖ ≤ C

/-- Restriction to the first n+1 coordinates with no rescaling. -/
def coordinateCutoff (n : ℕ) : SequenceL2 →L[ℂ] EuclideanSpace ℂ (Fin (n + 1)) :=
  (PiLp.continuousLinearEquiv 2 ℂ (fun _ : Fin (n + 1) => ℂ)).symm.toContinuousLinearMap ∘L
    ContinuousLinearMap.pi (fun i : Fin (n + 1) => lp.evalCLM ℂ (fun _ : ℕ => ℂ) 2 i)

/-- Compression by the coordinate restriction and its adjoint inclusion. -/
def finiteSection (T : SequenceL2 →L[ℂ] SequenceL2) (n : ℕ) : FiniteOperator n :=
  coordinateCutoff n ∘L T ∘L (coordinateCutoff n).adjoint

/-- Orthogonal projection onto the first n+1 sequence coordinates. -/
def coordinateProjection (n : ℕ) : SequenceL2 →L[ℂ] SequenceL2 :=
  (coordinateCutoff n).adjoint ∘L coordinateCutoff n

/-- Zero extension of the totalized finite inverse, an inverse only on the stable tail. -/
def finiteInverseExtension (T : SequenceL2 →L[ℂ] SequenceL2) (n : ℕ) :
    SequenceL2 →L[ℂ] SequenceL2 :=
  (coordinateCutoff n).adjoint ∘L Ring.inverse (finiteSection T n) ∘L coordinateCutoff n

/-- Stable square sections force invertibility and strong convergence of the
extended inverses and their adjoints. -/
theorem finiteSections_inverse_convergence (T : SequenceL2 →L[ℂ] SequenceL2)
    (hStable : StableSections (finiteSection T)) :
    IsUnit T ∧
      (∀ x : SequenceL2,
        Tendsto (fun n => finiteInverseExtension T n x) atTop (𝓝 (Ring.inverse T x))) ∧
      (∀ x : SequenceL2,
        Tendsto (fun n => (finiteInverseExtension T n).adjoint x) atTop
          (𝓝 ((Ring.inverse T).adjoint x))) := by
  sorry

/-- Any positive eventual bound on finite inverse norms bounds the ambient inverse. -/
theorem finiteSections_inverse_norm_le (T : SequenceL2 →L[ℂ] SequenceL2)
    (N : ℕ) (C : ℝ) (hC : 0 < C)
    (hTail : ∀ n ≥ N,
      IsUnit (finiteSection T n) ∧ ‖Ring.inverse (finiteSection T n)‖ ≤ C) :
    IsUnit T ∧ ‖Ring.inverse T‖ ≤ C := by
  sorry

/-- The exact solution's projection tail controls the finite-section solution error. -/
theorem finiteSections_solution_error (T : SequenceL2 →L[ℂ] SequenceL2)
    (N : ℕ) (C : ℝ) (hC : 0 < C)
    (hTail : ∀ n ≥ N,
      IsUnit (finiteSection T n) ∧ ‖Ring.inverse (finiteSection T n)‖ ≤ C)
    (b : SequenceL2) (n : ℕ) (hn : N ≤ n) :
    ‖finiteInverseExtension T n b - Ring.inverse T b‖ ≤
      (1 + C * ‖T‖) *
        ‖Ring.inverse T b - coordinateProjection n (Ring.inverse T b)‖ := by
  sorry

/-! ## Layer 5: continuous Toeplitz finite sections -/

/-- The first n+1 Hardy Fourier coefficients, in Euclidean coordinates. -/
def hardyCutoff (n : ℕ) : HardySpace →L[ℂ] EuclideanSpace ℂ (Fin (n + 1)) :=
  (PiLp.continuousLinearEquiv 2 ℂ (fun _ : Fin (n + 1) => ℂ)).symm.toContinuousLinearMap ∘L
    ContinuousLinearMap.pi (fun i : Fin (n + 1) => innerSL ℂ (hardyMonomial i))

/-- The finite Toeplitz matrix formed by Hardy coefficient compression. -/
def toeplitzSection (a : Symbol) (n : ℕ) : FiniteOperator n :=
  hardyCutoff n ∘L toeplitz a ∘L (hardyCutoff n).adjoint

/-- Pure continuous scalar Toeplitz sections are stable exactly when T_a is invertible. -/
theorem continuousToeplitzSections_stable (a : C(UnitAddCircle, ℂ)) :
    StableSections (toeplitzSection (continuousSymbol a)) ↔
      IsUnit (toeplitz (continuousSymbol a)) := by
  sorry

end TauCetiRoadmap.ToeplitzOperators
