import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.Analysis.Normed.Algebra.MatrixExponential
import Mathlib.Combinatorics.SimpleGraph.AdjMatrix

/-!
# Finite spectral graph dynamics: suggested target signatures

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive. These probes
pin the evolution sign, amplitude orientation and projector-based definition of strong
cospectrality. They are not a claim that the surrounding theory is already implemented.
-/

open scoped Matrix

namespace TauCetiRoadmap.SpectralQuantumWalks

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The pinned continuous-time evolution `exp(-i t A)`. -/
noncomputable def unitaryEvolution (A : Matrix V V ℂ) (t : ℝ) : Matrix V V ℂ :=
  NormedSpace.exp (-(Complex.I * (t : ℂ)) • A)

/-- Amplitude from column state `u` to row state `v`. -/
noncomputable def amplitude (A : Matrix V V ℂ) (t : ℝ) (u v : V) : ℂ :=
  unitaryEvolution A t v u

/-- Perfect state transfer at the specified time. -/
def HasPSTAt (A : Matrix V V ℂ) (u v : V) (t : ℝ) : Prop :=
  ‖amplitude A t u v‖ = 1

/-- The spectral projector of a Hermitian matrix at a real eigenvalue. -/
noncomputable def spectralProjector (A : Matrix V V ℂ) (_hA : A.IsHermitian)
    (lam : ℝ) : Matrix V V ℂ := sorry

/-- Strong cospectrality is a sign relation on every real spectral projector. -/
def StronglyCospectral (A : Matrix V V ℂ) (hA : A.IsHermitian) (u v : V) : Prop :=
  ∀ lam : ℝ, ∃ eps : ℂ, (eps = 1 ∨ eps = -1) ∧
    ∀ x, spectralProjector A hA lam x u = eps * spectralProjector A hA lam x v

/-- Hermitian generators produce unitary evolution. -/
theorem unitaryEvolution_unitary {A : Matrix V V ℂ} (hA : A.IsHermitian) (t : ℝ) :
    (unitaryEvolution A t)ᴴ * unitaryEvolution A t = 1 := sorry

/-- Unit transition amplitude is equivalent to transfer of the whole basis state up to phase. -/
theorem hasPSTAt_iff_exists_phase {A : Matrix V V ℂ} (hA : A.IsHermitian)
    (u v : V) (t : ℝ) :
    HasPSTAt A u v t ↔
      ∃ gamma : ℂ, ‖gamma‖ = 1 ∧
        (unitaryEvolution A t).mulVec (Pi.single u 1) = gamma • Pi.single v 1 := sorry

/-- Perfect state transfer forces the projector sign relations. -/
theorem stronglyCospectral_of_hasPSTAt {A : Matrix V V ℂ} (hA : A.IsHermitian)
    {u v : V} {t : ℝ} (h : HasPSTAt A u v t) : StronglyCospectral A hA u v := sorry

end TauCetiRoadmap.SpectralQuantumWalks
