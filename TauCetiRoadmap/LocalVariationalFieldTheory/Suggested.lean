import Mathlib
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Real.ThreeOne

/-!
# Local variational field theory: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The finite Dirac Clifford/Spin comparison
and covariance below use native Clifford algebras, Spin, SL₂ and matrices.

The other headlines are not statable at the pins:
* Layer 1: general nonlinear bundle jets and their locally finite-order bicomplex
  require the nonlinear jet carrier, contact forms and sheaf differential operators.
  Real/complex polynomial-jet compatibility requires that same jet algebra.
* Layer 2: all-order first variation, interior Euler projection, global Lepage
  existence and variational cohomology require the jet-density, source-form and
  Lepage carriers and the orientation-twisted variational complex.
* Layer 3: the differential-redefinition Euler chain rule requires jet substitution,
  its linearization and the jet-coefficient density transpose. The intrinsic graded
  Cauchy bracket and constraint comparisons require admissible phase functionals,
  their support/boundary domains and the graded spatial-jet interfaces.
* Layer 4: Noether I and improvement require prolonged characteristics, Euler source
  forms and horizontal currents.
* Layer 5: the joint-parameter Noether II equivalence requires joint jets and current
  operators. Regular equation coordinates, stationary identity presentations and
  Koszul–Tate exactness (including dimensions zero and one) require smooth equation-jet
  complexes and their locally finite-order sheaves, beyond exterior/symmetric algebras.
* Layer 6: global real Dirac variation and Hilbert/Belinfante comparison require the
  Lorentzian spinor bundle, fixed-carrier metric/coframe variations and density adapters.

The scalar and oscillator calculations are README Checks. Native real descent is
an imported supplier, not a new acceptance theorem.
-/

noncomputable section

namespace TauCetiRoadmap.LocalVariationalFieldTheory

/-! ## Layer 3: finite Dirac Clifford and Spin comparison -/

/-- The time-first physical coordinates sent to the native time-last coordinates:
`Q(P x) = -(x₀²-x₁²-x₂²-x₃²)`. -/
def timeFirstToNative (x : Fin 4 → ℝ) : Fin 4 → ℝ :=
  ![x 3, -x 2, x 1, x 0]

/-- Physical vector Clifford multiplication in Weyl coordinates, evaluated at a
native vector `v = P x`. The upper block is the native Hermitian matrix of `v`;
the lower block is its adjugate. Its square is `-Q(v)` times the identity. -/
def diracVector (v : Fin 4 → ℝ) :
    Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℂ :=
  let X : Matrix (Fin 2) (Fin 2) ℂ :=
    (TauCeti.realCliffordThreeOneVectorEquivHermitian v : Matrix (Fin 2) (Fin 2) ℂ)
  Matrix.fromBlocks 0 X (Matrix.adjugate X) 0

/-- The Weyl Spin action is `diag(A,(A†)⁻¹)` through the native Spin–SL₂ equivalence.
Determinant one makes the lower block the conjugate transpose of `adj(A)`. -/
def diracWeyl (s : spinGroup (TauCeti.realCliffordForm 3 1)) :
    Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℂ :=
  let A : Matrix (Fin 2) (Fin 2) ℂ :=
    (TauCeti.realSpinThreeOneEquivSpecialLinear s : Matrix (Fin 2) (Fin 2) ℂ)
  Matrix.fromBlocks A 0 0 (Matrix.conjTranspose (Matrix.adjugate A))

/-- The real Clifford representation with vector action `-i C` restricts to the
specified Weyl action through the actual native even-Clifford equivalence. -/
theorem diracClifford_spin_comparison :
    ∃ c : CliffordAlgebra (TauCeti.realCliffordForm 3 1) →ₐ[ℝ]
        Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℂ,
      (∀ v : Fin 4 → ℝ,
        c (CliffordAlgebra.ι (TauCeti.realCliffordForm 3 1) v) =
          (-Complex.I) • diracVector v) ∧
      (∀ s : spinGroup (TauCeti.realCliffordForm 3 1),
        c (s : CliffordAlgebra (TauCeti.realCliffordForm 3 1)) = diracWeyl s) := by
  sorry

/-- Physical Clifford multiplication is Spin-equivariant; the Weyl action preserves
the indefinite Hermitian Dirac pairing `H₀ = C(P e₀)`. -/
theorem dirac_covariance_and_pairing
    (s : spinGroup (TauCeti.realCliffordForm 3 1)) (x : Fin 4 → ℝ) :
    diracVector (s • timeFirstToNative x) * diracWeyl s =
        diracWeyl s * diracVector (timeFirstToNative x) ∧
      Matrix.conjTranspose (diracWeyl s) *
          diracVector (timeFirstToNative (Pi.single 0 1)) * diracWeyl s =
        diracVector (timeFirstToNative (Pi.single 0 1)) := by
  sorry

end TauCetiRoadmap.LocalVariationalFieldTheory
