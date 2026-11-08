import Mathlib

/-!
# Algebraic Gromov–Witten theory and quantum cohomology: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements below suggest Lean forms for a few public milestones so contributors and reviewers
converge on hypotheses, coefficient rings, and sign conventions. Completing these signatures does
not by itself complete any layer.

The required moduli-stack, numerical-Chow, Novikov, virtual-class, and continuous-connection types
do not exist at the repository pins. Placeholder `Prop`s would make the summit vacuous, so the
mathematical signatures remain comments until their owning layers provide genuine carriers.

```lean
-- def stableMapStack (g n : ℕ) (X : SmoothProjectiveVariety k)
--     (β : EffectiveNumericalCurveClass X) : DeligneMumfordStack k

-- noncomputable def stableMapVirtualClass
--     (g n : ℕ) (X : SmoothProjectiveVariety k)
--     (β : EffectiveNumericalCurveClass X) :
--   RationalChowGroup (stableMapStack g n X β)
--     ((1 - (g : ℤ)) * (dimension X - 3) + n + firstChernTangentPairing X β)

-- def psiClass (i : Fin n) :
--   RationalChowRing (stableMapStack g n X β)

-- noncomputable def descendantGW
--     (a : Fin n → ℕ) (γ : Fin n → NumericalChowRing X) : ℚ

-- theorem stringEquation :
--   descendantGW (insertZero a) (insert unit γ) =
--     ∑ i, descendantGW (decrementAt a i) γ

-- def novikovRing (X : SmoothProjectiveVariety k) : CompleteTopologicalCommRing
-- def smallQuantumProduct :
--   CompletedTensorProduct (NumericalChowRing X) (novikovRing X) →
--   CompletedTensorProduct (NumericalChowRing X) (novikovRing X) →
--   CompletedTensorProduct (NumericalChowRing X) (novikovRing X)
-- theorem smallQuantumProduct_assoc :
--   smallQuantumProduct (smallQuantumProduct a b) c =
--     smallQuantumProduct a (smallQuantumProduct b c)

-- def genusZeroPotential (X : SmoothProjectiveVariety k) : BigQuantumBase X
-- def bigQuantumProduct (t : BigQuantumBase X) :
--   QuantumStateSpace X →ₗ[BigQuantumBase X]
--     QuantumStateSpace X →ₗ[BigQuantumBase X] QuantumStateSpace X
-- theorem bigQuantumProduct_assoc :
--   bigQuantumProduct t (bigQuantumProduct t a b) c =
--     bigQuantumProduct t a (bigQuantumProduct t b c)

-- def bigQuantumConnection (X : SmoothProjectiveVariety k) :
--   Connection (BigQuantumBase X) (QuantumStateSpace X ⊗ LaurentSeries ℚ)
-- theorem bigQuantumConnection_flat :
--   (bigQuantumConnection X).Curvature = 0

-- def bigQuantumDModule (X : SmoothProjectiveVariety k) :
--   Module (QuantumReesDifferentialOperators X)
-- def smallQuantumConnection (D : NumericalDivisorClass X) :
--   ConnectionOperator (SmallQuantumStateSpace X)
-- theorem smallQuantumConnection_eq_divisorSlice : ...
```

The virtual dimension is dimension-graded, the state space is rational numerical Chow, and the
connection convention is `∇_a = ∂_a + z⁻¹(T_a ⋆_t -)`. The narrative roadmap fixes the unstable
conventions, all virtual gluing hypotheses, the mixed completion, and the coefficientwise proof of
flatness.
-/

namespace TauCetiRoadmap.GromovWittenTheory

-- No compiled targets yet; see the module docstring and README.md.

end TauCetiRoadmap.GromovWittenTheory
